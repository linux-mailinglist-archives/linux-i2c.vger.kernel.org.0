Return-Path: <linux-i2c+bounces-11518-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE884ADFB61
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Jun 2025 04:48:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8D8817C0C9
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Jun 2025 02:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7459A170A23;
	Thu, 19 Jun 2025 02:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="W7ae5j8e"
X-Original-To: linux-i2c@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013027.outbound.protection.outlook.com [52.101.127.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55578D517;
	Thu, 19 Jun 2025 02:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750301291; cv=fail; b=d026/d3J3JbThNhcTsglEWt+6pI+GFGtYRQfeF862YBNkHqOQPv9NIqnAcQJRGwLWsjlNB9hmbFFfH9Vl5GKXoEdvEg91CLtz99I2BlZPPVVbHe+sjnfIjdbhKKirTos3lJx4rbKE+irGz+dYL6wg0e88DP3RakXXKpghAAKGoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750301291; c=relaxed/simple;
	bh=t7XYE2XbTwUKfZcF7b2J/cTHSzxCHzvH60BIHzqCUwk=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=foAx9byXxDowag/vTkT/81JaocazN9LAWTXm3z4XsFss1eRXGpMpmL4c205SJaOUUSd0W4qKAjkEoSV1mWVtXjbYTLzJEOKe6CpQ+57E4CaCEqaHOuy+qU3W4GpJi0xVwWlF+SXKyav/WP687UyQIRS3Cq+r1PGsVLR42uwtK08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=W7ae5j8e; arc=fail smtp.client-ip=52.101.127.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cNve2E/JaZOk1Eloa0g4zrzg/RvVgTbkIWUxYhF/pGO8Ql6oH2d6CSDRWNr90fxriTqWLu7bkeM5ZOxaBAWvzopJcKoPnC80xwOfM8TWMFdqumbZVzPYG3VxjaQ2SzR+HihKC08nyFjDNHTy5GiuyFkgk25mXoHKUw1oWOJR441x/KU7VZgFJOrqab9yawXSLMv7Y4bu46IMDmJtLnHqA+78eqV2UpiNr4iKiPtz+ESZBe5k6I5HgFPx3tf3WgvuBeiR9KbmIdhd8Vm+vKgon/43V/kL2RbQhTWZULfWxxqCw/D5oJLJ8rfPSEM79QssKE9sb2M9HSW+WbEtJXE4WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fd6aCXnMpevUINd8DmlffRlKHNE+xwuD1fVO06R6pg4=;
 b=jlK6CVQk5DJYLOXjSu4jdQOGeidZ7Fq/Ut60g88eqSN7AkUFmzEK/pRHLXR0qPk624ymp4Z0eHzt1flWmivQV4sc6YZpbYyX4/PlN7TDWibUQxs38wSp9MvxkbmysA1LbLlMX9bn8u8Ka/Ll+df1br2vWd+LhrBs172UHjG90h9Ei+NwBqd/qA9jJ+btEA4sumQjyjtH298Ee+ipb/2+qZiLeAbI4XzTaAyDFy+BHDcxsmNHfTyPlr3rvjkA3k1I6lmCfkgpWkYEBvWRNIws5lweqd4N6uSjsO4fcCE6F/4gIGCbP0X3aV9UoaWU0Vrhny3D4pUCOe1Iyo4iAIhkWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fd6aCXnMpevUINd8DmlffRlKHNE+xwuD1fVO06R6pg4=;
 b=W7ae5j8eyWpBjfjG7rx1dBYyqleWdYY+Smqnp4+W3zmUrDhZXQa1+xTcjBTYMqUhlYIUEdORpm05qtmU3GfVUP8oYEOUlSUk1tolV7susa7HrhkzESRnxdyhV7bWzfPrG7jPAs3ABADUAUuyYWbV0MxNvz/6nSjBex0lGm9qzwnBirNsTyDPu88JkrBeU/d7l83iOpoUnNcIvPuCRIVeuqrGut6rGS72GKlKgeRsh2c7X2tPXI6w0N9+SK2EXX7b4st86CPH6+3iTlCg2gbLezyFRoNKS6oXI0f1B2DlgJJUL8FuXtTFUQL0M0MU4ObQfA5AeZweMDRwK0CYR9Z4Ig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4454.apcprd06.prod.outlook.com (2603:1096:301:8a::10)
 by TYSPR06MB7164.apcprd06.prod.outlook.com (2603:1096:405:91::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.32; Thu, 19 Jun
 2025 02:48:04 +0000
Received: from PSAPR06MB4454.apcprd06.prod.outlook.com
 ([fe80::ca1f:8841:8cd3:1bb0]) by PSAPR06MB4454.apcprd06.prod.outlook.com
 ([fe80::ca1f:8841:8cd3:1bb0%6]) with mapi id 15.20.8857.020; Thu, 19 Jun 2025
 02:48:04 +0000
From: Yu Jiaoliang <yujiaoliang@vivo.com>
To: Rishi Gupta <gupt21@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
Subject: [PATCH v1] HID: mcp-2221: Replace manual comparison with min() macro
Date: Thu, 19 Jun 2025 10:47:41 +0800
Message-Id: <20250619024741.5807-1-yujiaoliang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWPR01CA0006.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::11) To PSAPR06MB4454.apcprd06.prod.outlook.com
 (2603:1096:301:8a::10)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR06MB4454:EE_|TYSPR06MB7164:EE_
X-MS-Office365-Filtering-Correlation-Id: fb92055c-0771-4d8b-11e7-08ddaedbb684
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AM7NjHTnIdYzqDeg3y+BTOloHLzP7bIC2v5SAI+Ae0/YBhy5vVI4SD6S0oQi?=
 =?us-ascii?Q?B7mD7Eqvi8jHDFGeqbrxr0sav6TNfxDNtid8OJ+myKHeiBiCS/qgoflVDdRG?=
 =?us-ascii?Q?OaWHOmMqGy375DTMptQ+qT9G4KOenFVg9o7VZR7YLFqvDcQEMh9Y8/NUss9r?=
 =?us-ascii?Q?pVc80UjoRJwegdWcNAcyPEva4O3isrKAUzLqI42VkKlQkLLGRFTzwO3GIIA4?=
 =?us-ascii?Q?RJhrBMzak7y2JX1TFu+sPn5VNRRCAvJK+IkYUJxts4a+tlyYrc9BCJABPHai?=
 =?us-ascii?Q?+V7jx6QGk8ig62TEu2rQ2yQC9Zxw/6TA/NDkFisNbyiRQRML9BQb1PDmJlqy?=
 =?us-ascii?Q?SGuQ0vtK6+eTbJKHV/4Pakd73JkjYx1gOulik+rtbp2UR3coXtRiy1uquxJH?=
 =?us-ascii?Q?nvJByn+fbn2ev2kWvwD6Mr77Xt5PGwiOD2lh22rmDk3J6kUZG8htLqR8hF3m?=
 =?us-ascii?Q?CT5Kx152OGLh/Zlw6p4nLZoqjdwDORjaA8XcH1RD1PfHdbpH7Co95p3iy3Lm?=
 =?us-ascii?Q?QwFNr75O6jpLif84dtXo5zd9aRvI2CTVd/qQWA9DX8dLEnI+r99N5ZagiJbR?=
 =?us-ascii?Q?SAgIFoLCCG4LP9DgKhUUqC4kQhStbt7rCqUx1CY7k233+IullAXIthbfyiy2?=
 =?us-ascii?Q?fdLMzdbuyxfypE0H9ukpHKOvEB/GKbQLjtGvS/HZMUJ9H7q2peg9+LDhQ/y4?=
 =?us-ascii?Q?cmrXn4BdwTf24llluEkek6lXG10zcU3bT0fV0P90XZQZBk9Htvg+We3u17I/?=
 =?us-ascii?Q?VLjyAOGoMZKOyhkWWpt/5V2bXx0HhkNF0HBnZArcZZvPeWhzgexVHgP/zobd?=
 =?us-ascii?Q?/SnrYdCMJuE1C+h0/1x+HR7Veo1qETZ4ExArTEkBMDFuM1M+ooN/gI5pNtSb?=
 =?us-ascii?Q?ha1rI7bJePMm+6WY2qSIylMTeTWvxxte37OhAm/JNDTzpfNEKXx4zf1whgTU?=
 =?us-ascii?Q?SPnOqwhEx4fHdh8YfwGWA36Hb1cdOAYbYqm2ftcXdOIiq4pVI8XrCfLZ+w1T?=
 =?us-ascii?Q?Hz69ve4lAmra9+KgGXrnczqc7JeVCmXqbPGBWcG9CYFirtyAn0BOdb9Yegz3?=
 =?us-ascii?Q?xCcF/mjt6CeOmI81Nkr1vykgxSrtbunjPmaXyTQqtPTjzjUQDDmJ/iuaGGA1?=
 =?us-ascii?Q?LTjmzoMKG+UJx8wLlJI0+un+mdyFfqPfy9TQgotmL29cArmOBbQMjV/rxWns?=
 =?us-ascii?Q?tEv+AijUGMRLP8wDl/wlm/PAMqllqnxRs9tKnaeycllXAUI55RdHaoCbsYAI?=
 =?us-ascii?Q?/unYj4OPjM9sUHxZPI25Ru5Ej5pPvRFzRsTOCmeSsqBmhvCYQMbYtuKgXwOg?=
 =?us-ascii?Q?LE+KUA0MhuhKRvyftqe6eHhhot1LMXV2oOmKzMfD0Vg+w6gOuWyM31CRkmjq?=
 =?us-ascii?Q?29YxFP5wFNAZpyaFL0baPnQ6JtcB5XdAn6IeI1xj8xJ4+6YADmGO7Lpjdv1Q?=
 =?us-ascii?Q?3++HUaz3JsJAwCXIAKR9YTHGKxWk6lM9S/7z1TRAW1bDLcVApXMN1w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR06MB4454.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RkTZJ/EDn4CYYsOdWsnMwVky2MmwIhYeKiVWnjysJ6s+aUJ0GcQ0fcN6HPDO?=
 =?us-ascii?Q?unV4bIgn86PH6kmLl/lxSNAphxluDDMU18QTZnbGN/xxJFco0uBtqvoresTj?=
 =?us-ascii?Q?KCUYDZe86uvnN3T/XWPP3/9FbUAu9o/0eVDrcWP09L81rcCujtEc9e9UfiSW?=
 =?us-ascii?Q?hSQQboz9MoW3oCm3r7Uqbq7KEq9crIESRwsBkmYfkx19WdcFQ2yhhPWnCaGO?=
 =?us-ascii?Q?Osev3GN6yusiOA6Ys4vqi1IwCTEu6FbbvXhrQKH045S7+9lP04A1kONGkrb0?=
 =?us-ascii?Q?OZTbK5o9lBatjui71SoCjr0DEhgfncnBMCQ1PYSgImpcOyZQsPVmnlYRZVqm?=
 =?us-ascii?Q?9lxTYE9X/eGFSiIGBbxVv71bjbi93VcwCKxrJPFLqk038qaICjqZKK08LI42?=
 =?us-ascii?Q?2AsDj1EYDvj4QGTS7VRCPNqsYcEjjwJ+EiRU22wfPtBH1QfkkRlthV2woKxy?=
 =?us-ascii?Q?mx46XVAwxgi/zEjhadjtDNG9N5dvtIizgMTGz0UTCZO4AqOpXRrXZfD7bYCe?=
 =?us-ascii?Q?ZZQnmiNVR9a8ekcbh6QXrfIkzZfHw3gmajsWkSWy9h4oJs8Zzngv1vsAkael?=
 =?us-ascii?Q?Kd3kTFykzxywgkm2v3mP8YNDGYNsn3y7v9TFMekcJeVA6jZ/CHz1H1h2TFCa?=
 =?us-ascii?Q?PPEYyOxgnrH9L5vdUmaVnGA49MQsgMaYbgrHAYZwj74u+/xVYroRPhhXolYl?=
 =?us-ascii?Q?ZojDNGFUvuPPbpSC73T8WFAVYXoz6pK3Dv8001wK67O7TRSC7W2t7crKzjnx?=
 =?us-ascii?Q?l+/WQ4RyTw22XgOkqE8DW0Nps/Qr0gYx8FAX3LSnJvimqzrqZxJ/BCsg0JbL?=
 =?us-ascii?Q?4I9S7DnDbB4gOUYTrbiznUU2TqP+i7GnCWeFn6T1vJlyuMSprrzAcc4dVfem?=
 =?us-ascii?Q?4tFinFkPsCKhSQCTiz+Eczd2sy5S909rP0ejQ69hc9b/IhpYvhJleACBYZjH?=
 =?us-ascii?Q?9bk3RunrXaFqTpcZu8fYxw4wTEucYU7adJjzasYQwK2yylUn3IcsG6wi1dyh?=
 =?us-ascii?Q?pKTKW2Vis9tTDpvoLlh72GwfQIvF6ZfY2lOGQwuTDLWpjAGrCdJxd1cDE47V?=
 =?us-ascii?Q?pZL/Suh8DMsuMrbczgb6GwdDafoI9K1Sxsr751sPWOVzO8j/h46GOSQjpdm5?=
 =?us-ascii?Q?GxZXCHx81CtIV4cjl8T6r8D6tLFo5w1dJP3eE3CzpY+7ac+U4R8NEJTuDBg6?=
 =?us-ascii?Q?Fb7spnqoFPnMx06ezY4X9v/a68x+nWXhXnc75EdHnJ5QrDLetkD89XJE0Epo?=
 =?us-ascii?Q?bKWVNiaxZQEHALFoYf3rkOR7VdzvwsHXXZVbV6VqpGvqE3a5Zbxt3wLUIVpB?=
 =?us-ascii?Q?g6qeOhhwdqWocCcIsIvHmw5ogqrb4vbyARzOnz4x86dnHay1wMG/PA20NYDT?=
 =?us-ascii?Q?ioodvLbAF3V+st8Vnz/kq7B/iJJLjtipWClKYU9/fTFuxlMSgdn486npFeZ+?=
 =?us-ascii?Q?nIbtYqrzkT9y0jmMYRVu2fr2zj/ZMkJuolHZ2nsBo9vhlIHUGqxk1zUQEt8a?=
 =?us-ascii?Q?tG1ymlQHhgYyTUh6KN+KTGBMa8An3koYel0FS8xZMW5Hr0Vr6XkMVLD4GMjO?=
 =?us-ascii?Q?YZxTP+PEugcplb+SdCp/fdPzev9xpc1JkwUuNiAz?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb92055c-0771-4d8b-11e7-08ddaedbb684
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4454.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 02:48:04.2661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rm5ov9XhQlib2h8QcznHA0ik/HnEGHRfK4jd4O81yJHTCc7ET/VSyB3HHHADnrSXDI8je5xtolhSRr3Grqe+IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB7164

This improves code readability by using the standard
kernel macro for minimal value selection while maintaining identical
functionality.

Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>
---
 drivers/hid/hid-mcp2221.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index 6c0ac14f11a6..dca61fb1ac08 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -18,6 +18,7 @@
 #include <linux/i2c.h>
 #include <linux/gpio/driver.h>
 #include <linux/iio/iio.h>
+#include <linux/minmax.h>
 #include "hid-ids.h"
 
 /* Commands codes in a raw output report */
@@ -241,10 +242,7 @@ static int mcp_i2c_write(struct mcp2221 *mcp,
 
 	idx = 0;
 	sent  = 0;
-	if (msg->len < 60)
-		len = msg->len;
-	else
-		len = 60;
+	len = min(msg->len, 60);
 
 	do {
 		mcp->txbuf[0] = type;
@@ -271,10 +269,7 @@ static int mcp_i2c_write(struct mcp2221 *mcp,
 			break;
 
 		idx = idx + len;
-		if ((msg->len - sent) < 60)
-			len = msg->len - sent;
-		else
-			len = 60;
+		len = min(msg->len - sent, 60);
 
 		/*
 		 * Testing shows delay is needed between successive writes
-- 
2.34.1


