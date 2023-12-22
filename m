Return-Path: <linux-i2c+bounces-940-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E6381C3CC
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 05:21:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 619AC285D68
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 04:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6472D211C;
	Fri, 22 Dec 2023 04:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="hLcx+NLR";
	dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="Y39AAWmx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D17963A7;
	Fri, 22 Dec 2023 04:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1703218863; x=1734754863;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=cvEVEQiMoWmNcPF0dvE89wCnNDMUhlh0j7vMRtTc5uQ=;
  b=hLcx+NLRrzwB/GTRMjiuziaRU0EOvq6WCKvUguH4ICurfwm7XBAU+BWv
   faKHgd3sqDBO87Q8NK73gW1yHZW/907j6OZAyfkABfUtDrJ6dofx0s4Zt
   KdKVFWPOEe9egTWXqz4AalS/da2YVanrtsxj0rrecTI1MkofroLk+JfIL
   8GdDmirMY0uKgwyydrLVPdONWzwCZptpnSUB4idsiifQKSayLvgY5UdMk
   m7x8AFSioS+jQP49oxBeA283rrLAd4UGu6B3i/UJm/ysfL9fH4J5B951N
   e1kOUzlpFKaKqQurvYwTwtXl2a1yCkpy7QEmNOcOOU97W15feTjGjmS0m
   Q==;
X-CSE-ConnectionGUID: ogJZNhjaTD2/2eU8X1E20A==
X-CSE-MsgGUID: xaXDowzdRpqiP1o2jkiLEw==
X-IronPort-AV: E=Sophos;i="6.04,294,1695657600"; 
   d="scan'208";a="5470774"
Received: from mail-mw2nam10lp2101.outbound.protection.outlook.com (HELO NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.101])
  by ob1.hgst.iphmx.com with ESMTP; 22 Dec 2023 12:21:00 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TurlBeWusYeilBlCxjVTSDFfbUcKNfd9cbRDKJ6i1gbdnAEbmtbGhZsUa1F58hnI+T1zMsr31HNq8/BNli8urv+p5cGsjpoRvZju+Rf1K/KJ8EmZCQZ9iJQIUF3rg0wf352xXL73JAMMUFoIbjm7fJnNtNFx3W9yu/1KBwx84fd+ieCFRZz8xcrfWs2xIkqnchJ68RXIa/1ATiGlRlFgKpLZNy6hqgdBV+tLF77EWRvO9WOce2POZt9rns+6iX0UPK7anqJg5QykamCVfW/WBzDh89DcbYOjOcJZZpYlMbm0f8GtRa1721XvtfNLQ/1N/+9nfybAoI69BMdaGNGDiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QV/aQVqNog/pw416nTs3hwdBf2AKX02uCR4H/iO0/wc=;
 b=EYAe41TpcJ5yaFOhZ/ZsotoRltLJme98MeOpoasx0p8K0v/7ol7lN8DCXb1Rd6aaqDecicD3E0jXjAO2y4jgPLJ6/eXG2VDKth1rB48GDB52+ppGV9PJsFl67FItRAkelqq9hkJ4GTcdz7/fTxn+Yk1OgVakNL/0dgFIfTkBM3jd7gyiXJ83Xc+P+olrHrH9++QO/9KemcabKA9ym9ijQVbOA97LePUo8Qp28a9EDBQdb4x1Nq/04m3KioeoCsMveXZpYH2fhuE40Epupkbd2ybkG/CcNsd9ZTe3llLm1Vbv8W0Z3HB/cPeyEVhKe6qbANsoc9toFzAtG1nL2YcB5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QV/aQVqNog/pw416nTs3hwdBf2AKX02uCR4H/iO0/wc=;
 b=Y39AAWmxi3RdX7VYsNXGEA5fH3bkIEVfFbw3HO2+vs9wKn7ky/fwAzlHT5VdP9YuIHIo1jfSv8Cgsvcf/v36hmAfFWKXWg05kASyNbjoz/RY/tYqdrURKD3rSG3IM7i71jT1ULcd93UjdhvjqEvroRLgSEKv5MMal0OSZiMx6Ds=
Received: from DM8PR04MB8037.namprd04.prod.outlook.com (2603:10b6:8:f::6) by
 PH0PR04MB7865.namprd04.prod.outlook.com (2603:10b6:510:d7::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7113.21; Fri, 22 Dec 2023 04:20:58 +0000
Received: from DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::81a9:5f87:e955:16b4]) by DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::81a9:5f87:e955:16b4%3]) with mapi id 15.20.7113.019; Fri, 22 Dec 2023
 04:20:58 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>,
	=?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Lukas
 Wunner <lukas@wunner.de>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v1] platform/x86: p2sb: Allow p2sb_bar() calls during PCI
 device probe
Thread-Topic: [PATCH v1] platform/x86: p2sb: Allow p2sb_bar() calls during PCI
 device probe
Thread-Index: AQHaM/GjqEQArtDxK0WkO4vfnYsZ87Cz9EMAgADAX4A=
Date: Fri, 22 Dec 2023 04:20:58 +0000
Message-ID: <ia3few4psvts7sunnp4svvpgazr5krmgy6scz2nfquafmvbb4p@nbgw26rjic3o>
References: <20231221093936.1523908-1-shinichiro.kawasaki@wdc.com>
 <ZYRtSuo1yLKyJASP@smile.fi.intel.com>
In-Reply-To: <ZYRtSuo1yLKyJASP@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR04MB8037:EE_|PH0PR04MB7865:EE_
x-ms-office365-filtering-correlation-id: 157dcef7-2bc7-4ab0-3c8f-08dc02a565ee
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ay3o5LxQyuCiBB1zRzC/1syGmaCurc12q3A3/XtoGZxzN61MSozi+o8WZh5heRWkiI7FHb+q0EMywP/c4O1EtDKq1RTG/GYGFTQ2X8C5efMZZQWVZa2O3m3MnBPOW4x17HcOGjOqhsD6p7p9b19Pikw1l7ew93KSmColjJeeS+cMSwQR5sokF0d3fXSwV/D5iZ7k42jNG8KW9g4SvQmDQUDQoFxgENbzAbg0kMKpnD9a6LaA5jcLlTtL+4ijpGkA94eCwUiQ2x/4Dw8sHZ+uNEuDUtMwggSO/bmBcD90MxTHGuDHBBvBiNzgowCDFElbnNkai7U7Hi85Oryf5XHXM9kLZrJ867pLwx+prhalO2M1MNnGE5s/WLyih82Vq8TJfCHxEFLYodHnbPK9XBGNUhvANOTUmDKWU5yQ385OJIWRCywkXvR/NQNZTeD9uW91Sgv9AwB/hXCU9ieYXPyxu0HAYSbgf52T/yUXD81dndaBdKeCrEri6sULAzx6cpyv5GgbHcz1HfQYcnfhaHyXPH+DW6OAFQPqxWtXLdQXha/edzcejzVn0lOYs9r+PWLzdfvcX752E0oG2IMYZejTzulFxI1eIoJ5yPpSR4oJljVTUCTwWbUvul/1U74+wDu9
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR04MB8037.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(346002)(366004)(376002)(136003)(39860400002)(396003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(91956017)(6486002)(38100700002)(44832011)(122000001)(4326008)(478600001)(82960400001)(5660300002)(54906003)(316002)(64756008)(6916009)(66946007)(76116006)(66476007)(66556008)(66446008)(8676002)(8936002)(26005)(83380400001)(9686003)(71200400001)(6512007)(6506007)(41300700001)(86362001)(38070700009)(33716001)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?KItu/VVt+Ry+F83AtryjYJpuS66wh4Vp1uLxozgm5biL/M5SVB0SWcOWi3?=
 =?iso-8859-1?Q?OS1DWKmBcdkbKqEZCfdBKB9uexCodOea4LHye7Az1riy3MDqoh30v8cSFL?=
 =?iso-8859-1?Q?vnwWOCzY/qlECC0tEfFuYg8PtYK3gyO00072sxu8agwE5HAEFybHSNxscE?=
 =?iso-8859-1?Q?J7OxQgQzwfgEA0Bo9nuBB50rBJvv/D3TCESCjpXMO9SRYlV9+bcZYVWvwk?=
 =?iso-8859-1?Q?gopwqBxqfryltitQdDb3028HAFVyDCddcvRiIKs1ohydXU83+qMT1GQQtx?=
 =?iso-8859-1?Q?Wviv4GXWZWA2bAUEqbksgdBCmM4on2RCFXTJax6c92k0EpI3gfg1+HGQzX?=
 =?iso-8859-1?Q?oDDVDXY0vRK7lI7ISd/gmw3cq8XFBhixgeDHs9BNrhYgJ7WjYnLxAKXYO9?=
 =?iso-8859-1?Q?dFf2aQ8hkCKmBTKfgj72H0KZFRVIKXEPoi8GMZ3QWku3h18BCcmLs70pbX?=
 =?iso-8859-1?Q?n78DRDECggkGGCpVrMcgA5rMOty/1WO3SFbxn9CBkmvKvRyJbA7c5pbsTP?=
 =?iso-8859-1?Q?JRD7AEo+/CWueCzTb7k9Bitoa45yrVK69Q6T8IEkzIIYfqX2xNjQg/1laS?=
 =?iso-8859-1?Q?ST5dT+KPkzvQfspOjHgU3SVkCwbj21gC+9J24MnqgPhLc6265/+y1fxfzD?=
 =?iso-8859-1?Q?xq55Z2keuhXojZDpo8fqosCIiir48FpZrdQhnR1aoQkooGChFoUivL29CT?=
 =?iso-8859-1?Q?NQegNB+CihCCuIu1GLeHHRLT1CFna5GMX4dCh36Nb3Neo2jwHPurAnTPMG?=
 =?iso-8859-1?Q?AhlFi6A0R/GOJ4DjJw2AxCOJ2wiRIyZSMcPLra5lGvGEJR+GKpvmHyU0kT?=
 =?iso-8859-1?Q?dai3nBc+linxSVnG9lVTyG9k+EUPlGDX0lIJV0OfcVGjhDsGkpU9CcfC5m?=
 =?iso-8859-1?Q?6uVv6DXvwzBtTesjD34LeI+gqowvW1mEleYN8J7bRnnqfh5xGxxXiYjq8K?=
 =?iso-8859-1?Q?nKaJqExDbSdTyJzwDsPVZx38jW+w2DcLe7BJIRdF7pFrxowLV4ZdnTBFu+?=
 =?iso-8859-1?Q?YLbFoa+/SlhSO4DHWUXe9gsw0WjSMMPBZfDshwxzzUpNS9CPFhB+56OUSB?=
 =?iso-8859-1?Q?PdY1EMLg2dw1wAahihqFdAoYh8X5jT68WbmsP1Vn6o7BohGORN25RDlLXB?=
 =?iso-8859-1?Q?PMbzMyAvNRjwQkcgVNFx7zTN+tjVaXBaan8p9DBotHamazd/qusbJMcE7W?=
 =?iso-8859-1?Q?W2bt4PMqMHzNfS/DfqUDQdUrDhWBpTlnUl4lmWm+VHNHP0qzskqCmwJaNm?=
 =?iso-8859-1?Q?JuUkbuPj55DoqGKwOhsnPN3n7EA9Kkn3NqrQuSDbrz4Mx8IW9yiRbMwv48?=
 =?iso-8859-1?Q?MschCggtkC7JsoLIliJcdsySQ6x2bleYYSB0PpTaSK04d3hg69dUPfCMeS?=
 =?iso-8859-1?Q?WdvsrF5HcPpbFhYxX77RBBwyuWXJVpY06mHRNKhxMk5+F6ipPYT8eu2WXb?=
 =?iso-8859-1?Q?JZ/sVWqloh/4kodM4Om6llmcxB+dAh1H2YGDDmqgZmuAb2ZbcxtHrzibFx?=
 =?iso-8859-1?Q?whpO5khD8mORCYb5vp04EhUrzMDFJ5Zx4TuD5tk5v37RR7QHUMI0Nu+4O0?=
 =?iso-8859-1?Q?VPqDWwLo746361zp2THuCZTvQPAim3S384qIddkVumTCt6n0zSc8t31UbP?=
 =?iso-8859-1?Q?6Ns2PmmVT/J+tSTYPnYV5amah4GAxC5bfogAiLgok+FRLymnI831P60i6D?=
 =?iso-8859-1?Q?4PkMSMXpR5Zz2uvwCYc=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <38D680B0EBAD1F42AB791648B2585CD0@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lRVllMERmzgZFrVMFmH9sAtCrNUXgYI1Vgudb3eKHoDTHmNKQ73WMaKpz2AiQbD2eEQo2bfnG0w1hujf5w+kbJM6ElMeIaHKe1EaOXrBNP4JHpDJMctDtPlIk/f4AUjmOuFMCBZ3/92sYkHG/QYvfddSbn8UPSYvAeviggyhvJTA0mnlGW+YAnCPY3fwb1ovoq/LOLwU3XJdbzdME2Xzh6LcriSuNVQuOFsFttS7fNrq5Ctj9aDO924c/kVKgbBXKH5e2LkH9+/xreFcnrNF0BBAHulR5hJyVZuALQIXZJn1DRzOu7iI7w0GkZe5GaJKGcDwBC+JYWX7SsG289BfWf7JjpenbWMW0Hc397nFxVc8gDa5O29XmGGr76y8k60dQaKYMtMb6Fxgj0ib8sQ1iQYpgYvpOE8uwOPR8z+u3GOCpPvQPxr0IMYkkwvaZfrAFqf1PzSV56R1idjsqTCtS1xxhtdb+rPJ/8Tyz6TIp5XxtgBMZLhWu6G5lUWmJkGA2WPIv4PTs9CBIs9u5KrF9rYBzEy7VstLO5uW9kwpULiiD8FoIcRZ/OzJ11sOWe1J0wSdzBv+0JpiwvQuqQsQAJ63now3vq1r5d/+sLJhlgoU+dp2hnN55PinTVx7b3s0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8037.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 157dcef7-2bc7-4ab0-3c8f-08dc02a565ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2023 04:20:58.2587
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ebVZ5cxIS5bU/g+aWQ5Uph7ymY/3CLM5ObwSiCpBKDZVP22iTYKGTYZo7f0TL28Uu+spMYwSre7wdT+ZdNeDIgNhVsNirzVZM5bK/t7TGQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR04MB7865

On Dec 21, 2023 / 18:52, Andy Shevchenko wrote:
> On Thu, Dec 21, 2023 at 06:39:36PM +0900, Shin'ichiro Kawasaki wrote:
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
> Thank you for the update!
> My comments below.

Thank you very much for the valuable comments. One of them does not look va=
lid
for me as I noted below. Other than that, all comments improve the patch :)
Will reflect them to v2.

...

> > +	if (!devfn) {
>=20
> Maybe move this check to the callee?
>=20
> > +		ret =3D p2sb_get_devfn(&devfn);
> > +		if (ret)
> > +			return ret;
> > +	}

If we move this check into p2sb_get_devfn(), it will add some complexity
to another caller of p2sb_get_devfn(). So I think it's the better to keep
the check here.=

