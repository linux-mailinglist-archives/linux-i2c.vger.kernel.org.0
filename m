Return-Path: <linux-i2c+bounces-822-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0E4814281
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Dec 2023 08:35:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 904581C2218F
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Dec 2023 07:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3D4012E49;
	Fri, 15 Dec 2023 07:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="IzJQ1G8Q";
	dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="r3VgXnFB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7776C10788;
	Fri, 15 Dec 2023 07:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1702625685; x=1734161685;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=EuXII04fXwD0t4EkqyUSBuH+lRj9W68kFDj5SRgmfYs=;
  b=IzJQ1G8Q98O64Hk6Zb0AomQ7+WrsddG6d0vwNgqlEFKCaQtKzdKeTp6a
   ubxW2Q/Hiht1E+wefw88sozhAuknl6HLhUXFx68g/gbJxkIQBDKUYYavV
   74JJzPdw3gI1tEYhIo2k6RgpFflzubt6ss+aWGnFp+UjKt+ugxJqK3eqp
   mpzZWig0NxykCBPRHh5iumFOSWhXynM0ZH3w0Jyig9/ZWjpZ9b+pF2F3q
   tGmY+4tKyNW5fePjBX5Qcyd1C85/3fiPZn1x/JXts4R5kkmjB66Z5Vc1v
   1uHSVqgulcMask5M4Vfk2xkKsAjmHQap2rwM8dHjXPXRUIotmqYE4Y60e
   w==;
X-CSE-ConnectionGUID: rKbmuPGNTdm+HwY/hOqtQg==
X-CSE-MsgGUID: SvW+Z9zGQBKNx2TMM/Rb9Q==
X-IronPort-AV: E=Sophos;i="6.04,278,1695657600"; 
   d="scan'208";a="4884742"
Received: from mail-dm3nam02lp2041.outbound.protection.outlook.com (HELO NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.41])
  by ob1.hgst.iphmx.com with ESMTP; 15 Dec 2023 15:34:43 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J9LWidwXtS6k1AvnCICXbhBG2XExEWWl8PZdafSrwWvMqa+mPd3VIGaihAt9lwc6PeKZrQ832WEshpA73YJeNqMbT2dkoy8kkOBGC/NBjPeKiEzMGFCCLgewTsHFQofyL9Pv7Pb6KVbtr6oDz5YFwbao8mFSap/GGCG0xuGX+qdkBo6A7a2ZEzu6b0dylHiXkke6xpLi+Qx1u8EvekHflraDrjmR0sU3fQ47MffO9ANGpxgdc893mPxr5R5HS+iv9dduPCZoN1j4eNhVqsxn9oA6DPO1C+vuRwyyaCX0aWYyB12WA3saS9sM57nTL1BWfDYrispDPVikg9R4meBnUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJSBF8YE4VoyUm9cCW4wtP3QPJxel39MlR9f6lnozbE=;
 b=DZ/+JoAzbweyfnczoP1+pyluI8TNgvX433in6xmC9WEv6//fI4BnwlJ3VCbvTkgJ0MyegvKwLSYe3EEfwuPlEGQeYgqHMmoVFVXTqFG71CmYzw5WRm6mj9mDACSA2bqUUZRVlBeV1HjymyAKIxM77i/9zjEX8p4y+SdcJwDRHQ4a/O3CMf3YCUc64VcTvWdJeCXd58DMVLl9pCWkOgBFMYM/RFr049Bow2BQ0wmyD/wg6m2XwgcfeR50Jsyk0+LWJOL06FeCrrOQmm1VO/mCNdiewUplrG7eFPhdgDdJXjyqFL3D67/d4jgt8ZbZeaXnmf1Z2aGxXv3SW2+AYfKP1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJSBF8YE4VoyUm9cCW4wtP3QPJxel39MlR9f6lnozbE=;
 b=r3VgXnFB6Bk5EAHagC2Eg4U5xWLWBg7lV8iM3U9XQUM+08ZJHBLYc8nogeSXlc+aUazxTSUY4kaCzPf52DlXmq3mTLXMtjmyCs9Zv5lZnAogT4ZcRcS9ntHaIVocj/F0adMC0peW75EvlhMr/TpfbnXKyOaZuRz1jAwE0zTtDKQ=
Received: from DM8PR04MB8037.namprd04.prod.outlook.com (2603:10b6:8:f::6) by
 CH3PR04MB8873.namprd04.prod.outlook.com (2603:10b6:610:17a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Fri, 15 Dec
 2023 07:34:41 +0000
Received: from DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::81a9:5f87:e955:16b4]) by DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::81a9:5f87:e955:16b4%3]) with mapi id 15.20.7091.030; Fri, 15 Dec 2023
 07:34:41 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>,
	=?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Lukas
 Wunner <lukas@wunner.de>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>
Subject: Re: [PATCH RFC v2] platform/x86: p2sb: Allow p2sb_bar() calls during
 PCI device probe
Thread-Topic: [PATCH RFC v2] platform/x86: p2sb: Allow p2sb_bar() calls during
 PCI device probe
Thread-Index: AQHaLPEKUL5t3x0B/EabxX5jU4Z+UrCnnu0AgAJZhAA=
Date: Fri, 15 Dec 2023 07:34:41 +0000
Message-ID: <4ihlmotpysklt54resrldv6oig6v3d6i2zfc2uoze3jgqjqgzj@4shf2h3otvcf>
References: <20231212114746.183639-1-shinichiro.kawasaki@wdc.com>
 <20231213194146.GA1055128@bhelgaas>
In-Reply-To: <20231213194146.GA1055128@bhelgaas>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR04MB8037:EE_|CH3PR04MB8873:EE_
x-ms-office365-filtering-correlation-id: 40b926d1-7667-4c88-4906-08dbfd404ce9
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 NR+0MF/UtAhEk+R7dLZ00S7wgE61ufwQBzWiUKcu1EhOy5ajIZ9cLJg++4GbwYzEisyab6oGgzPPXxb5F1YQ/59bSaLQqrNBWzjesLtlwJ2ZDnI1eoUTdYTKIk7BP/gP5ogx+YlzX+zr2d1uSion34PD/WpSNynAUj+TI5gtOgFk+n57rlv+OHPEclr+ad/y11+cw/xPa+naIT68+FP93JbXpSa+cX9S6PeG1unqXKAUFYFE+0fGTTnVTvvkomPVwQ1ZRLio+C4OjQp/5jkF9EIiPp2+Nx3yjCk8hxdKvwnDCGYZw5Vv/SQr29oROXsqRrN9IM/wMj02lPvze00V2veRUi3wu0nWp68ovL7pfsRtoyLWdr8XWnsRjk0r5TemVBGqb1r4alSEKLlQe5rsW3E5i7RAfTJxCAN+MwC9U8DNB899p/hAtQjirK4MmkNaEpkD5CKeKF7Y+KJd0cJrbUqdBb2BVtRoXhJyuHOU9WdRwOlc068VOnaUSXdazhrcr15+sJeqlNF9WqNGBTNEZU9n/XGhrqKhel9WdJ8iuM08VSGs6CmDrwXARduEmg2lJ5UOZlbw5paTbrojpB1G4HMx/n1Wo6dlUqjZTYesSC1Nu4pvGYAwcmG7Pkf8reiD
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR04MB8037.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(39860400002)(346002)(376002)(396003)(366004)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(38100700002)(122000001)(86362001)(82960400001)(38070700009)(6506007)(478600001)(26005)(83380400001)(6486002)(71200400001)(66556008)(64756008)(4326008)(91956017)(44832011)(54906003)(76116006)(6916009)(66946007)(66446008)(66476007)(6512007)(9686003)(316002)(8936002)(8676002)(41300700001)(33716001)(5660300002)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?bTbefgLEXfII72zGAXp1z3ts85ANXuT6eb11jrMWiDCmFSrOrPVsjws5t+?=
 =?iso-8859-1?Q?+9uLJr2J5dxgRvxfLrtgjg8hs4bpQLK4sQvBN++z4VzEDnjRdB0wPIWcer?=
 =?iso-8859-1?Q?/c++8c5RVw7w8AkUhqkJT80+9Ogcy19fzvdzq/58dUAPjA70Dt2UR4LHxR?=
 =?iso-8859-1?Q?dTSWkfEw4q56cnwx+HbgwzzjGESjEq67mmpcopID3HPFIxQF0XswiS7Uj/?=
 =?iso-8859-1?Q?5grma6z7Li5+w28GoXjc+FM2ERFnz+Ii45Llwt8NB5M7EoKJrvFeN58OgX?=
 =?iso-8859-1?Q?8uP6nFOVN2XHBm5fp7Zn9IIfJOREmCOa+ceIxWa6iiQ+wuPtuFbtLrmJPz?=
 =?iso-8859-1?Q?RWeLlXTsK0In8LF5A//whfcx6n2Chdw1cVmFYJ2oomTySkjeJqlJTUAnfb?=
 =?iso-8859-1?Q?xoy91Y8PuCQTytr9niMVFZ83rjpHQyGGgVrUqYybu6bn8nbnjYCm5FLRO3?=
 =?iso-8859-1?Q?RZWdCjHwqYwuPseW7bCyo1matj00jTJLAX2UPMbxBE/XT50XEauBXkjj5R?=
 =?iso-8859-1?Q?4ldONVa9wePC+Tfk5VJrHega3mgSTKvT+Q1B59+9PoAQMgMBAnCZ6u/MEn?=
 =?iso-8859-1?Q?QV+zGZa0x/s9ZBd88sCqVU6CGJRAfB10LAb1JD+ln8EAbgrYpSIWmvtaCl?=
 =?iso-8859-1?Q?HDSg2Xkt+c/RSIcpODItA3B8FieLYSESbIbkDwnMOYe4f76AND07VkT9Zv?=
 =?iso-8859-1?Q?d7AE3yTwp3Ak9S9K0TaIl9UB0V3YLpyYCvdz6UvWnI0apwYDLuntVbmJHV?=
 =?iso-8859-1?Q?plr2RgfMuaH18O92bWGVfRDQpoQndNUym9xx/F5d130wKg6YiiHu7CRfyO?=
 =?iso-8859-1?Q?nGuZXp7Qzlj/SRMMSvrAWUDr7EA3N7O4Lk+3nK0SfkhmXHe0YtT/H73ITj?=
 =?iso-8859-1?Q?MO9oOHVDYhcvHgMMN3WwUpmXia3LbHZmj8lXif+ze+lWfA3kLuUj/1ylXz?=
 =?iso-8859-1?Q?8qxD/88w+Jh5WJeqvw8TMhuTXrmStBGjIU9PoSHals3HScv6r55XonCsPw?=
 =?iso-8859-1?Q?lqSnhnKplbj857wsHlcP1KrrjQzEOt+aSHagS7rkO5tcD9/kuvJPWxAKys?=
 =?iso-8859-1?Q?utiufVqU4bzfnnw6+YrWCsLrNGkFk/+snQfCNw9mrqfRR26uRVfmz86r7K?=
 =?iso-8859-1?Q?VmOiHTR567dDI3Y/bIK20jOTxKfbwoMeniEF0zTa1480EbrF0fNn/9P1Uw?=
 =?iso-8859-1?Q?r3IFfR5rGmrc+kj2BN7aAuKFfVrID+OVQoxQWXnu1vvEpFxVzU/4lDX9To?=
 =?iso-8859-1?Q?CsQ6mStXE2MJyAfnyo73hBkqSBibIi04xdfV0uQbTjHuNl5le94LyNhXxp?=
 =?iso-8859-1?Q?HIxMh3RzbgNOp63xSBO7BgQ8OVCWOsyVIgRycvGg5QoSYDL7s0gQdc1Nde?=
 =?iso-8859-1?Q?fL/snV3LQuCM23kLtqerzyKdKE4yPp/J01rNc6MxXvxvCfL1ErrHEMOwum?=
 =?iso-8859-1?Q?r1DLReaV4k4tOZG04iyx9GLAGwlzc+mVlb/UF21T9a2JsGALrpFuTM+Szf?=
 =?iso-8859-1?Q?2TfnG+6aPXlZG/NQbY2mIaZlSP2KLFapjAqqOMF2a2BFRuerREk21pHnHY?=
 =?iso-8859-1?Q?/IlMmuaHCy5Fo5RrncKD0uGPBvdP/32vPyOQ9wRjcCwtwMq5hNuiAA08hS?=
 =?iso-8859-1?Q?4D/O761pYHWxXNlvmax1MkJwGxwz0559PzO6fY9vqGvZiFL21A6X+QZnzN?=
 =?iso-8859-1?Q?f7/DN0+elZK04EWTb18=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <B440F3DB79D71C4CB1177B0DF4C24415@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cOZhzMqNC6zx5DAdWQnts8QaFTygo3rCKDqfQI0IUKU5LVAkfwdknBOkewvKZPWovYlrJR2GMNwB/xMTHBo+Bz5X76P5cY6+wLdZZd0zt8RgDu7P2OahPLrM6Tp5ApDM5nVpxIdeJ+PpsSuu4plX9QvvLCr3FemrFtTMWbFh9E71lacbOE3PduCc24tm+PQKcTWVENhjCGFdld51u3chB1/7netutrdLiO1hV5yJafcJJ/oZj8wegb2yAOwXS7DVG3SbuRNbqlJx+woswfRaPsjEyGYzUzdjarU4wS69qEqQeNJegyvqHBdjikHD1l5pilX3YoWSJw0WUlRippOCqV2+RMP7eVjckuwb7ROSBQwHD9KLKXSXWqocEqw9sVdnOJ8wvxb8QwUMC/bnSDrxaYZY1Z7q+ocpOTzhAzIkaXqsDK6rIK593K2TClYBcw7dznAxKz3fpbA7efQ9IE5cb3MXAq2rqMugGpjjghugAp5ZA00HkogrkXPTqA4cEFquirm+/fODOl0DZX3tXoCmIsaHXkAlVtQ5OM4NrWDzwZ3QS6jDRujsIXUiBNDRrm31LhWwrUqDuc9WyFmdkxJyjPKihe17fEFyMGnKmPPH4M++j8Cv7EXNG5MzjqJySC9/
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8037.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40b926d1-7667-4c88-4906-08dbfd404ce9
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2023 07:34:41.2664
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /P85xREblu1E2b7SvUcszTnU1CzrorZfef6LnHaqUNG7acZsO/RtqrFbkie0FWLHK/NpRz3nOZ77CoNp4xx3RAVFwi3VxLyRtEoZNjxSRmo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR04MB8873

On Dec 13, 2023 / 13:41, Bjorn Helgaas wrote:
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
> > ...
>=20
> > +/* Cache BAR0 of P2SB device from function 0 ot 7 */
>=20
> s/ot/to/
>=20
> or even s/from function 0 ot 7/functions 0 to 7/
>=20
> > +static bool p2sb_invalid_resource(struct resource *res)
> > +{
> > +	return res->flags =3D=3D 0;
> > +}
>=20
> IMO this would read better as "p2sb_valid_resource()" with
> corresponding negation in the callers.  But it doesn't matter either
> way.
>=20
> > + * p2sb_bar - Get Primary to Sideband (P2SB) bridge device BAR
> > + * @bus: PCI bus to communicate with
> > + * @devfn: PCI slot and function to communicate with
> > + * @mem: memory resource to be filled in
> > + *
> > + * if @bus is NULL, the bus 0 in domain 0 will be used.
>=20
> s/if/If/

Thank you Bjorn. Will reflect them to the next version.=

