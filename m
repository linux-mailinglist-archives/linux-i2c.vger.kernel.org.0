Return-Path: <linux-i2c+bounces-12349-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB946B2DD94
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Aug 2025 15:18:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4A9A5E205A
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Aug 2025 13:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24E9731B118;
	Wed, 20 Aug 2025 13:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="k+xLl2q9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013028.outbound.protection.outlook.com [52.101.127.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2B117BEBF;
	Wed, 20 Aug 2025 13:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755695810; cv=fail; b=Ae3dk4+BvQaJBC3uE2jGb21+DugCEVEpsxmQS9Fma/3pOum4bYsLeljDzvyOGUrEQkt3JyQk29pBMhmzz/bPhputDL+/+4s74zxapcUneev1Nf59QXry5YXyA5H4sJ/Wriz2wrMC/Hh29X1yUtydbbwy4ltIOpnXJZR7Yyd/2VM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755695810; c=relaxed/simple;
	bh=D26rou4e+keGjfttCk/ggG2lBBwbSPFCjHxx4scl29Y=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=h11SuO/L+kyPoBBiLriXhDEgwlTyGwlT2zcaVAL2IIQTI8oTPGCJ/fqLFpvfyCiFRNi0CMBRDkz/eNCqmDe1xbi/pQHLlcL7l256hXTEW3c7OzYZajxG0ykOXyF8lgjBJ9c0OpwxZGyJ6wFyIkZvWrNSWZB2/H+X/gqgGMVlBbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=k+xLl2q9; arc=fail smtp.client-ip=52.101.127.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bjh/JWRbW1ENl0frhQ+kdgp0reH+VMVlgo4hDZB2cDtpH7hp0uOoZt/N5UJYmqjnBMs6tuBR2a0/DisPLGzkcN5NR5u4AR1BcQD5uVLVOysAlns3WcGMvzCXsbFyRxZ0HNquJ/sdPx71PelhYdp+zqF3AD/hTfQ24XPwDiSSuzo38CuevpAM5zACS7oGgJe4l0wM3+ckvWKaT7HN8CC3Y6iDDgIkSobvNfDc/wv/BdUA1eQxQnGe3xfLQGf11bUaR8CyA2UBjFBzvOZ/hVd3feJE1iRJTbR6FlSk/1EGnDQcnxBhPupTiqTj/pGEurOprLFcOyOVo4VmDxbRgszolw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x9GHEIfXl9TeR18zOwAbD44/8aBZZA4AdvQvWwcsBuQ=;
 b=sZrrUNCmm229HStXoI8TOMu/Qzi0G8JJeTM3bQsbz7iZvI8OKbwm4NeOQEq/5Lnzj5FEFn6QUTLLrCCfBgNYR45QPIWcnEeRoTY2ZLupDBjJv+WjNze0B5KqSIrSwZk7h56Bv5tWN+fDgYZtbdGZkecKSlsbx20FCFz1SUThJEuK/qkP1nLAVuU+z1peHiCsQyvQk2x8wxEaNbxzdXz2uwmSmpTI89DadAZUPZhrXJQ9DYzoPOnJJE7okzWd009VJY6t9foijrgKc8emWda5sYbxqIC4ksM/PWwaXL/tWVyR+ycOqTVeABqduDUJeohMuGlH6HtooOfBUxGuwlOpvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9GHEIfXl9TeR18zOwAbD44/8aBZZA4AdvQvWwcsBuQ=;
 b=k+xLl2q9eGGF4nDjwVXC1fTqsRQmxlwEyaHbZDoy6EBzk9pt8lAOdndPQ49SxgR0thXriAufVcUNUtitK5qewnRhUamkOaXsN8SDUtWkPfPlsZ6Yt9pMhVtCFxIAW6yE1Xm1zPL5QtF4vOHgarkYHWvN2ZpoN/5WTCslUUvloDDk7sp4U1bP8keWz1t9mlbI4giRvpD/dlbRGNdurvnEEuNl3hjKOD0vdgdR9IWSvDEwppeoXrIeLKPG+l14ACbdHMrstNuPaErUYZUqLOoGdrjYqMx6XU/1NAOYTxQVZjgTnKdcifpcpZ4oxCtE0dSUGW0JyXzTGzbybuoYiO1hBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by TY0PR06MB5306.apcprd06.prod.outlook.com (2603:1096:400:211::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Wed, 20 Aug
 2025 13:16:46 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%7]) with mapi id 15.20.9052.013; Wed, 20 Aug 2025
 13:16:46 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org (open list:AMD ASF I2C DRIVER),
	linux-kernel@vger.kernel.org (open list)
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH] i2c: amd-asf: Remove the use of dev_err_probe()
Date: Wed, 20 Aug 2025 21:16:37 +0800
Message-Id: <20250820131638.502644-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0372.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::20) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|TY0PR06MB5306:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bd6df8c-3fab-4c10-8b15-08dddfebd086
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lb0EWD78Pxs3b2f5izQFAtbdtYwZ6hSlXPwYcWyLBUaCfy+aBbGjn26GavFi?=
 =?us-ascii?Q?c3F2SjDaIfba+JRdXko63DcJz3QsUvSZMUYp6EX5TGaAz5w+kzEtV/j+mQUR?=
 =?us-ascii?Q?DloBrphPn3pwEUVgJAwfKH8QbnTUqkU+2dFlOtSAA9AXML8kj1HAcKghe6CH?=
 =?us-ascii?Q?P5oGWoJRGEjo7Z1lx+g5/qSJ2aeo7LpjGNThKM3L58cTXAjI2fER80Z5jqro?=
 =?us-ascii?Q?rNTvq7kZUpRVY1SxKkpDKDHRkgky0S375Yo6qNnzijWSUzWh/hQ/xaOLV69r?=
 =?us-ascii?Q?e6k2w0g0+mDG4b/qUqP0mSfF2zR9TIpyALgzLdVkwwBz3APayT3ulzwPt2/k?=
 =?us-ascii?Q?wrzlTlVbl3oXhDJAlIQxhZmL/SBzI8t6orcLjrp0XMx/zoyYES+2snwHzuMu?=
 =?us-ascii?Q?vJAJCMlJGbc7qLJUpaga5LXwmSsTqQqt3UDjoFzKKA26yIOsqPMWdpsVJrG7?=
 =?us-ascii?Q?nKV1wfxZd8LcAVbOmZFVKxZ1h49WQIZV9z6BytUbbKh0BQNsJTg3QOPx+3YO?=
 =?us-ascii?Q?hMG//7rh2Q0VuvROlq/82Z7tW2/RIJqGJ8bYlHYMnwe925rC5UzdCzsNnVBz?=
 =?us-ascii?Q?K8f6M9AtG2D1eXGsj0gWUqbmAaqB7361EEBoqDICFRHGIlyjxzM0r9H7f2ef?=
 =?us-ascii?Q?Ej4MxTuodd2UUwc6gs2xkePmaSDnTCIIWFUrimT6LIZrsJ6C24F0vyd2KlEI?=
 =?us-ascii?Q?ChR3JfYDcNTVn7ST8ykyvAC5VL8ZG8KY/3RbB3yWB8nhGUDqkPFz1RtanTwk?=
 =?us-ascii?Q?mRzcQ7VVT1gKZRF5jNaMXBUXg9IXCAp4sQXY86ZXNh4g2YtJK48TNYX8WucZ?=
 =?us-ascii?Q?IyACDIq+BMpEG3iGgmX/OJgzMJAFKx+BFIaKSmzl3A3AjJfYsy/CXcfm5gcD?=
 =?us-ascii?Q?SG677Oyd8trwsb1ep5BH6lyszj6KLEbA493WzQqU8s/665MbSd4n4WN7vyJ8?=
 =?us-ascii?Q?3h6/W69cR1C74rHV4iDqwiPlGXgpq/7HVSAsOTRIszPpEJxyjf3/xkrgbFVW?=
 =?us-ascii?Q?FY1ZtYVKv6KzKvZgfu4IR0dnauMWpoepo4knciNvp2IGtorg45z7UnPs+tRL?=
 =?us-ascii?Q?Set2YcgRVpYnVrr+/gM6GY0owV1+eTCxNq2wY1nGPzZgs7ZdGgz/MlRK9pIi?=
 =?us-ascii?Q?cuIWq3a0RSqPVP7myw7FxwPHoeYFHItnQecw8NT0/X/b97MginA2EbtyIrV8?=
 =?us-ascii?Q?866LcoVBwi9j+xJxCBADztBi3sw03HEvO7//8s5Wn5eM3ElM9u1eEHU2hNv7?=
 =?us-ascii?Q?6Kch6CrSVzhlhXi6YE+Kwr1ZlXs7a5jcSKWqObSeALmI2hlftKi3O5RWHqfs?=
 =?us-ascii?Q?sju/X63enrluqNrN9i8zVAlFPE/wuswP5aa9S3dqZYXntfuoF+as3o+pPAAb?=
 =?us-ascii?Q?d5cKeFgkXB4xEBgrUFp2YgmPxVjCu7i0KV1tRhnsjKxSFSEEvAdWjiHnPOwj?=
 =?us-ascii?Q?9HTZ5p2mMsY1Wju20inoiuaDl0kcsLrR8U8UxePQutv3DI5k3EEuaEARCfbc?=
 =?us-ascii?Q?/Pykk0UCOfgfoW0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5576.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?39LAW5TlZBfnVHqbiAX+Ac6pqHXlXMLa+GpUvrfrZq24PGbb2Ddnyy1UyTWz?=
 =?us-ascii?Q?SwLapzjaN8q5Q6y+BacZwe/82mNY/njfJShqnClFvhtiK3EgFT2radQoZS+1?=
 =?us-ascii?Q?1w0T6UBSv6ynWYenGrWkdA0GYioDfjrci1O5I9qzH+qJs5K25H78D56xlL2u?=
 =?us-ascii?Q?SICy5urZCWLw8tkval8TSadf0II3SGtOy13BZj0uxBMMEw4A4TYJE9u0x6cs?=
 =?us-ascii?Q?aymi+3zP1nV3KRpg+KjXTimRgcXi7wM056Yh0TlRJ4NwhcLgkyweJhAA0gi/?=
 =?us-ascii?Q?Q+NvkJS7t/0U90IJTI+GsnirfIcjEaHABgxKb4wF+TasfKVH4jmUlFygNPuo?=
 =?us-ascii?Q?HEdNAGNDe4rg/l6xEGG9tQC4uyhAn/HOkYFXIANWF44SRKYEHnA46saJ3zJt?=
 =?us-ascii?Q?m7HvM7EQDy8RDYhL9HrKA0eiXnXlYYhNhw4MA+YBxfhEOJXXnxsMzzIjkVZO?=
 =?us-ascii?Q?rt926PtPvLuknIRsr6FfKb/XeBys7SuQYToOyAZwuXeFNbyJuhN7uq9x5rMc?=
 =?us-ascii?Q?o8EtNBcj7E6zFUNjrl6LGuYg+3gPYW4R4oyrcDUJ+4J40tm888586aB7e+cv?=
 =?us-ascii?Q?/SaDJ6SaIdWd1sSRfRxbFhVwNDMNmF4PEujr5plFrxW9akoC6PpggF9wX96f?=
 =?us-ascii?Q?ttne5ZZpRE2l7bqvRMmNZ0W8toFXyhM29a5VmijxThzV1q3+8pRZA0hQN4f8?=
 =?us-ascii?Q?f3o+/QxL1m4pfP0NC43UeuHfdwP1tnq9mFAdF+rNJXQUn6YkYzNULArD4ptM?=
 =?us-ascii?Q?UK+2D+nwxKpHU6N1pgnxi13Wyh+kHaVTdUFjA6a2z//1KLdqghhDCJwmc/aB?=
 =?us-ascii?Q?knQ0JSg02EOdRAzNvvRlzPIrYMaVuNFmDgPgUWdmKnS2UdDzeMxJ3ksNv62n?=
 =?us-ascii?Q?YZoaN4rkHfsWYY1UCClzkKIOn3Y7FxDMvtJ2zejQXftogb96AASXU7+Z7nwa?=
 =?us-ascii?Q?FEbglOPa1MdXehwHaNeOx6nVYUSIhfCtKLuHCyWH9J7pgUmxjbiWJske6ZSL?=
 =?us-ascii?Q?t7wscBCY6Qw7Vb44GdXJGukK7nLtTEPcFF0HRRWu9A+SSpMSvCCKGKA8flHl?=
 =?us-ascii?Q?pdVmjJ8f5/q9tbDU21k1OQRmG4EjoOU6BhoatTBAyUm5YHymx72eZo38NIkp?=
 =?us-ascii?Q?Pm04s2RUsL9HgyuqZXE29E/1WjpMQTa935mi6YYguBrMKBIL/EU2RzkZafNA?=
 =?us-ascii?Q?gN3oZtgXCWYNzpU/eNh7RSryQIFkAjqoASzBHPA4ieFRq6+sBUtkAN6SsmqZ?=
 =?us-ascii?Q?dGwC9/PUh+W13eylhx1gdkcol/eoOzC0c887CBBc33aNLm+p8PC7T+6pRn2e?=
 =?us-ascii?Q?QvO2scii5OmtbCs++a3LxzJ3Auebc8PGABUoFcTdVwUnVpXhsu+QXK4BfAgh?=
 =?us-ascii?Q?4fouo4iTJeAnxJ4mb1e8tJn2TJFQncHND4JmUujnVZPJ2h0ivmHB8fxFCa0Q?=
 =?us-ascii?Q?GSg1JilCcXJwMMQO2C9qhZAfZopEdUT/kydFB2MGx00m6706+X45wvmo0T1V?=
 =?us-ascii?Q?HcVhsYylR/F677/reKXdMjw6pDYwyaKNmBFp0ytpAKja3llQkuDaSmhf+n4s?=
 =?us-ascii?Q?e69OaR9cy097ZqEJJNm2cEIjf5v8SxqokUXQOQNL?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bd6df8c-3fab-4c10-8b15-08dddfebd086
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 13:16:46.6932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2gVwZ0Jn9/l4J0U62bzkykezEK761ZuPqoDEvyYAN5KRCPC1Isop/xTVgYE8GpIv2N5g+Ua6xs4v3mPK9A+ppQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5306

Logging messages that show some type of "out of memory" error are generally
unnecessary as there is a generic message and a stack dump done by the
memory subsystem. These messages generally increase kernel size without
much added value[1].

The dev_err_probe() doesn't do anything when error is '-ENOMEM'. Therefore,
remove the useless call to dev_err_probe(), and just return the value
instead.

[1]: https://lore.kernel.org/lkml/1402419340.30479.18.camel@joe-AO725/

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/i2c/busses/i2c-amd-asf-plat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-amd-asf-plat.c b/drivers/i2c/busses/i2c-amd-asf-plat.c
index ca45f0f23321..1484bba46305 100644
--- a/drivers/i2c/busses/i2c-amd-asf-plat.c
+++ b/drivers/i2c/busses/i2c-amd-asf-plat.c
@@ -306,7 +306,7 @@ static int amd_asf_probe(struct platform_device *pdev)
 
 	asf_dev = devm_kzalloc(dev, sizeof(*asf_dev), GFP_KERNEL);
 	if (!asf_dev)
-		return dev_err_probe(dev, -ENOMEM, "Failed to allocate memory\n");
+		return -ENOMEM;
 
 	asf_dev->mmio_cfg.use_mmio = true;
 	asf_dev->port_addr = platform_get_resource(pdev, IORESOURCE_IO, 0);
-- 
2.34.1


