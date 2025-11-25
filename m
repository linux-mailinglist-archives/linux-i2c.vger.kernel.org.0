Return-Path: <linux-i2c+bounces-14254-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 910F4C840C5
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Nov 2025 09:48:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 778D54E14A2
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Nov 2025 08:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E993B2D2388;
	Tue, 25 Nov 2025 08:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IAiRNKiy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011012.outbound.protection.outlook.com [52.101.70.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D0818EFD1;
	Tue, 25 Nov 2025 08:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764060477; cv=fail; b=LyDzljMi3JSjJvweLwKOctRcSX1cLT9+Z1j/POjZnHkwoIeGSwTHt5cd9o99gsUVNUxuR2ScZUnwcWlDBNXFIsolxXt5Xz4f6fMCUtn435eGCRuVVg/PXzCbepPkp+31j+n9c1PO9gsp39fZJlCIk8pFmQN2Jff0ZeJWqKrZucw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764060477; c=relaxed/simple;
	bh=tZjF5fqyBBcz9PFNrrvO4MNeLxlSkG6Jea0ceQBClTI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=BymRLAGdOGQkLvZADU5E4kYnlto0DfuGVn2qPddMlXuMPYeP9+8oppHBOCwDJXEvqCDfbI1deaTwX7Ts1ZYutYJt3RRfany3lBDoOR4Ai6EtpagKl+TsPx5MBdT0/zsGrmMkWDkRav1DEHgsolZjV26XREs23bRlmEDB80m7Wdo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IAiRNKiy; arc=fail smtp.client-ip=52.101.70.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I7aJwdZCiPVcAfwYktZdnHGQ5xMlUon+lKw4zYxgCt/NQbRF4GU2B54Wa3nfVr70TcPHsTDmnoGiobtPhhF+I/FJsZX73mWIpyAvEes9FwYs+EuN1cL2kYy2bnxVUeR8/dLpc55b0qSA3Ub+mC7ba9gV+8IOam4Fnps9zJscaI+QU8piNWFZbFwzUAuHg2fBDOHC++nb09pkIT3xYBKFmoXlPy2ucJxwp56bZzWrwRtbes+BgXF+Hvrl+5pRR2i6KsU8rGyB9E091I/KE63pLpIsHwQjZ+nFF6zsZ2lv96P5k3McwFiDDfbGCtEErpIoDgKRRcIsuixtLN1dY4Ao2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fPHsgEviDcGBXc27dT+pBJbppyvUw+k3bobUCcjKu0k=;
 b=SjOVNlJuBo9IMEAw19lExBiZkhpULahcBH/HlbM3WHn4GrIM1n2nC1mNs7YWD2fNwt4JXjXLSr/LUs/D5h1tE8DKr6nQpjwb6hnmOpXmsrB8Z5jYGz3tYE5jMQM/XDIoagnZQSbDtkhEhRJjfp7Hxh6ZA734z0G366deg0kvDi2PAGVWuh2RmOIft7cXKze61Udt/RaVlOXcGFE+4zfN2xFcud5lQzM2oYsiyTvaf5OzpyzlFVkbVV/Mho/hazruPT+DoQjx2coDYGKPEtKj9iuOWYOMH/5wW5ZnT1TK1BFBa3vCOws+0Uhe0HqO0wOS81srRPjeZAaVYZyRvHyiIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fPHsgEviDcGBXc27dT+pBJbppyvUw+k3bobUCcjKu0k=;
 b=IAiRNKiyvIa5sjDPhxUszmcl4OSB2ZtUrdzAn+f1GE4ao0fNfR4s0tvkf7SNXUxYL6bN13gloNrGcrUWQCLS6UhZDWWN5/EZos8nq1uRfJvWMCj44oVN07XgslqX7wL6vGSkG01hgYIPLCNMcPLYkS0/z9N7fjjzcCR01tvzap2/m1l36ov8sHmXBO5yQ18/TTjNcE371jbVCV1V380hBkc+3pbkMpFh7QE5PBEEs+0KKZE7G3uKxHscgVx2tovEq+F4eGsBaPuo7ps9LE+kb4XoAdywJkjiv5YOQFWuMTyesCi0JyQED0CU63vOWS/vdRSQrldGIil31n9AYga3YQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by AM0PR04MB7057.eurprd04.prod.outlook.com
 (2603:10a6:208:1a0::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.16; Tue, 25 Nov
 2025 08:47:48 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%6]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 08:47:48 +0000
From: Carlos Song <carlos.song@nxp.com>
To: frank.li@nxp.com,
	aisheng.dong@nxp.com,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Carlos Song <carlos.song@nxp.com>
Subject: [PATCH v2] i2c: imx-lpi2c: Add runtime PM support for IRQ and clock management on i.MX8QXP/8QM
Date: Tue, 25 Nov 2025 16:47:18 +0800
Message-Id: <20251125084718.2156168-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM9P192CA0006.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::11) To VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11147:EE_|AM0PR04MB7057:EE_
X-MS-Office365-Filtering-Correlation-Id: bd88a5c6-5669-4abc-8e0b-08de2bff4f3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZXVjYVlpOXBtcmEvaUFYVHdsTmNSK3lmMTNWaS9BQnpvbWt6RjR4My9tVEFO?=
 =?utf-8?B?cUcxTGZWM0JYbC9DejdTalM4aHAzVWJVVFdGSHFuQVpHbG5CU3ZvdkFTRDlu?=
 =?utf-8?B?dUxNZ3dIR1p4WGpPUnZrRGZTWlZGZTkzUVZmK3JGcjM2SGlBT0RoMDNHWHVh?=
 =?utf-8?B?K01TMS9VSjhRczRaN1FkalJqNmZIbldySUpEdkhmVXNpbmxOYlpHaWZmcVlG?=
 =?utf-8?B?cDZPN0sxTGtVY3o1SUo4TDB4dnhnOVhuTzJJczZiSitzamRZRDAzR1dzMmJh?=
 =?utf-8?B?Vm1tcGp2TE9WVlZTaFVEdUloTXlodkQxVXgxcmdxN0h2T3QrVnFKSXdlTzY1?=
 =?utf-8?B?UzhCSWFBRXE4S1lzQTAvVDVpUVIydS94bTBKdkxSU3BBNTF1SGNHZWFJa1Y4?=
 =?utf-8?B?UXJTK1VsY3J6Q0x6bjU3dDcyRlc3ZzJKVzdNVHVNeGdoV2VQRDJkd3ZRem0v?=
 =?utf-8?B?czlleUZKd0JLMFdCRWpVSGhQTFJneHpvaUFpdjJuMmlSVWM1aFFLL2JrZ0VV?=
 =?utf-8?B?KzRQc0JQcmxFblRSRnlBa29rbEk1YlZPYUJYeFp2YjVMYlIrbWFLaXp6NExl?=
 =?utf-8?B?SSszc2hRYkprVHlkUDZJZVJwR2k3QU1nWkpON2UrQWg5SVphVkdacGNST3NU?=
 =?utf-8?B?RkVMQjBCV3BpVUs0ZUJkSDZBbEVjdHk2ZkRpN0t6SFYwcmNUTVNsUGp6c1lN?=
 =?utf-8?B?VGlSWjBzeXVEckpSR2laRFhWeDlCR3ZoRFp0MW90cTA1djlDbzFmVzhrZU1a?=
 =?utf-8?B?MUR6UjhaVEpUQkJQbGI4TjNWZjNJdDNDc3UrK2xMUmd4VjA0a3pPRStrdzlX?=
 =?utf-8?B?bmYzaHl1UHRORExia2tCbGI3QVRoQ0JMc2trNGlsS1ZiR09vOUIwMG1qSEt0?=
 =?utf-8?B?eE42U0NzaFBFUGRJazEyem5vOVNQbGROUWUxUU9sS1JJU2tORldONkY4U1Ns?=
 =?utf-8?B?N3RPZ2pmZGt0d3ZIbkRHaGFtQ2tzUW5Ydk14Q1NVWDFsTVQwYWRwMWNUbFdS?=
 =?utf-8?B?WW5iK1JjVzNJMG5WQnJ5Z3Y1NEQ3N2M1dWlnMW0rU2hMRkIzakZJVUE1aXN4?=
 =?utf-8?B?alRzZzd0TjY5NDB2SC80a0ZoQ0p1d2dVRk1pTldvdGc1anVSM0gxMElZem11?=
 =?utf-8?B?allPSW9BaUNNdXJmbkdZbG5RaE5NWThENk83bnZTdUMvcEpCNVJ1cTkxV3c3?=
 =?utf-8?B?ZVIxaldseWNyZWU0MFM0dlhwY2dldTR1RDNUakcyaEt6SEFaNUpoVUlTc3A0?=
 =?utf-8?B?V0VaeEF1L0hpNEhvMjJ4bGtXRUdMdGxoQkZuNnlMZU1lYjJSMHlLL3dnM05y?=
 =?utf-8?B?aVA4a3piTE5xT2JiMjQwWGl4S0k4Ymkzb0Rkc2Q4N3hPa0YzUUgwci94QlVD?=
 =?utf-8?B?ekN6cDRIWnVNeUhpaHhzNk1xRjRwWjlEQnVUTkJXV3BVQzk3djFBSWluRE1s?=
 =?utf-8?B?Z1pkT3R4WHJpOUNURU96U2xRcXh2endmNVc5V2dKRk0rSkxUckJ1QVlPaW0v?=
 =?utf-8?B?YmxubXcvRXR4OHEweVZ3Qm03KzRkUUxTYzR4eWxCb3R6OE1ERmV1SmhiQjBG?=
 =?utf-8?B?dTYyUUc1T0pIcnd6WGVMTmJ2VGNKWml5MVUyZDQwb3RqR2QvdWdwRjFMazZ3?=
 =?utf-8?B?a0JUK25QeXhqc0ZrZGxuOWZqS0p2cFJ3bUNhdmNjQzFHY3ZSUHlxeXA3ZlNz?=
 =?utf-8?B?N1JFK2FLSi9zL3k5UkxZcjIxb1FiVjZKVWNnVXdUeDQ0c0JKYTF0MzJESlh4?=
 =?utf-8?B?M0VIdGFRNDZ5YTJZbVYyNWZPV0EwaEJ2bVRKT041dTR2d0FGYlZ6UGtDNDhk?=
 =?utf-8?B?b3c1MktzUHJoK1pOSmIrTTJsNVIxK1p3Mmh0RmZ5UzhoT1dIMEYvYThDZ2JK?=
 =?utf-8?B?cUoyMUtKeCtKb29hRmsvWmh4N01kZENrYzRKNWRxVnRaYnFMVlBtZVZkckNn?=
 =?utf-8?B?SmlrYThMRlRLaDFlR0EwM1orckVjaEVBY0g3YXlKS0NMcGlXdDlNempMSUtq?=
 =?utf-8?B?M04xVDkzS3V4MnVIVzdKUnJMcGVhdjhianU3UG5iQU8vRTN3cmRnNkpYZ2tw?=
 =?utf-8?Q?oTTaCP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVJyUlJxamxKWXArRUdOajRmYWR5MStwNWN2cG5oakh6RFpLYkpwNkRVVWk2?=
 =?utf-8?B?UHRBTVVuU1BiVHN1enlBK0paUGJ4VHYyNXdBZmJua3M1aFpBeWc0amJnQnEy?=
 =?utf-8?B?ZlAybkdmTmliOWJsaGhzeC9KVkhIbVBlYmJuZnE3b1BHa1VjWjc1Z1hvcGlm?=
 =?utf-8?B?Q0ZKTExSbjFZVndBMGNidnFkcHh6eGRXbjBoTldLaDhzbUo1WjlRZ3NmRGRw?=
 =?utf-8?B?WkxsSTl3eEZQWi9oclJ0VThVbmgxUk1sWkJMaXlsc2Zub0taYjhvUXhDcERw?=
 =?utf-8?B?SmNjMW9JS0ZzbVpSdkV1eUw5ZUpZVVBlcnhOS3RUN3YwMzlhSGd3RWh3Qk5u?=
 =?utf-8?B?bm9vM1lMNjBCODVPcENHS2U5ekwwOUdhejduWG1MWUxBMW13ampjNUNJMS82?=
 =?utf-8?B?NTh4dmkwZTlxRDYwTzF2cUVRcnhzYWNnUy9xVVJseE0wOVc5azlIREV5NlBu?=
 =?utf-8?B?TGF4eUY4ams1b2swMkUyVnBTdWwwakRndVpOUUwyaE8yamo3ZVNzNUZOY3N5?=
 =?utf-8?B?REt0ck5uY3JhdkxmWVBENTR2NXFzNDBFRGcxWUZ4a1RrbTZEZjRzK2xHdkhn?=
 =?utf-8?B?YWVRc09pSmkzYmYwejlqeTZhNFJ2czFpQm9qYVB5U2ROY1NKbHV3RFFnQ2lM?=
 =?utf-8?B?NTNUMVc1cmJJTkdwWTNVRUFyc0pSVStEYkxGd2dKN2I4aTBVTitKWThiTkFj?=
 =?utf-8?B?NUdKMFVLV3cwNFdVUldFVWx0M3UxbkZsbUZ2Zk8yMjZXTXBNNzJBc1I2R0RS?=
 =?utf-8?B?VEVPS2o2LzBrai9Ec3hOSkIwNVNtVG1Uc2xMZlNYRVZlWDkwV3I1UHZiQlF6?=
 =?utf-8?B?dmhHb09aak9NU1ZzWE53Y3Z0Q1RZblFYSHRFQ2lwRGRJY3VzcUV0WDUwVnNs?=
 =?utf-8?B?TFFCV1g5ZGRIdGdzaS9CRVowVE1hY3FIRW1rWW5ObnNJVnRkSExsV1hZL1dq?=
 =?utf-8?B?bHZQcHYyS2ZHQkltNW9VNHJVTXdzYzU5dndZeGIwbER3VjVXbS9CQjBiSXc3?=
 =?utf-8?B?UHpxYk4wTU9VUzJkdlBmOVNmUUtMZS9uT3RmWGJ3aHczREU0WndWUFFyQTRa?=
 =?utf-8?B?dUc4aXFlVnBQVGdEWW01ZmlBWm9JSnVWNmV6NVdLTGRSNVV6ZE0rcjE5YWNT?=
 =?utf-8?B?TXFySkRtUy9kZ01YVHN2cXdINmdrNVVlNEtUaVpVVXBPcHVTenFxMFM2K2s2?=
 =?utf-8?B?VjJlZTlYTWVXbW03aG95WmY2SWthbzhzRThXYTNEOXIzTWlrb0pGeEU2OUdv?=
 =?utf-8?B?Kzl6NHhQMGlFQlEzSXhUZ0xweUtmbit4WjRKclJBTnJzbUJCbzN2MmdBaXpL?=
 =?utf-8?B?UW5lc1FwNW5sS2NSTGFndGxnOVFQeEYwV0dJc3hDYm1LODk1RUlSKzd0M0hx?=
 =?utf-8?B?NnBEc2IwNXBoQUxIOUZCQ2Fma0VsNWRYZkRwbTRvVS9qTnRUL3k3Wi9pczhD?=
 =?utf-8?B?V0Z4TzZGSlRPT3h5WEZaSHMwa04zZE5Ed1hsd3VreHJMdlRUQ2IvYlhlZTcy?=
 =?utf-8?B?V0o2QkVCWFhBalhPVFJUQkxNcHg3bHRuTERpSU04YXdyZWV5ZEJTMWcxS3JR?=
 =?utf-8?B?QWV2dmQ1OG9XQ29tZ09KSjlJcTYvN1dwVVBnYzd6UFlWSHRKNTJuQmhYSWJw?=
 =?utf-8?B?Tm1CanhpTThGRE9KLzMxcmN0Nk4yblVsRmd4TE9YOFcvQjg1M0UxYWxvS0x3?=
 =?utf-8?B?Z2hDOFZxaCtFVGZ5aStONjBmUThQYnQyRElNZ21xSUZaY0tSVU02S3RvdTMr?=
 =?utf-8?B?WE9kTng1Y25jNmxEZU14cWx0NGF3dm0xUVZzNG9keDVUS3orSWRVZFB0bDFu?=
 =?utf-8?B?SEVDYzJ4QzRwVFY5alBJMGlqb0ZDRm5UalJXOWFzNGNXaE5icGw0d0dBTytR?=
 =?utf-8?B?WXZpeHN4bGdWUHpuZVFqVTRCaHROWDNEdWppaUpzOTNXVkZJSGI1cFkvTkpN?=
 =?utf-8?B?cHdPN2M1VmlhMWlPMlhZRlplTlJlcWE2MjY3N1NJakVzT1NlNTBwc0daOEJD?=
 =?utf-8?B?QmV5RTlNOGF3dGw0c0g5UkJNaEhNeFhheGtnK3d4dmpXUmhpeWh4di95YlRB?=
 =?utf-8?B?STE4UkRPeHBaQWRidHBFbmxPTld2cTd5SzNYb3lueEVJM0VnZE9ZMEg4NFRm?=
 =?utf-8?Q?3nQa5HS6QRKXDg/pwHaYPJwT1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd88a5c6-5669-4abc-8e0b-08de2bff4f3d
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 08:47:48.4416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mf/MErFeb0UKHM3uxIYsUmAd7WLUrY5KZ4+Cfd8qlMjAXzYykfKu0ZA+fqnsHe+BkxlylAG1IADWW9lJMJOjfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7057

On i.MX8QXP/8QM SoCs, both the lvds/mipi and lvds/mipi-lpi2c power domains
must enter low-power mode during runtime suspend to achieve deep power
savings.

LPI2C resides in the lvds-lpi2c/mipi-lpi2c power domain, while its IRQ is
routed through an irqsteer located in the lvds/mipi power domain. The LPI2C
clock source comes from an LPCG within the lvds-lpi2c domain.

For example, the hierarchy for lvds0 and lvds0-lpi2c0 domains is:
┌───────────────────────┐
│ pm-domain : lvds0     │
│                       │
│    ┌──────────────┐   │
│    │   irqsteer   │   │
│    └───────▲──────┘   │
│            │irq       │
│            │          │
└────────────┼──────────┘
┌────────────┼──────────┐
│        ┌───┼───┐      │
│        │lpi2c0 │      │
│        └───┬───┘clk   │
│   ┌────────┼───────┐  │
│   │       LPCG     │  │
│   └────────────────┘  │
│pm-domain:lvds0-lpi2c0 │
└───────────────────────┘

To allow these domains to power down in system runtime suspend:

- All irqsteer clients must release IRQs.
- All LPCG clients must disable and unprepare clocks.

Thus, LPI2C must:

- Free its IRQ during runtime suspend and re-request it on resume.
- Disable and unprepare all clocks during runtime suspend and prepare
  and rne ble them on resume.

This enables the lvds/mipi domains to enter deep low-power mode,
significantly reducing power consumption compared to active mode.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
---
Changes since V1:
* Add unit for I2C_PM_LONG_TIMEOUT to I2C_PM_LONG_TIMEOUT_MS
* Reuqest lpi2c_imx->irq uncondtionally
* Remove help function and direct put code in original
  lpi2c_runtime_suspend() and lpi2c_runtime_resume()
* Give more comments to explain why prolong PM timeout
---
1. Why not apply prepare and unprepare clocks management for all platforms:
As the report from me early:
https://lists.openwall.net/linux-kernel/2025/07/01/139
Scope of global prepare_lock is too big, it will cause dead clock
between RPM and prepare_lock in some specail case. But clock
prepare/unprepare is also necessary for low power consumption in I.MX8QXP
and 8QM, so I add separate clock management for these platforms to
avoid impacting other I.MX platforms. But it's possible that some
customers might encounter deadlock issues in IMX8QXP/8QM, so I prolong the
runtime PM timeout for 8QXP/QM platforms, which is currently a suitable
workaround method I think.

The dead lock happen as below call stacks

Task 117                                                Task 120

schedule()
clk_prepare_lock()--> wait prepare_lock(mutex_lock)     schedule() wait for power.runtime_status exit RPM_SUSPENDING
                           ^^^^ A                       ^^^^ B
clk_bulk_unprepare()                                    rpm_resume()
lpi2c_runtime_suspend()                                 pm_runtime_resume_and_get()
...                                                     lpi2c_imx_xfer()
                                                        ...
rpm_suspend() set RPM_SUSPENDING                        pcf857x_set();
                           ^^^^ B                       ...
                                                        clk_prepare_lock() --> hold prepare_lock
                                                        ^^^^ A
                                                        ...

Task 117 set power.runtime_status to RPM_SUSPENDING (A) and wait for task 120 release clock's global prepare mutex (B).

Task 120 hold global prepare mutex (B) and wait for power.runtime_status finish suspend (A).

So if RPM doesn't enter auto suspend too quick after hold prepare lock, this dead lock can be avoided.
So I prolong the runtime PM timeout, it can ensure that LPI2C does not enter auto suspend mode too
frequently. It has been verified valid for the above case.

2. Low power status report
Power domain status can be shown in pm_genpd_summary and sc firmware. Take
8QM platform lvds0 and lvds0-lpi2c0 power domain as example, before apply
this patch set:
root@imx8qmmek:~# cat /sys/kernel/debug/pm_genpd/pm_genpd_summary
domain                          status          children        performance
    /device                         runtime status               managed by
---------------------------------------------------------------------------
lvds0-lpi2c0                    on                              0
    lvds0_i2c0_clk                  active                      0       SW
    56243014.clock-controller       active                      0       SW
    56247000.i2c                    suspended                   0       SW
lvds0                           on                              0
    lvds0_bypass_clk                suspended                   0       SW
    lvds0_pixel_clk                 suspended                   0       SW
    lvds0_phy_clk                   suspended                   0       SW
    56240000.interrupt-controller   active                      0       SW
sc firmware will show the power domain status:
>$ power.r
    LVDS_0 = on
    LVDS_0_I2C_0 = on

After apply this patch set:
root@imx8qmmek:~# cat /sys/kernel/debug/pm_genpd/pm_genpd_summary
domain                          status          children        performance
    /device                         runtime status               managed by
---------------------------------------------------------------------------
lvds0-lpi2c0                    off-0                           0
    lvds0_i2c0_clk                  suspended                   0        SW
    56243014.clock-controller       suspended                   0        SW
    56247000.i2c                    suspended                   0        SW
lvds0                           off-0                           0
    lvds0_bypass_clk                suspended                   0        SW
    lvds0_pixel_clk                 suspended                   0        SW
    lvds0_phy_clk                   suspended                   0        SW
    56240000.interrupt-controller   suspended                   0        SW

sc firmware will show the power domain status:
>$ power.r
    LVDS_0 = lp
    LVDS_0_I2C_0 = lp
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 84 +++++++++++++++++++++++++-----
 1 file changed, 71 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index dfacb0aec3c0..41ad82595583 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -132,6 +132,7 @@
 #define CHUNK_DATA	256
 
 #define I2C_PM_TIMEOUT		10 /* ms */
+#define I2C_PM_LONG_TIMEOUT_MS	1000 /* Avoid dead lock caused by big clock prepare lock */
 #define I2C_DMA_THRESHOLD	8 /* bytes */
 
 enum lpi2c_imx_mode {
@@ -149,6 +150,11 @@ enum lpi2c_imx_pincfg {
 	FOUR_PIN_PP,
 };
 
+struct imx_lpi2c_hwdata {
+	bool	need_request_free_irq;		/* Needed by irqsteer */
+	bool	need_prepare_unprepare_clk;	/* Needed by LPCG */
+};
+
 struct lpi2c_imx_dma {
 	bool		using_pio_mode;
 	u8		rx_cmd_buf_len;
@@ -187,6 +193,21 @@ struct lpi2c_imx_struct {
 	bool			can_use_dma;
 	struct lpi2c_imx_dma	*dma;
 	struct i2c_client	*target;
+	int			irq;
+	const struct imx_lpi2c_hwdata *hwdata;
+};
+
+static const struct imx_lpi2c_hwdata imx7ulp_lpi2c_hwdata = {
+};
+
+static const struct imx_lpi2c_hwdata imx8qxp_lpi2c_hwdata = {
+	.need_request_free_irq		= true,
+	.need_prepare_unprepare_clk	= true,
+};
+
+static const struct imx_lpi2c_hwdata imx8qm_lpi2c_hwdata = {
+	.need_request_free_irq		= true,
+	.need_prepare_unprepare_clk	= true,
 };
 
 #define lpi2c_imx_read_msr_poll_timeout(atomic, val, cond)                    \
@@ -1424,7 +1445,9 @@ static const struct i2c_algorithm lpi2c_imx_algo = {
 };
 
 static const struct of_device_id lpi2c_imx_of_match[] = {
-	{ .compatible = "fsl,imx7ulp-lpi2c" },
+	{ .compatible = "fsl,imx7ulp-lpi2c", .data = &imx7ulp_lpi2c_hwdata,},
+	{ .compatible = "fsl,imx8qxp-lpi2c", .data = &imx8qxp_lpi2c_hwdata,},
+	{ .compatible = "fsl,imx8qm-lpi2c", .data = &imx8qm_lpi2c_hwdata,},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, lpi2c_imx_of_match);
@@ -1435,19 +1458,23 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	struct resource *res;
 	dma_addr_t phy_addr;
 	unsigned int temp;
-	int irq, ret;
+	int ret;
 
 	lpi2c_imx = devm_kzalloc(&pdev->dev, sizeof(*lpi2c_imx), GFP_KERNEL);
 	if (!lpi2c_imx)
 		return -ENOMEM;
 
+	lpi2c_imx->hwdata = of_device_get_match_data(&pdev->dev);
+	if (!lpi2c_imx->hwdata)
+		return -ENODEV;
+
 	lpi2c_imx->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(lpi2c_imx->base))
 		return PTR_ERR(lpi2c_imx->base);
 
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
+	lpi2c_imx->irq = platform_get_irq(pdev, 0);
+	if (lpi2c_imx->irq < 0)
+		return lpi2c_imx->irq;
 
 	lpi2c_imx->adapter.owner	= THIS_MODULE;
 	lpi2c_imx->adapter.algo		= &lpi2c_imx_algo;
@@ -1467,10 +1494,10 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	if (ret)
 		lpi2c_imx->bitrate = I2C_MAX_STANDARD_MODE_FREQ;
 
-	ret = devm_request_irq(&pdev->dev, irq, lpi2c_imx_isr, IRQF_NO_SUSPEND,
+	ret = devm_request_irq(&pdev->dev, lpi2c_imx->irq, lpi2c_imx_isr, IRQF_NO_SUSPEND,
 			       pdev->name, lpi2c_imx);
 	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "can't claim irq %d\n", irq);
+		return dev_err_probe(&pdev->dev, ret, "can't claim irq %d\n", lpi2c_imx->irq);
 
 	i2c_set_adapdata(&lpi2c_imx->adapter, lpi2c_imx);
 	platform_set_drvdata(pdev, lpi2c_imx);
@@ -1493,7 +1520,11 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, -EINVAL,
 				     "can't get I2C peripheral clock rate\n");
 
-	pm_runtime_set_autosuspend_delay(&pdev->dev, I2C_PM_TIMEOUT);
+	if (lpi2c_imx->hwdata->need_prepare_unprepare_clk)
+		pm_runtime_set_autosuspend_delay(&pdev->dev, I2C_PM_LONG_TIMEOUT_MS);
+	else
+		pm_runtime_set_autosuspend_delay(&pdev->dev, I2C_PM_TIMEOUT);
+
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
@@ -1548,8 +1579,16 @@ static void lpi2c_imx_remove(struct platform_device *pdev)
 static int __maybe_unused lpi2c_runtime_suspend(struct device *dev)
 {
 	struct lpi2c_imx_struct *lpi2c_imx = dev_get_drvdata(dev);
+	bool need_prepare_unprepare_clk = lpi2c_imx->hwdata->need_prepare_unprepare_clk;
+	bool need_request_free_irq = lpi2c_imx->hwdata->need_request_free_irq;
+
+	if (need_request_free_irq)
+		devm_free_irq(dev, lpi2c_imx->irq, lpi2c_imx);
 
-	clk_bulk_disable(lpi2c_imx->num_clks, lpi2c_imx->clks);
+	if (need_prepare_unprepare_clk)
+		clk_bulk_disable_unprepare(lpi2c_imx->num_clks, lpi2c_imx->clks);
+	else
+		clk_bulk_disable(lpi2c_imx->num_clks, lpi2c_imx->clks);
 	pinctrl_pm_select_sleep_state(dev);
 
 	return 0;
@@ -1558,13 +1597,32 @@ static int __maybe_unused lpi2c_runtime_suspend(struct device *dev)
 static int __maybe_unused lpi2c_runtime_resume(struct device *dev)
 {
 	struct lpi2c_imx_struct *lpi2c_imx = dev_get_drvdata(dev);
+	bool need_prepare_unprepare_clk = lpi2c_imx->hwdata->need_prepare_unprepare_clk;
+	bool need_request_free_irq = lpi2c_imx->hwdata->need_request_free_irq;
 	int ret;
 
 	pinctrl_pm_select_default_state(dev);
-	ret = clk_bulk_enable(lpi2c_imx->num_clks, lpi2c_imx->clks);
-	if (ret) {
-		dev_err(dev, "failed to enable I2C clock, ret=%d\n", ret);
-		return ret;
+	if (need_prepare_unprepare_clk) {
+		ret = clk_bulk_prepare_enable(lpi2c_imx->num_clks, lpi2c_imx->clks);
+		if (ret) {
+			dev_err(dev, "failed to enable I2C clock, ret=%d\n", ret);
+			return ret;
+		}
+	} else {
+		ret = clk_bulk_enable(lpi2c_imx->num_clks, lpi2c_imx->clks);
+		if (ret) {
+			dev_err(dev, "failed to enable clock %d\n", ret);
+			return ret;
+		}
+	}
+
+	if (need_request_free_irq) {
+		ret = devm_request_irq(dev, lpi2c_imx->irq, lpi2c_imx_isr, IRQF_NO_SUSPEND,
+				       dev_name(dev), lpi2c_imx);
+		if (ret) {
+			dev_err(dev, "can't claim irq %d\n", lpi2c_imx->irq);
+			return ret;
+		}
 	}
 
 	return 0;
-- 
2.34.1


