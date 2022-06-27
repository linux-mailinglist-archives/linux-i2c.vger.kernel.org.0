Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DC7755C682
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jun 2022 14:52:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232859AbiF0HRl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Jun 2022 03:17:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232708AbiF0HRk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Jun 2022 03:17:40 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2117.outbound.protection.outlook.com [40.107.114.117])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0C095FF9;
        Mon, 27 Jun 2022 00:17:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kkYqkhvfQu5/tXGWUz5qudZviRBN62HjRYxy+LMvIHuCj3NfYcPEmV5/kxpT1sq0C6Y/fsYDuaAYUbaKi4ovpbCcGpLXcORnSoR9pLjjXUDFdXciRwEuF+i2Op4fRborZR/07z5ReClbgfqhgDyKNxijkEiRWgOjcGmz/uwwLCxKqE0vxY6GNhu+i+YcAmKSoJBuBNx/lKM4dGrELDIM/y1z6LsM9YtlWe28XnhhBfsf5VFLGsFuUsbo3n+hT71778536ZTqx9Q/sLxx3yMwZOdqRyZdGtXKOacZu9RAZBas65Xp9glBb8YNuB7a6s8kRNFS7tpXjwqHi/8IjzDy4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cgMpbxg3B2AnYiq8dybw2rJ43XUVeMOOFp8IExuqx6c=;
 b=KBw2czCylj+yixy/RWoJpyGAO8DNNS6/gTUjZhhwB8L9P7ambaAA8v7sxuWRfBkunXpkTEabI08EwhIXQ1rflas3jlqTw795O8c6Ec2qbEj4V/ohe2BYJmx/dXAYH9CWyMxAJ5/hS1rcuM754MGRvAOj8zoXfHot1UY8tJL1v8FFih3S/EnnsJmEzM5yChxp9cWm9DFJ1x60zP/MWAP1tAdMELYlfCUes8Wosue3hiL2aXjhNDKETGrZyn8YXLpQQZp2s/Y97HB5NEDr+3bC93hRHjSgtllv4/MaYZ7OrsZtEjvc7VOdDSUsE/+sF/x7vm0QgkOfK515kTh6oi4cyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cgMpbxg3B2AnYiq8dybw2rJ43XUVeMOOFp8IExuqx6c=;
 b=PCjZUNl/C56ydFq36pAqUiQUG15Mjc8j3kcPyFuekoY7VEdqenFFmdTCem1ZqnkRFemXtsJZPagbwoj5jI+JviR20pSOnX3O0YNmDkYH9inx3GGu2WwYhaq6nPUwrMPysPGpMYEfyp0icibzUwOGZCOcAb7Atl+YVyi043ZiWtA=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by TY1PR01MB1611.jpnprd01.prod.outlook.com (2603:1096:403:8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Mon, 27 Jun
 2022 07:17:35 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79%7]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 07:17:35 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     Biju Das <biju.das.jz@bp.renesas.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/2] dt-bindings: i2c: Document RZ/V2M I2C controller
Thread-Topic: [PATCH 1/2] dt-bindings: i2c: Document RZ/V2M I2C controller
Thread-Index: AQHYh7Owjshmty8Zc0GLIOdniftsbq1gmPiAgAJBnpA=
Date:   Mon, 27 Jun 2022 07:17:35 +0000
Message-ID: <TYYPR01MB70869F902F8367DDFC4A9EDFF5B99@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220624101736.27217-1-phil.edworthy@renesas.com>
 <20220624101736.27217-2-phil.edworthy@renesas.com>
 <2f2b2544-9c53-3a6a-d9c9-375e75b112f3@linaro.org>
In-Reply-To: <2f2b2544-9c53-3a6a-d9c9-375e75b112f3@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d119515c-20b2-4691-6766-08da580d1bd3
x-ms-traffictypediagnostic: TY1PR01MB1611:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S2YjtzjiHZX3Rph5OkhsLvvXa8U6tK4D1WzqsB3T98cyQLs15m9KgeASjq7sAtrlJoJsB5b8x5tknI82rcjMKtGtQv6BOGwBbBYLB5KYclx0HGaOa/ockOOprF1IjGWPlAZHLUKc+5DrUlh32PNk4MONruHTCKeaD0wpo4RgckEuAb64KDCBEW5J3A32a1wKlEXGrkJqWhnJ11tHtfxQAZ+acks8sDi1B3yVFW68KSR8UpyaTERQMumzR9ccoWLgYtn/eZlucaM7yJgfPw2XaQRO8zH1H6onmCvAMxw6dO37yK38mjGw8niU863kFOWGmV0E83B3il0lF4NLVkqXtp7h1+Ic034O8iBhLG8DSHRECMYq+QxbLEk54oEwqBeWaEQGgeRiaaVedMUtnLYYC+k541/EpxiVtE5re+6ZH/EgJoB55AMWlViunHoZuQMYK5eR9R77Hqh4eNmoKZKTYL5T3w4bssW5r/hht3Al/vcebR/wiHufzclLV4cfPj2mow3XNZMy3ph76H9VcxRp7bSmx1OaAjjh+hNaW3HSN+vCmMYavi0KTrj1XhVG1vL8j9XydG+WPn3JFfAv+zhz8AZU037eDfQatpYye3Vod6QHkl8R+saBRUft8tWesx8NplX5AG5DjFFiBSCRa5RTPI6yznVSR4PUiH48YTKb6ePZuL7THAAO6eg5817HWOKo9uvJ3DHjTFJtBDO/YPryAjD0AxDpCsMzxTJeD4/TYVGscvG7Q6pdREedm73ybVtOOLRsCNFRWQyZvvT7+Gk068i6wln8re1gViyOYjUXR5u+DjUbWduW29qJMVFK7yU85F+qXfV2xMLqTXW4glkxDTcrJaIGBG2NYg1tCl/YKxUbLLRqUrAQBngZwVf7PxIQ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(376002)(39860400002)(396003)(346002)(38070700005)(66946007)(66556008)(316002)(54906003)(110136005)(76116006)(4326008)(83380400001)(66446008)(66476007)(64756008)(55016003)(8676002)(2906002)(41300700001)(38100700002)(186003)(71200400001)(7696005)(86362001)(6506007)(122000001)(53546011)(44832011)(52536014)(478600001)(8936002)(5660300002)(26005)(966005)(9686003)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4OIeIhYZ9ihttc8vmPXAupGRFKhOLh406MwM4rTVQCdQErCLViswg/jJdhVA?=
 =?us-ascii?Q?8saXpefsnmDkl+btEAw44kTDqi21GTIZn35QolddaNVgdqsDBuRD+OKg9o2K?=
 =?us-ascii?Q?rt10yZL7u9eIrn/FCVf9t+K4j/DDd/ShMPMC6LjEUh1EXdDowgtUaNT0ZqSd?=
 =?us-ascii?Q?9atkefL9wadGp+zsj42ToOm58tu6cmteyzu69LVT4pjGjloQcF8OySISKDLV?=
 =?us-ascii?Q?7jPjLv37OSsu4raqyBtpGgpwx6CvC2+sk+li82ldiIHLuSvhX7QCA/qFGUVv?=
 =?us-ascii?Q?yqtzDPyKZeEN9N3vjPPBoMs6M4h2kLVpnRKMM9CrNyq7h2Z6bUEBPHILafSj?=
 =?us-ascii?Q?ipOgbav0vTMEwjaTXTTnFuglR3OsNk1Wi5704VXbyIuiim+SPuiglMkrvtzM?=
 =?us-ascii?Q?ZTnMGiawsUnjEr5boarwAqRoSLB9H2FGQK5BcJLp6AN/4zFaV450fOhmul0e?=
 =?us-ascii?Q?61klelXl/oT7U4sA8eH2l42XSFpGRhhCMdkf9CS6urhsKK0bs7UmclaX/0P9?=
 =?us-ascii?Q?jgMUnvxtmCWVtAkh5iRnDNiYzKPwWyDIYje4k5xlUCnIf0lUlO5ptHIWrPTg?=
 =?us-ascii?Q?khwsrc3lhkaHNI+tVhyHrPpZyvkatF9fS7RTg6MbCR5q0yFl+05cTcWFJICU?=
 =?us-ascii?Q?jaiSbTGPOvgTCCTDFK5ix39iS1EjkmorlCnwrNZOADw5C6FOd6ZvRbJPu7SS?=
 =?us-ascii?Q?O8T4VDdlYhRzNaSmnCBnRHGfk033V0oLOi9IQxIg0OgJyDH0t9An6ro6Wo5i?=
 =?us-ascii?Q?0bYdgDylwMphXw99JPx5C8fi6wJ1/L8BpkgRA5ec0yqYc8WW+NlYnaYxMjE7?=
 =?us-ascii?Q?NuCaHlBohsTFdkjheU8jUIhivHngDFeXE0BOhvGIySIrJwByfghTGNem+BXI?=
 =?us-ascii?Q?FCkpF/PPjLtPGFl88C4Z+PjBE8RbB16QGh29f778agA3Lt1WVuvZOvWEsog6?=
 =?us-ascii?Q?AO2qi6/54Vr83OBoElM7hk9aIO7B/eOBwHWL7nPSKnHYnz/6nI6S2zMd9Xla?=
 =?us-ascii?Q?L1fKA3fcOyDUelIhhizCesuf71CBfH0H1YmWKd0Ieyjb1kQvnM0KbyBGfcfj?=
 =?us-ascii?Q?b2xeqVeD1fMcSZbzSU0BJP/pfF/ENfIm2mEG78LO2Oy5/DCGhsBwf1ixD7vD?=
 =?us-ascii?Q?8Pndnv+Vw5jayyCoclYEBxgjaL1LauLr6GJwImy6YLU3twBiNJ/Qpd553tHD?=
 =?us-ascii?Q?u6mA1WNoVwnCmZBJblY6y/SFm5gLZ3XYagK2FzbBsrRcnFBRqhtyDKqEIpso?=
 =?us-ascii?Q?I6NvbHxdfiI+4WYzOs9LQZYvSNg/CFcgXztwSMGfS+C8ROx8EZQ/JCGVfAG/?=
 =?us-ascii?Q?3b17TWiWjiuZZ8Y2rTtdV3bSKsNK23luizfuLRt3tqRqetSt2OPSscOHqHeF?=
 =?us-ascii?Q?cAHEzNdGoMFycotp5z7Jisewfs30ABEVOs1qEkmaGtReLBWIsm8EG9Wh7dg4?=
 =?us-ascii?Q?ls1G9kaJKz7OkAl3b7tmSHNdoSixuZBleCQCMl5VKkfy1mRiHoLhC0An2cVP?=
 =?us-ascii?Q?SiEosw2AXFa4LnsLQburlsYUVihx3VqtkQhxGWapX3JbVTwPeib1p3bP1WQP?=
 =?us-ascii?Q?n/rkG+jb0F1M4jt6GZvnary9x35JNMrn/vEaFJcI?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d119515c-20b2-4691-6766-08da580d1bd3
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2022 07:17:35.0536
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AHN32JWlNUOUJSipNxbs/epD72r1ReZSe9QSJ/RvV7xa7R5O5tp25NgRpNe5clAyNDlzHb8EfBDuNj1Lnz6QcQeqbRytMFmtZNJLK++q9+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1611
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Krzysztof,

Thanks for you review.

On 25 June 2022 21:43 Krzysztof Kozlowski wrote:
> On 24/06/2022 12:17, Phil Edworthy wrote:
> > Document Renesas RZ/V2M (r9a09g011) I2C controller bindings.
> >
> > Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  .../bindings/i2c/renesas,rzv2m.yaml           | 76 +++++++++++++++++++
> >  1 file changed, 76 insertions(+)
> >  create mode 100644
> Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml
> b/Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml
> > new file mode 100644
> > index 000000000000..9049461ad2f4
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml
> > @@ -0,0 +1,76 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/i2c/renesas,rzv2m.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Renesas RZ/V2M I2C Bus Interface
> > +
> > +maintainers:
> > +  - Phil Edworthy <phil.edworthy@renesas.com>
> > +
> > +allOf:
> > +  - $ref: /schemas/i2c/i2c-controller.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - renesas,i2c-r9a09g011  # RZ/V2M
> > +      - const: renesas,rzv2m-i2c
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    items:
> > +      - description: Data transmission/reception interrupt
> > +      - description: Status interrupt
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: tia
> > +      - const: tis
> > +
> > +  clock-frequency:
> > +    description:
> > +      Desired I2C bus clock frequency in Hz. The absence of this
> property
> > +      indicates the default frequency 100 kHz.
>=20
> Instead of last sentence, just add "default: 100000".
Right, I'll also and an enum for this as the HW can only support 100
or 400kHz.


> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - interrupt-names
> > +  - clocks
> > +  - power-domains
> > +  - resets
>=20
> This was not mentioned in properties. Why?
Oops, I'll add it.


> > +  - '#address-cells'
> > +  - '#size-cells'
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/r9a09g011-cpg.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +    i2c0: i2c@a4030000 {
> > +            compatible =3D "renesas,i2c-r9a09g011", "renesas,rzv2m-i2c=
";
> > +            reg =3D <0xa4030000 0x80>;
> > +            interrupts =3D <GIC_SPI 232 IRQ_TYPE_EDGE_RISING>,
> > +                         <GIC_SPI 236 IRQ_TYPE_EDGE_RISING>;
> > +            interrupt-names =3D "tia", "tis";
> > +            clocks =3D <&cpg CPG_MOD R9A09G011_IIC_PCLK0>;
> > +            resets =3D <&cpg R9A09G011_IIC_GPA_PRESETN>;
> > +            power-domains =3D <&cpg>;
> > +            clock-frequency =3D <100000>;
> > +            #address-cells =3D <1>;
> > +            #size-cells =3D <0>;
> > +    };

Thanks
Phil
