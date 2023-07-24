Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D305875F815
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jul 2023 15:19:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230200AbjGXNTK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jul 2023 09:19:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230076AbjGXNTJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Jul 2023 09:19:09 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2138.outbound.protection.outlook.com [40.107.113.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB271DA;
        Mon, 24 Jul 2023 06:19:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GzhoEf5WeRj2KKSkNFKMUT8sr9ZMXtKxxZhujVOK/o2ilA0pxRhVgwsXUpozZnaG/JHLoc2Xf2BZORCMw3HGnadxqvNIi9XeC+cdy4r4W/rCqBFlg3TO7t+WdhxuDkAuYc0g0ueFuXmXfzkXrHLv3X3lNne1DftyuG1hasiBRQNf6eZ8WtgTlh26k3q9Qt6zeE7YY8L7hEPmTXtkudokjsV2w29St2XilwZIFGHZpiYDTFiM/sTF/vEvsy0wvFGeRWQuQvphmgWBsTOxPFwtl+iEN7pqaabsaCOMkPhxJwoIf16DHFKL1OWX5cQEnPhN+jJ5zSR3IAHmyPekx5wCcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zZlA/EDvRzWC88r98Wef9V+abQe3K3iS9NlqYaoTwOE=;
 b=lNt4fDS/AxUAPMphDiNrZPT3xBuKzZL7S6H+VwTm6pcGxIdr/g4HmQ9tnQyghuCg+GEkmTO/C0LQzJouNHRFtO7qVafzVl7J9z768UuMmoOAetotp+QXxe1B8CE8yGwIU3MF+/kY4ajh5zS14CqAdnHFZCeeIMgPRKXzDrA1dlgfnB+1n0uc5TrXHnAdukxa7TvtpqvacSfbJ8xCPq5qHNvsE57gRA0gWei5FPlT1JsdVMBhJwvMb76HR93wzucR5xoqLzwigj4es/v1yf/lZzDnSLru9hS5SpkX0u4rTvgLcsuqO1vEt0QZRWKKx7HlggANig/NWh41zu4nZ4HYNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zZlA/EDvRzWC88r98Wef9V+abQe3K3iS9NlqYaoTwOE=;
 b=eB9ZYTv75vRL2xb76ZVKlBhE39S0Nk2hMzTC8LqSpHrRxJbDcov1J66JLwzuyYSvLiurhrA5H2M1F3EfrahseBT0UWM0naOwlsipTmMGs1qdjUcxEYl9d0MBQ17gQ172QrPzFdnrFuH1n+gz8zLQ6f5cqOnm9X4+iB5pQwJ4zLo=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB5936.jpnprd01.prod.outlook.com (2603:1096:400:42::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 13:19:02 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::834b:28df:28dc:7f95]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::834b:28df:28dc:7f95%7]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 13:19:02 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Thread-Index: AQHZvUDtPDEdTtGE90+pXnIpqvMbOK/Iwy6AgAALZ0CAABSggIAABCvQ
Date:   Mon, 24 Jul 2023 13:19:02 +0000
Message-ID: <OS0PR01MB592289F163F05A61DFD019DF8602A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230723083721.35384-1-biju.das.jz@bp.renesas.com>
 <20230723083721.35384-2-biju.das.jz@bp.renesas.com>
 <ZL5bH10uJWDe2SPY@smile.fi.intel.com>
 <OS0PR01MB592287A0B91E353663FE12A68602A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZL51/dXKyDkcoDVJ@smile.fi.intel.com>
In-Reply-To: <ZL51/dXKyDkcoDVJ@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB5936:EE_
x-ms-office365-filtering-correlation-id: 41f5a6ca-4719-41e6-d9f1-08db8c488c4d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yqzn6yuO4SEGMkcrVcW8bLeKncaU4ZlD6bd3lNAEos/FbBI+ss+gvuL7OmMb2jh5AdOasC2s6MEwEYvp8ABW4KQk1OXExFdl784BwX/GPuTxOSds6r9b/U248cME+RiqwPNBDX9rZZRkGlZSGdEddZpLnGe1l5xKQ8i8oJVAC01dUnneUNJmDTzEQoXKmG38igDgJ8mRAVi7OT9Lj2cMfstXFs6mDP++FWc2f7DTQficS4sK+doX7ix6/AK3yy0oF+UX+ui/qGq9RvUfaOeJ+CSG42hnmOHWxIgle24CRdAZBnAxk7BRfXw1WmvF8wbAfls54lPsspIa1gPTa8eE/vvA0Wr1Pbz/rRRubYLbFt8FXSiUc75xOFmM6SRPq7vYCgQo6SDNcoR+BtEYDcIq9lpO19fLZcCANvdrICjMeisOrd5neIJpqk+dU2D1wz57SKIvMAMagerJw07AJlhHtJ//uFrbEQqQwp9unqJVuP1TddAApy2PfJ7L+0A1iVa6Gu9LtUPJiWaJv2qZhwVqma93KIbziPvFV71K+g1RCOtSl0yT90vBJWVkTUa0CS7iTdh4pnoDq7gKYgprpSFm3Yir93mQOBJxIP0v/71pwzQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(136003)(366004)(346002)(396003)(451199021)(2906002)(55016003)(478600001)(38100700002)(71200400001)(966005)(122000001)(9686003)(186003)(6506007)(26005)(52536014)(86362001)(5660300002)(8936002)(38070700005)(7416002)(33656002)(7696005)(4326008)(64756008)(66446008)(6916009)(8676002)(76116006)(66946007)(66556008)(66476007)(41300700001)(316002)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dQu1WIvCBWBK0vMdh/3jynZXVkfSv/lubJXNyuReHLYTTuDjStJUTt4xR+xc?=
 =?us-ascii?Q?sqQTvKtnAu8Vnr1mblYgnIuGoklWU7Bo91RHdvGOU6tkQVCHUDK3zevwii/I?=
 =?us-ascii?Q?KEHsoHSye++B6t2JWF8XMoU+aue7fb2N+PqzlnrA9YZoOU3glA5EGBtoTyIV?=
 =?us-ascii?Q?TatAJrpwXTainpQPGyGY02VaJiQ8zhIJ3lrAT52fMonkDs5kB8dp8le/f5o1?=
 =?us-ascii?Q?EjYCqTNrfJmj1SZV4c3sXBV/tiJcy6pA+QleC0xL7tUtqcMbblPdogdseH7Y?=
 =?us-ascii?Q?/iI3RHr39Q7nfRWpcUp9/sL0HoRQYAHK/UhtmmDC508tJ/aueu17zMYYDJOm?=
 =?us-ascii?Q?AbY7DIBBcelQ+fRvg+IjRTNonzLUpeV6NpCNeGbMyerudCfXDhW5x/thx0U6?=
 =?us-ascii?Q?1GHYa5Jgu73sRCqsbq006WoPd6DwvKkCx6MvIhThGbeZb657sD9Y6vvFuQGe?=
 =?us-ascii?Q?Us8X9bvV0QQ+/70hdQ/RzSjS1OEvrOvvM1HZCwR2LT0+kG7wSl3Vujjv5kka?=
 =?us-ascii?Q?t/ELnFFchmaQcdCyazj9DWuZJUgFE8W3qFSeJEx4P/pAGsQgM69TEx/0qZav?=
 =?us-ascii?Q?fJamReLKH7YOqvj030unoRHpJ5vdRllxndZet0yX95+QruaImJ07JtIygHwy?=
 =?us-ascii?Q?+7kYNBcCXhIrpin//M/E/lvmX91yQNQVZRzs3bgJi60PY10ZICL1FTes+BSN?=
 =?us-ascii?Q?US8gLAFi6Q6k7BFTtRrW6sZg4iiFOW64nkMSFQmvoRT0BngGK6SzSWouwXfp?=
 =?us-ascii?Q?yU6IDdCmhJm2jdIT8LoERt1Kw6cx42S86dZk9vdRC1IwtV17kIgndMpXKFvz?=
 =?us-ascii?Q?4NtGdqBzMWPB/Tv42xiDyWKuj17bc40EafALmVI20Zc48fjyYgtFGeeXyA6C?=
 =?us-ascii?Q?jxZqUeMuXGl05e4EmEXGIJQupEqs2uS5e1qq7nJXzxN+h3NfiCf4rhCXb6lL?=
 =?us-ascii?Q?hPtvda7voN6tRy2Sx1cjzYK5Mmcg+zxbXndsqAknVxyH3+znObpUufvcPvJE?=
 =?us-ascii?Q?Ib5q2ifhYA2Hj4Oy41C6ghAtsYS/ciYG7mkbY/SAoihteiZ8ncjXigs6NOKz?=
 =?us-ascii?Q?+f5mHrtzNtcAwx8BaNFtmHgC3vhQGGrNsgYUNQ4a2nMf6pnGzZg3Pg2eJ4xP?=
 =?us-ascii?Q?wxCiYniNAqfqyRoT6JmFYahL16mmbpYxe07c1pkb0IZOYjErrRqA1bjBQC8X?=
 =?us-ascii?Q?vAIjkeyyPt++C5cmtLjOev9b7qqpvs/Wc4xrVQB1GiQ8Z6mScRsSK+KY4pyY?=
 =?us-ascii?Q?qjwAauJI1mbvNMVug6uS0KUBpQBUTEqH3Ius7BT2kA+7YXiU27zBFfvEltzo?=
 =?us-ascii?Q?PdGtkS2QN6grgooUEMyzgBDwEZWf/DvOm/xxpvBob+iW4F8PUSam+Zybdjze?=
 =?us-ascii?Q?BcMGs9BZlwu/ZHhf8UeKobNc/g9eqRjovQ1HIpvepyNFYtLKDRX1erYDJdoJ?=
 =?us-ascii?Q?qg6n0TTX5/n3S6OnQWRYZmQTMLoVTBR6zidcfr1GzgSo5ERj/KwU6vc3Ktra?=
 =?us-ascii?Q?RTlKXR2/tcuwW8ax3bm+KEjBHjooRATdPbTUOcbioeGP0xZTGQz2VcEpGJJT?=
 =?us-ascii?Q?RJBEBmbNH5+a9cWAaIQAQxlxx/iOuMdpgW2y/Brh?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41f5a6ca-4719-41e6-d9f1-08db8c488c4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2023 13:19:02.2330
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8SkQSDzGzua5fX7kkBsYMQs52+589yN6FNAg50An10AzOkHvUzUfRvSyXo0TvfrWrh+Y2YI4OabmDbrtCETFBSdEkTlERHieJmgEODPv+38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5936
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
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
> On Mon, Jul 24, 2023 at 12:02:27PM +0000, Biju Das wrote:
> > > Subject: Re: [PATCH RFC 1/2] drivers: fwnode: Extend
> > > device_get_match_data() to struct bus_type On Sun, Jul 23, 2023 at
> > > 09:37:20AM +0100, Biju Das wrote:
>=20
> ...
>=20
> > > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > >
> > > You can't just throw one's SoB tag without clear understanding
> > > what's going on here (either wrong authorship or missing
> > > Co-developed-by or...?).
> >
> > Dmitry feels instead of having separate bus based match_data() like
> > i2c_get_match_data[2] and spi_get_device_match_data[3], it is better
> > to have a generic approach like a single API device_get_match_data()
> > for getting match_data for OF/ACPI/I2C/SPI tables.
> >
> > So, he came with a proposal and shared some code here[1].
>=20
> Yes, I'm pretty much following the discussion.
>=20
> > Since,I have send this patch, I put my signed -off.
>=20
> I'm not talking about this. There is no evidence that Dmitry gives you
> any approval to use or clear SoB tag. Again, you may not do like this.

Here Dmitry is acknowledging, he is ok with the patch I posted.

https://patchwork.kernel.org/project/linux-renesas-soc/patch/20230717131756=
.240645-2-biju.das.jz@bp.renesas.com/#25437032

Cheers,
Biju


