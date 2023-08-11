Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EE9F7790BC
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Aug 2023 15:28:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235562AbjHKN2A (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Aug 2023 09:28:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235733AbjHKN15 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Aug 2023 09:27:57 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2132.outbound.protection.outlook.com [40.107.113.132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72FE226A0;
        Fri, 11 Aug 2023 06:27:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mo56tVACYEQSupKnI4c1X3PckCNS/zFua+fQfLJ+jmezJXeyBQKIhzty8H6DeajLL/cKbt7twzp3NONLkgcM0vurMUHbjBqfacxRj0/Mjeeyz1pQscsTj1ZhajJN4pytEH+EXU1CK0VIvgVCDMHb3kDtrqv7jPjcY3sSsWZrUTjytHBenTetEZduBD+yTkjoAUxuM+7N3l0e6Vyw6ybol7RO66l+vfQ/3vT6H6MlIW6tMly/4ACRTRX3LnEcu7ws7H3UPZHFrXjqKBE4fdRjChlF/g8dTm4DrjXXIJB6dDevdpy19i9DNwmggV/czKIhcHwnk9N3FCrEZFMjEC/S9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9gtpcTtCzMiQLEyj/1SDw2V6U5+/qVV5EBzxifHbqcc=;
 b=ePReSbL0nQFjzA/xoG2i1raKfOJrSPBXOiMoypCIgEV8Y9VmZauTt42+jYcY0FK5H6fchhUfXOkZv9AHo6HykMoTClXXOyyx+ek6KWDvAThSqa2cS4QW9agMhCR5jtmc435NcABfKPDEGmv1xd0YfVpoHYqXL56GocDNqou/hTvYNmY/39wv0nz0YvDd4KlMZIYsSHu2NVrD6FcZJy173k07Uc02kTlZM/91y9m5X3GGhffdU1rc6SmEt5I2YHtMx56VUh1BJzvS8RukQWFqr4aqmHKI4jpvg3JmtlPBP1A65JVQz8tZVCDtDkiEPve0fHNvNQIS0nP6uGF4ptntHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9gtpcTtCzMiQLEyj/1SDw2V6U5+/qVV5EBzxifHbqcc=;
 b=K7kDHr99ktNJBhIXo8n1dKiO4yP2tkGVcUif8pr/fGuhtYFBq+KKgbgba3VpeAbb/DPROrYJyxgnnmIIJQm1JO+06yE4PK3/Q7hrAUWxITpe0/nLg7j8CubyGoY+SPGLhAA0pSAYWgEUDhzPzDv10YYFIN/CRqNlkOy/ZWIavnk=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB11975.jpnprd01.prod.outlook.com (2603:1096:400:387::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.20; Fri, 11 Aug
 2023 13:27:36 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f4c1:5f6e:abd1:2bf9]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f4c1:5f6e:abd1:2bf9%6]) with mapi id 15.20.6652.031; Fri, 11 Aug 2023
 13:27:36 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jonathan Cameron <jic23@kernel.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v7 0/4] Extend device_get_match_data() to struct bus_type
Thread-Topic: [PATCH v7 0/4] Extend device_get_match_data() to struct bus_type
Thread-Index: AQHZxu8xqdWpTKFxl0mrPmlP0GQCwa/b6UAAgAADvoCAAVlKAIABqeGAgABf2wCAAQcZAIAB6BqAgAED5pCAAGj8gIABdEDw
Date:   Fri, 11 Aug 2023 13:27:36 +0000
Message-ID: <OS0PR01MB5922DD3C809B78F1E9C5949B8610A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230804161728.394920-1-biju.das.jz@bp.renesas.com>
 <20230805174036.129ffbc2@jic23-huawei>
 <OS0PR01MB59220491C7C8AA40BEFAAD82860EA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230806142950.6c409600@jic23-huawei> <ZNEFjyAloqlkMWn7@smile.fi.intel.com>
 <ZNFV+C1HCIRJpbdC@google.com> <ZNIyrG/2h/PeS9Oz@smile.fi.intel.com>
 <20230809182551.7eca502e@jic23-huawei>
 <OS0PR01MB59221A1ADB67E96E9E39D0198613A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZNT+NY99n7y3abwa@smile.fi.intel.com>
In-Reply-To: <ZNT+NY99n7y3abwa@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB11975:EE_
x-ms-office365-filtering-correlation-id: c2d3320d-5bca-44a5-9dca-08db9a6eba36
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 237WtaiomMF89o/cM5LkxdTEEmkOLfblKi9Vy36ZhpdxNyinwsGeoSCL5HHAaYjCP3IZ1LP0JGcGvly/2GMvGlBkOTXYPBoWcleFa+kyt6YLasnIYuLaireIfawdh3FvbvlfXsvspjNN1V2+O+JnDIhbHkWWOugACKgt30bMNWv561zEoUOdPRq8qRkgGej5DGVLnjSyFa3bK1J3ojNv+rJiPBwT8H4uG1I0X5QxFAtRKiwcB7vmmbUNhzsrQKKga7jk8DZ/DR3qUEbQzl7Zr0yeZpI3hL/7rAvJvewYd9wm3Oj8+xQmqMoaSUqfJCZtAHyfxJac1IVTAHqjrU6qJ8XABW0avBw8yFEOCbODh+F4TbGie9uHAonaWAhGdUs+2zBQ6aBPtqFUTgtaqCIT5eY3rBpXnv0jSpVWmC2ihhKhcY+UKbt/RYz0fZFSkJSl461bf3OFpoC7klMhdZ5Uw6hLCPt0rrXGKNagFZTorUhR/jLW/UdmbzDo3EkT0BrWHE6Tlb331rhc/R+oKxUlBAIsVqCTkD6Wxw87vArGcFSEOtxDdYcw48IFt9oNUWsVPUtoHRy2fQQ7hA+GjLJVaCTUfc/CXffxq9J1nDePhcQKJjIpdE69GEaZQFOxGyey
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(136003)(396003)(366004)(451199021)(1800799006)(186006)(9686003)(26005)(41300700001)(7416002)(64756008)(66446008)(54906003)(66476007)(66556008)(66946007)(76116006)(2906002)(316002)(5660300002)(52536014)(4326008)(8676002)(8936002)(478600001)(6506007)(7696005)(71200400001)(110136005)(55016003)(122000001)(38070700005)(86362001)(33656002)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ojAI6R1ry3j/wOpcbRQBXJIwlhNtMJpZyPz+cZxlQ3V4ohVI1It226vJwvmw?=
 =?us-ascii?Q?dM/l9tS2ghowR1BIs0dWxmrI0qR5rLPbU5yYHLuRVLuXxO/TbNn2YwqvwMNa?=
 =?us-ascii?Q?e6Yn2fVyhZYSLDH2hVqoHK7rjUbPGDZ/SCR8XIXhWMAAGBLXb3etd2L/DU0c?=
 =?us-ascii?Q?e+eQAipI+/utt7zrVhj8fBnPojrg9mCfTo/re/jkHycBf0GB86Tm/i9BrfLI?=
 =?us-ascii?Q?Gy08lj3g54Ei9rqUOpB3VOmrNiW7NlPruMPw/H0w2PczoxHWJs5kVvLHZWCd?=
 =?us-ascii?Q?ctzNiToFYhAwZ1goqANcVtJrmU1BpmCGIblJl1zSM7VRXgNwRvX9i/eFMzwW?=
 =?us-ascii?Q?L5ezgNaNHAw1V6b/ZpBDLW5OXA4HXT3Cob0RuIp9xlPc44qKizGr9hFp/dQL?=
 =?us-ascii?Q?28XMFNAUIjxsRRHE2C4+MgJ13KGFO6QKbQYpTGsdkztaam4G0xys+E1n9fcc?=
 =?us-ascii?Q?UC9hB+LznJW/+4HN4kwQR8QN5unDUjKr5oq7usSnqKlFJ7GZ/qifHrujLMBJ?=
 =?us-ascii?Q?bI6L9UiCC+L8AF6VXvm//JnXRp96hbJqBWkAYFdeXkY0zcALGTsO1WHgU23j?=
 =?us-ascii?Q?fgJrHQV0fIVos32E2nMjJFFtgdvs7n8uD+Umc2JeJDCCxXztA+mFAZvJcoG2?=
 =?us-ascii?Q?VA5Kh2PSf0DZ51MVR3EUbZ8tkd2Rr2Mbz64Pn8M12q8gn3QJoBIHBqdpGM5F?=
 =?us-ascii?Q?lKXuipUoGFjcfhaO/T5dM/wcWRu8Kh217DBnUfKc3vHpPWavOlemm0HpSXh5?=
 =?us-ascii?Q?4PMi5hYqqQqn7U+fHXSLURr+NPIX5Fh8SP63sHD4piPHfID6fLmN1oFnn1t9?=
 =?us-ascii?Q?kf9spzK5KDqbokxFep+RQPVo4vXLgi1i+N7+CjgWEpyLx79enEAo3XTIAjll?=
 =?us-ascii?Q?42ywVjyak6sOiHEM4Ueybx6MkMZWpgu9rXvLgPN1yiyLxGEEI9/Rz+zThnBD?=
 =?us-ascii?Q?RXBGJXJmaBezuRBytSSNPvlkhWHBYcZjg11LZmA/iMZqwYdfAQ1Gw6hSWGt1?=
 =?us-ascii?Q?YbGWscst1IgqAzGEJ3y3Szmg3RXcLnySheMhHFTfcEfeHxBKH5kxzvuCVxD0?=
 =?us-ascii?Q?Hl7SMd7krj34HOKlOvECgN/YUsMHDBqM2MjU37gfFdHZT63e4LVsGjzLWCcm?=
 =?us-ascii?Q?wRwrpDz9ilqSIsHOW6foFqW9mdpZ7L70jEQ/2Q6IRMuEkSe9Y+dbVv2p3N9Q?=
 =?us-ascii?Q?2g8lGtPdZ9JlY+wrPRxgMsHfV3oJX+Mb/9iNrxH3sRXOxkKPZfLCuzOUp1T2?=
 =?us-ascii?Q?/nJuNvw89LLbK2IonSnWY3cBmbCRFwoefMXBKmdrUdQ5Em/cBbxyt5wS1yCZ?=
 =?us-ascii?Q?o2v0Yw6uo7BTziqfeQGXWkLFscvF73WcLNSfDKVOqG8vyBPOly7QaYgI6qG7?=
 =?us-ascii?Q?cRKtaIM1Tfa1RzqLlKWnVE0id02aYrxNo/UOTgzkOTjGJLSBZFjEEytmyu/+?=
 =?us-ascii?Q?w/7/2VIjHzIjHHFcs3YuxEXQHbQUcMhYQbxCHIOfPtqUrzkB+5CR50rvVGaf?=
 =?us-ascii?Q?RVR+uohxbx/pc+zOLz2f5BIGqktNgcxSXqjV6qn1qwyY89gJt1Rs4IAbNnPK?=
 =?us-ascii?Q?FKR8RxvUTpgdWRdwb/5lOGyz2L/SskfhT2qsKvyo?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2d3320d-5bca-44a5-9dca-08db9a6eba36
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2023 13:27:36.3938
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BzOmHhPNGyWnJYaDQZzPtRtGGlOY3Iw8Vm/Wp5Z/BjcA1rFrS77gtndQp3e41c34R9ULOFJd6XXFhyASffcq9wbP19gyimFNWthMsEKR1xM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11975
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy Shevchenko,

> Subject: Re: [PATCH v7 0/4] Extend device_get_match_data() to struct
> bus_type
>=20
> On Thu, Aug 10, 2023 at 09:05:10AM +0000, Biju Das wrote:
> > > On Tue, 8 Aug 2023 15:18:52 +0300
> > > Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Mon, Aug 07, 2023 at 01:37:12PM -0700, Dmitry Torokhov wrote:
> > > > > On Mon, Aug 07, 2023 at 05:54:07PM +0300, Andy Shevchenko wrote:
>=20
> ...
>=20
> > > > > So in legacy ID lookup path we can safely assume that values
> > > > > below
> > > > > 4096 are scalars and return NULL from the new
> > > > > device_get_match_data(). This way current drivers using the
> > > > > values as indices or doing direct comparisons against them can
> > > > > continue doing manual look up and using them as they see fit.
> > > > > And we can
> > > convert the drivers at our leisure.
> > > >
> > > > It's a good idea, but I believe will be received as hack.
> > > > But why not to try? We indeed have an error pointers for the last
> > > > page and NULL (which is only up to 16 IIRC) and reserved space in
> > > > the first page. To be more robust I would check all enums that are
> > > > being used in I2C ID tables for maximum value and if that is less
> > > > than 16, use
> > > > ZERO_OR_NULL_PTR() instead of custom stuff.
> > > >
> > > See iio/adc/max1363 example that has 37ish.
> > >
> > > Could tidy that one up first and hopefully not find any others that
> > > are in subsystems not keen on the move away from enums.
> >
> > If there is no objection, I can fix this using i2c_get_match_data()
> > for
> > iio/adc/max1363 and device_match_data() will return ZERO_OR_NULL_PTR()
> > if max enum ID in the ID lookup table is less than 16. And the drivers
> > that use legacy ID's will fallback to ID lookup. So that there won't
> > be any regression.
>=20
> I'm good with this approach, but make sure you checked the whole kernel
> source tree for a such.

Checking against 16 is too short I guess??

drivers/iio/imu/inv_mpu6050/inv_mpu_iio.h has 18 enums.

/*device enum */
enum inv_devices {
	INV_MPU6050,
	INV_MPU6500,
	INV_MPU6515,
	INV_MPU6880,
	INV_MPU6000,
	INV_MPU9150,
	INV_MPU9250,
	INV_MPU9255,
	INV_ICM20608,
	INV_ICM20608D,
	INV_ICM20609,
	INV_ICM20689,
	INV_ICM20600,
	INV_ICM20602,
	INV_ICM20690,
	INV_IAM20680,
	INV_NUM_PARTS
};

The new helper function

+static bool i2c_is_client_uses_legacy_id_table(const struct i2c_driver *dr=
iver)
+{
+	const struct i2c_device_id *id =3D driver->id_table;
+	kernel_ulong_t max_val =3D 0;
+
+	if (!id)
+		return FALSE;
+
+	while (id->name[0]) {
+		if (id->driver_data > max_val)
+			max_val =3D id->driver_data;
+		id++;
+	}
+
+	return ZERO_OR_NULL_PTR(max_val);
+}
+

Cheers,
Biju
