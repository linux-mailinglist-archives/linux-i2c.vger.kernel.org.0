Return-Path: <linux-i2c+bounces-994-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 335F281DE85
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Dec 2023 07:11:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B26AE1F214C0
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Dec 2023 06:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61CC2111B;
	Mon, 25 Dec 2023 06:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="lLBatSrn";
	dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="IU8gAuco"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200D410FE;
	Mon, 25 Dec 2023 06:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1703484655; x=1735020655;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=imUtpm8evCdokJRXLvy76oc9S201XONEYR76znVVYGA=;
  b=lLBatSrndN4PYAqJWc64IfdrbG3WxQZ5TE5SIP0FWG4bO3RCmsGWTCOI
   R6993z/pndP3VZzR8mlrHkI/9ulUQ53wE6M3MHI58tRjYPokABrPkTF90
   XCcH3fHtVy/9JE5gG/ARcUic5M2L01wKoP3DUav74mTzDWvA+mvki5trD
   Pq0svQYNo0aBaK+cD6/hPrt4fu+dy7Cr1GGWw+GKBETlt7jsNLu9mCUDf
   4jyyj5Chm+RncIaUosWX8R7VWsj+FmkpEHILr8uSSHuk6PECuTH6zymXR
   S5ymIYWcLInjekYFlrNWChfdTPYhY07iJxOTuwqxABB2gp12gy3CegROI
   w==;
X-CSE-ConnectionGUID: npL6wK0KRDOcCzLejycCQA==
X-CSE-MsgGUID: 1ZjA/5fySGWaHwPU9AmCsQ==
X-IronPort-AV: E=Sophos;i="6.04,302,1695657600"; 
   d="scan'208";a="5404373"
Received: from mail-dm6nam11lp2169.outbound.protection.outlook.com (HELO NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.169])
  by ob1.hgst.iphmx.com with ESMTP; 25 Dec 2023 14:10:47 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZAPi/UcXRNrmEDOd2+8fVznWc81jZ8ou7ooVJNPESCKsJr4/9CtPgIue/e+FDyqtqRlwl4xnSj1kMq2QyWqrvKXUhrAMit28hbLSKyeEDKhAytFnsvB0LVzH7RtB4sw/0T9e+zp7CIbHFNiDceeBGFeBXKa7bFb90LtksLkdS2tdxAriHU3Ve9K1AEoBruayBVzllySOcLJfDBrsJCJl9FZ/VMmLWyl7r2iGtr8RwU1VTNEHdVAS4yEqSZn+HDJz3gPOjKqIP1kdnclLN0VzrfbdBfl4m53LOmS2W4puxD3+i+gDWo/o1BKWQBw4GjrTjLbLRNJXEamFzGjbFrJO7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kJbzRDT+ZOR1UK26zsEySkL0MhvJtj6PaWVDiGLey+Q=;
 b=BAvjb5kNiZW56rtOcdPoXmICOwfpsoBqC8E3/V17mSRLddl0Iw53r3KBfnltvqn1VTvSQ1io88He1Pt+Z4nVrD6R7BnW2UymycSDimzjkAgtmd66R5k2rdBG1FNBSvd4k5U+mr9eLiPFHLVTNJMBFJ6fKi4CYPQIn+a+dyMh/pzs8aCGAjku8WMGFBB0wivwyeRcNbOs9uTzrnJGIIYlaiaeRJfEgVBv0jf0WVeEjGeM489ZB9HD+P0TfQ6i/HHJsYbSGBwfG73HvAwu/SDOZ8797Jrwv9pO/FMmSMYQWeb3m2PRqa89+fzCUkycYUYb2l107fuQMmbBVfZrM7DF6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kJbzRDT+ZOR1UK26zsEySkL0MhvJtj6PaWVDiGLey+Q=;
 b=IU8gAucoD4hd/CAC6YrYyqnb3UOvDPCBTuErwrzyQyO47H33lCXXQAFKfUyoiDW3lWtZarGJOg6qeFWuCDM94XckjwMKyV33M4ayFGg0z7cR6O+FCZ0GqWVgf2UuRjmhSzmdzf/PdQtsips23+sTZTTt0o0rxmXxqqj48KtP4eM=
Received: from DM8PR04MB8037.namprd04.prod.outlook.com (2603:10b6:8:f::6) by
 PH0PR04MB7319.namprd04.prod.outlook.com (2603:10b6:510:c::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7113.26; Mon, 25 Dec 2023 06:10:46 +0000
Received: from DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::81a9:5f87:e955:16b4]) by DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::81a9:5f87:e955:16b4%3]) with mapi id 15.20.7113.026; Mon, 25 Dec 2023
 06:10:45 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>,
	=?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Lukas
 Wunner <lukas@wunner.de>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2] platform/x86: p2sb: Allow p2sb_bar() calls during PCI
 device probe
Thread-Topic: [PATCH v2] platform/x86: p2sb: Allow p2sb_bar() calls during PCI
 device probe
Thread-Index: AQHaNKdqvk0UxgnBA0iaicArgNfIrbC1XAcAgAADOwCABCmggA==
Date: Mon, 25 Dec 2023 06:10:45 +0000
Message-ID: <ffaoshwyeknknvqj4fvvcmupgrlveoqlqcvswmhhy2mbne6wjh@cc42eynishuq>
References: <20231222072054.1640144-1-shinichiro.kawasaki@wdc.com>
 <ZYWcRupBcrGCSgcb@smile.fi.intel.com> <ZYWe_P7-TkbaOl0k@smile.fi.intel.com>
In-Reply-To: <ZYWe_P7-TkbaOl0k@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR04MB8037:EE_|PH0PR04MB7319:EE_
x-ms-office365-filtering-correlation-id: 6578ea0f-488b-4a8d-b818-08dc05103ba7
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 OJLMTrWQ6pamnoLaCAWTZECUAwZ1WBU2Wlh8wMD3k7lD5NiqUmGZqVpRS4N+VvgaZAvs4Ja5v6z9KKvTnRFabiuZr4g2Jg9ey4sfle7AxkwII7hqhFcWJqVOK2rdVKpG1QYMlKWnVDuAvW8ezP+NetmO78Z/TdyPL0nAzIIHSMTFOTEzjytEoWMm6V/f0//18lpwwlbFKXhuwpiYPQ9Y4RY5QyOYqSi4bQSlF6Fm5pjQlwN2T1IPcfudVaguc1lCm6b79tC4418ZrYdwH2Hlgjc2dKFBU8buAffYWfJmym01ZYx1K3oThvW3fJ4yBC+6wvOXoFXbMQG17eDQ5W2Rn1T5z5YVIG4DOPcfzlFOMdgZ3Jg1kmJqJmhguj2b1Y/RBQwcCX8T7DyhkGMmh1QSPetNmmWa6CFdTX1wp/+ZAoEIDkv1D55sr3XxWWLfTIAw4Yj2FmU9sfvgQwIhpJWoICU7wKX2TpCzFXLZoDX1wbOhvg2Qu3imt0a1T69ZdLFcPCE0Nh0hoxg4qQER9weo+BCIh/rnbnwXW+NK/nQwQ/kox7WYoIn+MGVVAPNgxZb5MyT4XNOx8yp0BrYGlmhDRv4nybC/738pKkJnYQvXxqvUbxjDvw1JzQtzeYfsAoAu
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR04MB8037.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(346002)(396003)(366004)(376002)(136003)(39860400002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(9686003)(6506007)(86362001)(6512007)(2906002)(71200400001)(478600001)(122000001)(33716001)(38100700002)(41300700001)(26005)(82960400001)(54906003)(4326008)(316002)(66446008)(64756008)(6916009)(66946007)(66556008)(66476007)(76116006)(44832011)(91956017)(8936002)(6486002)(38070700009)(8676002)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?c4NYuZhqEmRz+ePQtCmwjpLIxLcjE0bfzecoi/v4n2QK3hG2wor/RLSdBy?=
 =?iso-8859-1?Q?8QOzWY1B9RByw/5lD9iCLgVme1F8l1kIGMCM/xIsMz42iOBKm20124+0GK?=
 =?iso-8859-1?Q?2NtLePxkiEOnUMZGzGMzSiRKxpm17ch4RbojG6FR3W/enmenUP26j9qMRa?=
 =?iso-8859-1?Q?g4GjNATlZtZLpKcssedZn4G1c3zElMaEglDxnkCOt3Vs+2twIt9rAfWAQ+?=
 =?iso-8859-1?Q?6dZLGumbak7RDG5u0cG1iEWbIESV4bLifpObTTLO8PEDaAtfbsZGa8/EeL?=
 =?iso-8859-1?Q?lXQxh+etwygDYtfM6qlqUXY6z4RVkp/8qEK4JOllX/feat0uwAWhgePPxx?=
 =?iso-8859-1?Q?mkLHtMw5Kh3b4y6eimNBit+ISmmnkNmLN81FNnBx2Cay1f0QwjjN7H3dR0?=
 =?iso-8859-1?Q?ALSNYHcFvGG5xbrCspRR2mh0Lle/3OpXyApS21OSFgDSQVbfT8sAp+ydUi?=
 =?iso-8859-1?Q?30phaxZ9Sowsmmd6DwaHzvYi0ScZEjoxZ5tTSXumgboNaDHzSzjpA/NMAT?=
 =?iso-8859-1?Q?fk0qYk9c1b0YeYkVXrDlBYHWdIfW7F3kgwCc8a61kzKbz5SohJK08Neexs?=
 =?iso-8859-1?Q?27mCvtPtTCvPflz0Q2OjngOaX6aGy/KoutwpSo75YaNHTTD51en4BKUHrF?=
 =?iso-8859-1?Q?vFc5fG7l1YDRbg4T8iwfdXs+qltUvjFw1Eqq+Ec8Daa4k948fixz0g+CeC?=
 =?iso-8859-1?Q?2woVJNbFs/O8/SsX5TyDE/ACrw+3Mp8h4hmOIjxISBsgcNNQl5S/yrbX0+?=
 =?iso-8859-1?Q?R5cm/cHgKkn9DATFBx0YcdizZWff/ZL5OxD+cvMCwTStG0JVRjkAcj8jpa?=
 =?iso-8859-1?Q?A8qijUNJbAWk57VNYduwAbuYB6evEHV4mWdgNkbSQZkSYNO+tjaH4KCXWh?=
 =?iso-8859-1?Q?4uHczp6Halmjesmfc7oqE3hTZ7aHXedTKdHEeL0eOf/Qq+xUjqmq48NvNL?=
 =?iso-8859-1?Q?Agg7vBkusZ29ZNGx4zNXTH4cUxHDoPjsyZz1shNid4Q9WCBV358ajKKhFT?=
 =?iso-8859-1?Q?65caPFP9OWv5Bstz4Ou9bC1GIr/V1GQVMZ51f2yfHv0j7TQrEMOa7ldfHp?=
 =?iso-8859-1?Q?lpUneIkANic4Klt0ID4Ga6KRPa7jNOO1OwNWl5DBf6EheoAtXWpFNn0EA6?=
 =?iso-8859-1?Q?d/J2NF4fLeNU/1dTJ0jE69hIRHc9Mr75I01hcvaaF3MzD5VnpN4LDzSa2k?=
 =?iso-8859-1?Q?42pwtDDBwyruOLTnMdl/NPwytIxo1RNdXmbC3nQKeLWgJA4+n4FBOHa3Xx?=
 =?iso-8859-1?Q?Ael2kPrXvyM2DHQmjzBxhQdfda8gsgLRU6RjkPvHhD7a1HtWTrRp7MZl1d?=
 =?iso-8859-1?Q?S5gplBaxiRkjYfz65FWZbxUJyAffieRaxnAhy5QpZ1U2E0SNBzhYQphjaB?=
 =?iso-8859-1?Q?gWp7iqsBkAUY8GjWVlaFMToadPfphFA2wsdRRPBjHVY/29eHF5Vf11uDlp?=
 =?iso-8859-1?Q?dFsegG3pLzwuFIC799/5K3Dj3K2ErAgegHYjAsBjB43J4RHHWfG4BT6OhW?=
 =?iso-8859-1?Q?u2C5k/Tg+GqxusXLqfiHknJVBj2xS1Sy3f6PksAU1IWE3mTQAtIYhP5kL2?=
 =?iso-8859-1?Q?v48hkZmY4Hc4gdrj+vbf/qFJp+WQbawsaYGWJL9Gd0oMdrc39NvJIg0+iy?=
 =?iso-8859-1?Q?LwpfJ3nE4mMGvQGmwGtsqacrZgdpQXJbWE9kgaIr0W6ZBvK1Ovg9iDUbRC?=
 =?iso-8859-1?Q?ZIqpHRiXRzLFVIAm2pI=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <56D991CA26329748966A5BD7249933EA@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hJWAH8Xo+uQNJQA8R7IS9As7ovSNRVantYtK/OEyAUJZPr7WQirrcibkXUk0bhczrokIuYVVJ/9xyMOGkDYXlXWwJ/X0Oja7KThcXjTM6E1YQIaT4O9Y2XqVMak8yDoEnL/SURNxJESFNW1RFPsOhkGkqYXFe1d9K2VpPvZ/7z1QprDkyvXY1J7pHRUh4DuM+zL9kTDhpWVZkkzDRHRacadRv1S7eFRVt23VJixNtqM2PpUJ0a41ROX7qe2ldW2Fy7YFwTPEuHyaMJjf9h0+IOF+cwMHAhcUMsNnMYgdQ5ZGwtBOVp4j3YnAJCeCIigV1c7IzEJ2ifU4Febvnhvxs6SrYT4gvbz4EpabSE4VBs/43I+sO4pd+rRV7eV0zrnV8WV/TRxrgyvkrcncT86xpK5a8e6l32vAevP4yabLpIt7ePWo+JirL9naxM3kV9cYLxNSXl452g5rv+kCwkBlaZxRYRXYbuwLZ5uM9ZCSLzIOJJGWYvJY6dV3GzAsZWS+iwg791dOhEe92ZG5in79iJid62gWbZ9vMG6LyUJeA+Gr8Ozv7aeQjzYojKRql5TUIIKW57VsQF/i1awcPU9n7Sro4Js7nHgVOIKS7nUEnOjk7ttrPb3S4sMg+DOZePmN
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8037.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6578ea0f-488b-4a8d-b818-08dc05103ba7
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Dec 2023 06:10:45.8174
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RuNntexO1/4yW5VY30TEmVwuZghLVZzhiYjnPujzMbP4Gb+P1aXOGQg+6kx8BwVNcqN1JEJyduA8NzrE61eFzHFaXQayonFL0Tg2kysHCn8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR04MB7319

On Dec 22, 2023 / 16:36, Andy Shevchenko wrote:
> On Fri, Dec 22, 2023 at 04:25:10PM +0200, Andy Shevchenko wrote:
> > On Fri, Dec 22, 2023 at 04:20:54PM +0900, Shin'ichiro Kawasaki wrote:
>=20
> ...
>=20
> > > +static int p2sb_scan_and_cache(struct pci_bus *bus, unsigned int dev=
fn)
> > > +{
> > > +	unsigned int slot, fn;
> > > +	int ret;
> > > +
> > > +	/* Scan the P2SB device and cache its BAR0 */
> > > +	ret =3D p2sb_scan_and_cache_devfn(bus, devfn);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	/*
> > > +	 * When function number of the P2SB device is zero, scan other func=
tion
> > > +	 * numbers.
> > > +	 */
> > > +	if (PCI_FUNC(devfn) !=3D 0)
> > > +		return 0;
> > > +
> > > +	/* If devices are available, cache their BAR0 */
> > > +	slot =3D PCI_SLOT(devfn);
> > > +	for (fn =3D 1; fn < NR_P2SB_RES_CACHE; fn++)
> > > +		p2sb_scan_and_cache_devfn(bus, PCI_DEVFN(slot, fn));
> > > +
> > > +	return 0;
> > > +}
> >=20
> > So, we can actually do the for-loop from index 0.
> >=20
> > 	if (PCI_FUNC(devfn) =3D=3D 0) {
> > 		/*
> > 		 * When function number of the P2SB device is zero, scan it
> > 		 * and other function numbers, and if devices are available,
> > 		 * cache their BAR0s.
> > 		 */
> > 		slot =3D PCI_SLOT(devfn);
> >=20
> > // This will allow us to have something like pci_dev_for_each_func() in=
 the future.
> >=20
> > 		for (fn =3D 0; fn < NR_P2SB_RES_CACHE; fn++)
> > 			p2sb_scan_and_cache_devfn(bus, PCI_DEVFN(slot, fn));
> > 	} else {
> > 		/* Scan the P2SB device and cache its BAR0 */
> > 		ret =3D p2sb_scan_and_cache_devfn(bus, devfn);
> > 		if (ret)
> > 			return ret;
> > 	}
>=20
> Even going further
>=20
> 	if (PCI_FUNC(devfn) =3D=3D 0) {
> 		/*
> 		 * When function number of the P2SB device is zero, scan it
> 		 * and other function numbers, and if devices are available,
> 		 * cache their BAR0s.
> 		 */
> 		slot =3D PCI_SLOT(devfn);
> 		for (fn =3D 0; fn < NR_P2SB_RES_CACHE; fn++)
> 			p2sb_scan_and_cache_devfn(bus, PCI_DEVFN(slot, fn));
> 	} else {
> 		/* Scan the P2SB device and cache its BAR0 */
> 		p2sb_scan_and_cache_devfn(bus, devfn);
> 	}
>=20
> 	return p2sb_valid_resource(&p2sb_resources[PCI_FUNC(devfn)]);
>=20
> // With this it's maybe p2sb_scan_and_cache_devfn() can be void.

Thanks. This will make p2sb_scan_and_cache() simpler. Will reflect it to v3
together with other your comments. I will also simplify
p2sb_scan_and_cache_devfn() to return void and skip p2sb_valid_resource() c=
all.=

