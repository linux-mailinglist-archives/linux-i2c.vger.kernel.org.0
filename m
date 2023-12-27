Return-Path: <linux-i2c+bounces-1007-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9869E81EB2A
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Dec 2023 02:09:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08ADD1F22B87
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Dec 2023 01:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D3E1876;
	Wed, 27 Dec 2023 01:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="dMJqB3qE";
	dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="H75g1bdN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB3B1FA5;
	Wed, 27 Dec 2023 01:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1703639352; x=1735175352;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=azq3ZFWcayKvneWKasEpYeJA7DtWVIeXsDw7yH48z4g=;
  b=dMJqB3qEgUP6l3D9Xs9VWV3CDljo7mmQjbVv6f3sal5+DyP8y+DG5v/a
   +KeZXsYVyrKIo4uh5voJsWhLfclOzvjCrjz+VbjpC20e33HRNODBeWwv0
   7IpEQsEq70ErG8g6lR+U3aKm3VIDP025dgLVWX7Ommr6HNdXpFD291+Wf
   P/0guOVyj2VkzLdAnJy+f9xbvs8W3aj6dK4sTPnTS6a/uSyleY+QOkhK2
   RaxUh55sZhx1odVi4w4zq+PmUJm1r747bOyzzAKBUaMUR7winpjA/N8TY
   J+v5qVhhUaD40+KLoWOoGli8yWpTD/FrFOy97lq+ro+CdKrRCVrFg7NrU
   A==;
X-CSE-ConnectionGUID: hd8yGxsvRxG1JqT5uauhFw==
X-CSE-MsgGUID: ia+JG01KSJ6fIxALNziA7A==
X-IronPort-AV: E=Sophos;i="6.04,307,1695657600"; 
   d="scan'208";a="5497751"
Received: from mail-dm3nam02lp2040.outbound.protection.outlook.com (HELO NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.40])
  by ob1.hgst.iphmx.com with ESMTP; 27 Dec 2023 09:09:05 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a/asiGmVdGQL6iuICtIq4aYTljf8za59T5xZBTEPGUNhNKeBZQUN3KLplHhwyRofKt/jFhIenZH6btSEP3Zgg+l0zsdGKO0O6fLsd35o5HF8AzHv7MQhsnaPvFU9wcs0Cv+CBD6a8KooMs9Ye9SRJggKJlQwOcB7CuPQxAvEEdGsGi5xX43fXNL0NVTqShzHIkOSz3slBfD18t3AKz0K8pYi4qpdP6uaAwqzyD+yRJC+JwejvCrLhx0/GAKoYMN1qAhFxIxaL3xeqPTFdsuLAQxlnaPFKbkHu+gtQXKGDTSNhr8IFutBBQF/x2YMdYAE8A9wkZJsdWUUOZx8qKdqBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=39R19NaJ6BW6vdt33wRS7WJoEQjX5Rnd0m4EuJdyWk0=;
 b=AXVd+s+LYEs/Uk68Ck3orc8ZndYzd6ks7mMNTjSLmC+nV8gZRqDeWwfBgyVMOw2cmUVrdjqk1+6FSAY/z5aDyYuIKwbuO8PU6wNaOloY9qOO4667EnMJCmX42DMuIU0LCJBVioTUpRhgZO536sA9Fc+NxJSyue6qGTb7XFF6Kf+9vyZtARuTI2Vn7+C2HjZKOt2dNCR3MW7hp7Z4Vs1w5sx8M20VgE9oc1bXie/1ucR3GKlHWSEzKNqPFtpaUKOeoHyhZhii+BXOkbdqxVIdPbp8e9rRp2JtkjEGESEyRI4XHgygL8Cg2eiuNgfkA2dquNSCKjK2Xy9A+ZkwVUDqQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39R19NaJ6BW6vdt33wRS7WJoEQjX5Rnd0m4EuJdyWk0=;
 b=H75g1bdNyNoIVGwoYye2gO4d5T7pgKZhsNZXvLFSxGyJFM2dEBz6YGym0wa0cgAhqvpXYenb9OdQ6eYl0ftWgIJKePh/STFifxU95xbwHhs9qUwCFDmDLja7fkDIh4QWhMgwATwAic76sOL0g91R7w+INK5WjInu20F33ePCo7o=
Received: from DM8PR04MB8037.namprd04.prod.outlook.com (2603:10b6:8:f::6) by
 DM6PR04MB6732.namprd04.prod.outlook.com (2603:10b6:5:1::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7113.27; Wed, 27 Dec 2023 01:09:03 +0000
Received: from DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::81a9:5f87:e955:16b4]) by DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::81a9:5f87:e955:16b4%3]) with mapi id 15.20.7113.027; Wed, 27 Dec 2023
 01:09:03 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>,
	=?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Lukas Wunner
	<lukas@wunner.de>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v3] platform/x86: p2sb: Allow p2sb_bar() calls during PCI
 device probe
Thread-Topic: [PATCH v3] platform/x86: p2sb: Allow p2sb_bar() calls during PCI
 device probe
Thread-Index: AQHaNxSFjOE5Voi8W02MRbquribI8LC8SuAAgAAJhQA=
Date: Wed, 27 Dec 2023 01:09:03 +0000
Message-ID: <u6v2mm6ncifgretsozi4kad2rlbz5zo3bdz4uexwkuvjyigbaf@betyniztbojq>
References: <20231225092656.2153894-1-shinichiro.kawasaki@wdc.com>
 <20231227003458.GA1485669@bhelgaas>
In-Reply-To: <20231227003458.GA1485669@bhelgaas>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR04MB8037:EE_|DM6PR04MB6732:EE_
x-ms-office365-filtering-correlation-id: 6f8a4dfd-e925-4293-2c38-08dc06786aa1
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 SvoxVy2xSBWhwDLe1WwZGcxSbto9g54xFSxVefFl0KhsnDtCCKFN0p6Yg8GVtbt7hqwzHXtG6Y/YKodB+uTK5dnz177C9W3IcMQiiuTIxy4T/R//ygGwyBDzBoCGotm8VqAaDAnMb+IWLn6VB064wT+ERISViZ5Xy3ILUBTH+uwdkP2OZ0GlcMg4OAESsyLar43GL7c01E+pOKJzr1ljjfRXxMVbLQbmCfP5No4utBsuiO6DKJM6i+A2ZNGjCCb88LPFbiB03DUnR7Y6m50CeL+uxnQX2UxvtzdKsIV4aq47zXvnHF3g6GB6KpA+pqnYy84wPcMEoj2S4wgEIA7MaRn91ei2lDFZ9ecf6iAawY8vOdyGoOYNezT91wQn32ilehR0mYAmDR5ZFeN+a4k4hlmqoiQvatzJnMt7gezA6oNzWxqNfFQ24ypddZEj0DjIdwrVGP6DuUYid6nRzxPOuuQtJitkDMu5FLOZzajVu7D/6L9JWmsLYoF7KbgYomAfoYP3Y8Tp004Cz3pU6zoa8AU5CYNnqF6Pm9URJAbebh/9mkAOXcif8cPDBbyEAmkFW8YHxvov7yPRbFxWYs5RdYbp+ATH8xNoVMaqEZIF6wPC8HYGXsAXvnw0cJhmEvsrUbqtzwjm9FSeWeRi1ia1AQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR04MB8037.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(376002)(396003)(39860400002)(136003)(346002)(366004)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(316002)(8936002)(8676002)(71200400001)(6486002)(478600001)(86362001)(6506007)(6512007)(26005)(9686003)(82960400001)(122000001)(38070700009)(38100700002)(33716001)(41300700001)(54906003)(91956017)(6916009)(66946007)(64756008)(66556008)(66446008)(76116006)(66476007)(44832011)(5660300002)(2906002)(4326008)(27256008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?vAhOIAnhcDI5TTXpkmVbaHfZdExtUEtMbn+tMQPMcKVrqWwJxdi9tWcBL7?=
 =?iso-8859-1?Q?t+zsrvp9DT/ep90oXmu0+2KAPfxnoSKYgyihBiiSKjbMWxetCuMqIQVD8u?=
 =?iso-8859-1?Q?8M5uFgx1engn1cQem6QgHQ9JI2jstN2dQDOc2SknCeDX7VHu8hSYXLyDyp?=
 =?iso-8859-1?Q?bOx42qTLN8wrUV231iOvnO479jcdaAyaKkPBzSw2EveUoYVEYB/H0zxicM?=
 =?iso-8859-1?Q?i9GM3MXrQvTT4Uvnp7QQcjpZ+FyxyAMfldpg4MtQWpLRz5BDEmigIjG85l?=
 =?iso-8859-1?Q?uuGhHryu9pgmw+g1QEZQhWW+PFvpR0+EPFw9IdyAhpkTaywmRf86zyN+OI?=
 =?iso-8859-1?Q?RYljCdnwasLCRDAyS+3IerBPpgj2OnAXJ1p51nYisxsZGh+qDlYYnyNQHy?=
 =?iso-8859-1?Q?lFRTMlg+9kAC4PEqtnV04A9oMWb4RZqpbdCKYya3FuAMka5KpfPlrtK7El?=
 =?iso-8859-1?Q?2JRoTCz9gEiHV+6EqBrTOX9DuhwT4tOGUxBHTL8O/4iQBMHW4nzCwYlb5K?=
 =?iso-8859-1?Q?qKNLx4eQpPFi/HjqoWNq7OeAjjsUhwxSkQcaEEFx3N0ex03XfnwvPUJ0DJ?=
 =?iso-8859-1?Q?Bm16dL1B8J7nNswWeOmbdx0vLyoI8L8RTNyG85uRjVA2GrJvyRZ2aHi8bV?=
 =?iso-8859-1?Q?TXcc8qWr7dXNYGrpJW0vEpMQbjwpy0Z4zueKIqhKwgAMpbWGmHKj9U3/AD?=
 =?iso-8859-1?Q?G3GbQ9BqSsUjwVoKpq7f4RtgaicPC+nVjzw7J6Uae1C02e8Wx3pjDraKUE?=
 =?iso-8859-1?Q?E3U9YijXbv2L+2doF81K8zCf5aNE286MmnkUI2TjZF8lEoA4g4UYN6+oda?=
 =?iso-8859-1?Q?W+4JBXocAtvRb/Ev46wZGT6x+5p2RIf5Xq5Wzq7Mi2JO8SsKk3lWxl1YeM?=
 =?iso-8859-1?Q?I79VAt6ih8GiLzhjP9jdhx+CxqvSj3cDQ5f2dXazhKzyQ9lukhIHFWplUo?=
 =?iso-8859-1?Q?Fw938t1r0ocVB7JGuiuF06qlLPxV+nan81zs+4AUj6M1po0maPEzq3NI51?=
 =?iso-8859-1?Q?ogUtgZHN8DARlXQh4YUg5irKlgie8Ngi5YrMLECTEHFXvM5fiRtxv5RGWY?=
 =?iso-8859-1?Q?Wj3EVHOiB8javL0sJLEav1CdlfazmEFZs/z05jWzlYAQUmvcLAUn8BfoFn?=
 =?iso-8859-1?Q?vMbaekB14+Gon0It+YyFbpjaufQUncbK32NnpbPmPgn/OVVSG+KHilW+yB?=
 =?iso-8859-1?Q?ApaB6XyRPVmA0y1jlT4vaJKf/1DyOpYN7Ggmkcis998tya7bAH7EUlvDFE?=
 =?iso-8859-1?Q?siBA3CEJz/ZUPlG4T9pbRUV9iv+ZhulHTA9tC+0p9SL9VMCsvgYrmFJFGE?=
 =?iso-8859-1?Q?PCHXP+P9K/woLaEcPD9jYtVeWclU7fbsEbg9vNDL0wPYTmsJjx7CwyBkwi?=
 =?iso-8859-1?Q?1wbr05YCzzdePLrQZEo8OEN8MJwqiLiTLoVTH3tqJ1/pp7Q5PzWTBP0Aqy?=
 =?iso-8859-1?Q?AeoFn25Pisw8CHMSY0EGG4JGODtSKJT+RqwooSZIgKIQz8mhYIMQ20aEpm?=
 =?iso-8859-1?Q?EnjXVmYJxmlmoyWcKSnRpjFUTfsCkBgmTdvyK/qfjJ0vGY2STOTDPQ3qh1?=
 =?iso-8859-1?Q?kYWYAVHZXKFyTdAX6ErxqL9Hxcyd0oSvQQRsufux+g9UR+O4CZH31sPVvT?=
 =?iso-8859-1?Q?cmt7tQfHKrOBugZFY6g2WlzipQN5gWrs2Luoouw6jHyT3+bxulcgS4ciTt?=
 =?iso-8859-1?Q?Y+znxESakKua4IgKyrM=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <C72F6F5839F29D498B67C4F300BB991F@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hG7r1jm3aPwVRcI/8QvBuMIybTOI4zBpUyfvgm4a8qc/KSAt6j3blKHobBKKfJWgJjedPjCVsUxausLpsf+lWjcMUrFUQGSyuASr81b1UfZ97EIUEq9wAAbXSkjAfsY40d6AoEY3bBal+FZCshpX0Oy3930MxEumDGC/hMDGyA0y8p5UHzvPrHKSNgXt32cO3anS4bXADv1V3WmlrfurUNNKvPme0B+WmhNLQJ7IaqBwLc71I6S2/HIDpim3GFd5kJIqkzQmv/2P8DngT2KFb/P5JMPOJ/MDy+ulcC6uFYGPtxwUtBYt0xxPJWZtEI+WKFIAOTcus2ixDt2ThOwX+G8mFB3GwGUogTe/Xmvjeug0bsWAoMBK44dp/zMTVnZyZQBnm4lT377NonW1vASTGo+Fd60cwT2a+3qJhlaQLvkrf6KYTLbuTF31LvXOHSBKT53z9ZNVK5qICITu3OsTXP97b6hZA19wi4XJG2ofKJUf5xCmYE0Exlhuth5GL/Ms95DbCJailvsLCEfUX/mAFvq+qm+JoLZCtyP781YyClBpOdhaqzCP2yrqG/giqEgXzZvCaiyjaWs3w8mojgpP7JZ3bhwoXBY5m6SG+TDwSjai2lkxV+kWsPjkBzdwpBiI
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8037.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f8a4dfd-e925-4293-2c38-08dc06786aa1
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Dec 2023 01:09:03.4065
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /8yo2voWM7kEAhI1zdv+Q8tSI8XmqA295SrVr26XLAEyZc9ALelViEULuMZHYgjf5m7iMW/ehf3vSCheMZq2PI6mO2715tyt7OsGqbnMKKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6732

On Dec 26, 2023 / 18:34, Bjorn Helgaas wrote:
> On Mon, Dec 25, 2023 at 06:26:56PM +0900, Shin'ichiro Kawasaki wrote:
> > ...
>=20
> > +static int p2sb_valid_resource(struct resource *res)
> > +{
> > +	return res->flags ? 0 : -ENOENT;
> > +}
>=20
> This got worse because it's *named* like a boolean, but the return
> value can't be used like a boolean, which makes callers really hard to
> read, e.g., this:
>=20
>   if (p2sb_valid_resource(res))
>     /* do something */
>=20
> does exactly the opposite of what the reader expects.
>=20
> I see that you want to use this -ENOENT return value in the callers:
>=20
> > +static int p2sb_scan_and_cache(struct pci_bus *bus, unsigned int devfn=
)
> > +{
> > + ...
> > +	return p2sb_valid_resource(&p2sb_resources[PCI_FUNC(devfn)].res);
> > +}
>=20
> > + * 0 on success or appropriate errno value on error.
> > + */
> > +int p2sb_bar(struct pci_bus *bus, unsigned int devfn, struct resource =
*mem)
> > +{
> > + ...
> > +	ret =3D p2sb_valid_resource(&cache->res);
> > +	if (ret)
> > +		return ret;
>=20
> But I think these would be much clearer as something like this:
>=20
>   static bool p2sb_valid_resource(struct resource *res)
>   {
>     if (res->flags)
>       return true;
>=20
>     return false;
>   }
>=20
>   static int p2sb_scan_and_cache(struct pci_bus *bus, unsigned int devfn)
>   {
>     ...
>     if (!p2sb_valid_resource(&p2sb_resources[PCI_FUNC(devfn)].res))
>       return -ENOENT;
>=20
>     return 0;
>   }

I have to admit that the function name meaning is opposite... When I follow=
ed
Andy's idea to make the function to return -ENOENT, I should have renamed t=
he
function to not cause the confusion.

IMO, Bjorn's idea above is easier to read. Assuming Andy is ok with it, I w=
ill
make p2sb_valid_resource() return boolean and respin the patch.=

