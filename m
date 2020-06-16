Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E400E1FA730
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jun 2020 05:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726134AbgFPD7G (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Jun 2020 23:59:06 -0400
Received: from mail-am6eur05on2049.outbound.protection.outlook.com ([40.107.22.49]:38112
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725985AbgFPD7F (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 15 Jun 2020 23:59:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BKRLqu8i4hM80pKOMY0Hwyd7RNYkPyWkObiUcmHoGYjd00TH6263IWbSr5FbBOOdVtSNGmzakXCCDYutIBva+PZDUUF4/vpXFebzDIbUwqcREKQvdNant5aSKdiXP7gy0W69t6kq45Q1BwC1Cmx0Kg9dxj/9UQLnDfWhVd4FGByZh24WR/urjksBafymcsX6Ca8LAoaDDpPwZvTY2cD3cPsanVqabAnYJHLgw6FgrnWxGcn6lOYVGsDQ9lN/dGSzBXkp/x/KJnxy7KCMwbcXDyMresyhlSZ1c+aBPDxEVkPtuHYn9VV/NbLvVxqUhYa6uly8hLg4C79GD9BlSYmOoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hIbIH3HXi0XFntmgoKuY8+0nfOMMU/qya9ofNAhOq+Q=;
 b=VM32JnQz3agvy0SoucavDS/zwxOA6igykC+7KzVNGRNuDLt+F+5dvF9EaXBisKtW0ZZm07Nh42MzHtx2ikDGw1hGDzwtZhzpvd9EAoxgBAcMkDrNyV0MOTqMrj8rsJquoZFKErFnTn2WwofwmkzJmgfewqstqqXPSHC79KV1fV1NKSpZh/1gzSAeNj/7mJqLJrRGPpe8TSvSQ4TiurEinPISHOig1ODegMbRUpNQxeCUfg374siNCqq/e1lH1nYnlNLiyi4WNU/w1xr9zuKeTo+ToiuuDxQzFhzo4C47+XDb/oIUwdcPBlyjZ/t4/XZK8RYtC69ayx2zsw53RZalwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hIbIH3HXi0XFntmgoKuY8+0nfOMMU/qya9ofNAhOq+Q=;
 b=qsDa3BeHwws8I/y3RxuMNEoOnPu+GgfWQWxoLsQTrRxZfBECcBDvyRAeJg8fdS1HE2eUsYZk2J7ScLGoZXQ1PzwvGSV6fSNSwxK/4M/6/aCYUmQfe8z0c+hml85gFdGBr7sO+qSS0S1zatPA76rTWjxbQL9s8S0F4ERg8lgDtGU=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (2603:10a6:8:10::18)
 by DB3PR0402MB3705.eurprd04.prod.outlook.com (2603:10a6:8:c::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21; Tue, 16 Jun
 2020 03:58:59 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::1dab:b68c:e028:acb3]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::1dab:b68c:e028:acb3%6]) with mapi id 15.20.3088.029; Tue, 16 Jun 2020
 03:58:59 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Rob Herring <robh@kernel.org>
CC:     Aisheng Dong <aisheng.dong@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux@rempel-privat.de" <linux@rempel-privat.de>,
        "wolfram@the-dreams.de" <wolfram@the-dreams.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH V2 3/3] dt-bindings: i2c: Convert imx i2c to json-schema
Thread-Topic: [PATCH V2 3/3] dt-bindings: i2c: Convert imx i2c to json-schema
Thread-Index: AQHWOhPYQZtBSbK1pkqHXpuLzKejUKjZ+4gAgACz0mA=
Date:   Tue, 16 Jun 2020 03:58:58 +0000
Message-ID: <DB3PR0402MB39167FB45A17247C442E6930F59D0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1591235358-15516-1-git-send-email-Anson.Huang@nxp.com>
 <1591235358-15516-4-git-send-email-Anson.Huang@nxp.com>
 <20200615171018.GA1961591@bogus>
In-Reply-To: <20200615171018.GA1961591@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c047a33c-0fc1-4611-47fc-08d811a99945
x-ms-traffictypediagnostic: DB3PR0402MB3705:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0402MB37054DDD9ACB4738FD34FE53F59D0@DB3PR0402MB3705.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 04362AC73B
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UxXjG5KRgQG9e80EsFuuL6ytQYhFlNkGY1O5zrPKW389MBkVHYDxbJgOfOXv0fPvyYrv5kiNUlB5JAlYLC8TwpGoKYvQsRtZrx+linPQW7lfVjrTZkHohZhDgO98Djs1KzaKHduuTugXZra0Esg5BbFdRiYKtW2mY0HYKWz/XScsk/iM7tPz2xZPeOxQRf4k+3W55gNoePNqb0sWHOmQxQphzyhgjNOLmZ84pQbsiyeQu1kLi6AMe3Sjk9h72pwD36kfQJqF1e2TsiIlu6iRw2E1zvtlz25GcN/CK84fUdCR/lBpcG93Q8+G388U1E9OiMFrnp+7K2iYZdclSZ0Gf3zQOmigE9kKrptHgC60H5AfuClywAF8J+/tsKpce51ugOqSRnl5GzGt7bNO3mYbTw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(396003)(366004)(39860400002)(136003)(6506007)(6916009)(64756008)(66446008)(33656002)(76116006)(45080400002)(66946007)(66556008)(66476007)(7696005)(478600001)(55016002)(4326008)(9686003)(86362001)(83080400001)(7416002)(2906002)(71200400001)(5660300002)(8936002)(54906003)(83380400001)(26005)(52536014)(316002)(44832011)(186003)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: ItZ9atpgH+VonsRmEHcrKiNQHisgbtUdoOd+Oy2/eKBX8ISldSC8FGYkJIoQdRCXJTE4SMgpWsBaS2R5oA+19HurrWxQLahcmdUqJA1p3bQQiFFdOL8q8fT+JcuhmAjWaaBQ7d/YbDcl/h322a/33TKdCZws3CqzQSXqfDliEcuctM9S8vTCReIrJQkjZPOrsUx+go3RZrLpMtwnRch8Y9UHqI6yB028hqELy+1h8jIyHrYqsWmoEsE1tP91x6JdJ0SL7sUZr7Z6ctliX5FS6lzVRVGyAvVwBwoJA9Aw0+taD1667P2I7clUcQJgEWbnFvkOtBzywebblLh/K0mPtcdpZFa6VKqK1uF7uCdrfAmhjc9a67y9+1Iv0VNR3dZT5IYiZQ7A8alkjupApZif9k3FNeHDgdZ8hNG5MWlUb4JzaG8d5cFfd0MecXzlgp4CM3DNlq+gWLaPNLWAhtbB3SGEr55FAsQpnZXp6zVKwls=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c047a33c-0fc1-4611-47fc-08d811a99945
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2020 03:58:58.9416
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dlynECaM5LC8aFoYRWj+cBr9uUMUgXzJBUXP4+H5DQeuoKhoOp8nsNoOnSZVLiNVaud4Y63mzNKfQ6dAPIkTUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3705
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi, Rob


> Subject: Re: [PATCH V2 3/3] dt-bindings: i2c: Convert imx i2c to json-sch=
ema
>=20
> On Thu, Jun 04, 2020 at 09:49:18AM +0800, Anson Huang wrote:
> > Convert the i.MX I2C binding to DT schema format using json-schema,
> > some improvements applied, such as update example based on latest DT
> > file, add more compatible for existing SoCs, and remove unnecessary
> > common property "pinctrl".
> >
> > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > ---
> > Changes since V1:
> > 	- add "additionalProperties: false".
> > ---
> >  Documentation/devicetree/bindings/i2c/i2c-imx.txt  |  49 ---------
> > Documentation/devicetree/bindings/i2c/i2c-imx.yaml | 119
> > +++++++++++++++++++++
> >  2 files changed, 119 insertions(+), 49 deletions(-)  delete mode
> > 100644 Documentation/devicetree/bindings/i2c/i2c-imx.txt
> >  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-imx.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx.txt
> > b/Documentation/devicetree/bindings/i2c/i2c-imx.txt
> > deleted file mode 100644
> > index b967544..0000000
> > --- a/Documentation/devicetree/bindings/i2c/i2c-imx.txt
> > +++ /dev/null
> > @@ -1,49 +0,0 @@
> > -* Freescale Inter IC (I2C) and High Speed Inter IC (HS-I2C) for i.MX
> > -
> > -Required properties:
> > -- compatible :
> > -  - "fsl,imx1-i2c" for I2C compatible with the one integrated on
> > i.MX1 SoC
> > -  - "fsl,imx21-i2c" for I2C compatible with the one integrated on
> > i.MX21 SoC
> > -  - "fsl,vf610-i2c" for I2C compatible with the one integrated on
> > Vybrid vf610 SoC
> > -- reg : Should contain I2C/HS-I2C registers location and length
> > -- interrupts : Should contain I2C/HS-I2C interrupt
> > -- clocks : Should contain the I2C/HS-I2C clock specifier
> > -
> > -Optional properties:
> > -- clock-frequency : Constains desired I2C/HS-I2C bus clock frequency i=
n Hz.
> > -  The absence of the property indicates the default frequency 100 kHz.
> > -- dmas: A list of two dma specifiers, one for each entry in dma-names.
> > -- dma-names: should contain "tx" and "rx".
> > -- scl-gpios: specify the gpio related to SCL pin
> > -- sda-gpios: specify the gpio related to SDA pin
> > -- pinctrl: add extra pinctrl to configure i2c pins to gpio function
> > for i2c
> > -  bus recovery, call it "gpio" state
> > -
> > -Examples:
> > -
> > -i2c@83fc4000 { /* I2C2 on i.MX51 */
> > -	compatible =3D "fsl,imx51-i2c", "fsl,imx21-i2c";
> > -	reg =3D <0x83fc4000 0x4000>;
> > -	interrupts =3D <63>;
> > -};
> > -
> > -i2c@70038000 { /* HS-I2C on i.MX51 */
> > -	compatible =3D "fsl,imx51-i2c", "fsl,imx21-i2c";
> > -	reg =3D <0x70038000 0x4000>;
> > -	interrupts =3D <64>;
> > -	clock-frequency =3D <400000>;
> > -};
> > -
> > -i2c0: i2c@40066000 { /* i2c0 on vf610 */
> > -	compatible =3D "fsl,vf610-i2c";
> > -	reg =3D <0x40066000 0x1000>;
> > -	interrupts =3D<0 71 0x04>;
> > -	dmas =3D <&edma0 0 50>,
> > -		<&edma0 0 51>;
> > -	dma-names =3D "rx","tx";
> > -	pinctrl-names =3D "default", "gpio";
> > -	pinctrl-0 =3D <&pinctrl_i2c1>;
> > -	pinctrl-1 =3D <&pinctrl_i2c1_gpio>;
> > -	scl-gpios =3D <&gpio5 26 GPIO_ACTIVE_HIGH>;
> > -	sda-gpios =3D <&gpio5 27 GPIO_ACTIVE_HIGH>;
> > -};
> > diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
> > b/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
> > new file mode 100644
> > index 0000000..63cceab
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
> > @@ -0,0 +1,119 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id:
> > +https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdev=
i
> >
> +cetree.org%2Fschemas%2Fi2c%2Fi2c-imx.yaml%23&amp;data=3D02%7C01%7C
> Anson
> >
> +.Huang%40nxp.com%7C943043d1a28548a7fd3308d8114efd9d%7C686ea1d
> 3bc2b4c6
> >
> +fa92cd99c5c301635%7C0%7C0%7C637278378260012996&amp;sdata=3DVZfJ
> %2BLVtuB
> > +JOWy0e9riauncrE5UNozko4iP6tYm9y80%3D&amp;reserved=3D0
> > +$schema:
> > +https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdev=
i
> >
> +cetree.org%2Fmeta-schemas%2Fcore.yaml%23&amp;data=3D02%7C01%7CAns
> on.Hua
> >
> +ng%40nxp.com%7C943043d1a28548a7fd3308d8114efd9d%7C686ea1d3bc2
> b4c6fa92
> >
> +cd99c5c301635%7C0%7C0%7C637278378260012996&amp;sdata=3DABISCsw
> dkJMA4ECe
> > +JE7wKsgzcwZYQS1dfVrxCAecLlY%3D&amp;reserved=3D0
> > +
> > +title: Freescale Inter IC (I2C) and High Speed Inter IC (HS-I2C) for
> > +i.MX
> > +
> > +maintainers:
> > +  - Wolfram Sang <wolfram@the-dreams.de>
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - const: fsl,imx1-i2c
> > +      - const: fsl,imx21-i2c
> > +      - const: fsl,vf610-i2c
> > +      - items:
> > +          - const: fsl,imx35-i2c
> > +          - const: fsl,imx1-i2c
> > +      - items:
> > +          - enum:
> > +            - fsl,imx25-i2c
> > +            - fsl,imx27-i2c
> > +            - fsl,imx31-i2c
> > +            - fsl,imx50-i2c
> > +            - fsl,imx51-i2c
> > +            - fsl,imx53-i2c
> > +            - fsl,imx6q-i2c
> > +            - fsl,imx6sl-i2c
> > +            - fsl,imx6sx-i2c
> > +            - fsl,imx6sll-i2c
> > +            - fsl,imx6ul-i2c
> > +            - fsl,imx7s-i2c
> > +            - fsl,imx8mq-i2c
> > +            - fsl,imx8mm-i2c
> > +            - fsl,imx8mn-i2c
> > +            - fsl,imx8mp-i2c
> > +          - const: fsl,imx21-i2c
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    const: ipg
> > +
> > +  clock-frequency:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
>=20
> Already has a type.

Will remove the type and just use enum for it, it ONLY supports 100KHz/400K=
Hz.

>=20
> > +    description: |
> > +      Constains desired I2C/HS-I2C bus clock frequency in Hz.
> > +      The absence of the property indicates the default frequency 100 =
kHz.
> > +    default: 100000
>=20
> The bus default is up to 3MHz. Is that valid here?

No, it should be either 100KHz or 400KHz, so far on i.MX I2C, ONLY 100KHz/4=
00KHz are
supported/tested.=20

>=20
> > +
> > +  dmas:
> > +    items:
> > +      - description: DMA controller phandle and request line for RX
> > +      - description: DMA controller phandle and request line for TX
> > +
> > +  dma-names:
> > +    items:
> > +      - const: rx
> > +      - const: tx
> > +
> > +  sda-gpios:
> > +    $ref: '/schemas/types.yaml#/definitions/phandle'
>=20
> *-gpios already has a type

Will remove -gpios' type/description as it is already defined in i2c-gpio.y=
aml.

>=20
> > +    description: |
> > +      gpio used for the sda signal, this should be flagged as
> > +      active high using open drain with
> (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)
> > +      from <dt-bindings/gpio/gpio.h> since the signal is by definition
> > +      open drain.
> > +    maxItems: 1
> > +
> > +  scl-gpios:
> > +    $ref: '/schemas/types.yaml#/definitions/phandle'
> > +    description: |
> > +      gpio used for the scl signal, this should be flagged as
> > +      active high using open drain with
> (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)
> > +      from <dt-bindings/gpio/gpio.h> since the signal is by definition
> > +      open drain.
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/imx5-clock.h>
> > +    #include <dt-bindings/clock/vf610-clock.h>
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +    i2c@83fc4000 {
> > +        compatible =3D "fsl,imx51-i2c", "fsl,imx21-i2c";
> > +        reg =3D <0x83fc4000 0x4000>;
> > +        interrupts =3D <63>;
> > +        clocks =3D <&clks IMX5_CLK_I2C2_GATE>;
> > +    };
> > +
> > +    i2c@40066000 {
> > +        compatible =3D "fsl,vf610-i2c";
> > +        reg =3D <0x40066000 0x1000>;
> > +        interrupts =3D <71 IRQ_TYPE_LEVEL_HIGH>;
> > +        clocks =3D <&clks VF610_CLK_I2C0>;
> > +        clock-names =3D "ipg";
> > +        dmas =3D <&edma0 0 50>,
> > +               <&edma0 0 51>;
> > +        dma-names =3D "rx","tx";
>=20
> space                       ^

Will fix it in V3.

Thanks,
Anson
