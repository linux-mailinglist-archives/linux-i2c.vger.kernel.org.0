Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A8F475E995
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jul 2023 04:15:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231718AbjGXCP5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 23 Jul 2023 22:15:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231229AbjGXCPo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 23 Jul 2023 22:15:44 -0400
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2040.outbound.protection.outlook.com [40.107.215.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B7B72125;
        Sun, 23 Jul 2023 19:14:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nHID8aiVdrP+Yzl33IAr9F3QXV3vmO3Gf5sclV4esQOkgeWIqJntZTGDTRK1TzNRj+A5D1vjOJgvarY5ZCI52d7pexlfXW9VyV9+mKmh0nR5i55QC+cyrSP+44JTxQkYGLxshoKQAtm6vVBkvB/S6M/aM3Z0bQkFvvUTDjsJOdO3FGMDqppTDt/AJnidmIdMvucBZbLlGcJJNl6shAY0bL6cJd4Z/vs/m8W5wFDz+uCmT8i9tbmOPKqZfs46uUaw6wosC4ZzedYlZp+L8pMGNqcgdCFA8I9FUq32ih5NE1b6Lb7CQ2Rw5x9y/7adeCQHsXMGX2CYyWuHmyVMhJsNYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rme+3PTVH3BILAQYFsc2jT5u4TrEvs3ZJdqdoPSJGpY=;
 b=L3lEq+nzGha5YHUCMpqP9BRNpsn1B2AnMGqenGzuGqPbu+3yd9QGXMEo6maTelvD93YdkRyW8yKMYy7mcvqnIrAU+IfUgZyBvJ9NPFCJ80GN/2EJbuGcDWG/wEwtX1IRrr+fyKq9rR5VPgXDPxkikBH2UDIIJJcto49Fv1RoHk3E0QFtE48zLd9W2dYh9QglfGQKmqnYm2gn+O6juBzFCtP6gIwEKKvWtnCiMO7QJnQGzJA9elpAHWookYF6HhNJT2Xu8f9UybzCfv3MK1m8WHPma+Z8ZMkXOHXiTdoUgBLS2HywlnEIYNcxFZ3qcCi6vYngvopCodxMOwUu9+VH8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiwynn.com; dmarc=pass action=none header.from=wiwynn.com;
 dkim=pass header.d=wiwynn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rme+3PTVH3BILAQYFsc2jT5u4TrEvs3ZJdqdoPSJGpY=;
 b=3p2WFCMDInCWc+am4Obiw5ph3gwic5Lc7htq1TOMz1a9LWEF8A2lUOVtG4Lh5k33wElkyp4cviiNW5Y44UvCkC1/J9Z0zSUQWaOTpscnW0SAwXyDVvw6DN10XI5uiZvW/W4rZYwXEl7xQPGf2giO7Zhjnw2/A34HDBzJ+PHkpvgVAWPFIhkF9AkopZy/kKq1Em2/uJg/zyjX0tk/VFhI1omxM8+KJFCeCJh0LuwazbEDBK/J6BLuKltq1qXc/1GyxK1t4qW4TuH9giQ4Q/V5EbSaf/73I7m/syXVjt/cNwrI/oIWGnYcxMYZEugy5x+U+xSXBpvT6NfUwlKet+WKYA==
Received: from SG2PR04MB5543.apcprd04.prod.outlook.com (2603:1096:4:172::14)
 by SI2PR04MB5704.apcprd04.prod.outlook.com (2603:1096:4:1bf::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 02:12:26 +0000
Received: from SG2PR04MB5543.apcprd04.prod.outlook.com
 ([fe80::819:57b:cc1b:f5f0]) by SG2PR04MB5543.apcprd04.prod.outlook.com
 ([fe80::819:57b:cc1b:f5f0%7]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 02:12:26 +0000
From:   Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "patrick@stwcx.xyz" <patrick@stwcx.xyz>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver
 bindings
Thread-Topic: [PATCH v1 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver
 bindings
Thread-Index: AQHZdpWBIG2M1qq32EmedgU1uUok9a86egWAgI5AU0A=
Date:   Mon, 24 Jul 2023 02:12:26 +0000
Message-ID: <SG2PR04MB55436F03F6CAD6D415FDEE40A102A@SG2PR04MB5543.apcprd04.prod.outlook.com>
References: <20230424101352.28117-1-Delphine_CC_Chiu@Wiwynn.com>
 <20230424101352.28117-2-Delphine_CC_Chiu@Wiwynn.com>
 <321a84c6-6d74-4042-a6ce-6229073c8d30@roeck-us.net>
In-Reply-To: <321a84c6-6d74-4042-a6ce-6229073c8d30@roeck-us.net>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiwynn.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR04MB5543:EE_|SI2PR04MB5704:EE_
x-ms-office365-filtering-correlation-id: b1414480-5190-4caa-ee7f-08db8beb6d2c
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TCVrTwwZyXe6K0H9r42w98K+CxobJY9kh8ddMQZEZVhvhbbrJmjw6J+u3/ZoFAwm1EdIB6V8C2M4HJchT3/wv75OKdclqBwIXeT1RnGOB7BcKX2RNX2X1WISvfFHwUTdXkp2GxfVn13VLeYotJb72kTJKizfCcPBRj/Nko/kz4IBo9Pm6ONrjzXuiNzOiHS/Cj+waFGtWLKdMnkZyF5GfCnZQMVGprLDQGkbtB7eFFopeukXFQpOmuiN43V25MIARFiQV5BCZqC2ezYP+oRNCnPNsKVewneLRMdnxNOzeYLqOhc+fVrdr9OJ7FftkAdt667bW8ophpE4I0wof0634UDEblpUHjn8vNe9/XOV8sVfyYrii8P4NJZHeXhuPp4KcEpOJw4BC0bWf/qn3Twi/6SDuQ+5Psm9WOYlTdT11We+DSpNKbCCKD2sH/NRQiClWTSfsonB1eyQ4jLzhlYBiWPRn3PCObpmzCzPaKxhbK3oshTBRt/buxmh3YmDf5peHF9wg3IBZUYiQmbMKVDSkZ7nAakBc/KPiQ22Gm16T0Olb4d8r0zoKrRA3wUgQccXjwRxKoNoYUg8zwKG/CiuKyJRsIm4kSjsemjmoL848fk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR04MB5543.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(346002)(136003)(366004)(396003)(376002)(451199021)(38100700002)(122000001)(55016003)(53546011)(83380400001)(8676002)(5660300002)(52536014)(8936002)(54906003)(76116006)(478600001)(66446008)(64756008)(66556008)(6916009)(4326008)(66476007)(66946007)(316002)(41300700001)(186003)(26005)(6506007)(71200400001)(45080400002)(966005)(9686003)(7696005)(2906002)(33656002)(86362001)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?v+5AWtMasCOs8aSkaQtn+OWrPeITw4YmeLru5kwmQ0XiRt2J+klXHRGi83r8?=
 =?us-ascii?Q?NX09DsvpplyltFWviSRvE9glBScuH36HgPYHFLahweHMRnPuTDjbXDbOeY7B?=
 =?us-ascii?Q?3tP2hkBy+4JTvwPW4DnFysWyMcRSEWCZhyZA69rxcwapfarH0mip7nrc9cr0?=
 =?us-ascii?Q?DDcYX/V+80PdaMDjqOUnLE68/KIVnFfsOyuLGRfyg+WEzwCg72XsjQDJ4Xt+?=
 =?us-ascii?Q?q7Pym/JA9Hm1mbzDsgtWwXsa08YIilLL32ZjomQYA+m5c41QWB6rzXEDM1PD?=
 =?us-ascii?Q?PJpMZe8LnKB0TUNF5V0SkgYdeidmalYW3bnPY9YE/O5FNDLLwckK8R0eWiTt?=
 =?us-ascii?Q?HopSGIo00rp1gKMhbNqRiYmDnG9jYMvF0GrSA/u1OP0PB5YE9u4C3gEzF3hL?=
 =?us-ascii?Q?rJfuKeZQnGwrX3kHl6YeAlNWsWIfo2W3gCsknjq6qUot0pAqsIe6Ys1IWdqf?=
 =?us-ascii?Q?6RCJ4DPnPGeC6Zlun+mogA008vuaRus3OXeVeI4GLnIvr2qpXIWv5EUVDrpd?=
 =?us-ascii?Q?z6NspjjhK4m6FwfY0rnx6wL4OlnAZDlLAzOB5QRa4QuUej/iuk7djM9iPNop?=
 =?us-ascii?Q?stvtdemC7FronEJOCoQvnKtkUjy6gIYJNwhQoU62nSMyv1mTSXXgWTx8dxa3?=
 =?us-ascii?Q?Lkv805EFAHoc56Fx+jRiCQsE4uvQSl85U4lk5UqBQFEuyZBGZ+TkdSnysPJx?=
 =?us-ascii?Q?DverT42Ze8vVR8tjwU9fXQ5pQCb6IeLNe2cObL/BXZ7fW2ov9ZnW+Sihn5pf?=
 =?us-ascii?Q?U7ssZWQD+Droy4/SHM48F3hgYtUhv+XIeo/9h9YUgOEWTY99PumZDz1ET52U?=
 =?us-ascii?Q?zdXKVebalVY9GQfz8pyQmHhvNLF9+ia5eKZbHv7tTilc3a5HWbOEWsKWu1jC?=
 =?us-ascii?Q?KYR2OWk1L6erKqoSc/0jyzL6ZyzPx8x1W/03dQFFC7yHc1a3MIe+8rfEjUN5?=
 =?us-ascii?Q?Hb/MHQ6fHUgQIwjdOyjmKWLUFNu+k/+iBmY9TzoOHqRFSLz5GJwBLLeKpM7n?=
 =?us-ascii?Q?YHQJuH0W55OYKlKDR7dt/cZlxIUGHf+ZEMIn27rb35PQ55gRRz3Tiy5wM8aB?=
 =?us-ascii?Q?mH34tSxEy1dOxnl3ZM9Z4Qz//6nn7eNASbXnh7d8RJEZyXUzYptIhuvHpMHB?=
 =?us-ascii?Q?+zhBI7DsH0/Bc4JdEsAM7B/sGV677CGVcgw3j+gMsteVP/GALRe2Y45ha5Ef?=
 =?us-ascii?Q?uVBKHmIfSpdSAeB+epfceg94/7CUGOxJf9Q13hPxLhaKX4BvMDgRUbrCbm8z?=
 =?us-ascii?Q?uW6V0x44/86Elz/qURXiUEorpqTRvOmJN7Ajvjs+qI8xSgrlkZtgQ6TjFCuQ?=
 =?us-ascii?Q?8osmlINrp4w2Wv2bxDen5e/r5z0zmQcQxTAdzOtqlLSBMNxRhkuVR4PJAZIl?=
 =?us-ascii?Q?8G2dRwHUmZxwa/f94De23GvzjuiXOF981BgHl1OrEWrE1obBJwnkz5gwhmkp?=
 =?us-ascii?Q?UvUFmXM1moKG3RknBJ9AvWslq7QErKsDi6pGGyeQtRYq3zv9Pf/1KVEl8Wa3?=
 =?us-ascii?Q?eSuixMci6VxLVT2g2Sr/rHFUczIS41ZfGn9Z4K2vYlogX0LDvY710TcP1Dl3?=
 =?us-ascii?Q?G1CFEzo1d4r58OuFuCSNBB7X1y6O6mXbVl/Sps91?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR04MB5543.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1414480-5190-4caa-ee7f-08db8beb6d2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2023 02:12:26.8104
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yRQYXNRBsCl6212qhWiWzhAwsvxqRoR1NzTUhfW/BYCc3hFlRtIV2+84w0ueSzNEpbojXXh9JRdFCbYG0DrP0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR04MB5704
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> -----Original Message-----
> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> Sent: Monday, April 24, 2023 9:50 PM
> To: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
> Cc: patrick@stwcx.xyz; Jean Delvare <jdelvare@suse.com>; Rob Herring
> <robh+dt@kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>; linux-i2c@vger.kernel.org;
> linux-hwmon@vger.kernel.org; devicetree@vger.kernel.org;
> linux-kernel@vger.kernel.org
> Subject: Re: [PATCH v1 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver
> bindings
>=20
>   Security Reminder: Please be aware that this email is sent by an extern=
al
> sender.
>=20
> On Mon, Apr 24, 2023 at 06:13:49PM +0800, Delphine CC Chiu wrote:
> > Add a device tree bindings for ltc4286 driver.
> >
> > Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> > ---
> >  .../bindings/hwmon/lltc,ltc4286.yaml          | 47
> +++++++++++++++++++
> >  MAINTAINERS                                   |  9 ++++
> >  2 files changed, 56 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> > b/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> > new file mode 100644
> > index 000000000000..c1c8e310f9c4
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> > @@ -0,0 +1,47 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id:
> > +https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdev=
i
> >
> +cetree.org%2Fschemas%2Fhwmon%2Flltc%2Cltc4286.yaml%23&data=3D05%7C
> 01%7C
> >
> +Wayne_SC_Liu%40wiwynn.com%7Cac3bc6cdf556435cfa0f08db44cabd06%7C
> da6e06
> >
> +28fc834caf9dd273061cbab167%7C0%7C0%7C638179409777006260%7CUnk
> nown%7CT
> >
> +WFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC
> JXVC
> >
> +I6Mn0%3D%7C3000%7C%7C%7C&sdata=3D8d9ycpebE%2FrhafDDmDL9sefo1xq
> m%2B9r%2F
> > +Wm0Cu1McEOs%3D&reserved=3D0
> > +$schema:
> > +https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdev=
i
> >
> +cetree.org%2Fmeta-schemas%2Fcore.yaml%23&data=3D05%7C01%7CWayne_S
> C_Liu%
> >
> +40wiwynn.com%7Cac3bc6cdf556435cfa0f08db44cabd06%7Cda6e0628fc834c
> af9dd
> >
> +273061cbab167%7C0%7C0%7C638179409777006260%7CUnknown%7CTWFp
> bGZsb3d8ey
> >
> +JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D
> %7C30
> >
> +00%7C%7C%7C&sdata=3Du4yJaVeL2xSUE2%2FaNpEbQ3KJiy%2BcxtKG95gGuaGI
> LFU%3D&
> > +reserved=3D0
> > +
> > +title: LTC4286 power monitors
> > +
> > +maintainers:
> > +  - Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - lltc,ltc4286
> > +      - lltc,ltc4287
>=20
> There is no LTC4287, at least according to the Analog website.
It has been announced on Analog Devices website.
Please refer to this link: https://www.analog.com/en/products/ltc2487.html#=
product-overview

>=20
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  vrange_select_25p6:
> > +    description:
> > +      This property is a bool parameter to represent the
> > +      voltage range is 25.6 or not for this chip.
>=20
> Existing attributes are adi,vrange-high-enable, ti,extended-range-enable,
> ti,bus-range-microvolt, adi,range-double. I would suggest to use
> adi,vrange-high-enable.
The vrange for this chip is either 102.4 or 25.6, and default is 102.4
So, we think vrange_select_25p6 may be more appropriate

>=20
> > +
> > +  rsense-micro-ohms:
> > +    description:
> > +      Resistor value in micro-Ohm
>=20
> I would suggest either shunt-resistor-micro-ohms or
> sense-resistor-micro-ohms as used by other bindings.
We will revise to shunt-resistor-micro-ohms.

>=20
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - rsense-micro-ohms
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +        status =3D "okay";
> > +        ltc4286@40 {
> > +            compatible =3D "lltc,ltc4286";
> > +            reg =3D <0x40>;
> > +            vrange_select_25p6;
> > +            rsense-micro-ohms =3D <300>;
> > +        };
> > +    };
> > diff --git a/MAINTAINERS b/MAINTAINERS index
> > c6545eb54104..930bdba0f73c 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -12183,6 +12183,15 @@ S:   Maintained
> >  F:   Documentation/hwmon/ltc4261.rst
> >  F:   drivers/hwmon/ltc4261.c
> >
> > +LTC4286 HARDWARE MONITOR DRIVER
> > +M:   Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> > +L:   linux-i2c@vger.kernel.org
> > +S:   Maintained
> > +F:   Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> > +F:   drivers/hwmon/pmbus/Kconfig
> > +F:   drivers/hwmon/pmbus/Makefile
> > +F:   drivers/hwmon/pmbus/ltc4286.c
> > +
> >  LTC4306 I2C MULTIPLEXER DRIVER
> >  M:   Michael Hennerich <michael.hennerich@analog.com>
> >  L:   linux-i2c@vger.kernel.org
> > --
> > 2.17.1
> >
