Return-Path: <linux-i2c+bounces-3431-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FDF8BCDD2
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 14:25:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 210251C23794
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 12:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B44981448EB;
	Mon,  6 May 2024 12:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="b3fT7rfe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2102.outbound.protection.outlook.com [40.107.13.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D501442F7;
	Mon,  6 May 2024 12:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.13.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714998270; cv=fail; b=jTU9eHPnG3eJoEgl/8JKZp5UnPk+dKm8deUNR6JZMyw6O8iHFIPbx93i9VIbcIYDDslByzEw65XbCjOhnTA/G82yTESrzHtLDmQUm36AcK7+svbEGIM1OeZpA7zgT5ryl0uuX7laZ3DC9uJKTdR/wtmlLXp67K3LofEOjWXgKcc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714998270; c=relaxed/simple;
	bh=eeUECib7l+Rt7YbDwNX5ncgZEkGH1P2nFJ7Sl5IKW30=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=n69uwU+gYZgI6NZdoNycpfazBE7wxqgJ6kB/8DQw69Xz2Cb5HVLZgQaQokKLFInNZ0vAx4iuNsPeo5Okz9Tywgfp+eWdociGMHv1uMjIyQYP+mDrkpun8lYHsG9e0mH3gXrbDTdWxCUb/UG0GHqU/16BrOCrw2vj+/x0tesSMCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=b3fT7rfe; arc=fail smtp.client-ip=40.107.13.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BdGf6/5j9KimTmigYqoKBhqG+2pQKbd3lw3Z+DPeYkuA2NIiKlCG8xGsHccxkRMU2zQVuBsHs44rWKTsFM874l7MlliI7ReDZeXGRhMqkXaw6WqSzgiJDV7ek1ihDIV+J0IrIBn7eYIHVvoO4CB8Nw6yOq42w0DQQW52S0nNnh2nu5cOIzV4U2h0kk0LzS3mDApXvdpdpAaMUm3nPnilb6cj+X7TM+zpoiOJD8Ppjejr/2z5v9DuN8wnchE1YThXSzmXdBgYx0r73GeGKteyuW6Ct4tgHmKID7bweGmpvZ8JRzsC+YKOzDkB9p5jzyOQDbKHLtTp1lqS6/BG+PYz7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f1nb6MgHmQ5pthwDInvb3XPmB6gg/eaOPb6jhHJS89A=;
 b=eqsJhUuluoGULP/o6gBsCeeKZ2jdF/QG4j1njPo/TbpRfpfxkyTe6Sv6RnQMSTIHFgCqEpdtpq9mw26KCuVZgSJEzCJAguoeAYh8/+55Dr8CCxIfRJ3a1wAIoe2AxO9/5cYlL8eHKwPjYEDS1XiV6todLLIt0z1M4am/y98mATTaoSsop+4QiIkmd+DmFm357tvhhUF+ygnL6fZvMyiDrFUGXTsPBDF4XWCXoHOgUKjigCvYXlWSc8rpIUD++ELSEvXk4FRolIQsXoO4nFfNTstzda8eNIzuBM7yTY5WEV/OrcTc6MQlZFBqTQlck0u1HDZU9mjHarOIy9wXiBECCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f1nb6MgHmQ5pthwDInvb3XPmB6gg/eaOPb6jhHJS89A=;
 b=b3fT7rfe4VOSCj4taMSxhd8fLRJJrYbWC2vjFA6nVCVPKbNz+ou3EUB5RrEUoal9LYsGzHVe49lfLuYsmqT+uF4BAEyxB6AvYAbz+HcLJWq84nGaMMn3Qj7KSQKoE6LJ0FUtbxxFwWxH+WKchzPUGeVAMU+6YHqNbuAPW5EzgLg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com (2603:10a6:803:122::31)
 by AS8PR04MB9512.eurprd04.prod.outlook.com (2603:10a6:20b:40f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 12:24:20 +0000
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::59d9:878d:65f0:3936]) by VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::59d9:878d:65f0:3936%4]) with mapi id 15.20.7544.029; Mon, 6 May 2024
 12:24:20 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Date: Mon, 06 May 2024 13:37:55 +0200
Subject: [PATCH v2 4/7] arm64: dts: rockchip: add mule i2c mux (0x18) on
 rk3399-puma
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240506-dev-mule-i2c-mux-v2-4-a91c954f65d7@cherry.de>
References: <20240506-dev-mule-i2c-mux-v2-0-a91c954f65d7@cherry.de>
In-Reply-To: <20240506-dev-mule-i2c-mux-v2-0-a91c954f65d7@cherry.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Farouk Bouabid <farouk.bouabid@cherry.de>, 
 Quentin Schulz <quentin.schulz@cherry.de>, Heiko Stuebner <heiko@sntech.de>, 
 Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.13.0
X-ClientProxiedBy: VI1PR0102CA0103.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::44) To VE1PR04MB6382.eurprd04.prod.outlook.com
 (2603:10a6:803:122::31)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6382:EE_|AS8PR04MB9512:EE_
X-MS-Office365-Filtering-Correlation-Id: cd8daa05-fdfb-4bc5-f1c5-08dc6dc77228
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|7416005|1800799015|52116005|376005|921011|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Vnpha3NBelhERWlyTTlyajhLaS90Z1QvYXJsYzVHQzlTMktoYlV0Y1lHaTg3?=
 =?utf-8?B?TTZVb1gyZXRPZmc4WHBKNG9rdGNNN1RBTkJUNXA5N1UrRUZlRk1UNkJQNlZp?=
 =?utf-8?B?NVd6MGEwT1VBZmVKUFpubUhvVVcyN3E3MUI0amJJU2lmQlU2a0pKczBiWkJa?=
 =?utf-8?B?RE1uMjYzVVZFQUZ1anp1VEk2YUdtcmxMQkdZaTJKNXVqTXJwSHRBaUo4Ylp6?=
 =?utf-8?B?aEliWmdnV2pzajFERVg4aE5VaThSanBWbXFiNU9LKzZndWdSYUZERGdDMXFn?=
 =?utf-8?B?VlFaQVBmTm9vQjRRS3hVQWc3L3RaRDg2cG5PdGdhSEJDbFJQbXZyeUJHNm5t?=
 =?utf-8?B?SGp4dTZhbHNnV1cveHdRRTdSRzlYeTJ6c3JoUWxTQW4zb05BMm4raEh4eUsv?=
 =?utf-8?B?c25TVTBQdjhFRi9aZGtIWHR2Q3U3NVdGd1FCSXJBNlJlWFVvRjgvSThKclBx?=
 =?utf-8?B?MVpTc2p5bWJrb1JGT2JTckpRdEUrNThkMGRpZXUvd3ZvY3dMVUhhUWNqOG5V?=
 =?utf-8?B?ZnpGamRobjJsNm1wNHUvTWN5NkNQYjUyakYzY0ZRcnVCTkU3RkowZlMraU9r?=
 =?utf-8?B?VmVuT3JVemZwSk9ySDlwMmwyRWt1ZWpsTU5zOE9oVkg5MmJEMlNrOUpCTFlp?=
 =?utf-8?B?MmFHVjRETDJQMWF5L3hXM2lLU0N3YThkcE92TGg3c21GNUtMbE85YkUrMVJD?=
 =?utf-8?B?QUJ1OVpES01ZeC9DclM4RFNqNGRMR2k1am1KbE5GQVFmUVJxdC9WN0dncHpT?=
 =?utf-8?B?emdJZWcxd25pWmZZaTlUdXRwOWZxNFRrdVQ3Z0xkSDc4VjhkMlJUSTM3Mkpi?=
 =?utf-8?B?TWk5Y0k3bmJIQUkwblJrRWJPeWQrMmRUbXp4dlF5QnMreld2aTFSZnJtb1N3?=
 =?utf-8?B?RGRCdHJXMzRUVytZUHFRNWdIbE5BUVk0eDB3Mmt4Z3NXVll1WTFOZVhUajly?=
 =?utf-8?B?a0hBcHhncXBZV3cxcE9zbnlGQU4rQWJjWHYxeWxDV0J1TmhRQ09RSStaaWEx?=
 =?utf-8?B?L2lKdHRKSVNjSm1IUGhGQS9ud2ZFdlh1NW5haDNjOTh0NXdVVThteWk1Uit4?=
 =?utf-8?B?am9ST3RwSzlPWkh1WExBbTNSSjhDWFBkQzVGOEV4RGcvS0Yybi9aVHB4Y290?=
 =?utf-8?B?ZmNjMkwrT1pCSGV0THVQUG4vZGFnMVBsR1F4bkxYSVVHeEQ3MEZDTzBDYUhI?=
 =?utf-8?B?enpwWnQwMWtDdmpxVkxXZ0d2VXk3cm5TSEFEaHBJbzZKMDhyM2xYWC81bDRJ?=
 =?utf-8?B?Umh0OXZhYlkwVlZNMFU4SytJU1lXTUYrb0dWZ1R2czBNNGF2b21IYXczaHlp?=
 =?utf-8?B?QlNIcCtGNmw3NDg2S05BQ24rZjdnMHhDbEwxTy8vVlY2UmhaQURTWEdBeXRS?=
 =?utf-8?B?UmRKYnFUYzdNN1JBNDZueGo0Z1BVN2grSWZUVFdxb001SVVmMk5jQ3VzaWJV?=
 =?utf-8?B?OFZHRnE0MS9KajBSOHBFbW5WSXNVT1BkNWNGKzdMVVZpNnlvWXJ5cndZMEFQ?=
 =?utf-8?B?SERBNStaQ0tNQUxPRlprTSs3K0hvbnh3Y3RtbjlSbXhxOXRBaGpTNlI1dTdh?=
 =?utf-8?B?ZkszM0FMUTA0WEZYMFl0MkVzNC9ub1dUZ0JaMzdpa00yL1JvNjl1eUdhblRL?=
 =?utf-8?B?WHh1SzhYakE3T0srdDlIOHF3V05rc1JyQmJYZWh6UE9ReUNsN2lUSzlBZ0FU?=
 =?utf-8?B?WldQc3hBUFRNaVlWOTYwd1ZNeWpvNWtjazd2L1ZVWnJjVDF0QkgxVldtNndu?=
 =?utf-8?B?elBtQ2FpMVNpSm1mamF0WGUzN3Z4WXE5RG9hOGJzWDFGY2N3ZEo0ak5oU2Zm?=
 =?utf-8?Q?8T+B6J+B1gi0URsI/KuitoIOvygHn+xSwJYFI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6382.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(1800799015)(52116005)(376005)(921011)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R091bG8wWlVqR0FOQlAwMG1qcVk4djhkNkw4YWpHRGh2YXFhbWV2MzJDWEwx?=
 =?utf-8?B?NmNwYklqYk43Y2VhL3V5WUxPV29tdVp6VmhYNTlGZWhBOXI1WHlaaStQYUZN?=
 =?utf-8?B?NEhKZzNMV3h0SDlxSzAyUHJSU2k3K052S0dJSHhxRHZkeUxUUEFBM3ZYdHhW?=
 =?utf-8?B?Z05YS2xuTGpDTUJXUG5QNzI0azBsM1dvUkpTV2h5Ujgzcy9SUi9XdzlPcEwr?=
 =?utf-8?B?Mjd1aUdhUnViUGcreDh0bW1XMUJkMDdwWVlmV3V1VUhvWG5MNDNteUlXSzNW?=
 =?utf-8?B?bnNRUDRyNDM1OUtqdnZqSjV3M3J4ME5xZ1lWcjRtT1dlWTMxeGFpRnJoRHMz?=
 =?utf-8?B?UFJERmkwVnMyZ3JmcExIci9KdmtzakkyT2NTcUtMMmhUTWtVT25HR2VZdVhh?=
 =?utf-8?B?SEcySXBrMkNMMWNYNTJDVFk3c21mWldGZ01UQnhXbkRWSlFWdThpRVhzVk82?=
 =?utf-8?B?cEhlZjUyMVZtTzFkSVFMWTV5dHNZZlNZZlRNeEZ2WjBwNXE4UmFyRkRZMU0w?=
 =?utf-8?B?aVYxMG1URVRoYmRQRzJwcEZyNXNDa1FkYkNOV1R1OFN3TW9LRWEvdk1NeFRz?=
 =?utf-8?B?VzRtUWpDMlQ5TElaV0hDMUhLWm8yclRqQ2VhM2ZaTGZhbzBXaWpGUUc5U25l?=
 =?utf-8?B?d3Z6LzYwT29LVms2eVZYMFhSYmVac1VCZml6RHlhREZRWTlNR2UzcGpPS3Jx?=
 =?utf-8?B?bUNQZjhmdHNBYlkycFZkQTBIdmUvaXc4TWtSNHJXRVBBbWJ4OGQ4cFBwdEZM?=
 =?utf-8?B?REYvYVZnejczdE43WEQ2NTNTaTdHRTBKM2NnVkMvOUNNdDd5VE9zZlBmaCs1?=
 =?utf-8?B?VWttS3BYN085d1dhRXFxbDArTWIzZU1Hd1RBdkN6Qk5la08yUFliSDVHRGw4?=
 =?utf-8?B?OFpjY20wRllpY0NaNHJqZGZzaG1oamE5NmVCNENCcGthVGlaaysxcHUyNjBu?=
 =?utf-8?B?SUlWTzdVTTNBbStNRnZNWnVKS1pXem1zOHFNbWZIWTR5aXFXUHM2ZDJ4b3BI?=
 =?utf-8?B?bHg3L1BEQzUwQ0lVaHdZQ0ZpMVlsODRKMm16aVhxcWhsbk82VmFlbnQ5M2sx?=
 =?utf-8?B?NjZycW40U2dvbWlLTTVVL3lycy9NdmV0a0krNEdCMzZIMFJsampuc1F3SVZF?=
 =?utf-8?B?em14ZTZWd2hRL1hmQmVnSWNQQlA0OUNpTTdZRHRDMitVelBBdFpnMkpCaWti?=
 =?utf-8?B?SStkUVlWS1hscitWYjAzRXUwQmNOL1FUUlZkQUcwck91YW95NlVSbU5nQzQ5?=
 =?utf-8?B?NW9HUUYvWlBDUG9Xb3ZrNjNFN0pDZmxiMjBaYks2YnhPcU02dzN5OWtIQkZi?=
 =?utf-8?B?M1M0VFpTQlpwQXlLQU5EUXdodlRtSHM3Tmd6MDdzMGVxU0pDRGk3aXJJUDZl?=
 =?utf-8?B?eFNZTzJGNHM1c2VsSFpidWJQZXZjRWNnZlV1cmhiMzRwYUFpU0VrY3FGOEpC?=
 =?utf-8?B?WE1RTm1lbklQUFhteHlsTzZmV3oraUc1czl3MXd6RVM5VzM0dFo1a1FYeDFX?=
 =?utf-8?B?N2dpdjhRWFdrSGRUMGw0M0JMcWd3cWVYVDBNQnF1VU0vSEhnTDdoRmloQjM5?=
 =?utf-8?B?TytRcWpSbStYOTZWcUVrWFZzWTcxL0pTb2F2YnhkQnJHU2UwNGx3azJHSzYr?=
 =?utf-8?B?Zk1YNTVQdFc2cUVMTFB5NmRkbHJaaERYaDBqdFdxNnBvOWJ2c01sVTBVUGpV?=
 =?utf-8?B?UCtBU3MyQ1FYY0JNK3VQVURNSllBREdVaWlMMVVNdU9FQjB1dlVVRnQ3allK?=
 =?utf-8?B?WjFEcGNaYXJJSmtpUSt1SWMxcEt3ZkxkclZhbjZGQ1VCV2JES3QrTHppcnlk?=
 =?utf-8?B?VTBzU0ZlRklDZW1uNjljcVpvekJnL2h0SmJ5TXFkR1B0YlIvaTVmT3lBSFpO?=
 =?utf-8?B?VnBwTEVXVkM4TzArUXlmempKMWVINnZIVkswdnZTTTRXRmk2SlZ5L3MrckpK?=
 =?utf-8?B?RTNTWjl2aVc3TlpNNUQwY3lLQStzOW9FM2ZLb3kwb3EzTHcvcnhFRmtBZW5n?=
 =?utf-8?B?WkhpZ01VUCtobHpWeHMxUjd0cndpYW1kVmxXQzlnVjlpZ0hHaFBWQUQxN2xa?=
 =?utf-8?B?aXhDbWR5R3g1OXRiOEpZUE5SeVRidzVkeWI3SjczZzd0dmlPV3ZGK3NpS2kv?=
 =?utf-8?B?M2d0SlhVWTBWNGdQa1RrUy9JYml2TG83LzF6cDM1Q3U4SnNQSktscnlHeld5?=
 =?utf-8?B?TEE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: cd8daa05-fdfb-4bc5-f1c5-08dc6dc77228
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6382.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 12:24:16.1806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eFytnREWoE70HMv/+lSBz/J88HyrP/v0AEFwjWnLCgeuj/eOP4kqB7J6gvxZ5cnaPT9pdAiaFs5qTGLAuVfvVDR6U6GBURIdnWuc4zWga2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9512

Mule emulates an i2c mux (address 0x18). The amc6821 is exposed behind
this bus.

Add the mux node and amc6821 as a default device.

Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
---
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
index c08e69391c01..e7313be24c1a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
@@ -10,6 +10,7 @@
 / {
 	aliases {
 		ethernet0 = &gmac;
+		i2c10 = &i2c10;
 		mmc0 = &sdhci;
 	};
 
@@ -357,10 +358,23 @@ &i2c7 {
 	status = "okay";
 	clock-frequency = <400000>;
 
-	fan: fan@18 {
-		compatible = "ti,amc6821";
+	i2c-mux@18 {
+		compatible = "tsd,mule-i2c-mux";
 		reg = <0x18>;
-		#cooling-cells = <2>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c10: i2c@0 {
+			reg = <0x0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			fan: fan@18 {
+				compatible = "ti,amc6821";
+				reg = <0x18>;
+				#cooling-cells = <2>;
+			};
+		};
 	};
 
 	rtc_twi: rtc@6f {

-- 
2.34.1


