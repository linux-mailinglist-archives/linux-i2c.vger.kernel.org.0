Return-Path: <linux-i2c+bounces-13367-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6402BB50D0
	for <lists+linux-i2c@lfdr.de>; Thu, 02 Oct 2025 21:50:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A028F381CDE
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Oct 2025 19:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6126E2882D0;
	Thu,  2 Oct 2025 19:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nC1NRn9f"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010027.outbound.protection.outlook.com [52.101.84.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BAE28726B;
	Thu,  2 Oct 2025 19:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759434603; cv=fail; b=EUH+0clLzvXVN4P6HRswSwH19j3lsQD6x23V2BE3/lI5zR3fMlglLhXJBB6iitjZMiEfi5i9QTwss1lyDF/yFOyfLQed0eIWmMNTP5a5xkGTtSD6vmQmoEZsGxPnM+XRuKGTg0T6VJ0AX4ZeuUYMni1GINEW/RX/+pYZOPzO48Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759434603; c=relaxed/simple;
	bh=ppyoQxAfgquPTlUCM8XvJNkFrtCYXGNeg5oBVXbcHKk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=OqZokrxAOXpq31lWXUnha86wtDzl+7oHXPrGWujzEBO/4RyXBpbLS1nPtpY6kcHS0zIQ+ZInOvWvmOXJrS2TuZKQI2UWvAKmF9BCtfjJlAfV+1zVZnYzqpT2GP8B0qFpKHU2AkuM949K+juVyYnRiWqIqWD6OqhI7x1ti9sBrb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nC1NRn9f; arc=fail smtp.client-ip=52.101.84.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SaFuRcXwSMCa1FUiW/le0WUs0pdrcB28GV4ikrOeDdMtoUSz+vMnK3ix0wZo44Nbl/erIKofI0rHzzsxxHFpDWMsD0xLyo59W+QvQREaet6GlUpcDd5ItTfiqcEMqE8hJKi5luxfEEYuqKtOkk/PKufnrzHM/Oe+g8E+O/Ur0mr6iP/tESH1Q8J765/D+CnAm7jD1eMErwTcRZBM3GxmYJ+HlD2EftXA/GWJNnABAXJ5GEGEbTXHd8NyJ5HvmjVJRpApcI/Fb7bZAjFkvuYiwdA3k5STohCmgTZOouuHVJJHNcn3gKjddGa9VjYZM2lBjlFn45gu7OIYJ0+a6ISb/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Imym3qO/sJ0zjyCtuaoUz8M2JO+eySKQDjkYTTqbKng=;
 b=GLNshkUJYM9W/O3gMxvVYuMbMOhZSV9Swv1/cHgYOO5V8NUHuz5/ss1c6zx4YyO9OLlhB+RkwPRELAi3OdJCYdKqmYMTss+QTdTx6iEAlEvcS1n4jmjRMA1DTm0B2C3KKopTp6dluVFEVCs4xGkGRSaP0d+PUOMFoNgwozKgiD7c27iKRjkrLv1JlrA299eIJ/MhCkZe2wTO/11/ImZzNfzq6LXUGBAQXYFNPIyZ+swMP1FOOb5N31/V2Yb2vhrK5Vyf5tG0V0TdZGDs9tCWLWKNYGVfyVFR9L8zthUXsWUMfasfBRzGz41+1JdHQ9gnXNciLvdF7K5sZYxV7YuSow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Imym3qO/sJ0zjyCtuaoUz8M2JO+eySKQDjkYTTqbKng=;
 b=nC1NRn9frWZ6aFGLABHbH3SZ3z3cxf9s5hXCOLggcSkB+ZzUea6zBpOxaEuUOs/JbNTYBvN0Vg6JBmuDnU5HwDkeiwPJk2HhsG3XDu73LEQWYbzirVgZ196WsRvr4Rlr4sdrm1sAeUTy6ScGBW2zm65ksh1snQkdnJ8JlouFvSOuBKOn8xTD65teRj7BRDROB+HDWfPlgyfAsOl/u2s89uJnhKVOwFBC/NcNbuyJF/uiWHlnB72sdLNLq7t5ooE21RMvoyGyRXEpHp5GZxyJ5kFms/ox8gS7eClU8YtnZOZbmZAFCvrC19m511QyDFbu/GQDbLgaFg4zM/W6BxQkHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by PA1PR04MB11406.eurprd04.prod.outlook.com (2603:10a6:102:4f1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 2 Oct
 2025 19:49:59 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9182.013; Thu, 2 Oct 2025
 19:49:59 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 02 Oct 2025 15:49:41 -0400
Subject: [PATCH 1/2] dmaengine: Add cleanup FREE defines for
 dma_async_tx_descriptor
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251002-dma_chan_free-v1-1-4dbf116c2b19@nxp.com>
References: <20251002-dma_chan_free-v1-0-4dbf116c2b19@nxp.com>
In-Reply-To: <20251002-dma_chan_free-v1-0-4dbf116c2b19@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759434592; l=1625;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=ppyoQxAfgquPTlUCM8XvJNkFrtCYXGNeg5oBVXbcHKk=;
 b=oslJiN5Amd02KVrNyB1qP7Vz1DeAs4XmP8EsKVKsUN1Ho36F6KtKGclo+SE8ILXcBkT7OeM+p
 Bj3nyngUx3bAddcKpkHoYQqTEzkkUr/KRMBQ/TWVGUH4Xy4Vh3HQ82v
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR13CA0104.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::19) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|PA1PR04MB11406:EE_
X-MS-Office365-Filtering-Correlation-Id: fb6d7628-bcc0-4e11-df3a-08de01ecdeb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|7416014|19092799006|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OVFleXJPdkRpaGJZR3B6Q3VkcDg0YjdSbjUwdkw5N00wcGNzVVkyODB5MkNH?=
 =?utf-8?B?YmJnM09kUDVZWmo2ZDVBVXI5dUt3WCtHaW9QVllkckpxK1VFdTNHdEV5L05O?=
 =?utf-8?B?Y3lWV3NydkxEcW5pY3dZeXoyVTlXVk43bytQV3IyL3dIdU5jQ3R1dnpMeFZP?=
 =?utf-8?B?OWErN3QzNmhhZmlHRC9Xc1lKUFUydVJNVkg4RTZtNHVoRGxpNDlYVWt3L0Ru?=
 =?utf-8?B?T01pZExLcDlLV3F3R0dXMkFjSlJsTlovcS9lYVhCZGR5Rk9seC8rbWpDOVJ1?=
 =?utf-8?B?Q2RZNjRUU2pib1lLcmZSVmRlblk5NklqRk9scFRjQkRKTnBacXYxR3VrVDBy?=
 =?utf-8?B?cW9ONi9nMGdhRE1hVThoZk1jRnVhNCtNa0NjNlNVMzZ1V05JdTRMRVdHemE4?=
 =?utf-8?B?aVJibjIwc0VPZ0tSOVlNZTNlTXVaNU96ejllZEdEWldOVnZMeXY5MjhjVzJv?=
 =?utf-8?B?RmtuSVlBZmNqYmhxc3B0VHozRTEzSXJlaUZMb3c0OWttS1RETVRpT2lsYTFn?=
 =?utf-8?B?cGNxN3JZRWxnWmI4TjFwT1pvTURNOENqQXBNZTd6ZGZPcW1RZ1B6dUpRMGZo?=
 =?utf-8?B?UHlnbGxFVUJNT2tDUzk0VXdkWXJ2UUVLOTM5WDZUTHcxTStnZUh3TW1NNllr?=
 =?utf-8?B?S08wbGhzSUZKWEhmekF3dnV3aVV0OXBPcm9oVG16aWNxdlNxM3JTRHN4QXdK?=
 =?utf-8?B?bkNTUGtWaVZ6bU9IRmlVcTFxQnNFTkZ5YXBsNlhkWDlkaDJueWx2WGpDelNT?=
 =?utf-8?B?RC9DWk5kMzlGckxSdHRsNFVHazdGUnBXeVZuRGYveGEzQ2FmNzNLVC9zZXZC?=
 =?utf-8?B?Mnc2KzVOdm1PTWQxam0rQ01CRGI4STdYWGFVb3p6dElUd0EwSURCVUduY3A1?=
 =?utf-8?B?REwwa29KcDlmSWg0ZWFKZGp2cGVTOEhpNWVqMW5DVWRsQnZLYVRUZFRqT1BP?=
 =?utf-8?B?OVkwb0lkZEtsWE9oTHYvODhJR0U5eUZoZm1UNitIL21TcUd5TDZnOHozRDNF?=
 =?utf-8?B?MGVOd0ZOdEc5dis1S2ZHdC9hRElMa2krRlhHQ1R3M3Nwb3ZieVNRek1BWHQ3?=
 =?utf-8?B?dkFTVVZWOCsrbHZYUnoySGJqNC96MkZsTGVNbFdDMXFrc1RHNUVMU2d3SER3?=
 =?utf-8?B?V0Y5eExiMGpJNW5oZlV5THgzR1NCNVQ5eTcxTkxxT3d1bjduTm1DOXMrcnZo?=
 =?utf-8?B?U0crVGhTYXBwUk95REVSMHBlbVVmTXN5RWk4MWI5SWJCcy82YkNrS0ZZNXQ5?=
 =?utf-8?B?U3JWZnVETXFCMnlaODg5QkZEZGhLL3ZoTGtXY1h5QVcwRkNmeEFjandTVzFZ?=
 =?utf-8?B?a1V3cEZ0eXdyb0VPenNVekJEeGRaOUZUT2RFK3p0QmRxYmEyNmdZMG9pNDdD?=
 =?utf-8?B?amdmdlpLUGN1Mkl5NWRxOEk2dnVHczk5dEsrcFE1ZVVwZ2NnS2ZNSzcxL2ZT?=
 =?utf-8?B?RXlvWFJLai8yR3plTGJqQ2pUZndiU0tYMGVITVFVWUMvSkE5NUJFTytNdDd0?=
 =?utf-8?B?ZXhNU2QyM2dtNFFxbGpvbDdIemFENVpuSVF2aENuNld2T1lzL0N2dG9RMis2?=
 =?utf-8?B?R1NmMnBIYkpheW0ySys5OEllQWZVWDU2d05mRGpqUWZhMFN1QUxmWVhBc21K?=
 =?utf-8?B?S25GT0pQK3lNOVJheVNaeHJvRU9oN25YcnYyNmgyY2UwSktlaUJqUnhKbk43?=
 =?utf-8?B?MGMySjRuZWU3bUlKQ00zQ1czamY3R3NCUEIzTmhoOTRFQ1J4WG8yT2RQaVBz?=
 =?utf-8?B?bE44UjZDaEw0VlBWWEZBZ0hhMjBvd3pMb1Q0Q2ZVSStPM3RpR0NtVnpsTERZ?=
 =?utf-8?B?QngzUnBlRTVHdm1HQXRUVlBpbWd0bGZ5NGpia0V4a3Rxd1FKbE94VDJZdUFX?=
 =?utf-8?B?bno1dXY2SHdOaUdQNDFLVnlrdXpRYlNzVXBWdjBuK09DTlZJMkpkNDFUOHRN?=
 =?utf-8?B?bVYrdEVwVEY5bTNIaWw4WjI2RGRtakFWNnExR2ZXbVpRTHNDY3hJUGVRelNo?=
 =?utf-8?B?djlENHB2dGpsZnFyVHJMK3NnSUdXcWZBbWZGWnN6eVhZc2QrbTFDNjhzc0F2?=
 =?utf-8?Q?dl4sCJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(7416014)(19092799006)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0NYcW0rbkk4VjIzU0E4Sm5nTHVtUlBFOExreWgwR2ZkQ2d5bXl2c0VqUmxo?=
 =?utf-8?B?NFZnNmQ4UlVTRGJkYkNvdmFZYUgxWkZJdWVKUDlJbStnb09taGtYUnpIUEV1?=
 =?utf-8?B?dFZmZlBJTWcvaCtOVmRteDdXMDlnOGo4U0x3d3dtUkV2eDBJUG5QRldIanQr?=
 =?utf-8?B?RDdGSUhxSnk3a1R6T1UwdWFpVVEvNFQ1bzUyNzdLZ1ZNY3VxUXd6eGdFSzlj?=
 =?utf-8?B?VTA0VW9IcnZNMFlvekp3cUN0eEhOTXFET2xURTA1cXhNVDdTQ25aNEROMFI1?=
 =?utf-8?B?WURCNHRrZVFjMTRBdlBKZllHNEtWTjJHTFpwbWFpRnVaVDNSSnMyQjRqL3Rh?=
 =?utf-8?B?cVgvVk9hUG1BR2JKcWlXcVJJMVhRZXVDMWNtejJaMGx5OHVxRGhSWXRjcENS?=
 =?utf-8?B?REh1Q2Z3b0U2dkNrK3RPY3Vsd0lwaUFYZmNJY01YOVdocXM1OHBvb1o2QmxQ?=
 =?utf-8?B?MXVsbFlCL1FkMTNTOHJ6WVB4ZWpzVjZrcG5qTUNCS1ROT0IzMG1LdHNpazZL?=
 =?utf-8?B?dFZvQjNWK0MrS2hDeGEvMVVDc2JwK3l0QzVRQzA3SjJTUTdKTDFueVJkbGll?=
 =?utf-8?B?NFpSc05ya2lINXNIOW9vanJxdUk0Q1NZTGF5cnJmT2V3UWx2M2IvTlpsRHNj?=
 =?utf-8?B?Q284RW91SktFTE45WjNQUy9uYnhKd3A2K1p0WVFrNlFKbzl0M3lHZTJLcS94?=
 =?utf-8?B?eGdnU09MK0dhZkYxb0NneERVUEMxSHh2QituSlNncjlWWWF4TXh4VkFmQmtN?=
 =?utf-8?B?MTFjcnVpRnVnN29LZitxMFFxWFBtSWVhcGFuOGhNaVFjUW1vbTNwZEFEYUpw?=
 =?utf-8?B?d3J5LzlXNExXVDI5VHAwZi9iaFBYNGFGdmRFOFVLQ3hQcEZHU0RUajhOZUpr?=
 =?utf-8?B?UUtMVWg5ZTZEOFhqd3N2aXprVmJIalhmNU9qNDk5Tk9ReERJT0NOdWJ4cVF2?=
 =?utf-8?B?TEN2NVF3TDZLcHl5QUVFbHRVREdhRUZ1T1kzdHpjZGhWVlpoTno4WGdzNlBn?=
 =?utf-8?B?d2lFbnJFVDhiQVJRQ0d6WE1LQnM0b0JjcmZHNlhJZVZ1b0tHSDRKdjAxYkVl?=
 =?utf-8?B?OWxtRkh2dGtIWTZldWxFcDZrQVhVZEZYQjQrWUFJUE90aXJPRTdlLzQrcmtB?=
 =?utf-8?B?VE5FYnFLaFVWZDduZXROOUc3S2dxSU9tbWVlUjJQRmJ2YjJHdGVxU2VGM2pS?=
 =?utf-8?B?K3BxK1pxbWpGeHk5SlpwOXQvd0F0QmM0V1JITnNnNmZTRFFVdmNTb3E1T1lL?=
 =?utf-8?B?d3lxVFhXQlZ6R1E1eVN2R2t0WTdCeTM4ZlYwdlRjKzhhMEV6UkxZblhTRS92?=
 =?utf-8?B?NDFzTER0aVZMSTFDM1RlZG44c3NyT3hBcDB0T3V0aVVUT05kK2ptRTc2anhj?=
 =?utf-8?B?UjRXM1J4UnhSN3dyNzhCMFZwZm5XaHl2NmxPN3VEV1NNYUowbHNSTzZRMWhs?=
 =?utf-8?B?L3FNNkZUTm9ScTlLWU5MeHduYVJtWHlQdFNXN2F2ajIwWmJubmtnOGZxd2Rp?=
 =?utf-8?B?QzJUdXUwanhZbVNSKzBCTldQd0VrNTJndUtXSDEvL1Ayc1Z4dXFKOFFPOWZB?=
 =?utf-8?B?UWJ5cVFqRDFUUmNkY1hLeEI3ZnlBL1c5YzY2Rytud0JzTFRIdERRZFBCS0pC?=
 =?utf-8?B?elQvZTBQaEJYM2w3UEVDcHZ6Qk5YOWhXcjJSNER5NFpZN3U5aFhGcVI2RTdy?=
 =?utf-8?B?N1k1SThDTTRDZHhhRHdZQkNMbWNrWmFUMEdpNlFHSnViOC80b0pzMEdLRlVZ?=
 =?utf-8?B?V0JNeS9ZRlVZdWJRMW15dnlHU2dBcmhvdzhTcWlBSkVVQmFXdWRnRUJqYVVi?=
 =?utf-8?B?T2Q4aXlSR2dYc0hxallZcTdqTFhIcktodEh6b1NTQ1dxZGQrN0U3aEpaZm5x?=
 =?utf-8?B?RXlpUURoSWgrYXkwN2ZLVDhlU0owK1QvSDJVdHU0QTd2Vm9oVTBnNFpISVJR?=
 =?utf-8?B?Wmc0NmFWbEVnS3gyMm43N2RqMjZOUzhzWXJORmY1Z2lEbWY4T1haWGxRSWJj?=
 =?utf-8?B?bFVHcVMxNDhiTlp1emJ0bkVPUHR0cjFUNXU3MG5LS1ZvU3puTWVFbFB1NjBW?=
 =?utf-8?B?eXdEWWlYKzRvR0o4cTNnN3VyQkZZSyt2NG5HeE1OR2ltSHdKWmJoUVBUcXBs?=
 =?utf-8?Q?so2Y=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb6d7628-bcc0-4e11-df3a-08de01ecdeb8
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 19:49:59.6005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6jFiBsGYNCr5XVyc3gQ+nv0jiQ0adrnpVCCSGzOuhKXyLTiyhMqJAOPoGEOWXxjxFo4naafJmJslNkfRt9YFFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11406

Add cleanup FREE defines for dma_async_tx_descriptor to support automatic
cleanup and simplify error handling.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Check patch report exceed 100 chars, but it's still better put into one
line to keep consistent with other DEFINE_FREE and better readablity
---
 include/linux/dmaengine.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index 99efe2b9b4ea9844ca6161208362ef18ef111d96..7826b40727ab889c9167343bf15628b83b85647c 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -5,6 +5,7 @@
 #ifndef LINUX_DMAENGINE_H
 #define LINUX_DMAENGINE_H
 
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/uio.h>
@@ -1525,7 +1526,6 @@ struct dma_chan *__dma_request_channel(const dma_cap_mask_t *mask,
 struct dma_chan *dma_request_chan(struct device *dev, const char *name);
 struct dma_chan *dma_request_chan_by_mask(const dma_cap_mask_t *mask);
 struct dma_chan *devm_dma_request_chan(struct device *dev, const char *name);
-
 void dma_release_channel(struct dma_chan *chan);
 int dma_get_slave_caps(struct dma_chan *chan, struct dma_slave_caps *caps);
 #else
@@ -1612,6 +1612,8 @@ static inline int dmaengine_desc_free(struct dma_async_tx_descriptor *desc)
 	return desc->desc_free(desc);
 }
 
+DEFINE_FREE(dma_async_tx_descriptor, struct dma_async_tx_descriptor *, if (_T) dmaengine_desc_free(_T))
+
 /* --- DMA device --- */
 
 int dma_async_device_register(struct dma_device *device);

-- 
2.34.1


