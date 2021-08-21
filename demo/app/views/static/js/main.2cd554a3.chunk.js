(this["webpackJsonpreact-crud"]=this["webpackJsonpreact-crud"]||[]).push([[0],{34:function(e,t,a){e.exports=a(63)},40:function(e,t,a){},63:function(e,t,a){"use strict";a.r(t);var n=a(0),l=a.n(n),i=a(30),r=a.n(i),c=a(12),o=a(6),u=a(7),s=a(10),d=a(9),m=a(11),h=a(13),b=(a(39),a(40),a(1)),p=a(31),v=a.n(p).a.create({baseURL:"https://johanyepes.devopschallenge.link/api",headers:{"Content-type":"application/json"}}),g=new(function(){function e(){Object(o.a)(this,e)}return Object(u.a)(e,[{key:"getAll",value:function(){return v.get("/tutorials")}},{key:"get",value:function(e){return v.get("/tutorials/".concat(e))}},{key:"create",value:function(e){return v.post("/tutorials",e)}},{key:"update",value:function(e,t){return v.put("/tutorials/".concat(e),t)}},{key:"delete",value:function(e){return v.delete("/tutorials/".concat(e))}},{key:"deleteAll",value:function(){return v.delete("/tutorials")}},{key:"findByTitle",value:function(e){return v.get("/tutorials?title=".concat(e))}}]),e}()),f=function(e){function t(e){var a;return Object(o.a)(this,t),(a=Object(s.a)(this,Object(d.a)(t).call(this,e))).onChangeTitle=a.onChangeTitle.bind(Object(b.a)(a)),a.onChangeDescription=a.onChangeDescription.bind(Object(b.a)(a)),a.saveTutorial=a.saveTutorial.bind(Object(b.a)(a)),a.newTutorial=a.newTutorial.bind(Object(b.a)(a)),a.state={id:null,title:"",description:"",published:!1,submitted:!1},a}return Object(m.a)(t,e),Object(u.a)(t,[{key:"onChangeTitle",value:function(e){this.setState({title:e.target.value})}},{key:"onChangeDescription",value:function(e){this.setState({description:e.target.value})}},{key:"saveTutorial",value:function(){var e=this,t={title:this.state.title,description:this.state.description};g.create(t).then((function(t){e.setState({id:t.data.id,title:t.data.title,description:t.data.description,published:t.data.published,submitted:!0}),console.log(t.data)})).catch((function(e){console.log(e)}))}},{key:"newTutorial",value:function(){this.setState({id:null,title:"",description:"",published:!1,submitted:!1})}},{key:"render",value:function(){return l.a.createElement("div",{className:"submit-form"},this.state.submitted?l.a.createElement("div",null,l.a.createElement("h4",null,"You submitted successfully!"),l.a.createElement("button",{className:"btn btn-success",onClick:this.newTutorial},"Add")):l.a.createElement("div",null,l.a.createElement("div",{className:"form-group"},l.a.createElement("label",{htmlFor:"title"},"Title"),l.a.createElement("input",{type:"text",className:"form-control",id:"title",required:!0,value:this.state.title,onChange:this.onChangeTitle,name:"title"})),l.a.createElement("div",{className:"form-group"},l.a.createElement("label",{htmlFor:"description"},"Description"),l.a.createElement("input",{type:"text",className:"form-control",id:"description",required:!0,value:this.state.description,onChange:this.onChangeDescription,name:"description"})),l.a.createElement("button",{onClick:this.saveTutorial,className:"btn btn-success"},"Submit")))}}]),t}(n.Component),T=a(16),E=function(e){function t(e){var a;return Object(o.a)(this,t),(a=Object(s.a)(this,Object(d.a)(t).call(this,e))).onChangeTitle=a.onChangeTitle.bind(Object(b.a)(a)),a.onChangeDescription=a.onChangeDescription.bind(Object(b.a)(a)),a.getTutorial=a.getTutorial.bind(Object(b.a)(a)),a.updatePublished=a.updatePublished.bind(Object(b.a)(a)),a.updateTutorial=a.updateTutorial.bind(Object(b.a)(a)),a.deleteTutorial=a.deleteTutorial.bind(Object(b.a)(a)),a.state={currentTutorial:{id:null,title:"",description:"",published:!1},message:""},a}return Object(m.a)(t,e),Object(u.a)(t,[{key:"componentDidMount",value:function(){this.getTutorial(this.props.match.params.id)}},{key:"onChangeTitle",value:function(e){var t=e.target.value;this.setState((function(e){return{currentTutorial:Object(T.a)({},e.currentTutorial,{title:t})}}))}},{key:"onChangeDescription",value:function(e){var t=e.target.value;this.setState((function(e){return{currentTutorial:Object(T.a)({},e.currentTutorial,{description:t})}}))}},{key:"getTutorial",value:function(e){var t=this;g.get(e).then((function(e){t.setState({currentTutorial:e.data}),console.log(e.data)})).catch((function(e){console.log(e)}))}},{key:"updatePublished",value:function(e){var t=this,a={id:this.state.currentTutorial.id,title:this.state.currentTutorial.title,description:this.state.currentTutorial.description,published:e};g.update(this.state.currentTutorial.id,a).then((function(a){t.setState((function(t){return{currentTutorial:Object(T.a)({},t.currentTutorial,{published:e})}})),console.log(a.data)})).catch((function(e){console.log(e)}))}},{key:"updateTutorial",value:function(){var e=this;g.update(this.state.currentTutorial.id,this.state.currentTutorial).then((function(t){console.log(t.data),e.setState({message:"The tutorial was updated successfully!"})})).catch((function(e){console.log(e)}))}},{key:"deleteTutorial",value:function(){var e=this;g.delete(this.state.currentTutorial.id).then((function(t){console.log(t.data),e.props.history.push("/tutorials")})).catch((function(e){console.log(e)}))}},{key:"render",value:function(){var e=this,t=this.state.currentTutorial;return l.a.createElement("div",null,t?l.a.createElement("div",{className:"edit-form"},l.a.createElement("h4",null,"Tutorial"),l.a.createElement("form",null,l.a.createElement("div",{className:"form-group"},l.a.createElement("label",{htmlFor:"title"},"Title"),l.a.createElement("input",{type:"text",className:"form-control",id:"title",value:t.title,onChange:this.onChangeTitle})),l.a.createElement("div",{className:"form-group"},l.a.createElement("label",{htmlFor:"description"},"Description"),l.a.createElement("input",{type:"text",className:"form-control",id:"description",value:t.description,onChange:this.onChangeDescription})),l.a.createElement("div",{className:"form-group"},l.a.createElement("label",null,l.a.createElement("strong",null,"Status:")),t.published?"Published":"Pending")),t.published?l.a.createElement("button",{className:"badge badge-primary mr-2",onClick:function(){return e.updatePublished(!1)}},"UnPublish"):l.a.createElement("button",{className:"badge badge-primary mr-2",onClick:function(){return e.updatePublished(!0)}},"Publish"),l.a.createElement("button",{className:"badge badge-danger mr-2",onClick:this.deleteTutorial},"Delete"),l.a.createElement("button",{type:"submit",className:"badge badge-success",onClick:this.updateTutorial},"Update"),l.a.createElement("p",null,this.state.message)):l.a.createElement("div",null,l.a.createElement("br",null),l.a.createElement("p",null,"Please click on a Tutorial...")))}}]),t}(n.Component),y=function(e){function t(e){var a;return Object(o.a)(this,t),(a=Object(s.a)(this,Object(d.a)(t).call(this,e))).onChangeSearchTitle=a.onChangeSearchTitle.bind(Object(b.a)(a)),a.retrieveTutorials=a.retrieveTutorials.bind(Object(b.a)(a)),a.refreshList=a.refreshList.bind(Object(b.a)(a)),a.setActiveTutorial=a.setActiveTutorial.bind(Object(b.a)(a)),a.removeAllTutorials=a.removeAllTutorials.bind(Object(b.a)(a)),a.searchTitle=a.searchTitle.bind(Object(b.a)(a)),a.state={tutorials:[],currentTutorial:null,currentIndex:-1,searchTitle:""},a}return Object(m.a)(t,e),Object(u.a)(t,[{key:"componentDidMount",value:function(){this.retrieveTutorials()}},{key:"onChangeSearchTitle",value:function(e){var t=e.target.value;this.setState({searchTitle:t})}},{key:"retrieveTutorials",value:function(){var e=this;g.getAll().then((function(t){e.setState({tutorials:t.data}),console.log(t.data)})).catch((function(e){console.log(e)}))}},{key:"refreshList",value:function(){this.retrieveTutorials(),this.setState({currentTutorial:null,currentIndex:-1})}},{key:"setActiveTutorial",value:function(e,t){this.setState({currentTutorial:e,currentIndex:t})}},{key:"removeAllTutorials",value:function(){var e=this;g.deleteAll().then((function(t){console.log(t.data),e.refreshList()})).catch((function(e){console.log(e)}))}},{key:"searchTitle",value:function(){var e=this;g.findByTitle(this.state.searchTitle).then((function(t){e.setState({tutorials:t.data}),console.log(t.data)})).catch((function(e){console.log(e)}))}},{key:"render",value:function(){var e=this,t=this.state,a=t.searchTitle,n=t.tutorials,i=t.currentTutorial,r=t.currentIndex;return l.a.createElement("div",{className:"list row"},l.a.createElement("div",{className:"col-md-8"},l.a.createElement("div",{className:"input-group mb-3"},l.a.createElement("input",{type:"text",className:"form-control",placeholder:"Search by title",value:a,onChange:this.onChangeSearchTitle}),l.a.createElement("div",{className:"input-group-append"},l.a.createElement("button",{className:"btn btn-outline-secondary",type:"button",onClick:this.searchTitle},"Search")))),l.a.createElement("div",{className:"col-md-6"},l.a.createElement("h4",null,"Tutorials List"),l.a.createElement("ul",{className:"list-group"},n&&n.map((function(t,a){return l.a.createElement("li",{className:"list-group-item "+(a===r?"active":""),onClick:function(){return e.setActiveTutorial(t,a)},key:a},t.title)}))),l.a.createElement("button",{className:"m-3 btn btn-sm btn-danger",onClick:this.removeAllTutorials},"Remove All")),l.a.createElement("div",{className:"col-md-6"},i?l.a.createElement("div",null,l.a.createElement("h4",null,"Tutorial"),l.a.createElement("div",null,l.a.createElement("label",null,l.a.createElement("strong",null,"Title:"))," ",i.title),l.a.createElement("div",null,l.a.createElement("label",null,l.a.createElement("strong",null,"Description:"))," ",i.description),l.a.createElement("div",null,l.a.createElement("label",null,l.a.createElement("strong",null,"Status:"))," ",i.published?"Published":"Pending"),l.a.createElement(c.b,{to:"/tutorials/"+i.id,className:"badge badge-warning"},"Edit")):l.a.createElement("div",null,l.a.createElement("br",null),l.a.createElement("p",null,"Please click on a Tutorial..."))))}}]),t}(n.Component),k=function(e){function t(){return Object(o.a)(this,t),Object(s.a)(this,Object(d.a)(t).apply(this,arguments))}return Object(m.a)(t,e),Object(u.a)(t,[{key:"render",value:function(){return l.a.createElement("div",null,l.a.createElement("nav",{className:"navbar navbar-expand navbar-dark bg-dark"},l.a.createElement(c.b,{to:"/tutorials",className:"navbar-brand"},"bezKoder"),l.a.createElement("div",{className:"navbar-nav mr-auto"},l.a.createElement("li",{className:"nav-item"},l.a.createElement(c.b,{to:"/tutorials",className:"nav-link"},"Tutorials")),l.a.createElement("li",{className:"nav-item"},l.a.createElement(c.b,{to:"/add",className:"nav-link"},"Add")))),l.a.createElement("div",{className:"container mt-3"},l.a.createElement(h.c,null,l.a.createElement(h.a,{exact:!0,path:["/","/tutorials"],component:y}),l.a.createElement(h.a,{exact:!0,path:"/add",component:f}),l.a.createElement(h.a,{path:"/tutorials/:id",component:E}))))}}]),t}(n.Component);Boolean("localhost"===window.location.hostname||"[::1]"===window.location.hostname||window.location.hostname.match(/^127(?:\.(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)){3}$/));r.a.render(l.a.createElement(c.a,null,l.a.createElement(k,null)),document.getElementById("root")),"serviceWorker"in navigator&&navigator.serviceWorker.ready.then((function(e){e.unregister()})).catch((function(e){console.error(e.message)}))}},[[34,1,2]]]);
//# sourceMappingURL=main.2cd554a3.chunk.js.map