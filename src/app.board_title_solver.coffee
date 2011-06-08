app.board_title_solver = {}

(->
  dic_bbsmenu = {}

  update_dic_bbsmenu = ->
    app.bbsmenu.get (result) ->
      if "data" of result
        for category in result.data
          for board in category.board
            dic_bbsmenu[board.url] = board.title
        null

  $(-> update_dic_bbsmenu())

  # #app.board\_title\_solver.ask
  # 板のURLから板のタイトルを取得する  
  # callbackにはタイトル(string)かnullが渡される
  app.board_title_solver.ask = (url, callback) ->
    if url of dic_bbsmenu
      callback(dic_bbsmenu[url])
    else
      callback(null)
)()