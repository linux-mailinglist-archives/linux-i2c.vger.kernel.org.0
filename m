Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A41F75F914
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jul 2023 15:59:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229867AbjGXN7D (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jul 2023 09:59:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229798AbjGXN7C (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Jul 2023 09:59:02 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2104.outbound.protection.outlook.com [40.107.113.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BAE1133;
        Mon, 24 Jul 2023 06:59:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UKjdAeKrN+1PgGoCjkZpt5h6wFXzvlAEjuOACNZeDtfJlGFkmrkqUe3lKDSglTGCOuEeI9dWWU7s6SZPVIyHPg3IZrfTezntYHI/5B5DJuhNH686s3J8Pf7Fz4cphgINzNztCKMQKVYNDMIVIdS4K3P5brbCZ9kiHI0Hmvjrf4AKZW7D8HgAOCYFQb1G1VabV73d2vhPBDXBs46h38JhbDp0kDmctcVI6FdMXQj0IjmniL/+tGkU8Jetc4pqYAN96djIQ65XHLY22mFvX+7KFWE3vNsAajzT1JKBVJKnmZJDBq1CLn3M2HRPO9sks2CzOTVtquL7EcC2rINSUwYOjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JzSkWnqKv/DDF64HW+Ni/vfaZ4/PxPP0ILG9ru+Z/Gw=;
 b=UyktTb7GRYuvg4DyW4iJR6gIocEj4ArtE8HEuEgxMWzQzKe7+ulJCQnTgsthX/EEXd3UmmuenBnURoZWzH3B/WAT/D0vOTPeRoLEEGuzwMrIG31gAWUBeFxu/61tVDtN1xmpyFCQFODcdQtbs7lJ2undexv33EuTcMasXOCVILJ31HCwxYCS4xBScEn+cU7puIt2uuloksW4WuVsnGVcRNZol2NonCHQhtzMX5S8Y2acrz1d70Uab6niCcboYnQb8Ev3+2dAQ06m2IZBzrhqcXfKzzblVda+LKx2BXErsbpjH8ougrkXXrTek0updPIUOJgiAAthxBQJrKEwElcFXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JzSkWnqKv/DDF64HW+Ni/vfaZ4/PxPP0ILG9ru+Z/Gw=;
 b=Mie+MkYu5nzdL+HhX3ZLQuJFFFlRV5+YuAC7AB4QUQl8U3qTtLxrEWI/m1iytJLM9hjlqXI0sM+oMAoGWfj/p8U+hgwdo57omZOO+6vF9E/rvQmJkx6ipDOTSsPji9LQDdzJUExDVMcP10TJC9asaGFkpzKWCRmkwiKldZNdC/w=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by TYAPR01MB5852.jpnprd01.prod.outlook.com (2603:1096:404:8053::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Mon, 24 Jul
 2023 13:58:55 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::ef83:ef86:806d:6558]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::ef83:ef86:806d:6558%7]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 13:58:55 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH RFC 1/2] drivers: fwnode: Extend device_get_match_data()
 to struct bus_type
Thread-Topic: [PATCH RFC 1/2] drivers: fwnode: Extend device_get_match_data()
 to struct bus_type
Thread-Index: AQHZvUDtPDEdTtGE90+pXnIpqvMbOK/Iwy6AgAALZ0CAABSggIAABCvQgAAJyACAAAE0QA==
Date:   Mon, 24 Jul 2023 13:58:55 +0000
Message-ID: <TYCPR01MB5933A2EC98D3BF251C74A7AF8602A@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20230723083721.35384-1-biju.das.jz@bp.renesas.com>
 <20230723083721.35384-2-biju.das.jz@bp.renesas.com>
 <ZL5bH10uJWDe2SPY@smile.fi.intel.com>
 <OS0PR01MB592287A0B91E353663FE12A68602A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZL51/dXKyDkcoDVJ@smile.fi.intel.com>
 <OS0PR01MB592289F163F05A61DFD019DF8602A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZL6BsM0NGhn2mc+6@smile.fi.intel.com>
In-Reply-To: <ZL6BsM0NGhn2mc+6@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB5933:EE_|TYAPR01MB5852:EE_
x-ms-office365-filtering-correlation-id: 8dc69a86-aabd-4c51-dbf9-08db8c4e1ec5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Pig5PpjD1pnReWyf7cGCu4B4e+Q6S/Bjwup/xwyKdRh0/1zU1Xr8sBwQHabQgurAm0s5aRwTWdyFJKmXnAu+pgvlN2nvBJr5fe1nnsjcSXtYFqa1DmQsSHI3QGSH7nHrcaIMKtwAjDPdeis9O/gXVLcuokzmaYHi+Mvbr1h3UcD+3CICB1H93rCpFmyX/MuKU/Nu6svTzwI/fKZjmm0Py6MgaQpj9B8EC0MTaHV6enY7c0PpLIJY8v+c8yFy6h5cRDbMohHYLIty3dNy2anoLKQtybJM7ZR7QjUCHbQjmAwqcqjRadaDFit8eyhNB56kwQi+7hJheLBG9sO/v2pN8C3i7XMx81VS6x6f/kr51/KBlpD6YaPlD7/pe53UVfOCT3oQjLmDRDf5nHGbQUs/ODXyfvxmZdDWnBXUNYN69lv5nKSyHUu62QNi0IJmXl/YdRuUrvTwBE+D1v/jaPQJkON/Cu66SZqBGOMhoJbk1OoWg5V0xUXFgwKIXRX33Qv7QTRVkMjfC1WfTSHREL2ShWaDZw9wYTayi/y9tebwM0Ew0w8SiLCnPQM86taRSOFy14kL/byfbJeUekLJPDA/7xV75Btawx66MMG+84eRaMqEyvLlsSMiLqqC8eBHKfi7f4MwRdLI7pWzITDCCCHFEA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5933.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199021)(38100700002)(122000001)(55016003)(83380400001)(7416002)(8676002)(110136005)(8936002)(5660300002)(52536014)(966005)(478600001)(64756008)(54906003)(66556008)(66476007)(66446008)(316002)(4326008)(76116006)(66946007)(41300700001)(186003)(26005)(6506007)(71200400001)(2906002)(9686003)(7696005)(33656002)(38070700005)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yG8Sv2MWuYXCN0NM9Ub3PEaMpilrO5+efFFborJ3WmpeKekANcjc3VNDmAq7?=
 =?us-ascii?Q?4wNe1XjuZgIbf80fDN1iv978hsHupNCd2Kg94W6nGEgWpx2FBLVCs4u3f0kx?=
 =?us-ascii?Q?8myD7hXZP3+cp91MG/7rtsS0Myb0KguKneHQs3m545eD9pDe2cPTYPCuuXYb?=
 =?us-ascii?Q?CXLsESA7Bj/T0aqd1yWvKJ8+eXrsE1GQlxjiUnYcnRkctEOcDUKiwVaLpHD2?=
 =?us-ascii?Q?YeAiV6RnJ/IkqlKYbAQwJi9emaivAMktkFRTq7WnqhF5As7uYS1cAGVsb/1N?=
 =?us-ascii?Q?aMf61PQo/QGqKdxfg8TBqJR5tRvlFOKxt+ZDGrKGUFHCCuvV7LbolwSdmvkx?=
 =?us-ascii?Q?hj1e1FVe3h3VkciAwdXvzRSR79fXFfOdcEYCLl1rWQkuFI6W0GBw5nOAwMiP?=
 =?us-ascii?Q?Pq0+lS5x18nUGMVjjkNxZF9cS8S1d5ABx40Dsi6fKU2CkvQ3iflUS/xBEigL?=
 =?us-ascii?Q?l9a0XjTTwg/CrlSSYNVBgVj+ueWhm7spxPHPRkV+mhVDrF21NkqfZelSosBn?=
 =?us-ascii?Q?NOf9/+j4+/Rbvul1UFMX8qGWOnUZ3cscFEOtSLflT2s9sLKxKdp+FWkbFn1i?=
 =?us-ascii?Q?6dHN/sITXUxklSY3zEMe8LS55TNfQLpASi2mEtYAONrx7W6tsIL51IL8eweZ?=
 =?us-ascii?Q?eMIfTC+2ieXl8bfu223QXX+0Eg5XqQSjLZN5yIEDPc/C/ogovFmlr5v056F8?=
 =?us-ascii?Q?VPOVAY5IFAYkucG9oUmzTy6wYpgYXMHkoU0OoENW1byKJc58xC4jRqYBNBj9?=
 =?us-ascii?Q?Jo0JKPOVEoW0i7r88LbAtsW+bnbqTHzQtmc5uSxRQTAnkr+oFw+l7ZcwAoDi?=
 =?us-ascii?Q?3/nicyav5ymHS9SRwAyfwUYWIYbGk702rRjYLfjhTSwbduCN3fJ2AJj/CCcl?=
 =?us-ascii?Q?LsHuJkFp3YEbY2yVV92+EcxI/gj1gp/tjN5O6r5dxs7SKRbSwu4fBnF24i48?=
 =?us-ascii?Q?Or9AypmOHRAf8v2Cr2CVvE+qJG/0ipAzT6tgKLowIXL5b+otkGv5tBiiGmT8?=
 =?us-ascii?Q?vheT7qgAvUAVsdGtDl7HlgkI9EEaOXubJQ0I+EabrnLRtGbcU+xQzuPGx1+c?=
 =?us-ascii?Q?XmuzJ0t1QM4AiXFH4L2ypNw/gBZOZXy3TK6aOcuxGdYaLCD5wIOaVkivsEP2?=
 =?us-ascii?Q?2yP0HO5J25B1W78zmuysERXAFds2mNsWH/fOi4idH9piYY+WmYk4tnRtO5Vp?=
 =?us-ascii?Q?UqgRwU9mX8KC0+QZBCmvVQNvno2LivWwxYgV3Yviionnod6YiezJlWXcjBiV?=
 =?us-ascii?Q?viaBWLWdPgZUeCCPmqm5VaZ2Yp96a2/h9uRn5MN4djzI8hhjnl+QEUMt6sHS?=
 =?us-ascii?Q?4b7qhdfx6W/eJEYJxzjtgPBpn3aNSqem5qrUi/g2+gdF0CXak1CgFr2dfCXc?=
 =?us-ascii?Q?QJbYF+a50J4k23igahlIUKIx5TZ8BLc790XAkZ+fTvV71+jC48FnyVg4PbBU?=
 =?us-ascii?Q?ZK9D3VH3vB/jS1ZevVfTO1H6SnTfy1EmjRxiDjnUjkTp8wb1gQe9D5WcIGET?=
 =?us-ascii?Q?ivhZPEOu2UuPys0AVb0cZE6MnDOktHpZm1Wg4mZnCnDa6kTWH/FK3eOlhz5U?=
 =?us-ascii?Q?pr9uQapRKvbvWNcWvw8x6F0tRDDnXAdNQC7DwwwK7hcKHKwA6WHh2eIMPzYX?=
 =?us-ascii?Q?4w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dc69a86-aabd-4c51-dbf9-08db8c4e1ec5
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2023 13:58:55.4318
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ljvb3j715oxrJLelR1b0lm3aVYfY3BgP2iE3c0up4z7WFYraiu5Fiw7AyeDQA5E40BXUNVITe33l7AiTEec14sIXeVJ+RR4K7IBDZG+GyUQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5852
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

Thanks for the feedback.

> Subject: Re: [PATCH RFC 1/2] drivers: fwnode: Extend
> device_get_match_data() to struct bus_type
>=20
> On Mon, Jul 24, 2023 at 01:19:02PM +0000, Biju Das wrote:
> > > Subject: Re: [PATCH RFC 1/2] drivers: fwnode: Extend
> > > device_get_match_data() to struct bus_type On Mon, Jul 24, 2023 at
> > > 12:02:27PM +0000, Biju Das wrote:
> > > > > Subject: Re: [PATCH RFC 1/2] drivers: fwnode: Extend
> > > > > device_get_match_data() to struct bus_type On Sun, Jul 23, 2023
> > > > > at 09:37:20AM +0100, Biju Das wrote:
>=20
> ...
>=20
> > > > > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > > >
> > > > > You can't just throw one's SoB tag without clear understanding
> > > > > what's going on here (either wrong authorship or missing
> > > > > Co-developed-by or...?).
> > > >
> > > > Dmitry feels instead of having separate bus based match_data()
> > > > like i2c_get_match_data[2] and spi_get_device_match_data[3], it is
> > > > better to have a generic approach like a single API
> > > > device_get_match_data() for getting match_data for OF/ACPI/I2C/SPI
> tables.
> > > >
> > > > So, he came with a proposal and shared some code here[1].
> > >
> > > Yes, I'm pretty much following the discussion.
> > >
> > > > Since,I have send this patch, I put my signed -off.
> > >
> > > I'm not talking about this. There is no evidence that Dmitry gives
> > > you any approval to use or clear SoB tag. Again, you may not do like
> this.
> >
> > Here Dmitry is acknowledging, he is ok with the patch I posted.
> >
>=20
> No, you just misinterpreted his message.
>=20

Dmitry,

As you are the author of code, either you post a patch or provide your SoB =
as per the guideline mentioned here to avoid confusion.

 https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sig=
n-your-work-the-developer-s-certificate-of-origin

Cheers,
Biju
