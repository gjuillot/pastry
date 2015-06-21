/*
 * Name: Reservation
 * Written by: Duongancol
 * Version: 1.0 base on 
 * Crivos
*/

var Reservation = {

	initialized: false,

	initialize: function() {

		if (this.initialized) return;
		this.initialized = true;

		this.build();
		this.events();

	},

	build: function() {

		this.validations();

	},

	events: function() {

		

	},

	validations: function() {

		$("#reserForm").validate({
			submitHandler: function(form) {
				$.ajax({
					type: "POST",
					url: "php/reservation-form.php",
					data: {
						"name": $("#reserForm #name").val(),
						"email": $("#reserForm #email").val(),
						"phone": $("#reserForm #phone").val(),
						"date": $("#reserForm #date").val(),
						"time": $("#reserForm #time").val(),
						"number_person": $("#reserForm #number_person").val(),
						"message": $("#reserForm #message").val()
					},
					dataType: "json",
					success: function (data) {
						if (data.response == "success") {

							$("#contactSuccess").removeClass("hidden");
							$("#contactError").addClass("hidden");

							$("#reserForm #name, #reserForm #email, #reserForm #phone, #reserForm #date, #reserForm #time, #reserForm #number_person, #reserForm #message")
								.val("")
								.blur()
								.closest(".control-group")
								.removeClass("success")
								.removeClass("error");

							if(($("#contactSuccess").position().top - 80) < $(window).scrollTop()){
								$("html, body").animate({
									 scrollTop: $("#contactSuccess").offset().top - 80
								}, 300);								
							}
							
						} else {

							$("#contactError").removeClass("hidden");
							$("#contactSuccess").addClass("hidden");

							if(($("#contactError").position().top - 80) < $(window).scrollTop()){
								$("html, body").animate({
									 scrollTop: $("#contactError").offset().top - 80
								}, 300);								
							}

						}
					}

				});
			},
			rules: {
				name: {
					required: true
				},
				email: {
					required: true,
					email: true
				},
				message: {
					required: true
				}
			},
			highlight: function (element) {
				$(element)
					.closest(".control-group")
					.removeClass("success")
					.addClass("errorz");
			},
			success: function (element) {
				$(element)
					.closest(".control-group")
					.removeClass("error")
					.addClass("success");
			}
		});

	}

};

Reservation.initialize();