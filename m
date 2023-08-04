Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D92DF770474
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Aug 2023 17:24:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232146AbjHDPY2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Aug 2023 11:24:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232151AbjHDPX5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Aug 2023 11:23:57 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2121.outbound.protection.outlook.com [40.107.114.121])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 121BF5259;
        Fri,  4 Aug 2023 08:23:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V6uTQEtarIvwBtY2x8U6k0Y9DAMJuatLjgu1rLjKdwze0DTF9X6mG0U8g2EtNpPWo41udM9g6LSCyMg/34xdGbEceX9EJbxNiBoJk1t9qTFRqLLZyc8kI00yycUWz4Ot2+5Xg4IQjLe6x7hC1V4Q4OQ/2hqTmld2iyrypNUIJp3NjShHSYHaFdS4n3YPRH9TEubu36FXEpeI84hJEIGi0gj7RshGyI0IlpgRz0tu4CRyfm7XBSZ4xwj/puuLCsI16mT0uvwVITnu+fObAFxfXXDuA3xOvu8zH6LmqUBDl/nhiP43JoDJShdOAS12gpIstDsrEax4t8rMgqj1oYubYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=81N5pZ+gWDFEZd7iUFiKlsMK8bIwdqh6fWo4xpBLE+g=;
 b=AtA8OqRNpgW+uNaZaAjMvpmdumR12n8dbTufCjYTSJmf7Fzpd5oZ0O3t2E8STpw2rmRXllOldradKhlhFFMqMJrsY0pnOBp2LrbjrMyroqHfggD2FRN3BgJGhWP9oMnavecgpKzzIMzOGoCBMQoqGbbzD7fTHyztfVMxw3EFBxUfoVpvJb7pQQNxjIzP9pzWJQMM99S+BrqmS81DPz8gktRZDjcAWa/NQQt5OLs5lCKKBQ1zs8Ub+0rH1mMtcXpEavCu/8MclBxvWywqsDQwaZ2SQV9VzHLEqk7ftEPu5JJnjbVi+zAWVwwRTfdymeNgA62vTzECy75i+QkQ1cFRsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81N5pZ+gWDFEZd7iUFiKlsMK8bIwdqh6fWo4xpBLE+g=;
 b=tFykXe8VzPsLVsv1Lhf32Ry8Va7WwWg/i4+ycCaZuuslVWpxtFlSyghDNCBUyg3BuG2jdkFDyRKQt6IOc1RhygsK7g+w74AHwijJKUTVuQbHDDUHXvL1a7s7YkspTFBLKiYKufJGnWs3xPfwBo/PIgr9KW6xmudeASkOdznX/gA=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSYPR01MB5527.jpnprd01.prod.outlook.com (2603:1096:604:80::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.22; Fri, 4 Aug
 2023 15:23:18 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::865f:1bdf:c364:1184]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::865f:1bdf:c364:1184%6]) with mapi id 15.20.6652.020; Fri, 4 Aug 2023
 15:23:18 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Wolfram Sang <wsa@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jonathan Cameron <jic23@kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v6 4/4] i2c: Add i2c_device_get_match_data() callback
Thread-Topic: [PATCH v6 4/4] i2c: Add i2c_device_get_match_data() callback
Thread-Index: AQHZxqKkWY9z5UHPEUybMtd3iYT8r6/aOdgAgAAAQACAAAeEoA==
Date:   Fri, 4 Aug 2023 15:23:18 +0000
Message-ID: <OS0PR01MB5922A53C08EF122CA0F833538609A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230804070915.117829-1-biju.das.jz@bp.renesas.com>
 <20230804070915.117829-5-biju.das.jz@bp.renesas.com>
 <ZM0RIEshpTV4Sn0q@smile.fi.intel.com> <ZM0RVjKWtqXK8sFe@smile.fi.intel.com>
In-Reply-To: <ZM0RVjKWtqXK8sFe@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OSYPR01MB5527:EE_
x-ms-office365-filtering-correlation-id: 0a980832-1331-4dbf-9df6-08db94febae6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /lRAgGna7J75F0yzZCCwPFT2Mw6wJZI5b0khW40Nj54jJ3f/2wN6kb5cEc6lb4GCkpf7DpoYiwA2r3i2kCizMXSnl/F8xFVBqEbP9ViyI3SS+EZGEehf0Acpg0MExT1bbHen3D7zIptirvdZerpiBLAdnXw6eGj8WO+Nui4RneXZGuh8QqG+8wC7+n+U4BK4svaUzK64HMo528JAAW37WfujF/C4TOqZsjLuLIWJQXivLq8Xf04iSGvNOBDdhX2JNkQY+z68qsVSmbPNEyWmhR1V8iWUir4zPDkvAMKHeD4CneikeZK7T3qIbi72x9PEpmSkuQPe50ABVDgGrttz3Wy7mdbc0HrxZctTa9ScPpC5HeI8QZ2KBkJS+qITE3jM6OrXmYu1oDo/VrPiCPLFOo3cGhRv8dqMvOeJNla1wn/KkfSyYArPM1ElNsc6Sxj/HyifP5N/W+PI4yF7IL1s9ormcWzXY2jrbe50ApnSSJ88gi4xvQmKwJA+N8bxXLkx+C8THKd5gLjqisxnEC1Sba73OCWilxP8eaYWa0DkZqn8h4z/fviS6XvpGaRZYiNRSfTOvvzd+WTjvK2MOZjcKIUq3SPtmK8c+TTEQnOy4nHiX2q7+ymO/9tre+/yY7JF
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(1800799003)(186006)(451199021)(8936002)(8676002)(4744005)(26005)(478600001)(55016003)(86362001)(9686003)(7696005)(33656002)(71200400001)(316002)(41300700001)(5660300002)(64756008)(4326008)(66476007)(66556008)(66946007)(66446008)(6916009)(52536014)(7416002)(54906003)(2906002)(76116006)(6506007)(38100700002)(122000001)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GUK5O+0vu0SSDca5f5sw1/sO0H5O2vrdDB5aV7pXV2HrOQURyeSE1cOC0r5S?=
 =?us-ascii?Q?xG12h7lMSzqjCOTKcx+9pdoJCH+RjYHLCqRI8kOzA7xnkHAYdSMMSoBNq8Wy?=
 =?us-ascii?Q?S7AOdh193vCTt3xq52pcauCtQY8NjzSL9wtHZMVMh1WGMbMpabx8DSU8UTUX?=
 =?us-ascii?Q?d7mMKnj+b4daU77yyRej0LmsouSWKeyWqzeS0TOxwMYIjz9o+KNFBPQrENfs?=
 =?us-ascii?Q?0eefQeOJlvNPK3MRRHNiVXu5mzsLfy2GlyEVD3KxmcEOFxTnHMwuCGBlCmTR?=
 =?us-ascii?Q?/S9wef0zy3g1YQMDNDrdC6yL9w5gR85LNKd+9eGwTqWpifEHJwYwqpIsuZ0F?=
 =?us-ascii?Q?J/nso/PAnmZLtALq9enbl5cUCHBFt/8D92RbWOjQn6N2EEi80Da/IJxPYMzw?=
 =?us-ascii?Q?DH5ull42PyVBvn5JcWLJJACxnjS/v0pa7l8zelJwzPpKfk/QLI/YyGjKnoZi?=
 =?us-ascii?Q?N44cR4IibpnpU5k4DVX1dqpqZukYx3zW2TQcNnohnVhgo3XlsZZ+u6JDz9si?=
 =?us-ascii?Q?7XyFIbE5GXxRgfJQZzfv2cpJ6en6TY6k9dbOW/4chMyH2dPPBfRzr6b5IY+y?=
 =?us-ascii?Q?FFr6yJKRPvDsSPcrk7SVyOBfEV7CwAaqc99jJqVwdTeLryOZhnynVFpxlYlb?=
 =?us-ascii?Q?dFcEvdq6iPZAVrb/0lm3yELZMShXAwKVJj69Sqv5cdj83LQyCX/azNkq5Cke?=
 =?us-ascii?Q?5txWdSOx44EP2+5JHU0nGQDXmUm1Kpxz1I1+ilVH+GdRJWKuR9IfXs3mM2y7?=
 =?us-ascii?Q?vTGMKgAMzlvgl6wtM8jy1ArZZB0OvkoPRY8vEdnu4fshnOeOTK7skpt4856J?=
 =?us-ascii?Q?mYqJO9AzIAl5H0EQUxK0ssX0k3v6PSMtBQ+unOVy2vv33S+Og7TTPWWMqbli?=
 =?us-ascii?Q?mF/9fry9jDZY/wwEbAYVvVHHbZAJWc8Z2RQZYNv+kIWQVWnRoY7AK2DgX19y?=
 =?us-ascii?Q?Hw37Za3Qc8hso5HgkYsrIc8wxKIFnenIofCzDQwJLA2NlmZ4wLygqbsCnMW+?=
 =?us-ascii?Q?R21zIkbr1PyFz9cp7N+XLIr8lNGmFGexlVrEAQe+3/xveAG+ymNY0CM183dd?=
 =?us-ascii?Q?EayKjDwhvX2vLwy1n8a8HK3TyUj3oj4JK9tF1DRRuHG51YfiIBPRbPixR+OD?=
 =?us-ascii?Q?ZL3Kv0WQAq3iLtRA5YAO3dZCoOFzCMtz5+zUzQd7tBrSYff3NEbv1sEetW2o?=
 =?us-ascii?Q?uXNbXCgaZAdwA/yZEKXMcfj9zF0GKPSbKG8cN1NlvQJs4VcT8PZ/HlJCp+O5?=
 =?us-ascii?Q?blbNPdkSbXKSLXLu6Je+54gpmHw60fU+bAY7pTcY8c1nDQ5qCtz082jGROJv?=
 =?us-ascii?Q?bBlFfgiUanEYrEdXD2Z8BBqb4dabTm2TDmp+trS9VmCTF1z2flIsWd6f0IT9?=
 =?us-ascii?Q?LIpDzoPqXIG5PhRyD33mYTRiSDaiyW4zALAe0jixl4i3A+flZc0NeQZN/3u1?=
 =?us-ascii?Q?WUCEYe5OpAChuJuTSO5mbLubcCU58lI3WUoDrcP31dlnYo73WfWxznf6UBPG?=
 =?us-ascii?Q?gknIQIoZ3SiFvCRX8cyZgvvWdxubY0KkfM1F7Cz1jOzHjjVBBQqeJEeZEqIh?=
 =?us-ascii?Q?63lcAOz0MCgl3iC2lkyQHn1SpVru3gsCppho7Cg2?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a980832-1331-4dbf-9df6-08db94febae6
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2023 15:23:18.0742
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sw8vGLttXIoqpy3vax2qQzjl8TwBp6IQ72/rjqS02mjPlIgNGKp8Gj/VaVTpzC8GH0r0EpPp7pi0Y/j30TafR0wdEbSv87EB0jDK6vVdbP0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5527
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy Shevchenko,

Thanks for the feedback.

> Subject: Re: [PATCH v6 4/4] i2c: Add i2c_device_get_match_data() callback
>=20
> On Fri, Aug 04, 2023 at 05:54:25PM +0300, Andy Shevchenko wrote:
> > On Fri, Aug 04, 2023 at 08:09:15AM +0100, Biju Das wrote:
> > > Add i2c_device_get_match_data() callback to struct bus_type().
>=20
> Actually should be "... struct bus_type." here (no parentheses).
> Please, fix in v7.

Agreed.

Cheers,
Biju

>=20
> > > While at it, introduced i2c_get_match_data_helper() to avoid code
> > > duplication with i2c_get_match_data().
> >
> > LGTM,
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20

