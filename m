Return-Path: <linux-i2c+bounces-5823-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F5E960002
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Aug 2024 05:49:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 18719B21BF5
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Aug 2024 03:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3224A84D3E;
	Tue, 27 Aug 2024 03:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="Kp0mwIGL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11010061.outbound.protection.outlook.com [52.101.128.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5274C823DF;
	Tue, 27 Aug 2024 03:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724730554; cv=fail; b=mQ+4e9+kw4ZCWbzGShTBSHFAm1kS39Whqo8Js96ui09VYz4F9SnTzGaVCUEWl28dWbE+P4vB6umkdQ/pqVsS72tPeVhjgCPcYwOYjKUsek6B0N+7l8wnEUOs5QnLXoJvFrIqsIBY6yMT1HWiWw/SGm9nAL/GJLLG6TqXOEBwGF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724730554; c=relaxed/simple;
	bh=LQwv8w26gHCXUOZIiNPEtg7mleZIu0UpGDzzZqQlinw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IE8bv/tP9GC9a5RW9FIGa64ZTN83CotydJ7gAjmDl1viru9wLRhVpFvl/u/J3jzwFMqBB5tPLhhGLvmYrHmni+IbzpZ7BV17O3Zm36XOItIh11qXzvcgAr8fPQzR8Cbk7HZed6o5fipi3GhfVAqHK8oRKfzQvhuTmobNO+ePK68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=Kp0mwIGL; arc=fail smtp.client-ip=52.101.128.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J+QOjqhYHNE3LvCzfVKnb1rxx/Fla8Dm1MOlbDZcogq600gc7vtBuc0TYL/8oJM+yGcJ/7RKolKwRnoviDKQ/AHGSkhd9n23qmNsXs4/vC1q92mimLLcRZni1tpoh2ZaorYBiHGBg90C+n43CxIGV7VPoTb/pHpTh15frpNzlmsCv3uTSPli+PIfgjSEUjPZ5QTQyYIekW9agCQC+p5uArdyXzNEieLPNoNeCL3+jeW9kIb746wNbE2wMh7DDsj6xVM50bKvVDGJbC1kInATZn1rlNtlWoBQsylxscWNGRKWXXwugSzExkN+qsNe6yC7bmHSrES1GqwjZMGL94lqlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PoWQwT3qKzI1rJ+Y673H/hRZaFJDhObg/J9+MUYW6XE=;
 b=EOYWUde+NcAouXz9LsRgydu+nKZceK4ie2iSoPlhJTd3HNPO7T13zHdHIIYF+vmEQ/rGBIntc8erUGQQE84p+o99thIH44f/Qgc8+0HoJc3kRGv/l+3VKWETC8oAKMU/fOdaXwz2C1ztqjh73lgvBd5eq9aSgNu1vsn+5JoGdrzwxw6UyDZcefTD28YHpYjSJx7Uy0bhkZumMOMGk9xiNeIarx+O+gk4g4UZHr+7RfzAh8b/JFCgHhAzu/tMVrAySOnaWXbqwqhaW9gtXS84g6PBJ6b1Vq/TfoLJUON+tUZUiQBoYDjNySngf/XLIIIygKpdm9x0CLJFaj8SkDgv4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PoWQwT3qKzI1rJ+Y673H/hRZaFJDhObg/J9+MUYW6XE=;
 b=Kp0mwIGL74obaVx8QztUw6UhYOVE7Mn/L5fWhE9StzyDqe810Jz1NQjZb03Ck21DEl/LoRJwgq+EcyK4BabCHh1sKDilG56qoeKxpzj1zAWkqF2QRhZ604uYW89gOPiBsw6t99lbxw6+Fc2hQXpUZNw/P7Yc7dZgNaxCwmxwscweuFZu7e157Bwb3z+nnxWfEeAIE8P/qeEYBL0fGt4n+ZHPpEgZ1HTiKKWLEbwZ011hyXEVPqmdM0/WvTzMlM4uaAlE0z7lVRfMcvOpDzf3FhkBlTHM8tTCWil2VEEPNAhRuYdrM9Ff3gAeAXRLNnzbPDjo8vzMqzF5jeQNJEUxRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 SEZPR06MB6531.apcprd06.prod.outlook.com (2603:1096:101:184::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Tue, 27 Aug
 2024 03:49:07 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%6]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 03:49:07 +0000
From: Rong Qianfeng <rongqianfeng@vivo.com>
To: andriy.shevchenko@intel.com,
	biju.das.jz@bp.renesas.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Rong Qianfeng <rongqianfeng@vivo.com>
Subject: [PATCH v4 3/3] i2c: jz4780: Use dev_err_probe()
Date: Tue, 27 Aug 2024 11:48:41 +0800
Message-Id: <20240827034841.4121-4-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20240827034841.4121-1-rongqianfeng@vivo.com>
References: <20240827034841.4121-1-rongqianfeng@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0131.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::19) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|SEZPR06MB6531:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c4936dd-41dd-4907-8779-08dcc64b33d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?crC9lWIw4MzMnKffu4Nt/aOx7ByI8wM6ZEffsObmXd72a1A0mx6QjtAIOxFh?=
 =?us-ascii?Q?td8qb4qamIM8mRbu3rXyAqyCrK/dDWErYon+Uj6PVzi6o5SH4rnHPf0ZifTe?=
 =?us-ascii?Q?Ji0G88CzHf2J40zsQ6Cl1hjJcy9nbp7LaEtKuhRXiJ2TVhsa17W37R3WJJ8x?=
 =?us-ascii?Q?8l3OwNB5+2zgUx4DXVasxQA+CGb62MZ3OSPTslbFPl2FzvBnlHjJy1qcUi3D?=
 =?us-ascii?Q?hvkrmJof2U+U+uXcV69tkzgXzfSv0wL5th0qAEpJTOc5ZtmVRhHrOlQ0Erba?=
 =?us-ascii?Q?CQM6Kv8CFh3wyrIpcj4maSu79JD65NDy/SafZZnJDQCimW7z54m5zQ5Pnvjh?=
 =?us-ascii?Q?Bm0PQf6il1SnMUurCDE5aA8FfR4jB3LUag0Fw7wcIYts9AhPBK7zXqqQz80C?=
 =?us-ascii?Q?mUd869HDf8P7DCJ3/e5GiDYQWusfVks0Ab1BnI4+CymODvxWlDX2NwZWMEug?=
 =?us-ascii?Q?yZquKSTB4c+TPKnnKaAR8JwfaIskqVPBE3VMb1ZYkN6nsleLMyRemyz9eDo8?=
 =?us-ascii?Q?a2enBtIoq2D8LZhFc7OJJaR2tO5J9wzytlpCcip7vytkRMY4yVP9WWdpTLdM?=
 =?us-ascii?Q?ngyqoTwXvOjoP3SdoT7P3unKciwiJ9mH/q7U4COD4Gr+TeKRikhelzwhVd2j?=
 =?us-ascii?Q?jx87iwyQPcMpEr8Zj95kVXkg6QYQ4XeAahN7lrHJFBdoE6FmtGVyc59BdgFr?=
 =?us-ascii?Q?ySQpWJRPB945shzFxb4l6WWU9UUbgeOU7cs86T+hB6XFi5LqIW6XkrIrcNry?=
 =?us-ascii?Q?dxh5PnzczSk3vcvtvR6Ahu3fvXm2dDlQSI3QbhaJiKm5OrhttldIqxWwxOUw?=
 =?us-ascii?Q?WTjR4o0M5u4G/b7BlG6VRefFawFWYiwFeQQi9/pu0bpwzhrvVVVc504HaNCy?=
 =?us-ascii?Q?lvKbiDrDwNfWgGot/pFc0is56CnGFsWfnNKoi9TM4c3nwSYUhGRc38Q24OLh?=
 =?us-ascii?Q?99M8EtR8krXNUgRKj/kI96m3Pgn0PBZyREdK4Yp0tOZ7x8lhZRcWF1xgewKR?=
 =?us-ascii?Q?ADUfzGx43x04XzWVNyhSkmzb0DLndlJ0pz8jwSYEmkrb/ZA91jhR0NmECCzO?=
 =?us-ascii?Q?910kgAdyikdyiklVWT2We/ql8yT7PKTUg54JCczZtsOTDaMnMFKdVvr37Coe?=
 =?us-ascii?Q?EECVbYayVuf4MXgSqecEzrtvBJO1bURXiRsNwhPY+pEzTnOk3Y5B7a3h1oQ3?=
 =?us-ascii?Q?WDQj7mq8BtTM40FP0WPRjx8VAJgFC1gGthghJagn4z7/YmkseRyH1pggap8p?=
 =?us-ascii?Q?XD/F800c0B/lrWZYtpx/kgJohLQ+LoC8CR4ys4rf5NNRG86r0cthNEsPSh/K?=
 =?us-ascii?Q?4IJTfOc4zAYIs5w8ocXxIGo4phlefeL5aJZ9bjYZeaOYlQji0sXqH9UnVsg5?=
 =?us-ascii?Q?O5Ea22Dg9MZOGcQ0p3qZMqMS62OEusRw93V4vXvz1KYWVB0w1Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?schs4vM61dEmtsKI7/Vrf3b8sVjvA5XDmcjtHPF7vJZBJMWixLMj9ZDPj0QN?=
 =?us-ascii?Q?ahyl3tlFohpLTqiae5slyKmTYMpqdhwcntPxV7XzUUOCfCV7M2ftDPUK9nGt?=
 =?us-ascii?Q?tlcbtlBdu534OFtBBcHG6mVjmEQif/nO/ISunJ2GpiRw3Vw4g1jar78driIM?=
 =?us-ascii?Q?jAuL3AaRlB8ql5s4czb1bpd60Zg8U+8QqTlfrfakW0dbXoufeK9y1kPt3nee?=
 =?us-ascii?Q?IFvk494TiYiKJRcj6R/Lz0agWM5py3CgCvpmJ8GPj8HHTTkBRgUORsDcAwgW?=
 =?us-ascii?Q?Z5/NB1y08KoLQ89V89yrvOTjag4/j2JxOD7d21Bx8joO6WicOMvm7OpazDdz?=
 =?us-ascii?Q?E9WZO4lgIS0cREjHaCOrwYIUk4HcL0iyTNWoQQQiwfUqT+h50CgOv9HLxI6Q?=
 =?us-ascii?Q?HkviubSItBGS50p/XRepgOLOAyR0F+9xZb4feBHg6cNhukHmZ0dzSNhOyygz?=
 =?us-ascii?Q?MCZZrjKq0RHRkWqQxgIuteZArmlGgNZeOH+1ipoVBGNqULeuLL6W3O0Y/eEh?=
 =?us-ascii?Q?rwAnbFEVMfwZLmie/qoOMYiPcbBiDj8iDOMxah5Lov/TYeu/4x4HujdeKikx?=
 =?us-ascii?Q?bWG1vWuupyu/BWI6Pvcnrof47XV4KfbX61zrjywaT67WaXKwMtITiXByumSM?=
 =?us-ascii?Q?8T9bm94KcKNfgBdC/LLsGFQSpxQc6EYQh1f3i54tdehyVaGYEzuZZF14uq3f?=
 =?us-ascii?Q?xSP4mIMltA64siKwDuJqeBZUim1LvBR6RWxZBgAQlt/kqq9U/TyQ67/8NTao?=
 =?us-ascii?Q?FjT5/lbZgq1Lb7mFke7UYgGSwt1aUFAAm0GotkL3pfkLa27A54XCTHpu1JZu?=
 =?us-ascii?Q?zx+gJFHmPyqhU4Ndldeych8O97+ersyHz4s25G7IHWaJQB44b/BFtHquisAZ?=
 =?us-ascii?Q?YEVm3/CaqqycWflilCZ64NzgihoBF+fm9T9scnZAgCPP6rqiONTSEDWYQM3G?=
 =?us-ascii?Q?wkkr0JESqOvnfToqUV9/U8EJZMEmySJ36eCWdlBfy5uA/mIhP2puPXK52TJ0?=
 =?us-ascii?Q?CQ9/4dmaqhbnyO+0469tri2p05gKgXfiO8YwPDRQrCmydUtYGK48IzRWllhK?=
 =?us-ascii?Q?oui4WSfJnPkYVxAGPL5xQKqT91tib/MzF/xjerjuLSEy+RJgDrecXjjXUgzh?=
 =?us-ascii?Q?SCCwXCvJramVjK9jt/n0z6QaRywJvfw5dnJMmkXqDmwyr86fvEOa9otQYEPg?=
 =?us-ascii?Q?hbVnti9IE1lSwb/Jktbd+Qeb8ninn8VXnqLwfmRti8dTRoxKtjiD5Ds0zZcS?=
 =?us-ascii?Q?tXf5sDiBMQTlZUTSR+hlPQyIqbQJ5GKjxv+teblN3+KhJHTboZsY/ygdc9iJ?=
 =?us-ascii?Q?wc/+7PUWcIhJhsNIuaWAgffKofsLFeqld5JUQqR5eqXDjmWoK34G7j8BbPQZ?=
 =?us-ascii?Q?q1W6IhrQEh4GGolKiHmXkQZr/phf+oHHb2pte3/DrTxs/HWS3VS8zLDjETOu?=
 =?us-ascii?Q?Bygd1LSerNZthb8435jzzwnBYF/V2LexmDMxrX0xKxauYA0L+StNoHciP8WL?=
 =?us-ascii?Q?kEP4xmM3knedLxJFo9ZFffTzhv5SVCPLiNNYxJr7EEPUMo73ju9BDhKGkyI9?=
 =?us-ascii?Q?JBYQKCKPzOKPdMLWSYHdWYi8nnZPj5ZPAjsZhVIk?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c4936dd-41dd-4907-8779-08dcc64b33d2
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 03:49:07.5787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zYODWBbYlQLVrXu+64S0GNBHj9d2x8JsEbmrW12JXfje0oIF69si+UADK7nJYCCmQmYgD1AoQ3tGG/tk8OBhVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6531

No more special handling needed here, so use dev_err_probe()
to simplify the code.

While at it, use struct dev *dev to replace &pdev->dev to
further simplify the code.

Use the macro definition HZ_PER_KHZ to replace the 1000.

Signed-off-by: Rong Qianfeng <rongqianfeng@vivo.com>
---
 drivers/i2c/busses/i2c-jz4780.c | 40 ++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/i2c/busses/i2c-jz4780.c b/drivers/i2c/busses/i2c-jz4780.c
index 92cc5b091137..72823a0f39c2 100644
--- a/drivers/i2c/busses/i2c-jz4780.c
+++ b/drivers/i2c/busses/i2c-jz4780.c
@@ -23,6 +23,7 @@
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/time.h>
+#include <linux/units.h>
 
 #define JZ4780_I2C_CTRL		0x00
 #define JZ4780_I2C_TAR		0x04
@@ -764,14 +765,15 @@ static int jz4780_i2c_probe(struct platform_device *pdev)
 	unsigned int clk_freq = 0;
 	unsigned short tmp;
 	struct jz4780_i2c *i2c;
+	struct device *dev = &pdev->dev;
 
-	i2c = devm_kzalloc(&pdev->dev, sizeof(struct jz4780_i2c), GFP_KERNEL);
+	i2c = devm_kzalloc(dev, sizeof(struct jz4780_i2c), GFP_KERNEL);
 	if (!i2c)
 		return -ENOMEM;
 
-	i2c->cdata = device_get_match_data(&pdev->dev);
+	i2c->cdata = device_get_match_data(dev);
 	if (!i2c->cdata) {
-		dev_err(&pdev->dev, "Error: No device match found\n");
+		dev_err(dev, "Error: No device match found\n");
 		return -ENODEV;
 	}
 
@@ -779,8 +781,8 @@ static int jz4780_i2c_probe(struct platform_device *pdev)
 	i2c->adap.algo		= &jz4780_i2c_algorithm;
 	i2c->adap.algo_data	= i2c;
 	i2c->adap.retries	= 5;
-	i2c->adap.dev.parent	= &pdev->dev;
-	i2c->adap.dev.of_node	= pdev->dev.of_node;
+	i2c->adap.dev.parent	= dev;
+	i2c->adap.dev.of_node	= dev->of_node;
 	sprintf(i2c->adap.name, "%s", pdev->name);
 
 	init_completion(&i2c->trans_waitq);
@@ -792,26 +794,24 @@ static int jz4780_i2c_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, i2c);
 
-	i2c->clk = devm_clk_get_enabled(&pdev->dev, NULL);
+	i2c->clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(i2c->clk))
 		return PTR_ERR(i2c->clk);
 
-	ret = of_property_read_u32(pdev->dev.of_node, "clock-frequency",
+	ret = of_property_read_u32(dev->of_node, "clock-frequency",
 				   &clk_freq);
-	if (ret) {
-		dev_err(&pdev->dev, "clock-frequency not specified in DT\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret,
+					"clock-frequency not specified in DT\n");
+
+	i2c->speed = clk_freq / HZ_PER_KHZ;
+	if (i2c->speed == 0)
+		return dev_err_probe(dev, -EINVAL,
+					"clock-frequency minimum is HZ_PER_KHZ\n");
 
-	i2c->speed = clk_freq / 1000;
-	if (i2c->speed == 0) {
-		ret = -EINVAL;
-		dev_err(&pdev->dev, "clock-frequency minimum is 1000\n");
-		return ret;
-	}
 	jz4780_i2c_set_speed(i2c);
 
-	dev_info(&pdev->dev, "Bus frequency is %d KHz\n", i2c->speed);
+	dev_info(dev, "Bus frequency is %d KHz\n", i2c->speed);
 
 	if (i2c->cdata->version < ID_X1000) {
 		tmp = jz4780_i2c_readw(i2c, JZ4780_I2C_CTRL);
@@ -826,8 +826,8 @@ static int jz4780_i2c_probe(struct platform_device *pdev)
 		return ret;
 	i2c->irq = ret;
 
-	ret = devm_request_irq(&pdev->dev, i2c->irq, jz4780_i2c_irq, 0,
-			       dev_name(&pdev->dev), i2c);
+	ret = devm_request_irq(dev, i2c->irq, jz4780_i2c_irq, 0,
+			       dev_name(dev), i2c);
 	if (ret)
 		return ret;
 
-- 
2.39.0


