Return-Path: <linux-i2c+bounces-1138-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A941A8251E6
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 11:26:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3793A1F22257
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 10:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8F07250E1;
	Fri,  5 Jan 2024 10:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="PVZybYpi";
	dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="frme2yJu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A290A28DB7;
	Fri,  5 Jan 2024 10:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1704450380; x=1735986380;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=TObxLOhc3bm3HU6e2rY78kqE9DNS905LStr+CPSxuKs=;
  b=PVZybYpiWChec0X2YXXJoOrtWaSPexZywTeEbg4axeGBkEQdh5xLVYSF
   RXdTFdgghfu8743gU3M/HSC3Nx2hV/Bzmi2BxMFMQ/yU1E7FTCqARILBZ
   El7hWAPeyDfV0pnlXctPsPGyW/BBZc6zlgSoKj2UeVyzfpJHuZnWr2W6+
   3YOAW20W2FxxBFwkBmFYCD+yVh0H2CfnXG5jcn782un6T/oglLCauN5mF
   sXaUmHKfYbgDTJYi1WjNFShH5jnnE9GsBA9I7Eaw2NXxhuVksbztHEtiQ
   Ua10CNjYdgpTfaUxc8NWDV9fKBZjeH0LQt8f4SxZWeXgqczxenZFjjP/w
   A==;
X-CSE-ConnectionGUID: KbUSeXzWRPOQjhDOufJytg==
X-CSE-MsgGUID: PyHN7D3pR9mYLYqxFiweyg==
X-IronPort-AV: E=Sophos;i="6.04,333,1695657600"; 
   d="scan'208";a="6221861"
Received: from mail-bn8nam04lp2040.outbound.protection.outlook.com (HELO NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.40])
  by ob1.hgst.iphmx.com with ESMTP; 05 Jan 2024 18:26:13 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kdp5dcW1V9+7SaDdv0e253OQMkWQCDyOSMECJIHIeryXnrbZdBRLUTSs142livaRMhtI2BwrT3HyKNklErBkhlNKeNKP/tLp2EZ3wOuWtu7kvOzg9x7s6Gpx2H1pyd8wF8ZiO+bgLipbtZiXh0IUIhfhb3xFqg5d1ztmANdhk43hS2VYsT5F9L7JB7xrVdfHrP+30AGx/XdvfQYEyWjOFsu2Jq4RWrgUKsKHwUve2mP16trPsCQGW8VtvPzl14w9SOqM9WABV9Y8L5DqL4e8CvxBhAu/VJ1XNUfJv6b6F3AiSXDsZIuTmTLuUZLXKQAhy7d2nZOKQmnVSoJGsDQCYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=etv1zRds9PCLdk327mqG2Fbz35iUUydxTRJewxNdv54=;
 b=CTU6oANgrFcHzv+4UfwygeQQauZRwF1wl5eVLtYppi2gNn0R4wHzFaQzPRqfqSmTye/CpQjdkMzjsbK9EAoNmgBx2/fmW5/VSRvjJ/5V+a457ZjaZwupQ9NvmroL7AryJdDTabb/n4eRaAB7s6Itz9/ggp39dYzoyN+bA19DIDX4jCkaHDU2aoSNlqxqgNLMeU2IPJuiFV6TjEZb1ZBgE9TUlB1CwmzASaA27FNVi2vmh+F7v5jUckrR6GUzkF/RjUJvzGkGlE7yAtiBpebKrgoVDShUkoa3TLTsQ/t4G2TuhpdJETX68j2Ow7mwXEiMniE74Tloe9jaXE8OjG8kOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=etv1zRds9PCLdk327mqG2Fbz35iUUydxTRJewxNdv54=;
 b=frme2yJu1K2mIDCyzr2JnOvOEsj5E4OUP4LiKK/uQvP3YCVYk6EWYCd3Ukz0OIM5aMm/6cg+FOFPNNf5B4JKb8AQzetmwOe9gb9xillyc9LZtfRhqFwcayPBeP9YR3Bnd3K5DTz2M3mUb61NnLc+CcBriEb/rhQvvKkds40OidE=
Received: from DM8PR04MB8037.namprd04.prod.outlook.com (2603:10b6:8:f::6) by
 DM6PR04MB6592.namprd04.prod.outlook.com (2603:10b6:5:1bf::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7159.17; Fri, 5 Jan 2024 10:26:10 +0000
Received: from DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::81a9:5f87:e955:16b4]) by DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::81a9:5f87:e955:16b4%3]) with mapi id 15.20.7159.015; Fri, 5 Jan 2024
 10:26:10 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Lukas Wunner <lukas@wunner.de>
CC: Klara Modin <klarasmodin@gmail.com>, "andriy.shevchenko@linux.intel.com"
	<andriy.shevchenko@linux.intel.com>, "hdegoede@redhat.com"
	<hdegoede@redhat.com>, "ilpo.jarvinen@linux.intel.com"
	<ilpo.jarvinen@linux.intel.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH v5 1/2] platform/x86: p2sb: Allow p2sb_bar() calls during
 PCI device probe
Thread-Topic: [PATCH v5 1/2] platform/x86: p2sb: Allow p2sb_bar() calls during
 PCI device probe
Thread-Index: AQHaPow80BKhEPvQJ0yVwJLvsqPQE7DJVoSAgABBoYCAAUomAIAAB4QAgAAcSwA=
Date: Fri, 5 Jan 2024 10:26:10 +0000
Message-ID: <4fjboeaslgcgjtkwemog5qrbbfnew4qcsoyrqbxmt3icesiint@plrjgqxt7naw>
References:
 <CABq1_vjfyp_B-f4LAL6pg394bP6nDFyvg110TOLHHb0x4aCPeg@mail.gmail.com>
 <oe4cs5ptinmmdaxv6xa524whc7bppfqa7ern5jzc3aca5nffpm@xbmv34mjjxvv>
 <20240104123621.GA4876@wunner.de>
 <b565j7nbqu67pjhjw6ei7i3nkazazirl4dyxhaem3z7ghii3gs@dngmvjcylrjp>
 <20240105084454.GA28978@wunner.de>
In-Reply-To: <20240105084454.GA28978@wunner.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR04MB8037:EE_|DM6PR04MB6592:EE_
x-ms-office365-filtering-correlation-id: b0e02740-fd44-4c5b-d1a2-08dc0dd8bc76
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 4YHVXguFZB44lvORR2hFWXZYTxizbSadVO9zyMbNZqOMcE5ob58IpRolhf5/cE5yVQ8hMNljiQm3a5/q1gW21Cezj1GEawRwDV7zakxOpI+Czux6z2XYSR6UL6Fgc7+7E3H9ZFiXMm32p7IcNvp3dytp/EZNM4HrYMM/59bvHamh7GE7F5WKDz5/gkYpd3Typsow1v9NCaCSkz7m7Y1yXZEFfCi9FrzmUWOiLh7EfH3lRzHEvQtkUQ7AXkE2kAiEg/6hf9dUi8qCcuODIP9hWz3EMMYDNrj5de2T12rEsnOjB1uuyacSziq1FDlLpVLlWwLPFzIDDj0EXTb2EEHmoOW/Oz6yt+EAyTyzMUTPs4dAnyoAFf/UeLM4wKy97m2WBICb968eOq68HCIlVWc5GNqzGXy/XheogteB/sjbanzTYR7yhTwacuZFzorQJ3qtiBJ27kUGyZgMfEX8TEs+hCMgUjcdMCO+dNb9UvV27kgDYt3jKrldtm9yvVY6WOfK2TRU8oyxnS1g3mJ/MlIEk4uOreNZnGQ5kRSBPF9YYDdE4m/hTdQxKP5r6bTvp+Yn1c+Zze0d6smd237Gw7L8s0IJlrU4V3ov2GnH0UlAMLNMRLPPSYKbjcwQVduU6Nx7
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR04MB8037.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(39860400002)(396003)(376002)(366004)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(66946007)(64756008)(66446008)(66556008)(8936002)(8676002)(6916009)(66476007)(82960400001)(91956017)(76116006)(316002)(54906003)(5660300002)(86362001)(2906002)(33716001)(41300700001)(38070700009)(4326008)(44832011)(6506007)(71200400001)(9686003)(6512007)(26005)(122000001)(6486002)(38100700002)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?0p3MLRUIc7wbKUJZVVPo8AlpAiA+MEoWDYm5cl7s7avZ3kC6oSniSeGAuC7P?=
 =?us-ascii?Q?YTo2YczrDNpD82zsJmmV+C2aFsLb6hwZYhGslvQz3JwcYAWTy88GUb29qzxb?=
 =?us-ascii?Q?9jukItfd9tcUxKe+/K+ed+AmIqT+lrQigCSmVGBW+2OiSxpHjdGPyQn525g0?=
 =?us-ascii?Q?y7q/HL6XA7hbb5nAmMwP7BRkHrDfJzvOaQIEr9IVe4FaoEhbQEGIeQRhbbkT?=
 =?us-ascii?Q?3pHSiXBTGYmdzSQow5/43omEtJeSy/kK7HfZ2SMqZqc1VsXxHUWnR7Rj0SlQ?=
 =?us-ascii?Q?THEnm1Qrg4y/TVE3eQVR0WknY+mCmG2hubH7Dlci66acXsAiYqKdGtifWXtY?=
 =?us-ascii?Q?v3okay8X9u8FcyvlwnhbHVrbKOMS8SopvOD/NpJ3YfC3BRcwaEtfQDnY/onP?=
 =?us-ascii?Q?w0ICgHx6sOb71QJdhHo3PlbKxsN3oYbchjlbKAM1bMpeqmPv6dl42x62LoTa?=
 =?us-ascii?Q?jr6ztDPw5OscnvVBQmSQmbOPU/zFvzsYaYo1bGj6/T1qLF5/Y5V7qtJeSyVq?=
 =?us-ascii?Q?jyZRbpG+Z0uMUdxT6205UdDjaVcuqGkN1oyly3mT4jlfSat+5FBVeQ00VcMo?=
 =?us-ascii?Q?VrriqPx+ORpxARfsn0eVScOiS8vZrn9wnkaYNIHC+nvCB4CbPxaKEGlYBXiX?=
 =?us-ascii?Q?qYCvN2/HI0KiCVdRUHNZT5WEB5XtrAvS2LA5egXFMfiE8NkGIJjCdHXl2+uL?=
 =?us-ascii?Q?zqL7PShMO8adycUnWjKqG/mDuWsq01omEDhvqzDTCFJNHakLdoV8pw1W5Buf?=
 =?us-ascii?Q?3dvHojAXwDJLe4N5J/3w+i8SDQQsDY38nE6OICPekSgdkeUDSgyg2DCRzmqy?=
 =?us-ascii?Q?KFKk9rI6lBxpzwehhmlUbEGOra/TsgZ2VgSKLqKP8cbVtkTiUy+2acHCQea7?=
 =?us-ascii?Q?o/HAf5iXTVw/ElWHpBxzpaqQBvYibwnxtDGN14MDZpnBSzmORYiK1MMeledF?=
 =?us-ascii?Q?yrizWTgYAIvkhGo7UegJHHgsnV9fVlrY8+jAf2zxwF62gTCgBctkMlplrRoI?=
 =?us-ascii?Q?QXCtRmQX0H+rhVsFkwf7DCLYncAy4CLQehgdqb03wyQKA1DDLGm9OBTeuF7O?=
 =?us-ascii?Q?HrQFgVngHmLAfqB2Ex8IRpNtXXFvJuwpy/RBQp7TyED23I6l/CNiehy0LJ3S?=
 =?us-ascii?Q?SsTw+pB/2ATd4D40/qnjeuuArUiWzkJxca7vjk9zET+9NNEn7PRjuzp28us6?=
 =?us-ascii?Q?6NGRPwW+EOpa9gWz0nv3S6BUKKErw2xFZNGkRyA8K1H2PRsI7tkt8I/zr23f?=
 =?us-ascii?Q?flsq2BNNjNgS/faKxMvQq2yWpWQHMPl540GU8pomkWXoJLyi/8omXGlOpolV?=
 =?us-ascii?Q?Tq2bfoEMZMxJSR9MT8MlIWmwiNRqkYifkUd5Fs0XscPj26VRruub/4E1gTdv?=
 =?us-ascii?Q?tuRadAZgrgm7KRBUtpufaUXTYGyezTMZNsPSiZtRjGZAYyqr6IY+8iiCtnQd?=
 =?us-ascii?Q?oKEK2gHj6pRHaUnHRb/YRZ92MpUHxAhyYjYHjV6j6fz0/tE9WDWMvGSvVs4Y?=
 =?us-ascii?Q?28BQ5qZ3TtcY8eYj7sz40OqzurjkCZg2RMUxyY/CG5f/y7Akr1cdgSILe7+o?=
 =?us-ascii?Q?Hrnk8Kw/MrczmLPjknweXpRn0q6Ab0pjtsTAQHsei7cFZ7WbhbRYqQvUGNDF?=
 =?us-ascii?Q?I53bdl9DyMBC/h3i/ZL9Z7I=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DCB9C6E25DBBA148BFFD4DEAF6A822FA@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WHdV+q6qVMuevj2xhqdd4RBAQMyuFDfQwvRRabPAKxZxFNw9Gqjm0FT1ylNcgCtJ7VlmVfXIAB9A2khWAZHW1erUJUAP9tSNNb/qHy7gkpxv7MEg/Yz0ojlcn8CgBM67iWEcSIO4Yi5M0G8qRhZWNooLA5N6TPsFaHereFyp1Pn2kXXMSYTp8kYXPZicx3WRx5IcuJxuIP1DXUz9Gs7ya8P7sbTJTq+lb2dUTfAzLaMSVV2H2N9dQQnnzILcje591ySDz/r6MwT6/GgCM/IBAIwpY9+qZ9YSbs2HVgcSxoDV30qbjy+yw/mZn84JELabl2+FH2pkB+Us7LUwy2Enm8odLvJKBE25TErjJLq1K6YIu1AzVmZUTnfGQm/LtkRL0VSBxudIRLqzI97clBBGANxF/390iChnakrOs98MVRrH0G6/imyECXuztlBXiVSshOj75cBb/Rk6LagkfZYmG+ynJd9ND7CBOjiTx64kmn+gb460hAhIrNl3e8lBh9o22p8leOuVyE8gcC/xTYSmLnOzdv/mtgKBprb1cmzlKj/9mLswdCJsGuvXMCH3mZiReWZqmMuTYB8EwA6l09V82+FXduBc3ggY9WiS1AvZ8AsOrMayql/NlTXdFgxw8VH/
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8037.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e02740-fd44-4c5b-d1a2-08dc0dd8bc76
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2024 10:26:10.5274
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v+lTJJjT8ekB4+WwawjwcvE5iNPoUn7aL+8dNi1h6Xw294FawgYmatLNnAKRX7v2MLBHiZGHGseiPvXXEG+WVJJcOYuqOSDLzOegKo2S+Uk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6592

On Jan 05, 2024 / 09:44, Lukas Wunner wrote:
> On Fri, Jan 05, 2024 at 08:18:05AM +0000, Shinichiro Kawasaki wrote:
> > --- a/drivers/platform/x86/p2sb.c
> > +++ b/drivers/platform/x86/p2sb.c
> > @@ -150,6 +153,14 @@ static int p2sb_cache_resources(void)
> >  	if (!bus)
> >  		return -ENODEV;
> > =20
> > +	/*
> > +	 * When a device with same devfn exists and it is not P2SB, do not
> > +	 * touch it.
> > +	 */
> > +	pci_bus_read_config_dword(bus, devfn_p2sb, PCI_CLASS_REVISION, &class=
);
> > +	if (!PCI_POSSIBLE_ERROR(class) && class >> 8 !=3D P2SB_CLASS_CODE)
> > +		return -ENODEV;
> > +
>=20
> The function should probably return if PCI_POSSIBLE_ERROR() is true.

At this point, the P2SB device can be still hidden and PCI_POSSIBLE_ERROR()=
 can
be true. In that case, the function should not return.

> Also I think you can use PCI_CLASS_MEMORY_OTHER, so how about:
>=20
> 	if (PCI_POSSIBLE_ERROR(class) || class >> 16 !=3D PCI_CLASS_MEMORY_OTHER=
)
> 		return -ENODEV;
>=20
> Can alternatively use "class >> 8 !=3D PCI_CLASS_MEMORY_OTHER << 8" if yo=
u
> want to ensure the lowest byte is 0x00.

Thanks, it looks the better to use PCI_CLASS_MEMORY_OTHER. Will reflect it =
when
I create the formal fix patch.=

