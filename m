Return-Path: <linux-i2c+bounces-13383-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B07BB78AE
	for <lists+linux-i2c@lfdr.de>; Fri, 03 Oct 2025 18:27:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BADC819E82B0
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Oct 2025 16:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 193BF2C1594;
	Fri,  3 Oct 2025 16:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HS1E6rSg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011000.outbound.protection.outlook.com [52.101.65.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39F42C0F83;
	Fri,  3 Oct 2025 16:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759508839; cv=fail; b=I6yuakgPCdnFHW4SkQCjJqiAEaaaWKlTHs8XS0t4+vZE08ZHr9mll9siTptTG0nuhwsvkCXr2XnUX1j5edWUhadPTojVAiNbN5KRPzhpAixgheiuqbkm8hAergguyjKsGIzVeTqWuz4e9xbJH13870mf4SyruU5jT2dqKbTmXHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759508839; c=relaxed/simple;
	bh=SaQA9Z1PTlapn8T0WD8reaoNXxjNIKnuysE22k0bANQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=tWgpT0/6ijvxK88cO8dFWys9XeS/qaE00e5rLaFNx247rDZQ2MZxJ25qfEvoLEVDaY0VmSxBcSxWN4k35wHz6K0nRVuBjE+DFw0oLsvQpKFn0DZYS5CNT/DpTZpWPa3nqC+dsHUPxlVH2ZFaiu1OYv/9ynnh+xewX+8PCLZWSd8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HS1E6rSg; arc=fail smtp.client-ip=52.101.65.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E9idRlY0jnhIRqgbtE3wegya5bwW5z6/fDwjq+DtER4jxl3pnYMGUF7jlrBVFYs5QGIr2PmgoyzbicUJskeBTq11KqGj38AHmA8SatfvtlyV7YYp5JshnDco7jumyFv7mBgG9/BYm2WAaOWZVvaLXSIVaB4YrNonPLOK70mHT62dILplgeGwHW/cW17zmY/D9wbvMQdvgkGQqnDf+Kj23lDLBg+7EyieiZJPwoXxUIVEZIHmx09w30uTldWZCxCE8SHg8J4wEY1F+sF49WiuSIPHT16YWkYjai9DJrMmBL+OJHlpUqdzIfiC/GmzgA+SHRc61RlutanEMRmHsdPA6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W1ICyumX0utPJIsMiDNQXNuSTbzDe+AJiuhGyKqsock=;
 b=CbI20h4Srg18abyqAlwYvKLm0+675Rjy365NxrmT5XCgBdygwdZB914Er4dEC3vHbncDHkBYzM+wdYCiBwl7nW6tIBsy4EriV8i4/elyAbjnXSyy3uN4mBpKHcniQMhE3/o/IP3nuBb61MItYOICnN8IvC4dXJzE0gWjI6CT/t2TMZOfXK54euORflWDgcs4KyZmRiazYUqHYxFD5hCm6VLXN7n8CpXFSn09VJkgxKV6kcqkRx1U8YPFsbmYRtOC++FfEsMXQIcoJdHybJ447hXNcveWVdwz0DO6vGKF5Fi2Vn3KEzC8xGnbRZel4UkyLKbdtovhWjjDA89XURMHbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W1ICyumX0utPJIsMiDNQXNuSTbzDe+AJiuhGyKqsock=;
 b=HS1E6rSgEaBXm38hmmAJkhFAB0LJDbwGDzG5InJoxhnsQrp+x90yfYOz+D0jwt77tS9SVpYc6XWyuSTpe25+Ofk6/KN4gMhSe35fJDFxGrwYqn3nQC9ZZotwFqy2TswVFoItJb80JP86X+nUpLi/tL7DkEKK3vFrTIExsqDnn0CBLSLvBfs/vspcT5x2nhKBCP9rv4CspLlAfefp7Hf7r0Mas5NqQ1fMcaK+tlcGuKnbEBYDr3wWySwx7qTX8226ymizWYAKf7lcyWSaJeG+OZUxeGqC91Acg2q062F/0l3r37vf+tjML7a/GxHGfFcZJF7M+NDusWrRWqN2m9YVpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by GV4PR04MB11331.eurprd04.prod.outlook.com (2603:10a6:150:29e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 3 Oct
 2025 16:27:12 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9182.013; Fri, 3 Oct 2025
 16:27:12 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 03 Oct 2025 12:26:50 -0400
Subject: [PATCH v2 2/2] i2c: lpi2c: Use cleanup helper for
 dma_async_tx_descriptor error handling
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251003-dma_chan_free-v2-2-564946b6c563@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759508822; l=2331;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=SaQA9Z1PTlapn8T0WD8reaoNXxjNIKnuysE22k0bANQ=;
 b=eR0X+LqzODQACd8lRIuHUEAxGelyMP2MoWQdutv12jcBdQqjW9Y3XN+YOK37Zo84SOUfS5GAp
 KjuWlVVhf7nBWgoJ0HS8v627w/vP/HyL5N4APXe3jGSS0pr0PQxg1gj
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
X-MS-Office365-Filtering-Correlation-Id: 332425b5-5320-487a-1d27-08de0299b4f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|19092799006|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q0dGN1NuQlYxcHgwbkRmbXp1REt0YnpOS0k1L2FGK2Fkbk1HWlFzNUlWZGVp?=
 =?utf-8?B?b3YvZE81UUxaUUwyVEZaS1I2bXgzekhZVVhFdXc0OE12ZU80UmhQaTdKN1hK?=
 =?utf-8?B?NXJGSm5rOVJRc2VPeXpZWEdKNDc0Wjk0djBacWtraHNPQWhud1Q0UjQ0dEFQ?=
 =?utf-8?B?ejAvSzRjR1dFWWczNTJlcmtHSWJVaUUxcFFENllac1JkNHRvek53amJhbXFJ?=
 =?utf-8?B?VTdwZUY2M0pKM3hPYysxbGRzSmZYMkxubkw1bkZPd2ZhaUdwV2kyN3loNCsz?=
 =?utf-8?B?MlhFc3RzM0ovOEg4eWtLa1JtNjJlblg3RlpjaEQ3TkVrNnZ2STkrNUNoVTQr?=
 =?utf-8?B?bnpRMU9zeWxkejRKQWdNb25WcWdJTTY3Y2xLVDRGT25oVDFCYXJtYjdYZ0Zn?=
 =?utf-8?B?WlEvU3Q5T0Uzc0x3d2MxaUJEK05BNnhXb3dyUmdvK1gvNHRLVVBZb3pRcVZB?=
 =?utf-8?B?YnJCQko5SytFNEhSTFg2M2R1eTNMN1hackhtaVpYZmxwelN4WHcrUHlCajZq?=
 =?utf-8?B?NlozRm1NWndBeFhhdHVzQkNxWW5TNlFlS3NSbGo2ZFc5aVNncVdJK29OT2NY?=
 =?utf-8?B?QW9KVDgxanJocS9yTldINHNIOXdCZldMZllpc0tsQzByQytqbFg4ZXBLQmpv?=
 =?utf-8?B?ZGluS21mK3VwdWJlMzdpWURBbWVvTG96REgvd01MaTJubTlML1Z3c2Z2RmR2?=
 =?utf-8?B?ODlxS29VQm1aMENvdWo2czh2TUZtTjF0MHphMmZEc21hWU5ZRWdYRFQvSzRo?=
 =?utf-8?B?RTVpelJQRjNoZ2g1YmFTakFTc2U3dkdTOGlKdk1FcTg1WTlRdmVWNHR1dndz?=
 =?utf-8?B?eWVWWElEQU5yRmo2dG9FYlB4RDNMdURRNjJiK1Mvd29YdFliZVl2MmJmOTJE?=
 =?utf-8?B?ZkN5dGIxRFhtdHpHQ0lOdE4wTW9yQUMxMDdpWGhYK0hiSzNlRzk4K2lnOHJl?=
 =?utf-8?B?ZTNid3E5YjZLWU1mcUp0YnNtQXFVY2RIODNzdHdEYm5Cc3krMHZqMWtIcGgw?=
 =?utf-8?B?SUN3SjR2K252cGQxQmdzL2NkSHNBUzQxdnRERDFjc3FCSjM1Z0NPSm15dEsx?=
 =?utf-8?B?MnhFVlFucitKdWtDTU1UT0VuUEtwT0hYU1hJb2NJdjdsbnR2NkFlTjZiZWFh?=
 =?utf-8?B?dTlQV1QvOWVlNC9SRGtRT0Q4N0xDSGZuZjJObmpoeEd2NUJRMjZrc1hyUXhM?=
 =?utf-8?B?NWlXMVJTa2VjZC9kY2lFclVFTWJtN1RyYlR1QUJhYXJrcHRyK3BBV0RjY0dh?=
 =?utf-8?B?SkU1RXJmbjBQNVdmNytKQ1lwUEpHZVU1MEo0OUk2S2kxRVFRNnRPQ0d2ZHY5?=
 =?utf-8?B?RlQyNTVPbTJuZFVjUjVxa0oxU05QN054dE1pcEZYT0VRZkhiM3ltNmZQTWlv?=
 =?utf-8?B?Y0wyVVRmMmV4RXUrc3VUYnZnbDhVeGt6M3pub3JoV2tDTE83Uk1Mb2hhTzNp?=
 =?utf-8?B?N1NHRTNPUTg2MGVTT2wxenBtc0d1OFRTMHNxOWJBaGc4VTZTSlFnM1ZtSUtQ?=
 =?utf-8?B?ZmIyR0hRakVldThTdDArQjFMcmtjMXNRclREbjIyMWJTdkdoWkR6RVNyM1Vj?=
 =?utf-8?B?OHRQTENxRktVdWRzbjlHNXVsL0FWVlh0SjZGTXJ2Nklrc053cXFQT0NVb2Ni?=
 =?utf-8?B?YzBYcUVUMlBLTDhyL0xIWFZ1MzI2NkJPeFZJS1ZheW5NTlVNL2RVa0NjWXRO?=
 =?utf-8?B?T21PMXNjQnhFQVNRNGhKbjJQdUJ6SzA0VHVURzVkT3FlMUN3dFBiMytjZWJY?=
 =?utf-8?B?Z1owNmF0d1p6Y0syeTh2dDFoNTVHZlExSDlXYjhhMHV1ZXZNRDY3TnEzWUJC?=
 =?utf-8?B?c25kRjdEb2svdVFTSjZDUjlUa0xhOHB0MVhpVklmeXFzck9LcGpveFYrWStS?=
 =?utf-8?B?MmJScDdWTFpTb2trZi8rMklOYmtrbDNEMFhxWVd1enFZN1V5VHlVQ0RDNy9G?=
 =?utf-8?B?QXhLNzJlc1IvZExXWTRYSHptek1nQlJZTGJZS1hIZEtJMXNTWHdVMk83RUVB?=
 =?utf-8?B?K29BUzJCRXpaTWVBdlJ0alFQT1hobDdQQkxqZEg1TGxEaGZZQ3RjYUFnSFgw?=
 =?utf-8?Q?JSaPtR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(19092799006)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkxzdEt5ckd0VjM5R2ZmSEo2TXRsd0xXNkNwb0ZEckxTRVZXME4yaDR6TVNJ?=
 =?utf-8?B?cWpqZVA4dzZoY3dYODcvYjBKVlhFUlBkZzF2TEZoTW5hWXJJN3BoMlpibldj?=
 =?utf-8?B?NkhGYStNek5CWEJ1VUFMSlA2dzVlVnd0MTZXSmpUQ0xVOVVVc1JIbXY1ZHRR?=
 =?utf-8?B?Y0hwblhyMWNWYXdSeGI4eW84eFhSblllbFNnSGliaHFNMkpQSDFEMDVoV3lq?=
 =?utf-8?B?OFphMFNiOTkzQjlrWWlEd1lheDdSVERWdWFyZUlQYkgzVU9aU0dmWnQ0U2tZ?=
 =?utf-8?B?NWZGbjlqOUdWdTJWVzJxNVlCM2FwNW4zRWVHNnowbzJ5c1V6K0Q2VGovb2pn?=
 =?utf-8?B?cGYyY09tTHg5MkttczFHVkM3N2ZHZ2pNZE9QZ0Q5MG9KNEIvVGhPdHQrQWl0?=
 =?utf-8?B?WVJjb3ZxK3NGMmVOK2pFRkZyaHJlR3FFRjhsL09kbmY5c2pLMERvZStHek5o?=
 =?utf-8?B?eW9MNWVBRDlRSEN5STN6MEx2eGFzZnl4cDNMSFF5WEZMY0lwTWRGYnR1Y1dI?=
 =?utf-8?B?SzE1TlcwQkJQaUk3S0VTSjBlNEJjdnFXRWZOUXlJMUVDcEhJeS92VWFNWHFh?=
 =?utf-8?B?NFZqQ1MzVG5POE5JRm02L0czT1hYTDZkQVB4b0w0amMwZW1rY3lsQ1ZHb3Z1?=
 =?utf-8?B?Yk10cENQZ0dVQW9HWXF5cXl2bzcxaW0rSWtvYnJ1VUdXTHQ4SzE0U1hjdnA1?=
 =?utf-8?B?UmsrWnBGMzBFNis1Sjd0a1VyWjE3NEtWcVExalF2NFJQakJGbEgrWjFKT1Va?=
 =?utf-8?B?WndyYW5hY3VJaGttWXZLMzhLQVQ2ODFzY2Z6NGZTY2s2ckYzSDRuL1A4alll?=
 =?utf-8?B?b2JUelh4TzdjMXJOZllxc2Z3TnM1RTUyaFdGV1JMQVY0MHY5eVpZVmFreS9w?=
 =?utf-8?B?bFNUOW5YVzFkMTJyZ0xmVlhOR0xua05uOE13RXhlSUg2TndjL2dHLzlPaHdG?=
 =?utf-8?B?czJOems5R1ZvUWJKQjJzT24vWDRFdEVpNFlYT3pyVE5aaXlJVHRJa2Z5U3Bw?=
 =?utf-8?B?Nzc1VEJOa21KOVhkVWtpRXJwQ05ITkFubGlHRmN0WXNObmkwZkVlU0p1TE1N?=
 =?utf-8?B?NGNpaDhqMUcvTDFOd2FpQUlOQmFybXJ1Y09JcXJRQ3RtS0V4L0thL3NRZi9y?=
 =?utf-8?B?RlUvaDNScGF5aFpxNTV6YncyN1FpZDJrK0ViV1pxS201OStYOWd3Y09DWUhn?=
 =?utf-8?B?Y0E5Z29UeEtDWkFTMnI5YkYzTXZQbWpRdVpmc1JPYTVVU0I0MEg1dnhtTVhV?=
 =?utf-8?B?Z2FEU0NpNDlzM3JHalI3ZkxuRExPNnZGU2VwSllEVHVnYWRZTm9wWHVqdWxH?=
 =?utf-8?B?M0FrZHlZYUQ4TElWTGNsc0Yva2FPZHpwQk93N0pRNHpsMlUxNC9ibU1kWWJI?=
 =?utf-8?B?QVVScFlsSHR1c0ZEQityUUVzSVptOFFSRGNUTXpkM1ZuTi9waDNXV2szMVlT?=
 =?utf-8?B?TURNM1RqNEdDZ1V6cEo1YkpqVGVaTWM2ZG1reitudUlwRTF5L2xSUEdKT3Za?=
 =?utf-8?B?cHJmSFRkSnlqMFB2Q0o5elRQYmdNejh3K3F1elZ6L3ZpTVA3d0JoVjB6WC9D?=
 =?utf-8?B?NDRycnZqZTJxZkJsdVQ5b1k3Y0RoQTRhSGtSUEVWQzZhalVVYUhQTFIwVG9P?=
 =?utf-8?B?ZWVUVUU0TkhPU09ma21qZWdRRjA2UzRDaktxYWdZK0tiVlpJdlRON1JSVEh5?=
 =?utf-8?B?dXlPOU00YVgyRjgwWTVxSzBhZkY2UjF0WlVvMzhRek5TMUpxcTN0SWpoV0Jz?=
 =?utf-8?B?elR3UnRibGpZRHc3bFNSTXF4VDZ4ZEpmUFk2TmxaOGh5N1IvTkFUeFdEbUwx?=
 =?utf-8?B?UzN3S0Foa1owekkzNk00NFNNanFXUmVBOHpFaGRWMWl0cEZDLzZoSURpUHFX?=
 =?utf-8?B?NkduVHV0ZlowM3NMMHlTbHhwRmVBU2pvZHFEa3BvQnJTR2dFZ2VWY1R4UENx?=
 =?utf-8?B?bjJHQ2xkQXU0elUydjBveUxrRWRZck50bWlXZm1SZEd2S1o0bW1meGdFOUFR?=
 =?utf-8?B?QjhoNFgxc2kvaWFKSlBsdUJaWjFaYVNUNTVJMVpHV2d1UC8xYzZTUUx5TWV1?=
 =?utf-8?B?d3NDVmRoLytLMGFxZ3d0eWVsajZCaDdoYmJ6c3AyQXZHVnNkbFNPYnk4cUVX?=
 =?utf-8?Q?f0p4=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 332425b5-5320-487a-1d27-08de0299b4f1
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 16:27:12.3777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TcSqVunmfqza3kTYdrrvdbD3DguVBHhVvv6EcEXCwGXumzWQD5Pa6UaWLRRlkOujiUg2pSBNzrUOin08VPcq+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11331

Use the cleanup helper to simplify dma_async_tx_descriptor error handling.

No functional change.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change v2
 need goto unmap buffer.

desc_prepare_err_exit:
        dma_unmap_single(txchan->device->dev, dma->dma_tx_addr,
                         dma->rx_cmd_buf_len, DMA_TO_DEVICE);
        return -EINVAL;

submit_err_exit:
        dma_unmap_single(txchan->device->dev, dma->dma_tx_addr,
                         dma->rx_cmd_buf_len, DMA_TO_DEVICE);
        dmaengine_desc_free(rx_cmd_desc)

auto cleanup by __free, so whole error path submit_err_exit can be removed
and use desc_prepare_err_exit label.
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 03b5a7e8c361abe1d75fb4d31f9614bbc6387d93..e31c2d81f59f18a09d34f79896a7fa4bb83c0a12 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -722,7 +722,7 @@ static void lpi2c_dma_callback(void *data)
 
 static int lpi2c_dma_rx_cmd_submit(struct lpi2c_imx_struct *lpi2c_imx)
 {
-	struct dma_async_tx_descriptor *rx_cmd_desc;
+	struct dma_async_tx_descriptor *rx_cmd_desc __free(dma_async_tx_descriptor) = NULL;
 	struct lpi2c_imx_dma *dma = lpi2c_imx->dma;
 	struct dma_chan *txchan = dma->chan_tx;
 	dma_cookie_t cookie;
@@ -746,10 +746,11 @@ static int lpi2c_dma_rx_cmd_submit(struct lpi2c_imx_struct *lpi2c_imx)
 	cookie = dmaengine_submit(rx_cmd_desc);
 	if (dma_submit_error(cookie)) {
 		dev_err(&lpi2c_imx->adapter.dev, "submitting DMA failed, use pio\n");
-		goto submit_err_exit;
+		goto desc_prepare_err_exit;
 	}
 
 	dma_async_issue_pending(txchan);
+	retain_and_null_ptr(rx_cmd_desc);
 
 	return 0;
 
@@ -757,12 +758,6 @@ static int lpi2c_dma_rx_cmd_submit(struct lpi2c_imx_struct *lpi2c_imx)
 	dma_unmap_single(txchan->device->dev, dma->dma_tx_addr,
 			 dma->rx_cmd_buf_len, DMA_TO_DEVICE);
 	return -EINVAL;
-
-submit_err_exit:
-	dma_unmap_single(txchan->device->dev, dma->dma_tx_addr,
-			 dma->rx_cmd_buf_len, DMA_TO_DEVICE);
-	dmaengine_desc_free(rx_cmd_desc);
-	return -EINVAL;
 }
 
 static int lpi2c_dma_submit(struct lpi2c_imx_struct *lpi2c_imx)

-- 
2.34.1


