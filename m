Return-Path: <linux-i2c+bounces-10985-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BADAB6B5D
	for <lists+linux-i2c@lfdr.de>; Wed, 14 May 2025 14:23:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7AD48C326F
	for <lists+linux-i2c@lfdr.de>; Wed, 14 May 2025 12:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5D74278761;
	Wed, 14 May 2025 12:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b="sToq+kh9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2072.outbound.protection.outlook.com [40.107.247.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863EC2777F1;
	Wed, 14 May 2025 12:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747225361; cv=fail; b=lDLod16bUKOqnMin+gSeyD8yGI4s4b7qNnhAuimcSYStaOeel/SHre3bF6RCO45kDC50n9vORYmrk5YGSxkvSAIIb6CzQoG4bg8iuZpfPGNLa78bZeCtE+UgyCslbXjQyxLO8/F2FVc7aK+nGfJoMNNpGgtlON9PGm8TUTluscg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747225361; c=relaxed/simple;
	bh=sG2sW6WX9/3KbWjDc05UpFRA1XA6fpgKx9PJVSMNXGc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iwmMnCzGUi4ZFFhjI97wGucGdeR1U7h9JNqWYC9xGsBm0+UTlF1byodAF4bRj2Hj+B9+go02kiB679MqYHa64vhb++XM+blpweFtF6VRo/Yp3fISSgo64CFy8y2HvLmoSeTKR0XtgMU7My746yrxU6PcpWuolF1R8/T1orgibgo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=sToq+kh9; arc=fail smtp.client-ip=40.107.247.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FbYL/yZQy0V1wYs5YMIBl8E72yZpQkXe8nCyMNCXiSzl+BTwaUTUOEnInXZIOwnX9+SKqAy/ikmFMPspejux1b7xgzmeYM+pFZgyYHJaz3/5WICbwRiWoFKZCFq3x80+jHYJSin7FHAZEDSWJnHOH0ROet756hRlCWX9n4vaJMCNSq7wvK2FNQcV/SI1+DDjborhWlmg8R8Rvx/pKW7FnrKiB7EnQiIoYt8JOXnRXqLAR8mHjrAL2uLlcHOLEbOFJqqsuHQarWA5lxFOJsrfpX5rjlkGaycWs4kqM5RCeXjaduOXpwZyB/nvb6FEBGa3Rcvbx/C0JXe0hInP888jlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=joRidLTBNEOx+GbF8FrTqpbiktn8EnChcYXmSxQ0hzI=;
 b=yQ7Xb9dS59D/xFQ9K4eg/fyBblYRi9Y38wSFpK34vIHzVDm0LwYlxx4kwvO1aQGAwzgqeUZ35wAWeDg10RUMICJFTaIkVBwBKFKhk+KcXbaY4Ykss8NyYwOs+6dpixBf95/D0O6iKHTYyclVyrZvkPdsRzfyR0xQFgmNDy4Uakc3ypHJtu3L3m3ymJ1M5OlRmCqUCceOzBHgKeLzt7GcQ5zHGtVXp4FahvKMh09KkVyp3OlG4KYqd7KMf7+R+cVt57ASdj8k/d0V4wDAD3KrEkAXi/4jM8lc29h8Wthp6Rb5/ndKA4bZSZafT0GdRG1cCnwmK9gGKt9D6dNtVm/skQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=joRidLTBNEOx+GbF8FrTqpbiktn8EnChcYXmSxQ0hzI=;
 b=sToq+kh9xg0IieeQTENeS4fU9BBoKz/BHmoELw9pAc0jrAjBYm0wS2ejXHHwwnOlevcjZLdmFWGl05N8JACDeRYyE693IldCprQW4GaEK+aCftZ0chBTHGMIX31lIZimUL//DSF9R4LR1t5+gws6wOOYNTJZsivzjMeegIQvY8jtMN9pJe6GMcqfDn+s2wIX6Nmcl6kTF2MKdcImzuU1ncvgPATelgctcZrBMAeoKULR79WiGL9qPq7TBDw5PTqFMgPmr/sq+DVdp43lZwuaSkN7HpeD2axLGbeRoW274DWhhrQbFnRQJvn5gRi886jI4d5YZHrdcIMmpsQ5iD2//Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from AM0PR0702MB3794.eurprd07.prod.outlook.com
 (2603:10a6:208:19::23) by DU0PR07MB9140.eurprd07.prod.outlook.com
 (2603:10a6:10:404::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Wed, 14 May
 2025 12:22:36 +0000
Received: from AM0PR0702MB3794.eurprd07.prod.outlook.com
 ([fe80::aea5:bbb4:c75:9faa]) by AM0PR0702MB3794.eurprd07.prod.outlook.com
 ([fe80::aea5:bbb4:c75:9faa%2]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 12:22:36 +0000
From: Wojciech Siudy <wojciech.siudy@nokia.com>
To: linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org
Cc: andi.shyti@kernel.org,
	mariusz.madej@nokia.com,
	Wojciech Siudy <wojciech.siudy@nokia.com>
Subject: [PATCH v6 2/2] i2c: muxes: pca954x: Reset if (de)select fails
Date: Wed, 14 May 2025 14:22:26 +0200
Message-Id: <20250514122226.3267855-3-wojciech.siudy@nokia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250514122226.3267855-1-wojciech.siudy@nokia.com>
References: <20250514122226.3267855-1-wojciech.siudy@nokia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0098.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::14) To AM0PR0702MB3794.eurprd07.prod.outlook.com
 (2603:10a6:208:19::23)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR0702MB3794:EE_|DU0PR07MB9140:EE_
X-MS-Office365-Filtering-Correlation-Id: e1d36c05-4584-44d7-4d23-08dd92e202eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UE4tv1JWsdFdD+YwF7LAnmQOEbqSsZCEhdW0DMbvCQ3PoYbyHM3W0yipAL7D?=
 =?us-ascii?Q?CqBgNEBdzEm3RNZdyHUkZG/qyXKGf1BTRrhjKyqmgGnoUzJFUidx32pEt4p6?=
 =?us-ascii?Q?SGyf7s4PX3uINqQNa+LXNPz1ijnNuOhlOjIw4drgpuTXbEb/AL7sFBjNn4y1?=
 =?us-ascii?Q?X86QE/AhYF1BkmcWlbN5bYf5jn+iVI3DTmeVMiaB4knBSM8IZIelYxEuLyoj?=
 =?us-ascii?Q?+gQsXhJ5U3OHkVvexbUW3BesU24YTaVu5o1Vx2HQmH5CA/hVZDgtkKCRaLd4?=
 =?us-ascii?Q?bAuGAXlKls3gJCBeZSMVq0XYILzaBeGMTY6qGN5ki7Z2eeWmgghfyBs40B00?=
 =?us-ascii?Q?841JXCaT5e0zx94c+wAI45C4O6YaIeMvB0hEyvJNWjy+Sn8Ny841fyNaMOUU?=
 =?us-ascii?Q?fEYwdWJhwG5MGtSyQvYjrtZHqUpNHH45Byaxe+RYon1gNhpHVc/gpxRmmcAX?=
 =?us-ascii?Q?fWhRF0I3BFPJeY2apo9bWnVsawH35YAP20449c4ebHyhcOHdki14Ur7gCy/8?=
 =?us-ascii?Q?TF9n0UXKrBwZa7v+Aym6Gk6Jnp87oD+CC0IS8ZtJH1aANPdzbh4/APNSd48f?=
 =?us-ascii?Q?kOweMkdBXtLDq/jZofwXI+Osmzu8OdmEVNWc7/TH7Blh/gchkVMgGZgBELI+?=
 =?us-ascii?Q?q5uopvAPBIXDn0UWXEfmnM+aXet5ghB92m/lztCtKvPhvmY7yz77fUIky9Sn?=
 =?us-ascii?Q?5PD1y6rUdYCV875OFjL6vlwDVAdb91ao+yA4RHPvLpXu7PzNa9NqmUdKQmOp?=
 =?us-ascii?Q?qRdMWqExnd8LPAMchBKgVBqmvqoXIJzzQNLO6rGR8KeVvwCV8DgrtfmQmvOX?=
 =?us-ascii?Q?2wrFMfTQHHXm/hOlS7tHzxVPJUl2fnKQ3OMbwD//kTlV0SWQ+qo1PCRWrtqP?=
 =?us-ascii?Q?toEXwkqc46TSLsEt5AB+zoVrOjDFiL6H7WFY+WFN2qjwegmm5tQNftDnmjD4?=
 =?us-ascii?Q?SkNdTczG5EGdTL98HMAigTpR7oPJegG0tF0D1ADPeb3DqFuav9hG+SYGIH+Y?=
 =?us-ascii?Q?4ts6XlwIpWJkqJoJXgSh5/PMRQVCy923BKfSCLQQSUUuZ45B0z2mpJi1Je/B?=
 =?us-ascii?Q?dlKYDUwl+6uPpkL8tedEswKfzTkBp/1c9P7ggEqE1Rc9ADabHPtV997/O0mP?=
 =?us-ascii?Q?d27QIA9OUpTm/pOf4otsPS9DbmVKXcDEewRZovOFysGFKA5ntLGnsqO+bqdH?=
 =?us-ascii?Q?ke8YWffchFnYeiyQcxh9tgXOshLTB7qXvD2t6VaVpnYZJYwrHGweGQfuguZ0?=
 =?us-ascii?Q?M//orkZBV1l2hakDnRfjiwtfi12hFtld5VgMUdyUHPXvpoiQKFNmq9G8aKdh?=
 =?us-ascii?Q?dSrwfNDiuMH5geaDU7nSQSPe8KicZIjme871z4OMy5SHf99Vnu4nMXSMsnDU?=
 =?us-ascii?Q?8CXYJL8Vn3kbHL8MrQIMyWrixaVBrAbu6urUMRktj974N7rxDkiIBTsu0pu/?=
 =?us-ascii?Q?A9MXoCg0m3U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0702MB3794.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O+bBZ1p3mxZIHI+wyPEXb7jV9JlaFtgauBBONxdA01KmofEXRa79Hfi7f2TY?=
 =?us-ascii?Q?dmPNy85ooGGl51Q0RbXvmcS/lnqXCsYPq5sfg6nltgjckkdsCzC4H4MCirdW?=
 =?us-ascii?Q?klFaAGiqNaKd+WXksmmVv0GABr5LYUI5bvtXQ5/eMFcL+K0hLo4mpZd0IOPX?=
 =?us-ascii?Q?5Pt3CTX4++mD0Kewh0rRl3NBXKVm9oU7U5z12ecSaNUkC+IUK3hBTBzwQgTb?=
 =?us-ascii?Q?wFcbgxvgBY0zQYJY34DU0zQFfUky8YOhLxzREgUYVHVY7CQFQ6vy9gFNZ7gQ?=
 =?us-ascii?Q?ojxZu4J7JuMd+sSUw1IGX0pDAn4KYQrFTOxaaSElHxYTqURXM8CcHGgJkSwY?=
 =?us-ascii?Q?CVRlnTg1qx0IWdxeuw83H62+/AIlG5mMAyyOwmw3m8bG5wOFpFDFsC2oJVum?=
 =?us-ascii?Q?NI/NZDuEkhUCIxgAwsrB8/AxQsfjYYC/yML/2SnbQxMwxB/oCoq81V2hBPCc?=
 =?us-ascii?Q?Igj0leiWe8gz7/z7YHpndyOBBuvZzuBCjXZAQVRV5mCBDn+zBTazdhefVJKg?=
 =?us-ascii?Q?KjVJ1TFNaxBhR4BAGQOzTSrn1iysehCsGOgSAiDDJzdsd48IGN3OYaA+Ju0F?=
 =?us-ascii?Q?vBNOn+z4WAtehXNxW+BT63A6qVEZL2njg8kqtfBM9RIdbPgKWWlFSMtoh9kO?=
 =?us-ascii?Q?QF4Rw2hoYOiZIQ2uRXW1nVCvs+3W+vY632UlX+wWs3NRbGRGYJhqrmkcqEb9?=
 =?us-ascii?Q?829Uj06NLO9Bs65cnaoobeHU0FT6a4PDs7o0mm/Dj5GcwkD+Y0g0og2zQBcl?=
 =?us-ascii?Q?0+0EtTGs+wvmpm00WReuBLDe9J9GWcwkKzFHPxZcLaA3665J0wDIcJ7WOKlJ?=
 =?us-ascii?Q?8zzmWPdd0YtrXwuFesnwhSjbXL7u1IF1uWQHpbA89Terke2WzYtVptVJCLf7?=
 =?us-ascii?Q?RvOqgFJEutFT98cjhbvbEM3TpQjiYP/6yzrhXMAc/5YqvR91LkL046aUNUNB?=
 =?us-ascii?Q?6xuQRYDPUSCvZHgz21V4kMS6YybQ/MrTKxW7em55cJtu1yiNGp4zFp78ubIl?=
 =?us-ascii?Q?8YRfC+JX4lF+due/iEdJGMxuQ334sjejlhG2+XtTVdGbv5OmOS27f13t0kXI?=
 =?us-ascii?Q?aZor9JkNMHSjAbvcSMFvgVMPj5s31IsL9O86ElikhSm4X57NE5yCGlQiOUcz?=
 =?us-ascii?Q?7oc03tJArFmRL6dx478Gpk3dQxRH5FyImH6Mw8Yaw8T5sv2SDgqZEh9ceHtw?=
 =?us-ascii?Q?yoI7rocaxixGM50CfbwgDWH0ZiI1hg51ZUld4kGvP5MbpM8760YJm2wrQ+z0?=
 =?us-ascii?Q?rxCi/qJhHN8X3d3cGPMBVJBpybqU+i5/h3I8zAonj+qLfbh66CJZQBo/G/3w?=
 =?us-ascii?Q?ga4IdUnNiDpAhxK4FLEht9uCcg17wwYN8WAGh1Dm6cg5CoOjmIr5g0bBudsJ?=
 =?us-ascii?Q?tquMG8BHPLv6vs0L4Vu5Df9VLIQGXLNxqKCp8roVsOjyvv/45uegS9M1fs7Q?=
 =?us-ascii?Q?JdoOc5G4oMQhS5druk/nyy9N0nByqONOnrAc5kdydBHHKd2gHxDDcunpcTd+?=
 =?us-ascii?Q?DW4j1s5rn6giK2JQN6qd3Pa1AZslxmDTQ9menvTVes7V44SHb2S1nOO1/L8+?=
 =?us-ascii?Q?BtuD8aFL0TV7QhqhaFagdmFdnYWnYtZWfHP8nZWv1cnaugpFUdUmZSG4l63D?=
 =?us-ascii?Q?ig=3D=3D?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1d36c05-4584-44d7-4d23-08dd92e202eb
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0702MB3794.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 12:22:36.6881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KkCUtuZB8DYux4z3bG5N/Kb0iA95AdyzOVwtVYTldrGF06eJLtKI/WwU7w8hKNbVt75ojAgE0j9mSjGX4XDnjPtzdw6huRrMHISBTKygwNY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR07MB9140

If the channel selection or deselection times out, it indicates
a failure in the mux's I2C subsystem. Without sending a reset pulse,
a power-on-reset of the entire device would be required to restore
communication.

The datasheet specifies a minimum hold time of 4 ns for the reset
pulse, but due to the path's capacitance and themux having its own
clock, it is recommended to extend this to approximately 1 us.

Since reset controller is used, there is no need to take care of other
devices sharing the same reset line.

Signed-off-by: Wojciech Siudy <wojciech.siudy@nokia.com>
---
Changelog:
v2:
  * Removed mail header from the commit log
  * Decreased reset pulse hold time from 10 to 1 ms
v3:
  * Make this functionality enabled by appropriate property in
    devicetree
v4:
  * Fix missing condition check from devicetree
v5:
  * Declare dependency of a new property
v6:
  * Don't add any new properties, use reset controller only
---
---
 drivers/i2c/muxes/i2c-mux-pca954x.c | 33 +++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index e09230df7059..eb19a3566d35 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -315,6 +315,26 @@ static u8 pca954x_regval(struct pca954x *data, u8 chan)
 		return 1 << chan;
 }
 
+static void pca954x_reset_assert(struct pca954x *data)
+{
+	if (data->reset_cont)
+		reset_control_assert(data->reset_cont);
+}
+
+static void pca954x_reset_deassert(struct pca954x *data)
+{
+	if (data->reset_cont)
+		reset_control_deassert(data->reset_cont);
+}
+
+static void pca954x_reset_mux(struct pca954x *data)
+{
+	dev_warn(&data->client->dev, "resetting the device\n");
+	pca954x_reset_assert(data);
+	udelay(1);
+	pca954x_reset_deassert(data);
+}
+
 static int pca954x_select_chan(struct i2c_mux_core *muxc, u32 chan)
 {
 	struct pca954x *data = i2c_mux_priv(muxc);
@@ -328,6 +348,8 @@ static int pca954x_select_chan(struct i2c_mux_core *muxc, u32 chan)
 		ret = pca954x_reg_write(muxc->parent, client, regval);
 		data->last_chan = ret < 0 ? 0 : regval;
 	}
+	if (ret == -ETIMEDOUT && (data->reset_cont))
+		pca954x_reset_mux(data);
 
 	return ret;
 }
@@ -337,6 +359,7 @@ static int pca954x_deselect_mux(struct i2c_mux_core *muxc, u32 chan)
 	struct pca954x *data = i2c_mux_priv(muxc);
 	struct i2c_client *client = data->client;
 	s32 idle_state;
+	int ret = 0;
 
 	idle_state = READ_ONCE(data->idle_state);
 	if (idle_state >= 0)
@@ -346,8 +369,10 @@ static int pca954x_deselect_mux(struct i2c_mux_core *muxc, u32 chan)
 	if (idle_state == MUX_IDLE_DISCONNECT) {
 		/* Deselect active channel */
 		data->last_chan = 0;
-		return pca954x_reg_write(muxc->parent, client,
+		ret = pca954x_reg_write(muxc->parent, client,
 					 data->last_chan);
+		if (ret == -ETIMEDOUT && (data->reset_cont))
+			pca954x_reset_mux(data);
 	}
 
 	/* otherwise leave as-is */
@@ -531,12 +556,6 @@ static int pca954x_get_reset(struct device *dev, struct pca954x *data)
 	return 0;
 }
 
-static void pca954x_reset_deassert(struct pca954x *data)
-{
-	if (data->reset_cont)
-		reset_control_deassert(data->reset_cont);
-}
-
 /*
  * I2C init/probing/exit functions
  */
-- 
2.34.1


