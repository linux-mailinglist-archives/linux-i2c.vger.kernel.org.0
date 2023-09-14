Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 063597A04CB
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Sep 2023 15:03:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238557AbjINND0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Sep 2023 09:03:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231243AbjINNDZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 Sep 2023 09:03:25 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2130.outbound.protection.outlook.com [40.107.114.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71E4C1FD4;
        Thu, 14 Sep 2023 06:03:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mpool05ZV4XpzuinYb9VuK+2LZP4lCIgT4LL5uzjFRmDkw6+hDtLS8JAaTXzwvh9C65/0OofnPGtxf3ccDnuI2olEKQV+FUcenHyXWSOAt54ym2yN3dpSpkFqmMPA+t7v7+hNw+4VuTKVGvBEiKRN62W+d2auav4SPizqh845OzhJBIp7xfZhbM+oUpiRW+cn5TZRlH0iTDwcz0sq95FmD7VHY0cthqduoXwH7FJMxPE++QXzkEgXURtbwY1edNSGziT8tja7jJTcTzMuL8u7R3DvV90BHJklNQEHbdgFTz2434/EmP+BM+PdUzfYmgAxyQ/raUgtyil/antt/udgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xiaBR6Eg6CPv0YvT56Lq9FS7IeX+q0bRikecp4wv2PQ=;
 b=C56VPEbzOx047QOQBxxQ30K6GCoDYmJllNoViONzBtKrv9DenfakpVJClxDXepRl0aryEiG0eIFLY6/L8OQeeU9A6X6+bJmOsEb27egGaDWSxEprfPRbRd0zGQiIL0ahyfSfdFic3Ra/EP/mcBngE/px9iDGIdJoXHyBGaIFFgPVmMIUIY8sv26Uc+fm/0vGqgi7a4Lscd15w/qljx6Z+Xkeam55XMATkdkE8+riu9vp5qy1ZWlhor8rR4V8HEmVif7Yb0zOc3jnfIhnQKeX/z6MgyX5KWBieVlaXKeUodU42icfLivQY6kuTJbIBjasWC1mQVbtcLBszPMvilnzcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xiaBR6Eg6CPv0YvT56Lq9FS7IeX+q0bRikecp4wv2PQ=;
 b=BzJS5fFrE6CMnJ0WWvFGp7fLeJoVXntb3fjqAxFWohHFll7iCiwJSTA3Wqyp9GTHSuR7tECHJMvCJqsi6N1MnezqaY0R1WF4VTc8qFpQhWI9dl3xBMmZDZs/JJBVqNAgPrvuw9jdjrgpUe4YEF7pvn2uyOUpRpzGMIDU1mwuPmI=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYCPR01MB11451.jpnprd01.prod.outlook.com
 (2603:1096:400:37d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Thu, 14 Sep
 2023 13:03:18 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::e5cd:66a0:248f:1d30]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::e5cd:66a0:248f:1d30%4]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 13:03:18 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 0/2] i2c: rcar: add support for Gen4 devices
Thread-Topic: [PATCH 0/2] i2c: rcar: add support for Gen4 devices
Thread-Index: AQHZ5oF5i48p1M7vK0upwV1KcaqiH7AaSXiw
Date:   Thu, 14 Sep 2023 13:03:18 +0000
Message-ID: <TYBPR01MB5341A56291AFCB54E4918167D8F7A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20230913203242.31505-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20230913203242.31505-1-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TYCPR01MB11451:EE_
x-ms-office365-filtering-correlation-id: bd98fe0a-bfd3-4ef9-65bc-08dbb522f709
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x/PzHP82FfZUysA2KP3SHV+fLbD77khBCOzN0wyBqiGPFdlKIEqwfl6DqWDqOZGYwHAyHdvFKTRGqsdOLL5HgG9Lfq51QF5jxyp+SWxDyXy/dYdOLKk6mCuHSRAJSBR8/RObSzGbTUSLsGBi2LeuEUMrd+l2bBkJVzq+BetFDDvx273/v2TTbO2KZ6eT53nPqTO0A1Zscp2wICsd1JEoV+K9bgXlw3phe6BsXSD64Vo85Ki2YdTl8D5Etp6GLUvT97sioJC/5U34UjFlVF84h6CcIJ5vHigoEqFYepSjH6Mm4p5xMYn1UAoRlfkSJHhPZUW1DZfeG1xMa/HJ8A/gP3bjceWVAHIp1Vx617+pwac1c4RgNEbaE6D7DPisWqoy//pbEm64GF0rp7Fg+6IHD8NswWAR9rOmnOjPT0q2Qsk/UOC3+gWgTHY2nIQr6jGed0kx+yWXWxOeNoFvFX87URtv1NjlfxV0uiC2Wm+KNb6t6PxfaLOHc02TJIeazXtzhYMwmZ8g1A8rt1qm/xKglRH0bCTWAe3VR1i9n4WvrTEUxtYJSBqcxXK8MttD9uzCmP+h81B94XaIRHPXeNxnE3bcMK0PCYCF/2sVrQ4czDuGJJfEKbF0pXr/Xm43x37E
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(346002)(376002)(366004)(396003)(1800799009)(186009)(451199024)(64756008)(316002)(76116006)(66556008)(54906003)(66446008)(66476007)(41300700001)(66946007)(478600001)(55016003)(122000001)(38100700002)(38070700005)(33656002)(30864003)(86362001)(2906002)(5660300002)(52536014)(8936002)(8676002)(4326008)(83380400001)(7696005)(6506007)(71200400001)(9686003)(579004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OweHSxszXib9m8jQhMwZDh3X3+pgCcv7NKI/BJn3t2zRQf8sh0X2dg71xSt7?=
 =?us-ascii?Q?ObZ6hFGd7PYEXg4ZK18KXz8b7HpaMXtxHvBVQ+IzBWdHd52AUriBQV3rGx8u?=
 =?us-ascii?Q?KsM46Np7Lmo5rdULM67Q59pSNl+T1bOzESTEgvnmUbv08Bq1ilp3JRGAhJ0b?=
 =?us-ascii?Q?e5ygET0XRNZdmf0X+8LdEGgBEn87h+Zg/apyeJq9R6yojiL8zbnaAmoCksxh?=
 =?us-ascii?Q?Ng1yjnJqe29JZGaHvKoSh0RxP2Exrf8yli/zWETvoXzibCS84A8YBXEG1p0/?=
 =?us-ascii?Q?QAXq1oxA7/7GrMcxekdAULyj5YuKo1uVWVFb+iBshFBv58EAIV2FsknpXb8O?=
 =?us-ascii?Q?o8NT4NioT8476SV+QTHGhTa9FX/I1vmwRTu5kCGBKCayfu1ztbzxvlozza8x?=
 =?us-ascii?Q?5/LxTMZfbZlZc41TVtMwGyDVLTlADNPDa2PTEQMmJemwKUTlims1R97nrodG?=
 =?us-ascii?Q?PUStgjp3hvN0WxN+4JL3bKNY9ay3Rvs8qrnNu71g3I+mPoLqdIPtzs/wfVQz?=
 =?us-ascii?Q?ZUQvS09ih6NDJS6JR7vWdMGJQkkz3UqOAGoLBxm9cCFchO6Ya/86e21BoDRc?=
 =?us-ascii?Q?xR0nnNo6MR9kFtpu9tcR3uRVPrWVzJEv0shcA7s49BtShM2JqKn3QLYzI/Vy?=
 =?us-ascii?Q?lnJX07HYRX8sdGaU1D1ufhsYlJB3L5eJ/eCYw2wKLewVEROtuim8V/mZ5haP?=
 =?us-ascii?Q?ZugbrJOfF0jvdrAjm6X1S4HnHR05mP7Y6aETwa3HiMT8LE4EBH0X0nOJAMot?=
 =?us-ascii?Q?TUWzmk6Fsd5dXdhC9nQ0XbdZ6leSHuKU9LNxJa2tdYzz5sKOMPBtmtKuWVBd?=
 =?us-ascii?Q?0zohFmYjNzCBYVbd7nFGfR+P3j1iosH4kEh2y+4AoBVYrjizomCfq4ZV7E6E?=
 =?us-ascii?Q?h1eJGYdjKEWYrAd9RbbFMI1HNr6LFO3k3oY3RyaJuc7G6osV2qkmTGdraU9k?=
 =?us-ascii?Q?lh85SEhDjXpR1vEliOFtuiGRxDveMXL9REUQf6vpnZJW+sCbLoVnd+vme7yi?=
 =?us-ascii?Q?+7SviOGRNWyojrmrhiQXaBg2ivBqKTCoNX9ZT4gM89IEU2OsPD1dfNTWJM5R?=
 =?us-ascii?Q?9+RTjrD+FI1CAOfpEj5A01TOdgi8fgGFgasms81hogSslWumVSrmA14JlMWl?=
 =?us-ascii?Q?EEbaoPjL8WHcz1w3ZT/OBFHt/ebI3vQ3T3ZzdXlCPhDmz/Mr9ge+GXAkCQ+Y?=
 =?us-ascii?Q?dIz5qWsA/+Da66L6/y9vxOXqjb7bkkKKd7Vlj8/F/1H5hHt5nX5BcAVq4Aoz?=
 =?us-ascii?Q?z77qlLaWc6gnedZYzPfdx/EPGCYTW6QZFV/M7BcSWayq1jSkfLWCa1s7cwwD?=
 =?us-ascii?Q?vTr276V+Rfk8jpWNjSR9sFo1S5znDLfuy3481u5SuJEnQJskqAxnrlV1Z3jK?=
 =?us-ascii?Q?Xih0HFZjPnnjBtqPLWvQhYWHTcePnYa0HiphQIrjWZ6su0YVDxOW5W9Li5Ot?=
 =?us-ascii?Q?F39b855ghprA1WUaWH1D//rHwVeJfvth3IBF84snOooQ0y44HO+kSjygwyOP?=
 =?us-ascii?Q?ZTfavcKALJGXQEYHC9qFncWQmQ4BStbkcxdb3fRttLkKmZIsOSnmV1Atj6jm?=
 =?us-ascii?Q?UhnQ7fRe4xxuMuqSCN8sugM/YoTWVPqr0mVR1ZAHdeLgSBOKkVv96pOrtCEr?=
 =?us-ascii?Q?5Mx9TQcDlG3Mlna4OtsRtjrIiyMZTVJHtG1irBCmKlQciFzD2rndlAQ8gybu?=
 =?us-ascii?Q?sGrEVg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd98fe0a-bfd3-4ef9-65bc-08dbb522f709
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2023 13:03:18.0601
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FdevvKELiPgocaEp3klofdrE7rrJmw7IihwSEK0eyGvyeaLQcLoQHrDpzbGqJ9UZ8zksKCmMT89Prl7noBvZ7moRQ8XhT1NMNAJnc8vX0ufKbjY8PfJeGG2x6KUGPB1v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11451
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Wolfram-san,

> From: Wolfram Sang, Sent: Thursday, September 14, 2023 5:33 AM
>=20
> The newest generation of Renesas R-Car SoCs support FastMode+. This
> series enables the driver to use it. It is based on the series "i2c:
> clock calculation cleanups for Renesas devices" and "i2c: rcar: improve
> Gen3 support". A branch for testing can be found here:
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/i2c/f=
mplus-experimental
>=20
> Shimoda-san: Maybe the BSP team and/or the test team might want to try
> this branch?

I tested the branch on the Spider, and then the i2c cannot be probed with t=
he following errors:
-----
# dmesg | grep i2c
[    1.528773] i2c_dev: i2c /dev entries driver
[    1.533572] i2c-rcar e6500000.i2c: clk 395647/400000(133333333), round 4=
6, CDF: 6 SMD 20 SCL gran 27
[    1.554646] i2c-rcar e6500000.i2c: request_channel failed for tx (-517)
[    1.561487] i2c-rcar e6500000.i2c: request_channel failed for tx (-517)
[    1.568133] i2c-rcar e6500000.i2c: request_channel failed for rx (-517)
[    1.575263] i2c-rcar e6500000.i2c: probed
[    1.579706] i2c-rcar e66d8000.i2c: clk 395647/400000(133333333), round 4=
6, CDF: 6 SMD 20 SCL gran 27
[    1.590018] i2c-rcar e66d8000.i2c: probed
[    1.757721] i2c-rcar e6500000.i2c: request_channel failed for tx (-517)
[    1.764429] i2c-rcar e6500000.i2c: request_channel failed for rx (-517)
[    1.771395] i2c-rcar e6500000.i2c: request_channel failed for tx (-517)
[    1.778425] i2c-rcar e6500000.i2c: request_channel failed for tx (-517)
[    5.963936] i2c-rcar e6500000.i2c: request_channel failed for tx (-517)
[    5.984025] i2c-rcar e6500000.i2c: request_channel failed for rx (-517)
-----

I checked that the v6.6-rc1 (commit 0bb80ecc33a8) could worked correctly.
JFYI, I pasted whole log at the end of this email. Should I do git bisect t=
o find
a bad commit on the branch?

-----
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x412fd050]
[    0.000000] Linux version 6.6.0-rc1-arm64-renesas+ (shimoda@mzsrz-15sj) =
(aarch64-linux-gcc (GCC) 11.1.0, GNU ld (GNU Binutils) 2.36.1) #49 SMP PREE=
MPT Thu Sep 14 21:52:15 JST 2023
[    0.000000] Machine model: Renesas Spider CPU and Breakout boards based =
on r8a779f0
[    0.000000] printk: debug: ignoring loglevel setting.
[    0.000000] efi: UEFI not found.
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000048000000-0x00000000ffffffff]
[    0.000000]   DMA32    empty
[    0.000000]   Normal   [mem 0x0000000100000000-0x00000004ffffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000048000000-0x000000009fffffff]
[    0.000000]   node   0: [mem 0x0000000480000000-0x00000004ffffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000048000000-0x00000004fffff=
fff]
[    0.000000] cma: Reserved 128 MiB at 0x0000000098000000 on node -1
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.1 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: Trusted OS resident on physical CPU 0x0
[    0.000000] psci: SMC Calling Convention v1.2
[    0.000000] percpu: Embedded 28 pages/cpu s77800 r8192 d28696 u114688
[    0.000000] pcpu-alloc: s77800 r8192 d28696 u114688 alloc=3D28*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3 [0] 4 [0] 5 [0] 6 [0] 7=
=20
[    0.000000] Detected VIPT I-cache on CPU0
[    0.000000] CPU features: detected: GIC system register CPU interface
[    0.000000] CPU features: detected: Qualcomm erratum 1009, or ARM erratu=
m 1286807, 2441009
[    0.000000] CPU features: detected: ARM errata 1165522, 1319367, or 1530=
923
[    0.000000] alternatives: applying boot alternatives
[    0.000000] Kernel command line: ignore_loglevel consoleblank=3D0 rw roo=
t=3D/dev/nfs nfsroot=3D192.168.5.15:/home/shimoda/development/rootfs/rootfs=
/yocto-sdk-3-11,vers=3D3 ip=3D192.168.5.5::192.168.5.15:::tsn0 pci=3Dpcie_b=
us_perf
[    0.000000] Dentry cache hash table entries: 524288 (order: 10, 4194304 =
bytes, linear)
[    0.000000] Inode-cache hash table entries: 262144 (order: 9, 2097152 by=
tes, linear)
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 87091=
2
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] software IO TLB: area num 8.
[    0.000000] software IO TLB: mapped [mem 0x0000000094000000-0x0000000098=
000000] (64MB)
[    0.000000] Memory: 3243064K/3538944K available (14336K kernel code, 231=
8K rwdata, 5808K rodata, 5952K init, 460K bss, 164808K reserved, 131072K cm=
a-reserved)
[    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D8, N=
odes=3D1
[    0.000000] ftrace: allocating 50375 entries in 197 pages
[    0.000000] ftrace: allocated 197 pages with 4 groups
[    0.000000] trace event string verifier disabled
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu: 	RCU event tracing is enabled.
[    0.000000] 	Trampoline variant of Tasks RCU enabled.
[    0.000000] 	Rude variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 2=
5 jiffies.
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] GICv3: 960 SPIs implemented
[    0.000000] GICv3: 0 Extended SPIs implemented
[    0.000000] Root IRQ handler: gic_handle_irq
[    0.000000] GICv3: GICv3 features: 16 PPIs
[    0.000000] GICv3: CPU0: found redistributor 0 region 0:0x00000000f10600=
00
[    0.000000] ITS: No ITS available, not enabling LPIs
[    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contentio=
n.
[    0.000000] arch_timer: cp15 timer(s) running at 16.66MHz (virt).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cy=
cles: 0x3d80623e0, max_idle_ns: 440795202120 ns
[    0.000001] sched_clock: 56 bits at 17MHz, resolution 60ns, wraps every =
2199023255541ns
[    0.000296] Console: colour dummy device 80x25
[    0.000312] printk: console [tty0] enabled
[    0.000820] Calibrating delay loop (skipped), value calculated using tim=
er frequency.. 33.33 BogoMIPS (lpj=3D66666)
[    0.000848] pid_max: default: 32768 minimum: 301
[    0.001067] Mount-cache hash table entries: 8192 (order: 4, 65536 bytes,=
 linear)
[    0.001103] Mountpoint-cache hash table entries: 8192 (order: 4, 65536 b=
ytes, linear)
[    0.003459] RCU Tasks: Setting shift to 3 and lim to 1 rcu_task_cb_adjus=
t=3D1.
[    0.003587] RCU Tasks Rude: Setting shift to 3 and lim to 1 rcu_task_cb_=
adjust=3D1.
[    0.003861] rcu: Hierarchical SRCU implementation.
[    0.003881] rcu: 	Max phase no-delay instances is 1000.
[    0.004711] Detected Renesas R-Car Gen4 r8a779f0 ES1.2
[    0.005337] EFI services will not be available.
[    0.005930] smp: Bringing up secondary CPUs ...
[    0.006660] Detected VIPT I-cache on CPU1
[    0.006793] GICv3: CPU1: found redistributor 100 region 0:0x00000000f108=
0000
[    0.006855] CPU1: Booted secondary processor 0x0000000100 [0x412fd050]
[    0.007770] Detected VIPT I-cache on CPU2
[    0.007895] GICv3: CPU2: found redistributor 10000 region 0:0x00000000f1=
0a0000
[    0.007954] CPU2: Booted secondary processor 0x0000010000 [0x412fd050]
[    0.008762] Detected VIPT I-cache on CPU3
[    0.008805] GICv3: CPU3: found redistributor 10100 region 0:0x00000000f1=
0c0000
[    0.008829] CPU3: Booted secondary processor 0x0000010100 [0x412fd050]
[    0.009485] Detected VIPT I-cache on CPU4
[    0.009558] GICv3: CPU4: found redistributor 20000 region 0:0x00000000f1=
0e0000
[    0.009594] CPU4: Booted secondary processor 0x0000020000 [0x412fd050]
[    0.010264] Detected VIPT I-cache on CPU5
[    0.010311] GICv3: CPU5: found redistributor 20100 region 0:0x00000000f1=
100000
[    0.010335] CPU5: Booted secondary processor 0x0000020100 [0x412fd050]
[    0.011010] Detected VIPT I-cache on CPU6
[    0.011088] GICv3: CPU6: found redistributor 30000 region 0:0x00000000f1=
120000
[    0.011124] CPU6: Booted secondary processor 0x0000030000 [0x412fd050]
[    0.011778] Detected VIPT I-cache on CPU7
[    0.011828] GICv3: CPU7: found redistributor 30100 region 0:0x00000000f1=
140000
[    0.011852] CPU7: Booted secondary processor 0x0000030100 [0x412fd050]
[    0.011969] smp: Brought up 1 node, 8 CPUs
[    0.012235] SMP: Total of 8 processors activated.
[    0.012249] CPU features: detected: 32-bit EL0 Support
[    0.012260] CPU features: detected: 32-bit EL1 Support
[    0.012273] CPU features: detected: Data cache clean to the PoU not requ=
ired for I/D coherence
[    0.012289] CPU features: detected: Common not Private translations
[    0.012301] CPU features: detected: CRC32 instructions
[    0.012313] CPU features: detected: RCpc load-acquire (LDAPR)
[    0.012326] CPU features: detected: Privileged Access Never
[    0.012337] CPU features: detected: RAS Extension Support
[    0.012351] CPU features: detected: Speculative Store Bypassing Safe (SS=
BS)
[    0.012472] CPU: All CPU(s) started at EL1
[    0.012500] alternatives: applying system-wide alternatives
[    0.015615] devtmpfs: initialized
[    0.019691] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f, max_idle_ns: 7645041785100000 ns
[    0.019756] futex hash table entries: 2048 (order: 5, 131072 bytes, line=
ar)
[    0.022839] pinctrl core: initialized pinctrl subsystem
[    0.023610] DMI not present or invalid.
[    0.024224] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.025533] DMA: preallocated 512 KiB GFP_KERNEL pool for atomic allocat=
ions
[    0.025944] DMA: preallocated 512 KiB GFP_KERNEL|GFP_DMA pool for atomic=
 allocations
[    0.026185] DMA: preallocated 512 KiB GFP_KERNEL|GFP_DMA32 pool for atom=
ic allocations
[    0.026315] audit: initializing netlink subsys (disabled)
[    0.026563] audit: type=3D2000 audit(0.024:1): state=3Dinitialized audit=
_enabled=3D0 res=3D1
[    0.027122] thermal_sys: Registered thermal governor 'step_wise'
[    0.027196] cpuidle: using governor menu
[    0.027414] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers=
.
[    0.027648] ASID allocator initialised with 65536 entries
[    0.030184] platform soc: Fixed dependency cycle(s) with /soc/interrupt-=
controller@f1000000
[    0.030623] platform e6050000.pinctrl: Fixed dependency cycle(s) with /s=
oc/pinctrl@e6050000/scif_clk
[    0.031014] sh-pfc e6050000.pinctrl: r8a779f0_pfc support registered
[    0.036223] Modules: 25504 pages in range for non-PLT usage
[    0.036235] Modules: 517024 pages in range for PLT usage
[    0.038288] HugeTLB: registered 1.00 GiB page size, pre-allocated 0 page=
s
[    0.038335] HugeTLB: 0 KiB vmemmap can be freed for a 1.00 GiB page
[    0.038350] HugeTLB: registered 32.0 MiB page size, pre-allocated 0 page=
s
[    0.038362] HugeTLB: 0 KiB vmemmap can be freed for a 32.0 MiB page
[    0.038375] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 page=
s
[    0.038388] HugeTLB: 0 KiB vmemmap can be freed for a 2.00 MiB page
[    0.038401] HugeTLB: registered 64.0 KiB page size, pre-allocated 0 page=
s
[    0.038413] HugeTLB: 0 KiB vmemmap can be freed for a 64.0 KiB page
[    0.041957] iommu: Default domain type: Translated
[    0.042002] iommu: DMA domain TLB invalidation policy: strict mode
[    0.042359] SCSI subsystem initialized
[    0.042558] libata version 3.00 loaded.
[    0.042762] usbcore: registered new interface driver usbfs
[    0.042812] usbcore: registered new interface driver hub
[    0.042870] usbcore: registered new device driver usb
[    0.043572] mc: Linux media interface: v0.10
[    0.043650] videodev: Linux video capture interface: v2.00
[    0.043716] pps_core: LinuxPPS API ver. 1 registered
[    0.043730] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo =
Giometti <giometti@linux.it>
[    0.043755] PTP clock support registered
[    0.044585] Advanced Linux Sound Architecture Driver Initialized.
[    0.045216] Bluetooth: Core ver 2.22
[    0.045275] NET: Registered PF_BLUETOOTH protocol family
[    0.045289] Bluetooth: HCI device and connection manager initialized
[    0.045314] Bluetooth: HCI socket layer initialized
[    0.045330] Bluetooth: L2CAP socket layer initialized
[    0.045354] Bluetooth: SCO socket layer initialized
[    0.045724] vgaarb: loaded
[    0.046172] clocksource: Switched to clocksource arch_sys_counter
[    0.046626] VFS: Disk quotas dquot_6.6.0
[    0.046701] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 byte=
s)
[    0.054138] NET: Registered PF_INET protocol family
[    0.054462] IP idents hash table entries: 65536 (order: 7, 524288 bytes,=
 linear)
[    0.057481] tcp_listen_portaddr_hash hash table entries: 2048 (order: 3,=
 32768 bytes, linear)
[    0.057583] Table-perturb hash table entries: 65536 (order: 6, 262144 by=
tes, linear)
[    0.057626] TCP established hash table entries: 32768 (order: 6, 262144 =
bytes, linear)
[    0.057836] TCP bind hash table entries: 32768 (order: 8, 1048576 bytes,=
 linear)
[    0.058973] TCP: Hash tables configured (established 32768 bind 32768)
[    0.059188] UDP hash table entries: 2048 (order: 4, 65536 bytes, linear)
[    0.059281] UDP-Lite hash table entries: 2048 (order: 4, 65536 bytes, li=
near)
[    0.059573] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.060093] RPC: Registered named UNIX socket transport module.
[    0.060119] RPC: Registered udp transport module.
[    0.060130] RPC: Registered tcp transport module.
[    0.060141] RPC: Registered tcp-with-tls transport module.
[    0.060153] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.061240] PCI: CLS 0 bytes, default 64
[    0.062172] kvm [1]: HYP mode not available
[    0.063619] Initialise system trusted keyrings
[    0.063845] workingset: timestamp_bits=3D46 max_order=3D20 bucket_order=
=3D0
[    0.064272] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    0.064605] NFS: Registering the id_resolver key type
[    0.064656] Key type id_resolver registered
[    0.064670] Key type id_legacy registered
[    0.064704] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    0.064722] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver Regist=
ering...
[    0.095716] Key type asymmetric registered
[    0.095749] Asymmetric key parser 'x509' registered
[    0.095836] Block layer SCSI generic (bsg) driver version 0.4 loaded (ma=
jor 245)
[    0.095857] io scheduler mq-deadline registered
[    0.095871] io scheduler kyber registered
[    0.101646] gpio_rcar e6050180.gpio: driving 21 GPIOs
[    0.102497] gpio_rcar e6050980.gpio: driving 25 GPIOs
[    0.103252] gpio_rcar e6051180.gpio: driving 17 GPIOs
[    0.103961] gpio_rcar e6051980.gpio: driving 19 GPIOs
[    0.149766] Serial: 8250/16550 driver, 2 ports, IRQ sharing disabled
[    0.151287] SuperH (H)SCI(F) driver initialized
[    0.152106] e6540000.serial: ttySC0 at MMIO 0xe6540000 (irq =3D 17, base=
_baud =3D 0) is a hscif
[    0.152223] printk: console [ttySC0] enabled
[    1.295958] e6e60000.serial: ttySC1 at MMIO 0xe6e60000 (irq =3D 18, base=
_baud =3D 0) is a scif
[    1.316431] brd: module loaded
[    1.326212] loop: module loaded
[    1.333068] tun: Universal TUN/TAP device driver, 1.6
[    1.338471] CAN device driver interface
[    1.352846] mv88e2110 etha0:01: Firmware version 8.3.0.0
[    1.358520] hwmon hwmon0: temp1_input not attached to any thermal zone
[    1.365336] mv88e2110 etha0:01: Changing MACTYPE to 4
[    1.382299] mv88e2110 etha0:01: attached PHY driver (mii_bus:phy_addr=3D=
etha0:01, irq=3DPOLL)
[    1.392698] mv88e2110 etha1:02: Firmware version 8.3.0.0
[    1.398384] hwmon hwmon1: temp1_input not attached to any thermal zone
[    1.405198] mv88e2110 etha1:02: Changing MACTYPE to 4
[    1.423310] mv88e2110 etha1:02: attached PHY driver (mii_bus:phy_addr=3D=
etha1:02, irq=3DPOLL)
[    1.433689] mv88e2110 etha2:03: Firmware version 8.3.0.0
[    1.439365] hwmon hwmon2: temp1_input not attached to any thermal zone
[    1.446188] mv88e2110 etha2:03: Changing MACTYPE to 4
[    1.461497] mv88e2110 etha2:03: attached PHY driver (mii_bus:phy_addr=3D=
etha2:03, irq=3DPOLL)
[    1.492688] renesas_eth_sw e6880000.ethernet tsn0: MAC address 2e:09:0a:=
06:ef:11
[    1.500163] renesas_eth_sw e6880000.ethernet tsn1: MAC address 82:e2:11:=
96:d7:bf
[    1.507577] renesas_eth_sw e6880000.ethernet tsn2: MAC address 3e:35:a1:=
35:82:58
[    1.515904] VFIO - User Level meta-driver version: 0.3
[    1.522118] usbcore: registered new interface driver usb-storage
[    1.528773] i2c_dev: i2c /dev entries driver
[    1.533572] i2c-rcar e6500000.i2c: clk 395647/400000(133333333), round 4=
6, CDF: 6 SMD 20 SCL gran 27
[    1.543788] pca953x 0-0020: supply vcc not found, using dummy regulator
[    1.550656] pca953x 0-0020: using no AI
[    1.554646] i2c-rcar e6500000.i2c: request_channel failed for tx (-517)
[    1.561487] i2c-rcar e6500000.i2c: request_channel failed for tx (-517)
[    1.568133] i2c-rcar e6500000.i2c: request_channel failed for rx (-517)
[    1.575263] i2c-rcar e6500000.i2c: probed
[    1.579706] i2c-rcar e66d8000.i2c: clk 395647/400000(133333333), round 4=
6, CDF: 6 SMD 20 SCL gran 27
[    1.590018] i2c-rcar e66d8000.i2c: probed
[    1.600572] rcar_gen3_thermal e6198000.thermal: Sensor 0: Loaded 1 trip =
points
[    1.612185] rcar_gen3_thermal e6198000.thermal: Sensor 1: Loaded 1 trip =
points
[    1.623719] rcar_gen3_thermal e6198000.thermal: Sensor 2: Loaded 1 trip =
points
[    1.632622] Bluetooth: HCI UART driver ver 2.3
[    1.637151] Bluetooth: HCI UART protocol H4 registered
[    1.642334] Bluetooth: HCI UART protocol LL registered
[    1.653682] ledtrig-cpu: registered to indicate activity on CPUs
[    1.660193] SMCCC: SOC_ID: ARCH_SOC_ID not implemented, skipping ....
[    1.667418] usbcore: registered new interface driver usbhid
[    1.673036] usbhid: USB HID core driver
[    1.678994] hw perfevents: enabled with armv8_cortex_a55 PMU driver, 7 c=
ounters available
[    1.690369] NET: Registered PF_PACKET protocol family
[    1.695502] can: controller area network core
[    1.699935] NET: Registered PF_CAN protocol family
[    1.704753] can: raw protocol
[    1.707741] can: broadcast manager protocol
[    1.711946] can: netlink gateway - max_hops=3D1
[    1.716470] Key type dns_resolver registered
[    1.728354] registered taskstats version 1
[    1.732542] Loading compiled-in X.509 certificates
[    1.750407] renesas_irqc e61c0000.interrupt-controller: driving 6 irqs
[    1.757721] i2c-rcar e6500000.i2c: request_channel failed for tx (-517)
[    1.764429] i2c-rcar e6500000.i2c: request_channel failed for rx (-517)
[    1.771395] i2c-rcar e6500000.i2c: request_channel failed for tx (-517)
[    1.778425] i2c-rcar e6500000.i2c: request_channel failed for tx (-517)
[    5.886418] renesas_eth_sw e6880000.ethernet tsn0: Link is Up - 1Gbps/Fu=
ll - flow control off
[    5.910222] IP-Config: Guessing netmask 255.255.255.0
[    5.915351] IP-Config: Complete:
[    5.918619]      device=3Dtsn0, hwaddr=3D2e:09:0a:06:ef:11, ipaddr=3D192=
.168.5.5, mask=3D255.255.255.0, gw=3D192.168.5.15
[    5.928751]      host=3D192.168.5.5, domain=3D, nis-domain=3D(none)
[    5.934656]      bootserver=3D255.255.255.255, rootserver=3D192.168.5.15=
, rootpath=3D
[    5.935056] cfg80211: Loading compiled-in X.509 certificates for regulat=
ory database
[    5.953547] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    5.959479] clk: Disabling unused clocks
[    5.963716] platform regulatory.0: Direct firmware load for regulatory.d=
b failed with error -2
[    5.963936] i2c-rcar e6500000.i2c: request_channel failed for tx (-517)
[    5.972403] cfg80211: failed to load regulatory.db
[    5.984025] i2c-rcar e6500000.i2c: request_channel failed for rx (-517)
[    5.991169] ALSA device list:
[    5.994196]   No soundcards found.
[    8.045274] VFS: Mounted root (nfs filesystem) on device 0:21.
[    8.052007] devtmpfs: mounted
[    8.059706] Freeing unused kernel memory: 5952K
[    8.070386] Run /sbin/init as init process
[    8.074542]   with arguments:
[    8.077515]     /sbin/init
[    8.080257]   with environment:
[    8.083413]     HOME=3D/
[    8.085775]     TERM=3Dlinux
[    8.286897] systemd[1]: System time before build time, advancing clock.
[    8.326988] systemd[1]: systemd 244 running in system mode. (-PAM -AUDIT=
 -SELINUX +IMA -APPARMOR -SMACK +SYSVINIT +UTMP -LIBCRYPTSETUP -GCRYPT -GNU=
TLS +ACL +XZ -LZ4 -SECCOMP +BLKID -ELFUTILS +KMOD -IDN2 -IDN -PCRE2 default=
-hierarchy=3Dhybrid)
[    8.349316] systemd[1]: Detected architecture arm64.
[    8.429251] systemd[1]: Set hostname to <spider>.
[   10.618189] random: crng init done
[   10.622107] systemd[1]: system-getty.slice: unit configures an IP firewa=
ll, but the local system does not support BPF/cgroup firewalling.
[   10.634572] systemd[1]: (This warning is only shown for the first unit u=
sing IP firewalling.)
[   10.646922] systemd[1]: Created slice system-getty.slice.
[   10.664217] systemd[1]: Created slice system-serial\x2dgetty.slice.
[   10.684061] systemd[1]: Created slice User and Session Slice.
[   10.702969] systemd[1]: Started Dispatch Password Requests to Console Di=
rectory Watch.
[   10.722890] systemd[1]: Started Forward Password Requests to Wall Direct=
ory Watch.
[   10.742703] systemd[1]: Reached target Paths.
[   10.758524] systemd[1]: Reached target Remote File Systems.
[   10.774516] systemd[1]: Reached target Slices.
[   10.790563] systemd[1]: Reached target Swap.
[   10.812082] systemd[1]: Listening on Syslog Socket.
[   10.827154] systemd[1]: Listening on initctl Compatibility Named Pipe.
[   10.849166] systemd[1]: Listening on Journal Audit Socket.
[   10.867796] systemd[1]: Listening on Journal Socket (/dev/log).
[   10.887855] systemd[1]: Listening on Journal Socket.
[   10.905270] systemd[1]: Listening on Network Service Netlink Socket.
[   10.925452] systemd[1]: Listening on udev Control Socket.
[   10.943520] systemd[1]: Listening on udev Kernel Socket.
[   10.983373] systemd[1]: Mounting Huge Pages File System...
[   11.007919] systemd[1]: Mounting POSIX Message Queue File System...
[   11.035684] systemd[1]: Mounting Kernel Debug File System...
[   11.067102] systemd[1]: Mounting Temporary Directory (/tmp)...
[   11.087014] systemd[1]: Condition check resulted in Create list of stati=
c device nodes for the current kernel being skipped.
[   11.112394] systemd[1]: Started Hardware RNG Entropy Gatherer Daemon.
[   11.131344] systemd[1]: Condition check resulted in File System Check on=
 Root Device being skipped.
[   11.148933] systemd[1]: Starting Journal Service...
[   11.177613] systemd[1]: Starting Load Kernel Modules...
[   11.199741] systemd[1]: Starting Remount Root and Kernel File Systems...
[   11.224480] systemd[1]: Starting udev Coldplug all Devices...
[   11.247811] systemd[1]: Mounted Huge Pages File System.
[   11.273336] systemd[1]: Mounted POSIX Message Queue File System.
[   11.292984] systemd[1]: Started Journal Service.
[   11.495047] systemd-journald[148]: Received client request to flush runt=
ime journal.
[   16.094947] rcar-dmac e7350000.dma-controller: deferred probe timeout, i=
gnoring dependency
[   16.111627] rcar-dmac e7351000.dma-controller: deferred probe timeout, i=
gnoring dependency
[   16.132034] renesas_sdhi_internal_dmac ee140000.mmc: deferred probe time=
out, ignoring dependency
[   16.190295] renesas_sdhi_internal_dmac ee140000.mmc: mmc0 base at 0x0000=
0000ee140000, max clock rate 200 MHz
[   16.274509] mmc0: new HS400 MMC card at address 0001
[   16.281365] mmcblk0: mmc0:0001 G1M15L 29.6 GiB
[   16.290001] mmcblk0boot0: mmc0:0001 G1M15L 31.5 MiB
[   16.297392] mmcblk0boot1: mmc0:0001 G1M15L 31.5 MiB
[   16.305787] mmcblk0rpmb: mmc0:0001 G1M15L 4.00 MiB, chardev (241:0)
-----

Best regards,
Yoshihiro Shimoda

> Looking forward to comments and test reports etc.
>=20
> Happy hacking!
>=20
>=20
> Wolfram Sang (2):
>   i2c: rcar: introduce Gen4 devices
>   i2c: rcar: add FastMode+ support for Gen4
>=20
>  drivers/i2c/busses/i2c-rcar.c | 67 ++++++++++++++++++++++-------------
>  1 file changed, 43 insertions(+), 24 deletions(-)
>=20
> --
> 2.35.1

