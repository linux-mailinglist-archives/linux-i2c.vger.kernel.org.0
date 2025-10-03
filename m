Return-Path: <linux-i2c+bounces-13382-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C148BB789F
	for <lists+linux-i2c@lfdr.de>; Fri, 03 Oct 2025 18:27:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B40B19E77DE
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Oct 2025 16:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD5B12C0F81;
	Fri,  3 Oct 2025 16:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hfFI1rwH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011000.outbound.protection.outlook.com [52.101.65.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827F32C029A;
	Fri,  3 Oct 2025 16:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759508837; cv=fail; b=Ak2oDDu3YE2CWQHex2Sz80m+YXFAeJX3NksLwmIxqPiItJFyda92B9Zly0/HI+5cYOp8mG0ns1Z4hxh9SE1VSsFLa8fJ0yZJN4+47ceHYXQJTABg3nyDwt7euvvjNsPXAMPv/ZpeI6yecB7UXPxr9bHYFeH4bR7vqbbrzLXP0b8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759508837; c=relaxed/simple;
	bh=oG8432TvYgLf3MtVTCPtwvk+cUP5QVNZA6q1vH5b298=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Biy6Ks1Jdnnt9FO5WTXp6up0aRQ6u7T/P8i5RMLyiUbezYqbKfDkKh3yO2IPB3JUgfo8WliExWoJBPG4pa4WaAdPLWUsnM5Tq9w6UFOTUrVi5JAIdsJvJQn/icwGRJohFM3ey4hW5b+DsE6nh1EZWwn+rENDok4mf1KR+dkBX94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hfFI1rwH; arc=fail smtp.client-ip=52.101.65.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BzoPKnbbgWV1EtDG+fulUo7P/8wfJDRPVgrV83yhyBhrjz1hz5sCjkCmtxB4KBRVGzK6pMvJE5DE/RJY0Q6FThW5omTl+hw2EsMu+H/3Rrk7+xesphLoxpGJYfsQxGd6Z6wy1X54+zhiRMS4+0XoHci5Z3E+rSuoIpz53CdbttmJqIAkhAvHbhrBsSXX4rR6zwJqsWt75xbYo6Xgv9rSZegb1UqajZygC+o7xThNyI/LodJ4uB6emtYsYb45vcnp3UoaeYGSYljbiWrhGppzAef3o5sE4J2uZqjhiLYy2Z2lf/ONrmRYieUsE5GFr6d5vWItStqX5cHxcnQWEl4zCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NwagXFVQiIb/XotiMRStZsxGfyRhfbqqc+3LVAFLdVg=;
 b=jXxdffoXY4JTLOpbuOLWi7uI8h3slF0kL5mvcIXyrlzYEtLq+fz3J8D4Ac4NInl7Lp1ElVz+EIjG4ho2T7JCfpRc022sVGqUgaJMsYj+GucE1hoQZnhVPeUGjoKwEsOqiptJYIzvBiALF7BUUF5dST8QfJRFYJLnH5qmIjJSkrfjXZ/7+Wr/zhKceEs5cnxObzY2yXS6lu+U4GGW8CfuvpmKw2kch50JpfLVEO42DEiNcySoZcKn4Urtqy903mbA4pSXIBapamiDXQuAWSA8h8nC1hplsN3nE6Rw/ssZXCxeFtxcAMrUE60QKRWMHXQ7ekR/xNnV1kEGzj4VYZgFOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NwagXFVQiIb/XotiMRStZsxGfyRhfbqqc+3LVAFLdVg=;
 b=hfFI1rwH7Q8W95noJCiKlMFoRtoL4MWYEL1CVI3iMuHB5LWRDyIEW6i1rFrTxXO/+XSqcvXFltJeNDviJdPh2Bo2ci4lHgEt7JbTSvacXaKiruELeYzKnMaOQPewQnHGvtSELknXIw608MEZZzTlKXSeopiAgORUZYr6VyHRCLHtBaXNYaDn3QlKC57Cf91G8gMMIxGd5C74YRp5+cykJUlBa1qAJskD+etuMWZP7nuSmlHOqhX9gOPwFKeG8g2IKEF9bW14rT5Ds4YduEGXukuo40t/enlr10US6k82rr03gJJCVBMnPNjaQDlOBMsU0Zm/Wd5OvdWSuwVeTUSNBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by GV4PR04MB11331.eurprd04.prod.outlook.com (2603:10a6:150:29e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 3 Oct
 2025 16:27:09 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9182.013; Fri, 3 Oct 2025
 16:27:08 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 03 Oct 2025 12:26:49 -0400
Subject: [PATCH v2 1/2] dmaengine: Add cleanup FREE defines for
 dma_async_tx_descriptor
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251003-dma_chan_free-v2-1-564946b6c563@nxp.com>
References: <20251003-dma_chan_free-v2-0-564946b6c563@nxp.com>
In-Reply-To: <20251003-dma_chan_free-v2-0-564946b6c563@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, carlos.song@nxp.com, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759508822; l=1206;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=oG8432TvYgLf3MtVTCPtwvk+cUP5QVNZA6q1vH5b298=;
 b=DPjGw7PDIE+rwDAy/KucPJ1xT0iry5Gf+INXz4rlg5T0iJA1LV+tYTJq3ao4KMCbOhTqFVqok
 3sfHyBif+1iCXfj8Fz1JTx4p1L8kVm/7IJnDk3BCT/KPooBs8IzsMqp
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY3PR05CA0051.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::26) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|GV4PR04MB11331:EE_
X-MS-Office365-Filtering-Correlation-Id: 64786912-ab79-48b3-b49d-08de0299b2e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|19092799006|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NmhhV2NwRnVBaDZzclVVcmc1ekw3eEZBaWMyUTk0bHdCdE1jdXVTQS9ySE44?=
 =?utf-8?B?TXArS1V0TWlvSEQrbWNCdjhuVzNHZ1VoQlNZeVdWZXBjb1IxT2JvbWhnZFNV?=
 =?utf-8?B?R1d0V3ZIbkg1RjdOK212UEoxcllzVzJrYVRwcW8zZ1FvV254VUQ2cW1zZjVB?=
 =?utf-8?B?UDRmc0s0cDVwcklZS1BpSFBYSHBKcEtrRGI2cHBnL1g5Y1o4R1lPYzVDMWw4?=
 =?utf-8?B?bHRza1d6ZVdWQXZ0TlVlaTBBQ2VXUHpkSDd1ejY4NE9ZdElzRnJNUG1oakYy?=
 =?utf-8?B?bDFCUEFxN04veEtTNVY3SjFxRHVOY0lhVmtCQjNVTVcwdXdtS2U1WWpEclRP?=
 =?utf-8?B?UkJhcjI4QlRLcXhsUHBqMUVCcThPNlVXOS9vRklwNWFUM29qcTJVUlFEUkdq?=
 =?utf-8?B?aEJUZEVoY1dlTVMvY1FMSlBJek1ka2Z4SG11ZjBQVGVYNDB1QVl0czRHWXh1?=
 =?utf-8?B?RjFHYlpZUVZCb29ZbXJsRi93N3BVNnpwMDJtUTZuMEVxYzUxS3M2cFJ5S1hy?=
 =?utf-8?B?blJlTm9rQlorQnpWREtmeWdzUmZKTy84ZURvcFZZQ3lFbHRsd1FzeVI5R3hh?=
 =?utf-8?B?eGpsOG5iWWF6V1MvbEcydDFDOGJnWDIxbmlPVEpCcVM2c3JZbGE1a0Y3NDk5?=
 =?utf-8?B?dS9vQlBSV1JtQVNIaHRxb0RLWWx1WmVpR1I1RmpXYXlmZVZHZUpUeCtFVmdC?=
 =?utf-8?B?Y2Vva0RCUnk2QXI5MzJhRE5xdTZMemNUY1EyVmQ5dGJNa1ZuMFhqVkZtalJC?=
 =?utf-8?B?anhKMy9TNUo5L2FibUJsZFNwR1B5T1BHalVnRHNweXQ0ZUxVZmo3emt6QmV4?=
 =?utf-8?B?Wm9raXhqT2h2VGE3NTlic1BNclVsNGo3ZHRTWXpreFlQVDVzdmFSZStlRkxv?=
 =?utf-8?B?THJ3amI1cnFFazF4andkSEN3YWhZVmVtOTd0cDEwMURyVWx2a1JVcTM2bXly?=
 =?utf-8?B?eHROSjV2Rm9LNkVKY3VjUU1YWXJIVkljN2Z4empCaHdkWG9KM204dkZzZVFB?=
 =?utf-8?B?NXFPL2dJMFAyb2d0eHNKV1pTaHpQY2NVS09rbkpNdkFLbUFTeXF5dmZzUTFL?=
 =?utf-8?B?QVNlcjZSWWcxRG9EVGZ3WWl6YXdCbU8xL1FDc2wxRCs2b29yMHZvbWw4NUpo?=
 =?utf-8?B?RGVZVVBHZjhucXVKQjNhbi9wNmJoSEFScHRmSGhnbzhNZXhrMWw0cUhaK3A5?=
 =?utf-8?B?a0RXR2g2V2JiRCsvNlRXdG5lelkrOW1GbWZ3YmlBTnlpeTQ3dHMwWmJERHZD?=
 =?utf-8?B?MmFxbkNSaTQzRk91bDNlWTFvRCs1SWliMVFkSGpmOTVKdVJvbWErNXF6R044?=
 =?utf-8?B?cnEvdlpVUVV2bUNjb1NVdGZXV3hDcVp6SUVUNlRxSDlSOE5ncDRVSFZQRDZk?=
 =?utf-8?B?aGVKWEdrS3kxc3lrYlBVYzU5eThQbGNvY3ZNTlVlRldyU0ZzaFhCYXlEa0VR?=
 =?utf-8?B?eUVNbHppRW5BeEdYbC9EUTZJYktXVEd1TFBUMWtPNXZnU0hINEFpSk4zeWM3?=
 =?utf-8?B?Tzk3VEh1eUZrRUVKN2Q4L1piNHhSZHJRcFNvaWhYeW13U0dSdXhCbGlmTGxX?=
 =?utf-8?B?S0ZNVUhtZFo5dVltY2Z6SzhON0pNdXkwYTVLSElLVHVsQXc5dTdkeGQ0MmVB?=
 =?utf-8?B?azZtZ3Jqd3FHRTNhS29Tb3g5QzBRU1RQQ2FQcDgweWROaHI1OSt2YlRQM2ky?=
 =?utf-8?B?cUp1MjRWK0J3bFpiUklTOFVUTCs0c2Y4ODUxTGVOWGhMc3pGMlp6YW5jbGpO?=
 =?utf-8?B?VWRNRG4vSk5sSUdRQ2JZbFR5Rk9tQWI4VFY5c200L2pTa3RTR3hXTEF0WmxM?=
 =?utf-8?B?OFBoYmZXcU5iRVRXYkFRWTlFWjZOYURyMC8wSHNsNmtuTW9UTU9PdUtsdW0w?=
 =?utf-8?B?ZmJBQW9lVlFVeHJqUHlaM3poWm4vd0xicGNldXhPdU00eFk2Uk1CZWNYUHF3?=
 =?utf-8?B?S1crcXIrSjRlb21SYWxrbk1LOWR4OTNnQStvdmpQWm5ES2ozY3FsOTFOUCtE?=
 =?utf-8?B?UnNpdTB2c2QvMndldWExcE1mWnlseHMxN0QxRkpQRTJlNElPY2Y1Yy9ZcCtB?=
 =?utf-8?Q?f+PCGz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(19092799006)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ODZhbWs5Q1RET3ZQQlB5NHFoQytWVSszVW0wQjgyVURLSVFhTVUvaS9rUG1C?=
 =?utf-8?B?YlppODRSaXk3bWp4TDRZNTNMZ2E2WFNVUHNNS1JIZGdmVmw1dzNwZXVqeE53?=
 =?utf-8?B?WjRMZ3dDRG5lNkR5WWJzV0wyNUxYbFZZMmU2SG8zc3pJcXljUWRUK2NuM1lJ?=
 =?utf-8?B?dEREMHNOZkZHN3JPWWxqSmNiN29WTm12R1lRTW9ORmhBcTQyb3lpdDdUREIw?=
 =?utf-8?B?L2JUQmhKbmhXNWxLTWdZZm53QUFMYlJET0Foc0J1czhReGlSVGQ1MXQ5Wk1l?=
 =?utf-8?B?UklGaWNiNVRUSU5nT1NwTm1ndWFWNzNVZ0tlbmNNWTlaN3lNY1h4Y3pkcjlm?=
 =?utf-8?B?VU1JVksrWlZGWmpLVGp4bnUxYUZCTnhYS1ZvQmlOZjhpeEwzT09iU0Q0ckVu?=
 =?utf-8?B?cXV1MFdqbmU2NThRbGkxUXduU0ZaczVsVDVRNlBCVm1HaGZiT0JFYVMwN1cz?=
 =?utf-8?B?V1dpOFZ3b1ZEcjljOHJzVmhManJsY0wvZE9MeEJOdlVOekc1QWJWb2dZNURw?=
 =?utf-8?B?bDdsOWJlR0NDaHE3NlBaVExTVFg4b3k3eXVWSEd0cGt4enp5bElGVmwvc2s5?=
 =?utf-8?B?N0t5Yk10UlZRQ2JONHBqQ24xZHF0SHNRTGk5aktQRTRTelh4aU00cVNFRXQy?=
 =?utf-8?B?WXROb202OHJPZW03dzV1TUsxWmJpamF1ZDlJYVVPejQxaXNCWDNWMWFEY01l?=
 =?utf-8?B?bVFXNlVaaE9JNy9pOXFOYi8rMDU3QlVkUUJHSHJycUQ2dkJQalZNcFdsNXVE?=
 =?utf-8?B?TFBRbC9ML0JuUmRaUlJxMTU0cWVPQXE2VnRueldFbE9POFpiUzNMZUFVQkhZ?=
 =?utf-8?B?WjZGdGZFcERWQXc5YU96NERoNmhWTis0OExpVnl2T1Z2Vzl5cFlWai9JOVBK?=
 =?utf-8?B?KzdTdC9GaXV4Y25CaXp5TWRJZWpFbUlxTGMyS0pFZXNXSHhCaGRTOEh6OVRt?=
 =?utf-8?B?QWxzM1MrSEJwSDZHY0ZnV0tOOGt1aDZ5OWRJd0pMTGg5elFvR2ZWRi9VanFo?=
 =?utf-8?B?cFk0ZE1CZVlWZmVLUXhtTG9GaFVIcnp2M2RCQjQ0U3dqeThVMHQyRTlZVE5L?=
 =?utf-8?B?RWtSK3ZWNFlLQTBFYWpjSHZnczVUMkxVV2RrRjljbFRqU0Y4MUFHTUp0L0Zt?=
 =?utf-8?B?ejhMOG53emkrWEpMQ3IzSkFocndUMFl6V2xETUpld1ZPUVBDNnJTQzdTZjdJ?=
 =?utf-8?B?VFdqRHpwUUpjc3F2aER5cFd6VVVETThQTHJxWU1Ya1JuQnJsaXEyZ3dIWkRY?=
 =?utf-8?B?MU12S3lDSUV6d3lHS3lQZ2J0bmk0NjhCa1JScTU2RGVaSk5qMnR2Tk94MGN0?=
 =?utf-8?B?Wmo5aWRGTWRMZ0gvazVDRFluUjFUTkNUMjg5cUtTQXp6Z05hN1EvcDVWcmQw?=
 =?utf-8?B?YTJCMVRoNDd0bE4vY0QyVStFTE1xN3FxdjVkdzVYQm5JQ3pYUDJiNjdaQ0ZL?=
 =?utf-8?B?SVRmdmJQVXRjS2Fvb3U5SDUrSzFOdE04U0FVR0p4VC9EYUUwbVFobFAwWjFF?=
 =?utf-8?B?TW9qcXNUY3dNZHdlNk1TOEkrc1N3emh2Z2IwTm9LZUtseWVpYUo1aWtFRW55?=
 =?utf-8?B?TytlSW02WmxiS3hocmVQenBYaDRyVjhXWlM5bW5oZ21TdUYwSjU1cUZPbHMz?=
 =?utf-8?B?QTNSekM1ZThxOFQrOUgwNjB4Sk9ZWUxBOWZTSnlVYk5rck1IZzB6ZTVRdTQ0?=
 =?utf-8?B?a0ZpMlc5R3lYZ0FDUzB3ZGlwSCtoNnVOTG85enVxTjBTUWtzNUVMNlgwcGdK?=
 =?utf-8?B?NVAxU3VkeUVMVWdhc1UwYWZUN1hiQmYzbXorYm1YMVdPVENsdVVseXZvcHFT?=
 =?utf-8?B?Y1hGaVZ3WEZKc0s4dXFkTkU0bGVOdStpL0VsbHJ1TGMyczRObGRNcGdMZFQ5?=
 =?utf-8?B?MWhqMnlVWXBQT3ZJWEdERGdhQ3RvbjI4SE5MbW1UbjB5T3U3ejY2VUdocVJ3?=
 =?utf-8?B?WVd2ZUdFT0xGWGtFUDdiMmFrZUt6NlhIeHRBOGpBT24zSGJPNEIyMHJUR0l2?=
 =?utf-8?B?Z1V2ZU42emZIaXc2am9jd1RjK3VldkhEei9ncnM5U2pkZDZzNVN0QUVYYW94?=
 =?utf-8?B?cnplN0UxSGYvUHBMeUh0UitPOFN6UnU2Tkd0V0sxQ2sza1prOXd1NFpNWlUy?=
 =?utf-8?Q?Ga4g=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64786912-ab79-48b3-b49d-08de0299b2e0
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 16:27:08.9157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AB+8r8giJ0VrH/derkl6IFS3J7uzKabjU1CWTsaIB0fGJlUEvjo0eBvP1MMzN/hDbKb6BEwn4oHpTy3pEYYhfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11331

Add cleanup FREE defines for dma_async_tx_descriptor to support automatic
cleanup and simplify error handling.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Check patch report exceed 100 chars, but it's still better put into one
line to keep consistent with other DEFINE_FREE and better readablity

change in v2
- remove surpoiouse remove empty line
---
 include/linux/dmaengine.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index 99efe2b9b4ea9844ca6161208362ef18ef111d96..27fa1646a807c49c781e1bce9e3e7d9a3c66f41d 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -5,6 +5,7 @@
 #ifndef LINUX_DMAENGINE_H
 #define LINUX_DMAENGINE_H
 
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/uio.h>
@@ -1612,6 +1613,8 @@ static inline int dmaengine_desc_free(struct dma_async_tx_descriptor *desc)
 	return desc->desc_free(desc);
 }
 
+DEFINE_FREE(dma_async_tx_descriptor, struct dma_async_tx_descriptor *, if (_T) dmaengine_desc_free(_T))
+
 /* --- DMA device --- */
 
 int dma_async_device_register(struct dma_device *device);

-- 
2.34.1


