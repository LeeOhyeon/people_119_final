package com.pp.boot.company.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Attachment {
	
	private Company companyId;

	private String originalFilename;
	private String renamedFilename;
	
}
