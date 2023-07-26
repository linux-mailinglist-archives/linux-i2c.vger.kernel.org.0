Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23B4D762AD8
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jul 2023 07:33:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230270AbjGZFd3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jul 2023 01:33:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbjGZFd2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Jul 2023 01:33:28 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2118.outbound.protection.outlook.com [40.107.113.118])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AF4ECC;
        Tue, 25 Jul 2023 22:33:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IkWB0qNkiR2AG0VaTb4bjvFE+IIiuZ8Med9x6ReJhkGc2H/ioQWgoAJ7Y+jEQJSJTHTd33sN59VXoLadu7TrhE9bGk1UVRfEVxW/i23rC11tNt8VBDhtksPJJizTTkTsaAyIpKd2EQZh8Tv2FDdvmapq2xruks1lNw0XnLfxhXtSm055cWgIGCSNPt0FmvOjfarnA71DNhAJXRMSijbPZZQ5oqKAE42UGJeXaKqd3zT5paM0ZtnGv+e87ejt1KBei+wwzp2hlS2Rl3Xwe2GPwhb5LiAZWBcI9V75D1mhwMjUWw/x2j82cnzngkWV8g0tPsjEiCWpMlLzjGbUXyxKkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ecd8bZZeAHtFaSPiKncqwcFbTIZ2d6tmaOWnxcc1Cqc=;
 b=Bn80T6rb9aglXY+qnL+vqMeWtbSjlknKfuzNUBcR12ZUforqNl/XlqtLInv3p7yyEukcekOO0K1dDt7DQNbOd0PpemDGQ/9I7mLS53nQuYPzQ9shQsG6MqdmiZ4JeRVa+l+EUXni405UJKMFr7IJTDxXox9gX8vvc2tMlryvbIT40CXbnb0CMaAvZ479S0F30M7mys2FOV9QEpP+ax/Sl5FdEG7893ADpyY3VS58iZvf4mZmjJ+ug71QeEl8WJKFSykm5y/FrFuCJSMiIe4bNs1AVI4eWoZIuO5f9v+nRkHNqFFhgqJTAqP3Kxju0cNRK0a1WYFuEcHzzvN58KQj7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ecd8bZZeAHtFaSPiKncqwcFbTIZ2d6tmaOWnxcc1Cqc=;
 b=nKjUmltXKfAMNbrA6nJzmLUCepiBEEZe/RG2eFSII2xRJzdLvXFLr9BNthAuM74teivDQ8gJVf/+Krv0p0wotDHPUaqwjzRLEmsW4+MYDd7CHBNJx7YAGz868tbkj7Mc/60ONh88hweTw5Rj7+Alnae+dfikUt9SWMxhwISHpeg=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB9877.jpnprd01.prod.outlook.com (2603:1096:400:20f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 05:33:23 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::8f98:d64b:f092:766]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::8f98:d64b:f092:766%6]) with mapi id 15.20.6631.026; Wed, 26 Jul 2023
 05:33:19 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
Thread-Index: AQHZvUDtPDEdTtGE90+pXnIpqvMbOK/Iwy6AgAALZ0CAABSggIAABCvQgAAJyACAAAE0QIAALceAgAJqczA=
Date:   Wed, 26 Jul 2023 05:33:19 +0000
Message-ID: <OS0PR01MB5922A7BC5124A2E6173EF29B8600A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230723083721.35384-1-biju.das.jz@bp.renesas.com>
 <20230723083721.35384-2-biju.das.jz@bp.renesas.com>
 <ZL5bH10uJWDe2SPY@smile.fi.intel.com>
 <OS0PR01MB592287A0B91E353663FE12A68602A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZL51/dXKyDkcoDVJ@smile.fi.intel.com>
 <OS0PR01MB592289F163F05A61DFD019DF8602A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZL6BsM0NGhn2mc+6@smile.fi.intel.com>
 <TYCPR01MB5933A2EC98D3BF251C74A7AF8602A@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <ZL6pGRNvOfdYhhAs@google.com>
In-Reply-To: <ZL6pGRNvOfdYhhAs@google.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB9877:EE_
x-ms-office365-filtering-correlation-id: dd049757-b2c8-461f-34fa-08db8d99d1fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xvXbk3U6bSbs4YhHtNGyds+xzj9dWExOm4EYfNCo/TmlvpQvO9nhy0h9OuwogibZv9ikw5DnjQYjmDrY6MkA5hvq+brgi3hbPuZQR0Sff+4c7Hj3HQSq31EK1p+eHCR5em8pMC31J3308C6foibqeNYQQ9C6Wz7+DMSj3G7DBpHfKg8Hm/28KCjHTIbPSwyqpp0LI6aA0Z62VBbnYZ8wsSoV3N3ZrdM+OUspwu0mOcoRZiiDugeADZ8AcD592NqUj+GAoSBsCmiCa1+PhOeBnZMewnh0tz/iRRsI1Dwu4rSOapEJgpE+cM6bTI8v89isU5YKDvtto/SzdWJ0M2lufQMuboyLZUo49Rl8Ka7oyv41RnRaXVc95AibMANBFRq7ol1XPLgjCjCdoNkdX3WHwqel75kcrhx+S1JmBSvE1Dtk9dDBcbhVnBgul6EES0H9a5UoDWhPUDLpcAVUilaboekMQrkoW0SctoR15WCPj8gWdxKqkOG91dxqa2XsmFDm5r8WH3mx0YEarzhO8w2ZTRGIyU3+3diGyz3errOqelH+i0zNlymiqG1FnhKrU+AxDv90fV5QdBef64Q3WXEJm+cadzBWaIi/qh/0eAFqn2DfHzh5vQ5YX/piaQkKNvYI
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(366004)(376002)(136003)(451199021)(55016003)(71200400001)(54906003)(122000001)(7696005)(38100700002)(9686003)(478600001)(41300700001)(52536014)(5660300002)(66446008)(8936002)(8676002)(6916009)(66556008)(4326008)(66476007)(64756008)(66946007)(76116006)(316002)(186003)(83380400001)(6506007)(26005)(86362001)(33656002)(38070700005)(7416002)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oTWf+HBE8aRaAaDZiWkr+uX55dYDy/auV7M6tZ9FRGKeA7SgZZkUXaTp4LB8?=
 =?us-ascii?Q?1T1xd2jrn9OEHWeGFKsFtumdLC6lIeWxLSL+RjB6McYwT/NnrugeioshdFAX?=
 =?us-ascii?Q?M2GBfuXxUn8ooYmNx4SnXfW9cktq8laM/Hv5E6js6xBmi8YG9ADezcySGNJa?=
 =?us-ascii?Q?YRj1O0smBekXm+C4b+iNdCnrJMK1NCqFSGbiwDCHS6AxMV/rZudH6p9vaCYd?=
 =?us-ascii?Q?NGNCIMI7tmW+19PTALH2UUXAHge39mhJvYuFL9+FcN8B5kI9TW1qmrHiL1OE?=
 =?us-ascii?Q?1iBZxZC8WG1tgI73EA+hlrA9QgtOTcrG0I0Xz8lKXzSE3lDJRY3nV/nI8HjM?=
 =?us-ascii?Q?2Y679Q3LDvfXM67Zb8shOSyTUX851HeTgRUuYRBO0Ug4WJkN+0oIcxJVh0b5?=
 =?us-ascii?Q?f6K/MVa82P3NGdgMWXvCQuwnp8B6ORMRD1LRnl6VxUyvO9wGFQlKqW5Vdn8N?=
 =?us-ascii?Q?fCl32nQyo2KNM//3FjzQDI+N4/G5/dQrCMZdgG8hQ7Elh+a87H/qKoJdl42N?=
 =?us-ascii?Q?TtYpIJag5ZYIJtlP8pQQGIvl4Qa5SkGZl5b6T7SK+OjXYm0MNyCIgUJrKptl?=
 =?us-ascii?Q?iC3sZZrODeWrpDoHHKoSVOuBWrmvt6D4Jbtso3QPGorKcoSeVeJqmFNb4gFz?=
 =?us-ascii?Q?I3b8GBWKVGnn/F1vOeKqhOzMTjy5m+P+zz39jJVMLJTQ++809TKZfazFJMVf?=
 =?us-ascii?Q?EbKRGMJmMnJbDG3hQiBRT9PrrTjEvLHQHHZOaSh5RzCZRStN+SVv7qrLNCR/?=
 =?us-ascii?Q?/Heq3yQ54SxE3c7VVN2sHz5l2g3o6ItHHQIom5f6OD4zCcazpdYm77VOWWRi?=
 =?us-ascii?Q?a2RRQEghlsVPRAlXHWIWXjFwwWau3qxK+wVu0JbDvDmk+hEPlcTBSpu7lB5Q?=
 =?us-ascii?Q?o3YMUOTdodIsJ9p0kOvxGKLtcptA2P8oeofM8Ea4zbDkCndSb5moVmOFVKrH?=
 =?us-ascii?Q?9TeZzXEJJoe213fDjI9AO5mvghG4vf+8YWlUZOBNSJMkAZD5dF3XFvdPBFKX?=
 =?us-ascii?Q?9CCcXIbxt/1uTyigKWRyfLwBdf2q/EWLSncqY1ZaAFxIlAXL6XUT9mHxOlb7?=
 =?us-ascii?Q?xY4eBkjpVKB+KZKSWl8b4nPeWi+Zm0s9amXB6kcOihJY0VfGTTReiY+RrC4P?=
 =?us-ascii?Q?8+A1BRCvZQIUBn3iY12aPubCXp8GSvY8lXU9e0YLDyGb9GI7LQmynor+sNgI?=
 =?us-ascii?Q?sczH+/iB2bWcxugyCbEswAquvGuPHH474Nxe+vqmrBIatQzS7Mpsrx1tAXC1?=
 =?us-ascii?Q?rLI+a0uGmGO9YsuiT/NE8gIF0he53rdYqvAA2N6kwh5rE1ijcSju2sIaJc4K?=
 =?us-ascii?Q?dvIq3DtWdiBPQQk/vzzdcpMJepKWbM4lWBeJh5eNq9t58Hb0fj8Y68q1wb5P?=
 =?us-ascii?Q?0kajcWDnE/eqpZ3q7j9cXQmcYeqTw6dU324gUpeyOvqq51Z1bOCk+vNCrWlM?=
 =?us-ascii?Q?O2ak+zV2rijQGfvb0Y93i5DGK/svoBFq5NxkjjUmwuEb4G/14X0ZtIdajIkm?=
 =?us-ascii?Q?npFZaRNhwQRccskSLMfzfFuFEuxcy0CyS2mIE3/yj6awNBVZMAzIN1cfmJIi?=
 =?us-ascii?Q?mL0mmeYzZu/ejmSXka7W/kACnhM+Y0yWAJxARtRh?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd049757-b2c8-461f-34fa-08db8d99d1fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2023 05:33:19.5016
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ds5C0NsXL53Ii5G13SkTsdizlhkoKbqdZZpxtAgJF5YV1JrTP83rx6WOAs721bGAcwZoIbtzezi1ictqF2BMNJVoUAMjTZJRrE9rhRAVDp8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9877
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> Subject: Re: [PATCH RFC 1/2] drivers: fwnode: Extend
> device_get_match_data() to struct bus_type
>=20
> On Mon, Jul 24, 2023 at 01:58:55PM +0000, Biju Das wrote:
> > Hi Andy,
> >
> > Thanks for the feedback.
> >
> > > Subject: Re: [PATCH RFC 1/2] drivers: fwnode: Extend
> > > device_get_match_data() to struct bus_type
> > >
> > > On Mon, Jul 24, 2023 at 01:19:02PM +0000, Biju Das wrote:
> > > > > Subject: Re: [PATCH RFC 1/2] drivers: fwnode: Extend
> > > > > device_get_match_data() to struct bus_type On Mon, Jul 24, 2023
> > > > > at 12:02:27PM +0000, Biju Das wrote:
> > > > > > > Subject: Re: [PATCH RFC 1/2] drivers: fwnode: Extend
> > > > > > > device_get_match_data() to struct bus_type On Sun, Jul 23,
> > > > > > > 2023 at 09:37:20AM +0100, Biju Das wrote:
> > >
> > > ...
> > >
> > > > > > > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > > > > >
> > > > > > > You can't just throw one's SoB tag without clear
> > > > > > > understanding what's going on here (either wrong authorship
> > > > > > > or missing Co-developed-by or...?).
> > > > > >
> > > > > > Dmitry feels instead of having separate bus based match_data()
> > > > > > like i2c_get_match_data[2] and spi_get_device_match_data[3],
> > > > > > it is better to have a generic approach like a single API
> > > > > > device_get_match_data() for getting match_data for
> > > > > > OF/ACPI/I2C/SPI
> > > tables.
> > > > > >
> > > > > > So, he came with a proposal and shared some code here[1].
> > > > >
> > > > > Yes, I'm pretty much following the discussion.
> > > > >
> > > > > > Since,I have send this patch, I put my signed -off.
> > > > >
> > > > > I'm not talking about this. There is no evidence that Dmitry
> > > > > gives you any approval to use or clear SoB tag. Again, you may
> > > > > not do like
> > > this.
> > > >
> > > > Here Dmitry is acknowledging, he is ok with the patch I posted.
> > > >
> > >
> > > No, you just misinterpreted his message.
> > >
> >
> > Dmitry,
> >
> > As you are the author of code, either you post a patch or provide your
> SoB as per the guideline mentioned here to avoid confusion.
> >
> >
> It was not really proper patch, consider it as an email with parts
> written in unified diff, as sometimes it is easier than to explain in
> words, and I do not want to take much credit for it.
>=20
> If you wish you can put "Suggested-by" for me, or just drop my name off
> the patch description altogether.

Sure, will add Suggested-by tag.

Cheers,
Biju
