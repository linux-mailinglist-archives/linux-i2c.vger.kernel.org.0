Return-Path: <linux-i2c+bounces-766-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 364DD812425
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 01:55:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C83C1C21410
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 00:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1468642;
	Thu, 14 Dec 2023 00:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="kCQQlEfu";
	dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="aYVAprSk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 509B9D0;
	Wed, 13 Dec 2023 16:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1702515340; x=1734051340;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=OZPQDjcnLwPjg9q3jywsG79RT4NLEUlRUc6HGcloQlE=;
  b=kCQQlEfuPaB2iOOjCNmAZBNziDd4WVuya8txqfGGmQxleBBN1xZ2rP2n
   iSD3bDe1VPgtlexZfKLeXcNty9XS3Kof25Ko3BuXeaPn83gahCCqZvI4I
   LblYcJuBhM5S7YrOtTlh8sDm8uVchUmdS63GIEil4IPiNDwXvcvY5zUUU
   s0XD/efKPK8U9eZ/ON8My6nf/REDaEjyffQ/FENKEvTexqNHqqxj02+LU
   O37f0M4vspaITD5HN6RWTTOSZd/PNaTJIItyTgfjMWywc+XLeMr4QOfJ7
   RdrHpU9EHawm5jz1O4Xh8zV2/+zmGXy2JqjXdZJe5J+xumnWLHN3ajliP
   w==;
X-CSE-ConnectionGUID: Dd+GGmYBTAeENDxfnetQEQ==
X-CSE-MsgGUID: ndxe48dTQAet4acjV+9Www==
X-IronPort-AV: E=Sophos;i="6.04,274,1695657600"; 
   d="scan'208";a="4843084"
Received: from mail-dm6nam12lp2169.outbound.protection.outlook.com (HELO NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.169])
  by ob1.hgst.iphmx.com with ESMTP; 14 Dec 2023 08:55:38 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=khfJ+abC9DItA+WanZHT7uPSzgMfBhhWvPN4+RvkR6as54i1w+29YWty6WNlzjg8xMMNZy62BXSO8nSsGACYOemEpLrBfikFPFS6BqfzY4knQ1MnlxU/9jEf4VLcevRdWQYwJSSmjX+3U7qG7wowANnf1nkeAewsCK7wnkJsCDK7/f0HPbKjA9ST+vlimTl3BMMCAkzCJZBjQc+1kn0EO2/rDeb5QO1ZDUp4MrOTZX5w1/m26+TTgsMHhYZammIG5dGF/zYY4aqYt9sicotnPkQYuc6bXm+horV7WAmXHimTIyL2VNXgho6rF2Jq9/TkwsBttJEU+eeLFCvZVyzlYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/WUyT3z+l626FC27grJUYZOC8kSU7T5bt4Hr51tNR0=;
 b=JaX2JIJZeSXzMZ5Qc+tY1CyirAXDgYAooHbl0zjjNmR9E1vLZ32a31qnyT2VQ4pguWxIaFeLtMWoE8QBA4Ro4CYWcZgBt2duS5SnDd1FJMNG+PawaE/LzMiwZnrPZ1Nasz+SUjH+/dArZ8NLSXlU/QqYcKB7rleMVz0iM7OxO8r0NfXZJ6AyWK5xANbeOUkBU9L4KNEyALVo10KJAIFk8mkE5O3P2Pe8B1fx5ofEzdP1ZphLkexlC7P3B5gh1JgFG00oAt1g92DtA1osjWNtVcTOQjJg4U8ulUqXgqWYIsSfh2S3O3+fzcHDWzbUamp4hBIGwjqH6aC8X4dMoXqbSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/WUyT3z+l626FC27grJUYZOC8kSU7T5bt4Hr51tNR0=;
 b=aYVAprSk+HGrB/ZSAN8YTp6Qo8IbeW8hAXAOm8uqpMo5vjVSBsl73k4wD50cYACpD22Z6R68RBio003Ph+3Y3DdCaoKdLe6LR+OLI+qkUhfRFrVGG4xSW2sJ6GwlQEevRJRAle1Y1cK4ooYXuLQOZSIvvWQMcoJkBZtyqImp9sA=
Received: from BN0PR04MB8048.namprd04.prod.outlook.com (2603:10b6:408:15f::17)
 by SJ0PR04MB7312.namprd04.prod.outlook.com (2603:10b6:a03:297::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Thu, 14 Dec
 2023 00:55:36 +0000
Received: from BN0PR04MB8048.namprd04.prod.outlook.com
 ([fe80::58b4:c149:69dc:1d2d]) by BN0PR04MB8048.namprd04.prod.outlook.com
 ([fe80::58b4:c149:69dc:1d2d%4]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 00:55:36 +0000
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
Thread-Index: AQHaLPEKUL5t3x0B/EabxX5jU4Z+UrCnQRYAgAC1coA=
Date: Thu, 14 Dec 2023 00:55:36 +0000
Message-ID: <eo7bnkdph6fwb74zn57r33a6unodkpagpk3dk5euz5cdc2mve4@557h3e3v5og7>
References: <20231212114746.183639-1-shinichiro.kawasaki@wdc.com>
 <ZXm6QrRkyzGRg8SB@smile.fi.intel.com>
In-Reply-To: <ZXm6QrRkyzGRg8SB@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR04MB8048:EE_|SJ0PR04MB7312:EE_
x-ms-office365-filtering-correlation-id: fa897feb-a2b3-428a-efae-08dbfc3f6227
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 rLSSi0bzNhIDerN0WEaBekZN+7wTqVvmyqEnkdqvakQ17tIM8/H5lXQA9R69SdMa/JYhc96EorC8N8dRlE/crpAQ6vX2NZQQvLXvmGOkscagx+SZ7HN8e5nYsSC/RSpLdN6fK8yQHu42hnFuvNbdagIY3Jr3kvBXK9u2HUqJOrcrzHpdP1opbM4LJ6BPlFliQhwVlvZFsPoPIS2FhNRs7gqMfKvW3xhnOFCM0s65D0o/5RUjzUi3WjZos4x0rZcLPDg4MPuTS4mwybHFuQIWHC+0Hc6hNl326SUPu+gcgNxb7q7rmx+nQcuAAjFYTTkFE8uxmeT3sD4ZLqkpQ/C2Xkxl3B86XqWgUTBXsKhVqASV6+scXfB6RO1ZxT4egelq0HE/wPOq74NX+xWa/bTtzPKJAPEc8HUzg72DGCgvqjuSj38qC3A2h+jlqYg5DtkPsD2f7fLaTyDEhA4eI72FZLqF/TEmo6b+LLH+e4WhkQvzvsXF5mV2us453vS4sMc/fs2+MiZxcXQIaL6yuRBU34KXDrZgRrkFdI8Wl2mqxcpmhHeZ4ZmBVJc0CbP3n4Rc5k0LLynXfLP1n39E5/FESNdvS2QbIMvvvaiciMdYWZk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR04MB8048.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(376002)(346002)(366004)(136003)(396003)(39860400002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(6486002)(83380400001)(71200400001)(38100700002)(26005)(33716001)(122000001)(44832011)(8936002)(316002)(6916009)(5660300002)(54906003)(64756008)(8676002)(2906002)(4326008)(478600001)(66446008)(66476007)(41300700001)(66946007)(6512007)(9686003)(6506007)(76116006)(966005)(91956017)(66556008)(82960400001)(38070700009)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?andYVjtev15MlMhPRSpgYUy3ZmDJzkqErXrQzMzwU5FU6AmvrtEDnpJUlp?=
 =?iso-8859-1?Q?Y2h3d5S7cC7ZIc7+ZCz7PG1jmU97GQ2d+chrYEgaP9RbZuSFMrUDtoa8kC?=
 =?iso-8859-1?Q?8i0X63jGPd8SvdUQGaXu7UroWHTA1deQIg/d6aMMdUxqTbgwKf8SA0AsYW?=
 =?iso-8859-1?Q?ID4Kw++/naZyFTdMny75YvrKvR/XoMey5BKX/s8CDUtacEuBOSPzKTdQWm?=
 =?iso-8859-1?Q?kl0dy6DzDYo3jMqdx7OOg7wBBbOR5y2lAMv5qfqu4nE94hdhnj2S1LVSWs?=
 =?iso-8859-1?Q?Fz0HOFwxidAZhMDm0XZKWEzQCJEx0i8BGmKl4UFKTTKqJ67BRL3TUNyfHm?=
 =?iso-8859-1?Q?N3bK+9X4IUBv0wrIPXE49/IVSUbHDR5+BD7JwtDu/3zjLd5buAFG/l2xhy?=
 =?iso-8859-1?Q?OVCykhpp/QxGaELIGs4iaXXL6qAdk0ap3G4R+MDnWoai4OiRrhlJW1q3qM?=
 =?iso-8859-1?Q?+SJpQk0MBr7/fgWEzTJfoRqEtl3tv0gmJBfDa88iU8ywJA4kDM+mdCeV28?=
 =?iso-8859-1?Q?xMOdWPnSeAyOQae6LR2DU9wbvRCVUuDysWPu7NPR1i6NgFuwrMh+M7S+yh?=
 =?iso-8859-1?Q?wE1HbgyiwoKUQjsx8cVQWbsDi1NC8tJX2egQPzJTU3RP3AEYYytnyoeBaC?=
 =?iso-8859-1?Q?ck5JdufF8RhQlkXpuJT8s/9eJqdsNIK6jQjlmULEklv8/PRHGeRBqDE+7I?=
 =?iso-8859-1?Q?E5tt0rBpwZyd4WtOVv59NXyvZcSHn5rODak+nsNB9/5BwXyMVtVfTEye/2?=
 =?iso-8859-1?Q?Cjhx8l2one0h2tECMor2XrVdBy8DuDfg1qMbrRHG72oE8cRZfXtX5L3M+a?=
 =?iso-8859-1?Q?iMZWdE6XyAQu7+YLBvBue72r8Nvf16r8kzfGsmN61rsp6mQhLKXtUajG0d?=
 =?iso-8859-1?Q?2dNIFXhoe+3GvoaQlB0j1EOd/xrvOiGmXVhEqQOtG8RQOwgfnb72v6yVxS?=
 =?iso-8859-1?Q?fgVLyteYTW9vg0Qp5sb1YmwIu4/JKHqIISTfx1IZbAbTeNiSEF4rRioLu2?=
 =?iso-8859-1?Q?fqSzwbEHvhSgbjIcwp/n9Ik/KWgI4kcOK8IoZB8NFltMJbM4202hIlRbHT?=
 =?iso-8859-1?Q?OW9KPQaLCmTsn81QC+iNh0mwsV5DTT5wfYj0GjfrFFkir7zCpDSLe0itEP?=
 =?iso-8859-1?Q?1NK9HBFufp/20S5WHOJ/AcR9PAoTcz2VFtOaLBCmPyLuCcp6G93pa91z64?=
 =?iso-8859-1?Q?oVKVvhyRY31uoZLRS6xd3p5GPxGryWQqrOa/2dqCxAJcdovD4/P78VC7J0?=
 =?iso-8859-1?Q?MmHwnoec7RwHqiiqVr1xcMaULphW2UpfCgGla6gkaUolC3N1DUXWGGX38p?=
 =?iso-8859-1?Q?KGyW5kjMpqPq0NCvzSpLPAn/r1VBh61yohLfEqGAWXVIQGUcg9tlWvpebE?=
 =?iso-8859-1?Q?bL6mTzHbh/0oklvW30Be97XNoM3NZtTkc6LWpcj52e55c+XvrF6R7oZNLt?=
 =?iso-8859-1?Q?3DJZG/YeaH8MeBhRCJCIj7CmRzKAGiFeOe0/3aFrc6I0TBNSV/Enot+8Gl?=
 =?iso-8859-1?Q?zkxwah0bsECg0S7ysMfSQrYHC5OG/eZfSKuCx3qD92Qv8XD4mgQvVuQLJh?=
 =?iso-8859-1?Q?IK3UMMrp0GWaCHOOOw2YFRvxNqjD6KPZvKFCBtKH/E0wZwU2WM3hIbZC9B?=
 =?iso-8859-1?Q?aAWG+wipReQcnxFYCPTbuq5YBcII45MWuIBaFVsn/mV6d+gK9gevVypULa?=
 =?iso-8859-1?Q?mwE9T+DIxBkQM3cjjk4=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <AD870230A012C949AF4BFB22CF8A850E@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2RYWOK1nnrgqK2LLtwAIgl7NxK5Ca3kspLvGOLOzD9vOJ5AWM74o/+ggwyyYGcFVTKyFLmQkQVdZLUzhRMBgZuaLqot0x2mqtx00MMuIjNj8W7mfwW5Ke84X9/Mh0N5rv0qBeM7hjENudSZzvS5qsHYGSTrv/t1K6zBo2U4bO7sLTzl2mJIlIRObsoA28MpCBnYf4buhsPII2LFpMKv69EA/iAwBDIzjQ4iHWJM4+rJpLPgL9zvd32mqGE0eOLr6hYZcJEbsxgJIGW7GwQsirMEm2wuFmlfT+ha8I3vj8XKjuodVszHhKtTFQj0Nk5ps4Lt9I8PTjpW2dz8rSkt6h2fpnJpo4nm2PMoy1yy8q03cmMpV00m/7CH+60/rzACpQlYp7WoYmR4yIW4UtgAkbXziJPeucMabAWKpyB3VcYZ2UIZEVCq2nDAjkdB8966VPyxF0BgGs2NzbH27+joW+Jo3HgDfZJG4fWrbYCi139qfkW+zjngmHDLE+LQczDmhDwGQpql0aHXxQ1ea5dv6RNguqQWRH9ktpqaw/qwUy3GZC4/+NbGHfsGwmJm1edVunJy+P+h61eNf9oBjC8vXEQpe+/blM3SnZqTPclAA1aiPCILwMdPtvVUy8tkLt1bv
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR04MB8048.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa897feb-a2b3-428a-efae-08dbfc3f6227
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2023 00:55:36.2708
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hiSJAWKbBZDnOZl22jONW/BExae3l+NhRsqSULcauYZhj+b/8UO2M51rUt35gJp13FV1oJaFK2bcFKsuTSO6G93LGtuoJjAgGh6wp8OZ47c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7312

On Dec 13, 2023 / 16:05, Andy Shevchenko wrote:
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
> Here... (at least some better comment with TODO needs to be added,
> and next patches can address that).
>=20
> >  	struct resource *bar0 =3D &pdev->resource[0];
>=20
> ...and here... (okay, not exactly here, but with the same idea,
> to use pci_resource_n() macro)
>=20
> > +	if (!PCI_FUNC(devfn_p2sb)) {
> > +		slot_p2sb =3D PCI_SLOT(devfn_p2sb);
> > +		for (fn =3D 1; fn < 8; fn++)
>=20
> ...and here...
>=20
> > +			p2sb_scan_and_cache(bus, PCI_DEVFN(slot_p2sb, fn));
> > +	}
>=20
> ...and so on I gave comments. Any reason why they left unaddressed?

Andy, thanks for the response, but I'm not sure about the comments you gave=
.
I guess you responded to the RFC v1 patch but it somehow did not reach to m=
e,
probably. According to the lore archive, only Hans responded to the RFC v1 =
[1].
If this guess is correct, could you resend your comments on the RFC v1?

[1] https://lore.kernel.org/platform-driver-x86/20231201104759.949340-1-shi=
nichiro.kawasaki@wdc.com/=

