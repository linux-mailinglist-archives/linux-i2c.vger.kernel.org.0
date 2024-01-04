Return-Path: <linux-i2c+bounces-1103-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7C0823DBB
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jan 2024 09:44:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BA9DAB210AC
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jan 2024 08:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57D161E51D;
	Thu,  4 Jan 2024 08:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="Hi0ojehq";
	dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="s39VeulS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048241E531;
	Thu,  4 Jan 2024 08:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1704357764; x=1735893764;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=DmTofNjLcDSgyTD+YxBYRdup2R5/nuFBJYcbPoQ3Z9o=;
  b=Hi0ojehqXLw/eQo9ljy4cKRo6Pmd4S6M6d9dYiMXQwUn+GEZy0zZCjkR
   HktHZxXIIqW/AlpS2h89yHi/N1Fhdu13jhXgN2CPv+pRZeY/Pd3qW0vAC
   ALwJ8rdjlQdOZ/ODNKiM6+SR0w3XMNK63WUoXpdRn8GE2u5iAJAEo4WmC
   R2EwUzOAHOkorBfwmEDUEyaiKKz2N0k+jZNzItj80kWCYNnqRW7BJQkCL
   P2lGoxMICz4hRViOJUEvO0exz39EmMlSNw0/QUTA/VJvIEL+s6H5NP8YY
   QLOpSKOYVfKgK+SxiX3M6X4m+QmdxJFaJvHawhAxsFspyKo4FSwLxJq79
   w==;
X-CSE-ConnectionGUID: QnpMhg8AQdS4hp7vCVSl/Q==
X-CSE-MsgGUID: eGraV379RXyOf7kefCOFLw==
X-IronPort-AV: E=Sophos;i="6.04,330,1695657600"; 
   d="scan'208";a="6135327"
Received: from mail-bn8nam12lp2168.outbound.protection.outlook.com (HELO NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.168])
  by ob1.hgst.iphmx.com with ESMTP; 04 Jan 2024 16:41:33 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wzk9KpW54iHR8pJvMLvLRThRCU3Hf57YDv90BIIQU/5p3CpyRiV9MQhvB5AzVKGkC5UOS621ajigUJscbzEmvqP3JNTKjZ+0XCScn51C/H8GKvOw1eKPTKKFf7+yhAYeocJhSOaVOfWs9okjSQIbs02a+vW5R1srJhpqPUMR+8TRnmm6jpEFJ/u80sTmXpcG+naLAJwVQqgXfXugKUaWfERnzwLdhTs+IvpT8zWwYl0xavZhP+PN6wkHR2Lf/AKy+HiwcQ6pnuwaKJtPGKeLyGhXhrqyaJMTYwMCYc28VU1Ha/N7m2Nt5aCYJOWZyCaUdlpzwTw6+4hIQkLF5Oko9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XFgjKZ6wjmzscg20N3EYEQhOTS6ijriZxyjArfEd4D8=;
 b=npvz8umNaPH+wKd6SJMybOm8Pfe5gad2muMuWrmO877CldHcXm98zQfzaFu7CBtlp/JdnyQBLqJs5S+phevKrGhH66K+gIsTkTnbwNxL/kg5L/FkQk2I74gFa7GKkC0y8rwZtUtA4peYx+Z6NcHQY3NeKe+g1p/ACxLV4mHs29EZTpzjIu0N3V9+UYOsKIGCoV5wrmtS31U0oAxuAFJE91Yhkla1wDWGgAtlPbAEwSEV5tEBBCJM6EARILbEtbNrs5jR8hi7ZqbRCjPHy4eQ4BKBrGlkqakWJ0vHUEJFVc0LWGsH0odt5fbN+/lodBe8veehb5FbRptBEse7yHHq8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XFgjKZ6wjmzscg20N3EYEQhOTS6ijriZxyjArfEd4D8=;
 b=s39VeulSm2h2gSPNMeodqqRjlWrAXR67GssBjhMwaTAFUnP4Nu9FpufqwEKBE6amms3f8R1XnBz/tq5BA+I8kbTDO5zBg7tUf4eDuaMI7bIYq7FAO316dWoeJG1CGB/uClEjDKDTtGxCg7/ZSmxQtQFHH8ktQJmzdF6QXI8p++c=
Received: from DM8PR04MB8037.namprd04.prod.outlook.com (2603:10b6:8:f::6) by
 PH0PR04MB7431.namprd04.prod.outlook.com (2603:10b6:510:16::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7159.13; Thu, 4 Jan 2024 08:41:29 +0000
Received: from DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::81a9:5f87:e955:16b4]) by DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::81a9:5f87:e955:16b4%3]) with mapi id 15.20.7159.015; Thu, 4 Jan 2024
 08:41:28 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Klara Modin <klarasmodin@gmail.com>
CC: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"hdegoede@redhat.com" <hdegoede@redhat.com>, "ilpo.jarvinen@linux.intel.com"
	<ilpo.jarvinen@linux.intel.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "lukas@wunner.de" <lukas@wunner.de>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH v5 1/2] platform/x86: p2sb: Allow p2sb_bar() calls during
 PCI device probe
Thread-Topic: [PATCH v5 1/2] platform/x86: p2sb: Allow p2sb_bar() calls during
 PCI device probe
Thread-Index: AQHaPow80BKhEPvQJ0yVwJLvsqPQE7DJVoSA
Date: Thu, 4 Jan 2024 08:41:28 +0000
Message-ID: <oe4cs5ptinmmdaxv6xa524whc7bppfqa7ern5jzc3aca5nffpm@xbmv34mjjxvv>
References:
 <CABq1_vjfyp_B-f4LAL6pg394bP6nDFyvg110TOLHHb0x4aCPeg@mail.gmail.com>
In-Reply-To:
 <CABq1_vjfyp_B-f4LAL6pg394bP6nDFyvg110TOLHHb0x4aCPeg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR04MB8037:EE_|PH0PR04MB7431:EE_
x-ms-office365-filtering-correlation-id: f6327a46-209c-4672-5bc8-08dc0d00f1e2
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 sNjkzRb0cE6HOlChbkH0E9rQcJFtiZkcBKVbBcQ2ziX2pz+JVyT29tMZA9d02Me6hNSINnmMBWFobtDqy7TYwy0nQ+b2jF/ZKFZ58HqaYQ8RJv89WJfzNrKP6E9KPAoB6Y6EIzFe7/P9k0eVJfF3aBpPbXYz01OTe5XP8RDMr9XxdZ/kPxxLZFzix5YEtYumNKs02+6W4rFuxfrRNpcJMhBUu6QEHW7Be6AF3QdUHtRiJ+vac0atb9mjeRf1On2TZO00a8e835BGCKhOjMiNGuR0czEM1LPWVb3dZD2oCO60TQ3gDSyO97TUhKkkNd7n8CPBiciubJGEkZ7OqcY8bQajT7pV3cxGnjrQif/7F+wWytHAMW+AGAD5NZJRLEX8f4sGupQAUu2hNztw/Em3P2X35lDBueppfU77psWXpEeqQtVbuJF5maJ4x0cJ6Oiurqe0JxDqMTmTCtsNyNGC8AUwJulYHSLQ/A4yg7/B4THpQRJPJegw979YkUt5sTZeAleoXs7LgIjJvzvmTlDFqzoGkPXyRfbfCHCv2qJeKjbFaGr/jMzU0aLAw4WYB6AjZA72LmXSW4DCEDyxOXirQyTv9br8R1NBcaM4K05cbdQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR04MB8037.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(376002)(396003)(346002)(39860400002)(136003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(6506007)(6916009)(66446008)(66556008)(6512007)(9686003)(64756008)(6486002)(76116006)(91956017)(66476007)(66946007)(38070700009)(86362001)(966005)(82960400001)(122000001)(83380400001)(41300700001)(26005)(2906002)(38100700002)(71200400001)(478600001)(5660300002)(4326008)(44832011)(33716001)(8676002)(54906003)(8936002)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?AsVIIYZeAUgddfSiW15QK6bHbL0/eqEQ/rfnaDY6lwxqs/bklqCerZTpo3PJ?=
 =?us-ascii?Q?dnt1j6rMtY8FPXmON3VzUG40zf6r8y3CcQw/vLTqnUIyqoDRhqRorgdBp+1G?=
 =?us-ascii?Q?EWq/0XvPEBquPbHglmcl28BvriJHymS9JYCoe2U2GZNAGxvIKPSSN4UKMS6/?=
 =?us-ascii?Q?Zd4HzYMAtbMz232Sb3JnP+mXq2zCR0cmGtYFRo6ltpphzmV+iXTX/p8VSiWH?=
 =?us-ascii?Q?dlUG+IURN7PE00qiudZ3vKCP5NbQe1p2BTNAbCJnwcieiq51hhrVFKnG8nxu?=
 =?us-ascii?Q?/DaPfFeZWEu6c6qesdaeN16IhRSlHnTpiJ5JIlw/onIj6AcgFUGKYmgNvEj0?=
 =?us-ascii?Q?VcCw9I6TZ89tRd2vKUfkKk8nCqIE3eboGKv1sKdEdWgetlShWFjLBOGuoip2?=
 =?us-ascii?Q?2GFI7AyA3E7kPkrP2YJbk3Mmxx+PqoZvrF29y03DaTSHfI9O3ChBvvXjUgWX?=
 =?us-ascii?Q?/7jogWLvgZ0iL/AhoB8UF9aXSbAfOwR8NLrMFbbqbQReL6FUi/E/a1lv/Nm7?=
 =?us-ascii?Q?baiI0P0kFyg42A15mF+JfMCtYGZ76HyIDqS4MD6x7zS1cyfgWJ+Z6nONm6JK?=
 =?us-ascii?Q?s+j8tAiMMA7dCXa2Uwr26b1Ah1b9WsgH26ob6sd5K1uPisAq06Il1gN3ne0v?=
 =?us-ascii?Q?VI13e0f2lgvriQ6Yc0QY7pDi6CHmPLxp6nmkwdxz0jCVYzqKN++Pc0ScfO7l?=
 =?us-ascii?Q?7psX68u7Tf7dGthQ5f4QnFNv1CSgHXPqJJLgytM9d/BSIp63ytIPYpsDdzHI?=
 =?us-ascii?Q?EXSGwxYE43aKG5gWIfnVxX66MTuwKbBI7+KlCe706sFy/xfe5LHYrZO7DOnL?=
 =?us-ascii?Q?CIubH17iyL5rUiE8iX/HjVgqvjfigW7EhIEQA25xkup0qaHdkZd6c639YnKX?=
 =?us-ascii?Q?+ih25zRjsA2akIV4VDhVs1FxZ7e5Ub0kOIL/6uY+Vycln0LYJk6kzJAJT7bK?=
 =?us-ascii?Q?a2gGYglf1JEW9VIl4wWSAqQYKX4DhmqIzM8B5diFhMQ0VUJGSCdziAQJqgb8?=
 =?us-ascii?Q?groXxtAiMXYLp6xJwF5GlH62c8HYBvSd5MHIXxnbnvL8vP+io3jEggO773I1?=
 =?us-ascii?Q?losD4u1jjbJIgcSvlWOAQxHru9qpt82jNL9IrsKcTDYXl72rIi1hbFDKIdjP?=
 =?us-ascii?Q?CX2qRiKQcnJeKgGPbZ+kB+ZP4cr5SSgmHU47jUg6dxDgAh1RwPe7SW3aRIJc?=
 =?us-ascii?Q?9fkoL2hk4zAmeS/Mz3rnRoAuuWk/cHYB95zneXKdDgHbkPb2lxlayiwsJyfa?=
 =?us-ascii?Q?uHndt+tQBaOheF44P3SmjSiFjfu27dudMxSEMTqTCTmuwCiR93ZzqCQwJIQB?=
 =?us-ascii?Q?9OwO5mXJzFxsnNC/hIre8+pdPxrITiXWcmnCmsrt613VUn0LfAFXDQfrK2rq?=
 =?us-ascii?Q?Xprty2DYRQFCSATEhuRTJDRE2683lwhZfz9fJiXems5MbEI1kv+vdgQDC+/a?=
 =?us-ascii?Q?/re53DuD2uS7tZjhPQn+N1joDjh6jrY5xvOWTDRU+sJR2Rmoyj9LXQCVKr9q?=
 =?us-ascii?Q?RnWqYGLqT7nDfgf+XvLMd+83nFj4DC53j6Sk1jkYgf6QNMsrFGLeBb4Uvca+?=
 =?us-ascii?Q?w6gce4vEAhBV2NzVOYwocKmg+tVUYXhVgRdUjp4DENfrlKG9FrWsFknPR1NJ?=
 =?us-ascii?Q?vw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0A39927A7AB29E4DA04093B63C51C639@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1IWe9lTiMVGBW+iuKFFKsw6bsyzG2KEvuA+nvQwKVbOAsFKgEjSp36g0Ta0cJ7o12WeQgiYw+frX3dMyohG2PmFdtqNW8ZRYu3YFn61G3c3mAP2aSvwpso2lhrWOCJQiyXmbOxJntyAjcrlNu6hI63U+NLIM/ULCe2IT9twbCDu4TpCRwVymQA5zr0Nf2nZpT0bJc7VJXBgnT4k14kNda06jWs1I3stp4r3L+q6m2Hfs+aaycahRnDpX4o52kgkOsgkNp3c03y1y0liX20WC0h3yjpIFObG8ndS/BNIAHaHht7oLz9UILQpNuk/w7rMLlOAz/AP+UPcdQD1rmKbvktRbTzZ5Zc5mM25bu+958Z9LLUSBfRYdZx+39hK9SIQba4Hv3UpCc4QgVkifBRzEP3amVhiJaLPGJaaEEZb+f3JJsr4HVa4CNTld72hvZA8RR/Cd0m4EsPMr25qVKiVte/E6W7rKHefg/Gz1Tuknv8NPowndwhCUaD5KoXxYHzclOcIUH9MiWPKr53LKY9XN4NwPUkhulmYYugTw0UMeDXH37b1BAzYQnUarMPbUhsldWAdbkhvdzoZHnoTu68zX3vvxe1S9425SC++ipzguy1m+ewMqmedU2Lofc28yrKMX
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8037.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6327a46-209c-4672-5bc8-08dc0d00f1e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2024 08:41:28.8540
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KbVoBqpEzS5ZI2fD9BtoG6/L9mSRoJzaye0wL6BxRIrtyoNAEqDjMXJ1nosLW+PK/NAOwzyz/Da2MlCqVwobOdFZTNsrvEhK5gOQFY4wmS8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR04MB7431

On Jan 03, 2024 / 22:31, Klara Modin wrote:
> Hi,
>=20
> With this patch, ata_piix fails to detect my IDE controller (older P4
> Xeon board). Reverting this on top of 6.7-rc8 resolves the issue for
> me.

Thanks for the report. According the dmesg and lspci logs, it looks the IDE
controller has the PCI DEVFN 31:1 (0000:00:1f.1). So, I guess as follows:

- Klara's system has the old ICH (ICH4) which has IDE controller at DEVFN 3=
1:1.
  This DEVFN is same as P2SB device that newer PCH Series 100 or later has.
- The system has ISA bridge 82801BA for LPC, then LPC_ICH driver is loaded.
  This driver depends on P2SB and calls p2sb_bar(). But p2sb_bar() is calle=
d
  only for new features of LPC_ICH driver (SPI flash and GPIO). Then p2sb_b=
ar()
  is not called on the system, probably (I want to confirm it).
- Before the commit b28ff7a7c324 ("platform/x86: p2sb: Allow p2sb_bar() cal=
ls
  during PCI device probe"), the DEVFN 31:1 is accessed as P2SB only when
  p2sb_bar() is called. After the commit, if P2SB is enabled in Kconfig,
  DEVFN 31:1 is accessed as P2SB to cache P2SB resources. However, the devi=
ce
  is not P2SB devcie but IDE controller, then it casued the IDE controller
  detection failure.

>=20
> Please tell me if there's anything else you need. I'm willing to test
> any new patches.

Could you confirm that p2sb_bar() is not called during boot process on your
system? Applying the one liner printk patch below, let's confirm that the
string "p2sb_bar" does not appear in the dmesg log.

diff --git a/drivers/platform/x86/p2sb.c b/drivers/platform/x86/p2sb.c
index 99a0e456f075..e034a58d7531 100644
--- a/drivers/platform/x86/p2sb.c
+++ b/drivers/platform/x86/p2sb.c
@@ -195,6 +195,7 @@ int p2sb_bar(struct pci_bus *bus, unsigned int devfn, s=
truct resource *mem)
 	struct p2sb_res_cache *cache;
 	int ret;
=20
+	printk("%s\n", __func__);
 	bus =3D p2sb_get_bus(bus);
 	if (!bus)
 		return -ENODEV;


If p2sb_bar() is not called on the system, I think P2SB device scan and res=
ource
cache shall not run on such old systems. Before the commit 53eb64c88f17
("platform/x86: p2sb: Don't fail if unknown CPU is found"), p2sb.c had a
whitelist of Intel CPU IDs to access P2SB device. Its commit message indica=
tes
that we can add blacklist of CPU IDs if needed. I think this blacklist will=
 help
to avoid the failure.

So next question is: how to list the CPUs which do not need P2SB resource c=
ache?
I don't have clear answer yet. According a P2SB document [1], P2SB support =
was
introduced since PCH Series 100, around 2010. Looking at ICH history [2], I=
CH9
removed PATA support, so I guess DEVFN 31:1 for IDE controller was removed =
since
ICH9, around 2007. So the end of the Intel CPU blacklist could be the CPU
introduced between 2007 and 2010.

[1] https://lab.whitequark.org/notes/2017-11-08/accessing-intel-ich-pch-gpi=
os/
[2] https://en.wikipedia.org/wiki/I/O_Controller_Hub#ICH8

My mere idea was to just blacklist Intel CPUs with family !=3D 6. If my gue=
sses
are all correct, following patch will avoid the failure on the reported sys=
tem,
since the system has CPU with family =3D=3D 0xf. This will cover certain am=
ount of
old CPUs which should not access DEVFN 31:1 as P2SB. But family 6 started a=
round
2006, then it is not the complete blacklist, probably. I will think about t=
he
better way.

diff --git a/drivers/platform/x86/p2sb.c b/drivers/platform/x86/p2sb.c
index 99a0e456f075..c9bcef8e2c4c 100644
--- a/drivers/platform/x86/p2sb.c
+++ b/drivers/platform/x86/p2sb.c
@@ -46,6 +46,10 @@ static int p2sb_get_devfn(unsigned int *devfn)
 	unsigned int fn =3D P2SB_DEVFN_DEFAULT;
 	const struct x86_cpu_id *id;
=20
+	/* ICH/PCHs for old CPUs do not have P2SB */
+	if (boot_cpu_data.x86 !=3D 6)
+		return -ENODEV;
+
 	id =3D x86_match_cpu(p2sb_cpu_ids);
 	if (id)
 		fn =3D (unsigned int)id->driver_data;=

