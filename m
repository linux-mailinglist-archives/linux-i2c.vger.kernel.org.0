Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6115828BCE2
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Oct 2020 17:49:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389613AbgJLPtY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Oct 2020 11:49:24 -0400
Received: from mail-mw2nam10on2088.outbound.protection.outlook.com ([40.107.94.88]:15329
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389450AbgJLPtX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 12 Oct 2020 11:49:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ePe/fd5MWw90veF8i7l8+z37+CsWedYNjKdvdrk7DYihVDhoB3TkCGby2WVyFFPdO1KnmUEZ0tkwxcvN73AXqs8+nnXAij0VIy1EsGKjJkQIuABYNTHhjmMN+EAMcU7nan8XVV1jTohhq+8ye4dIYDdT0++uXFXTN8P4lQ+cA4V06iiP7kZQ/KAMsWJgdXuu8FXbEmFjNEnPYW2rBKUpZwjoybUhpgiMVChQAlDBoJIUxkkH3YDo2BT4kTvzC8zfsyRDqQ+aYTG5KvqDoafQL+Ign++o1zsLMO227x6vanw3oWnZSX4P7WiPNVHn61pN85djY8EGPBUu2CzAqhNcSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wXz+IGdA5hyrKCRhPva2pC49NnJKxH9GP67+wYuMskE=;
 b=hbOrxojBCBGXVhQzVqetRw0PX9W9jZ6auqTpY6NhgOvJzkjrFLoTR0sCBnBcDdkSMDTMDxInPoXED7k9i/SO1f8RKjpWv8iwbadw1uX5WCJKXqZcSdUn/kxytDQ90sJQbX0oWT3m1+0yld8XXNmzrST9QRxwxCSZhQA3LszjzQWrAxUgJrwOVREZzePwM3ZBzm0yRg0U+KMehc62663EUPKBlfgEV8HsFP5049IPdP41XRv2RdezL+zd2vj6NPydxSRET45EirvbsUAR2V76losG+4ci5oFWPDFni5jUw6I3v0CZ0uHnmpisNpKgM4S3Cv08DcTQxxjAkzTXzVe9vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=openfive.com;
 dkim=pass header.d=openfive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=osportal.onmicrosoft.com; s=selector2-osportal-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wXz+IGdA5hyrKCRhPva2pC49NnJKxH9GP67+wYuMskE=;
 b=FxBb9WEXaXofBnAQoGQ1fMvXekdx5ojiEEL8t0Z9KvKmxsRbC/3RUO48mhiQ8dPJjK1WwRjxQMmItoVxzwnnW11z8pAvtxAw8xRPfrUsCLlm0Dv6vVmPxNAUnWQ2XoqQIzR0kVtbAxGd74s1RQEKPQCnLAiBHQ0uscWy04JzqLU=
Received: from DM6PR13MB3451.namprd13.prod.outlook.com (2603:10b6:5:1c3::10)
 by DM6PR13MB4146.namprd13.prod.outlook.com (2603:10b6:5:2aa::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.15; Mon, 12 Oct
 2020 15:49:22 +0000
Received: from DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::f49f:d6d6:4c97:e5d5]) by DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::f49f:d6d6:4c97:e5d5%7]) with mapi id 15.20.3477.019; Mon, 12 Oct 2020
 15:49:21 +0000
From:   Sagar Kadam <sagar.kadam@openfive.com>
To:     Andreas Schwab <schwab@linux-m68k.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "peter@korsgaard.com" <peter@korsgaard.com>,
        "andrew@lunn.ch" <andrew@lunn.ch>,
        "Paul Walmsley ( Sifive)" <paul.walmsley@sifive.com>,
        "palmer@dabbelt.com" <palmer@dabbelt.com>,
        "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>
Subject: RE: [PATCH v2 1/1] i2c: ocores: fix polling mode workaround on
 FU540-C000 SoC
Thread-Topic: [PATCH v2 1/1] i2c: ocores: fix polling mode workaround on
 FU540-C000 SoC
Thread-Index: AQHWnlKG+lvAdS0ghEalmf6VHkzmZKmPlkXvgASLWIA=
Date:   Mon, 12 Oct 2020 15:49:21 +0000
Message-ID: <DM6PR13MB3451CCDAEDD7605E009500F397070@DM6PR13MB3451.namprd13.prod.outlook.com>
References: <1602257980-375157-1-git-send-email-sagar.kadam@sifive.com>
        <1602257980-375157-2-git-send-email-sagar.kadam@sifive.com>
 <87pn5rp89p.fsf@igel.home>
In-Reply-To: <87pn5rp89p.fsf@igel.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=openfive.com;
x-originating-ip: [116.74.151.16]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f8766155-8c3d-4738-f87d-08d86ec6632a
x-ms-traffictypediagnostic: DM6PR13MB4146:
x-ld-processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR13MB414614670C1F5D1B9AC780E297070@DM6PR13MB4146.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Hadq4XFI3MlJ/US2O4rmV5vVifhwHd1S1wWOXOEgBrrVKRcvwXuL0GZ8pX9/PTGOl06EPsJc0EXL+6L2dgH9/6aW/QsT+m+Zl98t1TqHVf0qZ1nJjQOEhGDQCXUmfoyXvKcwtWAFbMslW/mH3dEmbzTGnmO7mn1rst7LXlDBPJEYfGRQjsutuxbBVuDCuCBkILxb4GMYrG1qr054gRutBegUv7ijG5OCPkHCHA+fIBJsOt1ME5l1ZHlZIIfW7BBvCtuJyXdkYebCCTxNUmbmIulcnU2QK6pYxkJIYOlaAUDUg3pgu07iRUpiRMU/7aLq
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR13MB3451.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(376002)(136003)(366004)(396003)(346002)(9686003)(4326008)(7696005)(76116006)(66446008)(66946007)(64756008)(66556008)(66476007)(6506007)(186003)(53546011)(44832011)(8676002)(26005)(55236004)(33656002)(8936002)(83380400001)(52536014)(6916009)(5660300002)(316002)(55016002)(2906002)(71200400001)(478600001)(54906003)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: s66W1n9Na53JbtX8aIL55WeLdG8KTR3Ljn2w7INf3pKO/3lHNeT6mDCJLHAX0WIae2PWn8Plemd3n8ffBIWl1iXgp2aRXEhqvIgZS/HDcDmDxKiY8Ga5trjpr0wAA5NI/EixIOJ6a0qX3Xf6frfmFPIBSXBgq28h+tIJAL32/eLZ88MkKytHFde25hC9A53wg3BwDUXJ1LoKJjeUh6NWBA1+OA1iSUnJd2Rg/g74QyzMCHND1SsFfI5CfUGPdjzqzcNRuF6z898xt4t1A0lFkLNIfVxufROkXDNubTn746ACDSZKpQmtR9vZOrtrP7pDjIhzscM+uKpMkJxBzUqFCls5PzSleyWaa55h2qvA5shijvmllRsstTGX2RvV/Gw8Uj8FhZRcVwU/bu19WyXHmbn1sA8zcp9F3/MvDbRQ+PnQSuycSoafqAQneTo9o/HCgFhejLjx4GDn6QpaEa7yne3L3ZsWZLi9xHFQ8ehoFrzx9PqcnzHCweGhZeq7ohZU+nroy7dGUANyeWO5PkTxWENzKXBtLBReDVvXL8gC+ILrWIqM9tlPqSp2zGsFx1zf7Cj8WojI3sd9rERd6WtzxGfv9mgHQHwUHQbydpeeErCZ33EyQ2qiYvIyDMZ9z5gDwhJEB3IlIG2K6oByqx6F7A==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: openfive.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR13MB3451.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8766155-8c3d-4738-f87d-08d86ec6632a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2020 15:49:21.8146
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iNnvsrRiOSMSjI7GoBaW7DK+jAdg/OKsudBg2Ze54f4hqMtD9O5nfM81uziwmUKiMLnWa0nRf/AwlMemsmbReg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR13MB4146
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


> -----Original Message-----
> From: Andreas Schwab <schwab@linux-m68k.org>
> Sent: Friday, October 9, 2020 11:55 PM
> To: Sagar Kadam <sagar.kadam@openfive.com>
> Cc: linux-kernel@vger.kernel.org; linux-riscv@lists.infradead.org; linux-
> i2c@vger.kernel.org; peter@korsgaard.com; andrew@lunn.ch; Paul
> Walmsley ( Sifive) <paul.walmsley@sifive.com>; palmer@dabbelt.com;
> aou@eecs.berkeley.edu
> Subject: Re: [PATCH v2 1/1] i2c: ocores: fix polling mode workaround on
> FU540-C000 SoC
>=20
> [External Email] Do not click links or attachments unless you recognize t=
he
> sender and know the content is safe
>=20
> On Okt 09 2020, Sagar Shrikant Kadam wrote:
>=20
> > diff --git a/drivers/i2c/busses/i2c-ocores.c
> > b/drivers/i2c/busses/i2c-ocores.c index f5fc75b..9b3d1ab 100644
> > --- a/drivers/i2c/busses/i2c-ocores.c
> > +++ b/drivers/i2c/busses/i2c-ocores.c
> > @@ -686,17 +686,21 @@ static int ocores_i2c_probe(struct
> > platform_device *pdev)
> >
> >       init_waitqueue_head(&i2c->wait);
> >
> > +     /*
> > +      * Set OCORES_FLAG_BROKEN_IRQ to enable workaround for
> > +      * FU540-C000 SoC in polling mode.
> > +      * Since the SoC does have interrupt it's dt has the interrupt
>=20
> Typo: its
>=20

Thanks Andreas,
I will submit v3 with the change.

BR,
Sagar
> Andreas.
>=20
> --
> Andreas Schwab, schwab@linux-m68k.org
> GPG Key fingerprint =3D 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA
> AEC1 "And now for something completely different."
