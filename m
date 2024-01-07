Return-Path: <linux-i2c+bounces-1200-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6638267B9
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jan 2024 06:23:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1943F1C21769
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jan 2024 05:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4175E79E0;
	Mon,  8 Jan 2024 05:23:00 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2071.outbound.protection.partner.outlook.cn [139.219.17.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A559779C2;
	Mon,  8 Jan 2024 05:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TcJ47kYUYRTgrySJRrpep914ZwwJ0wuvtqpR2K/xBpZAHxHyhiAL8100EDjPFRHWwQjzmQsnyFwkM1jnlSYfken1Xv9RHxDcibzHklyK+8/0MjcGwpwIfEA+/30Lh6UXqnwjH5idj/92+ycEZpJ1W80REeswIsZiYfPqEuevvAZFR+OuQEY7fbFm/iPaoXhu4Gqb7ljd7ywHws5QcTVVgP9akrJTPd4BkKHocHTa5EW9j8JaPiiIyajzHtQRLgmABFiTbym/eRPo6LBW7SpPh7lzpDgDtDmTz+EWdgjI7dsBpYEkfLM9SyT49ndlGOlz3xM7HC+hPgL4fP+dBcuIjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FcvonXjMC1UsUrzhChkwYUxc9/tjgBofxieUt34tVd4=;
 b=eEszzH4jpCIoyZU37dnQ5EEouNeckcXZlkya/IUuaTJIXL17Sw7N/tQh5Vi0k9cckrjKQEUZYSNpjIp4nsNqcOlr+ZyX+9XOqIya+CyM/hJGDC0/1VkG9UmzVJIDVDGiME16sxpkFMmWxyWllT3ES6Ks2mJr/4YJllVJ+NZ5Z+1BzNMetXzXFqaQcmkra6fHitRsEiggW12oXP6dLTj27/sIeDvFNs4gJEOzjXF9xXf9T1fJQmgZ+HlWWDUalftpKaSW4fiVM+WisLw3Q0h118U0Vfj/CAJdXx9H8BC9EGVBWrFqEzejXtg3yWoBLb/gkb8j09gb8XP1K95fWqbHCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:19::6) by ZQ0PR01MB1096.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.21; Sun, 7 Jan
 2024 23:47:17 +0000
Received: from ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn
 ([fe80::1dbb:b090:7d89:4e22]) by
 ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn ([fe80::1dbb:b090:7d89:4e22%4])
 with mapi id 15.20.7135.032; Sun, 7 Jan 2024 23:47:17 +0000
From: JiSheng Teoh <jisheng.teoh@starfivetech.com>
To: "andi.shyti@kernel.org" <andi.shyti@kernel.org>
CC: JiSheng Teoh <jisheng.teoh@starfivetech.com>, Leyfoon Tan
	<leyfoon.tan@starfivetech.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "michal.simek@amd.com" <michal.simek@amd.com>
Subject: RE: [PATCH v2] i2c: cadence: Add system suspend and resume PM support
Thread-Topic: [PATCH v2] i2c: cadence: Add system suspend and resume PM
 support
Thread-Index: AQHaKqHICsIFtOoPykiU4PTXtMLy1rCg6VYAgACMaYCAAG4PAIAASqKAgC0BRBA=
Date: Sun, 7 Jan 2024 23:47:17 +0000
Message-ID:
 <ZQ0PR01MB1160E73BE852925A270DBE95EB64A@ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn>
References: <20231210115412.hztjrubacnmenbvz@zenone.zhora.eu>
 <20231210162119.364-1-jisheng.teoh@starfivetech.com>
In-Reply-To: <20231210162119.364-1-jisheng.teoh@starfivetech.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1160:EE_|ZQ0PR01MB1096:EE_
x-ms-office365-filtering-correlation-id: e284a4bf-755f-4a45-2744-08dc0fdafb3f
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 LQx0sz7Cg2zi5i7jLXkrrxyJoPkiEiZDv02RctFQzp537OhbYUhUBU5t6qZ6G8RI06S7CSK3JrSjhf9RCcdhdhEgLlG6O1pUalWYC32czqdkzNrAmatKJsSiI4NEagj/52Aeh+J4RYOT+qA71SynNtKSSUD1NoXh1kiOkQnXGlX6QxRY1lta1MImjTLxT9KxHyeat7bv5j1mJwL03StYq/ZS6vpF4wBNj2zmsJbA6bAFn7/hveKWgK9LTbh+elKTGmOrpHAnYTWvSf5MNzve0iJoOngJ4oqAj4wbtN93JleeTJ4+1NrbB7xfne4SrvuL2LGVVLdoHuMBHih5cf7256ifX+KpL2svFU0jm0X8Ldk3Y0CrXw52pmQ0Pocq+pGEwskT/HoWmtKB7B3e12jdhuuINEE4XbU2JdMXRJNpyHhY2Bb9UqCe0Wge3Uy0G4gQ/dkWZ8n/26PdV8LHpudlymL2VYOpEJHE2e/MuguM90Zz+/sqKyVbyONKVU/l964j3Pu02PMyhDxOMsiHMKTMiMd7hgP1m2szn1K4yEkIMIcWQHog7Jl69QxncpWyUGaQkGMTAdmR9qsnw1WKIPXjY7LfynP18mEUoxNKhoritZo6KswVjKe4qFhko3vK5DmPiJek8BL+3NjkSp2kxcmlqg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(39830400003)(366004)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(66446008)(7696005)(66476007)(6916009)(66556008)(40180700001)(64756008)(966005)(9686003)(71200400001)(66946007)(76116006)(41320700001)(508600001)(54906003)(38070700009)(40160700002)(8676002)(15650500001)(5660300002)(8936002)(4326008)(86362001)(26005)(122000001)(55016003)(38100700002)(83380400001)(2906002)(33656002)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?lhBfLWmWMeCJEu2l1id5B8mF01sWaYdf9NxdkvfUYIV8Qt5y49HKIvdcIi5k?=
 =?us-ascii?Q?oFqJa/mL3cfPvGEuHC71AHL5abohKGcDUAfX/CsayXoOsvkuC9T6cGy3OQBE?=
 =?us-ascii?Q?1zZxp3IwDBxHc9aB60jDxllg0TKrm9op8aVCpgRgc6kuZlBoXs3FJGQpyMPh?=
 =?us-ascii?Q?+rSXj41H0rAe7K5XDZ7MCTb0i2WfmiPxh8JSnGP1nANVtbS3F5+o/6n4i/5n?=
 =?us-ascii?Q?HUcR/fCiLxCvIVoJZOduqBLL4e+D9SXFyQ1IWPZbN2qfa0nCgWSb7KEK/rHh?=
 =?us-ascii?Q?6WDZhmRxLtaX5YSi3hO7gIGjZ4fhHThsNOmxChTwzh5x4YD3za8DWezJUSn9?=
 =?us-ascii?Q?nMpwx/eYAHZAbMHkCPSF7NjWHwUYh/ega8xFRre8Y+/UHmfosm1c3+mqNxtn?=
 =?us-ascii?Q?WZOQpXlP62jDIgvls39rA5tRon/AbtONsghzClLlqa/ddR6SmwuqBEEmWQXM?=
 =?us-ascii?Q?Pt8B9pkxU31kQAoh7KwcHKKifravOTKh4Z0RBwp0MLo6utLO/3sHIYDcUmBH?=
 =?us-ascii?Q?SXAOqHEkpHQrvbq6S/gOFfL53xBWfyODkrOCmbzslUP62Fcn/ObPy4GP9vng?=
 =?us-ascii?Q?HMJ88m9hdCTTfpP5jp2KSBDavjDBvY6qVHK016+yXgGSkD7A+mk/aoM97s6w?=
 =?us-ascii?Q?fhhU0pwmyOglNXn3LEjA5u11EbDJQex2Lx8YvXqwNmu1A69sGCwOIjMOWMpt?=
 =?us-ascii?Q?TM8ha4NuIh7dqdr+dZWrElzqIrYy5Rsw27ERCXZz91rD5gRceNPqvBssrMmF?=
 =?us-ascii?Q?nlhMAO/P7utimNeP95Jf9D3QyzhQATSE2TNq4KqMDFBUrsKudlvLg1fnbOxk?=
 =?us-ascii?Q?kOB/xOsW1GfyfT6TIYQe/3Y/WBrlrxLSgC+vA7okPJvFmVag1myOGcN1XsbE?=
 =?us-ascii?Q?Jl1yH5OPUMoknbvxvNwpPxkqdUuQRedI8mU2RSDUrsYnNfmW7hYryhBMcL5g?=
 =?us-ascii?Q?VDqrFxEqlz3lYvuTg61bUfmnmkkWySRlUxu2wjZsRq4CrJ11flFHzNJHHwfD?=
 =?us-ascii?Q?i42RU1QEVU6eh8w3EGeKNND15sHBUDXcShHXj40BuWckDsix6IGhZQNdw88+?=
 =?us-ascii?Q?HQLMKvDveoifHS+/iTQYp4cLlUJ3aj0BEJy9prQ7gDp8P97fsJ6GiD/tNNjV?=
 =?us-ascii?Q?9QmjBuiTnqTdDE1Ii0/DsDFocTFsCVFmEbpcUp5HDGtWYF8ApoKrmSglioTm?=
 =?us-ascii?Q?1NHfZ1uBZpdyOJKmCNQSDK3kXbDLQ+giq7CsvbOPYCCMFzi/+0gzEAtf7umm?=
 =?us-ascii?Q?F+xXLujsi5jDhF9PmChZ107Ew9g1pmCh8Y2VgYRKeZFPnKDL8hxU/HxXCaqp?=
 =?us-ascii?Q?mr5AwV8qAIYG9NsGQfd54dBgAGupSQhfGMr7ORuniSsESlMYSBSEcWZYTXd4?=
 =?us-ascii?Q?ykEroGFBtW3OwK/qPT2XLV1dM+FxL7UoiJnGGov2QMw3YrbtXvNvwFJoHcdn?=
 =?us-ascii?Q?PTjsyae+EDmlnUPpuEOkLX6BPJuQSLLuUXS9mcuGPzUFo9uokhBCj+BH586E?=
 =?us-ascii?Q?xBgR7+eZ8DUD3R2yUIL+JmluIDKMFrNq7Yq2ZRBSIekoDrrhbFFQuVH0PTLa?=
 =?us-ascii?Q?nimAJhDkPvtjWumrJa8S+jjUw81ghEqfNJ+NQ9zAavES1o86/2nTiGDx5I3B?=
 =?us-ascii?Q?zw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e284a4bf-755f-4a45-2744-08dc0fdafb3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2024 23:47:17.1897
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fB+lhLyfQ7TSY5YmZhV92G+A1udROa3hf7NtmQQz4zlNKcA1RrT84XoaoREhf9T1GHyWSgPjHUaTTF7aP2a4u+QMlav4+sg96Q7H/SRvS1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1096

Hi Andi,

> On Sun, 10 Dec 2023 12:54:12 +0100
> Andi Shyti <andi.shyti@kernel.org> wrote:
>=20
> > Hi Ji Sheng,
> >
> > [...]
> >
> > > > > +static int __maybe_unused cdns_i2c_resume(struct device *dev) {
> > > >
> > > > I am not really understanding what you are trying to do here:
> > > >
> > > > > +	struct cdns_i2c *xi2c =3D dev_get_drvdata(dev);
> > > > > +	int err;
> > > > > +
> > > > > +	err =3D cdns_i2c_runtime_resume(dev);
> > > >
> > > > First you try to resume...
> > > >
> > > > > +	if (err)
> > > > > +		return err;
> > > > > +
> > > > > +	if (pm_runtime_status_suspended(dev)) {
> > > >
> > > > ... then you check if you are suspended ...
> > >
> > > This serves as a check and balance to ensure that when the system
> > > resumes with device in runtime suspend state, we disable the clock
> > > enabled in earlier cdns_i2c_runtime_resume() to ensure a balanced
> > > clock reference count for subsequent runtime resume transition.
> > > Similar implementation can be found in this commit:
> > > https://github.com/torvalds/linux/commit/44c99904cf61f945d02ac9976ab
> > > 10dd5ccaea393
> > >
> >
> > OK, this is done purely for clock balancing, but then, I still don't
> > understand the case. I expect the clock counter to be unbalanced when
> > you suspend (because is moving towards '0').
> >
> > While, if you check if the clock is unbalanced when resuming, it means
> > that the clock had a negative counter (which is impossible because the
> > clock counter is unsigned).
> >
> > If there is any unbalancing at this stage, then I recommend you to
> > check what has happened previously.
> >
> > ... Or is there anything I am missing?
> >
> > Thanks,
> > Andi
>=20
> You are right, the clock counter will move towards 0 during system suspen=
d.
> Conversely during system resume, the clock counter is incremented to 1 ea=
rly on in cdns_i2c_runtime_resume(). So the clock counter
> is not negative to start with.
> At this point of time, clock counter is 1. If the device is in runtime su=
spend, we decrement the clock counter back to 0, so the
> subsequent runtime resume could increment it back to 1. In a sense, balan=
cing the clock counter.
> Please help correct me if I've got it wrong.
>=20
Just to check on the status of this patch. Let me know if the above stateme=
nt makes sense.
> >
> > > > > +		err =3D cdns_i2c_runtime_suspend(dev);
> > > >
> > > > ... and suspend again? Shouldn't this be _resume()?
> > > >
> > > > Thanks,
> > > > Andi
> > > >
> > > > > +		if (err)
> > > > > +			return err;
> > > > > +	}
> > > > > +
> > > > > +	i2c_mark_adapter_resumed(&xi2c->adap);
> > > > > +
> > > > > +	return 0;
> > > > > +}
>=20


