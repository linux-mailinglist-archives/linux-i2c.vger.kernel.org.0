Return-Path: <linux-i2c+bounces-1451-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C87D383C693
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Jan 2024 16:30:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 424781F268DD
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Jan 2024 15:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A66CE6EB71;
	Thu, 25 Jan 2024 15:30:47 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2088.outbound.protection.partner.outlook.cn [139.219.146.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3264F5EC;
	Thu, 25 Jan 2024 15:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706196647; cv=fail; b=LAqCfEA1eBEbweHdVFElUJNAcA0Zr+FNBfZiry6fEzC1tDMJePYvWFCMUiHWKANGLtDDDzPzCrJXAaG2IvAOyDkw4nVjNl04pgZIyi0t3ZEEEcMAEYdPPOpjCo9EHIY+jxLQAK+o4Ulqy4SlWkvjxC34h56WaYXkND6ecSbxR50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706196647; c=relaxed/simple;
	bh=z7qAv4AV5fwkoR3kI1I6sK6QnOFeDHu3atsTYIAJQyI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=G9kgPyo2Da5VpsKQt2p8H02sS2MPev1HBCDHRJSHYBXxncXeluHi7ykj0AbmoeJV08st3PSiWO9ZE0yV8DyiwOqzbPnp9hJm1j982u9fGawCVExgbsPcgVA9todmxOy8Qpt0ms2Lv+yRfyejl8Vy7kYR+ICAkJghxnp7CeG9IXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jJ+szIXLX7AnCLWEwYWH0C5f8ms/6qLL1f3hKNm5jgajLi+VJz3Ad44uGqFwl/cKUSyOCSIbN2TAEt+v1omjmL6/7r8xWGWIPASFMxZBVUSSktCO47e8Xpb8e7+2FYw2YYLNxUPyM9J/eLNlPf9P94rb/5cJ1ovjmf5ayyIYTqOj7CDvrmLOdP39378h94bGSlc+HTiOqU3+ZVvuAwZkwhjmYNVL8SrEEV/dKAdAJhgxfhuVy6MNJ4cnkztR12LsBx2EOnUj5esb/rzQshpBXX+b5lLSq7wzSPvzx9wB8yBxrVzavrqP83FaWHVwiSCr3nI5AC0K2Id9FdOWjdMuCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vHLGcCGY51mno9O0JWOzyaDt9wppBki51LXHYhMym4Q=;
 b=JGbGTydV/pXIfAEe4riaW9IjWVKu78sDQqyI/3jR1NmcKQ/yE7d6ZNc4okab/s55+xCoY7wiLWrrVWYRd9U9jCwGsYw3Qik/ms/CUyp1xnfKPJYac/qlENDWHeN9TAQ8TX1tKaN17afrhi61K/euL1NRFkz+P5MxFO482gvOBRLbDl7yao8MPWx+GdXxYTwhYwvPu5L5x+bfXTtoPyppNXaOVaZQ0R09giZcCmRpGxnnnZ/OxktgXsql1/qTGtD+MU39Eeuta1EbU1e+1Jii/R10EwhDC+LJ8jNiWtLuEaMbe5SVkQBTdc82iZM/M5z8LJTQmt360x0Mu8/cyCX6fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:19::6) by ZQ0PR01MB1112.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.26; Thu, 25 Jan
 2024 15:30:31 +0000
Received: from ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn
 ([fe80::1dbb:b090:7d89:4e22]) by
 ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn ([fe80::1dbb:b090:7d89:4e22%4])
 with mapi id 15.20.7228.023; Thu, 25 Jan 2024 15:30:31 +0000
From: JiSheng Teoh <jisheng.teoh@starfivetech.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: Michal Simek <michal.simek@amd.com>, Leyfoon Tan
	<leyfoon.tan@starfivetech.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 RESEND] i2c: cadence: Add system suspend and resume PM
 support
Thread-Topic: [PATCH v2 RESEND] i2c: cadence: Add system suspend and resume PM
 support
Thread-Index:
 AQHaSneNdhHjB60n1E+M74xAv32s77Dkvb6AgAE6hjCAAelHAIAAgvhAgACPG4CAAb13EA==
Date: Thu, 25 Jan 2024 15:30:31 +0000
Message-ID:
 <ZQ0PR01MB11604CAF5352B8E99740B59DEB7AA@ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn>
References: <20240119013326.3405484-1-jisheng.teoh@starfivetech.com>
 <ko44i4n5synf3uugp4wmjoe6eikyw3bzjtmarduwvskmk4d3dr@uewx27aa6ake>
 <ZQ0PR01MB1160390D00404D24A31A1522EB75A@ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn>
 <3w4vaxoderuhwkqec6rwem2wrjlvql2ohyh77zqpwege7ercpl@5ac4p5mw7nhp>
 <ZQ0PR01MB1160DC63A1CC70F79036057EEB7BA@ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn>
 <y2sxh2jkvujnaxeknbunogkumywjlohp3hi6dkf5dkc3qko27s@vg2qggq7lzrz>
In-Reply-To: <y2sxh2jkvujnaxeknbunogkumywjlohp3hi6dkf5dkc3qko27s@vg2qggq7lzrz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1160:EE_|ZQ0PR01MB1112:EE_
x-ms-office365-filtering-correlation-id: d685fc94-980a-4b40-aa40-08dc1dba90d3
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 tHqQ4h9WQ3gctgFZ5t7eS3/WDRgtMap7uBAlsko9p4X+9iiXwDo5pfk0BRUU94HLJlsWSXSt9AxnbxNY7l8fW2P18Ee6sr14WUFmBhRusa9oKbItuxhGHPfYC2oINQwTpBTrvR9im8j6x3NYV7JBHOF0OKv9Y77xT5VMJv7wPf3qT9J5zGjpIPxPiVsEtjtEObtqcJANaGEttG/jLXmEB00HQw/BZ6oaNfZfpS8WQrWuQW3M+dQyaQNF71vMrMJkEVHmW7WZjjmh+/gCah3E2zDG2GVLRLqx5n9P/aI9F6EmNtPQ/DoRmxzzlacEUdnz4EEZHOqZn2Ob44+wHseXY0VmPikObUYD+xducLCZHeN+CZH0sQUljDQZwMf1knfuAgEljOBFR1tXVwmkIH2TqPxzbG1pmfjofCMck5UsvfpsdeAcdZKs+jxMU6rLdH3rstwV9WC0EmguHr/uesU9kCEPK8yXM2Ga4RW1aob89MwSEQoL7nUYtd+b8C9d83Bs4m/lc8TULhIteUGz9s3VmL9DBLBiUWBXK+hdaAxpzjCGSXsd300eVGR5X5qfcxqq
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(39830400003)(136003)(346002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(55016003)(41300700001)(83380400001)(41320700001)(33656002)(86362001)(40180700001)(40160700002)(38070700009)(122000001)(38100700002)(9686003)(26005)(7696005)(2906002)(508600001)(6916009)(66946007)(76116006)(71200400001)(66556008)(66476007)(66446008)(64756008)(54906003)(4326008)(15650500001)(8936002)(8676002)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?wF9QCCohzsMeGUsfk8NVEPBgdpegF0dPpnDe6oIt/z/FFjBVaZHeiO/l0slt?=
 =?us-ascii?Q?UkzmQaPLsB0Ss96FZlytbNmr/hnU7N0+PXSou9xb0ukbF+qlFJtgrGchV1Ng?=
 =?us-ascii?Q?MU1eTki6V6jV4ZGSEmMcOVuBwiBoyr9MvZlHdjwjfP1qyAxt1Rr9tJ+kMvOj?=
 =?us-ascii?Q?X5FZW0XdWiYzugYRmjppP7CdXYXvooLVQXX1Ml04YlkEIcCOR04j7oaiYJZ/?=
 =?us-ascii?Q?gFqXNLYPjQKv263SO4rqH8IzBjvQ4anDfy9rVS6qWhsnF2e3fOE9OR3tM3Bl?=
 =?us-ascii?Q?QQptuvvDktu0W+WzGEzGxWETL8WcQiMMcXeXc+agRuLHtpfKnCRMus4bBbP0?=
 =?us-ascii?Q?pS4TISjQDCgWMvyNRuI6D/anxqZq10UtXI5ImCCsYN6wq1vW0btFxe/r9NqE?=
 =?us-ascii?Q?MIA6hKDf9M0qdn1UcOyaRCDcHIaJxn4YYHmP+RhjsPykoZXPpH6sRP+Qf9rF?=
 =?us-ascii?Q?CRVaqkssN66L32cvSTu6i9RdEvHc7zbnMmKnVCZ0q6UTpL0XuGKPd0MwvDNn?=
 =?us-ascii?Q?W20jw1azQdUJPq2ueVay4Znh6Ix2l5QmDd53rbNsuzsRzfnvr36Tkk4yb3lv?=
 =?us-ascii?Q?SuxhRtWFTu3jWG3OKkGI7/J+VkoA4pGATXjmCnyMdecInlyPEacsBd3A1toW?=
 =?us-ascii?Q?9ZVkVkqAEHBx9Xb9YsM+Xm9ebf4QdmNH8ku0ggyQSLaIL09gA6C0R9+VkrwF?=
 =?us-ascii?Q?csY5y6vPgZFaE/mlGENObb/Pbd57h2J3fOAXFzanfkM2Hpv9NK3SaBMqIHcs?=
 =?us-ascii?Q?nVGKMMDuvKhbcHQTLh/UXtU9VCQg8bCl3suKXjEr3KrC+4mEVYARkUc7Q8MS?=
 =?us-ascii?Q?xQsgXzyiRpnJkekwr9q83oL1baopcio65qocozp1twxXfOtDRsBC2CXXEWWp?=
 =?us-ascii?Q?WrrzOffGyAjrDKhlyz3HoFfdxpXL4R9YfPS+pgcZSK0ewvXOVBxrvKVs06bg?=
 =?us-ascii?Q?ZuARwyP7FVUeXe3M/VJQVlL7y0TepgY2jy8gV4s87y39Y28UDqzx2ip7TGsL?=
 =?us-ascii?Q?MLy5QV6DEGKY34OKuJ29LBj8FR4Vw5hLa8kyr5D4idM7wkE0sqRgoklMp/Xv?=
 =?us-ascii?Q?PrULmBeqjNCLHziddJr7PioAoqfqExHqtk4ALWhV35Wk4ElFa05dA+mu4S9F?=
 =?us-ascii?Q?Mx/V+JtKdtqkZk/ZV5PbLIBxAdKSHa9YuO/P7Rgxps7aDwkByLeolZexZfa8?=
 =?us-ascii?Q?PjxHa70zHLEyfGi83PBgdKh04Juk5z4P/wGNnXA5FwUYnhRtYuDxHpEZNZTN?=
 =?us-ascii?Q?gaVHOs0o3B5FKBzj/zGFhSZ5eXftIoekiYl8QYmFuoiAoGquEGseAVcAfJI2?=
 =?us-ascii?Q?LaIURr+aIZr8+bgj7WYZXh5U5uxc+qhXey2iKNW/IOwQAdQHVRIOhRJAxhjM?=
 =?us-ascii?Q?XP86+gIikBwLCpcmL+ZDsCZ8RukLPNjGE/AGDaJQAzeoTOXaHtDUGwslGdIo?=
 =?us-ascii?Q?EZwmwK92tH4DnNS4NV2dfi275fixmYHY2a0SLqlaR8VuzfnnBkUES8jMwuiv?=
 =?us-ascii?Q?zpyjy26pk/3b+IZq1BNcsUID9YI66pqy+/OiBWtOX/fXce8yjuMvr3krdZNz?=
 =?us-ascii?Q?3ovzp8rM79ZFBSQVHGDMbxwB6da8oHW50x6AX6gOrEMtnz0Jq4CzP+F1sUyr?=
 =?us-ascii?Q?hQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: d685fc94-980a-4b40-aa40-08dc1dba90d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2024 15:30:31.0446
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kHQIqvxctBFsAtv7kOz1L/gMCjYcQrDIdi3cLoUxl5i2No+Gv/qQlsWAXyTUZ2WOewF03ZT8b68eflmBEEogIFEMi07od0O2HKwMrg/XpSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1112

Hi Andi,
> > >
> > > ...
> > >
> > > > > > +static int __maybe_unused cdns_i2c_resume(struct device *dev) =
{
> > > > > > +	struct cdns_i2c *xi2c =3D dev_get_drvdata(dev);
> > > > > > +	int err;
> > > > > > +
> > > > > > +	err =3D cdns_i2c_runtime_resume(dev);
> > > > > > +	if (err)
> > > > > > +		return err;
> > > > > > +
> > > > > > +	if (pm_runtime_status_suspended(dev)) {
> > > > > > +		err =3D cdns_i2c_runtime_suspend(dev);
> > > > > > +		if (err)
> > > > > > +			return err;
> > > > >
> > > > > We call the cdns_i2c_resume() functions to come up from a
> > > > > suspended state. But, if we fail to resume, we call the suspend a=
nd return '0' (because this always returns '0').
> > > > >
> > > > > In other words, if we take this path, we call resume, but we stil=
l end up suspended and return success.
> > > > >
> > > > > Andi
> > > > >
> > > >
> > > > My understanding is that during system level resume
> > > > 'cdns_i2c_resume()', the i2c device itself can still be held in
> > > > runtime suspend
> > > regardless of the change in system level PM.
> > > > Looking back at this, we invoke cdns_i2c_runtime_resume() to
> > > > enable clock and init the i2c device, the runtime PM state is
> > > > still
> > > unchanged and kept suspended.
> > > > pm_runtime_status_suspended() will be evaluated as true, and
> > > > runtime suspend 'cdns_i2c_runtime_suspend()' is invoked to
> > > disable the clock. This balances the clock count enabled earlier.
> > >
> > > If this is your issue, what if we do not enable the clock during resu=
me? and we just mark the device as resumed?
> > >
> > That will work as well. The i2c device will be runtime resumed again
> > during cdns_i2c_master_xfer() anyway, but thought that it would be a go=
od idea to check if the i2c device is able runtime resume
> during a system level resume.
>=20
> That's fine, I think it might work this way, as well, so let's keept it a=
t your original implementation.
>=20
> If we save here, we add complication somewhere else.
>=20
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
>=20
> Before applying the patch I will read it again to make sure all is balanc=
ed.
>=20
> Thanks,
> Andi
>=20

Alright, thanks for your review.

> > > > The runtime PM state is only resumed during cdns_i2c_master_xfer()
> > > > through pm_runtime_resume_and_get(), and subsequently
> > > kept suspended through pm_runtime_put_autosuspend().
> > > > Since the cdns_i2c_runtime_suspend() always return '0', I will simp=
lify them as follow:
> > > > +if (pm_runtime_status_suspended(dev))
> > > > +	cdns_i2c_runtime_suspend(dev);
> > >
> > > I'd prefer checking the error value, even though we are sure on the e=
xpected return. It's more future proof.
> > >
> > > Andi
> > >
> > Ok, I will keep the original changes.
> >
> > > > > > +	}
> > > > > > +
> > > > > > +	i2c_mark_adapter_resumed(&xi2c->adap);
> > > > > > +
> > > > > > +	return 0;
> > > > > > +}

