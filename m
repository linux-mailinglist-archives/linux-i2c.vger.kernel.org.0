Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D041E75F566
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jul 2023 13:47:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230010AbjGXLrL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jul 2023 07:47:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229994AbjGXLrI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Jul 2023 07:47:08 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2109.outbound.protection.outlook.com [40.107.113.109])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 448B619B2;
        Mon, 24 Jul 2023 04:46:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gr3S2pf17I+gj24v0kCLwdiMPeQSp08Y32hOA+/U1JRlTVMvnUVZR9X20hAG0xqH9FOR4BRnW7S8jopHdecACla1l6yIPgUR8+Cb2D9Jl8X/UF/5IV2AKYVx8kfitRjMh/5GGV2U+hgvNF8aDAUNMneu/YQKIuPZv3NhhuK/m7cSnLQ6GRmKgBo2VBeO122Q6IfmPzsPzoN7flPKgmtHJ85wIQfeS7sbIBfA01Pi7rKEZ/FI455QTu7BoEuuQXPGtVhD6zWKVdcXt1UY78Dn3i6QJpG6unFlhOLfpS2rmI9D3dcVtckKP6nfUGiBTynvpMPTeuE2kfWyMnsJygYQPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DkeRQw2WJo7l+AsviSt33CpBHTqEEPU1NccDC32zRFE=;
 b=dU2wWWmlAr9BFzpK/23a679po08uNZuxNn8e43spk6RQHMAIpmRuBCH4CjsvvsadpVi7/eRSFsQ7wdTA4KdfRKpnIf+UuV6e8gukSz9HUNJwwoMihJS14JVKRH4bA29EggDLaSkpsANJltcg2tXGjTx3WvVOe/Ff38+iRtz9JgrviQOEJNbZSYcv9HRq8uwDzdErIJIGsGE93nG/6JayTUci4Br7fHXh19/bXFPezZVZWdTSL45vYEQ+legtRquJIhMFrJnf/iuU5Cq4L/W6ATSuEtkEAlN/z6a2DjSL8LzgT3xvduXCKz/zvQ6OUc/AeEpXW0qi87w/iJPABaMTrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DkeRQw2WJo7l+AsviSt33CpBHTqEEPU1NccDC32zRFE=;
 b=c5UVehrwfb24C6DBv1Jo+7PS2/7eoMIOXWlwzD8kYqxPfq9tiqMr6jCq1FU1OX9xv26FTT9m15aziNr72IKT4xF2/IKdkIgYLlh4gU9oiCyewxgdE/Dg3SjbxJ8+b1PeqdHhFX5T5b3XR1S+/Mn0kJYEVq2AVZkq0J9B3mqPm/c=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB10027.jpnprd01.prod.outlook.com (2603:1096:604:1e6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 11:46:45 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::834b:28df:28dc:7f95]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::834b:28df:28dc:7f95%7]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 11:46:45 +0000
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
Thread-Index: AQHZvUDtPDEdTtGE90+pXnIpqvMbOK/Iwy6AgAAAaYCAAAfyUA==
Date:   Mon, 24 Jul 2023 11:46:44 +0000
Message-ID: <OS0PR01MB59224593D634B3E1AC7BDF808602A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230723083721.35384-1-biju.das.jz@bp.renesas.com>
 <20230723083721.35384-2-biju.das.jz@bp.renesas.com>
 <ZL5bH10uJWDe2SPY@smile.fi.intel.com> <ZL5bdwRo8CFUa5QX@smile.fi.intel.com>
In-Reply-To: <ZL5bdwRo8CFUa5QX@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB10027:EE_
x-ms-office365-filtering-correlation-id: 3fa50f44-e11f-44dc-e60f-08db8c3ba7da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Lol3oZJc+tkYeuwilOMJtS1cssRg1+a2IrEgGkY+1ZIAd5KkRN38NOg93SKdlg/DOrMGoM61iRwU6ycr8rWwE6YgGgVBsjkvfpWhAVMtJH17Ogy5PB0p1rvh0j9zG3l7LmUQ2fBwGHDoXzH2PyuiL0EwOpxRZBGCB8BbaFBABtmp+c3Q502+YxiSR14bMHJxbtzsb6oLSa9sf8LyegtQ4OSvfpvlMEMeYMnXtERRbGGM88cFtrtsOCLvTZt0Re3R/r5IifbnG7fw7Lz0uQm/EQAZmLGWfRIf7y0m5TU+Y+plESYb1Y88Z3jPfNpQqK10vIKDkqnl5y2oaoc2EpnWHo87Te1eX4ufuvxxhw0kZCj4bfgjnhIiHLcQhMRruM2oQCBSDaRy8s3cAAjfSRLGwYC+tjl7/nCFXcyzqXckXMhz6qqWufJCik7xXi2MDhBdlIWw415gXvt1u1gXZmX2a9pCm7L/cETrUEyhkrLNKueQVL/QhcXbnaH8LRwdggzPvnxxHZvYDrNvHFm2KZ65vt2+AAcFx9ovULss4/xhF4EhD3vwAz+J04w300tDuyOSAaMoVmhKN94FkK7UcpB+mhviDP3RGmZaHn7ax0uxiG7XTIs/E6o62y000465pKs0
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(346002)(396003)(366004)(136003)(451199021)(2906002)(55016003)(38100700002)(122000001)(9686003)(83380400001)(6506007)(26005)(186003)(86362001)(52536014)(8936002)(5660300002)(478600001)(38070700005)(7416002)(33656002)(4326008)(71200400001)(7696005)(8676002)(6916009)(64756008)(66556008)(66476007)(66446008)(76116006)(66946007)(41300700001)(316002)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?T79xVi4WHpmH2xg/txnPQVVMlJBcFbMLbqEEuXm9E+syJLPIT0BK+msADlqw?=
 =?us-ascii?Q?dDCBhR7HCZjWEOoTMa1mkqBd3Y3YsmkZvGdGz18M6Ab/PUhtbgRuoUF113Qf?=
 =?us-ascii?Q?CYQyVdlpcq4snsUU7F03yU71Hbmdxpe3ycaVL1wFpJKAQuW+Uy2MNQT8gUnI?=
 =?us-ascii?Q?koSTutEy1sFejUjkXR2pN77YBjWsDZiB4TwUvYeViNCSv5dLGUEo8DWGOJeK?=
 =?us-ascii?Q?q2YGDYBPiPTIYJwqG/WMML1qC7WDW6fuLVvCk781s4Expri6vB1HOI3CPt5M?=
 =?us-ascii?Q?TiP0taXGjNBplcYOU5LX6eOnUfVL9c/yBCtZG0CFbAAsIzi8FkAPrB5LgCnb?=
 =?us-ascii?Q?cLrHY9w5A38ZZ8axWAW+WFnoDyPQs96kO3kecYpIhwY8pNyufui1ZXO4Pj4i?=
 =?us-ascii?Q?mrulb6mQst4LhMi8BvTuJursaa8QEwVKnLrmR8+DId6KqsMkjvKrL/grdi6v?=
 =?us-ascii?Q?5DpyDqoxtFHVeE3kVeNv5WkNWT5wHGWq8VoxZ2SdvjCJ+XwweBRuXDXi+SRi?=
 =?us-ascii?Q?KissF2F9rjbddoPUU9vm07MFV10ShM9DTB/gRxKDfyKQ4VfrzWLhYzAxkv4q?=
 =?us-ascii?Q?d0NWnd6Aexw7MBqGCDFWS8xNQzUo8qPahmKwi/CUOnn2hPix+vXshiCyOQg/?=
 =?us-ascii?Q?UdoVV65uIl193qzg0TTjXnZCBO9E9B1sIUZtawfDD+gAcshgVvjVcGmA/N9t?=
 =?us-ascii?Q?NYF4LTqdkghSoHfxI2CPiS0Uu5NGogFrGJXb5YYfXgvncEXzQLTHAIFwnI+I?=
 =?us-ascii?Q?X9qDHCJMFfcHzQ8x4v7wCCOizlQ8Gv8KKcT6M96yRYSv0DwksEswfes0PVc5?=
 =?us-ascii?Q?V/w8B/VRDgao9AllLOlqrufezOPlvJwaFhXuAddcNsvDkp5d2kgfojiwhNKa?=
 =?us-ascii?Q?86VgGac3ZcvykQ2d7WaayzTO49xn+A+k36PRlPj4zDEsCsSuTUILYs8zr58O?=
 =?us-ascii?Q?cRpXeEwqiNYAKKnGyLiMsnbOBqo8Vofrn16ps5stQtzom3b2CeU6B9s4K84J?=
 =?us-ascii?Q?7y8l3g3o+plpMqRiIz4okGwgDcQnz9hLjcKc1KsKvgw2d7lIvD3955LfwLFU?=
 =?us-ascii?Q?oA02lpQsJTqyJ0/QE6+r8Lvw9hKM5lua2n82ehbKzVz49W+3Y2rPMzFoBymj?=
 =?us-ascii?Q?TkZOBM5+uL1JzD0wgDt5R0Qpok535GC8yiqrciO2bOWUJJXqERwPmh4W1mUe?=
 =?us-ascii?Q?bjTG1nsO6UIBVeEV0snM4eRcmk0R7MiozIwQEPrLw6KFBM85TchmRjb+082P?=
 =?us-ascii?Q?wrod3SsdvFnzxrXrGiRQZUGIUrF73RoHPRwiRMKsuP5F3K3bqCuIjQIeNLvS?=
 =?us-ascii?Q?QZ9rowlKyq6xSO00PtCEdrWf4OeMH7vzdwE0IqJgshsVRrJ90WgO07vxWNGd?=
 =?us-ascii?Q?Qk9t8MK2cDFXGRywQMpyn/AbMS/ihh+ZiPrEpousmJCExzjDiERYHRF0+wW9?=
 =?us-ascii?Q?z1pns422ZKFcyRylSKB0sFWDd4jO9GchQjEYAKYXs3Bb28dbyUyDCFu5CllU?=
 =?us-ascii?Q?IghHYJ3F1yPcS59jgQP38stlGyUg8AEKaHLbfIK5AUPp/fx9sDhhSin5n4tl?=
 =?us-ascii?Q?HoKrAUcSc8dRhVxEc321npQ0mBRP99Vkk5VhR4RJ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fa50f44-e11f-44dc-e60f-08db8c3ba7da
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2023 11:46:45.0089
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tVrhsts0NVp8394EOBXiPWCOEJDxqAsxh4/wXuf9WdUTCWUXRt+7CCqYVP+omuwspxs0ltZsuDWWPT3Yd8Wlp29/NvXq29xpQ9I7BBrMmd4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10027
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
> On Mon, Jul 24, 2023 at 02:06:07PM +0300, Andy Shevchenko wrote:
> > On Sun, Jul 23, 2023 at 09:37:20AM +0100, Biju Das wrote:
> >
> > Thank you for your contribution!
> > My comments below.
> >
> > > Extend device_get_match_data() to buses (for eg: I2C) by adding a
> > > callback device_get_match_data() to struct bus_type() and call this
> > > method as a fallback for generic fwnode based
> device_get_match_data().
> >
> > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> >
> > You can't just throw one's SoB tag without clear understanding what's
> > going on here (either wrong authorship or missing Co-developed-by
> or...?).
> >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> ...
>=20
> > >  const void *device_get_match_data(const struct device *dev)
>=20
> Btw, this needs a documentation update to explain how it works now.

Can you please point me to the location where I need to update?

Cheers,
Biju

>=20
> > >  {
> > > -	return fwnode_call_ptr_op(dev_fwnode(dev), device_get_match_data,
> dev);
> > > +	const void *data;
> > > +
> > > +	data =3D fwnode_call_ptr_op(dev_fwnode(dev), device_get_match_data,
> dev);
> > > +	if (!data && dev->bus && dev->bus->get_match_data)
> > > +		data =3D dev->bus->get_match_data(dev);
> > > +
> > > +	return data;
> >
> > Much better looking is
> >
> > 	data =3D fwnode_call_ptr_op(dev_fwnode(dev), device_get_match_data,
> dev);
> > 	if (data)
> > 		return data;
> >
> > 	if (dev->bus && dev->bus->get_match_data)
> > 		return dev->bus->get_match_data(dev);
> >
> > 	return NULL;
> >
> > >  }
>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20

