Return-Path: <linux-i2c+bounces-164-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAE97EBEA6
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Nov 2023 09:38:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 229561F263A5
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Nov 2023 08:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EA35441E;
	Wed, 15 Nov 2023 08:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b="a7JVk4Kq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E2C7E;
	Wed, 15 Nov 2023 08:38:11 +0000 (UTC)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2072.outbound.protection.outlook.com [40.107.215.72])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D39A910D;
	Wed, 15 Nov 2023 00:38:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XpOVc5Pwmx8k6RT1KQAkC8deZA/6iUyNgir4frAC0TbVtkPk+QoL5Ts5hj8FSCBJhiZbP2cI+za7EjdszYh0HqbFEjw2AIYx/y3gfFdx4CvacV6LxhGOO+6BtguXGVj7A9zPL564wLKejtxkEplWEpIsbuAVDokRFTRdKXSZ3sZlNQMhEQtUXYxEhXcjGypUCVq5x2wo/ncxR6FWmElOz/u8aBtE8W2mmeH5ITi78g/h+3eHyazXRr7FHQltC9/udpZV3/7IMtbZ/xCLD7Dj33DopWhBDQtYPRBjzedLEuHdujJikeJ3b/1H7RX60YrZl50OcHpjMfWsMVuZQYTEVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0JttOVNFo8heeEfn9CDxs7KQXr2oZc+mawd+1dBJevk=;
 b=iszx1ikzY+0nnsQrMbtMeZapG2B+GFTdJUsqcRCgrqcXe7sgK+QODzQa+qo2R1Xh/oVM7kTjZWxWKE7YM5Y8q8cTJOueo17c7CV2O4eC4h53RTgaDM++NKmzkOpRtfnbCR6ZPTwiyXL/goHo25ExRetyHux7a3iwg3YMtUuB0P2Q06vHUCGrzuvSI/8BDVclqCNCVPrMHs5lZh4Qt4J2jH0e8m6rwruLdSclP5sOO+71uwmtIFKz2219a0AYZPAXg1bWeaWIwlABYvdAyfCuMa5VJw8C/n4khAD6BSQX1BqFQt3uXS1KT5M9CxvNwNmQg/9mrNFuWeIdAkfpVM760g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiwynn.com; dmarc=pass action=none header.from=wiwynn.com;
 dkim=pass header.d=wiwynn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0JttOVNFo8heeEfn9CDxs7KQXr2oZc+mawd+1dBJevk=;
 b=a7JVk4KqB9NiQN6LmISzao3hr9WQFSa6fcjuEKaBWcDXhvfsjlNbwxKo5A/A6EfMQDq5Yn0Lf8HS1Rg/gtWolMQulipqtKg2NawEywisHlTj9oVMQsnRln417aYoKXWNIA2WYBetemI8A79cv/NJjXJCBEgpm/oVwnr/a8gR0fo+katgXC/OZUwQ7pBVI7m9cSqQPjzHSphxNXYnBCWGQCnsdQRwY1LzaGIzkmmfaqo8DXYQxvLLsd/Ud55NFMJG8HInGaaCFpTv0j2IXmWvJ0r4yS1hKdUoYzquCjMBkzIxzbNuLyVchLx9WOT61QpEMAyTSzlMjqcIL6IzYdhgSA==
Received: from SG2PR04MB5543.apcprd04.prod.outlook.com (2603:1096:4:172::14)
 by SEYPR04MB5786.apcprd04.prod.outlook.com (2603:1096:101:86::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Wed, 15 Nov
 2023 08:38:01 +0000
Received: from SG2PR04MB5543.apcprd04.prod.outlook.com
 ([fe80::c980:d5d7:4099:fa07]) by SG2PR04MB5543.apcprd04.prod.outlook.com
 ([fe80::c980:d5d7:4099:fa07%3]) with mapi id 15.20.7002.015; Wed, 15 Nov 2023
 08:38:00 +0000
From: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
To: Conor Dooley <conor@kernel.org>, Delphine_CC_Chiu/WYHQ/Wiwynn
	<Delphine_CC_Chiu@wiwynn.com>
CC: "patrick@stwcx.xyz" <patrick@stwcx.xyz>, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: RE: [PATCH v4 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver
 bindings
Thread-Topic: [PATCH v4 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver
 bindings
Thread-Index: AQHaEq8NCeC65w2qLE2sHA7PlL1AHLByObgAgAje/MA=
Date: Wed, 15 Nov 2023 08:38:00 +0000
Message-ID:
 <SG2PR04MB5543AB6AB419CA76DBD5E023A1B1A@SG2PR04MB5543.apcprd04.prod.outlook.com>
References: <20231109014948.2334465-1-Delphine_CC_Chiu@Wiwynn.com>
 <20231109014948.2334465-2-Delphine_CC_Chiu@Wiwynn.com>
 <20231109-obscurity-dress-4d1d3370ea56@spud>
In-Reply-To: <20231109-obscurity-dress-4d1d3370ea56@spud>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiwynn.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR04MB5543:EE_|SEYPR04MB5786:EE_
x-ms-office365-filtering-correlation-id: ce2a70d5-b4f0-439e-025e-08dbe5b62d09
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 vBMlGJSj8VxE8i7xq/O8YJSDohtd8ec52PmdLIdSqCVhv2qxKDm1DstCie58gjq68jxWQxydiu8BlREwypOMxsweFO1FexjDaAgeL/5TTH3rsuKYVWL4VjSgyAEkWX+FHuO2c5RJUXhmE1RGEqPjplNjWJw13t87syGAVkTLOQjmqWvWVL0hCzC5aqfAcNcFqo4ENIkEIDtHWyNSffLh95fkYRdun9lMsL4yjrrr47U+eZLVY5mB5thO7CT90t8ub0XMYju3Gg5OFxHBIC0huezTj2HoHRgJGOtuH6awQ7jfoRtd5yjGvQ7Y7WgOh86S5rZJJZpifRov9S196PW1BESnnGdWE7cMjuyxlR5hdJjU2A2Ryd6Dx/MwTF5Sxlar+QiVAWoJH/oYhyWzke95cj6uQfsCyq9g2You2Fqmqoq7QM4eVYrojWH3THhsox7D9/tNloMlHdOmIRiazzLPgYQV8KdsRrCorpFd2PDI9087ap4a865zQrf3pbKXmGJFpPz+x2Ja02GQ9AmsDcns5XsDRNPnH5aqNnH0CclOOFeAFP4avXAI8dOG9B1xKGAKLUE4vjpcnTut/+rg5ECxEhzeU7OEnPAoEy4Brn0hM9l9TqDQzmOmFiBlqmhtgyWLt0n1PnrG8R8dKmO8X/JlNg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR04MB5543.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(366004)(396003)(136003)(376002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(7696005)(71200400001)(9686003)(53546011)(6506007)(26005)(83380400001)(8676002)(8936002)(5660300002)(41300700001)(4326008)(7416002)(2906002)(52536014)(478600001)(966005)(76116006)(66556008)(66446008)(54906003)(110136005)(122000001)(64756008)(86362001)(66476007)(66946007)(316002)(33656002)(38100700002)(38070700009)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?MsUJ4s25L5GO3CYHN2hJBiYFgdRd9igziTFBWMY/WWp9OAtG4wBlmLWW0kbh?=
 =?us-ascii?Q?iEvV/8yP+v1b2NjWE2gkpq58DHOqttGYJ5MtB/Du/7XNAl8d++wrr24zVIPU?=
 =?us-ascii?Q?hkiHRFOHWqUtErHhI0HVuMui5t0oxfNIQra4Ldz0kpgcWLqobvlIMLVWAMSo?=
 =?us-ascii?Q?rbcuV+3Aiu2VXSqyr7lmomupirkcYGkYYnVIFekm9umFn7Lz12RSHXaBFE9h?=
 =?us-ascii?Q?ztNe0cv8pH1aR6XKBPvWn9sLf+ZE9DbSQOlZzXwLZMsRMmaD/q5VMVfaqxL+?=
 =?us-ascii?Q?o2m070Q7x5j+/aAaSx2zl+0F6wKQNJsdKxiGZGeSNHVeaz3PAvkmYMgeD+gz?=
 =?us-ascii?Q?XlMVtGmaRcIuSaDdvaI4PTNqDcjdxEElWs0SQ7mbv0JYkklNuq3vF7kGYH+S?=
 =?us-ascii?Q?hm1lMdar1Mp/UMIhAI/RjYOuk4D5upAodi9TRZE2VZP4bLAk7RhNyyBynXrp?=
 =?us-ascii?Q?pHaZ73vFwBBAi38Dx8RbrliiWU5rcf6rHdcLhrQsK3Hdv9uc4dc7x9uqpARr?=
 =?us-ascii?Q?AKGWEyt9ZD/nJcy/oRf1XsXehyG+V2O5NMqKu/bxYdgp34N8IBr14Rh9KtGT?=
 =?us-ascii?Q?jS27d6aj5js/QAB2SaX/D15p9paiiDxrR6PWhHz3PX6H0Zaq8ZTt48yQj0Y3?=
 =?us-ascii?Q?QcR66Wa6uitbZHPVYASa0zRXIpj/N2j+5E3PB+xXmeCJeP8O1OKcxM4yshN6?=
 =?us-ascii?Q?ZjxpmvPmp5JRZb+egRzFO8Y4875Kwdp/pZnS37hC+zCWmCu4Ct1OWt16Vs8I?=
 =?us-ascii?Q?xoc2Cofkfc4TFTLlMIrq0xuM1mHqlHF+JuZsYYE3k0UdAdKSI3BgXTmj/h4k?=
 =?us-ascii?Q?BzdRu0XyFLd5K6QnlxnLGg1hoW8UALTtdfE8QG/D38uw8DSkLks8ZE1S02W+?=
 =?us-ascii?Q?shm8xlUVY9FcaaxWJpW+EY3P2KYlvX1PUfOKyyMFvTwgKgKyVWN3YI6UGeAt?=
 =?us-ascii?Q?4y6tFCuYH6v8Roiu+saeiXx+ZXKI6mjAW5p+YHx14goNuyL0IvbjyCK46z5c?=
 =?us-ascii?Q?NHBf7FOdMMKDxgJZuMWaAeTCjLru8jTFf77jN9PcVfhlwucGSRU8i2Zfy1l+?=
 =?us-ascii?Q?alIxEsb1HoaI/LB90558phRKm/PBJyL8UzBnYPRYReTxFZdIpXPY6e49NDsK?=
 =?us-ascii?Q?AXRG5eie3lacgoIiU2Lvgi3Pe9fLLW60Xnbz9SSXON768QPuJWAMLWtNHnk2?=
 =?us-ascii?Q?XIzRjYIV/mk1hcik4tdnmE3KeNDM7xYj+5Wv2ay+YHh1SbAoo7SWfUY26gO7?=
 =?us-ascii?Q?ctyk1KoMXzJsEnF486MfhuMSVkYU3nAKV02ZOfx6Bxw8LQ1vcE5jmk//w4Bp?=
 =?us-ascii?Q?myobZNseMSf301PiXHvAAjTxHMUXc7GC0ftTjYlZjXyHbCHYdKVSL1BHlIXy?=
 =?us-ascii?Q?Dvxn5cPvQty/nYB8Ixe1I0AKzPXfSmtmhB2KRudUpoIYyrtHdcl/ghys/M4e?=
 =?us-ascii?Q?26a34tjk5IG7Mfji+hV0W88jrnxcr0m5Swqfqy2ds2bTA6/lboA3i3P5W/gy?=
 =?us-ascii?Q?MGVezlJa46Oxmd8u1u7D8ubuLTvWE+gzm63BVIN+g+bgIZE85EZc3jrCFrjI?=
 =?us-ascii?Q?53fUGb1CTg8M0T2C6HnaKWPSMq3h3WKAktsr/MV+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR04MB5543.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce2a70d5-b4f0-439e-025e-08dbe5b62d09
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2023 08:38:00.5139
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HCJwns3LqHDCbuxfnxNGvZGU+9OJWVLb/QjWvACWvsH39tLh7zC/J60aG7GMYcYloM+uVlgDzyzk47B4rRtI2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB5786

> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: Friday, November 10, 2023 1:10 AM
> To: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
> Cc: patrick@stwcx.xyz; Jean Delvare <jdelvare@suse.com>; Guenter Roeck
> <linux@roeck-us.net>; Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlows=
ki
> <krzysztof.kozlowski+dt@linaro.org>; Conor Dooley <conor+dt@kernel.org>;
> Jonathan Corbet <corbet@lwn.net>; linux-i2c@vger.kernel.org;
> linux-hwmon@vger.kernel.org; devicetree@vger.kernel.org;
> linux-kernel@vger.kernel.org; linux-doc@vger.kernel.org
> Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver
> bindings
>=20
> On Thu, Nov 09, 2023 at 09:49:45AM +0800, Delphine CC Chiu wrote:
> > Add a device tree bindings for ltc4286 device.
> >
> > Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> >
> > Changelog:
> >   v4 - Revise some inappropriate writing in yaml file
> >   v3 - Revise adi,vrange-select-25p6 to adi,vrange-low-enable
> >   v2 - Revise vrange_select_25p6 to adi,vrange-select-25p6
> >      - Add type for adi,vrange-select-25p6
> >      - Revise rsense-micro-ohms to shunt-resistor-micro-ohms
>=20
> Your changelog should be below the --- line.

We will add --- line on our changelog.

> You also omitted the tag I left on the previous version.

Could you point out the exact places that we omit?
Thanks.

> With the changelog fixed:
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Cheers,
> Conor.
>=20
> > ---
> >  .../bindings/hwmon/lltc,ltc4286.yaml          | 51
> +++++++++++++++++++
> >  MAINTAINERS                                   | 10 ++++
> >  2 files changed, 61 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> > b/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> > new file mode 100644
> > index 000000000000..d26f34fb7ea7
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> > @@ -0,0 +1,51 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/hwmon/lltc,ltc4286.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
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
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  adi,vrange-low-enable:
> > +    description:
> > +      This property is a bool parameter to represent the
> > +      voltage range is 25.6 volts or 102.4 volts for this chip.
> > +      The default is 102.4 volts.
> > +    type: boolean
> > +
> > +  shunt-resistor-micro-ohms:
> > +    description:
> > +      Resistor value micro-ohms.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - shunt-resistor-micro-ohms
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        power-monitor@40 {
> > +            compatible =3D "lltc,ltc4286";
> > +            reg =3D <0x40>;
> > +            adi,vrange-low-enable;
> > +            shunt-resistor-micro-ohms =3D <300>;
> > +        };
> > +    };
> > diff --git a/MAINTAINERS b/MAINTAINERS index
> > 0b275b8d6bd2..5d439cd64ecb 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -12609,6 +12609,16 @@ S:	Maintained
> >  F:	Documentation/hwmon/ltc4261.rst
> >  F:	drivers/hwmon/ltc4261.c
> >
> > +LTC4286 HARDWARE MONITOR DRIVER
> > +M:	Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> > +L:	linux-i2c@vger.kernel.org
> > +S:	Maintained
> > +F:	Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> > +F:	Documentation/devicetree/bindings/hwmon/ltc4286.rst
> > +F:	drivers/hwmon/pmbus/Kconfig
> > +F:	drivers/hwmon/pmbus/Makefile
> > +F:	drivers/hwmon/pmbus/ltc4286.c
> > +
> >  LTC4306 I2C MULTIPLEXER DRIVER
> >  M:	Michael Hennerich <michael.hennerich@analog.com>
> >  L:	linux-i2c@vger.kernel.org
> > --
> > 2.25.1
> >
> >

