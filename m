Return-Path: <linux-i2c+bounces-11202-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D567ACC6F1
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Jun 2025 14:48:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F26A6167151
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Jun 2025 12:47:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37DC422F767;
	Tue,  3 Jun 2025 12:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b="NTyi2WCl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012028.outbound.protection.outlook.com [52.101.71.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907C11DFF8;
	Tue,  3 Jun 2025 12:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748954855; cv=fail; b=udYqw/VBnUpzLsno9U+2dKrCWCfkmyu/zCtMDrFFcZ/RmpbaBKhyhKewAMERnejiwyHOlLNkX6Sgd69nRfwGvsDGINVUieQOUGP9x48xYIWYp0vKrm9NUd3sxQ5U+bMGuXs0kk3U2MmcmJKkHhjdcmTmlLwdDd0tOLPHeu3fsEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748954855; c=relaxed/simple;
	bh=2TvzqW9N3+cKSnMQK7F3e7V9kyyZtH3QvEgFz+4Qk6E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UbdLwiS6BZQf6vtU+fpxwPk61yH/ptmNr15vskUFRbKlrPinhaUJZ16IBsfs5Nrv9J6QBaLGxgmkuagODuj9VD9zqRSe2R2zGPY0JBl4Md6M1eVOKr2dzcjgpEerwNdk7+nfdIt4DUD6djfiQ8K+lfup9kKLu6Mpgh1A3FPOnVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=NTyi2WCl; arc=fail smtp.client-ip=52.101.71.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wnBhst302z3J71icRv/6s13WTA42wzFai+aulVGtQ9cHGlnSaLeO4SUpt/dQ4IeGpLD4M5DDTX6jr4kKD2zgThnAKQ1h1M0rcvDT28PgvRTSgKBokE2nmF3T3XiIPvDOkg6ypR/KYq634hE7VBTb1NfXYH+dE6jYpFgBDDKV+KOygSn47A+MUWlXcrvZtgniHBipBfL79ixCtHfbpR2KFv3v04aFXg3/VBMpZMm6bF3nJhrmfa539TQuPh0hDlNCjj/6BLA9s1Y7Da9Tdn2OXKxs1KBrv4EpdYpdpF37GuANbX7KHxL0cis+4Zg8Ssk+Jj/42Aim09GnT7bImPVPqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9KaK2j/jizZifQ71DI0SgeL8R/zpeKvPtev5DfBiO4=;
 b=M1LyyQvykOyhFI93c/53KOE9DbxPUfGUgrizUblGSZhD8M8x58lmPhPn452vbRbinbT8qs2AOyUbCfydV9RqU2EYGW6kalLgBFB8ZVITMWf8A6nYOqfRkXCDm6NwPI5IV/PjxY/CmUYli+MPqi2G7dtE0ZzQm97MwqFbEeeXFejFHtge7VhJSo/ElomiFCZsijlxTFbi+BkTOzvLpJx8OArpmrEZiPu9t4F2Xb799F8GU3QeKcD1XCQp9tHM/9aOYkHVC3SfEu9u7LW9qeC1ktJNclPAfc6uJD53rUO9J7l7E4IQ/Zji2QyhFGHQ5q+JMs7Vx7dckbpTsJeedJrdnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9KaK2j/jizZifQ71DI0SgeL8R/zpeKvPtev5DfBiO4=;
 b=NTyi2WCl9nw80B21ex61FXhuc2rTsVW0dQS19T6vcQjSQP1qGBjgOf4sN+H+daOL2MbjKDo5DjTNd7M30GDrb9n5rD8IaQYhMIja/MLfFHZpIMFd8qtkK33xpljgq3Y8zkTZ1ORvgfhRxv1poGPyoRRl/zR7l0DnYm+c1qa0a8o1b/pcNhBC3xBqPIs4a84srG7qOnmcMvboEmvYINHB2b+AOqLq7aKypIWPCzbamL8vQuzL04sdbb3PKYAfuKjGjSpXRmiY2vGScGnG7FKGoVVdl3goebDQYtWnfLd0OudKsR5xBApbhFthOwQXRvX3+Ow5AyrWuTq1k/HTK7iC7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from AM0PR0702MB3794.eurprd07.prod.outlook.com
 (2603:10a6:208:19::23) by AS8PR07MB7510.eurprd07.prod.outlook.com
 (2603:10a6:20b:2ac::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Tue, 3 Jun
 2025 12:47:30 +0000
Received: from AM0PR0702MB3794.eurprd07.prod.outlook.com
 ([fe80::aea5:bbb4:c75:9faa]) by AM0PR0702MB3794.eurprd07.prod.outlook.com
 ([fe80::aea5:bbb4:c75:9faa%2]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 12:47:29 +0000
From: Wojciech Siudy <wojciech.siudy@nokia.com>
To: linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	peda@axentia.se
Cc: andi.shyti@kernel.org,
	mariusz.madej@nokia.com,
	Wojciech Siudy <wojciech.siudy@nokia.com>
Subject: [PATCH v6 RESEND 1/2] i2c: muxes: pca954x: Use reset controller only
Date: Tue,  3 Jun 2025 14:47:20 +0200
Message-Id: <20250603124721.449739-2-wojciech.siudy@nokia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250603124721.449739-1-wojciech.siudy@nokia.com>
References: <20250603124721.449739-1-wojciech.siudy@nokia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0180.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::9) To AM0PR0702MB3794.eurprd07.prod.outlook.com
 (2603:10a6:208:19::23)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR0702MB3794:EE_|AS8PR07MB7510:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d355c98-2bbc-4a13-6627-08dda29ccd22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7tUYqa45JQRj1hqQzHX4ejttHV/TiB29MuqFQb7DiNjct0Ga+gIHwhyAQmdr?=
 =?us-ascii?Q?qd5IHSsMwqOxlnq452L18mtPzwYmapvE6Br+9qF0Aiy8XLqVMZqkJyyyFEsv?=
 =?us-ascii?Q?8qPOAEoRC7EEqcH01OzsI+bE7TPixwcdTxw16xfzYYg5OWCnLmC3y6Q6xUPx?=
 =?us-ascii?Q?h+Nc7lBoIoHWri5pkpUk8B/93P2c84pY0ruxKiYp4aWyiatjlsNfz7NJ12KI?=
 =?us-ascii?Q?nBvCr1L2ZtnDyW3FoxWl1FMqtoDe5nU5TAN4J1XvZMxyhEPNSnsa5gZ+UWuS?=
 =?us-ascii?Q?P+eTSMjzKInAm8h6GJavP4FeSehoYtAOh/HztQVhuAYnPofs5O0najwJiET4?=
 =?us-ascii?Q?l9Njl7ViQ7mvp3pClAptGSyNb8udrtGLvwYC2NkgdLtcQqYdyD+BH2QTfVGe?=
 =?us-ascii?Q?JLI6lUd6Tw50ftYCTdQfMgZam6E2ECuNv+buTWyauOkEq2SZnbcYOKqq+Eor?=
 =?us-ascii?Q?fMGqSSzXlo5liKGYukNnCF6uXoSe4sruJ1jgpb4MjqL46A+xgLZUte4CQ49X?=
 =?us-ascii?Q?+HGZqTk+Mr543h8GUfU9od5BoOPpRpizbae9cpRKuFc21FR6LH/efWq0QpMx?=
 =?us-ascii?Q?Y+qkkVJxBsEBvfWJimurFq6+a4+bI5TojvQxwvnY3CwSTHEqJGGbINTauIeJ?=
 =?us-ascii?Q?fny3pw1t2D12uOm5r00FUd1vZGT5GQiXRl1NGlIPGvll1H9BPvmv+SRwy6IE?=
 =?us-ascii?Q?rRMVE62Edrm7qeAqGkcj2bORx/eNoIPXPfXztI0m49SHqi1xC1fC6aKOcqiM?=
 =?us-ascii?Q?5d11RQFhmnAP4+zq5vjrxIQQ00LB6k/s8q/qSqVjLt8yKuvQZdUsbvWkzJ9o?=
 =?us-ascii?Q?MXCkIXgMwmP8fjZD6HRVjcKtYmPjSyXNk21N/DGzOyihCmXl2WLJ6yXr4Iw+?=
 =?us-ascii?Q?eWdzDy/Vq6xgIFKuETR3UvNY+J6NhdSH7qnFA9bYWi6KJam1o5qBloINxZJ+?=
 =?us-ascii?Q?L2+4VJ3QxNnQDtlJyERkGCuWJX/6lm5Hh/um1UMGmfKdTuj/vSj4KACkJO5e?=
 =?us-ascii?Q?4joMwNtMbhAPDaCkMaW1uelCxfu7nzVf9/aslSeH1ozXYvIDMzOQ3hha3Mdc?=
 =?us-ascii?Q?ao13NoTprqvqvxTLDb1dcatfb33h4/9pZN2WGQ3wRN9bW4XpVGkJKfF1ksqI?=
 =?us-ascii?Q?uz6nbIF7ME8RuqfCRAnjVUdlGA3d/p0IGtNb74EmF5NN8NiIi/2Ahe7fUy6R?=
 =?us-ascii?Q?5/oJTlnkOZCU7jmgm7dw1AzBmaWk7QOGKbki1Gc/EwH4iXzFlelv4Rvtw2OU?=
 =?us-ascii?Q?sJ6K1sFMGHmPdfCmCW+X8U3XdLPWkzFRe0TOyxIuouYFBG0X86AZbDRufC2D?=
 =?us-ascii?Q?mrIHbxv1BtXYxtvtMQIrx2xs7ZOjOH2kDJjwNoKtEUuKlieuYa3AS0SKtSly?=
 =?us-ascii?Q?DESUXA/Tenl6H9//rSFr6M+RPxTdZYVUlZe1H9tH2agUVtx9xfosc0ZOIi20?=
 =?us-ascii?Q?3ANI5S16pwk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0702MB3794.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hfEFOdt28eJ9m9a+39xG//Wf+eiNptTRmD/vMdDgcTYyiE47+5ctCP0/Rs3d?=
 =?us-ascii?Q?X6PiNvwu4o/D38BtSdJ7jBn1fGIwJfJUoem71AnNPwSc39QNEyXC42Uz/MeY?=
 =?us-ascii?Q?e3pIoEHfy6SPu4syxo10p4S1vdfLY+E+o9Ei5sYsODLVo+QJ+nYSggE/9e3P?=
 =?us-ascii?Q?+ntfFMFrLaKMao6+ebwzibNX8u/M07+8A/Z9Z5KYmmBJTVQWDMOoWa24GnO0?=
 =?us-ascii?Q?OcaxXhBDutGppexWnBgPbRcC237nvP38/GWnX2YuCd/rFKNoO1GcwPAholqO?=
 =?us-ascii?Q?G0ISF588gFP0h/BU7RcYh6DbCZwzg8T7E7pU0g03hCmCs6HHElUYN/rzgwDx?=
 =?us-ascii?Q?MxnNF5cOpMDMJOeVZqFdma8H9cqwpTeuWhZz2IoQFqn3jx5PIzK5x7IfGJjh?=
 =?us-ascii?Q?CnHVWnrFMCcnaFIKvFE1qlAoyOrHOxUGHFEkakpIPNtFn3Z7ierCWglJALD/?=
 =?us-ascii?Q?tVKkKO+3T9jPELXXvK4eCgXw6KU0GJ3NfGL+RW3TsEh1nhwNM02PFcOdNrBV?=
 =?us-ascii?Q?YgOGw715KQqSWwSqp74yYd8IR4W8l0u1mEk/3wZ93PqBGtPTUTax9UZohBp5?=
 =?us-ascii?Q?Co7I1vyiO/tvTPnQcIfg7yMyC3RwnpZlGxw77S8aW2cIrjSeYU/1Za4P7sMM?=
 =?us-ascii?Q?6UAq7GqIIemfaJDoitrLh2Hpr01dAVfBLadNakok6xJsO4DNQh/Gut9ziJzr?=
 =?us-ascii?Q?vYfZOYLEfCCT83MCYlQTpYNpX7uOhiKKsmDej04PBAcU3tyJHQ8RbbAfHrqQ?=
 =?us-ascii?Q?bGMf3VCaqCKyaQ0GaHehStvtfsxO0nBRjc5SOP60jWs6YjAj80+iIrkwfvho?=
 =?us-ascii?Q?CiUGGi4+fxMAw9KkkjFPLEvhnR7+7LeN7OCwds3xmo1S4BM2fjGvUYBUai0Q?=
 =?us-ascii?Q?hWrjCcVqZAXT4FtYc9/8j5n2Otz3/+tgRVdHfP+cAM6fz4NK0M/FZQeE64sS?=
 =?us-ascii?Q?6Urd4MvAD7BXwCz7ROYerb1sIfyimX8D5FEhDrEbPaJbrVm3aXmoc3OeJJKK?=
 =?us-ascii?Q?ORK7WM82gzP8VQJcjM4TB9qpWx9UUb6c4KMeN3H0eEU3D1qh/azl8Iabk3il?=
 =?us-ascii?Q?DvCq9A+keNG9zaYwZY5ZKKhHKCtiFllgFt1YN59yenep4Yzt1KaA3+5Gg+OE?=
 =?us-ascii?Q?cZQTPLysQIURvR+PveVhZJjVnDMjkFVR9eLZTYc5LCuBWKGqojOCKReie3P4?=
 =?us-ascii?Q?XIB/rK3nSZ7xvLRpSGs5iC/D4ePZ4IHVw5iBnjCu9Vg4qaIkI14JT5aiL4Ky?=
 =?us-ascii?Q?rTTDvnQj6nt1qvoGhzdoLdBo55wfLe3LHJqnwhc9P854K5ycMm4CWNSqYbE2?=
 =?us-ascii?Q?aLNDZx82H1+w0KNL1/OrtTUvkwqPCzyjEjSzdQTvkdm4acgxOMaiWaH6upam?=
 =?us-ascii?Q?lOHbpB3eDnnTKqvVi2qinwdD9nfzzzCdfeVxKGt9DNAxNXPwvSMX/HefFLND?=
 =?us-ascii?Q?9TLEeb4+ewT6pBI/0YAswZuluFPB36EJbMB0zwQKNMzIGUrlmeMklWhRkHvo?=
 =?us-ascii?Q?ZBMFROXU3BeJaKQ0tIgsbYKsDCaiRB6ZYPDK/VnEomTr0SL9vlVXkxnmIn7h?=
 =?us-ascii?Q?ImGElF4snt/i/ev4tWJE1QESJPBTsqZD9SyKj4Ovr/lO+ZxgH3x2bJH+pIfp?=
 =?us-ascii?Q?cA=3D=3D?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d355c98-2bbc-4a13-6627-08dda29ccd22
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0702MB3794.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 12:47:29.7999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LZaWEiTwKzETBjz5agDzxo5K3DgYBFTZ60J/jQm1H8Nv6GXewsP8uqlAZmSUUw6j+2XuAYMGPX5FZqQf8115aJafRORvs+KiHFfff/FGtgw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB7510

Fallback to legacy reset-gpios is no more needed, because the framework
can use reset-gpios properity now as well.

Signed-off-by: Wojciech Siudy <wojciech.siudy@nokia.com>
---
 drivers/i2c/muxes/i2c-mux-pca954x.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index db95113a5b49..e09230df7059 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -118,7 +118,6 @@ struct pca954x {
 	raw_spinlock_t lock;
 	struct regulator *supply;
 
-	struct gpio_desc *reset_gpio;
 	struct reset_control *reset_cont;
 };
 
@@ -528,17 +527,6 @@ static int pca954x_get_reset(struct device *dev, struct pca954x *data)
 	if (IS_ERR(data->reset_cont))
 		return dev_err_probe(dev, PTR_ERR(data->reset_cont),
 				     "Failed to get reset\n");
-	else if (data->reset_cont)
-		return 0;
-
-	/*
-	 * fallback to legacy reset-gpios
-	 */
-	data->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
-	if (IS_ERR(data->reset_gpio)) {
-		return dev_err_probe(dev, PTR_ERR(data->reset_gpio),
-					"Failed to get reset gpio");
-	}
 
 	return 0;
 }
@@ -547,8 +535,6 @@ static void pca954x_reset_deassert(struct pca954x *data)
 {
 	if (data->reset_cont)
 		reset_control_deassert(data->reset_cont);
-	else
-		gpiod_set_value_cansleep(data->reset_gpio, 0);
 }
 
 /*
@@ -590,7 +576,7 @@ static int pca954x_probe(struct i2c_client *client)
 	if (ret)
 		goto fail_cleanup;
 
-	if (data->reset_cont || data->reset_gpio) {
+	if (data->reset_cont) {
 		udelay(1);
 		pca954x_reset_deassert(data);
 		/* Give the chip some time to recover. */
-- 
2.34.1


