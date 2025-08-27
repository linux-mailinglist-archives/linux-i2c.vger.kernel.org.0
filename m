Return-Path: <linux-i2c+bounces-12443-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D192B37F1B
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Aug 2025 11:44:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97D6D1BA49A5
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Aug 2025 09:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 707DE2D6E48;
	Wed, 27 Aug 2025 09:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="RArjG7I9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012032.outbound.protection.outlook.com [40.107.75.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BA722538F;
	Wed, 27 Aug 2025 09:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756287841; cv=fail; b=h0C7roxeOtTT+57sZf5j514lEW53rSMwCSL2+JOGA6utbGyzPCYWlXIQOy8BMiiLfNRRiXvXfJhHG5WYgbFj3xVtxfDJYAjI4IsPdNSQYJTcJU0HcvSImmmoT+fhGS2yeWA/+cl0/l5ECmcvrX/92I/fmQK2aHtOQhQNIULo0Ys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756287841; c=relaxed/simple;
	bh=RqD0xTYBN2E1bXu4QwqUXMKj6DeyMvnUA+P4+qkcXmo=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=H/YEpkMguyEnXzjXfyq5YVEU1wmHHcU91j5d42tcMBej/WzSBeLL8zBeN269zU6SrRsqww+FgzWk7PsZ8KZFRku3TDmzzKhoTfmhpMNDJHSAKuB9Xs0Ud0HxwKchZrnt5S+1jBGPgbNiLEVycH+Sx3+2U8YvVLwNruPzKAU2KU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=RArjG7I9; arc=fail smtp.client-ip=40.107.75.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KMqDi5ZhXj5Z7cxG8RACVQ7GQc5hgdoj7b5k2jnl5IdrQaNgtHL9ff8XCbPcC4Pw6v+e+UJl/CW3lAAUUSXRF4JLgl5viXdmjzDK2cuR4D2Fy8BdIGd4gS0TVcHe4EjhKRM8GLIoL+8r8SMMdq6g9DWz33KybaTS6xygaGexwz75UsitTbOI7z/BsRX+GeAMUCXQa2AyhL9u33EqiY2XmLw7KdGk2fJ97BFg90PF46cuoj26VRa5T3WUPvk8FPoYaxd61pgWkZjW1xCdGqvO0ICzxKJb1A9kMtteV0LRKNBYZBgvDS/b7lxPbsOnIajiN2fAhR7UfmPGEVKSCUDVUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Sa04I9H7yJF6hay87ekv2zsaJ3o4/x1w8QsD71WNzw=;
 b=FdrslemcH5rFwji1PAhJnzxXtxB9s/PJgjcCshoo/l11kPA0TR3Lww0XQKRNf+CPz6y7HulRY4xgA3yG/UBs52dPb5DLB0t0tNntwJU0Z+HNhE4rLTSyijpby5nkYMwUKH8cC8/k2OY+oJiCfi47XI9ZMYvaZ2cFan9LPHj1oqNK+k2U2TqpObWTKadq7852ZPNnjk5n7uFQ+6QVG+iBf0gA2rQ7oXY9Txhfh5FOCRUcoSux5Rfa1YJlQ+rhw53ZN2x4OC53CHWstCV41ZCVWOgR7oHyfGQSbDJ+BomTzFMroHjM/7s5oHeGKMVz13k2No5qQoOx+3yQAJLTwoS7sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Sa04I9H7yJF6hay87ekv2zsaJ3o4/x1w8QsD71WNzw=;
 b=RArjG7I9LWY/JfFv85YfWhkemByTZVgudeRII/Qq2gbFSQm+6htiUHXxlucEUFUooBmBwkW3ACsxw17w9+DizdF4B5P7d7Yb4XVXeESLQjLThAk0ZoFa2aYEfRV8XaR3PT8U09sirTpVxnaA1fNZj4v4Pf4ETLabq3Qai7G9tm+apGpv5PPa3xRf+S335JebrBEMEv6PfaItSK2rp2Y9ta2aZtUoqx16HJN6oOwr2AfwdSOYp50TkZWHCqU/2lqufnZU2P0wOf9uEAWNSLhloRv1XxtIgCZJCfkwtNDu4a2y7e8+lYGp2ztV2CPgCVFcSWqZxQHEwvfWtuMUgNO24Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR06MB6020.apcprd06.prod.outlook.com (2603:1096:820:d8::5)
 by SI2PR06MB5163.apcprd06.prod.outlook.com (2603:1096:4:1ae::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 09:43:56 +0000
Received: from KL1PR06MB6020.apcprd06.prod.outlook.com
 ([fe80::4ec9:a94d:c986:2ceb]) by KL1PR06MB6020.apcprd06.prod.outlook.com
 ([fe80::4ec9:a94d:c986:2ceb%5]) with mapi id 15.20.9073.010; Wed, 27 Aug 2025
 09:43:56 +0000
From: Xichao Zhao <zhao.xichao@vivo.com>
To: andi.shyti@kernel.org,
	orsonzhai@gmail.com,
	baolin.wang@linux.alibaba.com,
	patrice.chotard@foss.st.com
Cc: zhang.lyra@gmail.com,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xichao Zhao <zhao.xichao@vivo.com>
Subject: [PATCH] i2c: busses: Fix some spelling errors
Date: Wed, 27 Aug 2025 17:43:44 +0800
Message-Id: <20250827094344.424700-1-zhao.xichao@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::9) To KL1PR06MB6020.apcprd06.prod.outlook.com
 (2603:1096:820:d8::5)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6020:EE_|SI2PR06MB5163:EE_
X-MS-Office365-Filtering-Correlation-Id: 06c2bf82-672c-4f79-ce79-08dde54e3d85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AcbU5FaLq0bewJxRXGJdImapf2Z1KIQWXOA4kSZ4JqNuAOC+z/6jxRDYHROt?=
 =?us-ascii?Q?eF3KFAr+udp/cwxAfu3/1vLeGwPAl4MFGeqZLwamWwFOHpbc8yffAUQx7a1/?=
 =?us-ascii?Q?wC8r2wiMb6p864w2+IdTZqkLi1DGLnQt4gts0zskmH7FusFvOGScfAg0GYZz?=
 =?us-ascii?Q?TRDkrdqURO5atxuSFkVb9YCZlpsYpMHa1C5Z1GsheQxZ0nNNp64sf7R2UJp9?=
 =?us-ascii?Q?mQd2qINmzZS60aGP8HS0YwgL3/AUK8oKAhR+UIYyfGOBm/8ymNBmQkeP3arL?=
 =?us-ascii?Q?3LlGcQxnUax6v2TGPZkUfa7ZqrTrFumlI0cuWdpDQtia87HKdSakeQ1OQaMc?=
 =?us-ascii?Q?MLFnBZD/zRgffCeXmcn6KW8a+KzDRQgeTBlFdg965hL7i+fWcWimWH0yZNbn?=
 =?us-ascii?Q?AIaQBSjy9TRZPSnGxy1idOx+dnyk86mi6tpaOlcZdvELHpphv3dcxLJTmPQq?=
 =?us-ascii?Q?P2Ud2V6FCucWLoAHlCKl1JE8z83EfUpSIEk7M6kD6SsYpFYHHYnEUV34t87v?=
 =?us-ascii?Q?vHJTV05jHkarnVovoFO0uskxKqFhl0gYJittpIY9PqB7Gf4Rewbs2ip/E+CL?=
 =?us-ascii?Q?BtIInnwG8vZ0HP+nDQaKpfNbG08iHlqLv20T79GTRgj3cm/7yF4wNXHaG84R?=
 =?us-ascii?Q?QG71yEZOgT5fRT0Kw3yxF96qbNzl8IC4AcUDj/A6lWu43NGxHojsj9BuGTnS?=
 =?us-ascii?Q?PZcjUp3jk4Dk1FmyUZNfs0mhmFd59HhOKcKNxeOneCbpC191w7MHXMPjyQ5H?=
 =?us-ascii?Q?y/vXT6sRPXk1tmGbcCANBGhuL04IyVsCd2jpeImZJIcEIEIaSIrJTXWdS6ct?=
 =?us-ascii?Q?BkUKJUNddRJY/VtAATTH9d3Mh/R+EaHYxbWu18gUc6gG1rbEgVx/eL6Ybi7s?=
 =?us-ascii?Q?yzR8aG+pF1nmN8zuTRnWIOMrmlzUysQBNw4m8mMQ7+dSps/UrHOjuY5eNAgS?=
 =?us-ascii?Q?NwnbTGYNMfcKw0ntYy9hkcFGEOPKkbMLmvMn0bckbN5qZ2C6ZSaByhkM0wRP?=
 =?us-ascii?Q?6hJJ6EHAvXip42lmop1K82QYsfxk/9EW46Ca1/01jiV/6ayg4vATOxdvY06d?=
 =?us-ascii?Q?9jC05Lj/e0IcOYqzVTiG/TvneoCs06ufQyeVqjt+xR97Bz7aTj8Kk+v6BDuR?=
 =?us-ascii?Q?o5v1YcHoA8WOkMyP/Cb8cA+jJXZ3kkHvewca0qweTWFsDgC6WEtc3CSZaik/?=
 =?us-ascii?Q?/czWUR1ygtXFaIg1pmcfQ15NPvW1IskNL9zGLkOR8fKwO3S2UceD1EHvGDIM?=
 =?us-ascii?Q?K9ugfuPWc9xJ4dkIzW67cVnxTTp6if45JJYONSzqiNspnMtO18cV+qcNZ9yF?=
 =?us-ascii?Q?LphqHUopYc+Iw6XSu2j5Uvw2B54khwDD4Bn5laEv+GXznW/WU4hgsMNsQwjT?=
 =?us-ascii?Q?er4JEzGNNZCLXKjqXY061AJXSmrb1HiT+/50q8OFBHAqslUwuon26AhwH0GP?=
 =?us-ascii?Q?EhfQMe9f73MjnQaH2oDfgHwEg/7D08sTTVRnSRhbmwedKrM7O5fj/A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6020.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0HcE5VZCLKySfizusQQYPguqszcC1ii6eChGf6ZzYSoAT2ee7B2B9kLPjo2c?=
 =?us-ascii?Q?BdWxJC/AJxc3y7eLceof7KOnZuQBcZdZ2oCl+aMm+EnTnEfy+LLmocw9jPLY?=
 =?us-ascii?Q?zZAkmWB4AaAgNdEHbu9YzrNhbp5kv7jIv2twSC3Sej//QGmDbi5KcOLbDS5B?=
 =?us-ascii?Q?P20PNgIVAfCNP9DbNWQXuVWWSZL2FPq6IreDW4qAHUo5ZwaX0oRADNoTzo9n?=
 =?us-ascii?Q?0ap3mVP0Nr00IeQO4xx/e0wloB4Q2P1WRfHuAeLCfycjaNIyApI0+1dIAjaj?=
 =?us-ascii?Q?VpZgkYfZhC9TxDzV1G8olx6DOuXIpsAFLwPyNSuUTE+dWwNROvbvcqkkwltd?=
 =?us-ascii?Q?nUcfQQDW36aD1NiolR4fz8agFOqqTq8StKuiEkwE3DfalXCApr2r7mh+ZZeX?=
 =?us-ascii?Q?bqYI4c36oFVFJoh/eThAEpi841o7KgUWBChZkDvZXigN2boso0HORAltVuNo?=
 =?us-ascii?Q?76K9qLi+vExZ4UdNLgK4JJOwiCNen9SpvjjE7/iMY+2piqNAuL0kLM0mivh5?=
 =?us-ascii?Q?m5wueP/5yRVN4mFebAafKzZH/VYQwPRWxaYjHmGgVCIq8N2DapxYdi+boABb?=
 =?us-ascii?Q?EoC/j+AJYjNqoVwkMaom3tXtZR8iAHPnJWGaICRK4JNHPBfNHo+cN5zbx98v?=
 =?us-ascii?Q?IiXyw0+RYZv1NGTJsDReYrE3TTLfb+LorWkW3G17xiY+uELtYMfX5SvHodCz?=
 =?us-ascii?Q?2dVsKfqnih6EwrH4xjyjbxTlcUuQu9zevHluJVT23smOl9mXsbEqWewCE+pM?=
 =?us-ascii?Q?XKdSP4gOCKhHLX8gvglikIZXbkjviADaj3XnaO5E+DFxjQSSIlRPThGwE9/I?=
 =?us-ascii?Q?VJZ/+jdAGNTQvbEoT+dZuTiOSfur+Kc4V2VVG8kopoMZQpXs5SARo0FOjGBv?=
 =?us-ascii?Q?G2keV02rExQlRlAP5HI2O3AYaOzB/LbzzuWmNSMGZR7dygF6Cl63zbdQQiBW?=
 =?us-ascii?Q?ebZWYicFuWhE05fDYQcGRxegu1cUdQ3rmgDVWf1J/RjnlrNx2XzFhB3Akp2t?=
 =?us-ascii?Q?6hRg486p7ofUZogSb+V8PUVkPMx8pADQ1FQ2jg4BDC9aBLqCkTzlSECL0jNQ?=
 =?us-ascii?Q?YHnIuoDBEDCCd1FvRuOaKfogoXY6zgHIamg55l8DsVAEWe0SvIAKJ/hBMMce?=
 =?us-ascii?Q?UXUblEJSHOp+Zq8k+M8fVxiYePRaF29liCiMX5G5OEtm/l8WaY/f3Y/xR8IA?=
 =?us-ascii?Q?r4U9gBQtSCn6XM/nqmgouXyV/WJF+fbFnVFZoS0MLdAZ+foLmZ9vAw8U5puL?=
 =?us-ascii?Q?WJM8bYJowR9GOUnUqf5KqV+cBzDz0mbad4nVQaTd4KaXSTeAgdiq6oqRi4xq?=
 =?us-ascii?Q?djyQWEnaJ7Iz4xUYcrO6/NcteHl0Spq7MMbq3bBPypIf/udZsEKvl8Y5sDiD?=
 =?us-ascii?Q?xiq29hGDg0QBX013aYWhp+wP1WMzchPu5mozXCP1brrsSWwFNGPxsryYqpdM?=
 =?us-ascii?Q?5/phA1ilidFWp1UfTUwZcIG4NoVfakbshgtibDRfIrCN/DvIznsYqA6wzgCm?=
 =?us-ascii?Q?DI+1Ts4FMlxji7kj+We/W/pDSO+y1fV4yKzp1LRSuB1D1P1Lfu9bFwzog47D?=
 =?us-ascii?Q?Cm3+91HNDvacfk2K//2c/UmqBb1JsoziIbEQd8We?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06c2bf82-672c-4f79-ce79-08dde54e3d85
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6020.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 09:43:56.1172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4oS4P5Fg6BXWhWZIeeomPTOW8AZD2wKZl+VdEcgTBJV3aywxNHw7gxrqtyC9AD/hkqjF8Ph8nbwhhhqvie0Xjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5163

Fix spelling errors in some comments.

Signed-off-by: Xichao Zhao <zhao.xichao@vivo.com>
---
 drivers/i2c/busses/i2c-hix5hd2.c    | 2 +-
 drivers/i2c/busses/i2c-sprd.c       | 2 +-
 drivers/i2c/busses/i2c-st.c         | 2 +-
 drivers/i2c/busses/i2c-viperboard.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-hix5hd2.c b/drivers/i2c/busses/i2c-hix5hd2.c
index 370f32974763..5358f5ddf924 100644
--- a/drivers/i2c/busses/i2c-hix5hd2.c
+++ b/drivers/i2c/busses/i2c-hix5hd2.c
@@ -339,7 +339,7 @@ static int hix5hd2_i2c_xfer_msg(struct hix5hd2_i2c_priv *priv,
 	ret = priv->state;
 
 	/*
-	 * If this is the last message to be transfered (stop == 1)
+	 * If this is the last message to be transferred (stop == 1)
 	 * Then check if the bus can be brought back to idle.
 	 */
 	if (priv->state == HIX5I2C_STAT_RW_SUCCESS && stop)
diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
index 56b2e5c5fb49..26ec34b19ad5 100644
--- a/drivers/i2c/busses/i2c-sprd.c
+++ b/drivers/i2c/busses/i2c-sprd.c
@@ -425,7 +425,7 @@ static irqreturn_t sprd_i2c_isr(int irq, void *dev_id)
 	 * If we did not get one ACK from target when writing data, then we
 	 * should finish this transmission since we got some errors.
 	 *
-	 * When writing data, if i2c_tran == 0 which means we have writen
+	 * When writing data, if i2c_tran == 0 which means we have written
 	 * done all data, then we can finish this transmission.
 	 *
 	 * When reading data, if conut < rx fifo full threshold, which
diff --git a/drivers/i2c/busses/i2c-st.c b/drivers/i2c/busses/i2c-st.c
index bf28f8e3ee6b..97d70e667227 100644
--- a/drivers/i2c/busses/i2c-st.c
+++ b/drivers/i2c/busses/i2c-st.c
@@ -152,7 +152,7 @@ struct st_i2c_timings {
 /**
  * struct st_i2c_client - client specific data
  * @addr: 8-bit target addr, including r/w bit
- * @count: number of bytes to be transfered
+ * @count: number of bytes to be transferred
  * @xfered: number of bytes already transferred
  * @buf: data buffer
  * @result: result of the transfer
diff --git a/drivers/i2c/busses/i2c-viperboard.c b/drivers/i2c/busses/i2c-viperboard.c
index 1bd602852e35..f596efcc291c 100644
--- a/drivers/i2c/busses/i2c-viperboard.c
+++ b/drivers/i2c/busses/i2c-viperboard.c
@@ -204,7 +204,7 @@ static int vprbrd_i2c_read(struct vprbrd *vb, struct i2c_msg *msg)
 		/* copy the received data */
 		memcpy(msg->buf + start, rmsg, len1);
 
-		/* second read transfer if neccessary */
+		/* second read transfer if necessary */
 		if (len2 > 0) {
 			ret = vprbrd_i2c_receive(vb->usb_dev, rmsg, len2);
 			if (ret < 0)
-- 
2.34.1


