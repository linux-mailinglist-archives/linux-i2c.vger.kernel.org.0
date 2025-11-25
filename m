Return-Path: <linux-i2c+bounces-14263-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E57E0C86A03
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Nov 2025 19:30:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F8413B39C7
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Nov 2025 18:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30938125A9;
	Tue, 25 Nov 2025 18:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b="of+sKH9H"
X-Original-To: linux-i2c@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012019.outbound.protection.outlook.com [52.101.53.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3B51BBBE5;
	Tue, 25 Nov 2025 18:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764095442; cv=fail; b=lMJd0WOl+IABWuvDFnH6SePipI80swge88cxsHkJK4asurQacHqmhkQt8ecqv5yhr+8fOy/5OmpQoII0qDi1o4ougIi1zFLFrQV8TRwErfMAFI1GNPkJgFOuU7uT9yXULRtPUwkZucqh64mbN/c58Btw6ULlFnmML7WIzOHeS9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764095442; c=relaxed/simple;
	bh=ZyYEWmkvz9W1Xhw/sOq0wm+Egmmp41J8NBRtUXvO28Q=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=dXnHXIoqs6ZfQXRnDCaPoQA+JuLqUNNRKuP/FoETI4rlsxwxJ6IqXBipyrqGtCe5gt1JWOo39Kiv7LjB+QDV7w4L75/7NwHk9Iykz9jDgJP0EW73aPOt7z01FmLYg5/K7adCYf/Z129p/qWuOxc/QqIYG6kMpxJAcPXCp4eKXf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=of+sKH9H; arc=fail smtp.client-ip=52.101.53.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nN5OPyVb6nImTCUH1BnQZG6ygMxM8PDPhGVXInWvhd76IlSlqXfvICWL6eAg+hzDZB7kcKfYmxDC/zLtfdXA57EVThntVpyHnrbO19pnYiCmrX2CawMUSlxYAKWburlw3oQbamqAOLQqYNCjcB+/QfFzd7HSL0xOnMQJzdoUd6p9LzDKU+SzG2NKFCgG73KzHJQmD4yU4fx9v+yDgyedjr1srXIEHppGbvt1cizE759y7hkCWllKoXC5zwoS7fbOsGHloi2XzRfHiMo85CAwK2gnesgDguN40zsUxYIAzt+3qHkuNq49zzn8X6Wmi9Kn8Ek7DmPnKFFltdRXhlpAQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L4s8/wHWH29JMxLQmdFxkO6dgLgxxCZMLIAa1nqiD8Y=;
 b=Qu6uphML5tyBpForvOo2e5B8w0VUDdcWN6tIUddlT2yLZf3x+FTWHbBt15l8bYcPCYpsXBEPuJU7xnDpn+WqCCbZ6tvlSjLBimCe3Jj98RB6+sq6DsJ8xp1HK0VEnFmoyCJMz1jjIrkb9nfU48wgzZpleBti1d/+tpU72sRCwSWcZb2iW8sQeWtq+92NdpW77fGV2t+674x9y//hSqduK8QZ05VcygZgTCDukNPEi50NO84HvlAOGVc3WUCbAjZ4lkRYdMcULXi7TMBdbdU1u9GkLHxmpPkm1xvzZg/xZtcg6xIYn6issu+0ScZIMUatWaMozREYVCfjInLN3Twi6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4s8/wHWH29JMxLQmdFxkO6dgLgxxCZMLIAa1nqiD8Y=;
 b=of+sKH9H9YHbxHmb38yyjtncd982/aDsg16pw3A8L52xUsdRFfPaqjEPrdtRAxxH9ctcDte7LcsE9GQUzEJSNKeUFqw1bedsq/aP5iTdxd2xRWfjQ5nQ958d/af59sPuk++RoLNvhVMJ/OmfGOWiCAUQAST3X2H8yr/jYylkzcqbZFzwCtCp5LL2Nn3jDTX4R5XaR1QlgWBvMIwDlyJFWsxSvQxQNVfPm9NxEsp1wnRWq5J7OvywEGBMGwKhFVPfdMxMJiRJbN04yzlnMnH4Il7xKVuVXzX0uUJxRdec9gy5Ls+AI0MNIIHI5OXt2PLBNTG+Ey5moxY+53iXRGRbug==
Received: from BY5PR08MB6296.namprd08.prod.outlook.com (2603:10b6:a03:1f1::20)
 by SA6PR08MB10355.namprd08.prod.outlook.com (2603:10b6:806:435::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Tue, 25 Nov
 2025 18:30:36 +0000
Received: from BY5PR08MB6296.namprd08.prod.outlook.com
 ([fe80::6ee4:c72:353a:9141]) by BY5PR08MB6296.namprd08.prod.outlook.com
 ([fe80::6ee4:c72:353a:9141%6]) with mapi id 15.20.9366.009; Tue, 25 Nov 2025
 18:30:35 +0000
From: "Jens Stobernack (Nokia)" <jens.stobernack@nokia.com>
To: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC: "nhorman@tuxdriver.com" <nhorman@tuxdriver.com>, "andi.shyti@kernel.org"
	<andi.shyti@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "vasilykh@arista.com" <vasilykh@arista.com>
Subject: [PATCH] i2c: ismt: add i2c bus recovery on timed out transaction
Thread-Topic: [PATCH] i2c: ismt: add i2c bus recovery on timed out transaction
Thread-Index: AdxeOSu5SL1olDlgTE6Xuio/6LLNrg==
Date: Tue, 25 Nov 2025 18:30:35 +0000
Message-ID:
 <BY5PR08MB6296FC84911F1B2F63AC04DAF1D1A@BY5PR08MB6296.namprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR08MB6296:EE_|SA6PR08MB10355:EE_
x-ms-office365-filtering-correlation-id: c8c21c98-de73-4059-5cfb-08de2c50b952
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?thFPMOYROg+eVRaaBH96JzYl9HLI81hINeAJsOv79XAnZrxAFUD5EZLc916b?=
 =?us-ascii?Q?VoLVuYkywkKEwFfZx3da3Sty5fAQVTmUHXx7CsaBejDOu8VdbyFPEEFDBPcX?=
 =?us-ascii?Q?C/JHs4wwbB57k2u2+6mZ/1WldWANyvB4BxYN7uCJ7OWsJ+ynFX4kPkiYz3lS?=
 =?us-ascii?Q?gQojaTZwZibVmeeXeE/tIqt2WKZxupNZSOKQchmRb1uO9WZ8yDys3E9MyYFU?=
 =?us-ascii?Q?TjGfQxp7sIUlSwS3xPGF69v6ZF73aaTU/oyGpQ3/66iY0sojF/UTjXCK6eQO?=
 =?us-ascii?Q?KDFI5NRwMLqs8a2odfSy+QAcpSKASZCQ7PBgECBy7ASq0P8ePxLgEkMQdzrt?=
 =?us-ascii?Q?kMSQt0MxTVs7iDE2rV0gjNwPpoeMXXZhNfuLt9HRctmiTGJhdKj3vjiPWZQF?=
 =?us-ascii?Q?BqOfS5JwT1QmrLgLtVZSfPTW2+ZdTfB1vl0xJ5jUv/FlUPjDm1RdoHPhTtGs?=
 =?us-ascii?Q?M3fmuamZMevObt4GUoAhOEcqQ06uMnUw/iX1TdWEPgzXQNQNgbFgV9ExW1Ce?=
 =?us-ascii?Q?Q99xoSJ7KvsrIeL/j7XVGrSbFragNHqm26omy9rjI1+GRfzn8GmwkKi1bUiv?=
 =?us-ascii?Q?EPCCVZ2JmwzTUIsEHlCimy1LmnVp/5ZVvDzYscuWs0kgj2+pXCb+JU88Hxkh?=
 =?us-ascii?Q?YN7iCWY9MzHRttxzUkaNGHSlOyElBGnXzt2afxt0/Lsg7JBCriWikoNOxh3E?=
 =?us-ascii?Q?weS9xfVZJRP14ohRfAy6USWYedQkHjENOKBjuDH6rgFxjiEY/Acc+amvZclB?=
 =?us-ascii?Q?PbW2TDbIc0Amok+DgLE9ltLe1aGKzUVT6Bwy5aMbLBlGZEIBhit1+3l/zRy2?=
 =?us-ascii?Q?iCxD/P5rg9QzjBhBEvgJ/co7OK4kuB7OVTjliT1YoNpmZ2zdPYrc/Ky0p6Dg?=
 =?us-ascii?Q?mxfCIXlXGlFy7jC3UdOvU+ZPs3OorgsPvZycxxz5PgQgkyXrMVCsdYj9UjYU?=
 =?us-ascii?Q?yBaK41kVR2V0NG8rjLh0kNlAIZtStfdLiIaGy3OnNv752QQZufrvVFhBiP1x?=
 =?us-ascii?Q?i4MX/5dp55UQ+eUBtruYGd+xxJwNqOHoDLuqjsdsbBBSjcNudZs48J+0paB/?=
 =?us-ascii?Q?6dR1hNUrExcl9Ptgrsc8VYeRpQ1u+VqGJzqytI6E1mdVKnzPH+InwjzTuH82?=
 =?us-ascii?Q?fP//DOiuldk7FIGILt2SVwrBCWUr4pVZvFvdmfVOmcSH99Wf6wlcwKJwjmE/?=
 =?us-ascii?Q?Z4YDr9U+HCGhUHSnMEvKf4cRMOMxOU4VF8PlSirnPgoD6Z1MVojH7xlOFpiQ?=
 =?us-ascii?Q?185f9v2OPtoPwpWh1itpejdcJA/APaeXYRiBCRwpYX7S5fEvC3LumfqKtM+W?=
 =?us-ascii?Q?duxINg30dvY70cSrnFFDytDhhurEfCvoM350XCpz+523FcZ9A9JCewurKrH0?=
 =?us-ascii?Q?LSLiEhpDurLWOwDK1Wlh0Mo0WMp5bBAnTsNHy50eACpfJsCpykGk9SAr1VMj?=
 =?us-ascii?Q?90s8jWwWdE/WdkbjkV76k2DeEb1M5k+39NFKI5yHS4wWC4ALoE/AcOtnehiR?=
 =?us-ascii?Q?DLiXJsua8nKDHXC5WvMhn0kttKDQaDsPMKKF?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR08MB6296.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?9O8rLTfMaAQdJrr4f7MvvY5QXM5Tq59pMyI+S8Ha4pq/qNjl39UrWKdUF6z0?=
 =?us-ascii?Q?K14liIg08LOtNZhwnKjI6crzHkEjNbyQYPUs9mUu7xYOBbJXmIHZ2a38Jrbs?=
 =?us-ascii?Q?LWYAKPIsQMt/bPloK8rBSUs/fqgmz97wEmr/5AeqArUCd3LVnnkY5UZt5den?=
 =?us-ascii?Q?av6c0ATdJzH2Utub/4AWsPsC1CW5HdwF18h3phg/eKgqjBPv6JqS5rLgvR/U?=
 =?us-ascii?Q?hVqNXxNlnMGxqxxCOM/mRnwktbAlcjlmf642izkxDXEmiYf/+f+NXfeWa8LI?=
 =?us-ascii?Q?3u1oYOAHzhYevvcpmfuTv4VUHTvxJzOVLnMr/DzG/sHMOGvsdRRLxjsAR0Bt?=
 =?us-ascii?Q?u9v3dUDH9I1Q4uMSRUT5zk3+xf3yNf3raNiQQm2ZGx9CFGafwvaTDF+ng7rS?=
 =?us-ascii?Q?qaVuQqQJz5RubNJi46QPcDKY+G/o4TW6d4r14kB9lwqD4ukI9ZCHqOgqGm3W?=
 =?us-ascii?Q?tWBvLDx0I0TyXNeOiCofVSldDlcAYcBFwaHcGXjyqhdSnpcjnpgVBE/ia4+k?=
 =?us-ascii?Q?yHDuP4qK+s89aCmoJYYB6r9vxq7GGpxOSBgFsFmwsvJgaqrF9EVBqWdBVLZv?=
 =?us-ascii?Q?yqM0M9WG34eMiqr+BlskqXc/aixH0Jxi2YLBIuJbUDubGC9xD6iuJHOGg/P/?=
 =?us-ascii?Q?G3uMfbBz22pQwBngVW/fp/dLca67Vaw0FsXnX2VPVf4+7EUb466Y6GKalKH3?=
 =?us-ascii?Q?fiWZmNaww84zjcmn3KJeK74bv+X0J75mODs/LgvgDsrbUnWwu+X+jGCdL5Ht?=
 =?us-ascii?Q?LcmVxzCqJerTLmfpeI3bBbD2u4m++labQQygkg5e+GqaYkM8xv03bid3ZY6s?=
 =?us-ascii?Q?nJVuz/szigFS9+u3uFooksc/K3kLUTWTVjyDZ8m1NZZedDp+HnjXo0g4wCI2?=
 =?us-ascii?Q?9QxcSzA+/UciBahAnHWST+wixvsbQxSRLt9ei5TsyBfrC7VeUgXdZ8XdrZwI?=
 =?us-ascii?Q?HLgIK+12LDWk6fRMoIdgjAqocSy4uuEY5XItfs6V8ogKHqqVQT2gFoKQVoyI?=
 =?us-ascii?Q?Dm2LlMp9vPlTAEs/bgot235zlT/gw0th9QFN4QoKxcO6QsOnI1yjcXjqwpoD?=
 =?us-ascii?Q?gBsGnyy68ZfDJ1mlEaitjh04IzZbTEnOQ4MPzg1Urmoymp/dMogi47mz8VYA?=
 =?us-ascii?Q?yMtDqgshf+Mvooea7w/NV9e5aDV2kHKTAJsLlbuqVYgWjsr8Nf8SNMyaYZ42?=
 =?us-ascii?Q?CLLClsgAYzvaum9PGM+BVCwOfL+eEO/o7K2Uo3rG+NCFe3V1HdI6lJVftBaU?=
 =?us-ascii?Q?0+vfXTkXpVDb1lgBy2FgabB8JRgKNSjieAwt5lHz6oynT4Phzy3T606ZDIRu?=
 =?us-ascii?Q?1VzSCOLYLaUwU0RxWkqJ7qXnGFP9a/7IgkDfddGqNawwhyzqHROoahbmDYby?=
 =?us-ascii?Q?LelnWcsEWhSifDGIuDfftqkbn2N9PFutWRZ7MylIjm0Mmuz6uP2WLRhxQO9L?=
 =?us-ascii?Q?dd9TroO3jxASIIl4xYK0FYVVrXFiLte3K5BZ8g6dfhKCnxzzUQsoiA2UO3F2?=
 =?us-ascii?Q?Sw2IJSzxSs4gVX9a/pjMQh5bJkM3rlPi0H8ZiwyR9W0SNvB71PKuSlurSJMS?=
 =?us-ascii?Q?GbQvHtuT9wUHr5z/TOJK5mAjVV7TPKVODIydlYPP?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR08MB6296.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8c21c98-de73-4059-5cfb-08de2c50b952
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2025 18:30:35.1222
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cHaR9I0RpBKnimUupeadB8ABlRCVykq2T301nERKZhSGBSMADtQJPtDHfqTpaVacTk8d+W0nIJokOSuRYnVMMyH+Lrud/K4MSL6JoZr3DKs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR08MB10355

In rare occasions the i2c controller will get stuck. This failure is
described in commit 46b2dfc0aa79 ("i2c: ismt: kill transaction in hardware
on timeout")

The kill operation never resolved the stuck condition in lab testing. A
traditional i2c bus recovery was required to recover the i2c
controller and allow it to continue operating as normal.

Signed-off-by: Jens Stobernack <jens.stobernack@nokia.com>
---
 drivers/i2c/busses/i2c-ismt.c | 128 ++++++++++++++++++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/drivers/i2c/busses/i2c-ismt.c b/drivers/i2c/busses/i2c-ismt.c
index 7aaefb21416a..4bdeb865d569 100644
--- a/drivers/i2c/busses/i2c-ismt.c
+++ b/drivers/i2c/busses/i2c-ismt.c
@@ -122,12 +122,17 @@
=20
 /* iSMT Miscellaneous Registers */
 #define ISMT_SPGT	0x300	/* SMBus PHY Global Timing */
+#define ISMT_DBCTRL	0x388	/* Discrete Data Bus Control */
+#define ISMT_DBSTS	0x38C	/* Discrete Data Bus Status */
=20
 /* General Control Register (GCTRL) bit definitions */
 #define ISMT_GCTRL_TRST	0x04	/* Target Reset */
 #define ISMT_GCTRL_KILL	0x08	/* Kill */
 #define ISMT_GCTRL_SRST	0x40	/* Soft Reset */
=20
+/* Error Status Register (ERRSTS) bit definitions */
+#define ISMT_ERRSTS_CKLTO	(0x1 << 24)	/* Clock low timeout */
+
 /* Master Control Register (MCTRL) bit definitions */
 #define ISMT_MCTRL_SS	0x01		/* Start/Stop */
 #define ISMT_MCTRL_MEIE	0x10		/* Master Error Interrupt Enable */
@@ -153,6 +158,20 @@
 /* MSI Control Register (MSICTL) bit definitions */
 #define ISMT_MSICTL_MSIE	0x01	/* MSI Enable */
=20
+/* Bit Bang Databus Control (DBCTRL) bit definitions */
+#define ISMT_DBCTRL_EN		0x80000000	/* Enable bit banging */
+#define ISMT_DBCTRL_SMBDT	0x00000001	/* SMB Data signal, 0 mean data low *=
/
+#define ISMT_DBCTRL_SMBCK	0x00000002	/* SMB Clock signal, 0 means clock lo=
w */
+
+/* Bit Bang Databus Status (DBSTS) bit definitions */
+#define ISMT_DBSTS_LSMBS_MASK	0x00000007	/* Last SMBus state, use with car=
e */
+#define ISMT_DBSTS_SMBDC	0x00000040	/* SMBus Data Change */
+#define ISMT_DBSTS_SMBCKC	0x00000080	/* SMBus Clock Change */
+#define ISMT_DBSTS_SMBDT	0x00000100	/* Live state of SMBus data signal */
+#define ISMT_DBSTS_SMBDT_SHIFT	8
+#define ISMT_DBSTS_SMBCK	0x00000200	/* Live state of SMBus clock signal */
+#define ISMT_DBSTS_SMBCK_SHIFT	9
+
 /* iSMT Hardware Descriptor */
 struct ismt_desc {
 	u8 tgtaddr_rw;	/* target address & r/w bit */
@@ -633,6 +652,7 @@ static int ismt_access(struct i2c_adapter *adap, u16 ad=
dr,
=20
 	if (unlikely(!time_left)) {
 		ismt_kill_transaction(priv);
+		i2c_recover_bus(&priv->adapter);
 		ret =3D -ETIMEDOUT;
 		goto out;
 	}
@@ -670,6 +690,113 @@ static const struct i2c_algorithm smbus_algorithm =3D=
 {
 	.functionality	=3D ismt_func,
 };
=20
+/**
+ * ismt_i2c_get_scl() - get the scl state
+ * @adap: the i2c host adapter
+ */
+static int ismt_i2c_get_scl(struct i2c_adapter *adap)
+{
+	struct ismt_priv *priv =3D i2c_get_adapdata(adap);
+	unsigned int reg;
+
+	reg =3D readl(priv->smba + ISMT_DBSTS) & ISMT_DBSTS_SMBCK;
+	reg >>=3D ISMT_DBSTS_SMBCK_SHIFT;
+	return reg;
+}
+
+/**
+ * ismt_i2c_set_scl() - set the scl state
+ * @adap: the i2c host adapter
+ * @val: the pin state
+ */
+static void ismt_i2c_set_scl(struct i2c_adapter *adap, int val)
+{
+	struct ismt_priv *priv =3D i2c_get_adapdata(adap);
+	unsigned int reg;
+
+	reg =3D readl(priv->smba + ISMT_DBCTRL);
+	if (val =3D=3D 0)
+		reg &=3D ~ISMT_DBCTRL_SMBCK;
+	else
+		reg |=3D ISMT_DBCTRL_SMBCK;
+	writel(reg, priv->smba + ISMT_DBCTRL);
+}
+
+/**
+ * ismt_i2c_get_sda() - get the sda state
+ * @adap: the i2c host adapter
+ */
+static int ismt_i2c_get_sda(struct i2c_adapter *adap)
+{
+	struct ismt_priv *priv =3D i2c_get_adapdata(adap);
+	unsigned int reg;
+
+	reg =3D readl(priv->smba + ISMT_DBSTS) & ISMT_DBSTS_SMBDT;
+	reg >>=3D ISMT_DBSTS_SMBDT_SHIFT;
+	return reg;
+}
+
+/**
+ * ismt_i2c_set_sda() - set the sda state
+ * @adap: the i2c host adapter
+ * @val: the pin state
+ */
+static void ismt_i2c_set_sda(struct i2c_adapter *adap, int val)
+{
+	struct ismt_priv *priv =3D i2c_get_adapdata(adap);
+	unsigned int reg;
+
+	reg =3D readl(priv->smba + ISMT_DBCTRL);
+	if (val =3D=3D 0)
+		reg &=3D ~ISMT_DBCTRL_SMBDT;
+	else
+		reg |=3D ISMT_DBCTRL_SMBDT;
+	writel(reg, priv->smba + ISMT_DBCTRL);
+}
+
+/**
+ * ismt_i2c_prepare_recovery() - configure bit banging mode
+ * @adap: the i2c host adapter
+ */
+static void ismt_i2c_prepare_recovery(struct i2c_adapter *adap)
+{
+	struct ismt_priv *priv =3D i2c_get_adapdata(adap);
+	unsigned int reg;
+
+	/* Enable bit banging, datasheet recommends setting EN without
+	 * changing the values of SMBDT and SMBCK.
+	 */
+	reg =3D readl(priv->smba + ISMT_DBCTRL);
+	writel(reg | ISMT_DBCTRL_EN, priv->smba + ISMT_DBCTRL);
+}
+
+/**
+ * ismt_i2c_prepare_recovery() - clear bit banging mode
+ * @adap: the i2c host adapter
+ */
+static void ismt_i2c_unprepare_recovery(struct i2c_adapter *adap)
+{
+	struct ismt_priv *priv =3D i2c_get_adapdata(adap);
+	unsigned int reg;
+
+	// Disable bit banging
+	reg =3D readl(priv->smba + ISMT_DBCTRL);
+	writel(reg & ~ISMT_DBCTRL_EN, priv->smba + ISMT_DBCTRL);
+
+	// Clear the expected clock low timeout
+	writel(ISMT_ERRSTS_CKLTO, priv->smba + ISMT_GR_ERRSTS);
+}
+
+static struct i2c_bus_recovery_info ismt_i2c_recovery_info =3D {
+	.recover_bus =3D i2c_generic_scl_recovery,
+	.get_scl =3D ismt_i2c_get_scl,
+	.set_scl =3D ismt_i2c_set_scl,
+	.get_sda =3D ismt_i2c_get_sda,
+	.set_sda =3D ismt_i2c_set_sda,
+	.prepare_recovery =3D ismt_i2c_prepare_recovery,
+	.unprepare_recovery =3D ismt_i2c_unprepare_recovery,
+};
+
 /**
  * ismt_handle_isr() - interrupt handler bottom half
  * @priv: iSMT private data
@@ -899,6 +1026,7 @@ ismt_probe(struct pci_dev *pdev, const struct pci_devi=
ce_id *id)
 	priv->adapter.dev.parent =3D &pdev->dev;
 	ACPI_COMPANION_SET(&priv->adapter.dev, ACPI_COMPANION(&pdev->dev));
 	priv->adapter.retries =3D ISMT_MAX_RETRIES;
+	priv->adapter.bus_recovery_info =3D &ismt_i2c_recovery_info;
=20
 	priv->pci_dev =3D pdev;
=20
--=20
2.43.0

