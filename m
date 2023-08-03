Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D469276E598
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Aug 2023 12:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235454AbjHCK0G (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Aug 2023 06:26:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235304AbjHCKZh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Aug 2023 06:25:37 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2102.outbound.protection.outlook.com [40.107.114.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C65D535A1;
        Thu,  3 Aug 2023 03:23:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bhQgiCvs4ASGa/lT3yX8hpT2nsqs58vtrgKgguK8AUmW7nBU07BvyZCp1ZHkf/MFnSNy2/mFifnba+uulCIRBqjE2LJBNgkCXdF8xSnfAydabV/9gFdyZTpuK31X1pt3f8kar1+fJsR0VeLCzQZmDKMUVasO7QrO7z6SNu8Aac/6AmZi1FZbQs30YDpSyodMMdE3D7PBoim1ajTzpVPAOfUYT/21uB5xQ0qP3HmdTW3NRwtLYLwljZnxf5IIZgdo2qb0CoWfQlxafbKdVPLnfPYGlanhAwnzvAurrcSl71bhfr7nBcmNLeSFVjJLEcoenJ60giTYYBMlUcnSMC+eIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eYiZCFHQrQCb56PRr6bfRQ5kaVJs31O7hRSwNMTabI8=;
 b=hgtD054vPR4KcjkySFpO2B2S0jN2okit0z93+nsT3dfOKKnHDW6ZZPXnNWTFCDrUG6l+PCDJiNQaljEhJBu5zCuabANs4aGCemQe1uPIj3kQ0WcBjtgDL4+l3Tl+PhU9YLRvntWEsqt2wj6HwiVFUuzRNWpWzJGIlHr0KjRQ3bN7zA911YV8j2DVh/MY/M6btqGTFfCiifqaHX9QbbGIOKguXFrm60otIjx/9RWkLFCgHrbPymhmt+pN7Hogi6z77UVM2SS7JaRRNAIDLuN+o/xt53JueeeP2hk/aNW4MsfwbhbuqT7ZmI0cXru3LHgZdDRqU73b+MrQXTGYzhIQDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eYiZCFHQrQCb56PRr6bfRQ5kaVJs31O7hRSwNMTabI8=;
 b=aeQbtjrJMPRBx29TzKSqHAYdsrls9XgoJbxM5FWH5qfBHjn+M4989DvUPVpMG9H30JYlhFZ3lOYtdn6B2H+rc+UVL3bh1q3Me4ae+UaviRbWbBe4hLDNwmfFPO7jvlqjGLusw1+c9jatV8CBLzqU0odCANVSuU2j1oS6ty1AQyI=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by TYCPR01MB6253.jpnprd01.prod.outlook.com (2603:1096:400:7a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 10:23:25 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::f5b0:8a:38cb:1fb1]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::f5b0:8a:38cb:1fb1%5]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 10:23:25 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
CC:     "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v5 0/4] Extend device_get_match_data() to struct bus_type
Thread-Topic: [PATCH v5 0/4] Extend device_get_match_data() to struct bus_type
Thread-Index: AQHZxfPrHKVqWNKlUkigFZFowwpOvq/YXMOQ
Date:   Thu, 3 Aug 2023 10:23:25 +0000
Message-ID: <TYCPR01MB5933EE418536F2F417D6AF838608A@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20230803101851.323504-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230803101851.323504-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB5933:EE_|TYCPR01MB6253:EE_
x-ms-office365-filtering-correlation-id: 76487166-60e4-4838-0007-08db940bac11
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f+aBJJcoEqZoKe0fiK1tWo/ppg7NSJR2OUU/Nksnh1PljGYVXTbPriM945mNRgfr+H/KaygkwCbYw3kk+rx/i25oBveYveW9B/Sub5oAkot+PADZLlsXNaXQyKcwxp+bP6ZxKrQsv9S8rd6ckjh370B56qJWswGFkCg1LnsWFF+FcCrvf8IxEdDoiXNTHg/Ev6UrBROiVjbt6Dra/PSCRoutWRSM8r8VXCBvozUPgD80cplGOfe2mt4M+/RyD+7LXoK7nvVQLbSKw1dmkZd2Y7FHYl/elJX/JWKuycfz+Un9/Fg8MhkVrhp4PrDjW/s2o8WdfsbrMFlTAwaK0g7Brp3NVwwnEajJrDBhLGtTesFp1RYmjmKrWIEKDJm7l8SL1xmoqO2F20kkyXAnP/mNp0xsJ3DPaYrIYJI1pAXDf0cCK1/W77xXPmWT/sCeBSdwSvp1gdUP5Ete2FUISKFc4dyI/lr8Uw1F0kaQC2Gic2st1+qO7f094JKWcIPJQLIGlFpQGYKPBO7zYMBwei0K18FfOU79nzrGR6ufDPuzFkN6+92jZpXjIbSiZ3K5n9Rq7GPdtt/77tQ54hkvL3/RF0feDDIO8b9SrgxnHIhVSH8HcnW/mF/rT2bjyBwM48Nb
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5933.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(396003)(346002)(376002)(39860400002)(451199021)(4326008)(316002)(64756008)(66946007)(76116006)(66556008)(66476007)(66446008)(122000001)(52536014)(5660300002)(41300700001)(186003)(26005)(6506007)(55016003)(8676002)(8936002)(7416002)(86362001)(54906003)(9686003)(7696005)(110136005)(478600001)(38100700002)(38070700005)(2906002)(71200400001)(33656002)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mmbPooLo27pUINAsXXMU/KB1VMgwqd3ArSWZr1/CVvmfscx5sDUsQI2VADgj?=
 =?us-ascii?Q?RoBvwKUuKHgOugMkVuqM/hwWoBVsQeBHv4Zb7rLf8F2AKK3knufcRK8zeL4O?=
 =?us-ascii?Q?FSv9zSQqve6hwVZ9H/bTiKJHmTA92qE4ZfoLMa/IM0SloISnCNX/VFUqW99S?=
 =?us-ascii?Q?ls8uA2KKykB4jV1wjJJR7TrCXEjN1WGmMpmuP/2yglzN5/faBIvcOHrhtq20?=
 =?us-ascii?Q?lG3i55BWXdbGqhXJAYp91wd6B/m7zsa03Q8G0ElTRVVIVVgnkhRxKtBuoocE?=
 =?us-ascii?Q?TbaFNvbPZDn062L97BcB7qyXIZGPXIJsKDN8/xDhkltRm4dHBvNq0AxbDmZP?=
 =?us-ascii?Q?ujAKDD0A+GPuh/6ddAl343muP01Yuvl6CDevqnQqne+sfSjA4GUjR+LlkEdx?=
 =?us-ascii?Q?+fmuMuE0ayaY9+6gz7KWOzSvxLus7mN4xioe/8VaAGx16/eQFScIGI4VQvXq?=
 =?us-ascii?Q?65/TotDh3YwNAKVBS+907/8xSAdsIeKwXUR1b4ghHdCYWOlY+B7RVxdY8IPs?=
 =?us-ascii?Q?yIL9oLsn+l4Abc6Kj4BBKV+fVmguEhVW3JdVpsFMUjUhPyJO228xefCI1K8k?=
 =?us-ascii?Q?FgNE2aCbIv3kXaybd6YhCBgAhqvHiefPlTMJAu5FWlTplPES9o9lFKPG8PUV?=
 =?us-ascii?Q?wkp4VZ//CDmRQ4fep88mf0XPBYn+HWmG+ZOXFDdqJwSNOIz7pQ0kGj7h9uyR?=
 =?us-ascii?Q?tP/pxnQ6OufzFaplBnyxxG86ukL4srkOI60zc+XnLQqQGQrp04Gn6aKaLQR0?=
 =?us-ascii?Q?uKHY3+ch6pd9O0wkxNbtG6gUpfPhoBzlOzFPBds59rAh2d4K9WsNsw2UtMaw?=
 =?us-ascii?Q?Y9h0su9ltd0QAoD8RZz1UqwCpceH8P9SawHz8LjHJ3HKeYo3rcL9JzNRUJw/?=
 =?us-ascii?Q?MAmHaJdH4zENQ7B7hy7Eg1LQXCWA5QUwfYKP+f8qXEwIbLrnteNhncOdLJ25?=
 =?us-ascii?Q?DYiKo9n/ytXlKT7p7mHEj3xLv2/OAI6D0iYAOlobGJcvyRMdME5tAEF1kXEO?=
 =?us-ascii?Q?bginvHpnSUSsaCApUx5hBR9ElRse4S5Lmp++WFY5u9DVpAfEICDRTcfDF+oA?=
 =?us-ascii?Q?cjZIVpKMgAV47PZI0+orPfaPSEvVi49ZGFvFpsBm4tY6ZjQh5SO/gJjC93Re?=
 =?us-ascii?Q?3lfGYjwIN35lD1kH4pTSvJHaceEjKvIGfVRer45AyJAD1JfgwwyNHOOv2/L2?=
 =?us-ascii?Q?yzgsL/EklKR1T5/7OLbAbeMhhrzc8XTrjECskh+6qwDaOxYpvg5dC/n3YSoO?=
 =?us-ascii?Q?m2GtY1eDyKGhZUyh5IV7PJc54sgpLHB2T0pZr5PeumuWDqESW9ki9EBIW7U7?=
 =?us-ascii?Q?Fw2QZXroQLKoWrDIffv5YD1/nT806WmHWO+/nwAJf4cHfkb04ckZPENzPmbt?=
 =?us-ascii?Q?fwF0kj4iHfPLMPInRjjuz+1PXKa4CALiQIFxRp6aGUm2wmZ0m4I2vzNXiFT6?=
 =?us-ascii?Q?Unses9qE+9lYtA41F7adF3PfYYaAeLaeYhYz7YcANDwRw6Wxc8jpibFEMpA6?=
 =?us-ascii?Q?6jvH9GHRFPfTPQP7Cs/kXMG0fMqhiu89ydpsyAoQ3Gc5N2/+yuDZh8+rBZ78?=
 =?us-ascii?Q?Vxfi6Vw5gd+HoG0Oa5GXAVcyk1LQHo6lquRbydxNwJoJYAEEPB5zpxDk87NY?=
 =?us-ascii?Q?mQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76487166-60e4-4838-0007-08db940bac11
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2023 10:23:25.4812
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vTIKihE+WiHzFfk9gRruQEA4UzZEl5jX61QU/4ou58H2auPB8BlFbZvi2NBX0k/Cow60tFT5xEWFFnTk7z9i5zYdPscKnLOIzlbv61cYK2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6253
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi all,

I will resend this series as some mailbox issue happened with patch#3
and covering letter.

Sorry for the issue.

Cheers,
Biju

> Subject: [PATCH v5 0/4] Extend device_get_match_data() to struct
> bus_type
>=20
> This patch series extend device_get_match_data() to struct bus_type, so
> that buses like I2C can get matched data.
>=20
> v4->v5:
>  * Added const struct device_driver variable 'drv' in
> i2c_device_get_match
>    _data().
>  * For code readability and maintenance perspective, added separate NULL
>    check for drv and client variable and added comment for NULL check
> for
>    drv variable.
>  * Created separate patch for converting i2c_of_match_device_sysfs() to
>    non-static.
>  * Removed export symbol for i2c_of_match_device_sysfs().
>  * Replaced 'dev->driver'->'drv'.
>  * Replaced return value data->NULL to avoid (potentially) stale
> pointers,
>    if there is no match.
>=20
> v3->v4:
>  * Documented corner case for device_get_match_data()
>  * Dropped struct i2c_driver parameter from i2c_get_match_data_helper()
>  * Split I2C sysfs handling in separate patch(patch#3)
>  * Added space after of_device_id for i2c_of_match_device_sysfs()
>  * Added const parameter for struct i2c_client, to prevent overriding
> it's
>    pointer.
>  * Moved declaration from public i2c.h->i2c-core.h
> v2->v3:
>  * Added Rb tag from Andy for patch#1.
>  * Extended to support i2c_of_match_device() as suggested by Andy.
>  * Changed i2c_of_match_device_sysfs() as non-static function as it is
>    needed for i2c_device_get_match_data().
>  * Added a TODO comment to use i2c_verify_client() when it accepts const
>    pointer.
>  * Added multiple returns to make code path for device_get_match_data()
>    faster in i2c_get_match_data().
> RFC v1->v2:
>  * Replaced "Signed-off-by"->"Suggested-by" tag for Dmitry.
>  * Documented device_get_match_data().
>  * Added multiple returns to make code path for generic fwnode-based
>    lookup faster.
>  * Fixed build warnings reported by kernel test robot <lkp@intel.com>
>  * Added const qualifier to return type and parameter struct i2c_driver
>    in i2c_get_match_data_helper().
>  * Added const qualifier to struct i2c_driver in i2c_get_match_data()
>  * Dropped driver variable from i2c_device_get_match_data()
>  * Replaced to_i2c_client with logic for assigning verify_client as it
>    returns non const pointer.
>=20
> Biju Das (4):
>   drivers: fwnode: Extend device_get_match_data() to struct bus_type
>   i2c: Add i2c_device_get_match_data() callback
>   i2c: i2c-core-of: Convert i2c_of_match_device_sysfs() to non-static
>   i2c: Extend i2c_device_get_match_data() to support i2c sysfs
>=20
>  drivers/base/property.c     | 27 ++++++++++++++++-
>  drivers/i2c/i2c-core-base.c | 60 ++++++++++++++++++++++++++++++-------
>  drivers/i2c/i2c-core-of.c   |  4 +--
>  drivers/i2c/i2c-core.h      |  9 ++++++
>  include/linux/device/bus.h  |  3 ++
>  5 files changed, 90 insertions(+), 13 deletions(-)
>=20
> --
> 2.25.1

