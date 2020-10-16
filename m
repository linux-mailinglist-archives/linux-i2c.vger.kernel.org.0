Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E03928FD1E
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Oct 2020 06:23:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727366AbgJPEXf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Oct 2020 00:23:35 -0400
Received: from mail-dm6nam10on2045.outbound.protection.outlook.com ([40.107.93.45]:64352
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727365AbgJPEXf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 16 Oct 2020 00:23:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D0f7sWKqSGbtxMBW6KMK1tmjdpgFBnEgZi1X0c7aHoVbEQ8C023SuuZnZHcEzdEytuj4eCgwPvU2/xAKBZCFTqPtAf74eGpzNovuW2lJVA3ck5CiXMSic0db9d2H0Y8S2Xj/TskolMqDDO1DfOY4s0wFfLxXIgFzNyF3QMLgya7PK080br9N1qET0FIMbTR2VHpplPMDMakYnpQPKt0j3md5AYjaMcryKQU8z2uoNnIY+ZYwVJ9+v2SKZo57scqaaTX3j1dgWtS/tH/ALlgnGgm/5MNEYR41q+hf9KQE89T+U9yDSbrD2pLa/ClMUifewmbXCRWyB9tVSiSZuxZc8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5UuoyDCqi8REccvhWlQNRlYB5yGvSiBHupjA7q36SU=;
 b=X7qJnu/9O9cHshV6YFuxmJzSQ+IX/bXhlVMWVw2cISWY93JcaeSg6THV46RwlOWfqsv+aGoZulqtjivlzT+gizlUeZy6rnxJEpPnQjJgXEeA7A7GQdBX7Nlbl5ws6kAYKfqcSSdUJL3LVkRHWVWRL7Idn9IvJ4uFfRl5zH8dt/ZV6OiHXcGUE+mrm9tYJgUwbpqS66EPpNcyzbQL17sX6T1VaIqV0ARc5czJScGxOLSPmJAaIVRkCHZkBmGk/VUZ5W/GX0tl0EHgJVJX/FwjDLcBRN81JCtfNBpzUO3Ouuwhyjwu/RdE++BOqgi2NFfbqkUorKiPgbA7F8QF7THipQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=openfive.com;
 dkim=pass header.d=openfive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=osportal.onmicrosoft.com; s=selector2-osportal-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5UuoyDCqi8REccvhWlQNRlYB5yGvSiBHupjA7q36SU=;
 b=XsQnlQ8nFMRZfXbVOcSVcZpJkQBsOtJuQmXZR6A4Fd4QX2avItlo8y/bsormMekCwNwtYH7XZKJsssOE5wuAazHRu28do7AaIjjiyvnfFBK2qPLrxUOK+7z1ZLySX85tXaxozJjIey8NkKZRxXrY7HvHtKWfUX5gxo+ktbe7qA4=
Received: from DM6PR13MB3451.namprd13.prod.outlook.com (2603:10b6:5:1c3::10)
 by DM6PR13MB2761.namprd13.prod.outlook.com (2603:10b6:5:13f::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.11; Fri, 16 Oct
 2020 04:23:31 +0000
Received: from DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::f49f:d6d6:4c97:e5d5]) by DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::f49f:d6d6:4c97:e5d5%7]) with mapi id 15.20.3477.019; Fri, 16 Oct 2020
 04:23:31 +0000
From:   Sagar Kadam <sagar.kadam@openfive.com>
To:     Peter Korsgaard <peter@korsgaard.com>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "andrew@lunn.ch" <andrew@lunn.ch>,
        "Paul Walmsley ( Sifive)" <paul.walmsley@sifive.com>,
        "palmer@dabbelt.com" <palmer@dabbelt.com>,
        "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>
Subject: RE: [PATCH v3 1/1] i2c: ocores: fix polling mode workaround on
 FU540-C000 SoC
Thread-Topic: [PATCH v3 1/1] i2c: ocores: fix polling mode workaround on
 FU540-C000 SoC
Thread-Index: AQHWovyusjSag+Zm0ki2uagXVVHPYqmYvrzWgADUz6A=
Date:   Fri, 16 Oct 2020 04:23:31 +0000
Message-ID: <DM6PR13MB3451CA7C440D0E2F94AAF1C597030@DM6PR13MB3451.namprd13.prod.outlook.com>
References: <1602770907-61852-1-git-send-email-sagar.kadam@sifive.com>
        <1602770907-61852-2-git-send-email-sagar.kadam@sifive.com>
 <87mu0nr1ct.fsf@dell.be.48ers.dk>
In-Reply-To: <87mu0nr1ct.fsf@dell.be.48ers.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: korsgaard.com; dkim=none (message not signed)
 header.d=none;korsgaard.com; dmarc=none action=none header.from=openfive.com;
x-originating-ip: [116.74.151.16]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c6619f91-db66-4e9a-9f85-08d8718b3d49
x-ms-traffictypediagnostic: DM6PR13MB2761:
x-ld-processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR13MB2761B68097668CCC3A79DBA097030@DM6PR13MB2761.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1148;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eFLdHv5N5nve1dMczsE7RM8s/1Y8Sr9jt5quHXS7rj/gijC+YPZaVPjr4ZkK94l9qyyBOnLwhdkCSn782h9OoI3QXARR8azO3LWvQeyPysZtA49xDPu/+0gTV0ddFFwBY2bXMIm160aIzQvZCdcX4leV1b0C9lP/uryumsIcarmemw3lUf8Uv4SYx/WgEqeAftxzr7yTlchfy38tF9XffI1LzeTDIRwbOO40SXSsSK8Pm9/Xdldx1NbdewUXAxFnETZ2Jz/4aXQJNKE9rpOjaGjUuinZo6tRjPchpxuTWhRQp/v560U2TYjU1txsRi+H
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR13MB3451.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(366004)(396003)(39850400004)(346002)(83380400001)(71200400001)(8676002)(52536014)(478600001)(6916009)(66476007)(76116006)(64756008)(2906002)(66446008)(66556008)(66946007)(8936002)(86362001)(55236004)(33656002)(44832011)(26005)(4326008)(186003)(9686003)(55016002)(6506007)(7696005)(53546011)(54906003)(316002)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: xVHwZeu6mzxkumtazpTvbSxtwfJ4kS9jXKU45YVVrW12nyK/qRGDqcbzHdd++boF23QMvw8R1hdFv/E+MKUR31P/5qa5bcxoeMH5Y7WaH4lRBRHGsLPYXvHOCyCRS/7XGht6hC3Q39OUGCeuM+Q8jMCXmD/QXx5yH7ihT0OOp4ueVz06dObUxOP2eMECrn2UENwm7U3ZGR//Zjc27Q4Qfw5cC8gtf5hHHSgrCm8qTwir/qiUvMK3ei1wobOScC/nUJiIm9k0hGtzYOJ2vY9uSQwk4kIfBNnyKcDFjzD1YKIabG9hTJIZTBuIXEcD6wqo9RqEvfLtCMEum8t7qUk3AF5tzBsd+oeYec1Lkkb7Z+NLxKn4E3u2FcLVtMW7LoMFfC86XsC0mK88XahPnagSqmzbR5Lh5LlC5I9vXlek7nsVgp8yz5nnm9O0qlqNWuXxW2LKNlBPaLCr6dFJO4Hazr4b4Vo6FYb34QWMpic/FLOAe8/mRwMi7Ajja+sE7VBGCCuBt5qdR961rEW6wLHIdCpJOC36hpDKW887hLPDtKww36EIeYNfLUr9PDACUTPIGBwJgoeI56HJD5jDMSr26FGw0EKGwYIY3R4EYHWaYfCD2mcpEK0Zg2arfBdVh486js4I6uHbsRDTpt0W0PhNxQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: openfive.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR13MB3451.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6619f91-db66-4e9a-9f85-08d8718b3d49
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2020 04:23:31.3894
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HhR2YLAd/zI9Y3/rPTr04dkXagrVwROqhhM6WkijCibGr0ngWY/wifqEDASs1B3iOb1C/19TxYn1kew2szgxEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR13MB2761
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Peter,

> -----Original Message-----
> From: Peter Korsgaard <jacmet@gmail.com> On Behalf Of Peter Korsgaard
> Sent: Thursday, October 15, 2020 8:19 PM
> To: Sagar Kadam <sagar.kadam@openfive.com>
> Cc: linux-kernel@vger.kernel.org; linux-riscv@lists.infradead.org; linux-
> i2c@vger.kernel.org; andrew@lunn.ch; Paul Walmsley ( Sifive)
> <paul.walmsley@sifive.com>; palmer@dabbelt.com;
> aou@eecs.berkeley.edu
> Subject: Re: [PATCH v3 1/1] i2c: ocores: fix polling mode workaround on
> FU540-C000 SoC
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
>  > index f5fc75b..1dab02d 100644
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
>  > +     * Since the SoC does have interrupt its dt has the interrupt
>  > +     * defined but it should be bypassed in driver as this SoC has
>=20
> NIT: Looks like there some commas missing and the wording sounds a bit
> odd to me. What about E.G.:
>=20
Sorry for the confusing wordings here.
>      /*
>       * Since the SoC does have an interrupt, its DT has an interrupt
>       * property - But this should be bypassed as the IRQ logic in this
>       * SoC is broken.
>       */
>=20
I will replace mine with your suggested one.

>  > +     * a broken IRQ, hence update the master_xfer to use polling
>  > +     * transfers.
>  > +     */
>  > +    if (of_device_is_compatible(pdev->dev.of_node,
>  > +                                "sifive,fu540-c000-i2c"))
>  > +            i2c->flags |=3D OCORES_FLAG_BROKEN_IRQ;
>  > +
>  >      irq =3D platform_get_irq(pdev, 0);
>  > -    if (irq =3D=3D -ENXIO) {
>  > +    if (i2c->flags & OCORES_FLAG_BROKEN_IRQ || irq =3D=3D -ENXIO) {
>=20
>=20
> Alternatively you can move it after the irq =3D platform_get_irq(pdev, 0)
> line and just clear irq, E.G.:
>=20
> irq =3D platform_get_irq(pdev, 0);
>=20
> if (of_device_is_compatible(..)) {
>    i2c->flags |=3D OCORES_FLAG_BROKEN_IRQ;
>    irq =3D -ENXIO;
> }
>=20
Yeah..
This is a better alternative implementation.
I will push v4 with this.

Thanks & BR,
Sagar

> if (irq =3D=3D -ENXIO) {
> ..
>=20
> --
> Bye, Peter Korsgaard
