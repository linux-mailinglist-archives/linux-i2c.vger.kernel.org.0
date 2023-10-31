Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0A117DC6B4
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Oct 2023 07:47:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236218AbjJaGrO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Oct 2023 02:47:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230190AbjJaGrN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Oct 2023 02:47:13 -0400
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2044.outbound.protection.outlook.com [40.107.215.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E1ABC0;
        Mon, 30 Oct 2023 23:47:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BTdw/LNUgqFPhxWQZYojMZym94WVdFZHpzYpSvbcDBm6XyZ7wgNTrfOLe1vpeM2WSRXnsVxhzxoSv+CwQe4zBLqg4PiYwTA0uMhd4dtpVUpbtHyyKDvWXbGQ8YEFe7sLVICNpgo1JP0l7sdM/3skSDxY5CzkBFu+vAlfiASfhyCJVMuptNW9GhS3Uye1Rxr1rcs1wwUwtlpJrcf1ZsNe2m4MFsS2XCZvQRHC/tYySlOblOFycBG4HscBWPuiWsAEhqo7LaWSa/n8KeIvPbOorfv0eEMs5kA3JmydONty5+leau303js4Y514Kj8+yxHgdEu8JVKdYLW7tkhr8lWIfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=delicRjsKXv6jP4SqSPLt2ngl3sTbc63i7hRgIQg7CI=;
 b=Id2uNpU0Dl939jIgt1VJe7y5tfLzDo3A1sZLRW6bzVKDWZY5XPP2SzmoEvaRzrfOFKYTxEbXYsvbnjJnBz4iK/1Ki5jboR27lMWYCygbZcCcpoaMMOGxU6iwr9V13KGUWcAHxGLrWUGz6n8Y1FBlOFbcsB9rvWxqEuazEMshKF/KrkHghDpg70kPjWoXNmItlbfE/o1UULBDJUikcuVSdHDjMd4/HQUPev7Cjk45NfgrLEvPC/iBC/bY0FVy88zva36R0iaLsaX7fTr+2zV37lj/iLUDPyVqJZzwcEXH+FWv0XUzokGh/YpkaY1t6FUcdZp95lPd0dVrm7EPQcWMbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiwynn.com; dmarc=pass action=none header.from=wiwynn.com;
 dkim=pass header.d=wiwynn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=delicRjsKXv6jP4SqSPLt2ngl3sTbc63i7hRgIQg7CI=;
 b=hnaYrSOJkpWKz30LQguhPmyRl7CG+lGHJcW1gRSPvYLPBiRphUNNOzzUTfKD4vWLjq7W8Bsl02S/5EMywW1f0wOVHtvWrw8NleoocSrdMosuovD6MlbIdabyJkpd7J0OH6STnDfp9EeZxt4WhD02iH9Axx50IvKHlqBnBAfEoqsViZX+keGj37fvn+ctMIfD9wIKIIT0T/Sg6lmv+2B6jUDsZw0u1MYR5AF8+C2zd+J61X4N7xs0nA05U1v2VfHCYniD5hUnysrny6fEtVr+/MrY80uyBU/0w6BKjmeMNGa7//X0SUm/eIP1h81k99R7pkCSBuDQdXL0g/tPZ1Xjhw==
Received: from SG2PR04MB5543.apcprd04.prod.outlook.com (2603:1096:4:172::14)
 by TY2PR04MB4030.apcprd04.prod.outlook.com (2603:1096:404:800e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Tue, 31 Oct
 2023 06:47:00 +0000
Received: from SG2PR04MB5543.apcprd04.prod.outlook.com
 ([fe80::4c7a:8fd8:1527:9287]) by SG2PR04MB5543.apcprd04.prod.outlook.com
 ([fe80::4c7a:8fd8:1527:9287%4]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 06:46:59 +0000
From:   Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>,
        "patrick@stwcx.xyz" <patrick@stwcx.xyz>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>
CC:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] hwmon: pmbus: Add ltc4286 driver
Thread-Topic: [PATCH v2 2/2] hwmon: pmbus: Add ltc4286 driver
Thread-Index: AQHaB+TGZscXMUpHJES8eSDx4MdG9LBcQtiAgAczeDA=
Date:   Tue, 31 Oct 2023 06:46:59 +0000
Message-ID: <SG2PR04MB5543FEAFC1777ADE29239AC9A1A0A@SG2PR04MB5543.apcprd04.prod.outlook.com>
References: <20231026081514.3610343-1-Delphine_CC_Chiu@Wiwynn.com>
 <20231026081514.3610343-3-Delphine_CC_Chiu@Wiwynn.com>
 <2ef2e804-d498-a2ae-9717-dd03bfd26853@roeck-us.net>
In-Reply-To: <2ef2e804-d498-a2ae-9717-dd03bfd26853@roeck-us.net>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiwynn.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR04MB5543:EE_|TY2PR04MB4030:EE_
x-ms-office365-filtering-correlation-id: 30887b2e-8a6b-4e58-986f-08dbd9dd2e86
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uG2TIrNQl8ZxGNVDCdN4Ow+b4YAbnoZXisT648hdzLVoZt8S7nLJBqJSTVGfqwKw+IHvYtdPvlwSzUnXBKeLjQJq6NDnQXreWx7QdvQknK/r3JTOhMCNpaNgVhxrUvFyyo+t5IGanQUIeKet03xR+2ROtcz13PaeW6IP+LbUoSK+z1xZJ4Boc+WeylMFFYkte6FqaTxZFzI5OOEZw6SjOQnpKXpQGBTC/0CY8MAwH3ty5qK7Pu0Vhs3vJolBLWD18x+sSAPLOTfBOlg0yFTsY/11GtajZEm17JuyT9b/0/HaNNzVb86ELfyrihYoqtvXbd+YkdVaeNFDYxm3evgOgaS8Kn39/qu1TW4PTSikiI/wMlWvnue5Bj5awLA13NhjL7oyuG/cQ/HKri+PK+Tsh/1DXhFRqpfKda4qhqywjq9aL+nxbgR4NN4jPpk+XWx5vR5qeqO+OGeQH1/KCzM0QLAGsw0+Uc7FdFi7240lMjlggOfoTap6+25dtDx5IzxLsuaXBAx66J2T3mod2IMO57tTSbvNBD6FFeXWem7hk6KjQEaw29SppeVEpSVCtaou8BrLle0LOHBHL6fqlb6WmMngxAFBdV/U84CuDzWEw7oNjcpl18xDck8y4YaAbzBIxojiu3xNiiM+MFe44HKxpB/e2zALBRWWlpSJndkyPOI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR04MB5543.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(376002)(136003)(346002)(396003)(366004)(230273577357003)(230173577357003)(451199024)(64100799003)(1800799009)(186009)(122000001)(38100700002)(55016003)(86362001)(33656002)(7696005)(6506007)(53546011)(9686003)(41300700001)(71200400001)(966005)(26005)(52536014)(66556008)(7416002)(5660300002)(66476007)(66446008)(110136005)(76116006)(478600001)(45080400002)(66946007)(316002)(30864003)(2906002)(54906003)(64756008)(8676002)(4326008)(8936002)(66574015)(38070700009)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?W+TYky7X2XdSXBQkza3jB//BYJCdLiKT9gWT/XkO+qJN+ygRmyn3jRm/351o?=
 =?us-ascii?Q?ScnbEl5879KflbbqeKZ9RUcmXhFlnaxZAXwLICMKJvvTP98I4Ce2vmHjuh5U?=
 =?us-ascii?Q?F+UoSI1Zp4gYGOrb7F0oOlhy6923wXMAJ/NMjxt5jm58PD6mP+TRrCbGk4r4?=
 =?us-ascii?Q?PUtTRiYAl6HNRgwtFjvXMdOoA4TsEvZQ+BWD66ejbSFU+Q9HfzfsSvMVrFPu?=
 =?us-ascii?Q?jJjQyb4h4D7X9ys0Y9moelvW66F4LeRSnbXzpzP83H7OgFUzF/7H2VEC4453?=
 =?us-ascii?Q?EXFITYLt/NUQqVvJ2IIvRxz8hKxwBSbGbGLAYp0gMeB4KlJ3QiVEmAvrP0mv?=
 =?us-ascii?Q?/VaKHwXECmlYftp2QuSFbGnCU13gZMSV+2dc2pnDOd/CHCdhIRb937aRXgz7?=
 =?us-ascii?Q?SWpJEdm5lOJC3pICROyfj5UWOrnz1H3uvOpbLHkQ6LdaWL235P9fEgCsIJVf?=
 =?us-ascii?Q?L0HKe41N1hAAmY+IOdYOfBysDAgjWwbNm0Ek/A2FpR+E7SGL+HfHQDx8XUy8?=
 =?us-ascii?Q?L63QthdfXArzyU/4bpoYt+KUWv3iz97E0zDivIaorK0zr+oPhPW2iyEqbokU?=
 =?us-ascii?Q?Zs7+o0TX6rjhJh9hrZAbBAj/1hI24RmbLSVwKqEnZBsuNtbNdQFuPsWlaJis?=
 =?us-ascii?Q?B4lgfq8QH58uKtq812N3V2BiM1T+1UHCLN+t6cqyvsh+fYcSJsNJVVdLbvzx?=
 =?us-ascii?Q?w+HOWQlRgVIXJ4fJAc1mk+aMNLJykA7/hh13hVAoh/ogOZY5Pbkg7wyKWnyi?=
 =?us-ascii?Q?255APVr7WCFeWRnpxtjCJMxUgx/5MQ/Z1fNVTUXUMXrLOgDK+vkd3dDm+OU7?=
 =?us-ascii?Q?oOMF+6+VaggNn4UEoQDl+un9wbY+ifIHZIA5uZYlWjYpc8A5VpHbbh4aL/wO?=
 =?us-ascii?Q?2zHICihv+6dVGDL7hj5kUM0J66FOQ8AUB70IIvTcdxguFwSHTnndwzHr3jE2?=
 =?us-ascii?Q?U/qYMqhb9xFnqukcjXiDKY0nKOFvao86zDSJuvjg4jfrpUHS+i7KrXV6UlKf?=
 =?us-ascii?Q?NPg661sJGhyd1iASSxdP/w9TlMhgthRiMqL7xSAQSNIWkJpbfJtWSNcyTJwL?=
 =?us-ascii?Q?IUrglLwnT8AZLG7jRdSjdQ4TKgI0mUyf1R9P95kPlLOD4MCsnoI6WTjMCmZs?=
 =?us-ascii?Q?x5WRqVRApCLAodNKPRQtClaT45mcVllhvUyblQcZeqS9SKG3xybMXSFIPd5I?=
 =?us-ascii?Q?Ynb5eaROADvO9a1hPMrcLfOacPvz1t4qF8qOmdh3FiBxGirxy+QPUrRbrf47?=
 =?us-ascii?Q?YbCPOlsjr9dixE7wnsaNUaTd8oXeMT3Nr+47ZdhnTMIJTRuysIox/JWxH3de?=
 =?us-ascii?Q?QEkoRQXMPW/nFz9hP63ufGywmI+vRz/mBDX79dZhgBGjrgpE2Px2ti4mESxY?=
 =?us-ascii?Q?4uvzRf6aT0iUdhPfn/8gC2lR6AFMAoz6L/k4NsrvokERXRCcXS4kUHoCSvCo?=
 =?us-ascii?Q?YwGU2x70BtiWef0kzAbzmfXsGEVrMws4x7frMQYsfyhXG+q72vnAs0Fty18u?=
 =?us-ascii?Q?M7lKhNQDweq8EOZILSJ3xUdCHosEo7NcSzhp9Ojs201kSX1LOMo6ZH1duSQR?=
 =?us-ascii?Q?PY+CLNuGxCOB6Es2AFYj868pciVYHxb7P/RryA5q?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR04MB5543.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30887b2e-8a6b-4e58-986f-08dbd9dd2e86
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2023 06:46:59.4389
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bo9xoYvmvG9IOoD1KBU1ALDnC6umrreZ3XEziUH2OUJFX0kdgZQdTMsEipk463PJKmctXVkc5aW4M63xgxJC1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB4030
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> -----Original Message-----
> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> Sent: Friday, October 27, 2023 12:28 AM
> To: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>;
> patrick@stwcx.xyz; Jean Delvare <jdelvare@suse.com>; Jonathan Corbet
> <corbet@lwn.net>
> Cc: Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>; Conor Dooley <conor+dt@kernel.org>;
> linux-i2c@vger.kernel.org; linux-hwmon@vger.kernel.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> linux-doc@vger.kernel.org
> Subject: Re: [PATCH v2 2/2] hwmon: pmbus: Add ltc4286 driver
>=20
>   Security Reminder: Please be aware that this email is sent by an extern=
al
> sender.
>=20
> On 10/26/23 01:15, Delphine CC Chiu wrote:
> > Add a driver to support ltc4286 chip
> >
> > Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> >
> > Changelog:
> >    v2 - Revise Linear Technologies LTC4286 to
> >         Analog Devices LTC4286 in Kconfig
> >       - Add more description for this driver in Kconfig
> >       - Add some comments for MBR setting in ltc4286.c
> >       - Add ltc4286.rst
> > ---
> >   Documentation/hwmon/ltc4286.rst |  79 ++++++++++++++++
> >   drivers/hwmon/pmbus/Kconfig     |   9 ++
> >   drivers/hwmon/pmbus/Makefile    |   1 +
> >   drivers/hwmon/pmbus/ltc4286.c   | 160
> ++++++++++++++++++++++++++++++++
> >   4 files changed, 249 insertions(+)
> >   create mode 100644 Documentation/hwmon/ltc4286.rst
> >   create mode 100644 drivers/hwmon/pmbus/ltc4286.c
> >
> > diff --git a/Documentation/hwmon/ltc4286.rst
> > b/Documentation/hwmon/ltc4286.rst new file mode 100644 index
> > 000000000000..9cae50b7478d
> > --- /dev/null
> > +++ b/Documentation/hwmon/ltc4286.rst
> > @@ -0,0 +1,79 @@
> > +.. SPDX-License-Identifier: GPL-2.0-or-later
> > +
> > +Kernel driver ltc4286
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Supported chips:
> > +
> > +  * Analog Devices LTC4286
> > +
> > +    Prefix: 'ltc4286'
> > +
> > +    Addresses scanned: -
> > +
> > +    Datasheet:
> > + https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fw=
w
> > +
> w.analog.com%2Fmedia%2Fen%2Ftechnical-documentation%2Fdata-sheets%2
> F
> > +
> ltc4286.pdf&data=3D05%7C01%7CWayne_SC_Liu%40wiwynn.com%7Cb749e252b
> fb84
> > +
> 24531ac08dbd640774e%7Cda6e0628fc834caf9dd273061cbab167%7C0%7C0%
> 7C638
> > +
> 339344747629221%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL
> CJQIjoi
> > +
> V2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D7s
> HwFye
> > + so39ED13H3KaxosVOMJT1Kswhwj38arystWQ%3D&reserved=3D0
> > +
> > +  * Analog Devices LTC4287
> > +
> > +    Prefix: 'ltc4287'
> > +
> > +    Addresses scanned: -
> > +
> > +    Datasheet:
> > + https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fw=
w
> > +
> w.analog.com%2Fmedia%2Fen%2Ftechnical-documentation%2Fdata-sheets%2
> F
> > +
> ltc4287.pdf&data=3D05%7C01%7CWayne_SC_Liu%40wiwynn.com%7Cb749e252b
> fb84
> > +
> 24531ac08dbd640774e%7Cda6e0628fc834caf9dd273061cbab167%7C0%7C0%
> 7C638
> > +
> 339344747629221%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL
> CJQIjoi
> > +
> V2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D31
> 402MZ
> > + 9ONvkV8BsRRPxmTZNMU1yj1u%2F3NFVEpThFPI%3D&reserved=3D0
> > +
> > +Author: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> > +
> > +
> > +Description
> > +-----------
> > +
> > +This driver supports hardware monitoring for Analog Devices LTC4286
> > +and LTC4287 Hot-Swap Controller and Digital Power Monitors.
> > +
> > +LTC4286 and LTC4287 are hot-swap controllers that allow a circuit
> > +board to be removed from or inserted into a live backplane. They also
> > +feature current and voltage readback via an integrated 12 bit
> > +analog-to-digital converter (ADC), accessed using a PMBus interface.
> > +
> > +The driver is a client driver to the core PMBus driver. Please see
> > +Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
> > +
> > +
> > +Usage Notes
> > +-----------
> > +
> > +This driver does not auto-detect devices. You will have to
> > +instantiate the devices explicitly. Please see
> > +Documentation/i2c/instantiating-devices.rst for details.
> > +
> > +The shunt value in micro-ohms can be set via device tree at
> > +compile-time. Please refer to the
> > +Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml for bindings
> if the device tree is used.
> > +
> > +
> > +Platform data support
> > +---------------------
> > +
> > +The driver supports standard PMBus driver platform data. Please see
> > +Documentation/hwmon/pmbus.rst for details.
> > +
> > +
> > +Sysfs entries
> > +-------------
> > +
> > +The following attributes are supported. Limits are read-write,
> > +history reset attributes are write-only, all other attributes are read=
-only.
> > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> > +inX_label               "vin1" or "vout1" depending on chip variant an=
d
> > +                        configuration.
>=20
> Is that a cut-and-paste ? I don't see it handled in the driver, and I don=
't
> immediately see it in the datasheet. From the datasheet, it seems to me t=
hat
> both are always present.
We will revise to the correct description

>=20
> > +inX_input               Measured voltage.
> > +
> > +curr1_label             "iout1"
> > +curr1_input             Measured current.
> > +
> > +power1_label            "pin1"
> > +power1_input            Input power.
> > +
> > +temp1_input             Chip temperature.
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> > diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> > index b4e93bd5835e..f2b53e8abc3c 100644
> > --- a/drivers/hwmon/pmbus/Kconfig
> > +++ b/drivers/hwmon/pmbus/Kconfig
> > @@ -226,6 +226,15 @@ config SENSORS_LTC3815
> >
> >         This driver can also be built as a module. If so, the module wi=
ll
> >         be called ltc3815.
> > +config SENSORS_LTC4286
> > +     bool "Analog Devices LTC4286"
> > +     help
> > +       LTC4286 is an integrated solution for hot swap applications tha=
t
> > +       allows a board to be safely inserted and removed from a live
> > +       backplane.
> > +       This chip could be used to monitor voltage, current, ...etc.
> > +       If you say yes here you get hardware monitoring support for Ana=
log
> > +       Devices LTC4286.
> >
> >   config SENSORS_MAX15301
> >       tristate "Maxim MAX15301"
> > diff --git a/drivers/hwmon/pmbus/Makefile
> > b/drivers/hwmon/pmbus/Makefile index 84ee960a6c2d..94e28f6d6a61
> 100644
> > --- a/drivers/hwmon/pmbus/Makefile
> > +++ b/drivers/hwmon/pmbus/Makefile
> > @@ -24,6 +24,7 @@ obj-$(CONFIG_SENSORS_LM25066)       +=3D
> lm25066.o
> >   obj-$(CONFIG_SENSORS_LT7182S)       +=3D lt7182s.o
> >   obj-$(CONFIG_SENSORS_LTC2978)       +=3D ltc2978.o
> >   obj-$(CONFIG_SENSORS_LTC3815)       +=3D ltc3815.o
> > +obj-$(CONFIG_SENSORS_LTC4286)        +=3D ltc4286.o
> >   obj-$(CONFIG_SENSORS_MAX15301)      +=3D max15301.o
> >   obj-$(CONFIG_SENSORS_MAX16064)      +=3D max16064.o
> >   obj-$(CONFIG_SENSORS_MAX16601)      +=3D max16601.o
> > diff --git a/drivers/hwmon/pmbus/ltc4286.c
> > b/drivers/hwmon/pmbus/ltc4286.c new file mode 100644 index
> > 000000000000..e1d72fe9587c
> > --- /dev/null
> > +++ b/drivers/hwmon/pmbus/ltc4286.c
> > @@ -0,0 +1,160 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +
> > +#include <linux/err.h>
> > +#include <linux/i2c.h>
> > +#include <linux/init.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/pmbus.h>
> > +#include "pmbus.h"
> > +
> > +/* LTC4286 register */
> > +#define LTC4286_MFR_CONFIG1  0xF2
> > +
> > +/* LTC4286 configuration */
> > +#define VRANGE_SELECT_BIT    BIT(1)
> > +
> > +#define LTC4286_MFR_ID_SIZE  3
> > +
> > +enum chips { ltc4286, ltc4287 };
> > +
> > +/*
> > + * Initialize the MBR as default settings which is referred to
> > +LTC4286 datasheet
> > + * (March 22, 2022 version) table 3 page 16  */ static struct
> > +pmbus_driver_info ltc4286_info =3D {
> > +     .pages =3D 1,
> > +     .format[PSC_VOLTAGE_IN] =3D direct,
> > +     .format[PSC_VOLTAGE_OUT] =3D direct,
> > +     .format[PSC_CURRENT_OUT] =3D direct,
> > +     .format[PSC_POWER] =3D direct,
> > +     .format[PSC_TEMPERATURE] =3D direct,
> > +     .m[PSC_VOLTAGE_IN] =3D 32,
> > +     .b[PSC_VOLTAGE_IN] =3D 0,
> > +     .R[PSC_VOLTAGE_IN] =3D 1,
> > +     .m[PSC_VOLTAGE_OUT] =3D 32,
> > +     .b[PSC_VOLTAGE_OUT] =3D 0,
> > +     .R[PSC_VOLTAGE_OUT] =3D 1,
> > +     .m[PSC_CURRENT_OUT] =3D 1024,
> > +     .b[PSC_CURRENT_OUT] =3D 0,
> > +     /*
> > +      * The rsense value used in MBR formula in LTC4286 datasheet
> should be ohm unit.
> > +      * However, the rsense value that user input is mirco ohm.
> > +      * Thus, the MBR setting which involves rsense should be shifted =
by 6
> digits.
> > +      */
> > +     .R[PSC_CURRENT_OUT] =3D 3 - 6,
> > +     .m[PSC_POWER] =3D 1,
> > +     .b[PSC_POWER] =3D 0,
> > +     /*
> > +      * The rsense value used in MBR formula in LTC4286 datasheet
> should be ohm unit.
> > +      * However, the rsense value that user input is mirco ohm.
> > +      * Thus, the MBR setting which involves rsense should be shifted =
by 6
> digits.
> > +      */
> > +     .R[PSC_POWER] =3D 4 - 6,
> > +     .m[PSC_TEMPERATURE] =3D 1,
> > +     .b[PSC_TEMPERATURE] =3D 273,
> > +     .R[PSC_TEMPERATURE] =3D 0,
> > +     .func[0] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT |
> PMBUS_HAVE_IOUT |
> > +                PMBUS_HAVE_PIN | PMBUS_HAVE_TEMP |
> PMBUS_HAVE_STATUS_VOUT |
> > +                PMBUS_HAVE_STATUS_IOUT |
> PMBUS_HAVE_STATUS_TEMP, };
> > +
>=20
> The datasheet for LTC4286  (in the PMBus description talks about LSB 21.3
> mV/RSENSE
> for IOUT_OC_WARN_LIMIT and 2.8/RSENSE for PIN_OP_WARN_LIMIT. This
> contradicts
> data elsewhere in the datasheet which uses above coefficients for both
> LTC4286
> and LTC4287. I don't know if the datasheet is wrong, but this needs to be
> clarified.
> If the datasheet is wrong, that needs to be mentioned above. If the limit
> registers
> use different coefficients, local code will be needed to adjust values wh=
en
> reading /
> writing the registers to have it match coefficients.
We have sent an e-mail about this question.

>=20
> > +static const struct i2c_device_id ltc4286_id[] =3D { { "ltc4286", ltc4=
286 },
> > +                                                { "ltc4287",
> ltc4287 },
> > +                                                {} };
> > +MODULE_DEVICE_TABLE(i2c, ltc4286_id);
> > +
> > +static int ltc4286_probe(struct i2c_client *client)
> > +{
> > +     int ret;
> > +     const struct i2c_device_id *mid;
> > +     u8 block_buffer[I2C_SMBUS_BLOCK_MAX + 1];
> > +     struct pmbus_driver_info *info;
> > +     u32 rsense;
> > +
> > +     ret =3D i2c_smbus_read_block_data(client, PMBUS_MFR_ID,
> block_buffer);
> > +     if (ret < 0) {
> > +             dev_err(&client->dev, "failed to read manufacturer id\n")=
;
>=20
> Why not use dev_err_probe() here ?
We will use dev_err_probe() instead of dev_err()

>=20
> > +             return ret;
> > +     }
> > +
> > +     /*
> > +      * Refer to ltc4286 datasheet page 20
> > +      * the manufacturer id is LTC
> > +      */
> > +     if (ret !=3D LTC4286_MFR_ID_SIZE ||
> > +         strncmp(block_buffer, "LTC", LTC4286_MFR_ID_SIZE)) {
> > +             return dev_err_probe(&client->dev, ret,
> > +                                  "failed to read manufacturer
> id\n");
>=20
> This is misleading. It didn't _fail_ to read the manufacturer ID.
We will revise to "Manufacturer id mismatch"

>=20
> > +     }
> > +
> > +     ret =3D i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL,
> block_buffer);
> > +     if (ret < 0) {
> > +             dev_err(&client->dev, "failed to read manufacturer
> model\n");
>=20
> Why not use dev_err_probe() here ?
We will use dev_err_probe() instead of dev_err()

>=20
> > +             return ret;
> > +     }
> > +
> > +     for (mid =3D ltc4286_id; mid->name[0]; mid++) {
> > +             if (!strncasecmp(mid->name, block_buffer,
> strlen(mid->name)))
> > +                     break;
> > +     }
>=20
> This is pointless code. If the ID is not found, mid will point after
> the end of the array, and then what ?
>=20
> The purpose of such code is to validate if the chip is actually the one
> referenced in the match function and at least warn if that is not the cas=
e.
> It should never accept a chip which is _known_ to not be supported.
We will revise as below
for (mid =3D ltc4286_id; mid->name[0]; mid++) {
	if (!strncasecmp(mid->name, block_buffer, strlen(mid->name)))
		break;
}
if (!mid->name[0])
	return dev_err_probe(&client->dev, -ENODEV,
                      "Unsupported device\n");

>=20
> > +
> > +     ret =3D of_property_read_u32(client->dev.of_node,
> > +                                "shunt-resistor-micro-ohms",
> &rsense);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     if (rsense =3D=3D 0)
> > +             return -EINVAL;
> > +
> > +     info =3D &ltc4286_info;
> > +
> > +     /* Default of VRANGE_SELECT =3D 1, 102.4V */
> > +     if (device_property_read_bool(&client->dev,
> "adi,vrange-select-25p6")) {
>=20
> What if the adi,vrange-select-25p6 property is not provided, but the chip
> is programmed for this range ?
The binding document tells programmers how to fill the dts.
Thus, programmers must fill this property if their system is 25.6 volts vol=
tage range.

>=20
> > +             /* Setup MFR1 CONFIG register bit 1 VRANGE_SELECT */
> > +             ret =3D i2c_smbus_read_word_data(client,
> LTC4286_MFR_CONFIG1);
> > +             if (ret < 0) {
> > +                     dev_err(&client->dev,
> > +                             "failed to read manufacturer
> configuration one\n"); > +                 return ret;
> > +             }
> > +
> > +             ret &=3D ~VRANGE_SELECT_BIT; /* VRANGE_SELECT =3D 0,
> 25.6V */
> > +             ret =3D i2c_smbus_write_word_data(client,
> LTC4286_MFR_CONFIG1,
> > +                                             ret);
>=20
> This should only be written if it actually changed.
We will revise as below
if ((ret & VRANGE_SELECT_BIT) !=3D VRANGE_25P6) {
	ret &=3D ~VRANGE_SELECT_BIT; /* VRANGE_SELECT =3D 0, 25.6V */
	ret =3D i2c_smbus_write_word_data(
            client, LTC4286_MFR_CONFIG1, ret);
    if (ret < 0)
		return dev_err_probe(&client->dev, ret,
                          "Failed to set vrange\n");
}
Moreover, we will check the behavior about this register with vendor.

>=20
> > +             if (ret < 0) {
> > +                     dev_err(&client->dev, "failed to set vrange\n");
> > +                     return ret;
> > +             }
> > +
> > +             info->m[PSC_VOLTAGE_IN] =3D 128;
> > +             info->m[PSC_VOLTAGE_OUT] =3D 128;
> > +             info->m[PSC_POWER] =3D 4 * rsense;
>=20
> You can not overwrite ltc4286_info because there might be several chips
> in the system with different sense resistor values and range
> configurations.
We will add below to replace the line info =3D &ltc4286_info;
info =3D devm_kzalloc(&client->dev, sizeof(*info), GFP_KERNEL);
if (!info)
	return -ENOMEM;
memcpy(info, &ltc4286_info, sizeof(*info));

>=20
> Also, the above (and the calculation in the code below) will overflow
> with too-large sense register values.
We will add below to check if the 4*rsense overflow or not.
if (info->m[PSC_POWER] > INT_MAX)
	return dev_err_probe(&client->dev, -ERANGE,
                      "Power coefficient overflow\n");

>=20
> > +     } else
> > +             info->m[PSC_POWER] =3D rsense;
>=20
> Please run checkpatch --strict on your patches.
We will run checkpatch --strict to check our patch.

>=20
> > +
> > +     info->m[PSC_CURRENT_OUT] =3D 1024 * rsense;
>=20
> Any rsense value larger than MAXINT / 1024 will overflow.
if (info->m[PSC_CURRENT_OUT] > INT_MAX)
	return dev_err_probe(&client->dev, -ERANGE,
                      "Current coefficient overflow\n");

>=20
> > +
> > +     return pmbus_do_probe(client, info);
> > +}
> > +
> > +static const struct of_device_id ltc4286_of_match[] =3D {
> > +     { .compatible =3D "lltc,ltc4286" },
> > +     { .compatible =3D "lltc,ltc4287" },
> > +     {}
> > +};
> > +
> > +static struct i2c_driver ltc4286_driver =3D {
> > +     .driver =3D {
> > +             .name =3D "ltc4286",
> > +             .of_match_table =3D ltc4286_of_match,
> > +     },
> > +     .probe =3D ltc4286_probe,
> > +     .id_table =3D ltc4286_id,
> > +};
> > +
> > +module_i2c_driver(ltc4286_driver);
> > +
> > +MODULE_AUTHOR("Delphine CC Chiu
> <Delphine_CC_Chiu@wiwynn.com>");
> > +MODULE_DESCRIPTION("PMBUS driver for LTC4286 and compatibles");
> > +MODULE_LICENSE("GPL");

