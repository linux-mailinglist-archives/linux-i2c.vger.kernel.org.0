Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6FF67E33B0
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Nov 2023 04:12:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232527AbjKGDMr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Nov 2023 22:12:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230208AbjKGDMq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Nov 2023 22:12:46 -0500
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2083.outbound.protection.outlook.com [40.107.215.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C39C184;
        Mon,  6 Nov 2023 19:12:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oRO4mSbsDoDfuPycyRWSx69GU4jjufm6aF7ATYdlHorGTEuUqg6fAfjoI/haL0yeFeUIYX2TWhC5Ae2IrdjtGz/XXAreS2ySkRQViFWg75cvu3oIBi81s2H/8gfLpfyPGT9yL2+AGbh5PuBUNcMJxHoF5rIXW3IZ/g71Aoc97/8YkEgjx4FZIUc3UnRPF+bkDwaonamh8XOkO7IS3XUYnIYgCGbsxD21A1CT3F2KGjcQQVJJOJvd5guenOCa7fzlTGf5NjIaZju6sNh1VT/vBSV7DKUGrf+ZFv+L/5Ee5qXEwUNR7oNgsKG9nlvfsC2FERwXl54RYDYnU79PBKzlLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6GpqFcLqxM9SvOqX3xz5Nl91OSvhzw/cAf1lj0xqlDw=;
 b=IM+UzU2nsCcWU/y1f3JojGQ6g+gYp1qsgmM/roUxC0g8NSOWK234bpUvUdlq3+sBtPZNycuCZcu5bbh90+nXm3r7EzORyA/O7KgHrW0eZ4ZqErBmzs/FkfPX2VSk8/hruFeE/+Rvq4lFaZsRyKH1Tbt9JTMyaMOEOpHMeEXX96a8UJGaLV1vmT5mRgpYW3YS72VcR9xTqcex2EmFYHeHT7G2CgW5LlOnfR6gqve/j/aVMmfjaal1NLD3Rme4P4mP1cEq0JkfaFhczBcpvoTyyEhQs+3pqkRAGVaEITdaB8l3vJpXecbhAat9v8mfLK96h3eBAtFytjT3WDs+8ceFtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiwynn.com; dmarc=pass action=none header.from=wiwynn.com;
 dkim=pass header.d=wiwynn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6GpqFcLqxM9SvOqX3xz5Nl91OSvhzw/cAf1lj0xqlDw=;
 b=wMgR/LdqT+4Vi58Ycl4vOKYdrGGTlQK9qe56dzA5USEjs3GDhKhcFtUWripeSdi5tMUHIVwcVH8aaj28/RGJ4PDeZi4DNciKm3G62IcALK9zHtp9e7wjglmROLqnFFYYL1bnahATtFVtwWJ6FNvkie1eoSgi+qoCrDMptNCnWlcX4cvtPsKRT9/mS4Lz7BIVJQGLU7eiGs2SDFyBsc5U7U4Zc2xUROGwGUG8XH3SNW4wawCHkydsyg+wz7iNJuDxaxyNEie3pYKPzr2793Ut7QGYkcxcNRogNpr5IhYbl1mubmAp7y2LSAVGOMk+6fIDoR7Am/t0T+ZM3d+a4EZlsw==
Received: from SG2PR04MB5543.apcprd04.prod.outlook.com (2603:1096:4:172::14)
 by SEYPR04MB7329.apcprd04.prod.outlook.com (2603:1096:101:1ac::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Tue, 7 Nov
 2023 03:12:36 +0000
Received: from SG2PR04MB5543.apcprd04.prod.outlook.com
 ([fe80::4c7a:8fd8:1527:9287]) by SG2PR04MB5543.apcprd04.prod.outlook.com
 ([fe80::4c7a:8fd8:1527:9287%4]) with mapi id 15.20.6954.029; Tue, 7 Nov 2023
 03:12:36 +0000
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
Subject: RE: [PATCH v3 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver
 bindings
Thread-Topic: [PATCH v3 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver
 bindings
Thread-Index: AQHaC8rjYjRkc0xwvkaZim0be6td1LBkIX2AgAoXbvA=
Date:   Tue, 7 Nov 2023 03:12:36 +0000
Message-ID: <SG2PR04MB55439AB1A9035136679E3D73A1A9A@SG2PR04MB5543.apcprd04.prod.outlook.com>
References: <20231031072124.201181-1-Delphine_CC_Chiu@Wiwynn.com>
 <20231031072124.201181-2-Delphine_CC_Chiu@Wiwynn.com>
 <20231031-sneeze-zoom-8fdb3ccebd25@spud>
In-Reply-To: <20231031-sneeze-zoom-8fdb3ccebd25@spud>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiwynn.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR04MB5543:EE_|SEYPR04MB7329:EE_
x-ms-office365-filtering-correlation-id: aa5818eb-7c2c-49c2-bee4-08dbdf3f6488
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kCEkOdXsqALn7K7y07MluEQgAGnIhbBN1EpXZeCps4JjO//e/e45B7sesR0FrRjiHPbORGlISOWw6Gg/WhVCTW1YZBlZHMUMnzr3/U8W5v/aY+CwJdhMsebGqDazGKbj6uWqiJEkWL1ZXDdvC+xdzykxNx5fOF/eQJDwlOKpqEdSYj3I0tgWCURk+wZb/jT4pG+dma2DOjk+BJwtQgeqRKV2pgXoo5zRfO+QkqsS/T55YWVE2VHmrV8lQ8h6UULO827zvGlbWewJKtK8zpCuOdAyRrr6pUeVN0GAjapaJ5fCXXXVzcsTN7dVU7iKSzt2mrRcLYIPy3HA51vRt+OYkgshWJB0xPHdm8FgVtdtvHuz8hXLQhEdhOVruP9doVzUAZ4wfCwOJ7ZokDEb0VAwQGQccaZUYtZYIaJUBKmba9i1d2Pxj0Ls5NDuKRQnEmkMQjmlC4+Rn3C2aPWEucNI3AWsT2XyPXYzyNK2RuGNO0SfBiDPzNF0J33ecVltE3nkq2B9gaHM6RWrpzalQcCgmCaBy3cJo63q2RzJMETtrDjObNRoykqrklvg5znMw8Tr6PdSTJVFjVl6lEa+uMvNcjNl/HFC+wCu8PL6D7k5GLjs94rTrsC689f5OFqzWVDcq/BxpkEdmoZC/wBEw6zX9w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR04MB5543.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(39860400002)(346002)(366004)(136003)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(83380400001)(53546011)(9686003)(7696005)(71200400001)(26005)(6506007)(66476007)(478600001)(66556008)(66946007)(316002)(4326008)(76116006)(110136005)(55016003)(8936002)(8676002)(52536014)(64756008)(54906003)(38100700002)(66446008)(122000001)(2906002)(41300700001)(33656002)(5660300002)(7416002)(86362001)(966005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?H2ZGl6MEDXPIRN1hn4B79FYpDrT8zyE6+j1pFDSbq08N68Db80egt/sxVenT?=
 =?us-ascii?Q?m4rvg3uURHQqN+y2zZCJZ1WFkh+4iCW26lDNPC+CnqtvfxfMYcR6me73KScm?=
 =?us-ascii?Q?R1eFe5R9MnIcctAkWv4WirW1/IRxcLtfBHRvWtVL3IR0fXD/uPch5PNxTSTj?=
 =?us-ascii?Q?2ZcWJXhFOnEzjfgiFxvHhjHRTNf8182E9nZTcRbo6fkpx0vvdWDjdNtzK+Sy?=
 =?us-ascii?Q?cSj5aGKolIoeUdecjI0OESMrWhwPL+3iUdG2wqXVHs0E8nKKZPDWmBAXFTuc?=
 =?us-ascii?Q?jYO+Er3GkyF+78M0ZrTRNmF6Ve4y6T+7Uu7Ebi5T2jT+hMlNmJ4hUq205ftf?=
 =?us-ascii?Q?75r1HCDrLgVXH7fRQs7tBY2Zpqspu/b7/dzKAkghJMeGt7/1yIS+jXn/d1m5?=
 =?us-ascii?Q?ZjOTmBKZAPZ3sCDvU8PiKMK1BqrKJbcO+x0ld3L2/2CIor+AVfRq/RLOzDZ3?=
 =?us-ascii?Q?QxAEKn+72kaMab3yRqMjC2xG5sgeda0LND79ipUuyuFql6X0ypCY+0jlJGmC?=
 =?us-ascii?Q?zJmoFeYKdUb3UkgHqWwHnzvOA5CcBwx8CLhsdIx2dWTM5o2On8Tph5PIJr1s?=
 =?us-ascii?Q?c2QuAgbTZPxp33CMjET39ghTt5kgRSlVJ2MuILhYUhe18jsQfw1BMhZOpJdW?=
 =?us-ascii?Q?DlOGFlkNchxh5/QeRMjK+UgizTxR1qZhtR4/sePL5hGwMmsHE6lT0BTegKPr?=
 =?us-ascii?Q?5aUMAh8zlpK6yIrIHHBuYLH5pOseu393gR3VrvWnOEoX/+1VntPNHIg13f6T?=
 =?us-ascii?Q?IivWXtPjQjD5s7Q5QJnNcaxrWgkck8wyZEAa2RkTPvMcgQhZ0Su0Q7arqafa?=
 =?us-ascii?Q?xjGpiwFioFi4I9zUdjVyk5MU9zaN9s0OaCzxd2bke8abnsQLfAXEKfeIHzo+?=
 =?us-ascii?Q?oCLcCVuV/FhrYuA+iTHH4FjOYy1JHoNg8xnZytgOULo6lcX3DIOBdp0X7eck?=
 =?us-ascii?Q?yAW6rjUNCwITvnx2ydCSYAsVyIknP4iFmDLxPjjkqJGb24E81K9CrR5Hnnw2?=
 =?us-ascii?Q?dZr2sHErQk/PUto4aH9JS3mo93+LvfLYoQyll3FTfm9m+5t1zicP06iU2pMo?=
 =?us-ascii?Q?/ZsTC27ImYt81PsXKoUwmHTMq6qOoH+9vJ9tq/mxVHgVL0WbQxutDCtN52I6?=
 =?us-ascii?Q?tksNwGjFeYjgj0xw0DV3nHUfuTGl4XlSN9PmH2zXjSWi3s8x3BAfbECG+9Xs?=
 =?us-ascii?Q?lNsgLPnwUkzFvOrttTYLbmUHXfvkf2Cgnomz2xNbPYZuwzQWkXtPjngE+LAU?=
 =?us-ascii?Q?dcJKF4efDjwIcyHH0MtSlpT7zU/I065wnsbD4vvw+DZhG/qW6LEB6It37Znk?=
 =?us-ascii?Q?gmoB08s0ivAslj50QCOABvLCFsoE/cOYnTE61UKnXKNbjAvdynY4O5E0Qp9U?=
 =?us-ascii?Q?olRFGXtuAu4ho81z1g046D6hoTO59f70xx2rprHs4ly4pFG9aHnD8s3q7/XS?=
 =?us-ascii?Q?dO/FK5N6xvkhmerl080sNxTPtj1YuP8VK/nHnSg34mNqokMn+PvVIeq2haDi?=
 =?us-ascii?Q?knEcqgkKeX/+4PeybIhIV6sdjCMxOYCOYwcKA2er9ZtyPANyS6RroWZ50fgB?=
 =?us-ascii?Q?ijueRDlN2nR1rYUFW764Aek9TaGtug4VDYpCPceq?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR04MB5543.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa5818eb-7c2c-49c2-bee4-08dbdf3f6488
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2023 03:12:36.5129
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fg4pUn2emMTja9L2U3rEzdH9jFdDto0Mr/SGnHlpaJAr+YBFPiJc1CXcpd30LtzL7eLfWeq8nZObxnNgScBkCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB7329
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: Wednesday, November 1, 2023 1:06 AM
> To: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
> Cc: patrick@stwcx.xyz; Jean Delvare <jdelvare@suse.com>; Guenter Roeck
> <linux@roeck-us.net>; Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlows=
ki
> <krzysztof.kozlowski+dt@linaro.org>; Conor Dooley <conor+dt@kernel.org>;
> Jonathan Corbet <corbet@lwn.net>; linux-i2c@vger.kernel.org;
> linux-hwmon@vger.kernel.org; devicetree@vger.kernel.org;
> linux-kernel@vger.kernel.org; linux-doc@vger.kernel.org
> Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver
> bindings
>=20
> On Tue, Oct 31, 2023 at 03:21:21PM +0800, Delphine CC Chiu wrote:
> > Add a device tree bindings for ltc4286 device.
> >
> > Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> >
> > Changelog:
> >   v3 - Revise adi,vrange-select-25p6 to adi,vrange-low-enable
> >   v2 - Revise vrange_select_25p6 to adi,vrange-select-25p6
> >      - Add type for adi,vrange-select-25p6
> >      - Revise rsense-micro-ohms to shunt-resistor-micro-ohms
> > ---
> >  .../bindings/hwmon/lltc,ltc4286.yaml          | 52
> +++++++++++++++++++
> >  MAINTAINERS                                   | 10 ++++
> >  2 files changed, 62 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> > b/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> > new file mode 100644
> > index 000000000000..4695bca77c05
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> > @@ -0,0 +1,52 @@
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
> > +      voltage range is 25.6 volts or 102.4 volts for
> > +      this chip.
> > +      The default is 102.4 volts.
>=20
> You've got weird wrapping of text here (short lines). Either this propert=
y or the
> corollary work for me, depending on what Guenter wants. With two nits
> below,
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

We will revise to
adi,vrange-low-enable:
  description:
    This property is a bool parameter to represent the
    voltage range is 25.6 volts or 102.4 volts for this chip.

>=20
>=20
> > +    type: boolean
> > +
> > +  shunt-resistor-micro-ohms:
> > +    description:
> > +      Resistor value in micro-Ohm
>=20
> micro-ohms

We will revise to micro-ohms

>=20
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
> > +        power-sensor@40 {
>=20
> the generic node name is "power-monitor".


We will revise to power-monitor@40

>=20
> Cheers,
> Conor.
