Return-Path: <linux-i2c+bounces-14641-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE20CCC74A
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Dec 2025 16:27:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A35E3034586
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Dec 2025 15:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B70CF34A3D0;
	Thu, 18 Dec 2025 15:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Y/KZOxXr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011014.outbound.protection.outlook.com [52.101.125.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3566349B0F;
	Thu, 18 Dec 2025 15:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766070691; cv=fail; b=UuE2ap7/DRrR2Uby8JeYkRWmS6c+Czs/5SacEzenolwVpRHTSS/WSDdaGYA/nxFf1UNKrsFtO4dsTzEZ51EcUWoMvZJMXSvaFbUllOLz4zYBsUsEPA9zGrLunJCLQbaWPZrLHRbVmz0TEgofXdjKQDiibpUJHoqmJ+Zh3Ff/fSU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766070691; c=relaxed/simple;
	bh=SIpCy/ArMKFTMt2nhf9p2aVjjPCunpPYkwBju/BSOPM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=bdtquxHNzIkOgciocuzhPQb+iBLrdLK0rwC8EMHga95FP53hVOmVsZm4s5y9j22Ve3ov9gkcsHLVThOLSu+yjFqyIcpG7CDfuTcEorZAu3r5T8fflPmiFsTKbF4kHK2ZjTVRw/xgmNFudD55Ye4Toi8GOHDv4SzUnkFbuYtVToU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Y/KZOxXr; arc=fail smtp.client-ip=52.101.125.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BK+klPiYGfaP+bCv8XG2N8M5vjfS3gh1UuTxjbHBb9DBqFrJVyJbPJFOR+IIsR7wwhVcfSkQnGV9A7sEia+UuBxLNtps8Q4e0DhLR9/fJ5hXm1n67BzR/0OAcoiYA4hseXsvkOpMszWekdLJ66K/vbQsEXgCwE6ex7v1DGkKeTr0NR671GSsix4mlsOGgzMXllYacx6LB6t/w9rQyf4dxWQeeheaqIMPfzM90vpszfTV7x1ncwW3jJFh8bBjtFif8eRNThW83oJTnG5aSMuHWQ85rSt542qFbbC8R22BERE36QIx96faoJfYgIGPDZDdIuRq1uBJHkm2kqO5pZG6oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k3gekwqtbSSsq5D/Z7MYHB7snA9y/ZuDlMgDo8vgiEI=;
 b=kJqgoZJIoJb9bMesEy2n4/ybqk1THDOT+oGLJGMnW15PEOSKmA3lOsPC0jWOgYNnkpAZ3txYzL8cHwc/ZTPzTE/j+vE9quizFPTFEVx+tTS2SbqqZwtXdtxKGnPSYY7Xood0UGZw3a7gRLY4n9cZhJ7W8jis8GAoatQGpAl8Q2j13XQD3WKC9iQ1/7GnKP/svE3Pjwl0cMhOl9SWjkuSOH5bQB5ZzGxix0UYouCxgIdH8//wRfVG2M37oEpiUYfwPkTe9eCT/BWpcWwGxQ5y5pcoaxgYgh+nZBl9aWdLKBRCSsGnx4fb2MzWTmCbPoDjFw7xUxFHz6i2qFZfdB0ICA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3gekwqtbSSsq5D/Z7MYHB7snA9y/ZuDlMgDo8vgiEI=;
 b=Y/KZOxXrr47wMl08V0O9se6BOpocygcJAQitPpx+YkKOoWSjfOmYfU7OpretRhvQSqxOgDVkfqj/YbA8jgnxrSYyrd5mu4MM7sooSgxpnaA7Gzth9CDeLLTow//BhzoeOG7RP0K+gmm3CncNOE2KtUWajS8e5e3GcyvI0/GMOWc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY3PR01MB11948.jpnprd01.prod.outlook.com (2603:1096:400:409::5)
 by TYRPR01MB16319.jpnprd01.prod.outlook.com (2603:1096:405:2f3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Thu, 18 Dec
 2025 15:11:24 +0000
Received: from TY3PR01MB11948.jpnprd01.prod.outlook.com
 ([fe80::1de5:890d:9c69:172]) by TY3PR01MB11948.jpnprd01.prod.outlook.com
 ([fe80::1de5:890d:9c69:172%4]) with mapi id 15.20.9434.009; Thu, 18 Dec 2025
 15:11:17 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] i2c: riic: Move suspend handling to NOIRQ phase
Date: Thu, 18 Dec 2025 16:10:21 +0100
Message-ID: <20251218151022.728661-1-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MR1P264CA0148.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:54::13) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11948:EE_|TYRPR01MB16319:EE_
X-MS-Office365-Filtering-Correlation-Id: fe4389dd-67a7-45a9-4b5e-08de3e47a4e2
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fEEae1bauduD9b/noLMqmoi5nMWIDPwD7DMHmgEfmA4eZpindk6ugvlZR+qv?=
 =?us-ascii?Q?h+/wEzWkS/mmfRU354bAB7alAa6WnEUWa+PFKnp/LxSNvR09aMKr+NEC5D5W?=
 =?us-ascii?Q?TJfxxNfFxhBZSdMx9ArSgoikKoJkk64aGCsfnXWc0TTtNLr4Mebce4TUWlEG?=
 =?us-ascii?Q?vZaNczCraak9xKBBBRB8Oq99ehOrnwwmu/ii+54sPiNGgMxgCJ/cU9WxuwAU?=
 =?us-ascii?Q?BCsRs5KIjNwi5GXKxFCgyeHYzWR074Z6ezxQ3iqzjcONm4u6YnprVmt95pZ3?=
 =?us-ascii?Q?aczq6qzPQOZ8dgwjzWMxltFlpZIR3Zw+GWGk40zop5DVfg12NW/E18l+nEsP?=
 =?us-ascii?Q?mCucW3bMQOjSRxcJB4JJHHgAtZ8PDMruzzQnZDtickMV7P2XxRxBgqqG6A5z?=
 =?us-ascii?Q?8GUnJ8tiFHsE1EmiAjQCBdFQ/eWrAs4xUs29SQ8ctK39x1uqpDpC297lp+pJ?=
 =?us-ascii?Q?ENd9ZNKvH1ghDwjay7S/BGlveAnKSO2Htwqb7e9J+TUbzpLDWTiPg3DowUgm?=
 =?us-ascii?Q?EKj1svC8Oz4JV0ey0MP8LCgwmah3e0lOHNosuRbC5ADL3y3cIDm0vI/9+rB9?=
 =?us-ascii?Q?qfldu/s/cS9hkTvkX0lxV08QN35sbAKyPpAOSdlLAuCOJvdLwFhjY/gTsAP+?=
 =?us-ascii?Q?ZD2T+2TC7AlrrB5yU3ReXPpXokKIID+Ow00iH/9XV5MqCSxZQPi5V9pyWgx8?=
 =?us-ascii?Q?BKMVmpixu6kuU0Gc4EJZbq9GCxnmIVlwGleuZQ48jDqV0JWh4ECKq6tfbp8G?=
 =?us-ascii?Q?W2hAC9RqEQNlvbOf4G/PbCm9ya692P/wPYDebYgul0nhEQ6+/RNlUkq783Fk?=
 =?us-ascii?Q?A3iXrcJGtV5ISCuYC249Y3am1lVHfby6zxL8Jb2Ff/0gADzxb435w1sEMzsc?=
 =?us-ascii?Q?IKj6+wIzXyxveXtoABvwb7JMwYLnqGOzGPNfYCJHQUM3MmjVYzkzocrmgTa2?=
 =?us-ascii?Q?Eh2OM+HnN+0hnc2noUIKnKVwd2AW5l0FWJ2JFwoDC15AsDOpJV9TASt3UE3k?=
 =?us-ascii?Q?q1tKNTpgluSCIAfpVoMuHCaElpchhZ6tw3QjFVN/TlIh7GdtmOvCcVzNc7BC?=
 =?us-ascii?Q?u8iT+JcKLahcMTSmf3G03cMAz3HDSCABHssnS0NgFY4wTFhIBnEV/Y1Ai0Ql?=
 =?us-ascii?Q?E3vGB5q/KjpEneaYfa77WDG2HT+GWVRW0SWJXf1jIkPb6PwSuYgU988e4r4e?=
 =?us-ascii?Q?pfoy0VBNnpQLKay9Xf2pAtHn26WgDnYWn87YLIuKmE4dPYHfjApGBCKf/QQC?=
 =?us-ascii?Q?VTKna2JOWTnvZ9OWMta0+t5Pw0olPn+1/9Fz0EG4yDC24EjC6yiahQYOil3x?=
 =?us-ascii?Q?gasLtiH0VswU43LePmSjyV0FqbwmwAaDjiIP/8ZTPHiKGyNUg+1PwMD+mI4B?=
 =?us-ascii?Q?E/aodJTotZOomagSzGyOBKDXquBeJmSszJswOqUIpJIuSxvW26CC1IkilnOj?=
 =?us-ascii?Q?5gVanMSEI08bVNP+nPGVjtu0XQRAhY/1myLEyoRMaPD4H2catsV3PFd3c1XU?=
 =?us-ascii?Q?6sj+R4/4w6H95JpJ619UQVw3kGPXs03ejYkI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11948.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EmI46VsvXOO+p4wMHRL/3NN5v12IdGINLpLhWnEREc3qe4pwM84NN9i8MtJu?=
 =?us-ascii?Q?Lq45I5OHayQhcgGndwqVJs6GwwqjUd1SWnrs8922m80luofq2x7iv6i6SLst?=
 =?us-ascii?Q?16ObqngC9BDCsc8JXqdIOEkQVLw9/K3Nlbf2oThZXa+8EMLV3qRyM8zKVOYy?=
 =?us-ascii?Q?V+q7Kc6ydsKMA15Ab9+drU6KYDwaiRNtAwvomZo6uvLbSeINm9TIEWa7MKqP?=
 =?us-ascii?Q?eVU+ZEVnzHwx6DTPAqzcLqhy+xA0arfXPGKchCNbMiAS226MvQITDKcHu4lR?=
 =?us-ascii?Q?SH5vx24J/1XYgmpHYrdgn0e1IDEdRDDjF/nyLD73KLiIu9KEc/WjVxZR5Y+t?=
 =?us-ascii?Q?x0WeA+lIHwkljxHmYQks+QvRxMou6ehz8R9M+tizEDpHRMh55Ywaqsj99N4N?=
 =?us-ascii?Q?aNdcRRKuF9RWdrGIbKBzDBpFN3QBm5jFXKkH9GtZ5CgQdtWrsCIVaiCnQFf/?=
 =?us-ascii?Q?Zc1kzBUob0pXQhosofUMY3csZKeXkiWvoW2ZfvtlGkYsxGFz/P14eGw6dcpF?=
 =?us-ascii?Q?v0tUpUcPIye4TvGxPUV9SxxPAEmuxPsXeo4sSwskBarVOAh7yEZuQ5xRNts0?=
 =?us-ascii?Q?vNuHnzA9P5KYMslx6gYd2qTCeojKMoqIawRS8ab+rDITVRs7nLtL61sShmxs?=
 =?us-ascii?Q?/DF06Ct4Ha+5xIzn4ob14A0hg6uZ2JfyZorinSNWEnpVedtY/b8oWy88FExL?=
 =?us-ascii?Q?KKvW3rTtSQE31FKR5Yv4zo6tYFbPWuy0mMJdjAbjig+U8GWx/b7Wy67eDRxk?=
 =?us-ascii?Q?Kb7zycP4YDVkEgcap83dzeeexCErIVYoZldnm1ABLMpEUp4izAvmZTnrndiV?=
 =?us-ascii?Q?XQbki+6bCIW0tpxKVjHSa+T7LwA+ZhTXFqsYMnc6mEmbcbvW++glPUq8ZzuA?=
 =?us-ascii?Q?/suSTWnVI2IK6x4xrvWhfLLLr0QhbGJ//7JzA7Zm+8zviVA6S/1h8hKZKCbN?=
 =?us-ascii?Q?e3Z8CpW05siDQ9nd7Nm/aY0gGANOg/uRh3GvpaXEZ2fnfW1gOGZDG5mMH/5e?=
 =?us-ascii?Q?VQytZjM4Oexh+Or6C8hjoDBgV6TPwthkVcDwsaO+FVeY2hkKkdK8qdQExq+V?=
 =?us-ascii?Q?LaCqT+PYGMm5cDQvAvnyuc8WA8iMv/Ldyx68+CMUa213jAiUa0HD92D5cQUo?=
 =?us-ascii?Q?VVR2K6vtV8WE1dEgvvOqdcoXylaJOJam7chIWUofPo2/ltKh+zyPlPwiCYL8?=
 =?us-ascii?Q?Rgg8bBag4ws9JvXE+KZLRwkehbUk8IASfYFjTRf55SBDbAZ1qBAyrO+UILGM?=
 =?us-ascii?Q?FQV8YoovP8TSsghA52PgJCOWJR3TgbUl+iAGqd2AEC8HXzKlqM1Gs2hqcqo0?=
 =?us-ascii?Q?VF0dxwtl38WG+kYl3JOoMX1J9TxVI1uWlzd1YRzD9YM8HMLYHQu2a6FfQOZU?=
 =?us-ascii?Q?DHWqJougLWw8fuVRBgsaRYLthOynA/wnpaghmgV8Bmp6UchVX2vy90EqJ71f?=
 =?us-ascii?Q?CJU2/e3HoYrJ/4y/HIa9+S9esUPEEmmR5+rw7LH4CMEvp1wUj9YlBe+6k5Aa?=
 =?us-ascii?Q?k8ULu2nHFp2nLaXr2vbxFhHvU0n1WJFfHp3tF/CL0gqPyLfWDfGVZxsUkhth?=
 =?us-ascii?Q?bZV0LPcc3He/cOVBB58fw4xtQY4/fqla/tyXThv6yY1VBeDS76TIWqcegOWG?=
 =?us-ascii?Q?tyR9swTkWXUURa43mN5H/C4=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe4389dd-67a7-45a9-4b5e-08de3e47a4e2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 15:11:17.5093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S1J6bmqPKLUz+0pIHXKLN+wtb0cTUWGahRqPGi3tBzrXd9Fed8iSHBuorpdcQforTB94af3yRa9t6EuD5sBFIlCKviRdTHDpdTpFJX7mSKBeEtw90XdA9SFFRcLJaxye
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB16319

Commit 53326135d0e0 ("i2c: riic: Add suspend/resume support") added
suspend support for the Renesas I2C driver and following this change
on RZ/G3E the following WARNING is seen on entering suspend ...

[  134.275704] Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
[  134.285536] ------------[ cut here ]------------
[  134.290298] i2c i2c-2: Transfer while suspended
[  134.295174] WARNING: drivers/i2c/i2c-core.h:56 at __i2c_smbus_xfer+0x1e4/0x214, CPU#0: systemd-sleep/388
[  134.365507] Tainted: [W]=WARN
[  134.368485] Hardware name: Renesas SMARC EVK version 2 based on r9a09g047e57 (DT)
[  134.375961] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  134.382935] pc : __i2c_smbus_xfer+0x1e4/0x214
[  134.387329] lr : __i2c_smbus_xfer+0x1e4/0x214
[  134.391717] sp : ffff800083f23860
[  134.395040] x29: ffff800083f23860 x28: 0000000000000000 x27: ffff800082ed5d60
[  134.402226] x26: 0000001f4395fd74 x25: 0000000000000007 x24: 0000000000000001
[  134.409408] x23: 0000000000000000 x22: 000000000000006f x21: ffff800083f23936
[  134.416589] x20: ffff0000c090e140 x19: ffff0000c090e0d0 x18: 0000000000000006
[  134.423771] x17: 6f63657320313030 x16: 2e30206465737061 x15: ffff800083f23280
[  134.430953] x14: 0000000000000000 x13: ffff800082b16ce8 x12: 0000000000000f09
[  134.438134] x11: 0000000000000503 x10: ffff800082b6ece8 x9 : ffff800082b16ce8
[  134.445315] x8 : 00000000ffffefff x7 : ffff800082b6ece8 x6 : 80000000fffff000
[  134.452495] x5 : 0000000000000504 x4 : 0000000000000000 x3 : 0000000000000000
[  134.459672] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000c9ee9e80
[  134.466851] Call trace:
[  134.469311]  __i2c_smbus_xfer+0x1e4/0x214 (P)
[  134.473715]  i2c_smbus_xfer+0xbc/0x120
[  134.477507]  i2c_smbus_read_byte_data+0x4c/0x84
[  134.482077]  isl1208_i2c_read_time+0x44/0x178 [rtc_isl1208]
[  134.487703]  isl1208_rtc_read_time+0x14/0x20 [rtc_isl1208]
[  134.493226]  __rtc_read_time+0x44/0x88
[  134.497012]  rtc_read_time+0x3c/0x68
[  134.500622]  rtc_suspend+0x9c/0x170

The warning is triggered because I2C transfers can still be attempted
while the controller is already suspended, due to inappropriate ordering
of the system sleep callbacks.

If the controller is autosuspended, there is no way to wake it up once
runtime PM disabled (in suspend_late()). During system resume, the I2C
controller will be available only after runtime PM is re-enabled
(in resume_early()). However, this may be too late for some devices.

Wake up the controller in the suspend() callback while runtime PM is
still enabled. The I2C controller will remain available until the
suspend_noirq() callback (pm_runtime_force_suspend()) is called. During
resume, the I2C controller can be restored by the resume_noirq() callback
(pm_runtime_force_resume()). Finally, the resume() callback re-enables
autosuspend. As a result, the I2C controller can remain available until
the system enters suspend_noirq() and from resume_noirq().

Cc: stable@vger.kernel.org
Fixes: 53326135d0e0 ("i2c: riic: Add suspend/resume support")
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Taking as reference commit:
   4262df2a69c3 ("i2c: imx-lpi2c: make controller available until the system
   enters suspend_noirq() and from resume_noirq().") reworked the patch with
   a similar approach. Updated commit body accordingly.

 drivers/i2c/busses/i2c-riic.c | 46 +++++++++++++++++++++++++++++------
 1 file changed, 39 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 3e8f126cb7f7..9e3595b3623e 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -670,12 +670,39 @@ static const struct riic_of_data riic_rz_t2h_info = {
 
 static int riic_i2c_suspend(struct device *dev)
 {
-	struct riic_dev *riic = dev_get_drvdata(dev);
-	int ret;
+	/*
+	 * Some I2C devices may need the I2C controller to remain active
+	 * during resume_noirq() or suspend_noirq(). If the controller is
+	 * autosuspended, there is no way to wake it up once runtime PM is
+	 * disabled (in suspend_late()).
+	 *
+	 * During system resume, the I2C controller will be available only
+	 * after runtime PM is re-enabled (in resume_early()). However, this
+	 * may be too late for some devices.
+	 *
+	 * Wake up the controller in the suspend() callback while runtime PM
+	 * is still enabled. The I2C controller will remain available until
+	 * the suspend_noirq() callback (pm_runtime_force_suspend()) is
+	 * called. During resume, the I2C controller can be restored by the
+	 * resume_noirq() callback (pm_runtime_force_resume()).
+	 *
+	 * Finally, the resume() callback re-enables autosuspend, ensuring
+	 * the I2C controller remains available until the system enters
+	 * suspend_noirq() and from resume_noirq().
+	 */
+	return pm_runtime_resume_and_get(dev);
+}
 
-	ret = pm_runtime_resume_and_get(dev);
-	if (ret)
-		return ret;
+static int riic_i2c_resume(struct device *dev)
+{
+	pm_runtime_put_autosuspend(dev);
+
+	return 0;
+}
+
+static int riic_i2c_suspend_noirq(struct device *dev)
+{
+	struct riic_dev *riic = dev_get_drvdata(dev);
 
 	i2c_mark_adapter_suspended(&riic->adapter);
 
@@ -683,12 +710,12 @@ static int riic_i2c_suspend(struct device *dev)
 	riic_clear_set_bit(riic, ICCR1_ICE, 0, RIIC_ICCR1);
 
 	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_sync(dev);
+	pm_runtime_force_suspend(dev);
 
 	return reset_control_assert(riic->rstc);
 }
 
-static int riic_i2c_resume(struct device *dev)
+static int riic_i2c_resume_noirq(struct device *dev)
 {
 	struct riic_dev *riic = dev_get_drvdata(dev);
 	int ret;
@@ -697,6 +724,10 @@ static int riic_i2c_resume(struct device *dev)
 	if (ret)
 		return ret;
 
+	ret = pm_runtime_force_resume(dev);
+	if (ret)
+		return ret;
+
 	ret = riic_init_hw(riic);
 	if (ret) {
 		/*
@@ -714,6 +745,7 @@ static int riic_i2c_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops riic_i2c_pm_ops = {
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(riic_i2c_suspend_noirq, riic_i2c_resume_noirq)
 	SYSTEM_SLEEP_PM_OPS(riic_i2c_suspend, riic_i2c_resume)
 };
 
-- 
2.43.0


