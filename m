Return-Path: <linux-i2c+bounces-821-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA8E814270
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Dec 2023 08:33:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56FA8B21C3B
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Dec 2023 07:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17E08D2FD;
	Fri, 15 Dec 2023 07:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="UegUR60o";
	dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="vCq+0sW4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2391101C4;
	Fri, 15 Dec 2023 07:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1702625621; x=1734161621;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=c1aSJYjTzyMngyHR/QkqxjwUGO0HQPSnJBNMCKM/cjc=;
  b=UegUR60oVwLZA3kpHNL7I2zuXF/vA/YcAAqGy211zGe43rP3IMrRnkw7
   d69k6vsOUOdNz5bun0Tme5A0nKfBaBeshBBL/Q2HFE8JVtt4neB2CN1il
   w/38F/2iJnJUGSCWZJ6D8CPl+SiHLvg+wA3u0BRG3QSCvFxMb1JZd/dsQ
   pJNhe6y5di+ODmODuB08hHqYyDazZiHBCTfckRcjU11a8qEXcL4Me+fJ2
   O+aEaPzfjOInWo28jCiJtm9TzYBZYix4Gi8hRlunBzNxOKAs2u15C9u1m
   IlBG3RpgGX/9evvWwChY8ywy/Xc2918T0WlKxKWHdp5FC8ZXkfFygH50i
   w==;
X-CSE-ConnectionGUID: ZddFVsxSTFqPHxpGC1+H0Q==
X-CSE-MsgGUID: CvNuUrrURCaBEpZ3PMDICA==
X-IronPort-AV: E=Sophos;i="6.04,278,1695657600"; 
   d="scan'208";a="5220507"
Received: from mail-dm3nam02lp2040.outbound.protection.outlook.com (HELO NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.40])
  by ob1.hgst.iphmx.com with ESMTP; 15 Dec 2023 15:33:39 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WRawL723RN/UPzmr/ZTystLfR3BPDJ7wbMgnVKHGL6+bty1jn28br/Lks4R+dMVPiQGod+mJ9ooBUFzCb+BiVB+Ca18GJNr6uHpiPgBAZaYhS1DISWmFevA4jKn1yJW7KoUXdZzNbKbBNl5wKJhYkVQWhPDfAlboE4TQEcyL4azP5tM3m5jIlv2KqcajrQ7LLndaDuru8iO+jkUqTS/daG2x/De4W7fCK3GqvmNKplVUBBpLEnYQMgYCE3oGO2l36W6nMKuymdP0SswdbRA+3d1nQ81kcDYH10iILCFwBpXg+wldQBd+2uylXIZgRKDH6Rtgh5yUG4lOuDdQ5fnzsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2qIOXJ2o/hZp4Vtqv9HUybNhOZVSqEAbwe8jc0IpwXA=;
 b=k78awHL0DXg5aufbeoD23CaNhOT3mmA/DAatDF8fK8JIQz61a6cEmVD4wPy3DdY7juaVO4FmMp16LZ5fLpsHSewvfqc/F0LuGh1AlS3mzHi2XbEKiKZMeGUvLexDObu24BK1qZw1tx9ASoM0AOqlHfVZ8OiaZ2YnYK7sKYolTdBI8Wmri8PJ7K4nvz3S9uiX0Ul8xMf8nJnxnWnxNh9bdE9LcceKhWuaK7OVFMPL+YZyeROiRSspeUPmKYTgaF/7dUX9PYhOFNLI9BRMu3f04JYtJsajwaZZ2qycvbBgEZZzXrzFDP4kTQkfJEZuvOO2cap+MkSU0TvmXirtDnX9mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2qIOXJ2o/hZp4Vtqv9HUybNhOZVSqEAbwe8jc0IpwXA=;
 b=vCq+0sW4qCnxL3+UqEnS7hj43nrKSgLCdC0qkkcccKXr08NJ7dnb6n7BIG13PmkX9l7NGerXzKR69DhNp3cR+/MJwjKq30NGy2s5CKSIO3kGd4qNpQY3yn4ni2xvXw1ESv7a4jH+Q8rb0PetNnyjvqp+7ug0bO5ao+9x+sXAs+o=
Received: from DM8PR04MB8037.namprd04.prod.outlook.com (2603:10b6:8:f::6) by
 CH3PR04MB8873.namprd04.prod.outlook.com (2603:10b6:610:17a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Fri, 15 Dec
 2023 07:33:38 +0000
Received: from DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::81a9:5f87:e955:16b4]) by DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::81a9:5f87:e955:16b4%3]) with mapi id 15.20.7091.030; Fri, 15 Dec 2023
 07:33:38 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>,
	=?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Lukas
 Wunner <lukas@wunner.de>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>
Subject: Re: [PATCH RFC v2] platform/x86: p2sb: Allow p2sb_bar() calls during
 PCI device probe
Thread-Topic: [PATCH RFC v2] platform/x86: p2sb: Allow p2sb_bar() calls during
 PCI device probe
Thread-Index: AQHaLPEKUL5t3x0B/EabxX5jU4Z+UrCo/huAgAD6C4A=
Date: Fri, 15 Dec 2023 07:33:37 +0000
Message-ID: <kbaq6ejaujr565ubdxn6f4e2vxjppoabsbgmpp4zbtkpfpheyr@exlxebf2hy4j>
References: <20231212114746.183639-1-shinichiro.kawasaki@wdc.com>
 <ZXsvkWeJvdkvrf5e@smile.fi.intel.com>
In-Reply-To: <ZXsvkWeJvdkvrf5e@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR04MB8037:EE_|CH3PR04MB8873:EE_
x-ms-office365-filtering-correlation-id: 4a6b87dd-5d1d-482e-a891-08dbfd402737
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 FC4z1f5983dzBhqX62O6GespzhHGVw7QWWbBSUfvfVKTQ28JiFhFT+Jy6fmv8MFYwVv8cac4CKoyiRW7gMJmQS485eFL0KMvkp2vaIAZ0cdCyDq6m/swKePieZe532o+Kdrk7+bHTeYYKfdIh7Pcvlq3a0ubO4nrMRw5jQPeMXcbPAP3XThyAhtCYzlWOIB05S6Tvpc/VtMuqVwDe3YIxg93UXTMS9ghuBVFzVFZ/fEQjwVzUlg5lstfPrEHAuXJFFjIjTV6z6376gLVilPXVgnjqpLHAYtGXoiVGwMtwsJACM6eA3m5ImX3FHse35gsQqzqgC6umNramZHSabfuj0YYhCE43+u4SFnqbqqJkkhYiVo2VkIKpFAXOKn2uXtT2DdTo/QpPrsakjvR9B7TgUJotEjGC5KVr6Ou3kisx2G4ETD5CreHSHTZ+bqSgyse5GaxIdBAX419pKq08wOfI5zLhM0rGKhxtLLOWH9GbsXVSkP1XWUvsToYsK3c4UOTjMYlhXn1URTpiLIXnPOdjGenM0rRenxlLlReuDsWwlHYK0aj3koCE0E7JmN6LPY9CxlvxM9KdxsY1FUpppETcVpy9cyn7YDLzqrFVkdagt2K5/CT7RVJtbuF+kGsY+lN
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR04MB8037.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(39860400002)(346002)(376002)(396003)(366004)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(38100700002)(122000001)(86362001)(82960400001)(38070700009)(6506007)(478600001)(26005)(83380400001)(6486002)(71200400001)(66556008)(64756008)(4326008)(91956017)(44832011)(54906003)(76116006)(6916009)(66946007)(66446008)(66476007)(6512007)(9686003)(316002)(8936002)(8676002)(41300700001)(33716001)(5660300002)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?aX0YNSNnmf02BG00x0FpDTBjcdCnqRV1CSaPUSEBy6epE2w+pDZKHArJy0?=
 =?iso-8859-1?Q?ZM4hh44MhaQxvdOdDH1IZI47BcJui/Bz90h1ZWZfx9rOLuKhBRE8bHxF9I?=
 =?iso-8859-1?Q?lDGUYawmaoqCJLt1Wa9J4AZ9gvgFgjjidIROXdNYqFgS/th2bZnLpibUVY?=
 =?iso-8859-1?Q?28FUdA6hs+WFEuGWgQK4k/MmubmrkJjqfooSi6aRkfomY8zogy+42EXMvq?=
 =?iso-8859-1?Q?e9mdkviXCVxeua9llYqOtAKXfjb1z4Nu7mo1GX9SJgYzXRk54hR9eSjSqL?=
 =?iso-8859-1?Q?BCToy6tPltBOv09iwrSRwt0bbItXf7TBcnZlIj+uvVh+icaYXInsox95rT?=
 =?iso-8859-1?Q?tNr18p2i8M5/6U8wYAZ7cv8YdzQV+vojWVnTZhaeSTKoh/mjHQGTmw7eEL?=
 =?iso-8859-1?Q?C0Cv7GmyZeNvWfChumAkhsoayejg8aYaRmFnskyNGZ5F8vOp3AM6bOXYZp?=
 =?iso-8859-1?Q?PNm4wfJKOiug3fTXI7kKfbNScCjSjy8RWrxnQjskLEhP+m6B0vSD8m9QXM?=
 =?iso-8859-1?Q?whNy38iwN3sFT5pgV1+k5zibODhjY0gcpUv+nwwNHgPdEtd+WXL5CP1FFi?=
 =?iso-8859-1?Q?4cuacD4pWYWqNKwo+GIiRiZyezw+QdBZnO3mWziM3/d0jaFOd6mAHU58a7?=
 =?iso-8859-1?Q?f9yjLpHzq0MSF9dAHBAUG8PvJ74u5GqVDLNclVPJ7XcW1WLWL+mdZsTvx5?=
 =?iso-8859-1?Q?/vcEpPihQJuJn89KpHczdRXiyG4s2m4mfY6uH2+tT2IDG742tvwmKej0bd?=
 =?iso-8859-1?Q?EO0h0rXnWjrE1NFsDAo198jvDEir50h1VI2NXrCdp6kReJDNCm/FvgPeH6?=
 =?iso-8859-1?Q?guWsHNIIYVZLIUoGF/8IS1zrndN8H7C2WKIrNyMiU0mMK3UjeaGDZ+2BqI?=
 =?iso-8859-1?Q?y2ZLuiQEosFruHOs+QrmNr2WbIyLNoZqBj7VEX26hrv8o43Z6AT68QPJl/?=
 =?iso-8859-1?Q?dse8ya4T8cEKz6HXsK8yJo87SFE2mAX5m6AGWKpp57vOy8qV0OWeZusw8q?=
 =?iso-8859-1?Q?pKWLTPCyV9BD8c0Zbk2fGmAd3gxYx/POeg9XY0UOwhtk2/gLnyZKgmFt/w?=
 =?iso-8859-1?Q?HwRmQBcdWDGGXPupc4BVoyT4rRF/rONA7rbMdbWN2Ew+NRD/Z0IVV/TXFL?=
 =?iso-8859-1?Q?/uXVNTjibnRQGRmktOAIDvEbhxE2xhvI74gfxar+ECgxHnrDWCMgANM8mz?=
 =?iso-8859-1?Q?Bo2YiGKqV125aMKku6ZJNlGvVkEyeDyQ+5UOH9qaLSNTieprcLaPAzFfft?=
 =?iso-8859-1?Q?gh5/fkAkC+V6jWYd5/HNgDzxkLDrSMzVlCy4qbBB8mRdMvekx1yZBSOlq+?=
 =?iso-8859-1?Q?X7/+Obpy7kuI7fmf3G8K+2bxx3QVyOc5IXreynIXyHUjL79BQE8nEFGodx?=
 =?iso-8859-1?Q?91Hx8l9AXcB0LokBNbkPkY4VP0N2sIR/2sPX+1xox7IYwX7qgsoL1nQMCr?=
 =?iso-8859-1?Q?69auwu0E/LdvGpHG4jaMwr1jp7TUWjfd9YYvjK//CaLiadM6aVXiZ85ckQ?=
 =?iso-8859-1?Q?iNv8fh+jwyXyJ4/+uwc7yhEPuKDO7gu/6seWXgL5MMTvNGPTBn4XNu/ife?=
 =?iso-8859-1?Q?nx86qi2QU7g3M+7Zi+ag89ehB14vYZ5DYGZksQrC8f8eb6TuckTchCk8M9?=
 =?iso-8859-1?Q?arTltX9Pvy1IAg6l33tF07CqLZ0ZL+jMCsFBAIYXx9dnDOQ/IYJ0qxUs+b?=
 =?iso-8859-1?Q?Zqm+x3/hxeRaHsmG8f0=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <394E01BD59569341828F3C8770314F16@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NANRfrr+vIMELBkue6/bhn9l2Z51+c0rW5KyVeC3MSqZCvyPlfsFsYJJnfwE+PtNl4rDICJ+yjAQxMLu7pWMvbDE0Fd0hzBQDH/QMAfkSAGJxgTbwGNzoL/5TzDuLrFVOEkeeHYHuuTw67zSShIPm9qH4sOMfJdn67c9a7RF759m/Mi38V9D6tve7grLjDBtNvNxTvgGa83aYklcZz7RG3MZv4mFF5vPnm3HnuBjW/4HQfeyqYuRPhNIzSGhl63lxeBBVsopx30O7jhjiCtFnw4uBNmJc2HKi60WrrnoDQJiwmi6u6TPtBTBO+4cN3tEMgTgbFzhWqBZtE5s2Pmg7j/MmCIwrPxvYhd1eS/9tYkDWrCeJBRsDxJ/82+fvCUrmkH31tRe4hnKIdSNWyqGnyRt+xvRcWFTbkxqHJeFANoNXLWjvu2RMU97MNJ5rQLi13hVCR4ATjQm60P01oFEp+HhX8LIGkkDZjn4C7CnfyPI8DeduH3oAGyqrK062nxbZjMJpdBP1/C479eycKAstggKVxIvJTyrylH60OVlFEXX4Ww5kVUHXOi6F2kd5UEi7JAt0SyZ0+v2DM6KZ2ek0CApUmiNUIK9r2NHK/Em5HfXPZzmz76Vx/xyD7dcD0wB
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8037.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a6b87dd-5d1d-482e-a891-08dbfd402737
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2023 07:33:38.0376
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9Yr2aNd40mcXp2v13DoqvkiE/t9I3m3h3aoxC2M9TWFExwsZg0CE9ull/wBA54xOOVk9u4J55JglaATgpXda5cpR1IAiCnrGeOgCOuwV5j8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR04MB8873

Andy, thank you for resending the comments. I will reflect all of your comm=
ents
to the next version. Please find a couple of comments below in line.

On Dec 14, 2023 / 18:38, Andy Shevchenko wrote:
> On Tue, Dec 12, 2023 at 08:47:46PM +0900, Shin'ichiro Kawasaki wrote:
> > p2sb_bar() unhides P2SB device to get resources from the device. It
> > guards the operation by locking pci_rescan_remove_lock so that parallel
> > rescans do not find the P2SB device. However, this lock causes deadlock
> > when PCI bus rescan is triggered by /sys/bus/pci/rescan. The rescan
> > locks pci_rescan_remove_lock and probes PCI devices. When PCI devices
> > call p2sb_bar() during probe, it locks pci_rescan_remove_lock again.
> > Hence the deadlock.
> >=20
> > To avoid the deadlock, do not lock pci_rescan_remove_lock in p2sb_bar()=
.
> > Instead, do the lock at fs_initcall. Introduce p2sb_cache_resources()
> > for fs_initcall which gets and caches the P2SB resources. At p2sb_bar()=
,
> > refer the cache and return to the caller.
>=20
> ...
>=20
> > +/* Cache BAR0 of P2SB device from function 0 ot 7 */
> > +#define NR_P2SB_RES_CACHE 8
>=20
> This is fifth or so definition for the same, isn't it a good time to crea=
te
> a treewide definition in pci.h?
>=20
> See also below.
>=20
> (In previous mail I even found all cases and listed, a bit lazy to repeat=
.)

I'm not sure where are other definitions. I guess PCI_CONF1_FUNC_SHIFT in
drivers/pci/pci.h is one of them. As you suggested in another mail, I'll ad=
d a
TODO comment and note that the NR_P2SB_RES_CACHE should be refactored later=
.

>=20
> ...
>=20
> > +static bool p2sb_invalid_resource(struct resource *res)
>=20
> The naming is better to be p2sb_is_resource_valid().
>=20
> ...
>=20
> >  	struct resource *bar0 =3D &pdev->resource[0];
>=20
> This and in new code can use pci_resource_n() macro.
>=20
> ...
>=20
> >  	pdev =3D pci_scan_single_device(bus, devfn);
> > -	if (!pdev)
> > +	if (!pdev || p2sb_invalid_resource(&pdev->resource[0]))
> >  		return -ENODEV;
>=20
> I prefer to split and have different error code for the second one:
> -ENOENT / -EINVAL / etc.
>=20
> ...
>=20
> > +	struct pci_bus *bus;
> > +	unsigned int devfn_p2sb, slot_p2sb, fn;
>=20
> Please, preserve reversed xmas tree ordering.
>=20
> >  	u32 value =3D P2SBC_HIDE;
> >  	int ret;
>=20
> ...
>=20
> > -	/* if @bus is NULL, use bus 0 in domain 0 */
> > -	bus =3D bus ?: pci_find_bus(0, 0);
> > +	/* Assume P2SB is on the bus 0 in domain 0 */
> > +	bus =3D pci_find_bus(0, 0);
>=20
> The pci_find_bus() is called in two places now. Can we avoid doing
> this duplication?

I will add a global variable "static struct pci_bus *p2sb_bus". It will kee=
p the
first call return value and allow to skip the second call.

>=20
> ...
>=20
> > +	/*
> > +	 * When function number of the P2SB device is zero, scan other functi=
on
> > +	 * numbers. If devices are available, cache their BAR0.
> > +	 */
> > +	if (!PCI_FUNC(devfn_p2sb)) {
>=20
> I prefer to see '=3D=3D 0' to make it clear that 0 has the same semantics=
 as other
> numbers here. It's not special like NULL.
>=20
> > +		slot_p2sb =3D PCI_SLOT(devfn_p2sb);
> > +		for (fn =3D 1; fn < 8; fn++)
>=20
> As per above, use a definition for 8
>=20
> > +			p2sb_scan_and_cache(bus, PCI_DEVFN(slot_p2sb, fn));
> > +	}
> > +
> > +out:
>=20
> Can it be split the above to the previous call or a separate helper?
>=20
> ...
>=20
> > +static int __init p2sb_fs_init(void)
> > +{
> > +	p2sb_cache_resources();
> > +	return 0;
> > +}
>=20
> Please, add a comment justifying fs_initcall().
>=20
> > +fs_initcall(p2sb_fs_init);
>=20
> --=20
> With Best Regards,
> Andy Shevchenko
>=20
> =

