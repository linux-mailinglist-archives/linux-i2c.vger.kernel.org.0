Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14AF328757B
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Oct 2020 15:54:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729808AbgJHNx7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Oct 2020 09:53:59 -0400
Received: from mail-bn7nam10on2041.outbound.protection.outlook.com ([40.107.92.41]:59240
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726875AbgJHNx6 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 8 Oct 2020 09:53:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UsQdHS83B82VaCyIkcUlzgm0yhuqSl5cYLjH/OXqnlIWIQ6pRqPvU+5dhAgYifMGyJkmkV2gS9ECYg90uBg/Ai4HcdsLgiUnh6jH9/4xrdYCc3pRFIIpWngp670Tfrk1jIjC8ty/ebazTA4gY1XAhQnKLq2bwAMDtofJ5hbpRaIoKGgigbkMunV+MrGwgwVdIdvqSJ9glmNo3IdduDSTTygF82HcfNzoZn70vYLtYDP7u9qKJctCM1incLkRGfuNIDixbpmMt1dPjVeHGd7yaiB2BXlWUjsxAWaAKOD0M2SN8WrbKrh4//T425XVTTVmCUJd1cSTvMUn1iOT0g+TDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QOwssnWEpwCYeb5XXIBISUyaQgfSWiaVmWPZSJaZgwI=;
 b=i/63UXemGWFft/axsbd3I+8NyLxUQZqGJhG3J1g0IPaFCc5pZLIcwcPRHRXfMoopOFejZTKyrBLzop8y8TYfjbrWmHEMdHY7TrWW5WReBpOMWQcf4Ir4/D9LspeSOOfNLoI+0zHiUAThcGYzbBpFcuEszkL8qaOgiY+hAAaxqIbh8eZLyubMIYkcg3mMWJn10fwe5jP0UBZgrD4h98trn9u6JbCSPhXAPx3RgywXBiFHGOAcG1QpkoHgJ2nX3N8Sz7vcKF9QMQzIC/FVz5ZFdz7eckBwpBlWcHLoIrHzWMT3xulIjTeFoeE7L5Se7kCT5bpcGk2J5JoXzRS24cu3Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=openfive.com;
 dkim=pass header.d=openfive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=osportal.onmicrosoft.com; s=selector2-osportal-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QOwssnWEpwCYeb5XXIBISUyaQgfSWiaVmWPZSJaZgwI=;
 b=S3MdwgEt5MjmvHdVmLwSZUmsSS4kjJ903v1Y4W7unwgb8G6rU7pQshwKd0kbIXZ2S7oTFtoJMhVYBbv069ziMYYvkjP/UAohgcTiA2E0DNhRwzQP2QO1brmUaHR5dVyRUcWWdRpkT5cWIG691vZYGPxf4F5zrmtV5OWsRErj2nY=
Received: from DM6PR13MB3451.namprd13.prod.outlook.com (2603:10b6:5:1c3::10)
 by DM6PR13MB3210.namprd13.prod.outlook.com (2603:10b6:5:5::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.13; Thu, 8 Oct 2020 13:53:55 +0000
Received: from DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::a48a:1f7c:267c:876]) by DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::a48a:1f7c:267c:876%7]) with mapi id 15.20.3455.025; Thu, 8 Oct 2020
 13:53:55 +0000
From:   Sagar Kadam <sagar.kadam@openfive.com>
To:     Peter Korsgaard <peter@korsgaard.com>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "andrew@lunn.ch" <andrew@lunn.ch>,
        "Paul Walmsley ( Sifive)" <paul.walmsley@sifive.com>,
        "palmer@dabbelt.com" <palmer@dabbelt.com>,
        "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>
Subject: RE: [PATCH 1/1] i2c: ocores: fix polling mode workaround on
 FU540-C000 SoC
Thread-Topic: [PATCH 1/1] i2c: ocores: fix polling mode workaround on
 FU540-C000 SoC
Thread-Index: AQHWnAmkr9Lwbf//qkyD2meVp4P0G6mMBUVSgAELwtA=
Date:   Thu, 8 Oct 2020 13:53:55 +0000
Message-ID: <DM6PR13MB345137AD526D0AAA6CE0DBDF970B0@DM6PR13MB3451.namprd13.prod.outlook.com>
References: <1602006796-273724-1-git-send-email-sagar.kadam@sifive.com>
        <1602006796-273724-2-git-send-email-sagar.kadam@sifive.com>
 <87imbm4639.fsf@dell.be.48ers.dk>
In-Reply-To: <87imbm4639.fsf@dell.be.48ers.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: korsgaard.com; dkim=none (message not signed)
 header.d=none;korsgaard.com; dmarc=none action=none header.from=openfive.com;
x-originating-ip: [116.74.151.16]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4d5542f2-e212-48f4-9f99-08d86b91993e
x-ms-traffictypediagnostic: DM6PR13MB3210:
x-ld-processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR13MB3210D0AF366EF7CD7B140A9B970B0@DM6PR13MB3210.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KYY6FoCU3RzTN/mXqyifBxqSEDjYxwM6Dnd+X4HohAUjaS6362W+ni4GJax9Uy0hP5jFY/T/7cuYh/NSyWW5pii3siy5cBB1X4HcDLwoGeANu4VAbGeD1nch4mX8fzOMvfC8wN7hJ8J5W9LeVH6DcZ+Y4e1Yd0iFhxCJZu4dGEsQzhqzqXGY64feRdmmUIMO0/hlxNw1bs42PPIAPbk+RtNNC6nu3qNB/dNqhxB014vdwlSMMQCskvidtNV0zkK4WecbLOByWfth0218Phoj/pCa8u6q82A6YzYIxKvnNUY+9vNh2RabRSKeFREqY24f
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR13MB3451.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(376002)(136003)(39850400004)(366004)(86362001)(5660300002)(8676002)(8936002)(4326008)(44832011)(71200400001)(6916009)(9686003)(55016002)(33656002)(66446008)(2906002)(7696005)(55236004)(64756008)(76116006)(186003)(53546011)(26005)(83380400001)(478600001)(52536014)(316002)(66946007)(54906003)(66556008)(66476007)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: dejgIB1Nto6y4AXiqYhwY273LPUqtYXv5f9L7UrIpI52hhMgEHe2DTbUgytJN72UWxIJ215yEM3O57hovUZLhC5ElK1TJJ7ZoTkkLaBPw+L/J8vs2BY3RkaQBcqCbYZOk753TAClr2GAwwGRWaXP26lWTvnGhM+5ZGC/rto/GlzxWAqMPnHU4cTZXZ1Xs4LDqTw1UN30+58u8RylnMfkbJj3fy6fKVW67mRsVFTY7QIN1fEQFrvsbOAYsgfy63gIyT6duNLMzf6IcZjahdjbw72uWvW045gQU/KD6XSTI/oqAPSvbisAX2o/VVfRhDuBeqNgNZ3E5UVYHlFrEibDNrHU8K1WwQ9I99Am+pgKbP5qlCmNZ+SmBcn2TOSQyH9liDMCV2bwqbCSyEa6ZPxkcyWx4+zhaaGFdCjocthfbNtE0r0r2o2z37mpR06qZ+ANygUmgFFbR9Ioz9AeI2wMG3hLsMO/b+CysqOd4TeCRotDn4vJu4dlFSV20LBLcEtRf9AECeQ42ROnGM03vudEPkVwI39kGmJHTX171evD6KFF82Q49DnbU153qk3V0UprzUR3wxnxRB6hcNhXbbstxAB3VaLAEUuywZoKZezqUNczfcEZEKHkhX0NMeo3v63XxRptuv+REF2lYrCO2sgAsw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: openfive.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR13MB3451.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d5542f2-e212-48f4-9f99-08d86b91993e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2020 13:53:55.8103
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y9x+yhHi33XmoKgjz+8dGEvcDMUF98pCVcK5Fj+rQ6lpfgnsR96MamGMwinS7B8NF+hq/UlWaVYwrJISFXblUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR13MB3210
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Peter,

> -----Original Message-----
> From: Peter Korsgaard <jacmet@gmail.com> On Behalf Of Peter Korsgaard
> Sent: Wednesday, October 7, 2020 5:10 PM
> To: Sagar Kadam <sagar.kadam@openfive.com>
> Cc: linux-kernel@vger.kernel.org; linux-riscv@lists.infradead.org; linux-
> i2c@vger.kernel.org; andrew@lunn.ch; Paul Walmsley ( Sifive)
> <paul.walmsley@sifive.com>; palmer@dabbelt.com;
> aou@eecs.berkeley.edu
> Subject: Re: [PATCH 1/1] i2c: ocores: fix polling mode workaround on FU54=
0-
> C000 SoC
>=20
> [External Email] Do not click links or attachments unless you recognize t=
he
> sender and know the content is safe
>=20
> >>>>> "Sagar" =3D=3D Sagar Shrikant Kadam <sagar.kadam@sifive.com> writes=
:
>=20
>  > The FU540-C000 has a broken IRQ and support was added earlier
>  > so that it will operate in polling mode, but seems to work only
>  > in case interrupts property is missing from the i2c0 dt-node.
>  > This should not be the case and the driver should handle polling
>  > mode with the interrupt property present in i2c0 node of the
>  > device tree.
>  > So check if it's the FU540-C000 soc and enable polling mode master
>  > xfers, as the IRQ for this chip is broken.
>=20
>  > Fixes commit c45d4ba86731 ("i2c: ocores: add polling mode workaround
>  > for Sifive FU540-C000 SoC")
>=20
>  > Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
>  > ---
>  >  drivers/i2c/busses/i2c-ocores.c | 22 +++++++++++++---------
>  >  1 file changed, 13 insertions(+), 9 deletions(-)
>=20
>  > diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-
> ocores.c
>  > index f5fc75b..4405244 100644
>  > --- a/drivers/i2c/busses/i2c-ocores.c
>  > +++ b/drivers/i2c/busses/i2c-ocores.c
>  > @@ -686,17 +686,21 @@ static int ocores_i2c_probe(struct
> platform_device *pdev)
>=20
>  >      init_waitqueue_head(&i2c->wait);
>=20
>  > +    /*
>  > +     * Set OCORES_FLAG_BROKEN_IRQ to enable workaround for
>  > +     * FU540-C000 SoC in polling mode.
>  > +     * Since the SoC does have interrupt it's dt has the interrupt
>  > +     * defined but it should be bypassed in driver as this SoC has
>  > +     * a broken IRQ, hence update the master_xfer to use polling
>  > +     * transfers.
>  > +     */
>  > +    match =3D of_match_node(ocores_i2c_match, pdev->dev.of_node);
>  > +    if (match && (long)match->data =3D=3D TYPE_SIFIVE_REV0)
>  > +            i2c->flags |=3D OCORES_FLAG_BROKEN_IRQ;
>  > +
>  >      irq =3D platform_get_irq(pdev, 0);
>  > -    if (irq =3D=3D -ENXIO) {
>  > +    if (i2c->flags =3D=3D OCORES_FLAG_BROKEN_IRQ || irq =3D=3D -ENXIO=
) {
>=20
> NIT: flags is a bitmask, so i2c->flags & OCORES_FLAG_BROKEN_IRQ would be
> better, even if there currently doesn't exist any other flags.
>=20
Thanks for your suggestions. I will apply the bitmask, this will be better.

> TYPE_SIFIVE_REV0 is also set for two compatibles:
>=20
>         {
>                 .compatible =3D "sifive,fu540-c000-i2c",
>                 .data =3D (void *)TYPE_SIFIVE_REV0,
>         },
>         {
>                 .compatible =3D "sifive,i2c0",
>                 .data =3D (void *)TYPE_SIFIVE_REV0,
>         },
>=20
> Are both affected by this issue? if not, we will need to extend the code
> to handle them differently.
>=20

No, this issue is present in FU540-C000 SoC i.e SoC- specific, and so I can=
 check=20
for the soc-compatible string as follows:

-       match =3D of_match_node(ocores_i2c_match, pdev->dev.of_node);
-       if (match && (long)match->data =3D=3D TYPE_SIFIVE_REV0)
+       if (of_device_is_compatible(pdev->dev.of_node,
+                                       "sifive,fu540-c000-i2c"))

Please let me know if this is okay.

Thanks & BR,
Sagar

> Other than that, it looks OK to me.
>=20
> --
> Bye, Peter Korsgaard
