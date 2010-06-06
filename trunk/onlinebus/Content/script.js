function initCorners() {
   var stHeader = {
      tl: { radius: 5 },
      tr: { radius: 5 },
      bl: { radius: 5 },
      br: { radius: 5 },
      antiAlias: true
  }
  curvyCorners(stHeader, "#banner");
  var stBody = {
      tl: { radius: 8 },
      tr: { radius: 8 },
      bl: { radius: 8 },
      br: { radius: 8 },
      antiAlias: true
  }
  curvyCorners(stBody, "#body");
  var idMain = document.getElementById("MainResult");
  var idHead = document.getElementById("TopHeaderResult");
  var idBody = document.getElementById("BodyResult");
  if(idMain != null || idHead != null || idBody != null){
      curvyCorners(stBody, "#TopHeaderResult");
      curvyCorners(stBody, "#BodyResult");
      curvyCorners(stBody, "#MainResult");
  } 
}