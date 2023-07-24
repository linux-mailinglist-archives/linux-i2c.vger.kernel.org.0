Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EDAA75F8A6
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jul 2023 15:42:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231716AbjGXNiP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jul 2023 09:38:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231627AbjGXNhm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Jul 2023 09:37:42 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2071d.outbound.protection.outlook.com [IPv6:2a01:111:f403:700c::71d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4FBC359C;
        Mon, 24 Jul 2023 06:36:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fik5WPKwZL7JmhmmjGqSTe1cQhOgmNmxuvTG57v3AuUGK1wDhROrmKvMh4H966BPA8XA+dd1iH3Z3OmHuyCzGDADEwSO9Ks/CxRIiO//YxF4GEOzESudo/jvC5ZWusLbAOjvMM2MFhAMg2G/19BgZK227J5tq6ho7ay/CzsGyBhbEMfIa+oOKTgdejF5NfbW4JvEPDszJiqVVTJXov/G/08XMNobjWYksbcaMVXnTn03uh60mVgVlddv9oWuZSIjJVPcTDzxj6fGsrL+1uPW+2hp4Zlw6Y4kAxuBNgip22rg89U9uKQjOtoEKJpUyp+8taHFGCf/Laknp+GaHFmCPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=opkrU2jKm/vFChg/IbWXieZe3VR/aWry5tYKXRlpiLY=;
 b=QWFig+2emsvX2z3EeWoitPcRQcQipW9Elns5mAWbOf8gGk3W1LkM1LMG0kvIhQFAbdfiU881Ga2qGLDuJVpxHjp425hNZ4Lz1IP5emIvFeB1IWT8aCYf08H2rpBig3DgcQIp6fSTyZi3ldXE+OAsIos8KfqjdUfXf5qyUAWTmrkF79lMHoWWjwkAy1u6W/iNAsFsAxbBUn1ftoYbi+JkN57rgWmuw89yDEZrbBBvEhc+XOlAXNkWeqxzf7SEmPC85ZHWHXI61/omKZCVKgJsZxDAhcBRoVav+IhjomwDkEStmnCTksu1yWS54LUGcH+wbiIWbACGBAYWTuRnCPpmRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=opkrU2jKm/vFChg/IbWXieZe3VR/aWry5tYKXRlpiLY=;
 b=aNyUpAsvMNXfuDIQhKK3GpkyYrJndU8et+aZZHtSOZPU19SmR3uHnEC8UfYT01AH4JrY+ws2MlRdPKWnY2cu5YbI1BCPXzvoAoolzPMQq8zhNDIijFZUedBdKpCeslupRSIq0MQg2DKIVpgntJQAASlvyBe67XrhshUYKELRYBo=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by OS0PR01MB5443.jpnprd01.prod.outlook.com (2603:1096:604:a1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 13:35:33 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::ef83:ef86:806d:6558]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::ef83:ef86:806d:6558%7]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 13:35:33 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH RFC 1/2] drivers: fwnode: Extend device_get_match_data()
 to struct bus_type
Thread-Topic: [PATCH RFC 1/2] drivers: fwnode: Extend device_get_match_data()
 to struct bus_type
Thread-Index: AQHZvUDtPDEdTtGE90+pXnIpqvMbOK/Iwy6AgAAAaYCAAAfyUIAAFskAgAAKWoA=
Date:   Mon, 24 Jul 2023 13:35:33 +0000
Message-ID: <TYCPR01MB59338ED151BB2E1C973D8C068602A@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20230723083721.35384-1-biju.das.jz@bp.renesas.com>
 <20230723083721.35384-2-biju.das.jz@bp.renesas.com>
 <ZL5bH10uJWDe2SPY@smile.fi.intel.com> <ZL5bdwRo8CFUa5QX@smile.fi.intel.com>
 <OS0PR01MB59224593D634B3E1AC7BDF808602A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZL51PiWaYpn0VTa4@smile.fi.intel.com>
In-Reply-To: <ZL51PiWaYpn0VTa4@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB5933:EE_|OS0PR01MB5443:EE_
x-ms-office365-filtering-correlation-id: 42633a28-a8fd-477d-afe9-08db8c4adb05
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o7ISFHUrNVrJ6t5s5lwvihMMJgaw8BHQItayCuYFNsglr5RVdNeCXliG9lDUfDxdlN/j3OtBejnA5JI3Uf5K4w7wpSWJlzGQ0VclKFtxMgKnK7IRF5SZXfdXi1Cn31Hm4H0pJbICADymHrnBZTVnfuOTzRbeRbUjGsqbUhw3iddhyLD2G5oUSkzQWj7h0y8JjAEBIHjGPkVVxbtT0VpqjW5SjfIiuaQ/iKAHeDcfk1VUbReFLT8CLAHBhUNoHF5WJCnyVTyuoRbSnF42XgRChjm1gFnnq7EE+yC+Z9FHhY1nZ61nemzz+NkU7bs1i4GGWo33CXURwJiVJ3po+31N5ga9tz0diUWd32gO68LqFkLrGOyvslSVZW+iqMlmB1myw5/es0PHJszYyBkCazb+GPV+PYUP4pgEMB1gMQKgyw7NdWmEl01I9EKdfWnP9ru88nGfY++7GLMH5gqTXUNjCtykbBNzx7wOs8TLilImU8npIbwZr0U0gsn2jqLYUFyYBJoTVNUnikflFBYYX0GoL1hK9IoDfeOvLIIihvcmB5Lss5SEAiaVCntvUIWcPhrko7s6H7J9MMVQ2QEVCWRRiNOq7UVFIEY/AeozIIM08tc3XlnfY3u3E8r/Y3y1N0X3
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5933.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(39860400002)(396003)(346002)(366004)(451199021)(2906002)(55016003)(38100700002)(122000001)(9686003)(83380400001)(186003)(6506007)(26005)(8936002)(5660300002)(52536014)(86362001)(38070700005)(7416002)(4744005)(33656002)(478600001)(71200400001)(7696005)(6916009)(76116006)(4326008)(66476007)(66556008)(66446008)(64756008)(66946007)(8676002)(316002)(54906003)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hf3X9WjHYSVOdD+Jr1G7pPB8i3K+PzLMniPCsI2WgRnNfBsSDwtTIX4ONXMj?=
 =?us-ascii?Q?GoIKGYs6S/XUdce9dqDpZya5wBsMc7UZ68A+nsQ6JX4w+Dz3atpitiALqvDx?=
 =?us-ascii?Q?xhcr8cPhZYlMTGus6ZrUqrSLiaC5DUw+38ChCMvrfsKwu/qkVW3gePfd7EQY?=
 =?us-ascii?Q?5POjoSDig65fQQ8VVERtiStRlxCC0Kmj9EjsOO2DHsXY6hRQWQqxIBpaYwS+?=
 =?us-ascii?Q?JhSKMR25EOYNftnrM3mcCmEzyjo9NeTfcFypj5ggz6VLn/BhP0mVbQ973Kus?=
 =?us-ascii?Q?FA9M16VItBoEos9jefUznLXssUxioklzb3+N81+dof25EV9+aJ64Pj1/80Hx?=
 =?us-ascii?Q?L53eNd5ciCpBRSr0GDCKM7X4Be+o1HLU65wpFb1/OWpzg1KJHmkDKPwgz3ui?=
 =?us-ascii?Q?FXg5PZKAHF1rNl9xbKJKi8wYYn5P8XrQUdi/bGZ0NOTlFV+0Qt47TuFtngrV?=
 =?us-ascii?Q?+FqtHj0RUO0bVZp9ulThuDqG5Qv+DTnkAeyhL5NuEK9n66d32d1Au8fjQd2N?=
 =?us-ascii?Q?CV98IpPoR75rK9wwV+DrhrLMnBbju3AWczb0lOfaFKHlg9Vn3idOJen1xX6U?=
 =?us-ascii?Q?mGc7JsvWyj+osndFaIAuWguyS3GwsHDJ+91hr1RaqJviABEcA9GgDMpdlCes?=
 =?us-ascii?Q?nGTnj8cWwIgDoIYtzAZbJ91l4LPvI0f6K9wEx62AtuYNEB9HiwPktWP0yJr2?=
 =?us-ascii?Q?4rOnJyaL9aaY7dI3sK01y2Hbn6i3x6MqdJuGBkPo00bXBd1QIayVHA8Ab/+6?=
 =?us-ascii?Q?Fy4BGc/BqM7K9Od7ao2z5Xd8dDgiZro+mAoVGTuZald8iKrX622jPlvAjQ/7?=
 =?us-ascii?Q?0qdQwYiwKOqO2OTZ25zFInO9y5QkdntCz9FDfPvIUSKGpk5oDrEOulAwZ0Ig?=
 =?us-ascii?Q?2S7jsySR/zsLkSWsfqmeLSoafVzPItxNtEV+neW/mhiYhgnu2hKayc7fYCHb?=
 =?us-ascii?Q?rKEb2uz2+5WQueNSqvW+cHdZpeceOSlt5wMorMZ6ALz+XO2YWVkU6GcFoI5V?=
 =?us-ascii?Q?neGvvISQTrxZx3lvtoLtRhRthuO6TtFp5KN3IMPz8HZ7A6NXUAamEnKzeXKr?=
 =?us-ascii?Q?SNLKelH1nrfS8LmZceh9I7qx+Vg8pKrHZG9+ZftpMD4M36MgKyv4SEtcRiq0?=
 =?us-ascii?Q?7ZokpAa/bAGDGI4DC9RDIMxSRrMfQ0fvTOmoPcJv9K12DhkfRY7RY17RBD+2?=
 =?us-ascii?Q?3NdzKTDI1tDeYTvaHHihEaI3upvlbcfC652rwapI76kFKhYZa4Grp808YxsF?=
 =?us-ascii?Q?lS1CeyLvauSvMCsPex7Tl6HVBKGsu7JWp2rgxSPCHIxiLopnXnNr3TQIc5J4?=
 =?us-ascii?Q?mDub9Oj6RLaeIMnbuvgE4vD7l2cCN/jzWGlAPkR9lDb/m17PEbV8uKyKdred?=
 =?us-ascii?Q?R9E1/2jTsM4fhdVRTi5X2KiDmcYIuC4hajzjX+aSb+IvtqymW2b55NkAaLM3?=
 =?us-ascii?Q?oob7JApegmrqgPLsEtd96yOTGWpcoNCwn2h6L8FAVQwPjMLolh52GvDHXiLB?=
 =?us-ascii?Q?1kV5+42QJ6gOhGSOo51GU2lmhC6dNUDVRlw5waLGLCyDx25xN3zrYYeStYjm?=
 =?us-ascii?Q?tdS2OD2hnDfRCU2Y/tjQGG6j/hRuDDPUR/T3aogFcUoB8Iq0VGnbJ8bg2e89?=
 =?us-ascii?Q?4w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42633a28-a8fd-477d-afe9-08db8c4adb05
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2023 13:35:33.2500
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 137IikG/3TS0+HeMYroclETQSY6p9/c8pg8zk/KB5s2Jqm6B1TG585F99DDgTAMZdACEZr8G72b84taOXeylTS5+Sf7wawnVKn3uDo+OZyE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5443
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy Shevchenko,

Thanks for the feedback.

> Subject: Re: [PATCH RFC 1/2] drivers: fwnode: Extend
> device_get_match_data() to struct bus_type
>=20
> On Mon, Jul 24, 2023 at 11:46:44AM +0000, Biju Das wrote:
> > > Subject: Re: [PATCH RFC 1/2] drivers: fwnode: Extend
> > > device_get_match_data() to struct bus_type On Mon, Jul 24, 2023 at
> > > 02:06:07PM +0300, Andy Shevchenko wrote:
> > > > On Sun, Jul 23, 2023 at 09:37:20AM +0100, Biju Das wrote:
>=20
> ...
>=20
> > > > >  const void *device_get_match_data(const struct device *dev)
>=20
> (1)
>=20
> > > Btw, this needs a documentation update to explain how it works now.
> >
> > Can you please point me to the location where I need to update?
>=20
> Sure. It's just on top of the (1). It looks like no documentation yet
> existed, so you need to create one.
>=20
> Not sure if fwnode.h has to be updated. At least it doesn't contradict
> with the added code, while not describing all details.

OK, will do.

Cheers,
Biju
