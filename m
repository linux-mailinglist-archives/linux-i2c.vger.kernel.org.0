Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B7FB7DC639
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Oct 2023 07:08:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233004AbjJaFzQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Oct 2023 01:55:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230458AbjJaFzO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Oct 2023 01:55:14 -0400
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2079.outbound.protection.outlook.com [40.107.215.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E99D5E4;
        Mon, 30 Oct 2023 22:55:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NzrKwcedBHNw3n8lWfoSTQozOX1qQNJCB1rrvRWNo/tHMLd6eThcK69+hX1WAAvlrPXhBIZStl0YE7dO8bxYlct25anq3rZboiLcUn9lCc1cOaHSWtvMIrOq71CaGG9UJxXDdxbA3olXbvGWiRM6tKRc6Z3mOHxH5MQ77rtA1BC94JYVbs+4cbb42Dq6tUWAPaAgP2+fzrpn9Y1PoCdmoZPmu7stWLD1t/PnIKhqwy0hrGECkFnHs/uPTC3bCNf9P86YXFTy3N2DeI8Ualk7SY3oijXydduQVHsXk3bkWRMpjY6n7VY5XRbAtOuPToDqT1oaeSDZFnh5f6ZdR3IexQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cdS/D3Mrb2CPVq6zigSk4ftJNswxvogD02RwYaImJ3Y=;
 b=Su8cfvla7ZA997vHTpkDF+TkRzWIE/4nNCUTo4djVjR39URAqCcnOlpdQ/6/kD7GX2YXkFx+fmNLbKUFnCdzMGSQZH6Pd6bXRcvGvjk8fd+PRYwGq6iDArX7IglQZQLEsx70OCvScAAdCc3CsS0CuGO9IlN4ZSYiBxCnpvNxqrDGc8IF2VySMVX/o5lb29035PhyhzEG6jBMjhMSQBlo0BTiHFrjDHwLc8euDh1xSkteMxxDqS6zl59u4dadaIYw8/9fshOKNjidA6GvKJ56qhL9ncBNvBXzGhJUPJnSYlYXLREJ3MTuwDhs0S2U0d7hcRXZkCtG65RMReANr9+k9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiwynn.com; dmarc=pass action=none header.from=wiwynn.com;
 dkim=pass header.d=wiwynn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdS/D3Mrb2CPVq6zigSk4ftJNswxvogD02RwYaImJ3Y=;
 b=JNArltX1cOZJDsHjlIjAHamNhxaaGc9F8E69fJHdVqM+7oQtKWrZOBN9KDDaUbdE34tWxZ41MMe3ewKcJVT5l3TgQz7/e30fB0l3EpQopun1d7gw2r2rUe/DNOsNHMA451hcyfSDFdfmMmuiEX/ZhLkC7Vn6WeChgRCwIae3bAePJO6TA3lwKbqa/sZ7nwMC64VrU9SczMMm47Ensodbl9wQhdflsKGz8gNL6b7AzlwBpbbcRuhumE+Ekb5H4Qfpe1rE1nHQUle7By6g/c0UzdNqNICHruAwU00YWOtBf4JCjlVy0bXix0OIznJQmDQrcueWi5UKliAmc6rsqgh5HQ==
Received: from SG2PR04MB5543.apcprd04.prod.outlook.com (2603:1096:4:172::14)
 by SEYPR04MB7691.apcprd04.prod.outlook.com (2603:1096:101:1d4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.26; Tue, 31 Oct
 2023 05:54:48 +0000
Received: from SG2PR04MB5543.apcprd04.prod.outlook.com
 ([fe80::4c7a:8fd8:1527:9287]) by SG2PR04MB5543.apcprd04.prod.outlook.com
 ([fe80::4c7a:8fd8:1527:9287%4]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 05:54:48 +0000
From:   Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
To:     Conor Dooley <conor@kernel.org>,
        Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
CC:     "patrick@stwcx.xyz" <patrick@stwcx.xyz>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: RE: [PATCH v2 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver
 bindings
Thread-Topic: [PATCH v2 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver
 bindings
Thread-Index: AQHaB+SV8Z0lWuQfqk2pb+fPvv8kdLBcIN+AgAdM2rA=
Date:   Tue, 31 Oct 2023 05:54:48 +0000
Message-ID: <SG2PR04MB5543E22311867ABCD84C1129A1A0A@SG2PR04MB5543.apcprd04.prod.outlook.com>
References: <20231026081514.3610343-1-Delphine_CC_Chiu@Wiwynn.com>
 <20231026081514.3610343-2-Delphine_CC_Chiu@Wiwynn.com>
 <20231026-dicing-crispy-a10af575d3e5@spud>
In-Reply-To: <20231026-dicing-crispy-a10af575d3e5@spud>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiwynn.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR04MB5543:EE_|SEYPR04MB7691:EE_
x-ms-office365-filtering-correlation-id: 592a0b79-530a-4cbc-ebb1-08dbd9d5e47d
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IzcpLN1y4mWuyDYeZ8IL9H6VuyvQS/jU8602imXu+FuIWFS7hCsjsJ42dfStuc1pipkjLFQ/f7rbkxGbHlPf1wi5Vz3NQrtNbAU5vgbHUlMfwxB5nfZaliz7NRWsKdXLXaa5zC03HIn21U+R/nr89tvQg5In340n74fHp4XOZpKLThvjeAsxBL9QhsOGUUzvTwrW+EF/+pTpgqgErUXnkHfVn2PjEhe997EvnENgcQC9xLwoit0pb6PZvg1MI360Gg0ErH6B/le7fLbo0Gy7g7emQla3B2Pi1tN7kCRYQzuj3yzNeWpUOHvpxOAb9d42atvaEHEqKYzpzsIUoJqZXVXUuNiSVaMfAwSDjMiOMSCC7zGsz+mT+0I8q2sPyEmb5euiMgOLkpwp7ZNkwZ6yRb8TzycQTRVXNcejZZ1PI0URZ6JvPf7WoYsegT1LKnIyJNgFIsQhRw1r70u5CaSLCZuluEOBBCBvxQrHbokOKwNLc3n6tBT9ma8+fOUJeP1D1YAXDTBfLlCtVex9ZZr93ONKuHyBBF49Hx46U/51aB6M2CB/Unjw19vBZpRKa4NCG/cCAb97pXsVs4O0bV/b4+vv2Nwgi16xbCpO/34chj0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR04MB5543.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(366004)(39860400002)(346002)(64100799003)(1800799009)(186009)(451199024)(316002)(55016003)(2906002)(7416002)(41300700001)(38070700009)(52536014)(8936002)(4326008)(86362001)(8676002)(33656002)(71200400001)(38100700002)(76116006)(66476007)(66446008)(122000001)(54906003)(66556008)(64756008)(66946007)(5660300002)(83380400001)(110136005)(9686003)(26005)(478600001)(53546011)(7696005)(966005)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zb8XyZTYbKNwTNFvEPLILmckTx4j7DBUMRePDFF1gYBJAVu3KcI6ftyKwd/g?=
 =?us-ascii?Q?qlHnNCpbau1qPjOG6sjfia56jCnz+/HlnxzVBg0zgEyxQ6RkMQGi8a7mH5oM?=
 =?us-ascii?Q?wJVwp7PdB0PvY1wDQlUSlGz9DUXgvBhUDW548u9oauQLKoJy9fRP/KEjBXOO?=
 =?us-ascii?Q?uldt3cFXm+J/UjWXncgPYq+TiNfWwM6N0ALRnpyi0RZl7pyrCdxyMZAvx0Rd?=
 =?us-ascii?Q?CK1DyKVsZhM09b3xkdsqRU7SLI7RfEE+ITAAj+KYYSDU9MLlpdZZxwPjBCC6?=
 =?us-ascii?Q?M7HnV/ioV7gpwIMEC3Z4FwkezvpQorYseqBFskiRdAu3+thLU0dQkLkP9e0v?=
 =?us-ascii?Q?ap3CYu+jyyg29zcOX8rUILvl6HFIJx8jy5PV9TntHilelicXgy1K5bK+tdaJ?=
 =?us-ascii?Q?Doa06o4krS1YoBwCIndxEs0kOHGju+NbzFPBJ/JuOX0lE9MYn9CsqLY9V9Cr?=
 =?us-ascii?Q?UJMUIQTzlBSKHBF3ORRlUU364jVbsQgHqM1cJhESdDNeRO55ZJm40ten8Q/q?=
 =?us-ascii?Q?Nkip0jHTafdoxsMBNssDym2SsIrk5XlWM0OvA12xsaTB3La8ws8S3o5CvcQG?=
 =?us-ascii?Q?VpTqQXFOfozg3WD+8oUHVbD2Oubiacr8r1FhjJD1j9DwlWvS13fCOdn0PKvu?=
 =?us-ascii?Q?7QPKe/v8LbHQCzqe86xxQRREzXdCiATkjOaRKEyzBnTZAfR4HIUH3J/4yPXv?=
 =?us-ascii?Q?kNLwm0khyCe9fnpm6mJx+LqJnGt+qf4gH/JIqWxjuY5L9aGEjkGayn62lxI4?=
 =?us-ascii?Q?DP27atPvPEcjMh4//tjAj2i4TMJUWqjNu68CjNtRMHYp/Ayq8tnjiuCIyfhh?=
 =?us-ascii?Q?XeEI4TgwG90R2RhZZc6NwMz+uVH7cP29vQTcGRMH5FC6xv+oMSKXy4alEkkW?=
 =?us-ascii?Q?MmGixuYI3pu6CbfEbK8rXk+NBbd0rPDtl46cEtBWVlGkz+ZVz8xXBT7jWfAF?=
 =?us-ascii?Q?gB8EN1Y7x54ixGH/cpt7IyCTe+yI0X53I7oy6O/lLNV4XUDeNskpqNKA54KA?=
 =?us-ascii?Q?yUiBwIlQw/vNXQ2uORUjUVocunUtXPIOvNr9yaMsRBdVNPm0voGnR8XcXM7f?=
 =?us-ascii?Q?aM1/iIX9tyfVfMIPxfQ7stzJSlH+8eWbDSGKUH+rp6cC9wOK9drtWgxF5rRn?=
 =?us-ascii?Q?l/UcC1/rrU16oiKAQeWvmwuUAj1GSF+1sCXdMR/ZJrThsg6hdb7DI1izAB4/?=
 =?us-ascii?Q?eK+RNNR/ktIhqeWVxU3qCDWb/VmT2PFuM4IZqNdmrxDnMVVSn/AYMDBT6Ef4?=
 =?us-ascii?Q?gTmDdAHY/6PHIgpaPZCJBYS8meypYJ558NjMRMz4fPNP+d/mkiKhDngcjWa9?=
 =?us-ascii?Q?dv34L4XU9xTPdOSfFwmSYeoXy7gCtno69ZZO/sgFWuvtBwQbGtSAmcZCXKOE?=
 =?us-ascii?Q?UVNUSPSSNplVOFlGF5BS7r2NX5BtXNdaDDcB8Jrot1ETI5FijeiyIACQiqHi?=
 =?us-ascii?Q?JbquooYEnTqEPxmarXfWOsqMgIhbszNn3zla2T4ApJyQnXR9alS8WT4go3t1?=
 =?us-ascii?Q?UjB/w2Ogn79KICPjcb+2662Llo5qNLfqSoqSMNYYETTw2nEwfW/7tAAtA96d?=
 =?us-ascii?Q?NYjlkU29dxl99S9u/dLV5GFZY8CyoUTAs9yC2yJr?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR04MB5543.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 592a0b79-530a-4cbc-ebb1-08dbd9d5e47d
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2023 05:54:48.7414
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HbtnCemS5lVpj4bhDGQypZATDtwzq0cRvH4zQidelX49jMrw9kxCxzqaD2SVscAmpeAhjG9X7rIyTSA2ZosWLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB7691
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
> From: Conor Dooley <conor@kernel.org>
> Sent: Thursday, October 26, 2023 10:26 PM
> To: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
> Cc: patrick@stwcx.xyz; Jean Delvare <jdelvare@suse.com>; Guenter Roeck
> <linux@roeck-us.net>; Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlows=
ki
> <krzysztof.kozlowski+dt@linaro.org>; Conor Dooley <conor+dt@kernel.org>;
> Jonathan Corbet <corbet@lwn.net>; linux-i2c@vger.kernel.org;
> linux-hwmon@vger.kernel.org; devicetree@vger.kernel.org;
> linux-kernel@vger.kernel.org; linux-doc@vger.kernel.org
> Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver
> bindings
>=20
> Hey,
>=20
> On Thu, Oct 26, 2023 at 04:15:11PM +0800, Delphine CC Chiu wrote:
> > Add a device tree bindings for ltc4286 driver.
>=20
> Bindings are for devices, not for drivers.
>=20
> >
> > Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> >
> > Changelog:
> >   v2 - Revise vrange_select_25p6 to adi,vrange-select-25p6
> >      - Add type for adi,vrange-select-25p6
> >      - Revise rsense-micro-ohms to shunt-resistor-micro-ohms
> > ---
> >  .../bindings/hwmon/lltc,ltc4286.yaml          | 50
> +++++++++++++++++++
> >  MAINTAINERS                                   | 10 ++++
> >  2 files changed, 60 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> > b/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> > new file mode 100644
> > index 000000000000..17022de657bb
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> > @@ -0,0 +1,50 @@
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
>=20
> I don't recall seeing an answer to Guenter about this ltc4287 device:
> https://lore.kernel.org/all/22f6364c-611c-ffb6-451c-9ddc20418d0a@roeck-us=
.
> net/
>=20
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  adi,vrange-select-25p6:
> > +    description:
> > +      This property is a bool parameter to represent the
> > +      voltage range is 25.6 or not for this chip.
>=20
> 25.6 what? Volts? microvolts?
25.6 volts

> What about Guenter's suggestion to name this so that it better matches th=
e
> other, similar properties?
>=20
> Cheers,
> Conor.
