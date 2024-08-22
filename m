Return-Path: <linux-i2c+bounces-5641-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C570995AB95
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 05:03:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A8EE1F28901
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 03:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 948541B28A;
	Thu, 22 Aug 2024 02:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="ISduPb/3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11010039.outbound.protection.outlook.com [52.101.128.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754641CF9A;
	Thu, 22 Aug 2024 02:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724295210; cv=fail; b=G9kfOVjQ47uJPRtRUvwEn+FZ0gcUacejWjslzUePkQ0FA8TwkLQcwYzepmmqtHkbVnZzSFYK94y2cS7Jde+1zACQkRtH/sJtwMSLZFsfDHPTFPn1qeN8Qyeruuqk5xcP0IvPllkRLuYQ9JMV9GjjkQB4XkMmq+Dj0J3DJ7jOOtY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724295210; c=relaxed/simple;
	bh=WZyz4atNcDdnBd2ecToK7tWTXYXLhKTgGMF9GhmuWZ4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=IvtadTjHQvZUi1qy4T+E/og1Ln8b/hsesxhlbRJ6sEwX942o6uD40KPoRKNXau0NDU+sadiLnH86YRvSHUiLqtCQhfroZVWm3i6e2P+An1jhZ9SFMKkbjnAlBIbsDBDD7PEtXzIHnNSRuDvNuxaqgBD/2cQZhlYgjzDYP2KTOvs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=ISduPb/3; arc=fail smtp.client-ip=52.101.128.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PVwKp1YP5VKn+tG6TynjP1vduJrSqw3VJ86nfJxMJIFuVOKfEIT+EpIr8Xa75OuXO0P0kGOQFnAgfz75E4+cLoncw7+HMp58dVcFcC3q+LHb8LlOj0Qq57eEZMm9hf9JT4G2UjbB0t7IOzzYK9J4g/gR9HexAfm6hoxtQaD7OLko/0rJwxVyvnmlnz4U+NkjBDuUorylfnEGgq3QMMMI5hTC/DxxKSnnBWy22n0J1hlBwWxS2HPdgRaocnXWC+tDSYcjWqwT176aKacFabPPmR9qsWZYSdFPOIuWZ1aU8IE8l9/IIHVTH2OJH4/N95U+AzrkHku1mQtu8V6Rqn3mxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZIVcNmPijX4RAefq6+gZY+jegilvtRg2K2+GoVVBD4=;
 b=PkgwbVGivb9W0p6159AAv6oWuN1pmTQvans+osHGH6ghVrl34lXH+vtk3VKdaEFPwwXaJzcxohhsVGeeGJmvP2eGJgQJRM0l/k9KmoaSdnrWRDUgIn21A5NdLpwwipQQh5diA/X3+KscTTVjZnj74yz2t8mMQCWHYzCL4CwbWK2/wB0Zf/ASADd5e0sANsp393LCEAmgnWo/Zla6dnXWvZTMVgbrRrs7FnBfDafk7YDhNOxOrTKPY72S/stJouYiDV4wEhVIRpsLW92Kh4CWZkYOqP8orJJvZajimgkNtckj0wcokNbXh93nWqG2C+xYtTzEYu/lOcC0ArnlaREZmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZIVcNmPijX4RAefq6+gZY+jegilvtRg2K2+GoVVBD4=;
 b=ISduPb/3stw1sAtQAk9dLkB8lif1Sj1xdAvQk4rMrPjZOEEWWEoJCsXBESK8egYe0KuqGF0nIkuisdjfJz+sXxsZjpSFjRTuZlWotbgLM3ZPgIkxWrbYn30wYlPVh5K6mPzehx1CBiJYMVnj268hXtgfsJIFhvroNF+0BE31Ho6HRFJAmxHMO/YHY2Ps31nUafL3DbiE+xda0ISV4yCPhXHYX9YNEbWCve3uBUu3MCZdh/Q1FmCD7ipVYgY6oDIFVR7e3VCniM7+QvrZfXaVQKPCCHT00e5Oykp0VSforPqZy6Ej0du0SbiV5OPmgyTPpO2x6469KvA4R1mZWs/hDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 SEZPR06MB6485.apcprd06.prod.outlook.com (2603:1096:101:17e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Thu, 22 Aug
 2024 02:53:21 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%6]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 02:53:21 +0000
From: Rong Qianfeng <rongqianfeng@vivo.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Rong Qianfeng <rongqianfeng@vivo.com>
Subject: [PATCH 0/2] Use devm_clk_get_enabled() helpers
Date: Thu, 22 Aug 2024 10:52:56 +0800
Message-Id: <20240822025258.53263-1-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0280.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::8) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|SEZPR06MB6485:EE_
X-MS-Office365-Filtering-Correlation-Id: db349048-4693-439d-f05f-08dcc25594e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2d+fqEgV9WE6KcwSTTqaVN5hKqV1Ao16R/V+ghfWtu4C1mJYmy24AdTaXMMf?=
 =?us-ascii?Q?KXv0QfpDqnLz4Le7rfrtJojgUC6X2wwD6JxDRjViUfmEyydH1PFe+IY4lbFW?=
 =?us-ascii?Q?61WUf4Et2VYuAaiChlexQprcZIpUa9PrMDUWwd9CIsMjMh7cdhMIbsQdJdi/?=
 =?us-ascii?Q?IFAN3HLk/Eaji46sIM+ORuJCQAgK426KYT5I7M8ZWn2/cclIMQMoZsjFV5Ot?=
 =?us-ascii?Q?cmh4TmoGB21bju3meOyOplOa2OK/rVFwxoRkrOFd/gKbnS37yxo5lLno6caM?=
 =?us-ascii?Q?aiX4rLGgMf4GvjcJNz4lhpT9wXuCIt7OEyEgue0aGkSmLL66BhGbHmis6S2k?=
 =?us-ascii?Q?041JiPi0Qm9/BbiLrCp6Yin64QHq3ncu1to6WMeqBAUX+1cw8Qb69d/0Oaml?=
 =?us-ascii?Q?2Csp6ydNLBl9hmahtyn4nuw+PiI0jOgnsuKT94fPPnWWVlBcq3C5LtgCLlhu?=
 =?us-ascii?Q?qOr6NvwomHh0WNuXjsq3v/ABQyG+6BJ0QJVGSfItUp3c1OuSOBIwl/tWXM65?=
 =?us-ascii?Q?jXkAhpBjnrO0hnL6cD7VB0GR9a2E19U4wSNmB1Qv2qefjfioO99XAK6cU7Eb?=
 =?us-ascii?Q?ZcJBJRUogAMdM8ZAPnyeUpeqIjEoItovsrhavbvoW5SlCT1F67IYhatX4qKU?=
 =?us-ascii?Q?tpy9k49Og8Qia1p9leCYZsTPg+2SjL6fyRG6Tl5Qo0GnNjJ1XIqnsAjp8rF+?=
 =?us-ascii?Q?V5UMrtEbwNCIz/imRWGZXYyVYfIQE0oVztm7JDfaqnGvt2/fnUJzvPD7ocH9?=
 =?us-ascii?Q?1ztmO8kUlzBPZNSkTDa/OCziboeaEovB0uJ4HBFHAxmlcsY2kiKTaE8hCJlV?=
 =?us-ascii?Q?tHayo5XY6H2DWvmV+1YpTirF+xqH7oC2r2SlJRso33IET8HaUiFE9B60+l6g?=
 =?us-ascii?Q?LZTP8RLx5ZTzo3z5bd2aQkT0v8bvQ/z9fporAJ2AsNPqJLn1b0nVrlG/R2Ga?=
 =?us-ascii?Q?g+QsktgeYWbXUBQx6E8o+7U70Nj+/ass4HHthwnCYGml1/QGZV8///HrqepU?=
 =?us-ascii?Q?J1i8FnWn0qRudtTmc+FFJVQXZwFSOKXbGzGuhmlok6BY0++dy5yKHGnLDNPA?=
 =?us-ascii?Q?0HJ63PE5tqscte3gUP08LFsxs7CH+mg7I7IoQ3yyxZ9sWD8XNgJE8NPfGA/d?=
 =?us-ascii?Q?kBghKxtyAlDGO+SohY7HkXvyGX0W3rqJ+XxODcSQkoYmEC3yOuJKtq0fR626?=
 =?us-ascii?Q?9KiHAW3fis3kJKLpUjm6zI+SrznJ9NfDjAQ466WB8zpmHyj6PwpeKWJqgBxV?=
 =?us-ascii?Q?84hJAHdRpLTtWjSwyt4eLwu+ZEzyT6HRlcsq5qigNhHr5uK6t04tfCyQE4O8?=
 =?us-ascii?Q?qX4y2CQiCh5MGOjhKJnjccr8foU/z90/w3GoIXZeRE85jYtzAX67UX2ZgMFW?=
 =?us-ascii?Q?jOOo6n9ZRAmqOB85f9/NQGLFESofKEStgXcMte5xsTV0LfjJgA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vNOuP1eLVbyiAAcOdUWj4qz0EzdQu1zlHWFURlHQQyWNIEsgqry7s51xfoiy?=
 =?us-ascii?Q?B/xBzHNtFWzxDIxcW415dHHMvjbOZ6eC8+xEicqgt0jw3hpLr6brv19UQHF+?=
 =?us-ascii?Q?aL7I/MvA4LftHSlVgqAvfOhQzy95/LtoWSN36d8/L3fS/PO9w5PAbctOFfsh?=
 =?us-ascii?Q?Lk0Y6wJp/iIj1muwi1kmyHa82EuImnAspeAZombJt+E+pI9OYCKGl5J/cWRY?=
 =?us-ascii?Q?xhPNUbnRaV2ksl1qX3NL5BFLdGJ2y7EZk88aQcpvE3aUNzMBqnIl6ZjbLB9s?=
 =?us-ascii?Q?pIaQS1DiD2PCcFCaTLNzhXe5UiSgflX4TQzjmGZ+1gsDPAj0nUocRiwoJ/a2?=
 =?us-ascii?Q?FqbbBSYqn27d04Hb5ApaYVteP/GuVRzP9Wx0NRuRvlApqnvfX4gYaWel5omU?=
 =?us-ascii?Q?dZt553IK2ji9Y1FH3pGtY2HpBL94veK9TOBvVJvyW7C/nyORhDD756sXY6ev?=
 =?us-ascii?Q?iP/KS/Xic95/AHFP1pMkxfKFwWzbrg4EOpbSQl/sV62gtLY2IwEP6/3cy3e3?=
 =?us-ascii?Q?bugBMJjqkym6nX43DyUT2bwvka/rVbOcC2cjk1wU9dgrBsoJqV9WkxLLp1YC?=
 =?us-ascii?Q?ZQhMpa9QTl0gQxPJoxvpSPs9GDdhbJgWfu7JnmZswntaP73H2LM2ip7JgAfm?=
 =?us-ascii?Q?N8FjT8cIDqaY8UfrQR34UBvyjo46yPZeWLOvIOWbiYq2VqtSRQKjpINbLPOD?=
 =?us-ascii?Q?UFOs3X9eQRdfe1dDIHvem4cYFw6XhnWhhRwwUwx0fzXVi8P4CTifzDYsyiwr?=
 =?us-ascii?Q?bY+nVU7/m5aOBzfeS1I4/gClu65uOWd+P5oGHXBPF3hKjqAyj2Zr7kHK9Fr/?=
 =?us-ascii?Q?PmA4PbHSJlxB6T1rRcDAVYEXN1jedUel85r+EAUZyRbhDF7AM+IEXvXpyBRZ?=
 =?us-ascii?Q?q5WbFBQ7z2fsH/blAy01Eo7yK8yCJJO0zl4e6s/Pq2nR0CGQkObugxMGCO3p?=
 =?us-ascii?Q?hS8B0erN7gA2N6QuSgpq8Wjz/bJ2o4R280D11MUlSchLYgHyzW30lK4E7Ne4?=
 =?us-ascii?Q?GgKbJsLXK9IHOn9rKyfKExPSNcw2htLobxcSS4VUGT80FqIvLk9rPyWsXjYM?=
 =?us-ascii?Q?te9l4fkGxEXhdUC7OJcy80aC4xNLU9keTiQ30M5rQ8itZOb67mQu32stZY1Z?=
 =?us-ascii?Q?r9BN7c/BiTWiNEZAOMFpyWqPQr1Fe836aRX9ktjBNT80ofzdjvcmWS7PgMwK?=
 =?us-ascii?Q?i7QFhmAjVQoOrZkyYxFItYdgytxZRSkp5Ton3R/hjV7rfNnIbXNU1j8UXpZq?=
 =?us-ascii?Q?Ds8IJ/fqlnKfzGiK+ujdFFyifEErxaZevHfeQRtfDBx2ZxLsyxh6HgTzQcAJ?=
 =?us-ascii?Q?z/fmrKUOMtMjowWkgJYpaAVd/ucnqg7JqatgO1AiKcTkrNV36/wzhOlhZb/J?=
 =?us-ascii?Q?SLVN5W2WowSVIgIWsS7bgcwsz0Ry26J6x2DOzX+LuiC6hKxMjcZMuR+G2PbX?=
 =?us-ascii?Q?wrdXo3DHqNBjhxFpvF0P3HBm2IUw+jBbHZwj+icRn8X3OZvyJzqaennfx/lY?=
 =?us-ascii?Q?C75KEEMlqDZzhOvHymST8QPoMs3cIdAkTgfLSuUVi1w9IV6b8byy76c9AakX?=
 =?us-ascii?Q?3seqjYZccLA54ebY16E9/NHoieJ3OTJly95wi4OK?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db349048-4693-439d-f05f-08dcc25594e9
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 02:53:21.3412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6xa3ICYXzPMk2/D3Aa4IXlSCPKoyUcrAAi9VvuW4vEErGFnAOTn0/W5Wm6ImbETkcneKPfwgL+O1U3oPWnSCLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6485

The devm_clk_get_enabled() helpers:=0D
    - call devm_clk_get()=0D
    - call clk_prepare_enable() and register what is needed in order to=0D
     call clk_disable_unprepare() when needed, as a managed resource.=0D
=0D
This simplifies the code and avoids the calls to clk_disable_unprepare().

Rong Qianfeng (2):
  i2c: emev2: Use devm_clk_get_enabled()
  i2c: jz4780: Use devm_clk_get_enabled()

 drivers/i2c/busses/i2c-emev2.c  | 17 ++++-------------
 drivers/i2c/busses/i2c-jz4780.c | 21 ++++++---------------
 2 files changed, 10 insertions(+), 28 deletions(-)

--=20
2.39.0


