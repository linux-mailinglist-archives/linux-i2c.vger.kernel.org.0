Return-Path: <linux-i2c+bounces-4763-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3F092A708
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 18:14:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B17E51C20DEA
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 16:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DA0414A60C;
	Mon,  8 Jul 2024 16:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="ju+qvyLw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2130.outbound.protection.outlook.com [40.107.20.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545C3149C57;
	Mon,  8 Jul 2024 16:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720455207; cv=fail; b=dOUTk6hgUEhqeKlBNLzNwar0RYFCRMJrz2BTHro6KN9OmWTEMAubcOYWYnQ3Oj34tjbI47vTTd75koz3YmgX1m0u4QOmDQrOk2SV0DbrCQ6IWt4IFEqTdKzUfIGQJOHY3IpzT2bUMrt2ncogz+KIqU4PLAiPJUznzS3JCSJtQMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720455207; c=relaxed/simple;
	bh=UtSI+Z4rhlvu720rD8lKlp9GhOla7RSxRM3ss3vsguA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=LzVfnCMwG4Gam9QB2ic5zZ1b4rxL1tpNQSiiGKlpklAaC0kbjiaGaQLZSApEom3ljh8s4jBFK7AiIEBKmGSQVFYpjoGYKr4lQ+Kg+F+cfAsy3fxKGJCBHPX0SJUh2qoqEOBSjpPvl3EbCA0BggfAIZJHRMcliFNB1/3Pl5ZyQPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=ju+qvyLw; arc=fail smtp.client-ip=40.107.20.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a8ok65AecJML8/v4S0wiBK5AJc2bH618HtotQYrBqGTEEYMBdr2wVQi7mSFRtczsb6rfkPxrIQNJxuxMhS+iG4HQrxSRrMHUl/43ce3Tm7RASnvAmcxC0pGza5p9DypU1PClNSJ2m+WZLdycTUrDntVfoNqTNdqHVMPFeXYhHXTRaqRQXPPFQ8ICdE+AMUMBh1slh1HhfGbrRgtAUcYflR+RjbQcZMZA8J+bzQ1wf4awnjtwnawzaQgJMr+2EUN+R3zv4y+3aIOnx96PVfN4sBa2jJkL3EylZ6OOvihEbxPPLrzH5WfbprHPJWoVYth1GRgaB7R0SCOGNXKYKpQGjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8i211aK1CQNyJCBZqzAK/lbL63CBSHQuaE0fah+7Cb0=;
 b=LYYsR4hnfSWrklrQudgIUl7U+i01Ffn4e0YOX3A28vjfreVht2sgdrZAp/JoaBs277HBbfY4d4KlRuf1j0TlCcwURKeuqxn/D2SDST7JVGcvLX4RDE20yizmlHprgynevIafmR4wojM9ixiMW/NifENDlmzIfnm1eATCTEgdK4sEfQFH92jyUv7nY0tgKxImk54VeEtOOS66kYtNlsjYfiPuZ5nK40dy6cN1tgztsAuQsk3fkp68Z/d1NN/qIPaeMBOR23Iq05QRkXZCt/6Ec6elimhi0jnEN8qjcMOx9g9WGGdpvY0/gg/YYVRu08ocxiIbF34etSWH+L4+T0BrSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8i211aK1CQNyJCBZqzAK/lbL63CBSHQuaE0fah+7Cb0=;
 b=ju+qvyLwPyzDFZtk3nlZgSfxdSmN9177+Xxyo/YRe7xb5BbTO8TrbY25C8ChEJWBWQbU27djn+ebOMeqZzQUe/8J8qEkak4TB8V20rt7tR6N8w//vok77gYENWcEbQgfJ0TBb0RnKA/WUHA/ZTu7KzcuRYf7KBa6ZOm2pyqOYE8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com (2603:10a6:10:321::10)
 by GV1PR04MB9055.eurprd04.prod.outlook.com (2603:10a6:150:1e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 16:13:15 +0000
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181]) by DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181%4]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 16:13:15 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Date: Mon, 08 Jul 2024 18:12:17 +0200
Subject: [PATCH v5 6/8] arm64: dts: rockchip: add tsd,mule-i2c-mux on
 rk3399-puma
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240708-dev-mule-i2c-mux-v5-6-71446d3f0b8d@cherry.de>
References: <20240708-dev-mule-i2c-mux-v5-0-71446d3f0b8d@cherry.de>
In-Reply-To: <20240708-dev-mule-i2c-mux-v5-0-71446d3f0b8d@cherry.de>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Farouk Bouabid <farouk.bouabid@cherry.de>, 
 Quentin Schulz <quentin.schulz@cherry.de>, Peter Rosin <peda@axentia.se>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.0
X-ClientProxiedBy: VE1PR03CA0057.eurprd03.prod.outlook.com
 (2603:10a6:803:118::46) To DU0PR04MB9562.eurprd04.prod.outlook.com
 (2603:10a6:10:321::10)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9562:EE_|GV1PR04MB9055:EE_
X-MS-Office365-Filtering-Correlation-Id: 40d2750d-7239-4373-3136-08dc9f68df3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Qjg4a25qMXZvT2pLRW4wVndnQVdIcUxITXZNVXYxVDVaeFg1RHlMNGRlL3Bn?=
 =?utf-8?B?aHVFeVFqazBldHBWcGlsNkpYWGF4YVFOcHFrY1R4cE9RblMrOTdGeHY5bEdO?=
 =?utf-8?B?OWJoa2ZJbFhBT25XUlFJL3R4cHhxSXd1bmEwcHREdWI5QUJqQWx3T2Y2Mjc2?=
 =?utf-8?B?aGcxbFpxR2hIRnFTSU4rR1EyS3FvSXgra2o0OFNZZ1pONEFqMFhFZXhsUmo4?=
 =?utf-8?B?NlJwRnhnQml5WUdnS3QxWXdwdVN6R0FMUHZYQ1NQa24rejZYSEhuNmFJQTc0?=
 =?utf-8?B?aHRLaXVDMzZVNmJCY0kzUkN5UGhxSm9Ec1BsVno4eG51RDhhazlRTndGTVJF?=
 =?utf-8?B?c0pyakt1MiswOUtpd29XanhJbUl4emZMYlAxcmw2NmxyTmhWRDRGd0xhOHRC?=
 =?utf-8?B?ekgzVWtUZ0U4dE15Y3N3aXpWKzZOZ0JEZGVjZkVPYklydlgvWnYrVEFrcnlu?=
 =?utf-8?B?aFF5cUsrcldNVXd4Q0piQlcxaHhsTzY3aExTSmE4UURQdUg0dmF6WFAvenY5?=
 =?utf-8?B?YVFleUZEVnFkRjJmYnlXdFBKWngzL2lEeHFEUWhRbnF3SFRpa1RJNE1YL00w?=
 =?utf-8?B?TTNNYVQvVjZhcDZPMkQ1bWwvRFRLN3Jvb29hWm84b1pFaUZ0ZTk4Q1o5RWhu?=
 =?utf-8?B?YTVTbFBNcGpWR25nbXJJcXRSN3RPVmxkMUdHRm9OMmRGYlU3NnZ2ZXJkYS9p?=
 =?utf-8?B?VXQ0aDNCUXFkbG9VdDBxUzRhN29zcm16NmltU29Sa0tjOUhNait6ZGREZWJa?=
 =?utf-8?B?c1RzK09rTEZVMHNvSzZZMC9nMjd4TmRpcGNYSTEza2xUTUs3bHJvb0RBbnNO?=
 =?utf-8?B?aEJBS1hWSlFrSVNCV0hJOTNPVnZ6ZWFLVnRrVll0anRHUjRhOFRyQlFCNUhk?=
 =?utf-8?B?M1RseWlqUmNDTzlxZlNJTTBPcDdDMnR1T0dsc0ZTNFlLK052VzhzQUxkMXlT?=
 =?utf-8?B?RFhtbW43T21NRjZsNlBySng2UlBPZjYrYW45YjRIL3FXMFZKSVFRby80N04v?=
 =?utf-8?B?ZW4vKzFJQ2ZPODhxR3NZVWVUeFo4bWRNNjUrZklic3RLRXJGV0kzTnRqZ2Nw?=
 =?utf-8?B?TUZ5UnU1RE9PaEFRc2J1VlFQWDhkWGNzc2hVSzZ3Mmxwak5hTkVCdEp3Smxm?=
 =?utf-8?B?b3pXektXb1lxTHVsR1FoWG53L0M1RE1SbDc2clhadDAvUFRtaWNBaEw2SEJz?=
 =?utf-8?B?WmJ0MG11NERBcXZ5UUJTdSszVno2ZTR4RVBXNjZqQnBFS3lnV2tTV3MrQ3dn?=
 =?utf-8?B?OEZjcXBYT2owMWhBZ1hpay9IR2paNU1zNms3WGNFSG1sT0dTVVAzNHR1Nkxn?=
 =?utf-8?B?VDRFREtQd0FPY2Fwd25WekFkQ3JhVEs0VzRsb0pDMmhiMklVbTFLNWY3Z1Mw?=
 =?utf-8?B?Q1lqc1JtT2ZzZkd3QUNOeXhGOFpNWjNnS0ZSM2VGQmFXVDlad2tpNlpPZVFR?=
 =?utf-8?B?R1hBcG4xOGY5K1pXRTQrdHczVHA1eHZXR1l3c0NwVW5NNWxjRUdVNUZKckFt?=
 =?utf-8?B?Ukl4U3M4azJnSjVqcHBSUkNobHJCaG02d1hrdjBpZXBMRkdRL05GdWMwb0t4?=
 =?utf-8?B?TUhpZVZCeDV5eDJ2ckNxK3p4cUxPUFFYZzliU1hVbjBOYklaVW1yWXZXeG5s?=
 =?utf-8?B?aUg1MFk0b1FtQ0hQT3FaVTFnbHpCWjdPWTNCWDBxRTRPdVZlSjVvVm1RWjM5?=
 =?utf-8?B?a3VxNUxxblZNQ0JDbkVxVVd6L1Jua1lZcFl1UnBUTlFhR0RUbEs5ZkRicm5o?=
 =?utf-8?B?RnNxUlh3eWFwZ0NraVdvREtTdjVXcnYwSy82VFFzVEdWUTd5ekRqRWVwWjEy?=
 =?utf-8?B?V2RST2haTHZCbGxBVHFIN21CL1diZFFKOThnZXA4Z2pWazJnZ09TZHlOaDBm?=
 =?utf-8?B?ZWVKbTYrVjdnRUhWeDEzZTIrUzZLN0xVUFBnTURlaGJwSThjTVJuUFYwQXNr?=
 =?utf-8?Q?ITo35jw1e8Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9562.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkFnYXdvK05IWHV0Z0dvUXJUTVR4UUtZZWJhSDJvM3ZOOVViNlkzVUtEYXNC?=
 =?utf-8?B?aDU4eExMcHhBRjhXY2xjR1RINGNzcExzMHZSelVUNEJpUHhnQUwxelRwbjVU?=
 =?utf-8?B?RTVpZHIraG04b0NkcjBFV1dsSFlMNWsrTDhTUzhVZ1JKZyt5TlRvaUVUSHNk?=
 =?utf-8?B?MWZUYkZUenZnL3JoRUxmdGJaVlJtTjhtdW1BamR4TXYwdjhaTkdZalgxdWZ5?=
 =?utf-8?B?bTZGcklNVDBxNHQ1ZEV0alRuNzUzMU5uVWwxWWNsdkNXZXVhKzdRK1J6NGJz?=
 =?utf-8?B?ODBZekM2QjQ5bWZZQTJwYXJRcFVOZmUvNFdVK01VQ0FveGpvbkFEdGxNODBJ?=
 =?utf-8?B?S0FDOXVwS2E2YnlxOWNScWdCd254bzFuL2NGbm9JVVlVeHI0Z0k2OFZOcDJL?=
 =?utf-8?B?WVVMNjNMaVcyTTQ3VGdwemJQSTV4eWRRelZ1TEJrc21zNE1yeTd0Z2tlcFpF?=
 =?utf-8?B?NWI2K1ppem05RFJtM1hvUUNPbkpnam1hMnBzMklJaHJtMmIvWXVGVjlXSUxH?=
 =?utf-8?B?MVhJUVBsSXA4ZEwxNEc2WGZIYUJlT0ViU0p6cEtYUHNLOTZtU2EwcTAvZXU0?=
 =?utf-8?B?a3BOU25WeE9ISUF6ZExlRFgyQkxIRlI4bzB6V3NISU9ZbmVCMlZhV2ZKWEZx?=
 =?utf-8?B?VklmbG12U3V0NE01QytEUUJEVWN5K2JJVXhhVjZYTVBLaHB2bkRvaVNLbitl?=
 =?utf-8?B?dDdYMTh4dThZUUloN3ZmMWJhSUp5WUlVSUpsamJMK1hjbjRZY3BhMEgyOFRm?=
 =?utf-8?B?c1hoSkxmMFI4VDFxQTIwbFM2TnZGSWtRNlJiQjkxUG9yMzZKc0lSWjZZV2ww?=
 =?utf-8?B?QStlRGhGcG55V2sweUFmWU1FcUpkRnNCUDVHWTVndGQra3ljRUpOYVNpKzNu?=
 =?utf-8?B?akduaWdPWTJZTllhM21vRHAzODU5UGtuNlV0V3FBYnQraXorZUFRUmZESE0w?=
 =?utf-8?B?eDVYaTRkMWt0K0MxVW1uelFMSC9YWVFDK0k3SDN1T1hXZ2FYTFRPazI5Tjhy?=
 =?utf-8?B?QkRNNklZb3FZRGpCTFFNL1JNeVZQcEVwb2kremxicWZSN1BJWkRRZSt0RW54?=
 =?utf-8?B?b29KVkFmS0RGYmwxNEFqVm9aYkdBNytBaklUTTZLb0daSjgrclpJaElsLy9G?=
 =?utf-8?B?aDVocFltMmhLbU1PK1pUMEpwamZ2YWUxL2NUQW4wRHBySHQ1UHVzMHdpajkr?=
 =?utf-8?B?TjJNZjQ4c2JSZ2JhVVdieXdObk5lVXFFQ2pOQmpNczRxT3lNNGVaMStBaUl6?=
 =?utf-8?B?dEZ0VkEzaGdsN2k4MG9hb0FnVFNUdnNhVGFBUGVxOG9xK3ZKSk4wL2J4NkEz?=
 =?utf-8?B?Mm9lVHE3b2FEanRPbGFxUFBCR1M1eVI0NW5KM3dlTWdvOGtoSFlQcGFHR09N?=
 =?utf-8?B?MVJieEEvazZ3aFh0ZDBIUWp4SVFReUxweUNoWXN3NDFXWGgwNll6bGZwNUtF?=
 =?utf-8?B?Ulo2R2YwaUJZRFdteThreVZNc3d1dDdodVNDbkNFNWxWODZYYm45WUF3WERD?=
 =?utf-8?B?ekUzajRsTFJDZS90THNidHlvamZrZittREs4OFhEZ1htWlBwK3d5SkFlWGh6?=
 =?utf-8?B?U1hQVzJrODVsOUFNSUJGYnhnd2U4Q1BoNTRKSmh2aDVlMkhyNlJTUWlwZXhS?=
 =?utf-8?B?RU4yQUxtTkFRZTV6Z2F2cEt0U3l5WS95Z2c1alVSSUhtZExQRk5qR1YxaXkz?=
 =?utf-8?B?Z21lTC9wTUhVZkQ4T0s3MTE5SDdXcDR3ckE3WGxjRHdZSmp3YmZVTUhncVVh?=
 =?utf-8?B?bndpTStvZXBLZi83MTFtU2t0RUtVL0pmWGlRTS9NWXo3ZVF4VlNIcnU5TVBE?=
 =?utf-8?B?SkdVM1I4SUd3NzJEWGtPMGpDY3BlbWpTZStIQ09OWnJ2QWs5SGlDNGlNV2Nm?=
 =?utf-8?B?YU5zRzNTZmVvZG83R0dzbkVaYnU0M1YrdjdLa0ZCMzJ4N3lCT3JPSTJvMWdh?=
 =?utf-8?B?V2NES3FWT01RUzdkaDU2OUQ1M2JRR095MW9VT3hsTGFOOGpLMHJKVWx6VSsv?=
 =?utf-8?B?L1g5QU9QcDhjVld0SWZvME9uYVQzOVJ2aTJPQnU2azdxWFFBOFE1VDRxT3pk?=
 =?utf-8?B?N09wK1lpSFpVRkNTcjdURkE5dC84ZEsxTmorRVNBb0RZMm0vN1V6Sm52SktI?=
 =?utf-8?B?cU83NEphZHdhZEc4V04wMTN1Wmw5QWU2M1hycThYczJhRk84ZzYzNjlDUndt?=
 =?utf-8?B?cXc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 40d2750d-7239-4373-3136-08dc9f68df3a
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9562.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 16:13:15.1106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nOCbXcqN1x6pACrsr/HlcvHKpWGYhUiamk2NiH2a8U0dE/TvMGk+0nH29LMpdTndqwbjrf/lQmGw6TRqWAztzn6QBV1JIsbrq7P/Swbfprc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9055

Add the tsd,mule-i2c-mux alongside with the amc6821 (tsd,mule) and isl1208
as a default device on the mux.

Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
---
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
index ccbe3a7a1d2c..72a0bca57385 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
@@ -10,6 +10,7 @@
 / {
 	aliases {
 		ethernet0 = &gmac;
+		i2c10 = &i2c10;
 		mmc0 = &sdhci;
 	};
 
@@ -378,14 +379,25 @@ &i2c7 {
 	clock-frequency = <400000>;
 
 	fan: fan@18 {
-		compatible = "ti,amc6821";
+		compatible = "tsd,mule", "ti,amc6821";
 		reg = <0x18>;
-		#cooling-cells = <2>;
-	};
 
-	rtc_twi: rtc@6f {
-		compatible = "isil,isl1208";
-		reg = <0x6f>;
+		i2c-mux {
+			compatible = "tsd,mule-i2c-mux";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			i2c10: i2c@0 {
+				reg = <0x0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				rtc_twi: rtc@6f {
+					compatible = "isil,isl1208";
+					reg = <0x6f>;
+				};
+			};
+		};
 	};
 };
 

-- 
2.34.1


