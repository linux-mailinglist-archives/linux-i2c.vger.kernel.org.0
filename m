Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 346E4797416
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Sep 2023 17:36:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241024AbjIGPfe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Sep 2023 11:35:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237140AbjIGPXZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Sep 2023 11:23:25 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2116.outbound.protection.outlook.com [40.107.113.116])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECDFC135;
        Thu,  7 Sep 2023 08:23:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EDWxnuwc40BrstHsgY8DcE0xPXVv5Dhi9+4Bbo1hejODz+tEw9SY7G0r2TVoz4/atPR0d0w0UmpwQ/lUZkzIU0lNn0b1eUMHhGLD5afY7PrE1B45hwL8mNUOsVbScmJ2QKh9kqKoQqwAT02hH4XtvfSYLGJ11/jnQl1ieU9eIZ8ZQXkf0ONogx5jqlr3JDpeOfHyRSGHOvNZwZYWwgNuP1Rk6l94Wpfcuv8qvaNvwBVTzH6CYkNtIvaCd1rYykxMfVGDHmB+Hfm8/irkS8xwr3ySZBJSclxXB+yms1KSnhQQEb5UPcAveTvZVXzCzOyzS5WgtgQX93vJHwvtCF6rxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZXOtvf4kUvf5fl58KX+m7kY0C9xXDMhp9IrYnQZ1sss=;
 b=j+g4bj+gBtBv0UGn7Zbpb6hvl4ejTuwM0ZY2Y6xkT35sW9eOWo7OKrK/Aky+Yny21bopwn2moNgbXR6xRFMOm4UJwjbAaHPI1B8Og6iqlatP06rnyY6Mg5kyK3eEYe1uXHtuwel1fozx0n3YW4WrbXllNakplzL0XnGhBh+8/FGJB4aMJxdpPHJUySVpG4XJc6KfSu7flpj8bXsVZUrSXj0ZlN8rqN+ZfkIo6F+aTKFAs/8SizFQ/5xmmmM4PIIcPuxtTN4qpHXjx+fEOf5syR29dPT6L6yawXy/mxr9SpUSgrDN36RAF/65IHwMVDJ8PyGGAOwUrqslKk4xpsRlvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZXOtvf4kUvf5fl58KX+m7kY0C9xXDMhp9IrYnQZ1sss=;
 b=to1I9HQ/tIBY1kiop7rA2P9JJRvWLqRKGj2GH13dv6PV8WqHfFjrRkPTOXRr+fsxhT2AJCql98SIf13XCzpUfNMs01eUbvoyR0nrMu9YnUWSDDwGioDBONBv7/WH9bHPdC7m7+xvFwCKHoPwb3PWs5kRrvlDbtIkc6K/NJI+tUc=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYBPR01MB5328.jpnprd01.prod.outlook.com (2603:1096:404:801f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Thu, 7 Sep
 2023 06:44:20 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706%5]) with mapi id 15.20.6745.035; Thu, 7 Sep 2023
 06:44:20 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
CC:     Chris Brandt <Chris.Brandt@renesas.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 5/5] i2c: riic: avoid potential division by zero
Thread-Topic: [PATCH 5/5] i2c: riic: avoid potential division by zero
Thread-Index: AQHZ4Pzpegqncf7PEU+giQkC/rdzgrAO6hPQgAABOhA=
Date:   Thu, 7 Sep 2023 06:44:20 +0000
Message-ID: <OS0PR01MB592244BACC65607AA0E3C3E486EEA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230906200024.5305-1-wsa+renesas@sang-engineering.com>
 <20230906200024.5305-6-wsa+renesas@sang-engineering.com>
 <OS0PR01MB59221A1F4614F30669F3448D86EEA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59221A1F4614F30669F3448D86EEA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYBPR01MB5328:EE_
x-ms-office365-filtering-correlation-id: e2d95459-8201-4fc1-1db3-08dbaf6ddd35
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jnNRL4F4yUKrldtncvV5dvvjvQFT1RiwCOTZoUeU3WJP7xZeNBP8M4BZehHYJ1+2Cz3mbV8BsCL0c5ZOjH7gmLBpkZJHTqSi0fNhBmp92FA6gLbZ1RZE8cCfY0m2b16mNu1fM0xX5LEWCDFFhajkPxyCzN0S7Ibqe2wqqHMsO/Grq563jWcSxIZEfhsiW95MkOmM49iuQxzyg3fIboBcN4PjDZDPIJzB/QRO3JNiYvnMPiK2XgaxpupWKDuXozXuk8GjSMJGygeVdmk9i+0d52a+zNTibgUeS+V0GWNRxmb2fI/+JMne0TCKjbaNS1Ns+XEyxT3IMeZRJYq/DmpCY98CUJTW9l+5lCDez4xiqhmSIvAZ0RkKduNJUZRBjC9kdmc/5nOzy50Y4o997urVAG6WrgJQtunuRkP54KhMqD9A0gvm/ETnDVprGvcI83UGXlbXvMKULaxOmIdUaQktmmMz5e9frP30CNUELUP1fBnsZokG2XljRHZdkgupVAHlyJLBoFFMUgpv5Ph17tnP1VHri672AlhKWfQbcDr97mic26mg5LEF8FFcH0j/uLxZEpHVGQPUqw4YnY+tPxBH9R7+Y+aDBVYI6dgCj7HswSConU8DJLVQoPbnvC4UcPXW
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(366004)(136003)(39860400002)(346002)(451199024)(1800799009)(186009)(122000001)(6506007)(7696005)(9686003)(8936002)(71200400001)(33656002)(55016003)(86362001)(2940100002)(38070700005)(38100700002)(478600001)(4744005)(26005)(2906002)(83380400001)(52536014)(110136005)(4326008)(41300700001)(54906003)(316002)(8676002)(5660300002)(66476007)(76116006)(64756008)(66556008)(66446008)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?stwchnTxyaHL5P4IAuZK2ch4G6Pm0E3yLKj+wugeqMquf9VST8i2GfDwod/H?=
 =?us-ascii?Q?vj+1WgqHSV9sBroRyurkLX9qSM+uRP+Tm9x+RpijynUjY02MuvM9T04TdDdV?=
 =?us-ascii?Q?jn4tWSrKH75AMBLfesgFeCqrjC2k4uDJArQrdFVUSRpWgrWu54qq3SE49eQR?=
 =?us-ascii?Q?aldHIFzs95MDHj9CUK8oR6Jx1t5Hr4PqLuoU8fDjz6/rkewus8vw38aC+yBP?=
 =?us-ascii?Q?hPLXcRXuLdCcQTsT8wfXIeNCt39x4WmatdkzXLEFdPo6AnFnhqZ0EPDYOpuI?=
 =?us-ascii?Q?UTwwb71W579sAAMCcGDdQDUng/35jIQmO5PQUpynKNEHBKT/g2twDfLbUGaQ?=
 =?us-ascii?Q?gyfItoJP7C4LdtlzwTJMcs0BaGyEYW5K9k7r3IOHhd+3OAKVNNveEoNmo0ad?=
 =?us-ascii?Q?t/OOlkyf/QWvOQcmrWkLlNN6NpIv6uAVnMIPVhSyIOVBON2G4+mPAGwB9NMH?=
 =?us-ascii?Q?lKVJoLGEdNFGJsFSR9j4xQqcsuV6dqB7ze9EAYmYMXdW/QGEKLKFvggWp8jX?=
 =?us-ascii?Q?J9s58YaikMUQO4HSMsKJu6DtimhbiWZ70nVrXkjMM/JNvRI3GXiZeNcmZsFJ?=
 =?us-ascii?Q?3eP8GeRYo2YI8HEP2b30tAhpRJcYOAbMPjSgPKCGKDHGvJX61+JBzS4rUmkP?=
 =?us-ascii?Q?8LeQ6YJctn2ACwj2l6GJnZmquVUgh/ZjR8JdaPQTx4DcnCUcVC58alWp/s5S?=
 =?us-ascii?Q?PCwqh3W4+IJHjiQQUcWeXforqITwUEvbrq2QbECFP8XyoXJ7QDiwsNkxANlh?=
 =?us-ascii?Q?1mYcZZkvho57ZjBG1kfc8sQjMNhmZc+gORM8x0gAts6T5IOI/nlQb2+vaaWn?=
 =?us-ascii?Q?ezPLAWy0DtL+XHYiI8066BMLMKtdpiId9C/gj266kUN0tYnzynMw8I9H1Tlw?=
 =?us-ascii?Q?wrtPXi5K8Izri97k4FtfYLilfEjq2Q4Ru1FORLM7FgybQ06tZUkj0YZ3nrUg?=
 =?us-ascii?Q?putjkzzzMuEWH8gta1AoD+tCp+ylzqQwCplPQuVLhb0MvivRXaxPHyJIrxjo?=
 =?us-ascii?Q?cYMx4iafGxnGpJpw+HpQtvm/TKNaooxCrQ8NWnCU9t2uVUpnvFU3yTmUYTjF?=
 =?us-ascii?Q?DMS9pNRIQFeXu5JvrQkBBMNTPeA06WQ7FnY1+61O8LE+KM7dw1JxIqRkhM2H?=
 =?us-ascii?Q?08HsNEdj7VY6jzZd5gwb+p7qoHzzTkKaRyBgM4sKcjTeTD625Ynfkz+ECaHb?=
 =?us-ascii?Q?XVQ1wJ2xTH/yAw/xVkoMWaG2eSE7iihjFkYmhStisfcRueWYAlT0pWazKSr6?=
 =?us-ascii?Q?0fsPWDaam+6qleoBY6jzOY57QF1C7Lq0M8B+BSmKEAibo+CTf7Z6BIr4yUNz?=
 =?us-ascii?Q?vAZRzYmRr4N7mhzncZNdb9+ohiOT0/7GgWhT7ttofTxfkY5U6dFi7AsLzsBB?=
 =?us-ascii?Q?JjT0vj/MqSViumqFSp68Fh0ppXq4nGyT1xFBc4VKuc+Two6xKEauA/+avius?=
 =?us-ascii?Q?oMMQWYxzC+w57Co4P3wwJgllapXUnLLZuAhvjD4CMfkUUU2RECvHVgcpmwTs?=
 =?us-ascii?Q?9CD4Ka0GNBDPAbhEXmyMA/3fNy6rzRPfzd23mgW2qGCTGMjM95LOnKWUEm78?=
 =?us-ascii?Q?qTNPXmnM80G8Naoi6wEE+YyAIMCwU1TlP5V8gS5K1MnYCG7D28VSF4gWD8SS?=
 =?us-ascii?Q?Dw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2d95459-8201-4fc1-1db3-08dbaf6ddd35
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2023 06:44:20.0543
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OavGnzruBfYm/p37FC1wLMGXLvETM30I3jsd9K0dfvWXQ+7rVwm3YMwvY6SRQgPeVMo2YfmpabHEBv9tJEaZDW9448yq6e43FSndhMiWm4M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5328
X-OriginatorOrg: bp.renesas.com
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> Subject: RE: [PATCH 5/5] i2c: riic: avoid potential division by zero
>=20
> Hi Wolfram Sang,
>=20
> > Subject: [PATCH 5/5] i2c: riic: avoid potential division by zero
> >
> > Value comes from DT, so it could be 0. Unlikely, but could be.
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> >  drivers/i2c/busses/i2c-riic.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-riic.c
> > b/drivers/i2c/busses/i2c-riic.c index f0ee8871d5ae..e43ff483c56e
> > 100644
> > --- a/drivers/i2c/busses/i2c-riic.c
> > +++ b/drivers/i2c/busses/i2c-riic.c
> > @@ -313,7 +313,7 @@ static int riic_init_hw(struct riic_dev *riic,
> > struct i2c_timings *t)
> >  	 * frequency with only 62 clock ticks max (31 high, 31 low).
> >  	 * Aim for a duty of 60% LOW, 40% HIGH.
> >  	 */
> > -	total_ticks =3D DIV_ROUND_UP(rate, t->bus_freq_hz);
> > +	total_ticks =3D DIV_ROUND_UP(rate, t->bus_freq_hz ?: 1);
>=20
> Not sure clamping function min_t/min(t->bus_freq_hz, 1)=20

Typo min->max.
