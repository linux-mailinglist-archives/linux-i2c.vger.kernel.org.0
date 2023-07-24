Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E15475EB30
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jul 2023 08:04:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbjGXGEC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jul 2023 02:04:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229832AbjGXGEB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Jul 2023 02:04:01 -0400
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2058.outbound.protection.outlook.com [40.107.255.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01589E46;
        Sun, 23 Jul 2023 23:03:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EEAKLpzbo/o1O/qddDgwu5eR/6tekD9mXOlllbzhKYN7WoVBr5vCdxDKEtevFau622iD1BLeZ+ApexSbIWOFpFwTkSUAJfsOSjY8uGgzfyki+IOF2eJF90w4qn961HaRI7E5L/Rt5lc6pbG/M0skm+VZc9SU+4VsArmhR0f9x+pdnWYRZKjQt+8xnXmMDm0tiUW2GNXGyiwBSKPmWdOx/feABdEAB8W1zyg9LDjETgNvCV1WK74fcjP2pkFuKLcQAPY4Dc1v+a9qog8yKni8WxvJvJeibwd17awPo6Og1oU3ZiFL8UfRy5R7RDkIpYvle9GeA1jKYMWYi0A09nombg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ABkT75Lq/2stibtIlkbZ16fAUXiANwp4Wf7RMAUZ+Wk=;
 b=Rd2F1UnynT720Dr/6XeFpCyKO7J3BFMEe1Bj2tdPRDRxV3QfvevVtUyTErGqiVMJvgfTfTzGzGRPaotD9k/0oDCX/L5/LwN1n+o9ZzSVgkX/Na7GRObbGEevkZm4snYgK3jvmRKzRvWRhlJQx+S8rT5LP+lOWocYu5tJ+6EbGSDMJk6ASypkc5OU3Au8lYz31PvVx8JzVhJAPGK6mPETG3IOmreU77C3gv1jgpIgM3q+uKFzHouwOUSbYCsjW8FA6u90OAGbkRuqJmcvt92twtUfLaYj7jQRiCxiHStnuo+xFYHuMPYsW42XYg4h5QHf6p4zJzrHaz/P8mUMh19PWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiwynn.com; dmarc=pass action=none header.from=wiwynn.com;
 dkim=pass header.d=wiwynn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABkT75Lq/2stibtIlkbZ16fAUXiANwp4Wf7RMAUZ+Wk=;
 b=tBHIk5p/cXZ8JAZmFn4pmhQ6HlYDGw3afdYXgUmGOVWLj6vCNRrt0VOieId+2wZzgXVIwVhwN6pY0LHRYAZhLxje2yGZJ2Gw9SuNagzd/hc5ic2DIcOetXrsyfj8fhihUVnAEcBv1g8L0A0K+jDYvWViJ87ixuEcqKxArDFuuHgne9yY9iTba3yT8Ii9uo8V0JF/JRhFQrDvMLV2I+71oE2qsRlZ5sEENDG34vnPErYXis60U8UOuV4AqEtSNABx3Yb7GIZTU2NXtKOJWWcqxlEfA5ttBldETtmrL2khB710WEpBGT/nK9jipCFfao29DvnyKaNYNlZRRO5wNL/GmQ==
Received: from SG2PR04MB5543.apcprd04.prod.outlook.com (2603:1096:4:172::14)
 by TY2PR04MB4111.apcprd04.prod.outlook.com (2603:1096:404:800c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Mon, 24 Jul
 2023 06:03:37 +0000
Received: from SG2PR04MB5543.apcprd04.prod.outlook.com
 ([fe80::819:57b:cc1b:f5f0]) by SG2PR04MB5543.apcprd04.prod.outlook.com
 ([fe80::819:57b:cc1b:f5f0%7]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 06:03:36 +0000
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
Subject: RE: [PATCH v1 2/2] hwmon: pmbus: Add ltc4286 driver
Thread-Topic: [PATCH v1 2/2] hwmon: pmbus: Add ltc4286 driver
Thread-Index: AQHZdpWEijeHFPfanEysOeJB2LsOS686gM4AgI5F58A=
Date:   Mon, 24 Jul 2023 06:03:36 +0000
Message-ID: <SG2PR04MB5543559DECDDF6B075BEAC85A102A@SG2PR04MB5543.apcprd04.prod.outlook.com>
References: <20230424101352.28117-1-Delphine_CC_Chiu@Wiwynn.com>
 <20230424101352.28117-3-Delphine_CC_Chiu@Wiwynn.com>
 <c83242ca-f966-48e7-86a3-88b1b53c606c@roeck-us.net>
In-Reply-To: <c83242ca-f966-48e7-86a3-88b1b53c606c@roeck-us.net>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiwynn.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR04MB5543:EE_|TY2PR04MB4111:EE_
x-ms-office365-filtering-correlation-id: cec60af3-6f42-496c-4927-08db8c0bb830
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CygqzhAs+kXsMAvkteKvVqe5jpPtdF3reocWfhJNNeX/veOCYf76J+MjeAI3+XraFddQzKXE6vRSC+w+h2Hig5LGCLg+21rF9G+sEEpkd7ZMEKnx3I4BoSIYN1OcNC8KzOrbLNt7YF0pDoRd7i/0ZASJ1LMZz7lxzTP5W+ozoJ7VnJkJwzKOJKGvgssue0Oc9SzYV/cbgQ8eByYk6jmQpdqRwLkEc8HkIRbeB7gy3235qYD6sZ+obheyBUnqSO/Tynj1XYRsDmxXxnVg56lq7nviCkgRLYZKsrBZdf5ZLK/m0kXPlIwryxDQTYZCcCUuf0swFXF42Rbwp0ZbTf+IywejX/MlNkxMRheKq7CPqHsWFkt3cdLDYpggheFMDkdNItFfS41Z47BUuv9cLO+Lv2Vh8ztm05VVis1M5x64xCirhztKgH1Iibc10voCPKGMpGfRuh015l438PtUjBD6xMNRQRodOlNZ2BNzc8sCFyAtTp4jcwNQkCZMeSfz/Isi0QfH5os70ghp7D1fenqiaOjaki/BUYq0Qi6VagGBufW6YDtnoCLiaaNbzdWcK8lzp/NROjSsqq4Gx6kGLs5uhek7aN6IAOKwa3YI3xln7mA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR04MB5543.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(39850400004)(366004)(396003)(451199021)(38100700002)(122000001)(55016003)(53546011)(66574015)(83380400001)(8676002)(8936002)(5660300002)(52536014)(478600001)(64756008)(6916009)(54906003)(66556008)(66476007)(66446008)(316002)(66946007)(4326008)(76116006)(41300700001)(186003)(26005)(6506007)(71200400001)(966005)(9686003)(7696005)(30864003)(2906002)(33656002)(38070700005)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3pLb4KbmUxQdJxPSTWaCKg7+kKKcCRw8wRVHGgMMTg5Rv4TQUBJS50cYtt3H?=
 =?us-ascii?Q?D11/4HsfMp4y4jY/Mx3nzb+f8TdroZdOYYiiuAoqn/+pZqYE6mbeecQVNCzr?=
 =?us-ascii?Q?mi7xpS8Pfb8ycTEt7sgQ20MP6RmchNXVThrOJlHZTZvCxCfxuUgOTk56MUAj?=
 =?us-ascii?Q?rWc1lh9lzwgRkJAbvdsdKAu6mbQ6z/h14/54xFNb2quoayGa/zNYt7kUtPEg?=
 =?us-ascii?Q?OL5FEz9ExJuGQmIZ69qzcdvweCRUK/pQtG2JLNAt2f5efCxWmbJeizt4ajan?=
 =?us-ascii?Q?SGD4JWFdm5rT7peElGQRWIie+X3Q+MFWXNQepOkNMj+YcEeJLHHFIguqzHEk?=
 =?us-ascii?Q?aZWpoioSGhXKn/y3BrtjhnH5+ymqzpKjGtC+yPH8f8rzbups4njovNWrf6QW?=
 =?us-ascii?Q?x/+TzKJH3K5zLXN3MunjrBPB08HjY7+NR8w2aceQDB9TsZolKK++DIVJ7Y49?=
 =?us-ascii?Q?5HyHBpnRoqgCTuMtNJ9bc+lvX6+9v2pNpEcFhbSklEry51O6WRtVJpVXuPxu?=
 =?us-ascii?Q?QlY1WHB0ybiQGVOZgwnswZOwQn3XfNk1gzwsUZUeoUFxIOAxdFvQV+MIBNZx?=
 =?us-ascii?Q?Rc8LhONLpl3UP9VO6R4/4XkIzMJucT7Rjl6IPofaEs9QqqM0zSroHX9EmWok?=
 =?us-ascii?Q?+zl5wc1AkQxORGMYD9aEDcSAZ1oD9AV9Bl7vi2erSctmTZTqY6hy7bTBCQrv?=
 =?us-ascii?Q?w8TYT2NTSI2yjp/c3WN/QQN7pv+ZY/dQ4rK5+90JQKYzn4ImldTWny8Jt9Vm?=
 =?us-ascii?Q?IW8CKq6LW8UoHU8Sjpqn+zQverAv76YTsXsmfxfQwSWPjear6iO9NqNBwQQS?=
 =?us-ascii?Q?4RZJH+X3hneW09m3NehqyCGfjYqAVJaunAkKka+VmFu7XqUlqAylxuYnbwzk?=
 =?us-ascii?Q?kAdFBm1cPUMMU0ngmreSnuixa2HZCekjg0s6CdYjZmQNMBKv+vDcaecLxeM9?=
 =?us-ascii?Q?4YYPZD7HhyBKMmOpg5lhn12Ewv6FVwRCWEyGbu3qrAO/J16qSG2VP+/xM+KY?=
 =?us-ascii?Q?Ma9Ypu7dveOauyCwCq44mrzmFvcZ/3wbWEC8rY6BntfYF26ZvU5UHUa23nBv?=
 =?us-ascii?Q?LLbXme83MEFk3Uk8h0vrgCVyVQRzBTWR2RXaMingCXMB8oJS4cuidQUc+7ch?=
 =?us-ascii?Q?yP1IiWGNWrLoiAAVUjGKkNPdzqyimFgvh5mDPnYkY1+Om7Ota0fkHOHpw1lp?=
 =?us-ascii?Q?uf/90cl4mCoH5tH3wfoTw0C0jfQfq+nuxzphPDwuW9RCBUcipQVdSXWZ40ah?=
 =?us-ascii?Q?8dbxQ6rOIAqnTebmIrgwGFWTysSZOH9TL9Mr6sD8h2zSZ1bcCUYFYs6YllZR?=
 =?us-ascii?Q?u7WdDUTkJ3JdB1OnmpCI/rRC/RK8PjzcUxdy6S/4CjJxvdzNZyyH8RU858z8?=
 =?us-ascii?Q?a/oWrcRfG5Ur3Y4vQuhInn8I3Uof36HZtgS5YQ8BrG+fm02XEep0sLr6jO7+?=
 =?us-ascii?Q?gRN3RZh1lrjRb+HUOqMGhsvRFJRQewwfBiO3bC0PiqI2DgAQZZRVPHu5NQvJ?=
 =?us-ascii?Q?IMs7hivj2WWIvK9ETY5mMjTqUvnSqvyRajpAPdKwoIsaU3JtuWC73SUaGyEh?=
 =?us-ascii?Q?Mi4xHphhA4T7hoNgvddXrbjoPRQybYzIu8HpHuOV?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR04MB5543.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cec60af3-6f42-496c-4927-08db8c0bb830
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2023 06:03:36.5728
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EjRBGsaDWdsEyU+goxfW0rgGfYLNKmAjGb6/miqWgIiZavy4AR8Jd/N+oS+4qGrd1fpvZtALLZeUZEmfrryRbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB4111
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
> Sent: Monday, April 24, 2023 10:14 PM
> To: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
> Cc: patrick@stwcx.xyz; Jean Delvare <jdelvare@suse.com>; Rob Herring
> <robh+dt@kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>; linux-i2c@vger.kernel.org;
> linux-hwmon@vger.kernel.org; devicetree@vger.kernel.org;
> linux-kernel@vger.kernel.org
> Subject: Re: [PATCH v1 2/2] hwmon: pmbus: Add ltc4286 driver
>=20
>   Security Reminder: Please be aware that this email is sent by an extern=
al
> sender.
>=20
> On Mon, Apr 24, 2023 at 06:13:50PM +0800, Delphine CC Chiu wrote:
> > Add support for ltc4286 driver
>=20
> The patch does not add support for a driver, it adds support for a chip.
Add a driver to support ltc4286 chip

>=20
> >
> > Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> > ---
> >  drivers/hwmon/pmbus/Kconfig   |   9 +++
> >  drivers/hwmon/pmbus/Makefile  |   1 +
> >  drivers/hwmon/pmbus/ltc4286.c | 142
> > ++++++++++++++++++++++++++++++++++
>=20
> Documentation is missing.
Documentation is in patch one ([PATCH v1 1/2] dt-bindings: hwmon: Add lltc =
ltc4286 driver bindings)

>=20
> >  3 files changed, 152 insertions(+)
> >  create mode 100644 drivers/hwmon/pmbus/ltc4286.c
> >
> > diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> > index 59d9a7430499..1230d910d681 100644
> > --- a/drivers/hwmon/pmbus/Kconfig
> > +++ b/drivers/hwmon/pmbus/Kconfig
> > @@ -218,6 +218,15 @@ config SENSORS_LTC3815
> >         This driver can also be built as a module. If so, the module wi=
ll
> >         be called ltc3815.
> >
> > +config SENSORS_LTC4286
> > +     bool "Linear Technologies LTC4286"
>=20
> Analog Devices ?
We will revise to "Analog Devices LTC4286"

>=20
> > +     help
> > +       If you say yes here you get hardware monitoring support for Lin=
ear
> > +       Technology LTC4286.
> > +
> > +       This driver can also be built as a module. If so, the module wi=
ll
> > +       be called ltc4286.
> > +
> >  config SENSORS_MAX15301
> >       tristate "Maxim MAX15301"
> >       help
> > diff --git a/drivers/hwmon/pmbus/Makefile
> > b/drivers/hwmon/pmbus/Makefile index 3ae019916267..540265539580
> 100644
> > --- a/drivers/hwmon/pmbus/Makefile
> > +++ b/drivers/hwmon/pmbus/Makefile
> > @@ -23,6 +23,7 @@ obj-$(CONFIG_SENSORS_LM25066)       +=3D
> lm25066.o
> >  obj-$(CONFIG_SENSORS_LT7182S)        +=3D lt7182s.o
> >  obj-$(CONFIG_SENSORS_LTC2978)        +=3D ltc2978.o
> >  obj-$(CONFIG_SENSORS_LTC3815)        +=3D ltc3815.o
> > +obj-$(CONFIG_SENSORS_LTC4286)        +=3D ltc4286.o
> >  obj-$(CONFIG_SENSORS_MAX15301)       +=3D max15301.o
> >  obj-$(CONFIG_SENSORS_MAX16064)       +=3D max16064.o
> >  obj-$(CONFIG_SENSORS_MAX16601)       +=3D max16601.o
> > diff --git a/drivers/hwmon/pmbus/ltc4286.c
> > b/drivers/hwmon/pmbus/ltc4286.c new file mode 100644 index
> > 000000000000..474f4ec9107c
> > --- /dev/null
> > +++ b/drivers/hwmon/pmbus/ltc4286.c
> > @@ -0,0 +1,142 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Hardware monitoring driver for LTC4286 Hot-Swap Controller
> > + *
> > + * Copyright (c) 2023 Linear Technology
>=20
> Really ?
We will remove the copyright declaration as it was false reference from oth=
er drivers
Chip vendor doesn't support this driver, so we implement it for our own use=
 and contribute it as Wiwynn is a system manufacturer, our server products =
use this chip.

>=20
> > + */
> > +
> > +#include <linux/err.h>
> > +#include <linux/i2c.h>
> > +#include <linux/init.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/pmbus.h>
> > +#include "pmbus.h"
> > +
> > +// LTC4286 register
>=20
> Please no C++ comments in the code.
We will revise to /* LTC4286 register */

>=20
> > +#define LTC4286_MFR_CONFIG1 (0xF2)
>=20
> Unnecessary ( )
We will revise to #define LTC4286_MFR_CONFIG1 0xF2

>=20
> > +
> > +// LTC4286 configuration
> > +#define VRANGE_SELECT (1 << 1)
>=20
> #define<space>DEFINE<tab>value, please. Also, please use BIT() macros whe=
re
> appropriate.
We will revise to below.
#define VRANGE_SELECT_BIT	BIT(1)

> > +
> > +#define LTC4286_MFR_ID_SIZE 3
> > +
> > +enum chips { ltc4286, ltc4287 };
>=20
> There is no LTC4287 according to information available in public.
> It has not even be announced.
>=20
> Besides, the above enum is not really used anywhere and therefore has zer=
o
> value. Maybe the LTC4287 is not yet released. Even then, there is no valu=
e
> listing it here because its parameters seem to be identical to LTC4286.
It has been announced on Analog Devices website.
Please refer to this link: https://www.analog.com/en/products/ltc2487.html#=
product-overview
enum chips { ltc4286 =3D 0, ltc4287 };
Use in v1 line 118 to list chip index instead of hardcoding

>=20
> > +
> > +static struct pmbus_driver_info ltc4286_info =3D {
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
> > +     .R[PSC_CURRENT_OUT] =3D 3 - 6,
>=20
> This needs explanation.
We will add comments as below
/* Initialize the MBR as default settings which is referred to LTC4286 data=
sheet(March 22, 2022 version) table 3 page 16 */

>=20
> > +     .m[PSC_POWER] =3D 1,
> > +     .b[PSC_POWER] =3D 0,
> > +     .R[PSC_POWER] =3D 4 - 6,
>=20
> This needs explanation.
We will add comments as below
/* To support small shunt resistor value */

>=20
> > +     .m[PSC_TEMPERATURE] =3D 1,
> > +     .b[PSC_TEMPERATURE] =3D 273.15,
>=20
> Assigning a float to an int doesn't make much sense.
We will revise to .b[PSC_TEMPERATURE] =3D 273,
However the value for this MBR is 273.15 in datasheet
We use 273 due to pmbus code limitation

>=20
> > +     .R[PSC_TEMPERATURE] =3D 0,
> > +     .func[0] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT |
> PMBUS_HAVE_IOUT |
> > +                PMBUS_HAVE_PIN | PMBUS_HAVE_TEMP,
>=20
> The chip does have a number of status registers.
We will add status registers here

>=20
> > +};
> > +
> > +static int ltc4286_probe(struct i2c_client *client,
> > +                      const struct i2c_device_id *id) {
> > +     int ret;
> > +     u8 block_buffer[I2C_SMBUS_BLOCK_MAX + 1];
> > +     struct device *dev =3D &client->dev;
> > +     struct pmbus_driver_info *info;
> > +     u32 rsense;
> > +
> > +     ret =3D i2c_smbus_read_block_data(client, PMBUS_MFR_ID,
> block_buffer);
> > +     if (ret < 0) {
> > +             dev_err(&client->dev, "failed to read manufacturer
> > + id\n");
>=20
> Kind of pointless to declare a local 'dev' variable and not use it.
We will drop it

>=20
> > +             return ret;
> > +     }
> > +
> > +     /* Refer to ltc4286 datasheet page 20
> > +      * the default manufacturer id is LTC
>=20
> Why "default" ?
We will revise to=20
/*=20
 * Refer to ltc4286 datasheet page 20
 * the manufacturer id is LTC
 */

>=20
> > +      */
>=20
> Please use standard multi-line comments.
We will revise to
/*=20
 * Refer to ltc4286 datasheet page 20
 * the manufacturer id is LTC
 */

>=20
> > +     if (ret !=3D LTC4286_MFR_ID_SIZE ||
> > +         strncmp(block_buffer, "LTC", LTC4286_MFR_ID_SIZE)) {
> > +             dev_err(&client->dev, "unsupported manufacturer id\n");
> > +             return -ENODEV;
> > +     }
> > +
> > +     ret =3D i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL,
> block_buffer);
> > +     if (ret < 0) {
> > +             dev_err(&client->dev, "failed to read manufacturer
> model\n");
> > +             return ret;
> > +     }
>=20
> Why read the model if you don't do anything with it ?
We will add comaprision here.
for (mid =3D ltc4286_id; mid->name[0]; mid++) {
	if (!strncasecmp(mid->name, block_buffer, strlen(mid->name)))
		break;
}

>=20
> > +
> > +     ret =3D of_property_read_u32(client->dev.of_node,
> "rsense-micro-ohms",
> > +                                &rsense);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     if (rsense =3D=3D 0)
> > +             return -EINVAL;
> > +
>=20
> There should be a default for systems not supporting devicetree.
After confirming with vendor, they said there is no default rsesne for this=
 chip
The value for rsense depends on hardware engineer in each manufacturer

>=20
> > +     info =3D &ltc4286_info;
> > +
> > +     /* Default of VRANGE_SELECT =3D 1 */
> > +     if (device_property_read_bool(dev, "vrange_select_25p6")) {
> > +             /* Setup MFR1 CONFIG register bit 1 VRANGE_SELECT */
> > +             ret =3D i2c_smbus_read_word_data(client,
> LTC4286_MFR_CONFIG1);
> > +             if (ret < 0) {
> > +                     dev_err(&client->dev,
> > +                             "failed to read manufacturer
> configuration one\n");
> > +                     return ret;
> > +             }
> > +
> > +             ret &=3D ~VRANGE_SELECT; /* VRANGE_SELECT =3D 0, 25.6V */
> > +             i2c_smbus_write_word_data(client,
> LTC4286_MFR_CONFIG1,
> > + ret);
>=20
> Error check missing.
ret =3D i2c_smbus_write_word_data(client, LTC4286_MFR_CONFIG1, ret);
if (ret < 0) {
	dev_err(&client->dev, "failed to set vrange\n");
     return ret;
}

>=20
> > +
> > +             info->m[PSC_VOLTAGE_IN] =3D 128;
> > +             info->m[PSC_VOLTAGE_OUT] =3D 128;
> > +             info->m[PSC_POWER] =3D 4 * rsense;
> > +     } else {
> > +             info->m[PSC_POWER] =3D rsense;
>=20
> This just takes the current configuration, and assumes it is the default.
> That may not be correct. The chip may have been configured by the BIOS, o=
r
> manually.
The MBR values are based on hardware design, so it must be set in initial s=
tage

>=20
> > +     }
> > +
>=20
> The code assumes that there is only a single chip in the system, or that =
the
> configuration of all chips is identical. This is not necessarily correct.
If there are more than one LTC4286 or LTC4287 chips, user can add the confi=
guration for different chips in dts file

>=20
> > +     info->m[PSC_CURRENT_OUT] =3D 1024 * rsense;
> > +
> > +     return pmbus_do_probe(client, info); }
> > +
> > +static const struct i2c_device_id ltc4286_id[] =3D { { "ltc4286", ltc4=
286 },
> > +                                                { "ltc4287",
> ltc4287
> > +},
>=20
> Even if LTC4287 existed, assigning the ID here ...
So do you recommend us to put this enum (enum chips { ltc4286, ltc4287 };) =
here?

>=20
> > +                                                {} };
> > +MODULE_DEVICE_TABLE(i2c, ltc4286_id);
> > +
> > +static const struct of_device_id ltc4286_of_match[] =3D {
> > +     { .compatible =3D "lltc,ltc4286" },
> > +     { .compatible =3D "lltc,ltc4287" },
>=20
> ... but not here defeats having it in the first place.
So do you recommend us to not put this enum (enum chips { ltc4286, ltc4287 =
};) here?

>=20
> > +     {}
> > +};
>=20
> MODULE_DEVOCE_TABLE() missing.
In v1 line 120

>=20
> > +
> > +/* This is the driver that will be inserted */
>=20
> Useless comment
We will drop it.

>=20
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
> > --
> > 2.17.1
> >
