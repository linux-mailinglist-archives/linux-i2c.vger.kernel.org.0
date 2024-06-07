Return-Path: <linux-i2c+bounces-3897-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D748FFEBE
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2024 11:07:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DBC71C21FD6
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2024 09:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8549115CD60;
	Fri,  7 Jun 2024 09:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="GH9/aq++"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01olkn2063.outbound.protection.outlook.com [40.92.52.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0AA15B543;
	Fri,  7 Jun 2024 09:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.52.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717751169; cv=fail; b=nVuOtuZHo91IA+eYBPZkuhoD3PHfaO6z9/CUSLEPFIxADU8XUa83bvd5nMKDAIiJr8KSf9t+PKelTeYgpXeuan0l8m/TLDbeCGIVq5k8YG89VtuOiVZvNZq4zi0WQCHPniT2Tq22gmOKoxr6+UxNH7/3rq2OIJsj+apcwd71G7U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717751169; c=relaxed/simple;
	bh=VY7wv1HEqDfNdAKGYiSmQtDVzl25D4YxhdLUbr+38CE=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=JPEzto72EWdSZ9s/eMkGT83470oAAVWIWe7tWKk9QzKT9PQKl1snYOkU+sfnAGKtSqa4vxfbzmIsYhet71O9YxcBPbH13UAHDnz7yg/R860LWBVXdxufNLe+F4GkDsDIUypmVepDnbx8rlTMOTjw+Tocm5jMXTFKDawIAOwfPaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=GH9/aq++; arc=fail smtp.client-ip=40.92.52.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bbrgOUWqGbcliOHVv9qKSZJa46U7Eo8vtZ/t9Wl3Xr3gu7m11RA9MaFEApcQzCFTB2QF5JqKSRx0yMeukH56dxMwghd8ahRAXEoyo4l/COZ5tYE7lHDB1KKWB2hCtmlPfbJ7O7b2qeMjNjWlxIuwNP717KrBvoN0DHAwXJLM5HUABOu4pHIyztGkbtj2eYOs7P8dU/2cw19yvh9nTShM8vK223u6hXz1WVjMKNuEZZIagW6p9SfiFgczyeuXJ7ks5dkmipdNMb58tFlmdoZujxie061LICwob3abV5t5Kn/UR9Ym764BuJjkFxtPnyXOJgWK/gN1kOGXyFmLMLDKlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tV9HEmV0ibi36kbwXlPd9vt9ER8qleOcsKCWfJgCrng=;
 b=aoZJd5rs0SKIJxcFRV79llF2deKbGtijHmRa/4EBBrEn1i1tyFf5U4y+bxl4dm62WUHMV4hfa/vngKUiUG1xs1XBhF/1IoF3WXek8FzPQVdNDC1gtUIDun4czxTeX3yJ6TEwWfDKj0vC83ynfsnKOhTAKnfcbcBa6txhqcqNoS9UrystEan06j79H8H59U27Yh/TPcHcUj/+K21ZKi6hd7J7jL+HwYOAN+mglUKB+lkpYOuxUmxCLuTt0943TjNQZY/kGznu33x/i39AUYeydT+JzKldBm3IiVsMtEH54zqg/SoTB2i0QePzTxNvyyZ+arWfMEC++rv+ZgEhvMBcyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tV9HEmV0ibi36kbwXlPd9vt9ER8qleOcsKCWfJgCrng=;
 b=GH9/aq++8q/3CWBdLmKqmNgmWn1jzo6MeSmcjTFd7dTP5fktgv7SkReKS9jaftiOmlQKCYn4gvObk2lASc3d6m0qBcxHaVKgVxunRQcuNz34ChTEDyTuUnDHwc3OHowFfyiW4WSjuBIllllTQRjw7T8L3eSRPaI1wHehQTEu5k+bIVqWYC7rE9/luPwnBWTxrxABVPuk06emo9zWpjKuAzzQ78Wv+wn8LSgHJOTDjqNT0MryWbhtHrHd/NyZ32C5X+CaPEASjeoOM3boaA/jaRjFqZkbapouYb2oC3k80kt7WW/1FEiVOhrOU5yh6duyEluAmqmIfATJdXvMdIsEpA==
Received: from SEYPR04MB6482.apcprd04.prod.outlook.com (2603:1096:101:be::7)
 by SEZPR04MB8048.apcprd04.prod.outlook.com (2603:1096:101:238::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Fri, 7 Jun
 2024 09:06:01 +0000
Received: from SEYPR04MB6482.apcprd04.prod.outlook.com
 ([fe80::ca2b:8a48:a7ab:60e5]) by SEYPR04MB6482.apcprd04.prod.outlook.com
 ([fe80::ca2b:8a48:a7ab:60e5%5]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 09:06:01 +0000
From: Noah Wang <noahwang.wang@outlook.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	linux@roeck-us.net,
	conor+dt@kernel.org,
	jdelvare@suse.com
Cc: corbet@lwn.net,
	Delphine_CC_Chiu@Wiwynn.com,
	peteryin.openbmc@gmail.com,
	javier.carrasco.cruz@gmail.com,
	patrick.rudolph@9elements.com,
	bhelgaas@google.com,
	lukas@wunner.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Noah Wang <noahwang.wang@outlook.com>
Subject: [PATCH 0/4] hwmon: Add support for MPS mp2993,mp9941 chip
Date: Fri,  7 Jun 2024 17:05:40 +0800
Message-ID:
 <SEYPR04MB64822EE797B0CB024A913DFFFAFB2@SEYPR04MB6482.apcprd04.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [cxJaOapP3Zqa7nBbvaUh4GdYPNO27yzx]
X-ClientProxiedBy: TYWP286CA0001.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::12) To SEYPR04MB6482.apcprd04.prod.outlook.com
 (2603:1096:101:be::7)
X-Microsoft-Original-Message-ID:
 <20240607090544.466833-1-noahwang.wang@outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR04MB6482:EE_|SEZPR04MB8048:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ad826a6-14d4-4020-52bf-08dc86d10d45
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199019|440099019|3412199016|1710799017;
X-Microsoft-Antispam-Message-Info:
	X4tTm+I2/fmQQLgo0MqtqTfZCHkJhynrOjXwVHmdbh6QNCwIvK8xFyJbdTzyM0V48RD8sFtdrAUVkL1ieLuqDQC3P7hNfay3VrbY7RtQwlvkxJa4uapU3H7oDygpPqdosAmZgZCqpX2xzC03FE2pxwgt6mgnVfb1lcH5BDX5l87WLU15hJepoQVBhpPY1a6xCSzGraGDiq8vKBMZAqu1/LfH1Zhtd68WOzd9iCppLeP/7DP5OgDy1sD8fCC8tMyrvWrHfROkaDShTRvkeXkNYzKl3ZB7SLsOVykFp8X6/PWsuo5E7lOfY2vH8rIyfSngIMzIaqaQEIaBbsG07OJeeA4v472UbNH9dTkkKy+fYeWGIpKom28XgM6wsImIx9FOhTRs2E1Qpwudvh9QN3dGn7ckpn0LPH9S/DyJ7IGdGAKa8stBqYAcMJ/VbzUBpc2UOIPGBcSPipG51TE5hq4I8ZgSNiaYZuziEmEVaXeJAzwQaW2zmWDve4ra99trSWxxekezO8ATPCnOpLrbGrcSakL02ZIpesGUUfdYj3gdCvPwT2mipyp+agALDh7iFHMtoCd1OvXtyLmNju/OAhTYlL/56C+2iUoV6xSS8IBJpqo7dh8dEPnSbdMH11vCxGbR
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aeS9bxtl2CosS1xF8GOc3jgZ8PlxAYfj570Ts/bVOcy7LlUY0fV2HKz+Lxdj?=
 =?us-ascii?Q?W4ymxZMHcMWgIQVHitY95TldUDD02YSlH+dlHCCUdfu3GccrAvtuZI57gbE1?=
 =?us-ascii?Q?WCfxnt0aWoC5Xd8/GtfjswUGDJ6tziMEiPFLXM/Eci9KWU61yiS4K4H29Gnn?=
 =?us-ascii?Q?vVHAw+mGMjz4ttlpfo+4BdCt4tmQ+9N5R2fm5uh5ROH2w0U3+QcdELzLI3SY?=
 =?us-ascii?Q?tWQwvNxPdwszv2OCmneansEqlxdpCLC/n+/Sl1kdHD3VYJpwiVCNJgEGAmkW?=
 =?us-ascii?Q?A9lHwglFOkxRTCeOvxeEDWTZd3V0hZ7xXhuZoYfXpJ+K6g4aMSdp+dQjrOU9?=
 =?us-ascii?Q?/53HXnUOZGqQ4BI/nzQ4TCIsBfNIwAZI1n2EEFVERjKtMtuz5tqO3WSfnci8?=
 =?us-ascii?Q?F2egSIsPWgH5jAuZyiCVqaYqJOhaso07DueHhYt4kB7NKRoEjgxbs2a8OSOG?=
 =?us-ascii?Q?9K8O19smq2WOu+MubGceWebEhKkk0hilprVVk/LcK6tvBBc9ijmhk20jZdbi?=
 =?us-ascii?Q?6JOXhx9SDrHfW0O/YTXg5/BTInOvcc3na5EqIrClopPzufSOoueQZ8qVtokT?=
 =?us-ascii?Q?Zon3aW0M3CCs8wuwinZtIalaxaAPdqqQYC8qxg8bX71HS2R/SHvSMbXmidjM?=
 =?us-ascii?Q?3c6QW8YXwx8G6ON6yLgUuyvd6Mdc8Y1qUYL75llWmZ44LaTAZiD78asoF1p+?=
 =?us-ascii?Q?toBBTlVaPbfl14Z5zs5pWoZQ5C3bFM4vzfy2piAA2V4NDnbu6WEOraA7qK6J?=
 =?us-ascii?Q?wwkL7D3yNKqtzbygJTNVcLcQbtJyTlhuzED45o/y9J/pb/S9wEDCz/Lb/kYq?=
 =?us-ascii?Q?aGwyGhHwgE96IRGJ0M56q/pf48+RZ6xXtMocPYJZ3AUittwyS3c+EqsMKQnC?=
 =?us-ascii?Q?zxb3fyiJRwthm6XyEsL0riZ9sCnX5OfxYtZAvIlTcBq5MTHRxh6kCADXPiku?=
 =?us-ascii?Q?4vX0f38710EH9IPNfW4T4q7AJZC7C4ihv55XDflSF7S7a5Ek2faKqyyVGRKx?=
 =?us-ascii?Q?DO/0Sp0hw/9Mu14mYN3hDqc8xiJyLCVwEkTRy4M+H4Yh+sgixsA3Ja+yDC+i?=
 =?us-ascii?Q?rbJl/E66icrMjPvFOQXZ3fAAwMVcWAH/+nRbGjVNIGjO/zvxX22rqRGPYdgT?=
 =?us-ascii?Q?OAKpcnIqwcFn1yZbHqq1+DDWTo3OVDr5UcnfVSIie2BVz0BLnaKt7iRzW13R?=
 =?us-ascii?Q?4XoiWzNnpuMftN9r9v5C2nsdVo7T45y/mEFa2xuPRwYJMpQ6dCAExIhGqCba?=
 =?us-ascii?Q?lSqWZjjQtvDGMtUqIBtV?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ad826a6-14d4-4020-52bf-08dc86d10d45
X-MS-Exchange-CrossTenant-AuthSource: SEYPR04MB6482.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 09:06:01.3051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB8048

Add mp2993,mp9941 driver in hwmon and add dt-bindings for them.

Noah Wang (4):
  dt-bindings: hwmon: Add MPS mp2993
  hwmon: add MP2993 driver
  dt-bindings: hwmon: Add MPS mp9941
  hwmon: add MP9941 driver

 .../devicetree/bindings/trivial-devices.yaml  |   4 +
 Documentation/hwmon/index.rst                 |   2 +
 Documentation/hwmon/mp2993.rst                | 150 ++++++++
 Documentation/hwmon/mp9941.rst                |  92 +++++
 MAINTAINERS                                   |  14 +
 drivers/hwmon/pmbus/Kconfig                   |  18 +
 drivers/hwmon/pmbus/Makefile                  |   2 +
 drivers/hwmon/pmbus/mp2993.c                  | 269 ++++++++++++++
 drivers/hwmon/pmbus/mp9941.c                  | 328 ++++++++++++++++++
 9 files changed, 879 insertions(+)
 create mode 100644 Documentation/hwmon/mp2993.rst
 create mode 100644 Documentation/hwmon/mp9941.rst
 create mode 100644 drivers/hwmon/pmbus/mp2993.c
 create mode 100644 drivers/hwmon/pmbus/mp9941.c

-- 
2.25.1


