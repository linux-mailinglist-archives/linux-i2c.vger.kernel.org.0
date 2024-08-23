Return-Path: <linux-i2c+bounces-5716-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C787795C3DD
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 05:51:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4ADCE1F23CC4
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 03:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAAF6381DF;
	Fri, 23 Aug 2024 03:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="ExzFl45W"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2059.outbound.protection.outlook.com [40.107.215.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE384A01;
	Fri, 23 Aug 2024 03:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724385097; cv=fail; b=nLrADhNqNn69S+jno3LQvlMis4++in++XNlRT1VwFPISA7QNIeKCCNLPI2NP/E4Vj3DlAIRvoLoxnvOt6k8yXOjFlVRzxvLzlxGZOL0s1Ih5hyoNM+5f0QqOa00ASuVVsv3P89540tgMrBu+oH9tE412/b/Ow7kwTYn1NVoH7ds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724385097; c=relaxed/simple;
	bh=nDs9LGZsFk+gvKJFOr8rcCxDQhjtPzIr8wo6m2C3XkA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=mE4jNlh7bRr8wjrVyoubntbfC9ymdtTKhHN1b3O/jlXle0ufdtXRevzaWPv9Ev8gHfde6qOUQAQFlAhhx27sYfD0iegEtpHPYHH/8SJhPF/GdJlCokzkR4AKIWvg1Xud9YvMAB0yufL0h7tAMcSJ6u8kLEMEFWjAb6Yvh0tS9tc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=ExzFl45W; arc=fail smtp.client-ip=40.107.215.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zUOnh3c/fYDi2azYMTGVJNVGCxRSzJHkZ7B+qa97nUbsikOnjDjGyzqXOOBFCo5K8rb8x/+g5lug+u4Zfz0fCncttTq35MphilF4i5AE9QrT4TQGmEOxwdBTFp4GuboDbc+SmtEtZLTvRbqBmdzzN2ZuGYV9hqR7BASY0qMvV2Jjk+X26fPTbqIppZ1j7R+MKsNcXnsChf5ys49NEnvbUyvW9DojT6X1tTbJNbjv6IlOf6e/xQ+9CkD3BESoHe0YpcN8+7A8OrdGapZ+ZDcpXw2Yfd4WTOEIuzCU8tYizty/EwD+3ci0ie9OZh9I9z9PxNkvObTxWBtxCAOIr0j94Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O+sjgClxwfqKbw9JdB53HFVvOxEhqtN+Qgc/PUZySzM=;
 b=p3AR9qTnRkOmZ6aDZM/vAPx7AU3CBJ2IQFBofP7kfyJeJ9zv8yYp7Gy2ZFAbJDvWZyrOJzWWTN9MfW8Awqktikgx0fYNtHcqYZaRqp9qJ9WVUMuQK/P2fpzE4AIcM64ftGlnB5kym08fRQE8e3ZGefn07CL3rl2ZNr++zzAY7ezpOlXf+njWsVYwEsIXW14ieROHEpPqBdTHGjjdMBIuTFoOiVuh9u6nWXWZ6Tcy0o3G6mUpukpfRDbhPOGehsOunoNb55froc8H6s9ehl/zRlSqHeH++XrsZsLciSy3UMqbhkDGai+ZoNZE4EjIO1C3oaYShH7VRp1v9mTB0BuhaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O+sjgClxwfqKbw9JdB53HFVvOxEhqtN+Qgc/PUZySzM=;
 b=ExzFl45W1D8POnfdQEnD9BUKStG9rMP/p0QNThfMigOTvabACb4+bp78iVFk4IEE1vsdBKnW4MRJsS+G52H7POEoR7LQvO0UgFveKrhIFo+BSazDPu6rtmtfYZ06x+dhzya/YOOvsxYugPssjS9qblWOtgQRmwdfT/K5zZ4zbmdLRBZoxFMvSbnhZzqWdcXkN/yAFMzxVR28s4B2TCzuS9vscK1yQU0Utp+ZyA4RPH2mtk4s3POfLI33jF9V9QAlPSufwGexdiK7IhwUZ5iLNu6MXdpMfgHjYK6Qmkzlj7Lcus+4D0pMHvKDY9FaZ9x55gQ/y4ynS2EpvX+uYK3MQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 TYZPR06MB5949.apcprd06.prod.outlook.com (2603:1096:400:337::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 23 Aug
 2024 03:51:30 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%6]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 03:51:30 +0000
From: Rong Qianfeng <rongqianfeng@vivo.com>
To: biju.das.jz@bp.renesas.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Rong Qianfeng <rongqianfeng@vivo.com>
Subject: [PATCH v3 0/4] i2c: Use devm_clk_get_enabled() helpers
Date: Fri, 23 Aug 2024 11:51:12 +0800
Message-Id: <20240823035116.21590-1-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR02CA0061.apcprd02.prod.outlook.com
 (2603:1096:404:e2::25) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|TYZPR06MB5949:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d8edc29-d817-4c1b-cd87-08dcc326df1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?74k9mxRj67jyomxZ/bgs/hfKsCCnekQO7Ru6QxN5fppJEE5TXBfC7A3qxpAK?=
 =?us-ascii?Q?2/afRWU/S3AyM9M8BgG9v1KeJOLumk9xMalbCq1kR4cPUknd3NkvxdTPDnfl?=
 =?us-ascii?Q?67W0QAQTkBKxoUjqSwhca/FZo8Sj06bJ90Guk+ioLL3ZU8C8aOigs1XKfSnS?=
 =?us-ascii?Q?+/WNFlBCBaZDvVoTGjoIzLwYyVg7vpc58JGmIcLkxyhxApTJmWAj6unk9rBg?=
 =?us-ascii?Q?rW2//Xf/kv5UO7aJIGWrlO69tRg5o6JdhADF+yPCsezyLM18Et8F2qIBx8qF?=
 =?us-ascii?Q?4XqPHn5CIRROt+2aY9jYiQPZEe+9hopzafvjtwgdZusBwCLQUcUWSXSLaNwt?=
 =?us-ascii?Q?562rk6l9EYcLjvEtOZbvwMHXfvWG1JuXSxWaRbUweKixc9HqQoCxv+46i2U0?=
 =?us-ascii?Q?uqKN1QtOxlINoAnjVY9pmqPxydGI6/91DZXqfu378BHInv1+f9Bgef5vq79A?=
 =?us-ascii?Q?qrlmaZk45iKBbCj/wceAmgJKGzLL8GcuT8AC3RgTRwp3Ev/gIb99VKU/0XGT?=
 =?us-ascii?Q?h1c2LKrv79wUVfRWsF1zYN+e148zT21hjKg88jRHRJYkJoFvKuzrxoV2ujIN?=
 =?us-ascii?Q?lOHi0/ugXw0XD+NalMB829oA3V08f8GkyYmA4Mm9XqycBqTMlhydAT/2ATAc?=
 =?us-ascii?Q?gKkw5nPrFJXEQeMrpXpqb++XL4mk/uo/2pyv4Hu1fB4M1Op80/ZhC5F6sgMb?=
 =?us-ascii?Q?zu7JTGey4+EucQrLIbncg4BcxKQoK8WybFCHKjdfGORR0dizqFz2fozwa5St?=
 =?us-ascii?Q?WUE7z6hw33XpUvlbfc0Wiy3lV+pckz8EmfrWx7LCqp3WfUfmOFJ/ASm0PkJq?=
 =?us-ascii?Q?jQrK0L4XLjVuqrRuL55cxr03EzWD3m4NJanAkOg0xXpSxszU5XKxcCfg/9rI?=
 =?us-ascii?Q?tEDJsprC8e3gZi/8HlDUEcQNfw2C9C0qRvTkdeE42ko0XRAqSEkHvpBPSYI/?=
 =?us-ascii?Q?hyhTnTLVFdrDfiU1EbmiVjI4SwhSmcyx/mDE/9dgLyJyVqG93mgK0TFJTleq?=
 =?us-ascii?Q?Ob/BvWUyagAzNjGFmAc8d+D0kf1Wm8qIq4tntQpkbjqlea6e53lawuTLNnUK?=
 =?us-ascii?Q?YQRJf9F+I1asUn+SrM+6fpPG+tM+r2enqvZKw1OAvKQVcu+9cujczF8bUyFp?=
 =?us-ascii?Q?PO5noG+KO2tIxplS3rGcyIrmBJJpdZpx7CJkdMPKC4SyQSCvTZBlU46Bsagj?=
 =?us-ascii?Q?fnwu0l1LIDAl+4vXjrT8EgcsHTBcqde9HrSJmw6HjZs42fSYeJkjaUnojSLe?=
 =?us-ascii?Q?jJ82XT/pP6m799Wt2QbWNHNiXzrliDrXhZMShjSoghH3TEYUo43UdEQ+Wvr2?=
 =?us-ascii?Q?5DVJNJKOxhjs5fOtB9QTVQpkpY7TH+qdixMN3jyfHHSRe0Y3EP7BTiLmoCQc?=
 =?us-ascii?Q?W/JkJRGxE1IlbG8dlMyvvVCwz/PT2iGOVSCJxt67HiWqpMtM4g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VKl2XPRxru8AA1NMk1NE68+lgf08wZF7tdp6QVzqEbvXVltaz7L+1RWWeIUm?=
 =?us-ascii?Q?4A4DIR5nV559oAEFQ3bnub1xkibv9fE+OcLzGMPN+4Jlfy49C4gTvuZfrEWf?=
 =?us-ascii?Q?JYfU6XvcpFgxAWZ1iip9XGEWeeNhTY/CiM2ZDB1Z2r1hLhJabDBZ9G6BU3Cl?=
 =?us-ascii?Q?uvs6FKQOiXGQxcQcmsF6m9CTD48x/86WUbgB0uOWlDLDp5AWqrefe1ckesJe?=
 =?us-ascii?Q?6psPcaDCWYVjfnhEumcBgfAcPc+d/YAXHShW6rxxiQ+d/igZ3ZMMiZOtx5W4?=
 =?us-ascii?Q?RxRysVORxCSP9kTMTDpb+dP9S/odY0pVcLlgw39RAtW/r8THlMD/aNoQmPzv?=
 =?us-ascii?Q?cErnYvpIbZwKW42u/1phmoL9Yx9f6F2XwJ6vQrYVGqC/EDceuOZWjw4AS20Q?=
 =?us-ascii?Q?jMp2JB+QU1Kz33vu/RgXgfenHf+Hg9O7K0C/WfAklgMtXwGBfWIXB1Zfve94?=
 =?us-ascii?Q?IJ3rsRFkS4XOyefcAX5CT9h8qv1L+0zbqH14FyVGJJ+semhCCGHPSe7XrVsO?=
 =?us-ascii?Q?ts8MlPF23vuPm3jbg0PdsYDeIbgmrsum6iEokCVbXDl4IsMuSai7qkt9S9jH?=
 =?us-ascii?Q?5T6+i+bHcYuGsG6Wo6m7P5MBE/V3QDrHEectYg0YhTAZYEc9xnMSF9lnPZ5U?=
 =?us-ascii?Q?vs9HvxRimVfgnhkahP6l+LTS+Lm7ttc7NAkc5msSXyYl0zMhB5RtQ196AmeP?=
 =?us-ascii?Q?gqGOvYSYeg5mGIYGzCsdrdfTmZdTbykm/SpTCr28NVuxXmYPK3raTBGQIukY?=
 =?us-ascii?Q?R9uLSi3ZXuGVqGfuPCXbY2oOGH+jUEAVMTzqWViPsG86tLNJyA3bx+qwr0Y1?=
 =?us-ascii?Q?lQD00wvsm4dgJ1T9Mdzac8UGBTOPeulBxQKn/GWq13mRPhyZgtgPYrIdSIn9?=
 =?us-ascii?Q?c50IdVdzkxvwVPPxQkJFZ03SB4HOsZNePR6czaeEWgBcGUNGMVurAVBaw+F5?=
 =?us-ascii?Q?t8v2ZVvQ8hVmt7KziZkRZy860ys0Qy9JMJP/VKFh9hbNqJkJsrd1claKWhWB?=
 =?us-ascii?Q?vFoPOM+lnKGrU5WaWfRPbZPi3tlGyLa8/yC4+eIXs5D8AH2Z6KH/Zbl1z5Jj?=
 =?us-ascii?Q?IUJuLFCeI7ZQevE5LP6PbEXP1MjjdOLxoXHnqtMsjB2JhtJqAT6tHQ8GGIMQ?=
 =?us-ascii?Q?o2EkdXD1PhJaWGHRpcHreIZkHVe0t4yjrB92MXnS8V4P1myiAjy7dlg0+QTy?=
 =?us-ascii?Q?WDc0HZQ0KLqqgHZ4BwhlY2sYp/xKFer6jkb6J9ADOOgsgjkxqsIDhySTlHqi?=
 =?us-ascii?Q?iEmYQIb7Jo9Qx0mcy3HcWe3nC+OX31glnrVnDxEtC7Q3ehugyuy3IlOHspjB?=
 =?us-ascii?Q?F6MEhYVZjaMUimOsy4xNH/ib0BpF2/BnwusgwLg7myfCPNa8anpESmyYDnYa?=
 =?us-ascii?Q?4YXMR+dc5hzpK6LObb8yI/qKbwPEZcHrp4Jf7tJ6MOOl4w4xp1h5nxbZBi5A?=
 =?us-ascii?Q?KbLNeIyABW7VAyh0Eo1yoA4wvGqeOhdAk7RKGy4my0Ftcekt1+LtrFTIoitO?=
 =?us-ascii?Q?rMcqGxxVqcVJKuyJ/CeQnD8hHQ220BAedBonQhXEJEAvdVS+gJelGpc00szz?=
 =?us-ascii?Q?8/qAf4CNjOjxpsk7S5aBjvJrplzxm6BDJHKm7zSY?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d8edc29-d817-4c1b-cd87-08dcc326df1b
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 03:51:30.1020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DmYuw69qHdg9VO3BzdXtT71RjUcrf08JjAky+JXKiD456TiavaCoVHw5JcjUOEcdLwS8i1npdLzFy/2gjVwcMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5949

The devm_clk_get_enabled() helpers:
    - call devm_clk_get()
    - call clk_prepare_enable() and register what is needed in order to
     call clk_disable_unprepare() when needed, as a managed resource.

This simplifies the code and avoids the calls to clk_disable_unprepare().

While at it, no need to save clk pointer, drop sclk from struct
em_i2c_device.

-v3:
 *Add another patch to use dev_err_probe() in jz4780_i2c_probe().

-v2:
 *Add another patch to drop sclk from struct em_i2c_device.

Rong Qianfeng (4):
  i2c: emev2: Use devm_clk_get_enabled() helpers
  i2c: emev2: drop sclk from struct em_i2c_device
  i2c: jz4780: Use devm_clk_get_enabled() helpers
  i2c: jz4780: Use dev_err_probe()

 drivers/i2c/busses/i2c-emev2.c  | 23 +++++++----------------
 drivers/i2c/busses/i2c-jz4780.c | 33 +++++++++++----------------------
 2 files changed, 18 insertions(+), 38 deletions(-)

-- 
2.39.0


