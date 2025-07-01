Return-Path: <linux-i2c+bounces-11716-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2152FAEECF0
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 05:16:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77A513E264C
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 03:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 845931E5205;
	Tue,  1 Jul 2025 03:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eVtHMsvI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010021.outbound.protection.outlook.com [52.101.84.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B50676034;
	Tue,  1 Jul 2025 03:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751339777; cv=fail; b=sLB0iVj6pJbHYV3Iv3D/2cXJhhiNhkIegZHVK2NNlG46ZIJxU+2xlTDocXC88+TsgUcswokF0fwok6izo6tLmaKzVpambSUrHbCYZgJ05m/BPZd+Q3Bahe2teW5rw/U3lTV8XdFv+rhSMhr4PkWIdOsc9WwIp0ZdV/tow5NqVFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751339777; c=relaxed/simple;
	bh=+itssrshjrhiaih4uXCupq1xd1q0/b1SI0NBTQcZKR4=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=B4iEIeUTWf6gaPp4OWgwjRpQ1f9/SK2EBkA/beu78Xg7Tqbb0paNiho1c9w4RUFbPer4ZYVIySemmMec9unURlbvZj7JESYWeUy+a4jOJm11UvvB5qZej/B22jxjQ1HeYAI5bV/U+UQCdXgifL4ALct4kNHFBB79MXSEbVrxSvY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eVtHMsvI; arc=fail smtp.client-ip=52.101.84.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BQanxnBpB6gLunlcOHQzp1tSZCgYIiI/aXWXxzU47PYeLM4ezncy3LN9WeGWptaeqrcb+7GOyhID/L5uWR0+hiGXHyc9xMaoy0mnC8JZKIp24MgqNnodjcHdQ2rfnaYauKaGoQU/COlVewrciNERFm8OHH8I4zEi8UOD4jXAGRks7QY5BKTVpDijFkov9s0FeNzTomIH1sN+vXg3MoXfOH8mgxU/+p/r1mUnpLeAUsXq2Baytj1Lep6/Oz8g01RuX+8BaCZdlBzlrlZJ0wGHS+vVV/bILV4dKM/kiCQ36lljY3WigLWntINCPyKfttL95UZJyISzMErdfGPGfr+jXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5puHWyZpEf6K8C1Rk9P0IpByLxsiHJgN5RWne+lKq54=;
 b=rS5DtQlXSI82yqcY2Bzn9iQJRr05KSu1Ciw7sO74d+Co+8cw1Vk2LbzD2DjPwfzFcXRnQlggmclJuzNwb/gtpPdpcOlS97ailUsodToadiusheEHfTXz4oT8YsFOgvTArdqAMVuYjyy84qo7x5TkEj6gHzB0IdYADlrwZTlptfp2wGxVGFpIkB2sTRnIEhwqhaoFOHkeJ39DBdkkRJ1Yb+aIGc+8DdbJWFib8q7THNZ6tFf8M+Mje50ZyCIL+ji+K4Q5yU6nkxc3VKtmS80X3My4jH1ZUCJtJHDTpk7TMhW2zsCEurrE5REUFuPyhSeGBL1cU5Mm23oyiHn7UfW7MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5puHWyZpEf6K8C1Rk9P0IpByLxsiHJgN5RWne+lKq54=;
 b=eVtHMsvIRNDmRqIKV7XZfUeCVBUd2FZT4q9MFGTjhtVGOMXWLZk69cxGkLXWRMPIr1S6l3zPxiWISgwrh5cJGA89t5K6loABdKNXJWOwqMz2Uk6An8/xhjMOnmFNRGQCV66y416vdB+SmJt1XGHLgickfKWQDYW7JUW40otu/zrEP+lgTqX6MZEzEHfiwBu0S13TJ7QXrBBDe3Uog1kBnuh0qZDzgpgkmuqKdb++bx22Wut4v0UJuP0aQygZ40iWRDSBg3/Mfqc4z2/h4reEHdvbqWKWQyaQgJqyMWZ9jTAl8HeIsJlNnjHCPi621sanXfKLWxILzwQFsQOKzxdwvQ==
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by GV1PR04MB10241.eurprd04.prod.outlook.com
 (2603:10a6:150:1a4::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.27; Tue, 1 Jul
 2025 03:16:09 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%5]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 03:16:08 +0000
From: Carlos Song <carlos.song@nxp.com>
To: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "rafael@kernel.org" <rafael@kernel.org>,
	"pavel@kernel.org" <pavel@kernel.org>, "len.brown@intel.com"
	<len.brown@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"dakr@kernel.org" <dakr@kernel.org>, Aisheng Dong <aisheng.dong@nxp.com>,
	Andi Shyti <andi.shyti@kernel.org>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>, Frank Li <frank.li@nxp.com>
CC: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bough Chen
	<haibo.chen@nxp.com>, Jun Li <jun.li@nxp.com>
Subject: Dead lock with clock global prepare_lock mutex and device's
 power.runtime_status
Thread-Topic: Dead lock with clock global prepare_lock mutex and device's
 power.runtime_status
Thread-Index: AdvqLTd7vQl9I6hQRtmdXcy3EGv5Dw==
Date: Tue, 1 Jul 2025 03:16:08 +0000
Message-ID:
 <VI2PR04MB11147CCEFE4204B852807AAF2E841A@VI2PR04MB11147.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI2PR04MB11147:EE_|GV1PR04MB10241:EE_
x-ms-office365-filtering-correlation-id: b4da4a89-8add-4c8b-9bae-08ddb84d9f78
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|19092799006|921020|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?JKIUVNHwfh852LiDyhJMTjw4FSTgWlKJxSXVf711Won9ZFx/m+JaCCYAxE5B?=
 =?us-ascii?Q?E/VjrMBqm+d/litispMMlo5n4eOiwlwygINSvWydkaT/0q0M9NL3u6dv+oCb?=
 =?us-ascii?Q?dR3K/cJYPa7uDkH3RysSF3g5dfrdxkDTSB16L9iL8mkHdorl9QAvjYzDI1Ei?=
 =?us-ascii?Q?fJLUf4e2sg6Zt6tXbZjg8S9SOELhvNvPu/hf60TFHone3GmPyNq/cs09iwPM?=
 =?us-ascii?Q?j2R4BRQDtpoFdq4TreRoZj0mVBR9ZjmMg3bDPLRYNjHpbDIcVOoPmmMRSO26?=
 =?us-ascii?Q?v5sKcgni0nkCqKzQEbqfjOpVk+WG5aiVr/xdmfGigbst5VP5Xzf2yZRnVSKX?=
 =?us-ascii?Q?RSWQ6aP5J+g+oyAJtk9wYHqctEa8AsOhD1MRuTR9ttSA6UMIOicb6Ec6HV1V?=
 =?us-ascii?Q?qU5+GctyIgWjeVpXzVK5U2sl+W0GNQlYY9EZjEfuwKtGurmPFz5xnkksyY6I?=
 =?us-ascii?Q?Bb7MVHLR5okM8CVZ4N6ZZWk0mz25PZztNQOh/PB5VmCls6KMQa4P3gF30tRi?=
 =?us-ascii?Q?5K4DHwhBEuGeOYuBMHCwF2UICjhLqdgWQwqNSWA1tm7g0NNUQGg3kVi6Y5Nj?=
 =?us-ascii?Q?LlbCWNdnbQBCbE47B6K22w59xD3zFTme7QFM0/r5LKtLe/xmQg+A0s7EcC7i?=
 =?us-ascii?Q?rcwWGwMW6w9h85Bo6/49f49fsakYfkJpzNrBknLWiJhQt9KU8w50JrGWjUVP?=
 =?us-ascii?Q?9oHZKPwdWs0AvJcsrkEMh6RGjxsGJZwr7w8TpIiwgZOAworYnLxLd1HqQm4+?=
 =?us-ascii?Q?b/BTd5k2RM+DzjYztVeRQLovJ9BFonqUuAyItHbijaApPS2Kg/l4GVPwyY5s?=
 =?us-ascii?Q?AN9WKcto7E+jsshRZDkC1gwG+yh3jo3RGCxNnKGdeOlZP5WnGun0G2SdLfZZ?=
 =?us-ascii?Q?mYtOanXCqaM4z0Ckw3ep7zeoUE80cKZ3IbIT6f1tIdC9XFj6SGVdOe21LGO7?=
 =?us-ascii?Q?lV2d5HEH0LY9JUUS3vNsZEmFfRlesVZ5dv+QzRNbVsNvuPBcO4/2fbRbGXNO?=
 =?us-ascii?Q?nvHediQG2Y+Tvyc+4clcD4UMbK9Yhd/StkpyfOZIwC2X163rIRLAiB7Zu5sC?=
 =?us-ascii?Q?CWUWa6/U7DxmyvKpOv2r7jtuKKsthpNzm9/8UM7RIefWmoW/IXxYsxa7Ib/B?=
 =?us-ascii?Q?CsvaOKgDFKKnBRkp/GTaXf254eDLE86m37cEL10RubfQiaQ3WjgMXGNZ8ovH?=
 =?us-ascii?Q?Bun97g9klrVXu1sVP55fLQBJl6+rsc7FecFM60MdAf40EpCDw6tdmiZRolsf?=
 =?us-ascii?Q?w7bSQWFmwHrDDKY18C66c7Eq+C3xGcbCCog/8Cu+P7q+I1ZWfyJTqPutQ8Fk?=
 =?us-ascii?Q?KDtQnevAhwk7Uvt0ZqeuQTCU9LDYLJFiFle0kTudHX5LW9H/JE3YupcL1zYJ?=
 =?us-ascii?Q?tpRetNTALlvvlliES1PK7BCCdw0CWWivn1jrMyVR12V+wUhuwNKoKqOaLIUV?=
 =?us-ascii?Q?InbAzdCZSQOu4AxYXuMHXwZPT5yBGWSrKkncCLT3j+yOoEYNxTkgwq25/AQf?=
 =?us-ascii?Q?N0hqw8twtkRZLw8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(19092799006)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?SLKKIhEke47UYxEIsYeP4WHz5T5I7A2jvuSVqFoWgmOO6CWoyM+1Dcpiqt6/?=
 =?us-ascii?Q?kNl4J3O1FJHWlpEsFJTK5UGbENUx0oxGcEdFTRBU5xHcrRFPS6NJLMfWq+Dv?=
 =?us-ascii?Q?7+pu+n5xVH4AQrZ7Vws5S9wE+zjwsf5Q9dMvHpcjC/EGKiSABfSOATFsgxG2?=
 =?us-ascii?Q?JlYARY01t59z0kIsAcc8rla+Tu1c+oALdvo3m2/0YQw+gQwKYdaSVyBO3t00?=
 =?us-ascii?Q?bD3a8eeyiVOCHHLwHKA6Q7+b8EjC1AMWEnz7V/FLmy9bSTrbbCeX8Fydd6Sl?=
 =?us-ascii?Q?Z/t/OsyHmvpdefOuedEfRPr/+x8fZnscIx86qe4958vuqRwOPIJZpfkyk7Gf?=
 =?us-ascii?Q?1fmCw9X6jMUJMMyCPTc3ONd2d/mEatBZggA2fBSHT3lrp65raTTzXKe4rRb9?=
 =?us-ascii?Q?iMFUZBwOpG5UPxGZW1xSwKJOIz9Xbzq8Wc4wFahi3bR5Kya/xF23kNtfrCtH?=
 =?us-ascii?Q?Res2dYuu3Dk0K98oWqcqkBrHXLN5lzG/3y6+gfArDpLK5NwlDd7DRA7ZmZNP?=
 =?us-ascii?Q?o/UCAKGCHhoggSUCpGgthdJ5xalBNENOarsNJE1bgDWl40WKKf+QtV3GetP+?=
 =?us-ascii?Q?NibqlRj/3gKW8qHlyyxrTdgqz6WXYDuFSu6GY+jUeS6XqNjpkpUswg5w4Con?=
 =?us-ascii?Q?TcBmjJFIvD+wuUUew1Z8z+qjUeRmp/GgHQv6PrzFghFV9DKBaSnZRXI4pUEN?=
 =?us-ascii?Q?JbqhahCIf/LmHHUdTMKxq77KK0nazgDz2dU/FDwNC/jeybE9qiwOiQZheuxd?=
 =?us-ascii?Q?HOSqIEEngOcTyNc+P6Ho+2PsIotfIYt+tdKzLhcKctJ5n9Rx4AckRE78LLsv?=
 =?us-ascii?Q?4l8P5ExpZKSIfm6JeWxPAeJYz3bBmGKuVnSaZOQT3Z0Vk9WaqGeKUOPE7Xjo?=
 =?us-ascii?Q?m6ijEVzxNMiIbJxyy6YvD79K0CdSaQXGtxHs8ytMRx83cvXNZV8uqn/CMb1e?=
 =?us-ascii?Q?zLXSR3F8hrRHQOLx4GhkdNkGPsVEJSqZrbY6jdAQnKpCk0LuLzIEiaDJj/MY?=
 =?us-ascii?Q?1JM/yhUnpUK/0Vh/b3L1zkY5xaAG9BZ5knfH82ElJyXPYxXOjhkctYOL5IT4?=
 =?us-ascii?Q?/0ovFp/1wxs8A/hyIH4TThNN7ftM47xGwnN9bcaxoN0HZGz+x9VtsZzuWl78?=
 =?us-ascii?Q?w662ZZz1y0Vgh6xWZgdcPBkdCnuZERmiDs/aA8Oj/6XFtS6cwP9+l9D2dB6W?=
 =?us-ascii?Q?IvEi59UcNr7Y5FDjmgGP/KiMzzdWd2+kTBTYzZEum+6hP0M4AFTV9hbKab5U?=
 =?us-ascii?Q?MJwSHdtTelK8jPySzVQ2IDWS5CEyxMBHuFXOPox2Hp+FD2/gIXdkPm2bpUp3?=
 =?us-ascii?Q?uIcc79hI5pxpqtoWDKy6Z4Hha1GmeepvFDVhoXkkDqtlGKB41v45TRnf89LJ?=
 =?us-ascii?Q?ty8OpKvXl4Qd7Vw1D0NPZHeQ2MDsMMrrT/06tVoqauyo+f40vnGz6YgGNxF1?=
 =?us-ascii?Q?wYQfNY7j1bnedYo38DB1RtJQqMrny6iJ/qI54IK81ab5PNDa/XG5wxernWQq?=
 =?us-ascii?Q?wQGhDuGz0Nkb5i2CNKDAne1TVrp/ylQLBqsB7GumVxSBviBwfds0LCSl7ZkZ?=
 =?us-ascii?Q?LUrvvWhihNY8hDd2b7U=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4da4a89-8add-4c8b-9bae-08ddb84d9f78
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2025 03:16:08.3661
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QHozdnSHqBDofYFwkQM/psgtZah+6iOttMiBWjK6Rvo30FQwhieYyoLk/NVcoimrfLf7Il5KCuDM8IyCBA8+BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10241

Hi, All:

We met the dead lock issue recently and think it should be common issue and=
 not sure how to fix it.

We use gpio-gate-clock clock provider (drivers/clk/clk-gpio.c), gpio is one=
 of i2c gpio expander (drivers/gpio/gpio-pcf857x.c). Our i2c driver enable =
run time pm (drivers/i2c/busses/i2c-imx-lpi2c.c [1]). System random blocked=
 when at reboot.

The dead lock happen as below call stacks

Task 117                                                Task 120

schedule()
clk_prepare_lock()--> wait prepare_lock(mutex_lock)     schedule() wait for=
 power.runtime_status exit RPM_SUSPENDING
                           ^^^^ A                       ^^^^ B
clk_bulk_unprepare()                                    rpm_resume()
lpi2c_runtime_suspend()                                 pm_runtime_resume_a=
nd_get()
...                                                     lpi2c_imx_xfer()
                                                        ...
rpm_suspend() set RPM_SUSPENDING                        pcf857x_set();
                           ^^^^ B                       ...
                                                        clk_prepare_lock() =
--> hold prepare_lock
                                                        ^^^^ A
                                                        ...


Task 117 set power.runtime_status to RPM_SUSPENDING (A) and wait for task 1=
20 release clock's global prepare mutex (B).

Task 120 hold global prepare mutex (B) and wait for power.runtime_status fi=
nish suspend (A).

The root cause is that the scope of global prepare_lock is too big. gpio-ga=
te-clock and lpi2c clock are totally independent.

Although it may not happen at downstream case because [1], there are still =
have other i2c bus and spi bus, and other bus drivers. clock unprepare is q=
uite common in runtime suspend functions.

[1] upstream driver have not use clk_unprepare in suspend functions.

The full log as below:

INFO: task kworker/2:3:117(T117) is blocked on a mutex likely owned by task=
 kworker/u16:5:120(T120).

[    6.955479][   T73] imx-lpi2c 42530000.i2c: lpi2c_runtime_suspend2
[    6.957437][  T120] imx6q-pcie 4c300000.pcie: config reg[1] 0x60100000 =
=3D=3D cpu 0x60100000
[    6.957437][  T120] ; no fixup was ever needed for this devicetree
[    6.964257][  T118] platform regulatory.0: Falling back to sysfs fallbac=
k for: regulatory.db
[    6.973579][  T120] imx-lpi2c 42530000.i2c: lpi2c_runtime_resume1
[    7.027143][  T120] imx-lpi2c 42530000.i2c: lpi2c_runtime_resume2 0
[    7.033984][  T120] -----------pcf857x_set in
[    7.038373][  T120] -----------------pcf857x_output in
[    7.043527][  T120] ----------------- gpio->write in
[    7.048520][  T117] imx-lpi2c 42530000.i2c: lpi2c_runtime_suspend
[    7.054774][  T120] i2c i2c-2: msg[0] w0/r1 0, data[0] is 7f
[    7.060448][  T120] i2c i2c-2: 42530000.i2c: pm_runtime_resume_and_get
[   67.030316][  T118] cfg80211: failed to load regulatory.db
[  244.059129][   T40] INFO: task kworker/2:3:117 blocked for more than 121=
 seconds.
[  244.066619][   T40]       Not tainted 6.15.0-rc2-next-20250417-06621-g7c=
d761409c73-dirty #7
[  244.075010][   T40] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" d=
isables this message.
[  244.083572][   T40] task:kworker/2:3     state:D stack:0     pid:117   t=
gid:117   ppid:2      task_flags:0x4208060 flags:0x00000008
[  244.095438][   T40] Workqueue: pm pm_runtime_work
[  244.100157][   T40] Call trace:
[  244.103302][   T40]  __switch_to+0xf8/0x1a0 (T)
[  244.107882][   T40]  __schedule+0x418/0xfd8
[  244.112080][   T40]  schedule+0x4c/0x164
[  244.116055][   T40]  schedule_preempt_disabled+0x24/0x40
[  244.121392][   T40]  __mutex_lock+0x1d4/0x580
[  244.125798][   T40]  mutex_lock_nested+0x24/0x30
[  244.130436][   T40]  clk_prepare_lock+0x4c/0xa8
[  244.135018][   T40]  clk_unprepare+0x24/0x44
[  244.139298][   T40]  clk_bulk_unprepare+0x38/0x60
[  244.144048][   T40]  lpi2c_runtime_suspend+0x64/0x9c
[  244.149021][   T40]  pm_generic_runtime_suspend+0x2c/0x44
[  244.154475][   T40]  __rpm_callback+0x48/0x1ec
[  244.158935][   T40]  rpm_callback+0x74/0x80
[  244.163167][   T40]  rpm_suspend+0x104/0x668
[  244.167446][   T40]  pm_runtime_work+0xc8/0xcc
[  244.171939][   T40]  process_one_work+0x214/0x62c
[  244.176650][   T40]  worker_thread+0x1ac/0x34c
[  244.181144][   T40]  kthread+0x144/0x220
[  244.185082][   T40]  ret_from_fork+0x10/0x20
[  244.189435][   T40] INFO: task kworker/2:3:117 is blocked on a mutex lik=
ely owned by task kworker/u16:5:120.
[  244.199300][   T40] task:kworker/u16:5   state:D stack:0     pid:120   t=
gid:120   ppid:2      task_flags:0x4208060 flags:0x00000008
[  244.211164][   T40] Workqueue: async async_run_entry_fn
[  244.216404][   T40] Call trace:
[  244.219587][   T40]  __switch_to+0xf8/0x1a0 (T)
[  244.224127][   T40]  __schedule+0x418/0xfd8
[  244.228358][   T40]  schedule+0x4c/0x164
[  244.232298][   T40]  rpm_resume+0x1c8/0x734
[  244.236531][   T40]  __pm_runtime_resume+0x50/0x98
[  244.241338][   T40]  lpi2c_imx_xfer+0x58/0xe60
[  244.245829][   T40]  __i2c_transfer+0x1c4/0x828
[  244.250377][   T40]  i2c_smbus_xfer_emulated+0x1b8/0x708
[  244.255735][   T40]  __i2c_smbus_xfer+0x1a0/0x6f0
[  244.260447][   T40]  i2c_smbus_xfer+0x98/0x120
[  244.264939][   T40]  i2c_smbus_write_byte+0x2c/0x3c
[  244.269825][   T40]  i2c_write_le8+0x10/0x20
[  244.274152][   T40]  pcf857x_output+0x7c/0xc0
[  244.278527][   T40]  pcf857x_set+0x3c/0x5c
[  244.282672][   T40]  gpiochip_set+0x68/0xc0
[  244.286864][   T40]  gpiod_set_raw_value_commit+0xd4/0x1a0
[  244.292404][   T40]  gpiod_set_value_nocheck+0x34/0x60
[  244.297549][   T40]  gpiod_set_value_cansleep+0x24/0x60
[  244.302821][   T40]  clk_sleeping_gpio_gate_prepare+0x18/0x28
[  244.308582][   T40]  clk_core_prepare+0xbc/0x2a8
[  244.313247][   T40]  clk_prepare+0x28/0x44
[  244.317361][   T40]  clk_bulk_prepare+0x34/0xa0
[  244.321940][   T40]  imx_pcie_host_init+0xe0/0x434
[  244.326747][   T40]  dw_pcie_host_init+0x1b8/0x758
[  244.331587][   T40]  imx_pcie_probe+0x380/0x8e0
[  244.336133][   T40]  platform_probe+0x68/0xd8
[  244.340539][   T40]  really_probe+0xbc/0x2bc
[  244.344817][   T40]  __driver_probe_device+0x78/0x120
[  244.349916][   T40]  driver_probe_device+0x3c/0x160
[  244.354801][   T40]  __device_attach_driver+0xb8/0x140
[  244.359986][   T40]  bus_for_each_drv+0x88/0xe8
[  244.364534][   T40]  __device_attach_async_helper+0xb8/0xdc
[  244.370161][   T40]  async_run_entry_fn+0x34/0xe0
[  244.374882][   T40]  process_one_work+0x214/0x62c
[  244.379634][   T40]  worker_thread+0x1ac/0x34c
[  244.384102][   T40]  kthread+0x144/0x220
[  244.388076][   T40]  ret_from_fork+0x10/0x20

Best Regard
Carlos Song


