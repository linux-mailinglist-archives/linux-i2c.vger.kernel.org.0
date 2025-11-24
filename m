Return-Path: <linux-i2c+bounces-14239-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A613EC7F05E
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Nov 2025 07:18:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7B3FD4E234D
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Nov 2025 06:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 193C9262FE7;
	Mon, 24 Nov 2025 06:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ka7c+WlY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010033.outbound.protection.outlook.com [52.101.84.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4562322FDE6;
	Mon, 24 Nov 2025 06:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763965096; cv=fail; b=KjWvpEnRl7Tage1Mi56EdG76Wa/M+x7rZ4R31mT9Of18b3QrTFPYXoWvJWQUqB99btkSv5gu6uo645pqgjz9yETV8uYrGRaPp/gDmOiZu0nyUitktHTyMxrrsziPsVQd/ZHyKYZtGdSHWHqdOBUYMQyyRGhDbAQ3r+sRnJuqJk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763965096; c=relaxed/simple;
	bh=TeRXsYGkHux7XrfbqbE7Vxad/SxTZBDD8qeq74T/j2k=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=cPH2rVqSMJb1achj07IyXcRPBOaRiuJe72v2TdSBhZp187NfnRdeE8IQxpN3GPV1jLNquOx9i11LULtUg1mxNwEIEidclvDJ0CgY8AFFOcYNB+yvdpeIsCbaj26vCKG0aOg1hDOBfC+GhIiNTqVOq1lKmkpGZoj9LQvbMRe9fk8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ka7c+WlY; arc=fail smtp.client-ip=52.101.84.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ho6CZrcIoj8dQor5Sh1wBp52Z05+rOLuEmxAwjwF3UZV0Me46jd/9NJpkKplmsXAGwjGAhswOFzj2MLv3JYqO9ue2Csvmc7VpWsQm+oum8sRK54UjhUIfuYQzLC1dWyp3PFxhOvCBV5oH2nsNc/S0I1COTuyj3e7p6EGzxjcgG5StziklRE31UPtj2m1Xi5OIHZPUfNx23YPsGx/yHIYv9+YmOIoQcEZaqAG5YQGxOFCl+0sBY2V+AieYGhygThK/sKsXh2/GHVcEmVRqXGs8jPB3zDgQ4xGNv7nXhl68kcU1AvQwLAACjVdEQpN9NYgWCOqVTqXvwJm25ECV51i5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eay28VVt6fuy0W5ux3jFakrgizyoolpgRjhlBs6GlSU=;
 b=ew42KeE8swUfdEkFXto3wDoi6/EhbVPlmm6mz9/RC5mJnX+fsVCW6ex57nyGdJcr6v18rxwXM64erVN58tv2LGF3cS2TYUP9x8dIOoEip0NuKBxzB89LK6Qz0L5sXJy72hV4w5IGREtaETlAzMwNeTuPI+PI/BDgYnv827b0VdZmGCJ7jSvXQ7p6tCUxJLbQQ4jLAK9DYb7Rgh6MqR8Tb+s0bhCPPb9RSdrzbPNPc+H/gascFym1G9QcfF+VzO45axbgxyQCT1aZzrxjwkhFIOMuZ6kO+9Qw0pEr4rDSngViA0iuS90Q1bS1wwbBRgP0QAel72KwBFPerwqqZ9mh1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eay28VVt6fuy0W5ux3jFakrgizyoolpgRjhlBs6GlSU=;
 b=ka7c+WlYwqUIApDOM3Xid9tuFjOMneAKz2WVXyAwjfrEOOY2rJ4uJZhuWeb2sy4VAH6PbUi4MuSVyx9nZXJErDdSZjtbXIb1DY9N/UBcDSPNbvKHwTr50Jfme1LhxtuVUyEfRq1u+luvfr6UGU0NGD7TVHk+BGCjD7KU2VME6wIV5OAJgDcrPSmMpvI3B8qTdjTlurAyVSOnjMEYg1l9km5It5py+1DItwXeAJTRCkILIQ5sNrNieC5+aE6o2ZAm1Cli5zRAQYfoP5LgdpnG3clk8ys9qe1GmDmYNK6CT+3dLtaWaMNnnkGhxVpQBmlSJs6kz7xg632zNX/PZTcZdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by AM8PR04MB8052.eurprd04.prod.outlook.com
 (2603:10a6:20b:234::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 06:18:09 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%6]) with mapi id 15.20.9343.011; Mon, 24 Nov 2025
 06:18:09 +0000
From: Carlos Song <carlos.song@nxp.com>
To: aisheng.dong@nxp.com,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	frank.li@nxp.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Carlos Song <carlos.song@nxp.com>
Subject: [PATCH] i2c: imx-lpi2c: Add runtime PM support for IRQ and clock management on i.MX8QXP/8QM
Date: Mon, 24 Nov 2025 14:17:43 +0800
Message-Id: <20251124061743.1988773-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0007.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::6) To VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11147:EE_|AM8PR04MB8052:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f155d51-3085-4361-8bde-08de2b213cce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UFdNM1dXMmttQXZuLzVMc1FMeHVYK0gvOFhrT3gvTmpIMmdnNXd6TnB2S090?=
 =?utf-8?B?ellGMmx4Q2JROFNlaVJOSTFWdlR6ekVnY2RwRjlDWGY5OCtjaUhMT0NEVzVE?=
 =?utf-8?B?UTBkVExFdlMwYmd1aXlVdFhDTDJMMDhUYllwSFB3WnJyYUh5Ujd1SS9vWjU3?=
 =?utf-8?B?cEpZSVVBcW5ZenJkTU1jazFFeEVmZVphZmZuV3BoTS9FZ04wSHpTTHZiZXZP?=
 =?utf-8?B?dm1zYmxWeFlvaFJrYVFBbVhUWnZRN1RlSVEzbjhadkQ3V1FZOExkNHdiOThq?=
 =?utf-8?B?RmsvdldSNktkK2sxVzQ5bEZ5djZFaUl3OXpNNnp3VGsvdFlhU0JuMTBGY205?=
 =?utf-8?B?TWlFSmVsQzBvczdLdTN0QmlQYzN3NkNPYzcySEdwRklZNEc1WGVXeFdVTE1H?=
 =?utf-8?B?VkxhUENHYzZtWVBZNjBJNjJLSDhZTEZDZTgwdUtUY3ZOcS9vK213d050UDNL?=
 =?utf-8?B?ODkxZDNUcFdtclovUXQ5eFJKVDlPS3NmclJ2d3RPWVBqM3BmdnJrU0taVW5U?=
 =?utf-8?B?OEpDcFhGYVpOR1J5U1htLzFLVDZ0M1ptdENoK2dESDB2NDM0T2MxekFLNWFn?=
 =?utf-8?B?U1NNK2g2dm91NW1mK3JOZFJRcngzZkxuZ3pkblFWVHFzV01IbC9JNXpQaVlF?=
 =?utf-8?B?M0dGLzJYWmZjN3JTYTZDdkFzdy9aWDNLZzRncnZwbldXSDhYZExhNXUxNzBY?=
 =?utf-8?B?b25LanZ2cjh3SjZjNEVBaTB6Q1R6WUNpVS9nQmxqMnl4WkNDUXFBTlp5TDhC?=
 =?utf-8?B?bUVhV3JmeVdkREJqTXFsU002b245ZVJmYTk3K01SZFJ2eWRIUWE2Wlh0YTRv?=
 =?utf-8?B?YzJxUnV0Y3Y2VkVVeDB0Wmo5TXpHYWp3RFdoUWZ5dFdKaGlZM25GMXJoZkkr?=
 =?utf-8?B?MTFmK0kzNjloUmRpMGNGVmsrS0RxKzhURGhtaWk2WXl5eGtyN1BhRzZoQnY5?=
 =?utf-8?B?SndIR2FsdVo3bE9GeEszL2p2ZzFFYzlOSFI5WDAvbk1VYW1mS2tpcUk4UjRn?=
 =?utf-8?B?aGt6U0hTTEQvUUpwNi9acVJXakxJbDdvbXdyb3NSRFhOMUFOZkxrMnBDVzJz?=
 =?utf-8?B?TU91OUhRei9qM1NibXNzQUJhQTNjenpBck11RjljcjNJZVNEZm1oVUs2K1NG?=
 =?utf-8?B?YkluSUZaMjZiY25ZV0kzYmZSQmV0ODZFTlJZd2FkQkg0VUNxOVFvLy9yR2hX?=
 =?utf-8?B?QnpTRlpOL2Njd2M2bHhRYWdPbUo0dkM2Qm1hNmtLempKZ3BTNnZndVJGRWRP?=
 =?utf-8?B?cnFiMnBLdnh3dlEzVGhGbFk3M2Zod0ppa1AzcWlsV05waWVKVnkxbEIwK0FO?=
 =?utf-8?B?c0RPOWp4NXRsbGFlYS8rZXVSS01nb3Fma1NGMjZkRllOd2pEVm1kM1RLZVpH?=
 =?utf-8?B?aS9pOXYzTzFxbnVNUFc3MUp3TzFWMGRqTUNHZ0t5dk4waFpqZ2YwUDJabU1t?=
 =?utf-8?B?bXVjQzNnemJDOVVqMWZmd0J1WHRLWHdBTWpUSVVVcklNM2tUdnYyaXF6dEhT?=
 =?utf-8?B?SVpIZC9xdmF6VEIxNHErSmZqbFcwVUJIaGRadGJaRE0xNGk0cmpGK1lUUGQz?=
 =?utf-8?B?S3Frazl1LzBkUmtDdG5kTFBEemJpSjNweUsxcXJENmZiNlk1UURiQmxoNzRl?=
 =?utf-8?B?WUpHOU1HeDhPQzhyRHVORklqSHpIaUx4a2Y4L1FDVGtVUjZPbkE2TFRmeHZC?=
 =?utf-8?B?Ymxtc3NXUnY0VEU1ckhua3M2VG9ucEovcWlNUmhBTE12Ry9tM0YwbjlHNXdL?=
 =?utf-8?B?Q3NWazByTkw4WXFGRmFJeXRiaUxjTmNLbHFzTkRHNUw5c3l5aVdpQzNuWmM5?=
 =?utf-8?B?MXNCYXk2ak10TzA1UzJDck1CNVdZV2xKZUozYWlwWjBlK29PZHFkSGM4MVJK?=
 =?utf-8?B?M2pnZFEvbVhDMnRDRlBlRFVEVzNXQmxWR3g5bFVDMzFtWkhBQkRvaGxrMHlE?=
 =?utf-8?B?bjZVR0czMUVNclJqQUsva3NFK2xtY21XMnJqNzQ4MU1Qd3o4T2tTWGV6RFFr?=
 =?utf-8?B?YTdkUFpPcy9LTXRGaHFBaVFhNC9LVFdYRktKS0xVUWg4bmtQQ3ZzNmpQYjJE?=
 =?utf-8?Q?KW8I3B?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDZxQ1JsU010bGt1dzJEQUtPUHRBeGRjZmxUOHpaT2RCcjg5UjIwV080L1JZ?=
 =?utf-8?B?bHROWEVtQ2twZDJQd0FoU1lhMGJWMlJTNkUzYXJFMzg1a0FvWlJRNCtvSzNP?=
 =?utf-8?B?WXp5cEh4OXhsNnRUSmd0dWhCRjlDWVlYc0puNE8vVkk5Zloyd2plN3g1S0xJ?=
 =?utf-8?B?WlA1M25Cc1ArQ2x3ZFNadVE3cjU3RDBscWNQZXBxUDlQYzB2UG9YbHFMaE94?=
 =?utf-8?B?TlJJeWhVdCtQSDJaQkJIRisyMVRoTWo1TDl3M2NvSmJNc1FVUXlZK3IzZGpT?=
 =?utf-8?B?RmtJbVQydlZvUnZsOGFEVnZQaHBpVGpGaGJJcUI3R1FBZUMrUWs1L1ZCT0dz?=
 =?utf-8?B?V1ptVXpveExPRysrVEJZTGRYV01ha28rbkE3bTlCNDZDc3FJOEk4YTkyYlZN?=
 =?utf-8?B?dDR3ckFoSXlIVmc3ZWcybzkyK0NCK0pzb0s5a3BtNHVMMzJGTmJKMHp6bEV5?=
 =?utf-8?B?aUViNXlmTlY5MDlGY0pBb3RoSWZvMkZFTFRkajYrQkdZQ0RlekYwMzFlN2la?=
 =?utf-8?B?dGlRbjQ4YmNyZjNtdjI2Q3BiZTRUN1BXazVIZWFLeEUwaXZ4VkI1YlhiUWV4?=
 =?utf-8?B?aExyTHlPeDRCdW03OFBTNnRPVGRySU55ZGVzTTZUK1NFRzdtOWpoN0daWkF2?=
 =?utf-8?B?OFVQRndwc045QWc5cG1TbE53YnFJS0FKM3ZyL0orbU1KaVU1SlZ0TW5pQldW?=
 =?utf-8?B?VFZjSmN1MjFxMUpVQ0ZKRjZBK0lxVFpwL2tSbTIveHRxSW9hdWdhdGE3YnZF?=
 =?utf-8?B?Wmo1bC96WC9oNW5nRHdpamFQR0Q2MVlERTNSL3hzMTFUay9iNFhRTEYzd2xM?=
 =?utf-8?B?RzlqL0NyTk4xS3lZemVQdkU2U2tDV08xYTIvcjVIRUVjMGpOY0VrYVFtcndq?=
 =?utf-8?B?K2dyeW9RWWlxMmxpMDRxbHB2ZW9VbGY5a2NFQURUMHhCeEJDdEUvTGh4T3d1?=
 =?utf-8?B?TmsreGx5NmtOM1pYV1BBWkhQay9zYjVSQXI4L2xvenlaSGFpWDNYQTBocUlY?=
 =?utf-8?B?am95TG5TYWo2YW84MzRON0FFMlZNOVRNbi9WZkYwTUdEdWowOVRPWjJCN29F?=
 =?utf-8?B?Ulllc09CbEk5bm1mSTVaOHpBUHZZWjdTSkJjWEVPVGlzdGtMa1FzakVkRGky?=
 =?utf-8?B?MTUzZ2pIRDc0d1RSalJCbkZVRSt1TU5KKytsTm5sQzJMVHJBSnlGalB1bVN0?=
 =?utf-8?B?RzJRSTZMSTlpanJka09rd1lxUlZKbHlRTkFrK3FGcDBCZUtmbWI1ODF3UWdJ?=
 =?utf-8?B?K21VS1YzSmFQNllDT1J0dXFLa3d2MG1aZUJwQ2NOd1JtalE5Mm5QOGJXajVP?=
 =?utf-8?B?a0J6aUgzZXJzd3loZmhCY1lqUHI3U1ZlUVdXOHl4bVVWdVpMSjcvcFYvbGFt?=
 =?utf-8?B?TFU4U3ZjejU5aEtmdXRCUW55WjhYUVV1MnFIL1JrUURXdFduV2V6UEJ2ait2?=
 =?utf-8?B?b2VMT2JCRmFON1BvQ242Um4wUll6a0NscmQvNEpiREUzZEhQR3RzZ1BzSkVk?=
 =?utf-8?B?cEpMMVVWMmpncm1JMWZud1JxSHdIUWFJUmdvalFQUHR4WEhpckJZd3owSTJj?=
 =?utf-8?B?NEx5SDNLR2RWb21DempaUmx5S25lZVFYZiswTWRTaFVNTVBsN3R1REFaSW5U?=
 =?utf-8?B?U1o5N29HYmt2cEJhRWE3eGdTMzVQdHdRR0tJaXJpcjNlUUZMR1Y5dy9NZnFy?=
 =?utf-8?B?eExrTFRSVkpaWW1VQVB0eGtwZnlFSjlKNlRlMXBOVmljRXl3Vm90KzhsaGFz?=
 =?utf-8?B?SCtCbFRvR1pYeUYxaGV4UUFLMGxzQ1lKaWRJYWYwWUJjK0s1UGtYaDNHTE0y?=
 =?utf-8?B?UWN2d29LSCtnUFplYWpndVNSOWNqazFwQUl0WjJJNkh0cGIwREtYRjV3cTJ4?=
 =?utf-8?B?YUlJc3hld3NYTGJqSzlEM3NtVHpLNGFEeTdpZHFGbG9lVFB5WDhYL1FyWlMy?=
 =?utf-8?B?QzFtQzhLWk43RzIveGtjMDdxVHlLUFhBOHpDM2J5NWhGaXZ6N0ZLeHRsbjFQ?=
 =?utf-8?B?OVZqb0VRcjkxT0VzWm1TTmhKSWlySzBlMDZyMHoxc2ZDUHczWHpla2NzUDA1?=
 =?utf-8?B?Q1c2L0ZVMXl1eHJqQ1crMkVuUUhyNkt5Yk80aDRJakZuRW1JOC9qQWNVKzZG?=
 =?utf-8?Q?gl5QWk6WjqpnS56cDGq5SI9+y?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f155d51-3085-4361-8bde-08de2b213cce
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 06:18:09.0704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VJ2v1+vqh2WVnkGC6Q/anEy/9VdhoStmoMDhVkx9z6FGOZrmw7NnM5FjbMVsFs35ZICt69qxLnBgHaJ2aKeJvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8052

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
 drivers/i2c/busses/i2c-imx-lpi2c.c | 107 +++++++++++++++++++++++++----
 1 file changed, 94 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 39088567db59..87e34746fad3 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -132,6 +132,7 @@
 #define CHUNK_DATA	256
 
 #define I2C_PM_TIMEOUT		10 /* ms */
+#define I2C_PM_LONG_TIMEOUT	1000 /* Avoid dead lock caused by big clock prepare lock */
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
+	int			irqsteer_irq;
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
@@ -1423,7 +1444,9 @@ static const struct i2c_algorithm lpi2c_imx_algo = {
 };
 
 static const struct of_device_id lpi2c_imx_of_match[] = {
-	{ .compatible = "fsl,imx7ulp-lpi2c" },
+	{ .compatible = "fsl,imx7ulp-lpi2c", .data = &imx7ulp_lpi2c_hwdata,},
+	{ .compatible = "fsl,imx8qxp-lpi2c", .data = &imx8qxp_lpi2c_hwdata,},
+	{ .compatible = "fsl,imx8qm-lpi2c", .data = &imx8qm_lpi2c_hwdata,},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, lpi2c_imx_of_match);
@@ -1440,6 +1463,10 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	if (!lpi2c_imx)
 		return -ENOMEM;
 
+	lpi2c_imx->hwdata = of_device_get_match_data(&pdev->dev);
+	if (!lpi2c_imx->hwdata)
+		return -ENODEV;
+
 	lpi2c_imx->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(lpi2c_imx->base))
 		return PTR_ERR(lpi2c_imx->base);
@@ -1448,6 +1475,9 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
+	if (lpi2c_imx->hwdata->need_request_free_irq)
+		lpi2c_imx->irqsteer_irq = irq;
+
 	lpi2c_imx->adapter.owner	= THIS_MODULE;
 	lpi2c_imx->adapter.algo		= &lpi2c_imx_algo;
 	lpi2c_imx->adapter.dev.parent	= &pdev->dev;
@@ -1492,7 +1522,11 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, -EINVAL,
 				     "can't get I2C peripheral clock rate\n");
 
-	pm_runtime_set_autosuspend_delay(&pdev->dev, I2C_PM_TIMEOUT);
+	if (lpi2c_imx->hwdata->need_prepare_unprepare_clk)
+		pm_runtime_set_autosuspend_delay(&pdev->dev, I2C_PM_LONG_TIMEOUT);
+	else
+		pm_runtime_set_autosuspend_delay(&pdev->dev, I2C_PM_TIMEOUT);
+
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
@@ -1544,31 +1578,78 @@ static void lpi2c_imx_remove(struct platform_device *pdev)
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 }
 
-static int __maybe_unused lpi2c_runtime_suspend(struct device *dev)
+static int __maybe_unused _lpi2c_runtime_suspend(struct lpi2c_imx_struct *lpi2c_imx,
+						 bool need_request_free_irq,
+						 bool need_prepare_unprepare_clk)
 {
-	struct lpi2c_imx_struct *lpi2c_imx = dev_get_drvdata(dev);
+	if (need_request_free_irq)
+		devm_free_irq(lpi2c_imx->adapter.dev.parent, lpi2c_imx->irqsteer_irq, lpi2c_imx);
 
-	clk_bulk_disable(lpi2c_imx->num_clks, lpi2c_imx->clks);
-	pinctrl_pm_select_sleep_state(dev);
+	if (need_prepare_unprepare_clk)
+		clk_bulk_disable_unprepare(lpi2c_imx->num_clks, lpi2c_imx->clks);
+	else
+		clk_bulk_disable(lpi2c_imx->num_clks, lpi2c_imx->clks);
+	pinctrl_pm_select_sleep_state(lpi2c_imx->adapter.dev.parent);
 
 	return 0;
 }
 
-static int __maybe_unused lpi2c_runtime_resume(struct device *dev)
+static int __maybe_unused _lpi2c_runtime_resume(struct lpi2c_imx_struct *lpi2c_imx,
+						bool need_request_free_irq,
+						bool need_prepare_unprepare_clk)
 {
-	struct lpi2c_imx_struct *lpi2c_imx = dev_get_drvdata(dev);
 	int ret;
 
-	pinctrl_pm_select_default_state(dev);
-	ret = clk_bulk_enable(lpi2c_imx->num_clks, lpi2c_imx->clks);
-	if (ret) {
-		dev_err(dev, "failed to enable I2C clock, ret=%d\n", ret);
-		return ret;
+	pinctrl_pm_select_default_state(lpi2c_imx->adapter.dev.parent);
+	if (need_prepare_unprepare_clk) {
+		ret = clk_bulk_prepare_enable(lpi2c_imx->num_clks, lpi2c_imx->clks);
+		if (ret) {
+			dev_err(lpi2c_imx->adapter.dev.parent, "failed to enable clock %d\n", ret);
+			return ret;
+		}
+	} else {
+		ret = clk_bulk_enable(lpi2c_imx->num_clks, lpi2c_imx->clks);
+		if (ret) {
+			dev_err(lpi2c_imx->adapter.dev.parent, "failed to enable clock %d\n", ret);
+			return ret;
+		}
+	}
+
+	if (need_request_free_irq) {
+		ret = devm_request_irq(lpi2c_imx->adapter.dev.parent, lpi2c_imx->irqsteer_irq,
+				       lpi2c_imx_isr, IRQF_NO_SUSPEND,
+				       dev_name(lpi2c_imx->adapter.dev.parent),
+				       lpi2c_imx);
+		if (ret) {
+			dev_err(lpi2c_imx->adapter.dev.parent, "can't claim irq %d\n",
+				lpi2c_imx->irqsteer_irq);
+			return ret;
+		}
 	}
 
 	return 0;
 }
 
+static int __maybe_unused lpi2c_runtime_resume(struct device *dev)
+{
+	struct lpi2c_imx_struct *lpi2c_imx = dev_get_drvdata(dev);
+	bool need_request_free_irq = lpi2c_imx->hwdata->need_request_free_irq;
+	bool need_prepare_unprepare_clk = lpi2c_imx->hwdata->need_prepare_unprepare_clk;
+
+	return _lpi2c_runtime_resume(lpi2c_imx, need_request_free_irq,
+				     need_prepare_unprepare_clk);
+}
+
+static int __maybe_unused lpi2c_runtime_suspend(struct device *dev)
+{
+	struct lpi2c_imx_struct *lpi2c_imx = dev_get_drvdata(dev);
+	bool need_request_free_irq = lpi2c_imx->hwdata->need_request_free_irq;
+	bool need_prepare_unprepare_clk = lpi2c_imx->hwdata->need_prepare_unprepare_clk;
+
+	return _lpi2c_runtime_suspend(lpi2c_imx, need_request_free_irq,
+				      need_prepare_unprepare_clk);
+}
+
 static int __maybe_unused lpi2c_suspend_noirq(struct device *dev)
 {
 	return pm_runtime_force_suspend(dev);
-- 
2.34.1


