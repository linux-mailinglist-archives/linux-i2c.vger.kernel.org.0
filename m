Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 384F43EF86D
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Aug 2021 05:17:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233901AbhHRDRy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Aug 2021 23:17:54 -0400
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174]:53612 "EHLO
        mx0b-0016f401.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S235464AbhHRDRw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Aug 2021 23:17:52 -0400
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
        by mx0a-0016f401.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17HI2cUL015238;
        Tue, 17 Aug 2021 20:17:14 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
        by mx0a-0016f401.pphosted.com with ESMTP id 3agj1thvka-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 17 Aug 2021 20:17:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ThuiBTK9CYpG1nsNWE0Nr8Zbrc0gWmB7f6agCtE5DY7mQTK8anj+UcumN5FJkjh7v34yqo9lynOG239U+fMs9xKfpSPDx5g9OrjhIdVnJtbmeulKrLjegdIUM4jOR9fhk6sHii3qXnrFx+ib64FRvYjXCykpWZvOQQHE640QxKCvWSXI2eAZQGWHwUDUBNLNkBUbXEz/mc9ECOA30Oh+zKwFg8oDvmxQ4yON/z6QKaFuagYMNcRZEqxWx2F7oeVhcebs3Qs9pMyQucbWMHLUWoK9Xletb76HIVRhpSMbnI2VdxDhXDiLdbECiVePvcFZVBMSkT0EP7vFT9/IIZJ25g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2038UJP6qJWeVdsbZ7RirRBu8mvw32af95H+JdK3cnU=;
 b=BK2/dh7QuEaH/43YMosJgnkaYQviTn5RefONagbZ40K9nTbkVEbGbnC5fvzI1jgfU/idxE7+lgg4sV9M/K4+xxGxxLP5i79m0wT6vhfU8//UHtzYwM6eA1Pe9mD/MQIJUdnUo+T+oUIqlVVJhIz9nJeNLeIKepmKRXiLoCQP1P4iS6HpyBABkfrMe11n/vo7gDjAh1niUgne5jhg2+7fgwUaMvgksnn288FIP7MSkSaHlgiIC0EpCvJuROewsYEl/bcCX2rw05D79dYDMCR09fUY4c1DLQSTuL7vOOUb+4IOYMxrXQupChDOnYffvCzQ2VEw7ydfhGMpDWO+ofLyVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marvell.onmicrosoft.com; s=selector1-marvell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2038UJP6qJWeVdsbZ7RirRBu8mvw32af95H+JdK3cnU=;
 b=O9R1lt9Bwb6/Q0oquUcbknHiqMBsXQ3JGeLXNVvPiNWjqEmgFNxkeEwyIoE9KqBFfRwwG9udYv80wfNuCYh9khyrykR85X6hnL2PQWcl5uDgUUWNaomIuIofgMvGSn9q5fusuZYxvJcneGPQgXzxqtC64VrsP4XaSwmXaL8Ur4g=
Received: from BYAPR18MB2679.namprd18.prod.outlook.com (2603:10b6:a03:13c::10)
 by BYAPR18MB2904.namprd18.prod.outlook.com (2603:10b6:a03:10c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13; Wed, 18 Aug
 2021 03:17:12 +0000
Received: from BYAPR18MB2679.namprd18.prod.outlook.com
 ([fe80::c5bd:2699:2b32:f948]) by BYAPR18MB2679.namprd18.prod.outlook.com
 ([fe80::c5bd:2699:2b32:f948%5]) with mapi id 15.20.4415.024; Wed, 18 Aug 2021
 03:17:12 +0000
From:   George Cherian <gcherian@marvell.com>
To:     Wolfram Sang <wsa@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        George Cherian <gcherian@marvell.com>
Subject: Re: [PATCH v2 5/5] i2c: xlp9xx: fix main IRQ check
Thread-Topic: [PATCH v2 5/5] i2c: xlp9xx: fix main IRQ check
Thread-Index: AdeT3v50jjqATA0NRzy6Jiub749ndQ==
Date:   Wed, 18 Aug 2021 03:17:12 +0000
Message-ID: <BYAPR18MB2679D00186101EA4D521DFEAC5FF9@BYAPR18MB2679.namprd18.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=marvell.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1e989845-4dfe-4146-5404-08d961f6ac17
x-ms-traffictypediagnostic: BYAPR18MB2904:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR18MB2904ED4B23C6922F8EB43122C5FF9@BYAPR18MB2904.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:196;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1cR3OyTF0078i8EeJvS4e8DzmDHJFuAjDTc+dAy4dUypzEYGzHssk3YZXWon3hUa17NnEwKTMrbbsvWkm5JRwKlwupP+cy7RzUqwZ0OKg9/wbt+fUEoLGMuHeZaM21E/fxvEoOPL5RUA94Wl1xjq/qleC+rDBQLCNlC+NcbroPuKsGqVdMNDmYccWM7NcJeYAa8IE9QBjwOVDszAh6Owma1hctMO31caRdYIXOPl0pgw99Z4Z7meynaOY2fD6dz5qdRWBdt41xNqqoQR7OpQnEFEewXuH/Vv3sbM1mF4hzevpM3aOTMnMwFatsrCm4OQ6c2SZgE5p10yssx2/REnVf1BMIU+XuUjfoxOa0L8qJzIScrNZhE4mvYkbqdyWXDgxqWvd2CKVssK7vq9z1YxWuYcMqCrmT3dx/8fL1uTuY4pdlGBebwYEO9111ebJiHnmqvCdeLCV8Qb6MHfJ+0JYYkzAowALXbeRYhiesZtrxNXQX5BSaP6pU2mGMHsQ/I7tUxNw9vqnqPja/gtbBef52vatGEpkMnm0+iDvh5xYSO3qaFitzVnuLXG73AHhSe8g7vYKmOxyg5n568n+wYCTes/saatOPf5xWh+fhnHGXvtXgHajd9digKWzDN9E3e67F32b+BWfst1bmGLeJpERUCwouZJ9r7womSoybSIrVq8EU3sE1qxLGqLPx3kWhBIfjJe8JzUlOggpT2gIxu0IbbhSFfboU8JOA9ibYpnxirx1Xw9vDkhN7Ij65MX5JQMdJQEFE0Z85kB9NXCyTCuHRy6TRH956EpX30sqGqA37s=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR18MB2679.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(136003)(39860400002)(366004)(122000001)(52536014)(83380400001)(54906003)(8676002)(66556008)(66476007)(8936002)(33656002)(66946007)(107886003)(110136005)(7696005)(316002)(2906002)(38070700005)(38100700002)(9686003)(86362001)(53546011)(26005)(55016002)(186003)(5660300002)(66446008)(478600001)(71200400001)(64756008)(76116006)(6506007)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SiYNTD1nMf00i8K4GWqza86myPrcyAIURk3A4gZFFYrP7dhTmXsVwEQFWoEi?=
 =?us-ascii?Q?F3oK7Y6etAqPTiST0+cLY0Yxh5joMEBuSo/JvQvVwwMBC8KCFEuHd3REkbZe?=
 =?us-ascii?Q?5omS9pXYtVJX4Y+GqAN3lbv939Y38n8n7cFkf2qJl+Fjlrq5xwjCE9UMJbQG?=
 =?us-ascii?Q?5ISSdPE5bctfmG38+Iwlr4Sr8p+MJXnRQuCAgAZs1dO0GIXgLx/qykQSFALA?=
 =?us-ascii?Q?R+Suw2ADyyth+1P2K/fmsk5XcT8gvOwBxD63rHseipl61CE08H540ss+5iwf?=
 =?us-ascii?Q?IJJ4+/0S9DZmYExcbvkABMJR2zrKejyjihAiwDvvPw0VGn9Q8weAfN6ubsj6?=
 =?us-ascii?Q?Y0fTuRzF9v4ILCyGhBb+BTuTtaTamQ21bHdsgGxFaEwYOxMETLdwlgfgZnHT?=
 =?us-ascii?Q?j0ayimIqhABJZJrSirhkCEXDZE5ZAcW0NltQKAqNp/WVhAS0DuQWjzx8mPEZ?=
 =?us-ascii?Q?qmVV7Kxm6GPuaLcEhFAIyaK9mM8aJhOaeYkd8GV5kIH//5wtVv92P72kfyBq?=
 =?us-ascii?Q?fIBxK3evljgW6KohuP4HPnXnzcHbEvm9BIwnBSE9KbcdJBEdskFoi/JxPduG?=
 =?us-ascii?Q?iLqs34ZxBtNfR4VVVhJ5Jz4AtBHC8dYgfluZ0zJkL+CD9dKaEVEJYjm0D5fQ?=
 =?us-ascii?Q?6kWQ2uvShPbQ/yaCiUX4M0M/CoeZH0Zb0II5vICo9I21Ku/VTuCN8RsXIxoR?=
 =?us-ascii?Q?BQMYgYGIlWxuGAIuBcmUxrpu1GPl0hd8DkbdsXmRGDa3XrXEhDXsL34I1oru?=
 =?us-ascii?Q?9iUWzA6rhX9e6iuurUCFrF1PWB2mrd3Il60dLCb9rDEO1KTcwst/hplnWctT?=
 =?us-ascii?Q?2S8EtVb3gpyHEzKYcF1AI57j4wxPPJYQjwmN55TECJ8Vq3Nfbmn+0a5v1fyd?=
 =?us-ascii?Q?fELmonjW0Tw4nTjndyW4Y+EOPJhADZy4LGTPoBUDb638M/oyjN0Q9ltQWWK9?=
 =?us-ascii?Q?B/Asq1lhxuxSQHIpgXc3umw2iQ/SE4oUcpk8ROvb14G/WWeaTWpiH2QayrvD?=
 =?us-ascii?Q?c2KRL8GFx1AACdp6QUn/Fo7Ejo6eYXkk9QF4KrTtzzqgYsOfycV0YEgh/hdU?=
 =?us-ascii?Q?JZUrErkepeObVhxYkgdjInuCZ9pS+y6hmIklHNCdhD4ITT2ZoiSiqS1ys9N2?=
 =?us-ascii?Q?P4k/A5X9AJOpkaiBp8LO1ookKKG4RdlhpdckfauqVq6A2E2PoCrKIBioaH8c?=
 =?us-ascii?Q?Z895UaX/83sTunsP6ls/krH3CsN4VCoz1sSILrLPfMElUksMRu7w2hEK+m98?=
 =?us-ascii?Q?g/GbavYSEWfQIlYkzxRRvRWbDCVP34L+J8WOIOhnxW+qfIOhWrvYO5YCXfyp?=
 =?us-ascii?Q?foJgnAwk/+RTclTe8q6vPd0n?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR18MB2679.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e989845-4dfe-4146-5404-08d961f6ac17
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2021 03:17:12.5465
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uKXvlF/h6edDmrLGLZ8bX6e6ocIhXZrSqLrdbUGfqgmStl2pnhNUB+FHzEAj1LJzoEZrSUUPbCvAO4w0L9onUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR18MB2904
X-Proofpoint-GUID: Gg7n4ahoU0cTAmkvI8oOpv3sps5n6oKp
X-Proofpoint-ORIG-GUID: Gg7n4ahoU0cTAmkvI8oOpv3sps5n6oKp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-18_01,2021-08-17_02,2020-04-07_01
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



> -----Original Message-----
> From: Wolfram Sang <wsa@kernel.org>
> Sent: Wednesday, August 18, 2021 1:43 AM
> To: Sergey Shtylyov <s.shtylyov@omp.ru>
> Cc: linux-i2c@vger.kernel.org; George Cherian <gcherian@marvell.com>
> Subject: [EXT] Re: [PATCH v2 5/5] i2c: xlp9xx: fix main IRQ check
>=20
> On Sun, Jul 04, 2021 at 05:47:54PM +0300, Sergey Shtylyov wrote:
> > Iff platform_get_irq() returns 0 for the main IRQ, the driver's
> > probe() method will return 0 early (as if the method's call was success=
ful).
> > Let's consider IRQ0 valid for simplicity -- devm_request_irq() can
> > always override that decision...
> >
> > Fixes: 2bbd681ba2b ("i2c: xlp9xx: Driver for Netlogic XLP9XX/5XX I2C
> > controller")
> > Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> >
>=20
> George, do you like this patch?
>=20
Looks fine.=20
Reviewed-by: George Cherian <george.cherian@marvell.com>
> > ---
> >  drivers/i2c/busses/i2c-xlp9xx.c |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > Index: linux/drivers/i2c/busses/i2c-xlp9xx.c
> >
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> > --- linux.orig/drivers/i2c/busses/i2c-xlp9xx.c
> > +++ linux/drivers/i2c/busses/i2c-xlp9xx.c
> > @@ -517,7 +517,7 @@ static int xlp9xx_i2c_probe(struct platf
> >  		return PTR_ERR(priv->base);
> >
> >  	priv->irq =3D platform_get_irq(pdev, 0);
> > -	if (priv->irq <=3D 0)
> > +	if (priv->irq < 0)
> >  		return priv->irq;
> >  	/* SMBAlert irq */
> >  	priv->alert_data.irq =3D platform_get_irq(pdev, 1);
