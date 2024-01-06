Return-Path: <linux-i2c+bounces-1169-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F379825D87
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jan 2024 02:03:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 279C91C23AAC
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jan 2024 01:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5043510F9;
	Sat,  6 Jan 2024 01:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="EpCFQRm9";
	dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="v8QKoP6D"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07701FB9;
	Sat,  6 Jan 2024 01:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1704502996; x=1736038996;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=fDdtoQKvMNPYKykCrW2L6REEg3qK6FvddlT+BPfUovc=;
  b=EpCFQRm9w1bVTdfaUvoEuOMacTXluEv+OVVYY7OV61hIujEpY7JfKF8z
   4AuyhXq1ljnPMCMWEy87ssTqUwqDFBNkAz08Lby9HAzA+VDHN8OHKKjun
   lJJseVhDOqCb1dyKwKYfG4CwKRnjMAQT10+aGcOsR/z3A06OG+TyzOt6t
   R6B6rImSjGGXOMQHHsc8N2YW9NR3dT0UW977UivVWjCk6MQ7eqUwmxBym
   AJmFrm29u49zIwtNAaAkvYbmIPqfFaKKlujdzQtJ70Mill6rErNl83OK2
   VyLRx4S+4BQ+0Xi31j/X+C5M1XK8gx2c2UKnvGvz9KFWy6WaHGyR7De+H
   g==;
X-CSE-ConnectionGUID: NbB/2YQLT1SAasL2Q4JDAg==
X-CSE-MsgGUID: pAmTp8k+Rmq0rfm1j5y70w==
X-IronPort-AV: E=Sophos;i="6.04,335,1695657600"; 
   d="scan'208";a="6493590"
Received: from mail-dm6nam11lp2168.outbound.protection.outlook.com (HELO NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.168])
  by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2024 09:03:09 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EjE7kizAlKnm6La2HmiYJdXACRZW+t7k+tYqoo6UjKBq3tYTNGrUZ+LMYFf3ERAbvlCvUEnJ4pRH358wP+Z+Mxk6XaTqYtgPrDGyXwsLSRZ37LmnvmFWhlNsm4lUbk2i12j5UrsRp8YAKgXIepSxSP0PV5o6vr2Gc+JKdpGGX60g9Z86onwH8N7WgYlpALYiFc2LoQRsmXm8sOa+xc1RbAkky2k8HMRT0xqvJ0N1txg01EPFqDrOx9mTJgrK1b6goPNmauSuhE0f5EVsz8c4wUZYz5GBHWBmhEr6VqpnInBkmPPv+0smOH7TlzZK+wHqKXmbQ9RxmWlwn9lzJzPOWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pn2iU7dYWMfsfoYwYOvQ7lLltE4IKK3tQI8SnypF65I=;
 b=hd19D+KCPfWM8s83Z4oECxhfLELRWNKKbzzSGXLza+qMrScf75ci7+oL3iDUu5jDisYE19vYHONoDqJt8PhGU1bTsUqSSbwVlwd7Gl6cLxBmVddOdMBDvrDupxMus5a0I+GjxZdGNPy8GVPoiiPt6w8vB5j9NkwgB7QQA8zVARuqtEZWSzHxfiDjq8UF0Cl8Tpv6gVyTK5z621lBEMHz4BR+ADqK4zYnokNtX2XC5LCxA8cuClru8JE/d13xByw21+nMw2LNQFz6j2f0rKxGypexpL9/gDce5psfZoQuNibpNfpNzdphw8ghLqH5GHzbu9Ew0GDk/hV3H3w4qvzG4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pn2iU7dYWMfsfoYwYOvQ7lLltE4IKK3tQI8SnypF65I=;
 b=v8QKoP6Dn68vMeecv8yxKD2lNtl9Y0FhAq0ZANbnzSmgEuHHsiaJMnXc+cIb++oNo5qJAovrToetJxgGH+0bJOnbgV7FqDyCI3OIe8Pd2uUL6dRZPosg0qnmfbK92QyfBHNV/FjReL9t/GwmjN7cr0DydztdyL71v4pGRxC+lmQ=
Received: from DM8PR04MB8037.namprd04.prod.outlook.com (2603:10b6:8:f::6) by
 DS0PR04MB8697.namprd04.prod.outlook.com (2603:10b6:8:12d::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7159.16; Sat, 6 Jan 2024 01:03:08 +0000
Received: from DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::81a9:5f87:e955:16b4]) by DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::81a9:5f87:e955:16b4%3]) with mapi id 15.20.7159.015; Sat, 6 Jan 2024
 01:03:07 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Klara Modin <klarasmodin@gmail.com>
CC: Lukas Wunner <lukas@wunner.de>, "andriy.shevchenko@linux.intel.com"
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
Thread-Index:
 AQHaPow80BKhEPvQJ0yVwJLvsqPQE7DJVoSAgABBoYCAAUomAIAAB4QAgAAcSwCAABYzgIAA3tKA
Date: Sat, 6 Jan 2024 01:03:07 +0000
Message-ID: <h4ok2zbyijoe7fi6h26j3r4qzuwhspwkuyyc3w26buxx7f567a@7ikkcpifi2y2>
References:
 <CABq1_vjfyp_B-f4LAL6pg394bP6nDFyvg110TOLHHb0x4aCPeg@mail.gmail.com>
 <oe4cs5ptinmmdaxv6xa524whc7bppfqa7ern5jzc3aca5nffpm@xbmv34mjjxvv>
 <20240104123621.GA4876@wunner.de>
 <b565j7nbqu67pjhjw6ei7i3nkazazirl4dyxhaem3z7ghii3gs@dngmvjcylrjp>
 <20240105084454.GA28978@wunner.de>
 <4fjboeaslgcgjtkwemog5qrbbfnew4qcsoyrqbxmt3icesiint@plrjgqxt7naw>
 <CABq1_vjp3fRWC4HJfG+1VyhYYcQG9tJVvj_LCRQ7nBtTLs8fLA@mail.gmail.com>
In-Reply-To:
 <CABq1_vjp3fRWC4HJfG+1VyhYYcQG9tJVvj_LCRQ7nBtTLs8fLA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR04MB8037:EE_|DS0PR04MB8697:EE_
x-ms-office365-filtering-correlation-id: ea327a15-2b49-4b11-03c3-08dc0e533ec4
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Ydex2+ew0PgyTFeHNbFXno+OiTLgoTdEdjstBC1t86b26kxeFrWdCZgqqnM+QuEOKnTbqUlEV72R+XC4qu+I+cifQAcVhT0GXPpcgf0c8lwvqbcxveo0eHVTey1aIxY/QmwJpvgj0YnbB8mqSPCY7TCD2/bXiBxsN3c+lijBGLgcACvwN+txybJ+u2WEmzMoy3B6zbVuRYHwvkhBnVBTtD6f65xJLXnWtiO5hYRIB0aU5aytgGsNBamFJBdU406gjN7HLvdZ9TvDWKwfw1EoN5zquHCwktDBGtrbZm1N/GUDe4MKMskODwh20iwNgyya4SjV7c4wlkYGUWMJurt7UFNb3EVdUHw8oYJruHdzb7KhNX9bf7yCLQ/eHRMRJW/2WC8aZ8VvfQW+zoyEPMvKlxixLBG/yzBcJKE03jONp8c3pfCu9PXEsFVlD2MfLEZizVhTW5NkhU/fYbn8POo6n7TZM0CQ7xgSWToUGel26SDhEVsB4q97/uIQOaz2bXm35ouke2iSJKHbZrF05iOv875oT+ju6citnFDNDUPtj/EGu0xoILB7WcYhvC/y43r/eY8S4n4dNn1Ac5pQkpm6ejTKaeM3pHKx+hsPlwDuZ/B/65u1PhvJw5SrTA71NqZt
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR04MB8037.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(376002)(366004)(346002)(396003)(39860400002)(136003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(9686003)(26005)(38100700002)(122000001)(5660300002)(316002)(8676002)(6512007)(4326008)(64756008)(66556008)(6486002)(6916009)(66476007)(66446008)(6506007)(2906002)(8936002)(71200400001)(44832011)(478600001)(54906003)(33716001)(91956017)(41300700001)(76116006)(66946007)(82960400001)(86362001)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?E2oBnn8u5CA8vp/4hxGcaO7hAj99BrsrwJ04f5iwhF4dkmFr57NZpxIdf+Rg?=
 =?us-ascii?Q?PX6SH9dgrEaVhDIS21i7tEbszEGgTV2j+1Mg2hRrOupRI/F7oj11v0i2F7+t?=
 =?us-ascii?Q?YVKSEpj21NK/ikOUSO/8/DM/W8wi74awrn1ivmwm2dWlvx9MvRpdpQOj2NPO?=
 =?us-ascii?Q?vu7kxUT6ECH9sJTHxQ/GHmOC5N19YwgR8tgYlPx9BR1NDumEr1rv50BC3cPj?=
 =?us-ascii?Q?Ejgwpem64XojIfK857ojn7V6R/3kArIFD8PTyNBPBgCrftquTtdvL3J4GpH6?=
 =?us-ascii?Q?QFOudKe+Lpm628EJ5fdibrwKlWbb/4UEkANW8xK8QZHRV1XP+SLN8aP5j9i6?=
 =?us-ascii?Q?Ol7YEVfWFv2I80vnA/7Ix3wEhnCfrPJ8tWJS0YCpEYNXsStdDQy7aWbGdHIS?=
 =?us-ascii?Q?1R3xDSsSu5RNfuBOu0VEjSqvotigSRXzsJPj3uNQLBX2oeI7Znqed0vfRDxe?=
 =?us-ascii?Q?9PXX7coS/CcDKUSIJ4dPC7CLZbRZi+SMf1+uddd+Ioe0NvjKmaEBv+90QVGq?=
 =?us-ascii?Q?XpzIQTQJk9D0NIQIg9dQB5oBRs2TD8zDMLIrBK9X6Z93LnWPgvBpmdzoCeAM?=
 =?us-ascii?Q?PZFaKYaYMOsZfPIOl0F5J7jP4KULwINWYFbvTqf1n0Y0pQsOA/jlbt9V5ed6?=
 =?us-ascii?Q?V4LGrm54/nykJ57IyP0RYg7euOr/s2CppnSc/hOQIVQjvkn2IeYftY4Ln6E/?=
 =?us-ascii?Q?Hd3is7aO2UewlGRVLNzP+k+mBC7d8tk7DV9dM/ksjglO2OTGXk+DyhPg25lu?=
 =?us-ascii?Q?oL1S3bTi9CmT9/H+X8ISUrSRwYcLTs+t5Dt7EuVoMEloOzw25xEp37aiOghE?=
 =?us-ascii?Q?ZQ7goqeKuyCmfgPE3+JuJwWJywxRSemnttUcIPa4j4W3NDMYJIFrZz9ytekA?=
 =?us-ascii?Q?SnGoxresbF8vtxbX1tXuBbn043xWbXPafJR/6WTa5twlpzVQ/AtNnye1SpL8?=
 =?us-ascii?Q?MXUHZDLiV0L4ifMODPKKSdCfhYApkNLtiurjPlsKIoaq8MazC0g/V46yNVHn?=
 =?us-ascii?Q?t9TxnSqFYpmgNg87foeVB5lf7Vha9x0JC0j1oKhtuOcBP7u1/3hS3/qS6MwU?=
 =?us-ascii?Q?IAy7dahWwxE+TLhpmVgXggGKmd3zMcfERQMTUd/gOGAaspzxW0XWwmQchuzz?=
 =?us-ascii?Q?iN+70D5dq9D6IPhTD6+A9AyZFG+b8FFyxF23LA8qNRqudMnmez6D4lsQXbqK?=
 =?us-ascii?Q?BIWVQdvQenebJQVMwSRxITeNVAkoeJCLKRi7DKMUq60fzI3WypF8K3iQZOqF?=
 =?us-ascii?Q?Z5VPysBgpDyM1AWYr7NhjUSPHceyuptBmLuuHjiAyQuXpXW7a5Cu2NB7dtge?=
 =?us-ascii?Q?Ep0S8V6rFmTd3kkkout3cHu2wPA8I20CtHrWDaZSEDPVytipH2+NKCRkyUyS?=
 =?us-ascii?Q?NEobC4e3s+78WDFwiDpAZhcpMkMtozeI3BQhGqQ+r6MRJV0+feXGrh940lO8?=
 =?us-ascii?Q?Zzlu5aSw0Zp2aikmnqUoF9EQldvRYQNRNCL2kBuowKVp1mfxLjDUOTMhdOpg?=
 =?us-ascii?Q?F7Tj2l0SaEMSGuI6pmtPyr7KMForjSmP79vexxrhJWifdJ6eDKQNRQ6pcybp?=
 =?us-ascii?Q?bmjoSUg9UKAjRhkt9qG3hYZ0LhhUqfEGsmidv0ZFmF09sxC+J+dIeWucuJjA?=
 =?us-ascii?Q?TRXeTbid5k+xiAfp6pc/RbY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C446C87554D26D4AA623742ABDD81740@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gjUOVV7QWdip3kYR6zgHpE9wstD4XE8zn6VDtAJhru4JkckJk8qY0rg4P4foMg9WWkzQI4cF0g0gG7M1KTJ+CqIhrO0QeQRtwxXTXTN4Pla65YRWZBMkYjQHhAM20zsUSXMV4r0EGeeq+177iKvWAd5QDw0ZTSzyFlotRZoBPbOzkI8xE6TUKLQWEcxxXgM7NLVUFdhRidpgVWe1Iw3IuRX0jq2BAsn/DlJRxInNCuJLHUbWy/R6Dl6YCWnb9LpsTcGOu3fMZku5B0l93NJjpvxbYeTs5edRbZaLrER4zrVP41j0hoRk160s9QiDLBFdjM/ktjkqG50neVAyhwzeYiMAZeHwGoo5R7ukeiqMYJIbfLBQT760i8OzaTJ8EzP/b+ou52DlyiDeKnfzrZz5V3I9C8FSNaLAEoAaEBGXGIb/nv7JeToofiJzhYgCxKA3wJhvMuWVD30tu0yQfOw1/qU6koIWt4rvRtYjLRWMvYlMa13vc7LTPtbZgSCETy7kVZCEk+MD2CZ6NrnCJicUHuYxFEYgwl9l0KbJW0W8JeVAvwzl3Tzlerfwx9kb/5nTNYDh6G5QeqR3+EelXSEKQFvqr+lAHg7nxslYDZPE1LYNzEKv7dduFtTYI9tlYlb1
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8037.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea327a15-2b49-4b11-03c3-08dc0e533ec4
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2024 01:03:07.7334
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6MFnIhlkDyTjzrZnzR38ORFdO70PYv+oivKkzmTO6dQN6SlLRs/k6ZTVWyLgw71oyF/L05Kt1ApKL/kyVWwKihRjJ7IHSaiXv4J9GUqn8so=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR04MB8697

On Jan 05, 2024 / 12:45, Klara Modin wrote:
> Den fre 5 jan. 2024 kl 11:26 skrev Shinichiro Kawasaki
> <shinichiro.kawasaki@wdc.com>:
> >
> > On Jan 05, 2024 / 09:44, Lukas Wunner wrote:
> > > On Fri, Jan 05, 2024 at 08:18:05AM +0000, Shinichiro Kawasaki wrote:
> > > > --- a/drivers/platform/x86/p2sb.c
> > > > +++ b/drivers/platform/x86/p2sb.c
> > > > @@ -150,6 +153,14 @@ static int p2sb_cache_resources(void)
> > > >     if (!bus)
> > > >             return -ENODEV;
> > > >
> > > > +   /*
> > > > +    * When a device with same devfn exists and it is not P2SB, do =
not
> > > > +    * touch it.
> > > > +    */
> > > > +   pci_bus_read_config_dword(bus, devfn_p2sb, PCI_CLASS_REVISION, =
&class);
> > > > +   if (!PCI_POSSIBLE_ERROR(class) && class >> 8 !=3D P2SB_CLASS_CO=
DE)
> > > > +           return -ENODEV;
> > > > +
> > >
> > > The function should probably return if PCI_POSSIBLE_ERROR() is true.
> >
> > At this point, the P2SB device can be still hidden and PCI_POSSIBLE_ERR=
OR() can
> > be true. In that case, the function should not return.
> >
> > > Also I think you can use PCI_CLASS_MEMORY_OTHER, so how about:
> > >
> > >       if (PCI_POSSIBLE_ERROR(class) || class >> 16 !=3D PCI_CLASS_MEM=
ORY_OTHER)
> > >               return -ENODEV;
> > >
> > > Can alternatively use "class >> 8 !=3D PCI_CLASS_MEMORY_OTHER << 8" i=
f you
> > > want to ensure the lowest byte is 0x00.
> >
> > Thanks, it looks the better to use PCI_CLASS_MEMORY_OTHER. Will reflect=
 it when
> > I create the formal fix patch.
>=20
> Both of the variants seem to work for me.
>=20
> I tried the first patch on its own (059b825c5234), with
>        if (!PCI_POSSIBLE_ERROR(class) && class >> 8 !=3D P2SB_CLASS_CODE)
>                return -ENODEV;
>=20
> Then Lukas' suggestion (b97584391ea7), with
>         if (PCI_POSSIBLE_ERROR(class) || class >> 16 !=3D PCI_CLASS_MEMOR=
Y_OTHER)
>                 return -ENODEV;
>=20
> Tested-by: Klara Modin <klarasmodin@gmail.com>

Thank you for trying it out. This fix approach looks good :) I will create =
a
formal patch next week for review.=

