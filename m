Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 526966B7187
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Mar 2023 09:50:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230227AbjCMIuL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Mar 2023 04:50:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230390AbjCMItr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Mar 2023 04:49:47 -0400
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20612.outbound.protection.outlook.com [IPv6:2a01:111:f403:704b::612])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F06A41285C;
        Mon, 13 Mar 2023 01:48:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fk0h9vz6ezTjmN3XhqJ58fqwDndHF4j6vSUZ5iAo4vI+BW+7Q42WoG+WRLzo2SvfgWAd1RqvocZWRUwphjW5Hvh1ConA/Y0xYNQi91+yg5WXKmzJJORmGkBkLzEI61gQMHObxWV4uhWdjyNlZWWQR/Zy20F+EJejiwg463IlXjSCynBxTPsLsrw6h3uwl9NbYY5Z4vbwbWpmEbv1edIvAULP7G8uEz3nQiTdcgC8IpY6gWDuNYmjfB9Ohwop82EJbvLGSmmjklL2q0F4SSfMYAUapOJhEw8vT2VwY/HJOyCseH3NyUn+hrJHhR7i47s6QdtNVtNt+EyGo54DcrrT6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4sSK7yJwJ+HVHvu4e1vdVmyXTmuLLiERc2jjPLVAvnY=;
 b=SGPc9vju1tKEoyqlIx4XYMHVUcvdOMOMg1+CNLoE0RGSVuN8MyxACg9b5XAaevFlhCiUgc6yn6k0nZs9aMdhAmVEJxsCH5T3GVsu7+uHrjR5iy0wR7mgzfG3uiCwRGfuTIHJyy1UTdklUT/9wnZvid+x6DhrOUX2+MrU2fzpEsu8WDrpCMffVqS072TMiuiQyJhzrXjeP7qUYOLvDKYRGbjOIBlKR9hAukGHLxXlidwTWVS6dRK+mg3+TbmFI6mWdsVpU0Z+7L8X0jPUu5oFJGEFjZjuhdWN57Hj45rHg3hajm05npzqc+Edr9YMB70Y6cN9qCgy5Gvt3xGc0uHOcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiwynn.com; dmarc=pass action=none header.from=wiwynn.com;
 dkim=pass header.d=wiwynn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4sSK7yJwJ+HVHvu4e1vdVmyXTmuLLiERc2jjPLVAvnY=;
 b=AB5ZPMRmYqdTXvvfq6UjwtLDhALPtYjnE1lCQHCo6aP7V0nbR77rVUp/JsGEBgHK7H6/4BplUAFVrzNlNf7XkLPXGAS1/CjXuiAnVyNkYngbHxGQwsc67ii9HWBDAX38ArXxqehxMN8qblNq/ZG3UgSfg5hqpvqoD1lRbHZYs1kGR6s1ugF3u9arUPG9V73DuBdG6fqt0MYLqdaJdQMGianUn3VO98kVPjOnOPER2wSCLID0qUFiLMrk5KeDWuLB2CEPNYdywXAGE1Pnd05vmzZF4+zU/Lgb7KC4UuWfpqE7tZJH6474ysq3oblFcuxSc6834wTJVUfKrEF/Nkl5fw==
Received: from TY2PR04MB4032.apcprd04.prod.outlook.com (2603:1096:404:8002::7)
 by SI2PR04MB5702.apcprd04.prod.outlook.com (2603:1096:4:1bd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 08:47:46 +0000
Received: from TY2PR04MB4032.apcprd04.prod.outlook.com
 ([fe80::e8c5:5f9:2a10:ae23]) by TY2PR04MB4032.apcprd04.prod.outlook.com
 ([fe80::e8c5:5f9:2a10:ae23%6]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 08:47:46 +0000
From:   Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
CC:     "patrick@stwcx.xyz" <patrick@stwcx.xyz>,
        Derek Kiernan <derek.kiernan@xilinx.com>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>,
        Arnd Bergmann <arnd@arndb.de>,
        "garnermic@fb.com" <garnermic@fb.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stanislav Jakubek <stano.jakubek@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Samuel Holland <samuel@sholland.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1 3/3] misc: Add meta cld driver
Thread-Topic: [PATCH v1 3/3] misc: Add meta cld driver
Thread-Index: AQHZKliEB9QfLl+uU0OkdbU+k336oa6iZG+AgFZMpyA=
Date:   Mon, 13 Mar 2023 08:47:45 +0000
Message-ID: <TY2PR04MB40321968150DC2E6FC2F307683B99@TY2PR04MB4032.apcprd04.prod.outlook.com>
References: <20230117094425.19004-1-Delphine_CC_Chiu@Wiwynn.com>
 <20230117094425.19004-4-Delphine_CC_Chiu@Wiwynn.com>
 <Y8Z1JxsLA6UKi805@kroah.com>
In-Reply-To: <Y8Z1JxsLA6UKi805@kroah.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiwynn.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PR04MB4032:EE_|SI2PR04MB5702:EE_
x-ms-office365-filtering-correlation-id: 689604da-c003-44a8-6e6b-08db239f9ded
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DZLQ/52bW9Q6t4zeZmKUWxGHjPpdF62I06NR8imhBLA+KqvCPN5KdsMu6i2OhRZLHTaZ0U0B4D4AINtX0n6oABQjYpvd9W7O8gnAX6v5zhUmmRqix65jO5gwy/csHvkItTVJxjB2rQT0FEz5onLR5w5UvVExme3IObODHxmKJRfxZSc08s0XFNsXVkfCAjoET4wVRquw/Ca+NBx9AnJOGxNcXHW63ArUeSvYkGw9rqnxXRkn+D9LtFVoTTYI4BirtFdtBEty54bxQOh3sU1vP9mJjcmIAAXPqJgyvZXoZrgZaqfUwJoUBXNk4fUPblZbl7jtFGULL7uWB+T6rHODy06o0XS7RUHk67AKrRJ3oaRD1hAYxqmG8tgBFfDR/1WU2eOx8howkC5Cx5tOFpFo7gDO2ZVRJwPhU/pP+6L06gM+Pk1XL0ea57G8qbsBRBfT11qmg4GVWe07IZIPBr4zMDw09+zrrm+6D3rUntugc1XHyruFzRF2JlxCfAONIthdjmq5dSUbPMDrYjQ6NERfMeRzcKw+3MUMnsc7SBhfvpy3trSZ3I0j2aHTL0tDMn9uMY19rTxI6mX/iPeYvMSz68kOOyU8zOeQwrkc08ci2ldCzfPggO9XeFjWBiFisQ873F+MSQM/4gUHomj2TM5XaC2oI3I9E+ctUm+Q53t8EhFOnIfzb0MZqXuLFAFhiydy
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR04MB4032.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(346002)(376002)(39860400002)(366004)(451199018)(122000001)(2906002)(83380400001)(7416002)(5660300002)(66946007)(52536014)(66556008)(64756008)(76116006)(66446008)(33656002)(41300700001)(8936002)(4326008)(8676002)(66476007)(38070700005)(38100700002)(55016003)(54906003)(86362001)(110136005)(316002)(478600001)(186003)(9686003)(53546011)(26005)(6506007)(71200400001)(7696005)(966005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NxgsGVPA0xY0JB9etMqYN2p5dp1/4siibMK/ktRn9hwTRka0HI6iZ+Cri4Fh?=
 =?us-ascii?Q?r8xFr7plTbK+PhmfU63zHVsSswYLplCGU3LDXYgG9PGf8zx4Gol7sxSkWXqa?=
 =?us-ascii?Q?ubUUgvb3yzCVG/a9ePFqP7/a6MSUAiJhv9hZt6mVSct3kkmI9bnZyjYXAwqv?=
 =?us-ascii?Q?vRPjNP1hGyjxvseb2rR51jhVNM8J/h4Ev83ZvqgM7v6ScstpA2ZwLtOXRutt?=
 =?us-ascii?Q?FxfXK1HBuSvDVnAhj+BY0ymKm5eLjatmV6gj/ntLQffuTSOfmD9SLlzOdRbg?=
 =?us-ascii?Q?xbOCx2Kd+tEyHY01JmeqUMNzxK0GQtSDQgQXbepWbt8nDQHOmS1f9yF4eI+w?=
 =?us-ascii?Q?vqN6eKls8IzWCioAChaFWpPU+e4/g8gZzSz0BOb8TbbboPsb9W4PhW3N09eg?=
 =?us-ascii?Q?LvMoc9UnTtw8eKVXaYdtDsUUIHyAY0Pff428sKdp+Sh/FvFRNxGJPEk+RFQ1?=
 =?us-ascii?Q?jLhg6UicgHxEzUT71hfSyj7zG9Vwl+X8b90qKoW/sOEEutRmZuL2VPbRz0Nt?=
 =?us-ascii?Q?chYrJ1H0mEVZbmSX7k8vgX69Skv7tUbqO4ChiKMlRnrX8j0eYOh1mH3buXp1?=
 =?us-ascii?Q?dlY/O1LdqUIt/JSmwY/fk90YhslrgbLsdQSHb4/KDADLUZavrcuFN/AA8xWh?=
 =?us-ascii?Q?DYUqa8TLKFhVSOpSl2/PYVbuhapE1ghkLgY/v8++Og6QALB6gW+ne68MW6nv?=
 =?us-ascii?Q?rcio6DpvGkfOyvj/VnzsgFJKmwFnZtDI5pYHlowue0pJS4jEKnLJgaat9cF3?=
 =?us-ascii?Q?gdqOb7Ckbovdyv0K23uqK5AQKt0Fm3T3Cbha5Rsd2gBUHcYpgzATXHWlD+dd?=
 =?us-ascii?Q?TxQARUQYxOrlN9YG3DiSDnprTrca0HGOeCefBvqwVI9dEN91iGlA6nIJKZoE?=
 =?us-ascii?Q?pMKavvN6vDwil3zT6Iy6iNuqunJsgpGfaSUbza/X21fKWeFXYpXEHDWMCvgI?=
 =?us-ascii?Q?cbakn4i4Po3sTEhYLeoKXGTiRp4s5GVjIfpgALDP98KfB2HOn8UcNwLq5bdo?=
 =?us-ascii?Q?3MPboyzVxI34PynSdvuT06G0DGt1dGWXbFsfnQYC0tvIDk2Ug9joPIsm1ipU?=
 =?us-ascii?Q?UvpjBqgYrX1Uu6hpHqWAoKg05Fy2D4kF70SKYeWD/0H7AWnCGtIRDJkjuqJ0?=
 =?us-ascii?Q?QlSLXK97i230o88bNBD0ZvEKTpVkH0fECNm5IHTX5zT9wK9UFs6wp3CFxM5D?=
 =?us-ascii?Q?f2yq/Q2BvfQ9pzjtcUJYNO3D6GQ+QVrBjQDc5I83qyNN5a+umKwgno01389u?=
 =?us-ascii?Q?7G8rOWiZBfihBlBP9drGWV8Ar5Gh5Iq2ICGn1MxivageTKXgsPMcWDSMRUoH?=
 =?us-ascii?Q?b27h0ZTpyXszpc3Kmc5KJjaJwSXliAfS3KhBW6o1OXJRGw6jTWO22T3Cx3cz?=
 =?us-ascii?Q?5h9irLlxYtMkWwjCDkp+4G5jhRUV5Ha3y8H3HcB46wFcaBy2l2ilZ/BL0/X1?=
 =?us-ascii?Q?p79YsqiQvOkRRrk8LxRJsc5JDZerwOsKvQHCIq85byU5++ZCD5RfYa2UsyQn?=
 =?us-ascii?Q?VOi7EVEWWrURLIuDZVACDsPUDtbmKpkSeFF5kJ+JjuJcQePAzlO7ZCPljnI9?=
 =?us-ascii?Q?TMuQ0RattcWvpLucsKNQvOtwZxbM+DrcpZdPYPJb?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR04MB4032.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 689604da-c003-44a8-6e6b-08db239f9ded
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2023 08:47:45.9100
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qMNy4ZCmihhZuUUYta7cIwu8jw4EHj9xb77DU5Mft6sHcqzw1F8qvlaeCLo/YJKp91zpID5Wk6T3DiqBM7oRxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR04MB5702
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Greg,

Thanks for your comment!

> -----Original Message-----
> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Sent: Tuesday, January 17, 2023 6:15 PM
> To: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
> Cc: patrick@stwcx.xyz; Derek Kiernan <derek.kiernan@xilinx.com>; Dragan
> Cvetic <dragan.cvetic@xilinx.com>; Arnd Bergmann <arnd@arndb.de>;
> garnermic@fb.com; Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>; Stanislav Jakubek
> <stano.jakubek@gmail.com>; Linus Walleij <linus.walleij@linaro.org>; Samu=
el
> Holland <samuel@sholland.org>; linux-i2c@vger.kernel.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH v1 3/3] misc: Add meta cld driver
>=20
>   Security Reminder: Please be aware that this email is sent by an extern=
al
> sender.
>=20
> On Tue, Jan 17, 2023 at 05:44:22PM +0800, Delphine CC Chiu wrote:
> > Add support for meta control-logic-device driver. The CLD manages the
> > server system power squence and other state such as host-power-state,
> > uart-selection and presense-slots. The baseboard management controller
> > (BMC) can access the CLD through I2C.
> >
> > The version 1 of CLD driver is supported. The registers number, name
> > and mode of CLD can be defined in dts file for version 1. The driver
> > exports the filesystem following the dts setting.
> >
> > Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> > Tested-by: Bonnie Lo <Bonnie_Lo@Wiwynn.com>
> > ---
> >  MAINTAINERS                         |   6 +
> >  drivers/misc/Kconfig                |   9 +
> >  drivers/misc/Makefile               |   1 +
> >  drivers/misc/control-logic-device.c | 443
> > ++++++++++++++++++++++++++++
>=20
> That is a very generic name for a very specific driver.  Please make it m=
ore
> hardware-specific.

In server project, there is a component (control-logic-device). This compon=
ent manages the server status including whole system power sequence, status=
 and other devices presence status. And baseboard management controller (BM=
C) on server can acquire the information from CLD device through I2C.
Currently, our customer plan to follow the spec to design the computing ser=
ver.=20
We would like to change the naming from CLD to "compute CPLD".
Do you have any suggestion?

>=20
> Also, you add a bunch of undocumented sysfs files here, which require a
> Documentation/ABI/ entries so that we can review the code to verify it do=
es
> what you all think it does.

We will add the document in Documentation/ABI/testing folder.

>=20
> And finally, why is this needed to be a kernel driver at all?  Why can't =
you
> control this all through the userspace i2c api?

After discussing with our customer, they prefer the userspace access the ph=
ysical device through driver not I2C API.
There is an example on the OpenBMC Gerrit.
https://gerrit.openbmc.org/c/openbmc/phosphor-buttons/+/60807

>=20
> One review comment:
>=20
> > +static int cld_remove(struct i2c_client *client) {
> > +     struct device *dev =3D &client->dev;
> > +     struct cld_client *cld =3D dev_get_drvdata(dev);
> > +
> > +     if (cld->task) {
> > +             kthread_stop(cld->task);
> > +             cld->task =3D NULL;
> > +     }
> > +
> > +     devm_kfree(dev, cld);
>=20
> Whenever you see this line in code, it's almost always a huge red flag th=
at
> someone is not using the devm_* api properly.  I think that is most certa=
inly
> the case here.

Do you mean the dev_free function is no need in this remove function?

>=20
> thanks,
>=20
> greg k-h

Thanks,
Delphine
