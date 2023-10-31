Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BA7E7DC642
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Oct 2023 07:08:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232876AbjJaGGL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Oct 2023 02:06:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230298AbjJaGGJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Oct 2023 02:06:09 -0400
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2056.outbound.protection.outlook.com [40.107.255.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76C44F5;
        Mon, 30 Oct 2023 23:05:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T2W/cu7JN8hQRr6daFDeazHWPrVQEAN9KyWdi1dY+JwaIqezPN4nw9eLuwNEfpFt+iLfb3JWw14P1MsHrkoKoFD8tsNBc4/2ZGpEj8XOT2bn5itX9SgD9cI+2pq0ZVJYXO2dEfTSGawh+HV3HPDztcEBhxThYste5FG3/3BBYS6Tvn3MkL0z+CW7A4kjvooWtcJbZ3dUuzOsieO5IQd7uu9FVZ7f+DewZk+k370Bl+G0JlfGAm7CJVa/4QJgJ/fLu5NT89dekqdvYaDJ/aNCOj6WHSq9P9LZ+l6K2blAG+yj0bgIC2FCpr8ycjQBVlIYsKED+j4pbWb8GMAEA+gljA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8zlaR2nGzIsQ+dXF6OApNIVnP8cLN3aV9RLxVbN20vE=;
 b=F654EMmd3wCh633ipJIdL3oUuuQZdzTrfzoKCZcROwk20v8lI/fs8eyPK7dnDVHkqRpuNlr1jwjxGSlR5hKGe9545ZcdicND82V3Qj97DRHdqxsfQiGZgzZiZrGGUxQTw8cQJU+jBWfE1/k1nFKOpbWSraXXnlkKXfUtfYZg2MqwLJnwn9B7zu8U8yg+eS8KA1sUjgh/5WNTW3kyCKkoi7KBDPpfcD47t+vEvI/ztMSONKJF2WOXtst1lUhZ2pM9rPPoRoLL95QGw1wZShP36pZcjksK9wdovTbgnBg/U2Evs4ToKhdPd45SHq6utfWpJnTTa69ZTbp+QBfHSaT/sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiwynn.com; dmarc=pass action=none header.from=wiwynn.com;
 dkim=pass header.d=wiwynn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8zlaR2nGzIsQ+dXF6OApNIVnP8cLN3aV9RLxVbN20vE=;
 b=n5NunxVdX3SIYQWbuxxKQ16q9D9Opb730M2NpvzpV7RiYXy+22X2LrAz9uZRWQ42owf5tsAqt+u2QW7bhCRqtVVewnfbfZeUr0bleSNL3NS3Qx7zHkk1QkRruW7pKiJoto2GCa/q6U6z43mUNAN9+YxuLDsjzSGM9bp4GBm8ixwA/I8f6NIgrVIsfOPaWKUSnZDtejRE55qt/VzZ9YbZKNRMT6mD032VolSDxj5p/soq7aUWkMwRxR6S5inhwwmxcmdDdOOJUcc4QkWYPbL0DFiZdFM0Zs3pXXxIVg5hdVDTnNeY769hNaK6/bdfW/QooFQHbbT8YFg4t8SyjFcO8A==
Received: from SG2PR04MB5543.apcprd04.prod.outlook.com (2603:1096:4:172::14)
 by SEZPR04MB6187.apcprd04.prod.outlook.com (2603:1096:101:cf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Tue, 31 Oct
 2023 05:59:46 +0000
Received: from SG2PR04MB5543.apcprd04.prod.outlook.com
 ([fe80::4c7a:8fd8:1527:9287]) by SG2PR04MB5543.apcprd04.prod.outlook.com
 ([fe80::4c7a:8fd8:1527:9287%4]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 05:59:46 +0000
From:   Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
To:     Conor Dooley <conor@kernel.org>, Guenter Roeck <linux@roeck-us.net>
CC:     Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>,
        "patrick@stwcx.xyz" <patrick@stwcx.xyz>,
        Jean Delvare <jdelvare@suse.com>,
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
Thread-Index: AQHaB+SV8Z0lWuQfqk2pb+fPvv8kdLBcIN+AgAAMSACAAASRgIAHPWNQ
Date:   Tue, 31 Oct 2023 05:59:46 +0000
Message-ID: <SG2PR04MB5543067739D9E579F262CCB2A1A0A@SG2PR04MB5543.apcprd04.prod.outlook.com>
References: <20231026081514.3610343-1-Delphine_CC_Chiu@Wiwynn.com>
 <20231026081514.3610343-2-Delphine_CC_Chiu@Wiwynn.com>
 <20231026-dicing-crispy-a10af575d3e5@spud>
 <fffa4330-8d01-8498-4c5f-772ebf2a6b5a@roeck-us.net>
 <20231026-poison-encrypt-1df55e023867@spud>
In-Reply-To: <20231026-poison-encrypt-1df55e023867@spud>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiwynn.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR04MB5543:EE_|SEZPR04MB6187:EE_
x-ms-office365-filtering-correlation-id: 795f84fe-c425-4213-e27e-08dbd9d695bb
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jBfbcqDb9HDq1YRnd13zjXqpD71L+cD+59Dx9bxBeaLCECSVFLx0myHUjjgtpK+7iPoNzCXDnHm4coOXzc3HiNkXUBHdJYB1SJTNrXqKWfusy/+cK/7KOTlrHNNSxkL4Bph7aAsKqsOparAfOpabQWDYufAz43j128XkXR6cwANnjmYF6baSp07+rggAcA7Vme9itq3bvDHEztrEq2tTCxSESbZycD/3vRS3Q88cixtEjMIWKlD2Ax/4m8shkxnKHPK69w7UtLL50LWyMbXmc6UqkZEGOiN6Nuwh8x0CLNZR7o5fbyl4m7GnCjWLaOopP2PHgyCE7OWSWXA+dm8HxsRhDJF1XFtgHMaVdcAjQTb5YxCvlEfGh0A04YdelFkKFn7tWNXrA3lKrWFEurebDEs8P/BHsGlcMu6tWkDc6dKq9oER61XJLNdwRa7wvP9JwNx7CaJ0drlYKCLbeoGLL35LhHM/KCbPYSlhfR0rYB1zY+sFFlwFWUZL1/fvokDeke/KuEX0Ijcq+zAcjWqMl9QNyys6SkVNNJ0Blk1E/P900e+rC2Nikh3wzLMQbaTQhiJe2Bv+rXiKBSycfwtmYVkU1lDTDH1ApIFextYYZ4E=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR04MB5543.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(39860400002)(136003)(346002)(376002)(451199024)(186009)(1800799009)(64100799003)(26005)(55016003)(7696005)(6506007)(9686003)(53546011)(38070700009)(38100700002)(33656002)(122000001)(86362001)(83380400001)(7416002)(5660300002)(52536014)(41300700001)(316002)(64756008)(54906003)(66446008)(66556008)(66476007)(66946007)(76116006)(110136005)(71200400001)(4326008)(478600001)(8676002)(8936002)(2906002)(966005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TrkPYPZENdo4Snkd4vmHOIbf4mNssVgwMqfNEXMl1ZzJqWv5uYH+6xEuZDe2?=
 =?us-ascii?Q?fCSP92G8MwHaDwOAslvc9IrMCoyTKusDMoIwhZvo7ZusvBZdVrMKzvBoGwDD?=
 =?us-ascii?Q?lF6dhOgb1Qm6wZ+7kVB/1csOHSagATfWT/GbFUYA/81+EJdVsl/lqwOkeIPo?=
 =?us-ascii?Q?Srl0GTx7KX+1AfLw0qPE1R6SL/1ESl4kslpwRpkv/VmRHD71DItV7M/UgMFI?=
 =?us-ascii?Q?NDxVLGuoF0gHO54p2KdV8HIvUGDoDHCp6p1Lrc7bvofF0P4inL3l/H5AjDGv?=
 =?us-ascii?Q?NZxR9KE4s3c/eNyETiNR+azL7fFkF2aId2oErRZ6jyY1gDJlbzO4u4yDk1eJ?=
 =?us-ascii?Q?MtQhVsOdXVWiY/5l3TES7ds8I+s1sU8qqPPO3Sfi3udCwdcObsK1yqixOoR/?=
 =?us-ascii?Q?oY2VR+Y9rwK4VkK4PM9wofuBR+6RkknXsXJR3Dr8g81G1cg8PPP6dEaPrbup?=
 =?us-ascii?Q?OSmvTYFtvDhkxIyJTLDhMYmvlAGgnJoCHSzfESC2CrvtvfbhJVy1P0O69YIx?=
 =?us-ascii?Q?d6MFV9nNOd8yNEN0hFi9JEJU8o1Kf1bdZ9VUuYTWFTttZ0R2hVpjFDLbI+Jf?=
 =?us-ascii?Q?i8P4RRMj1PmgGamUjEy3VQU98ymARzBSiiz2jJvr/WBFVFJzv183ARYX1oPy?=
 =?us-ascii?Q?UjBPULBbkSWd7PC/OP1Pm2G0nlssfELraP5FaP8gdnr5h4JkPvG0izT+Kb/C?=
 =?us-ascii?Q?XPXgtaLBydKmRMojj/kXNaT1l6w8GIDO8lS1/NjbuCLN0ZAEd7NcUgzz9pOW?=
 =?us-ascii?Q?Hgw/UYiBw93MXuEd6BdDS6rTmpWHcgvOQZI1/ik2BF/Km5q8fkvqxHxrCfOx?=
 =?us-ascii?Q?ZvBFD5hjivHrDtIVtWgEoBCEvtOSFzvVyrpISyXtPhrA1YBkZlohjEXEZgZD?=
 =?us-ascii?Q?FExSdQzIaMt6dvbcGU9lI+wn15kU0dDFKduJILeHQt5xmJncrl/XRSOipUyX?=
 =?us-ascii?Q?STXdckpiwsKE3PMqHJzOoxSE6OOn/drRos6NlzMVJ/IBMmFJ6ZFTH+c1ckjr?=
 =?us-ascii?Q?aA72l59Q0Mv6MskJhBvlA4y57rK199A9zduicWbZEUXWMoQ+X4G1e5oDtLsj?=
 =?us-ascii?Q?xLGA1W1gKRojP0tbsXAE+AT5f/jBhv/exc9GX8zoRO9qT2Ii4taRFcDztyst?=
 =?us-ascii?Q?mHC5LgILTWCI1OB4ZLUiosIhwvykV8Gjq3ZnjY8hsFHWorfcJzDqou1413KZ?=
 =?us-ascii?Q?StZQFr3+jaeBpYckZBNbbotbc5oy+DiqBISY6ZclUNoNFvcaXcWZjEe2ITwa?=
 =?us-ascii?Q?O0g/HOu/5p2tKtrIYyqTInle2z+/44cEjHrQ2EeSSSSlhKeAnSEldvVpbmnK?=
 =?us-ascii?Q?bCapKmJWt7aa1W/McT0vnAUiG+0C5X/GBF+mtashhW0n1vOveVJoF89Rm747?=
 =?us-ascii?Q?G1GULbSHUc7dKNCed7NjrhwMxFXzxchFayKoMIx0k0Kv+dXzKc/WyPAgDFt4?=
 =?us-ascii?Q?umXTbMOohD+TzUVzd+0KawzT0WgAvjkWtgTKpC+fA9PoGmN2GHs3lFb5GJZP?=
 =?us-ascii?Q?c79j6ZosrnKcdgg8s7b4e+yfPG2hBhvdzxngq1XcYyzWeMfvLTOWIT63tuRj?=
 =?us-ascii?Q?sqy9Pke8Qs2QDYLbyEbf8re7q5fuD1fNQfl0ZH1W?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR04MB5543.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 795f84fe-c425-4213-e27e-08dbd9d695bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2023 05:59:46.1213
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: asViWF4TvUL8pNUXRfCmPRSQAmV1as6Si/4OxW5NmQZmqRoQzvgnsZ9IBorxm8lvupwtpQBOTXpMwueWhiA2oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB6187
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: Thursday, October 26, 2023 11:26 PM
> To: Guenter Roeck <linux@roeck-us.net>
> Cc: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>;
> patrick@stwcx.xyz; Jean Delvare <jdelvare@suse.com>; Rob Herring
> <robh+dt@kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>; Conor Dooley <conor+dt@kernel.org>;
> Jonathan Corbet <corbet@lwn.net>; linux-i2c@vger.kernel.org;
> linux-hwmon@vger.kernel.org; devicetree@vger.kernel.org;
> linux-kernel@vger.kernel.org; linux-doc@vger.kernel.org
> Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver
> bindings
>=20
> On Thu, Oct 26, 2023 at 08:09:52AM -0700, Guenter Roeck wrote:
> > On 10/26/23 07:25, Conor Dooley wrote:
> > > Hey,
> > >
> > > On Thu, Oct 26, 2023 at 04:15:11PM +0800, Delphine CC Chiu wrote:
> > > > Add a device tree bindings for ltc4286 driver.
> > >
> > > Bindings are for devices, not for drivers.
> > >
> > > >
> > > > Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> > > >
> > > > Changelog:
> > > >    v2 - Revise vrange_select_25p6 to adi,vrange-select-25p6
> > > >       - Add type for adi,vrange-select-25p6
> > > >       - Revise rsense-micro-ohms to shunt-resistor-micro-ohms
> > > > ---
> > > >   .../bindings/hwmon/lltc,ltc4286.yaml          | 50
> +++++++++++++++++++
> > > >   MAINTAINERS                                   | 10 ++++
> > > >   2 files changed, 60 insertions(+)
> > > >   create mode 100644
> > > > Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> > > >
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> > > > b/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> > > > new file mode 100644
> > > > index 000000000000..17022de657bb
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> > > > @@ -0,0 +1,50 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML
> > > > +1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/hwmon/lltc,ltc4286.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: LTC4286 power monitors
> > > > +
> > > > +maintainers:
> > > > +  - Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    enum:
> > > > +      - lltc,ltc4286
> > > > +      - lltc,ltc4287
> > >
> > > I don't recall seeing an answer to Guenter about this ltc4287 device:
> > > https://lore.kernel.org/all/22f6364c-611c-ffb6-451c-9ddc20418d0a@roe
> > > ck-us.net/
> > >
> >
> > At least the chip does officially exist now, and a datasheet is availab=
le.
> >
> > https://www.analog.com/en/products/ltc4287.html
> >
> > It shows that coefficients for the telemetry commands are different,
> > meaning that indeed both chips need to be explicitly referenced in the
> > properties description (and handled in the driver, which proves my
> > point of needing a datasheet before accepting such a driver).
>=20
> Oh neat, would've been good if that'd been mentioned!
>=20
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  adi,vrange-select-25p6:
> > > > +    description:
> > > > +      This property is a bool parameter to represent the
> > > > +      voltage range is 25.6 or not for this chip.
> > >
> > > 25.6 what? Volts? microvolts?
> > > What about Guenter's suggestion to name this so that it better
> > > matches the other, similar properties?
> > >
> >
> > I still would prefer one of the more common properties.
> > I still prefer adi,vrange-high-enable.
>=20
> I think, from reading the previous version, that this is actually the low=
er voltage
> range, as there is a 102.x $unit range too that is the default in the har=
dware.
> Obviously, the use of the property could be inverted to match that naming
> however.
We will use adi,vrange-low-enable instead of adi,vrange-select-25p6

>=20
> Cheers,
> Conor.
