Return-Path: <linux-i2c+bounces-11682-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D28F5AEC86B
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Jun 2025 17:58:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACFB6189E23F
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Jun 2025 15:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E297821C9E1;
	Sat, 28 Jun 2025 15:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="nvrNKrtL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazolkn19012062.outbound.protection.outlook.com [52.103.66.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AD3207A0B;
	Sat, 28 Jun 2025 15:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.66.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751126295; cv=fail; b=tm66iZWWD0C3pqCO8bHjA6tPpcpQCVCnPXKTQdq00pwE4esIj21eH5gCm25sy9crWCnPp893eaR4KsWhJp8drmATDPGLmXvrNk3qfGJOa2bjOpnE2nKR+5rLV18t8jKUUD8dYXiEPHd2og46sOZUBXKpIkrgkm6wZnYkF3J90Oo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751126295; c=relaxed/simple;
	bh=9ojJVXgXwXX13yiwkJ0wFpqVLzzNL0hxA4V0v5LF1LA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kboEwjNREHsx4myYlZl0z1tZIR/qzp2FpLqKx9Aa8p+l57BRiE+h09ltc5bh6X3GpB3onEXeBO83XMJnXchpCCLvR1E16J7P3Ho3JGkINQii7HjeCFXu0PcA0RG8TooHu1iPyub5RCpfyZVQDXOBNdbTb7Yuz5M8563LNUDsixo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=nvrNKrtL; arc=fail smtp.client-ip=52.103.66.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nrV9PxH2rkScmvxPE1uoLWLRZet+Ki9MEljopoxb6fcXtmib2CXPS+hUksz9S6zh5txVaPtD0TkE65spiSCPdi5qsQfOF73JDWxFXQl7NgHkGQgrcN7zG3KXdwz3VGYNu133kaQtYvPNNKVqMyAcKZvexy6+HlKxrNDF3gXTDhG1YZ5hEyMRFQ/dTKakkDu7CFn2DutI0IQaFMzae8ayAQ72dEs027zNCeD9ssACBkqJOUmGcav1QWtYB4ifJsNbPcMHhnRd9v3RFC3Ze2Jubg9ipTELS5zU+TC1OvTLWTVMVh/ccnQxjTyRIV7Gxm527C5uf6BW1+WXNaQZ2fHkgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZR98UxKGB3eT9lq7tLbz3RXXVQ4x4yy1e4H8ilnSbKY=;
 b=nPf7T/9XnTPl0BFEnZ0T55Je7HRt3Xpd2aMgGhc79jckqg0h9wM/gRnb61FLKVdwdVoQoH431dL5hqdbM3XUVgpCplhp+dKsOxHuhKhwtA4vmjnpAWdABVZFZmKIk9Eotb1VwpDR9Bp/eDm3nQXVSoSXMQUpQVSpUL1S089NgnAiJmDez0z2anMyN41SlLlEL1KvnHYVLxRF1QyUItYd8unJdj9u6GsP9Gvs0gNQwVK0WNRAZfkeOPuRJqS9JKf10plo9b+13fkEsXjmYD/jC5ulm+CNYFdJNoFADfztjq7NL5rjCaQ4SG4A9Ny5QpQEXPn4E+PXzLkIMT+HLa61ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZR98UxKGB3eT9lq7tLbz3RXXVQ4x4yy1e4H8ilnSbKY=;
 b=nvrNKrtLUH6BgbiSdfjKE3q3Rfet7NRcC7PI94Tq75Jc2U4Zu2mODDm2UUeQltxFtm9aQTL35aJ34aRdpC0u8GPJpPbyvAZ4GUXb4+uIBmH3aidhG5op85H5y5ntaaC7tp63AyQXrVFmPPQRlih+c7v6Z02loKUWReMMHuIV70STnn8m+mL5GrYY6IQ8QRM+sHqDq1P2cSsJgSATXHsxPh5C58q0AfyasW6eTqHsYu58+wcVJYnaxDiYnIXRWR+33GViiEEYpnEHKKYE4p1lu8IkxDJVd6vz/munTp7x2uKlLZM5k2xXIPk4WCVtZvBORrwHEW4Aa5YRLXiKQ2YroA==
Received: from SEYPR02MB5557.apcprd02.prod.outlook.com (2603:1096:101:52::6)
 by SI2PR02MB5708.apcprd02.prod.outlook.com (2603:1096:4:1af::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.18; Sat, 28 Jun
 2025 15:58:10 +0000
Received: from SEYPR02MB5557.apcprd02.prod.outlook.com
 ([fe80::cb39:3489:a58d:107f]) by SEYPR02MB5557.apcprd02.prod.outlook.com
 ([fe80::cb39:3489:a58d:107f%4]) with mapi id 15.20.8880.021; Sat, 28 Jun 2025
 15:58:09 +0000
Message-ID:
 <SEYPR02MB55575E3DE3A107D36F5393AD9644A@SEYPR02MB5557.apcprd02.prod.outlook.com>
Date: Sat, 28 Jun 2025 23:58:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: qup: jump out of the loop in case of timeout
To: Andi Shyti <andi.shyti@kernel.org>,
 Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20250616-qca-i2c-v1-1-2a8d37ee0a30@outlook.com>
Content-Language: en-US
From: Yang Xiwen <forbidden405@outlook.com>
In-Reply-To: <20250616-qca-i2c-v1-1-2a8d37ee0a30@outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0050.apcprd02.prod.outlook.com
 (2603:1096:4:196::11) To SEYPR02MB5557.apcprd02.prod.outlook.com
 (2603:1096:101:52::6)
X-Microsoft-Original-Message-ID:
 <54c4875a-f145-4bb4-9611-5ed04a1080d8@outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB5557:EE_|SI2PR02MB5708:EE_
X-MS-Office365-Filtering-Correlation-Id: b66ee650-6fd1-4b45-557d-08ddb65c9362
X-MS-Exchange-SLBlob-MailProps:
	ScCmN3RHayH/GTHkQcP6OwNM4X+kH+hnT1Icpwuvgovv9RuadKNVlh7jsOBRXGSqEV78Py/PnYl0DknQ5Jy9f+03/ljdgCkBdzKBhsLe9uCSFlHaf2I5uhPGqDM19Gtsa+P493YBS3RJcwGarI/7ld32FmI7kD8SP3dWjyN0dDw9YXLkGrefbqq5V6JbZnU+N4qJomykx83GZ1panD3HtAymKhF/2NXJgd/VvXw//XY4RPxYX6w1UwBt2Qv/RT/spfEMc0WOYcbRBS1+/cG0k+GGFOAr041Mv+700uaRHnpOACpt3KcYDHjeoN4r1wrjy64a7D0lJlUckzMywClXEfSlBr+haAebKsgafWfKiU0gDNknOHsG2EfbXhUI8fUqbNeq4ImWIWwAs1YpPGJN6mazk7rvdS6kj0e2TpV1id9lAxOYzlJHpzBbctuF6iJ9vuR+15gNtzwEVXmkATswPodt6vNAQ4WKOqh1OkVdPjJXTk4QEUJ/IvbBQ2WECeJIQkcV3tbFylxXZ46ZKBo1qiUpnBSRSf6f/nUPFdJ+GiTapafdkvRnHQ5Lw2tRXq1Xz5rXi9YR/2p3+QOFFebRgnwS8L0g3aYV/OabWRsJLq91Wbm+ojq6LER1aPIe8YYymEwOG3hl13p2PiKDIdhOPlao9C4Tt7hUzWm/Z5WGMyAMTKteD4pY16XOOeEbF8IohexZBgj2xparuWX2iesYctxgILGLnqHoD6uaglgYiE8=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799009|5072599009|461199028|6090799003|19110799006|15080799009|41001999006|39105399003|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M3luWjArUnBOSDBrQ3ZGeFFOR1R6RmJ0UHlBVTFwd2k4dG9KcHdYWk1EZUkv?=
 =?utf-8?B?S1MrVmVPYVRHY3dTSnFrNGtWdElYWmlQYVhJZnJTcmx5NXBNWDdyaEZyVGxT?=
 =?utf-8?B?d1FEdkJUOXlOeDBxTDBEOStkVjcyZUpzUCtPalc0Z04rWUVZQ2tpMDRteDlP?=
 =?utf-8?B?M0ViSHg5N2pSZmRyTnpiWEpBcUhscmJicWNkeUs4a1BNYlVnLytmSWM4VmI5?=
 =?utf-8?B?V3dERHFDeEwrZHZFOStaRHo1K1JKdG92NDVRVVlHcEJpSkJUT0YzdEp6ZnUx?=
 =?utf-8?B?SFNkNDBZRm0xSllub1JZdDFaTm5DaFAyQVBFQkRJN1B3UHlhOUVLYzJDUXZM?=
 =?utf-8?B?RjN0TEQ0RFFXb1JxblIrYWR0MjY5MWVRUTRjTVByWENBTXBjSmp3dG52UlNK?=
 =?utf-8?B?Y2E5dUpWN0RyR09ZRnpUQzg4S0VBQ2QwNVB5LzF0ciszTmk4azRhY1lDNFg1?=
 =?utf-8?B?RlZaTTJ5bkdkWlNmN3hNQVdoMVl0eFk0U2dhSGRWVlU3dXRYdUJxZkREWjQ0?=
 =?utf-8?B?L2xLOEhWa20vS3c1bEZkNGlMN0pXL0pmOS9HUXlVcG5LOHFjRjdoY2ltSm1Z?=
 =?utf-8?B?UjlSZlpNWFFMMjZ2YjU5VCs3ZXB0OUNDd1BEcE85V1hIYVA1Y1dtb3libGNR?=
 =?utf-8?B?bUVFcTA5eXpibWliUld0R1hVSW1pbklPMHh6Ky9oS2RRalVmaUYyWGE3ejJW?=
 =?utf-8?B?TjJqdXhaV0lJQmUxV1hqb1Rsd0VSMFdYYjN0RHFsSTMvcXZGWDl2Y2FONU5l?=
 =?utf-8?B?YXNFOThzSUhaUUxKNkpVd2w1WGxzNzlXQzlqVWhIVGZtNlYrVTZvbG5XdVF1?=
 =?utf-8?B?Q2h2cjlZQnQ1RzlrSW84UWRaOE13cll3UFo0aFBnelM2YVdHRkJNZFZYdnI3?=
 =?utf-8?B?cVBJR2gvVGFQWUo5a2VNRHQzbWJwV0lUaE9JaFB1WFJhcVhUOG1jLzhtYjJI?=
 =?utf-8?B?Z0s4T2h2eTJZbUpVQXFNSTJEMisrM0pTLzlMN3RvNDNhMXBCNFViSVVoVmhS?=
 =?utf-8?B?MGhRREpSQ0NreXErV1hsbTNqa3ZmV2VZQkErRHdTSVBENnBqd2kydG00YnJl?=
 =?utf-8?B?c05DZ045Y1pmMENmUWNaeHZ0ajFFQ0xOQ0JCTGtJNTYwRThRVi9HVTFjWGVU?=
 =?utf-8?B?bTVUbW5KeFlSRlJnSCtIYVpOWjE3VlpJTmtDcWVHNkd2dnJFcGtMNHlxTlFB?=
 =?utf-8?B?bUxjaC93TjFyNk91djFFYURIV1J3YUdBc0lRT0JhbjdqeHFnSzh4K3RLNmJu?=
 =?utf-8?B?eUxhNjR6YzhEZ2Q1U3hnL285Wi9QWHVCN1hpWnhNUis4dDY0VFBweTRpMlBn?=
 =?utf-8?B?b1U4Wm11WVhhaFBkL2lSWEE3Qmk3VHBjSWlsQmx4dlFKUWVaZVk4VUZCdWxW?=
 =?utf-8?B?MEx2N2ZlajlwekxDbFNvZkp3bVAxYWNPNmVaaTJXVXgxMDQ3Q3ZXOWRJamhN?=
 =?utf-8?B?TTlHeFlKMUcxZlNQWnN0WUpEc2grc0p3RzhGbDFUaG1FNUpPZzVSSzNiTzho?=
 =?utf-8?B?WXc0Z1lyVjFKRDc0S2ZtVHlScER0VUhhUE9aTitleklDTlZGdGEyakdGWWhm?=
 =?utf-8?B?ckcrVEpJQjk5VldYdkpWQXFYWXBtVGo0T0lvOENnamFWbXpqeDFPbDlrU3k5?=
 =?utf-8?B?NXVQNmdudVVleHY2Q2dUS25PR3dlZ3c9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1M2UVo5UlZ0K2xMSzIvblQxTUN1Vkt4TWc4bzBWZDVWNnEvRU9lVWRpS215?=
 =?utf-8?B?WXUxNkllcnlhQUZxQzlHRzNHMGJhTGtTSk9VbUZFYmtpWHY1VjlOS0dEOVZj?=
 =?utf-8?B?UTh3ZTE3U1J4RTJObGpmcXpoZExhY0pidkJPMDF0RzE1VXdrZFNoVEZCeHpR?=
 =?utf-8?B?NmRHZ0x2SWNCblNBMFV3TjRjSVkybWUySElwWXFLZ1VETU1QRThMMm1BTTdL?=
 =?utf-8?B?dU1BT0lZRE8yZzYvU0c3S09oUWVWcXFZMCtTUUhsSnlJOFczdHdrNmNQVVQ5?=
 =?utf-8?B?K0NyVWFxeGM4RDRGaGVxVkduQ0NHdmFOZnlTemFvUDd2S1ZFTUN2N3NMcDBM?=
 =?utf-8?B?LzNYc0ZsOS8vckVhMktkazBZa29pWmtMT0E2TFNkTVk5V052L1REUzFhT0Vv?=
 =?utf-8?B?bFl6cktEOTdDM25uQUFyeXJFczZaMUhPdURUdDhtWDMvb0cwTlliUmd5YldD?=
 =?utf-8?B?UFlvNW9Dczk2NmxFM1lLNTl4cFVkZWZmclBweXU3Syt3eXFDZ0w0Q1AybXdn?=
 =?utf-8?B?RldpR0twYXF2ZjI0NWVkMkRmajAvYjNnWUw1eWl6djRtSjRybzlEdytFbHpk?=
 =?utf-8?B?R0FyMFcyNkhoTHlQd3A1aU1LeWF1ZVdBRHNBTUUyMkgySFJhcGM0RHU2aTdY?=
 =?utf-8?B?aEpsejJ6ZUNZVVB0VEpBSkdmcEhlSUZYcklyZHhtWDl1dGxkRHUyNk1iOUdi?=
 =?utf-8?B?bUNJVTExZFBtVEdIZzBiUHdrVlg4MHdpRUg3dHdaMlhtRS9FRGEvVzVKL1Yx?=
 =?utf-8?B?NkNPOVBZYmlJQkVOYUZBb2llS1RZVHpyVEJsdFZDV2xqRERPb0ozOFdwcXFu?=
 =?utf-8?B?SnZWVzVwd05WYy9rWEFoTnVldS93YVFOaHBFVDgxZ2Q5VVk3YUc4anI5ZDlY?=
 =?utf-8?B?Wi9yOEk4aWlKNjJpb2xjZW9RbGdncDVGbVcyUzlhUEFJckRhU2JURmh0Yjdv?=
 =?utf-8?B?VnZUaWY3a1dNVDd5T2lIZmNoelNqZ3dzQks5TUh1Y1RjSmJudTNHNE9KeGx6?=
 =?utf-8?B?TWJmWC9aMyt2d2IySUVYWDVvcHpxNnAyUjZmMlBoNm9Qa2swZzZNdkZvakVT?=
 =?utf-8?B?L05kalBKemZuRWpmQmhCNXNXUFpJaTFzM0pvbmw1b2FESWQ5cEFKME1ZVXJp?=
 =?utf-8?B?SU0wcFdrdWMyVm1kanpJZmk3R3JQcEZUb0M3dThVbUoveCtWNkY1TGR3bEVi?=
 =?utf-8?B?NkdTbVF4R1pldTFzQ0tuNVhaQVZoYnk4RThBNGxNcnNZZ2lyK0JJVDByYmFE?=
 =?utf-8?B?RzUxRUNuNjVWMktwOGxPMVQxek9YQzYvUmVXZndZcHhrTG81TmN5ZllSUkJP?=
 =?utf-8?B?dzhGMTNDUTRzOGs5RmlnREZIZndlM2llelB5WHV0eE90aVMxTndqa0Vvc2xP?=
 =?utf-8?B?MW8rQktsaEhQWkRZb0xZWWtjd2RRc3dBaVFQSmdDaXZjcmVyb3AySUdBV21W?=
 =?utf-8?B?MGpIVkwxcngvZXA4Zzl5dXkvSGJmaUlUZmFwdDJLQms5bHlPVzlPeVVqMFVF?=
 =?utf-8?B?ZVJTZFNGaFRsUnY2QmppVGZKd1gyYzRIbWQwdXMxV2hBSEpkUzh5a0lnMzhM?=
 =?utf-8?B?TmhJNVZoK3F5czdkZldEbU9pVjUyRTdDbHd1MWpSdVMzWEVPUmNPSUZ1TWxZ?=
 =?utf-8?B?QkhmajFmSER5czFsN1lIVVZyRit4c0Z0UW1haWJZVC9uemYrRGt6RFdIVkt6?=
 =?utf-8?B?RWZJVFlTS1RUT0N5cW9yQUczQUtIb21aMENDeXArdFBqMHo4T3BhTDVhNEVE?=
 =?utf-8?Q?VsAB4+q5qhVcrjPLgPW2oyOpCUI0RTbYrCzayVf?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b66ee650-6fd1-4b45-557d-08ddb65c9362
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB5557.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2025 15:58:08.8846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR02MB5708

On 6/16/2025 12:01 AM, Yang Xiwen via B4 Relay wrote:
> From: Yang Xiwen <forbidden405@outlook.com>
>
> Original logic only sets the return value but doesn't jump out of the
> loop if the bus is kept active by a client. This is not expected. A
> malicious or buggy i2c client can hang the kernel in this case and
> should be avoided. This is observed during a long time test with a
> PCA953x GPIO extender.
>
> Fix it by changing the logic to not only sets the return value, but also
> jumps out of the loop and return to the caller with -ETIMEDOUT.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Yang Xiwen <forbidden405@outlook.com>
> ---
>   drivers/i2c/busses/i2c-qup.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
> index 3a36d682ed57..5b053e51f4c9 100644
> --- a/drivers/i2c/busses/i2c-qup.c
> +++ b/drivers/i2c/busses/i2c-qup.c
> @@ -452,8 +452,10 @@ static int qup_i2c_bus_active(struct qup_i2c_dev *qup, int len)
>   		if (!(status & I2C_STATUS_BUS_ACTIVE))
>   			break;
>   
> -		if (time_after(jiffies, timeout))
> +		if (time_after(jiffies, timeout)) {
>   			ret = -ETIMEDOUT;
> +			break;
> +		}
>   
>   		usleep_range(len, len * 2);
>   	}
>
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250615-qca-i2c-d41bb61aa59e
>
> Best regards,

Ping for review. The original logic error is very clear. This patch is 
also very small and can be reviewed in a short time.

If it insists on waiting for the bit to clear, it should not return 
-ETIMEDOUT then.

-- 
Regards,
Yang Xiwen


