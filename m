Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B77F75F0F4
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jul 2023 11:54:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232743AbjGXJyW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jul 2023 05:54:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232891AbjGXJx0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Jul 2023 05:53:26 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on062c.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0d::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20C1649FA;
        Mon, 24 Jul 2023 02:49:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l7oQ6lg6w1zxaiB+lg+3NDVAJZodLQbOMHCGkMwj7/Un5uggCKaPZNvsFnG3FWjPWmQ9lMo/8oRpXSRMvZj6eanoewnTm8kKAs+JP55JnPDKFeddvrQkQPuvZv99wjd1DgrpmtXLWc60bWoDLfFZmJc5C3DxKnGUMV5d8rxEfwXrIMJVgeNS4mNDn8LfKg/AADEa+BuM2cOvmNA1J3aDiIqJifAVILED0mk02W3e6hg7KtWUpx/u/XJ+RxQAvupIbB8XTTYYVat2CQmWR/U9nqTCARo3Y+N0uc9JiWT1G36zycJ1q+GUs8JFyARs/4hr03jfDUXPcMv9Js/JdLEvkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jT4G+XmhBCccAPOdJit89nkg0G9VWUhC73g9MfPCltI=;
 b=GkoOVKTnP+Uor2+mURUd0yqZ9af8rimEO9/qQ4I9VCR75J1zTl9yeTMSVQ1PUEBy6l0jhPChoiOKb9hXiEMcmw9YuXmlV0vk+nNL/Y7HjMAcVo0HCZLrV/Ra9Tx1NWVOxQ7+dI5nRYkuipw44Y1CBlDHybCgiEetRvHULDCW8cw/d0BSHZaXETyuxh52ze6+uBklmT+EM7VfXmlfGxsOuHwELAEi3x+oRwogoSUgn8bhjrF599pTQ5HlBbSooE+jw+4ldwKDYk3ZNFLpR8TEhRxmKqMECxoFcx4RPz3BBGNZiHTUv51zr9GCW9/d1hzlck4nxe6on0JMfwdIU86kCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jT4G+XmhBCccAPOdJit89nkg0G9VWUhC73g9MfPCltI=;
 b=C9Fg3gDU0yBBYpFdH4JcDF1EvA6TWrB/+OTV+6XP72v49jp8FDDvMxHTefPgbVRUcDv71LAMP4CSspurRS7x5KTGK1pqfM7zj1OKtm2fRc+8ueIksdJdjkLfVwwE5r0QOhtidHDIJYbUsWa34vYq+ivDlELU41ZYfFicYoIiBrw=
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com (2603:10a6:803:57::30)
 by PAWPR04MB9814.eurprd04.prod.outlook.com (2603:10a6:102:37f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 09:48:43 +0000
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::7f26:a98a:b8c5:f620]) by VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::7f26:a98a:b8c5:f620%4]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 09:48:43 +0000
From:   Carlos Song <carlos.song@nxp.com>
To:     Andi Shyti <andi.shyti@kernel.org>
CC:     Aisheng Dong <aisheng.dong@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "Anson.Huang@nxp.com" <Anson.Huang@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        Bough Chen <haibo.chen@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [EXT] Re: [PATCH 2/2] dt-bindings: i2c: imx-lpi2c: Add bus
 recovery example
Thread-Topic: [EXT] Re: [PATCH 2/2] dt-bindings: i2c: imx-lpi2c: Add bus
 recovery example
Thread-Index: AQHZkgDKNieDK5p0x0ufpk1V6aTcbK9y6mUAgAEgY/CAA3rLgIAR5vSAgD+T9jA=
Date:   Mon, 24 Jul 2023 09:48:42 +0000
Message-ID: <VI1PR04MB5005DB33D791DEED3F1E0612E802A@VI1PR04MB5005.eurprd04.prod.outlook.com>
References: <20230529074302.3612294-1-carlos.song@nxp.com>
 <20230529074302.3612294-2-carlos.song@nxp.com>
 <ed004607-5a23-564a-3185-a63af87783e5@linaro.org>
 <VI1PR04MB5005E43373DB10A9FD726AD7E8489@VI1PR04MB5005.eurprd04.prod.outlook.com>
 <5b537617-a9cb-609b-790d-3dda4b3933ec@linaro.org>
 <20230613224201.jyvodavmww43h4pi@intel.intel>
In-Reply-To: <20230613224201.jyvodavmww43h4pi@intel.intel>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5005:EE_|PAWPR04MB9814:EE_
x-ms-office365-filtering-correlation-id: e5056027-0c4e-4cd1-201c-08db8c2b2a9d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1H9YrwtLldSFXhiz88JFro51HSJuC0gYxrjPAAtCCJqQFGsLxgEBCV3Jv4aEz5iMtDKCS61+RS85g1UnX6oBXpi201BkBsiUE4Qhc7J9eWSB0lYpex/80LD5IPbNob65AHshA9R0g9KVIVbn2YiNynfCh4BgMYhUvvUJ2hFjBL28KlYLMOM7x8s++j0/e7HMhRdrn0+lZ3U5V/9+j8JRr6Xcjjb1vc69YIqCuNK7o6fWF3TbkzjPgkCxRxkZIR1oYR/kG/TdVVZs71cukMkVW1kVVz4qsQ9yOcr57rigITHJ6BogogAzjgpLrg+2cz7ejSBbDDmA5hqXNG3jNK7ZkL415ZYYjfdRZUPKtIj/1hbZyh8Yj24HnRqAw260QhFueH76uE3XNVfCktluZBk+CD99L7MaMmmAZ9lS1erOgyR5bRum51fNikTxvU6eCqht5M6mccaj+RIWFQVHl5nUigcMUglNsZfL0sPNF3K5/5bu7faDoIBc4gEzNYsxkm6w9VyfWX1VndI4Q4Mc4ULJy3Q/xrlS8s7TC2lASYut2hQ+sh8xMMkFycuI4ecwVrL4KEgOZOuaalIhDjWQrkap5vNaCF0KcPMI2z7R7OIqHJrFQGW5LUp9X9eHp/mWo58D
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5005.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(39860400002)(376002)(396003)(346002)(451199021)(83380400001)(38100700002)(122000001)(52536014)(86362001)(38070700005)(33656002)(55016003)(54906003)(478600001)(2906002)(186003)(6506007)(26005)(71200400001)(7696005)(9686003)(5660300002)(44832011)(8936002)(7416002)(8676002)(76116006)(316002)(41300700001)(64756008)(66946007)(66446008)(66476007)(66556008)(6916009)(4326008)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ALTver4mNMUfTJj1bwjG5koHSplWKbE8MOOlUzzrwqwbrVWaQxntTAzm/S8i?=
 =?us-ascii?Q?6Kc4Yg+4KRtiytIU/D9xXFOEhu4hW5xVwZtKEZl8hIwhfqfh2X8pki3CcbC4?=
 =?us-ascii?Q?eYS9Z7JUc4bIBKMAxyJHPMqNIpXbKIRKvNjAX8shSOuwhlq4H/JR2rwXnfLW?=
 =?us-ascii?Q?A1N9dNFTqZ1yaeZuos2kQTd1NkPjDYolgwHrpzHx8DY6IO3+kvQoUy+YTtPb?=
 =?us-ascii?Q?4izS+kBbbRVe+OZM3JCvAc57yDQXe6nYZYaNOrB4lxQUeSW8kdxe+H+zDnAc?=
 =?us-ascii?Q?qz/OIgGkxuRzvNJfqVodB6WFsCsC/v+1W9BPrDl+RdGsS9DF4NKUxKsXU9ro?=
 =?us-ascii?Q?Qn/9X9H7Rfx8/79aqgRF8bmTgb7p21GJ/D81Hs7S8lHHNifP4jqEbN6bc3Bp?=
 =?us-ascii?Q?LdTnGwZ4O6y8O8W+ltQHtbzahBhdtA9URjAhZIuUFnu+V5venUx+bO++BfaK?=
 =?us-ascii?Q?5UsMiCKzEkcaAniKDdkNbgpdrNjDmCZyDCSg5oKnITYYH+LbkFvkljIeGnoz?=
 =?us-ascii?Q?zHx2VEvwGCn5xR6k4CsSSb1Vng3Q8Tamq6H5kvRIIBElpGy7h3Lc8PvQt5KK?=
 =?us-ascii?Q?kANJwsdGpjksWhiPsW4bBSP3OPlNXX3lkTERrCCx7iwVp9sCwdrY6iphQ7vH?=
 =?us-ascii?Q?WaxGv6qnO2UU474BLJlrAjKq+Jv8QbXuPSNLPS7x3uNR1hRNsVO8cb+STanB?=
 =?us-ascii?Q?+zIXYRpMmsxjceFJIRoPmwMzZFpVEVgZ4r95fgaMNbFcXz17385xH7kLC68s?=
 =?us-ascii?Q?6UQ6kgfxWzafzIcQy/VhZvQBgSEjIPzmM/pLoAEN8D/OnlKQCejmi9tLd0YH?=
 =?us-ascii?Q?4PcX7JRkNYKNYuYmfia6JegXC60tn3ZafMlFBi5RYJBFyv4HxCP2gSyCTGBx?=
 =?us-ascii?Q?hKlQ5dp0xlcojx81NnEwVtqrjo1XBwv/y3KxXF6jV+7YzSQdP7byJkDN3Hsg?=
 =?us-ascii?Q?yx/XONtFn+iZsvMOhAw5xp1hgfwWAp2Dnh85zuXk7wDCOLPL7Erw4ZUh0v/4?=
 =?us-ascii?Q?IbD58NsDTrAHjuIPJCXQmqA87FGOOqrp6baLisZmleVRKJCdb5/9/K5it6Hb?=
 =?us-ascii?Q?0ZJAbFOt9x64LDNpEayrknHJJn1LwUFQ7Ob43AfG0UuIEqhN2VTHCPqyLvF+?=
 =?us-ascii?Q?idl9MnfmjNwbebUA1qFHLYff1NJKRzU7t7FmjNxmYEvyxv97itDTOe9YCoPM?=
 =?us-ascii?Q?Pu1kQK9UTBt5cXulh2pTdCJD0Pqytf5cE6WQaLE/HAwHHF1TGHxF9jmIgL0r?=
 =?us-ascii?Q?tn2x+KZvrWTEWC83/NdNte4ADVlzuQwu+mH4tG+lkMx38wBpm5An8BE7MeZS?=
 =?us-ascii?Q?yJSUALusOnOTjEAbtAedng1vZ611FoIPkPGwTW18vC2ISYSywDWJWN0Yy88Z?=
 =?us-ascii?Q?88Fp7dIYE1B45B8BjHIWYna+AAq4ZYYFLrbKXj5aC7U/V/hWENdBsMwCHO7a?=
 =?us-ascii?Q?pPdq8A07FF3Am0Hhf02xmefR7oGOEQucFRSxIxcGuoRZ1QAt7so1ZBheL0TO?=
 =?us-ascii?Q?GsAzrilD6afi9Isdt4Izzj6FvgvoZPM2U9uhrXKOH3ctJ5RNWsHvw266zYUV?=
 =?us-ascii?Q?6WqjutK7iF2iezXzhE0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5005.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5056027-0c4e-4cd1-201c-08db8c2b2a9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2023 09:48:42.9371
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RERwwA3BQ68RE0bBcaulObBwqSVxn2VP+4atsOBs26JMWExg5DJ1ftMqpfBVYbme9vQyPOkL3bRw+Ugbb2RV9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9814
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,SPF_HELO_PASS,
        T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi, Andy

Thank you very much for your advice!
I have re-made my patches based on your suggestion.

> -----Original Message-----
> From: Andi Shyti <andi.shyti@kernel.org>
> Sent: Wednesday, June 14, 2023 6:42 AM
> To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Carlos Song <carlos.song@nxp.com>; Aisheng Dong
> <aisheng.dong@nxp.com>; shawnguo@kernel.org; s.hauer@pengutronix.de;
> kernel@pengutronix.de; festevam@gmail.com; robh+dt@kernel.org;
> krzysztof.kozlowski+dt@linaro.org; conor+dt@kernel.org;
> Anson.Huang@nxp.com; Clark Wang <xiaoning.wang@nxp.com>; Bough Chen
> <haibo.chen@nxp.com>; dl-linux-imx <linux-imx@nxp.com>;
> linux-i2c@vger.kernel.org; devicetree@vger.kernel.org;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: Re: [EXT] Re: [PATCH 2/2] dt-bindings: i2c: imx-lpi2c: Add bus r=
ecovery
> example
>=20
> Caution: This is an external email. Please take care when clicking links =
or
> opening attachments. When in doubt, report the message using the 'Report =
this
> email' button
>=20
>=20
> Hi,
>=20
> > > We also find the sci-gpio and sda-gpio have been defined in the ref:
> /schemas/i2c/i2c-controller.yaml.
> > > So is this the root cause of no need to add these properties?
> >
> > Yes.
>=20
> is some cleanup needed also in i2c-imx.yaml?
>=20

Carlos: I will not upstream any patch for i2c-imx.yaml. I will drop it.

> Andi
