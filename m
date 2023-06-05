Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B46C972223F
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jun 2023 11:32:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbjFEJc2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jun 2023 05:32:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbjFEJc1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Jun 2023 05:32:27 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2126.outbound.protection.outlook.com [40.107.113.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61371D3;
        Mon,  5 Jun 2023 02:32:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O94SA9Dvrv5Khcb1u7msHtMIMDZoOBEa5b1zzCEPV+rQlbcxATNQ75NlYJYjDi5s7WElzJnLzlBEchk6+F+VyAIkC78hImlHwd6Q/R1S6iKJ4fwBLxwRQ1hVt0m1Ieycx4ZWM986G3DPdJK1VSPZJGUaXKccA5o+x88fsi/Y/+5/8zcJi8SLVOG1T3Bj8v6J2likWvhuhyLapalQQYg4P1x2zGOm2LkHYfoHf/DUaNk6Uf1s/HfnTLkG1n2y3h9HlCN4kPafc/pNXR2aMQ0YVT1q8bDxPRmKoKrci85zLS//RDtgHBEtM/lrdfcaY5L9c9FqpmLClhFMugH1MzBmuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gGVDGze4OA5OobsHNNqdyaMvpm/Ot63fc9+vJJ+vAwk=;
 b=bMc1zkVwRXphRYssqa02wLaY3YqtIfJDkAwMsGMV6Rgm2p0lNPVctvsLMFCaYZ6EJc2rRs33CgCal5ApjeeLAwx4myDAj6EzXexWmMbO+qfxVOHJWmkXfwi6Zw2wq5UFt1RhxNFK4mp3ynUcSVh2raMkQ8FEtnp2jZmYfWLpaWGUqGjhy7KUPey5PdK+mH2bBcf2ItB5rUxGWwWXl12JMSdFpIcIJnHmzhNDQW+GLVxy3glkC0XQRksoL3FnmObV1eYRg6EYH+wMvPkwuRLJqz2BqtEjOw7UChHuxj1vUhynDMpYhJ7PtORxN5MX9TzyX9VOXEb7Ef791H9XekWm4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gGVDGze4OA5OobsHNNqdyaMvpm/Ot63fc9+vJJ+vAwk=;
 b=lqVwoG/jq8b/9EQXlucH6aYTRWAh14fgFji/59uPUQIylEgY5GRRcDcl1J4Cw5kTDi/epwIzx5sdxN3iEugkh8TcUxHY6g0krHShrJ+AqAKcc1iMyO8qF+5ISjE1g1Q/3hIUKys97j/lbyWTIGn3PZBP0jp+/aQ3/mWB99KoNSI=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB6045.jpnprd01.prod.outlook.com (2603:1096:400:48::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 09:32:21 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 09:32:21 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
CC:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>, Pavel Machek <pavel@denx.de>
Subject: RE: [PATCH RESEND v2 3/3] i2c: rzv2m: Disable the operation of unit
 in case of error
Thread-Topic: [PATCH RESEND v2 3/3] i2c: rzv2m: Disable the operation of unit
 in case of error
Thread-Index: AQHZj9oTEmR37Pq0ckiYLcd7lqo2HK97/geAgAACtuA=
Date:   Mon, 5 Jun 2023 09:32:21 +0000
Message-ID: <OS0PR01MB592203D063CF0777388D20C5864DA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230526135738.348294-1-biju.das.jz@bp.renesas.com>
 <20230526135738.348294-4-biju.das.jz@bp.renesas.com>
 <ZH2osTPbiv+sT+m5@shikoro>
In-Reply-To: <ZH2osTPbiv+sT+m5@shikoro>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB6045:EE_
x-ms-office365-filtering-correlation-id: 1d308cf4-5738-47bd-4a95-08db65a7c398
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +1/B08G8ANpatlx4XsbmsAfFg0UICc2oSJKOUaj4Ob+m99FXvS5ZWj0OoNUrxljT/xj2lFLzhg4ekAjwh3FvUkxsekq4O8Ldy9budndQWfjQVqLv00KhoUd0QIleBAepE5UVAaWMJ1SXPrxbyUJpD+7fvmFOobS5sbUfTG05uHFTuqbeRIsE6jOKLNrIPqFdwbO+q4Xv/awVDcPfKumrB8y7qkUv47e/RkoI7DoPFFuR2TQeSP/eYlSXD8QQrt6q039/IvLCvOMQq4KIPXqYm+v76+RCFM7TxnBrtw/NKTjTcXsEh62nRFW714tsVwzMCUBn0ivqAj1vux2M0cAs+79dzJ0cx57aCx8CQKjLRV3RpseM/h17GmHU9Oqnlpr1PcRvvgaaFmupcuYpsG5MIW1qjzM3edkCj4XhcQtPcXui6xKn49BmdY/Uvu2WVLPTCl15cdrx38zRIp6sBzrdY8+Am8vaTZOVI+Z/71yywLQK2egh0J0AJJc7XuOKHZJfvc8WcFU/sUHx3eFTrJInQ/MKDtYR4NB04EsVwK4jE9VYD+36g9W9KsAtLlNlJkxg3KJFD+qSZVpW92Bgc4Wit0rueHwcnmBQb4BP6AKleCnijy65iFXB0alLMdw11zBN
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(366004)(376002)(346002)(136003)(451199021)(9686003)(26005)(66446008)(6506007)(316002)(83380400001)(66556008)(4326008)(122000001)(76116006)(64756008)(66476007)(66946007)(7696005)(186003)(38070700005)(478600001)(33656002)(71200400001)(54906003)(110136005)(2906002)(4744005)(5660300002)(8936002)(8676002)(55016003)(86362001)(52536014)(41300700001)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?V6ya4qmoRpPorDGZU+HkRPF9p26ObwxoaZxdP/QWMJ6yg4ZrL+iuAldvusDt?=
 =?us-ascii?Q?JwUyyLSlT5tSGNQUKmU/KZJOTvvpFufEn9lkTnQhghbjiTU0xSyS5gV0HwlC?=
 =?us-ascii?Q?MFO0Rcv3G9ktGzK6ZluwVb4d1DyyOisyl9rw6bu5mPLtOTdL/0aI/8q5dkI4?=
 =?us-ascii?Q?nRtzlbFtaZq3OFT0WQZ3r97XDt78yAamShi1NguCywo9snnZUwbd9oe6dLyt?=
 =?us-ascii?Q?Jg0ib7kIefv8/nUZ3UJ6Cz8H3cvy4pofaSfXCvUH4Ew0pYJ1MkDZPI5mQ88V?=
 =?us-ascii?Q?EEHNrOZ0Z35z7kz1R0NW6uSm9X47fv3jnsVInM/cTn51OCbc8QTjsG9Wx8Ma?=
 =?us-ascii?Q?PemT9TuIT1k04+XhvIGPRha4yOhlNR4VJrJDcsq69SRCQZxPEbbZy7MuDzWc?=
 =?us-ascii?Q?55a/YuECnYGu2EXCjC1SdIPhWLgLjJFYbp0F3Re1qEG873oAfW8YqTpkkMWZ?=
 =?us-ascii?Q?5DgOVpCAvq/evf9ZZmBhHSrjokmnMkAvW84ACiVBV3TDid5B/oEnMAU5u9ua?=
 =?us-ascii?Q?fKUw5Q/UujRPFApbzy29u8ROfdb3EdAFCHWvprK0ooR/RCotP5s7udjD19XE?=
 =?us-ascii?Q?EiuyKkqQwIjWQxvsSu27qphLxHT7eYY5M2Y/tfrojEoCucZuQfyJjSRW67ki?=
 =?us-ascii?Q?xEwpFAydLdpDr9eOfnERR0jUYFRGyki8yQuZPegNc0Gf42XEUzWNOyWHjXe3?=
 =?us-ascii?Q?rhw1V78MseKfcD6IgM7YHrR/cd3RieRABbLDxwXv+bvAra4dUjq5jHGhHebh?=
 =?us-ascii?Q?SXi9W1X0S2aCPswcgaQNbj3Ef92wEe9I9KGS+7fCh3R4TD93ofLzm2B08/nd?=
 =?us-ascii?Q?BS+8kcvwf6lR/Oh7UfaC7AZz63Dr+MY//NPx6hoi9/1HDLjwvH9w7RkCCuG9?=
 =?us-ascii?Q?ghlXAx0toi4O9N+9wR6ZLpy8iS9gdBPjoVDmRYjQ8kqCHy6lD6MdMOQ4lyB5?=
 =?us-ascii?Q?4pmR2n5ADL2x00Qxh9VM46AfKz0TDeP8WqfdnSxh75vODbNGf8SxCTXQUNmp?=
 =?us-ascii?Q?kgmnXNcIX8eBM8y5jUESt0beLy6HPh3XiG3W0jrSAudj0h5LblJwVQn3jlrf?=
 =?us-ascii?Q?LKc+GT8Dde0/A06BS5KJHZ+MF2cc64AihOTa9XiYNbNxZHB698Ln0WmQ1EJ6?=
 =?us-ascii?Q?yA8aXfa6IgkHwKCIr8hlnjHlFLbIWfvDInX9y1o/fbcuhoYsfxLvaWrf4fe0?=
 =?us-ascii?Q?UAPAKaBErFx9lD1LooaxXCDIW3eHTOJ3bCqoRcL/SZbJp4uUdGxhhrfz24YO?=
 =?us-ascii?Q?MSd0zuIwTyWPlqeSy5YRSmGEp8xx4MvzVW2FcjE1vBomfjlxsTDSVTUnDx+6?=
 =?us-ascii?Q?YC3EjgTnfLOyXCxx9/RlRBO8zc32sXvjiOkvgNUDnDjXKqKMdsJCo335dBQf?=
 =?us-ascii?Q?uceiNcsu3N9/VW4Hbjo9ITAjpjZDsHd05UI20ElUK60Z9JWHulIsM/fublbM?=
 =?us-ascii?Q?CbYQO9cFf+RBU7yU3B5MT95oVegAzGZ/YN3QLKVavkLfSiwFK76OO2sBWgWJ?=
 =?us-ascii?Q?R+gp4n9eSg6yAZPWhyzYzcBKQZN+WTGedactSZUPicv0I4WR4XkBiqU5XyvQ?=
 =?us-ascii?Q?0mp0ZTB0bpUgbtIZSNg8OPjrlpcJsJ6LpLCijNh+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d308cf4-5738-47bd-4a95-08db65a7c398
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2023 09:32:21.8352
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WV1xAJ9xILZgDdiZzS8yDzv8S0GlGcw88gtKOnJK8eP44C4Lj+Tpi4P+ro2upvvHG55Z3VPoV1rqSJqR/G63sQnWGjnPw178zRHhaTAnje4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6045
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram Sang,

Thanks for the feedback.

> Subject: Re: [PATCH RESEND v2 3/3] i2c: rzv2m: Disable the operation of
> unit in case of error
>=20
> On Fri, May 26, 2023 at 02:57:38PM +0100, Biju Das wrote:
> > The remove and suspend callbacks disable the operation of the unit.
> > Do the same in probe() in case of error.
> >
> > While at it, introduce a helper function rzv2m_i2c_disable() for
> > disabling the operation of the unit and this function is shared
> > between probe error path, remove and suspend callbacks.
> >
> > Reported-by: Pavel Machek <pavel@denx.de>
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Applied to for-next, thanks!
>=20
> Do you maybe want to add yourself as a MAINTAINER for this driver?

Agreed. But Fabrizio is going to maintain this driver. So will update
MAINTAINER entries for this driver with Fabrizio's name/e-mail address.

Cheers,
Biju

