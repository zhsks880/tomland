package com.spring.TomLand.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EmailVO {
	private String name;
	private String email;
	private String subject;
	private String message;
}
