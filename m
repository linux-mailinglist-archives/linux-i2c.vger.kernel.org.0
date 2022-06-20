Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1E0E551DF0
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Jun 2022 16:26:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347074AbiFTOO7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Jun 2022 10:14:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351178AbiFTOMf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Jun 2022 10:12:35 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60061.outbound.protection.outlook.com [40.107.6.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64E9D245A7;
        Mon, 20 Jun 2022 06:29:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DkZkYJkItPdpYrwbm/FgLdL/gS2JQG2Cw6UjTNzNc8Hs96SlHullBIv490CRtn46I5g70PvjtEtBn1aiEbjfPBCddy/aoLrj/ZwgSo9wBLdX7vF/EFYE5qd1ssxCUwRW3f7YJdzuqHyBIIDN/tniTIhYmpKxiQGWiFQ7qwdg07R7pxOlWK+YflsKGcW3zIeYSMLcX9uQBHWFK6f9kCfaf/mK5qYMgZHvd+LTz5Va92Nmf7SyU2VwDS5pFBOHoodbZ1Zc3CDs79hBYRxdSmnhrBnJeUvIwKmQv0UErFgc3yPOAxytiwxfuxvYnXiA5SPfs/OAd9VsjxS2QHnERFBozQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q4q70N6QG+ETmSXEE9aDGHuHEyYLoO9ZWp9NO25a1QA=;
 b=iT/RtK/+g7Sl0V6/GpAu3Un18f58PTTdZNAS66TeZIxI+znF1qXvxTwcMxXkL14aT9dW9jiotpZgEg0vYCYLXBIPjOAzp/i71Ow6B6rQXLT84FxqxksEdcxs2ieOjfUMrJKOqUQSFoCHXpeAp2bD/7f2MoKTqQIleOxre+0mMsCsXhRW3xX1JUsFaph8Lu2qEo19IszxM4Qo6/wk3LUG4gF0KDcc/t0bQ/SF2NeyanqtDILo6wpNao4L908eTIee/SfGFwi9daRmHfb5zr/nzC8joQaE4ZBOdjql2UXBcfxknXyvCGh2cqZwP6AgLviXWC2FrcniaYVlwBrS17MgTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=variscite.com; dmarc=pass action=none
 header.from=variscite.com; dkim=pass header.d=variscite.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=variscite.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q4q70N6QG+ETmSXEE9aDGHuHEyYLoO9ZWp9NO25a1QA=;
 b=jLKHDQL/aAEdGClIZZl9cYV8fk3DO/hbWTXF88zOT2fSRqzaIMdUBDwOb0iBARno+ohD/xIW7dOxm5dVVmA8IeZLxe68ddW8mKAXCmreJ508MnFpQ28f6eDYSuQg3X+Qa/pAiKMrzfq0bkwBtSP2Oqwd9/lZMHNkje4G7w1j7V0AtCl1hBSJ1mlY3ihJMTSzXDTIExcxZUn+bAjddcnrAbMOgQZC/lC7SHluCedbTxvBwCGB7+JLLJcvYFc9mknUdlE3PbpRCFf98X+AKar0ZKSu7NAnblVcY6lqopS/JvIzzGeIyluPmbu8U+guWjZMJ3ZdfzEuFFgirncqkLlgLg==
Received: from AM6PR08MB4376.eurprd08.prod.outlook.com (2603:10a6:20b:bb::21)
 by AM6PR08MB3304.eurprd08.prod.outlook.com (2603:10a6:209:49::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.18; Mon, 20 Jun
 2022 13:29:30 +0000
Received: from AM6PR08MB4376.eurprd08.prod.outlook.com
 ([fe80::3d45:c206:59e3:6539]) by AM6PR08MB4376.eurprd08.prod.outlook.com
 ([fe80::3d45:c206:59e3:6539%5]) with mapi id 15.20.5353.022; Mon, 20 Jun 2022
 13:29:30 +0000
From:   Pierluigi Passaro <pierluigi.p@variscite.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>
CC:     Alifer Willians de Moraes <alifer.m@variscite.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Eran Matityahu <eran.m@variscite.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-imx@nxp.com" <linux-imx@nxp.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux@rempel-privat.de" <linux@rempel-privat.de>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        gaopan <b54642@freescale.com>,
        Fugang Duan <B38611@freescale.com>,
        Vipul Kumar <vipul_kumar@mentor.com>
Subject: Re: [PATCH] i2c: imx: add irqf_no_suspend
Thread-Topic: [PATCH] i2c: imx: add irqf_no_suspend
Thread-Index: AQHYhKbNy8DyxLOJYkqA++Q1ekhxAQ==
Date:   Mon, 20 Jun 2022 13:29:30 +0000
Message-ID: <AM6PR08MB4376A823A9B433B68D9F8423FFB09@AM6PR08MB4376.eurprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 2f282c2b-8f97-c351-3048-b42deac5e9c5
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=variscite.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3ef4146f-bcae-4391-4373-08da52c0e7db
x-ms-traffictypediagnostic: AM6PR08MB3304:EE_
x-microsoft-antispam-prvs: <AM6PR08MB3304E42C2325432781C7F0F1FFB09@AM6PR08MB3304.eurprd08.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rbsmNmMYtYM6l9yAf6gDg2ufZ5ZdOGmIC0fGx8tBIbhSpRulXBn8MiuoVmwoeq0bop9sruFvTVQMlJ5nLPM3p3A1/M2+du22Vqqcaui0lSV1wlzAq9eA2KMp8oy5UeoyuwB7J/eTIBDsz7If7k7TRiKspIgvblHB0vanDhgFm/sdqKRwoqy/w9sp4K8aJfJzJgMyPSejr4PHfdv0OhAoMxm/FTvqjdl1G9NOTrmAHUwqYgXSy1JE5mrT21XtMJCAC8t0Ycs6hVhd3M92f+AtblEWKfWtc9E4wDKACIgkuPHNq6aMII+rlCNOU1z0bSdlTSYqbT5oxzU1NcldTBtjxyxWMji6WQsRN41YC2ISwq1Zs/uSQWM55ZzXPbmHSVzvGNyyOF6fWKSg8mMCe4/EL6tEKjrJZf3+wuXL0TmRU6Xl2MN0H8fBxPNylO1lluXNAocc+sDHTYv8Irq/FgLtSlPvdYvsiMyKeEqwcRMAsoyF7Zn3oUQKq679H5CHUTf/7Bfaz+F1f6biGgZcNMYIwdXb4mR2h3zE7ZM3jsAL+woJpzOkzVMz/8a4xeOeUTBfAx4z2DLN6bp4zErbF2ZUY4U17xOCUr9r2JWwu4pGtVUU7KGch4dU8Mv0LQstC5ypEQaFAkWGRVivrQ2zhqZrOfU30H84ln0h0NHSwfmrU6I793pHvQongCLXMKGWk3Psd4W0aJ6/4djdKbg50Sgn2Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4376.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39850400004)(396003)(366004)(136003)(346002)(66476007)(52536014)(71200400001)(66946007)(4326008)(8936002)(66446008)(64756008)(76116006)(66556008)(91956017)(316002)(110136005)(54906003)(8676002)(86362001)(33656002)(38070700005)(122000001)(38100700002)(41300700001)(6506007)(26005)(9686003)(7696005)(478600001)(55016003)(5660300002)(7416002)(83380400001)(186003)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?5wDyPvvAYgI6TbfwR9Bhs/ClDvPQQvS+aH3CQX0zE/kolWJMNK7ZjgBsT5?=
 =?iso-8859-1?Q?HuicxzdTtYVESuCTipv4gV3M95FI95FDjVi3fcqZc93NlfeXUJW5W3+Kz0?=
 =?iso-8859-1?Q?FOPbpWl3t9CTydGsj0Db76AniEFPThp7ovr5VsWBgAl7yXdq5v50xOOroY?=
 =?iso-8859-1?Q?8WZxasbJxNaU+dwTqutO8yURmNhMq+3c2jrDPxymFU4iqXYCjhGxFAh+jG?=
 =?iso-8859-1?Q?BRqTGYJUws0xySPlCseUh/MVqUDsxIQOgyAPhhOZOEhU1v7nB9lNSn49vB?=
 =?iso-8859-1?Q?sJ9nyB2O1lWnG+BAeOjE/vB3UrxaAw/mQ2kt9k05ndZvle67putI1ilSkr?=
 =?iso-8859-1?Q?taPAuml4sTeZlhOF1wAS7rU9wUkBHYFPKR1Dn/lGtbTCEP3tVGeGE1HBdl?=
 =?iso-8859-1?Q?5ImhyotkWpCgQL4WbadIMWS8po65h72wTaqGAiUWHnDXqjDt9DE90Yjj/A?=
 =?iso-8859-1?Q?j70Vbs+CU0vnvvQkpSQULXL6IKJ/nlZETV5oIx999DNihWh+QCyNWa6E6/?=
 =?iso-8859-1?Q?5gvXM+qNZ5hnVhWgiA751IqZDRLH6KNjza5MVoh9Etgaa5OZgb1ZqVL1A/?=
 =?iso-8859-1?Q?JDobCJ9SciQvh8sYfKx+gkbMMWU1kQ6K4aVpZMKESE79cPgnW4XUK9+0bP?=
 =?iso-8859-1?Q?IlbqbsYXDrLbCIsYOY12Qe4byZKvjtq9Gb6GaXZdkYRaS9icPrJ2wJ8Y7o?=
 =?iso-8859-1?Q?+o7klh1BAPitbCJX2vlu5Tb767hYXvhbeqN5Xbm1G/kJq0hHY3iFDOFYpr?=
 =?iso-8859-1?Q?qeSRhL4SIbVJwXrTirvvH/LiHLz46aaFh5GSbMlKUkenTK9SsiStj7F3Pj?=
 =?iso-8859-1?Q?PtVumd/I6UcKGUdxn+ylHM5t07tYkiSEphoPtLg3/flwUKMxoqZLg0yBur?=
 =?iso-8859-1?Q?JaqkAJZq19j9X1AqHoOIPUMWjmY46xoCIU9/jDd3YUmEn7GC/9bsFF7dFi?=
 =?iso-8859-1?Q?iLbI5+11f8sp4+nGx14RVBQCFv7axYTCGeIyKwRSRoNpX3jcMIYv3IaVGO?=
 =?iso-8859-1?Q?nZrypcVH9ZOY8mmuezCAbwX5Gvwgk8WqQuHqKLrX8Df6aBxmz77G0KjvKk?=
 =?iso-8859-1?Q?N96kJJ5DG0w4Y/MYMnUANN3miBSRXTCbfmvf9gEPvVPtkgoUQY0m0sW0D2?=
 =?iso-8859-1?Q?yMVExPZitF+B3OYZHjc6LaSyPqFizp0YbzygtcyNeC/lFVSAJ/zM+yfGxq?=
 =?iso-8859-1?Q?iu5ncVjV1PY25I1MuN/4H/tp3v5dYVvBWU+7YZHUUr+rLk1mceddKxbamJ?=
 =?iso-8859-1?Q?4G5a16K6W0s2SHJlxo4xEJUx2z3fmfNKif4Wcg0BRwYIHNVvHZAEYrl2fl?=
 =?iso-8859-1?Q?p7VC0tfHK2jgNalPIPsAFzc21uiUXQ5aVt60K/TkS8b+TzCIMExsG3Avvs?=
 =?iso-8859-1?Q?C8q6XyyDm/lwRO4/7ytH33/3/18PRmbruU9gQKUDzAYHASG0g4+T9grCT+?=
 =?iso-8859-1?Q?25SfZdHsgYpbmjmZ3+VazDzpYie8YjA1YxwCTHMNMJ5He9UqPzPXkIlMCI?=
 =?iso-8859-1?Q?kQlxT03MMZQX9OB03hh+HwjHEIzqZ8+bk/Cam+CnPAolH4Qoa345g8PjVU?=
 =?iso-8859-1?Q?Wy9Q21GQYT7cfV/IJSlaZymCXdplXrfBlW+afhNCLX3Xk5Wnn/2ZR8uNSu?=
 =?iso-8859-1?Q?yH9qfMrkNISc5mwJB8UitJsr0j2k2uhov7GgXs/8Lu1v8LUi42hF+MS8MU?=
 =?iso-8859-1?Q?Kd1toDy0P02KS8u9orAzTBCy0fdExnQWW3A3b3TehgmYCcZyKEWCUwsULU?=
 =?iso-8859-1?Q?Cvjrzr/6TwWmzV1vkw9LZ2DpSpmBWi1qWidWbw778N+T4Qff59X2q2wYAp?=
 =?iso-8859-1?Q?4kuRFMFcgg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: variscite.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB4376.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ef4146f-bcae-4391-4373-08da52c0e7db
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2022 13:29:30.2826
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 399ae6ac-38f4-4ef0-94a8-440b0ad581de
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7Py4qMLKSJgIulrO3Z8rSc/Z//TU4sHFv7MsRoJ9EPWiaZ5b02qSwh8AvEWGlCC4FVrgVvlBdE4YurbgLfdrfB+4/1epdireWKKlBwvNxaE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3304
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi All,=0A=
=0A=
> Hi everyone,=0A=
=0A=
> > > The i2c irq is masked when pcie starts a i2c transfer process=0A=
> > > during noirq suspend stage. As a result, i2c transfer fails.=0A=
> > > To solve the problem, IRQF_NO_SUSPEND is added to i2c bus.=0A=
> > > =0A=
> > > Signed-off-by: Gao Pan <b54642@freescale.com>=0A=
> > > Signed-off-by: Fugang Duan <B38611@freescale.com>=0A=
> > > Signed-off-by: Vipul Kumar <vipul_kumar@mentor.com>=0A=
=0A=
> The SoB from Alifer Moraes is missing, too.=0A=
=0A=
> > > goto rpm_disable;=0A=
> > > =0A=
> > >=A0=A0=A0=A0=A0 /* Request IRQ */=0A=
> > > -=A0=A0 ret =3D request_threaded_irq(irq, i2c_imx_isr, NULL, IRQF_SHA=
RED,=0A=
> > > +=A0=A0 ret =3D request_threaded_irq(irq, i2c_imx_isr, NULL,=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 IRQF_SHARED | IRQF_NO_SUSPEND,=0A=
> > >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 pdev->name, i2c_imx);=0A=
> > >=A0=A0=A0=A0=A0 if (ret) {=0A=
> > >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(&pdev->dev, "can't cla=
im irq %d\n", irq);=0A=
> > =0A=
> > =0A=
> > I stumbled across Documentation/power/suspend-and-interrupts.rst which =
states:=0A=
> > > For this reason, using IRQF_NO_SUSPEND and IRQF_SHARED at the=0A=
> > > same time should be avoided.=0A=
> > Given this IMHO at least a comment should be inserted why this is fine.=
 I dont =0A=
> > have a full picture about the situation, but to me it seems there is a =
=0A=
> > reference missing, or why/how does some PCIe start some I2C transfer wh=
en the=0A=
> > controller is suspended already? Do I miss something?=0A=
=0A=
This patch has been introduced to fix the following behavior.=0A=
HW conditions=0A=
- Variscite DART-MX8M on DT8MCustomBoard v2.x or higher.=0A=
- The PCIe connector uses a reset pin coming from a GPIO expander connected=
 to the I2C bus.=0A=
SW behavior=0A=
- Upon wake-up, the PCIe try toggling the reset pins, but the GPIO expander=
 / I2C bus are still suspended, leading to a PCIe wake-up failure.=0A=
From our investigation, we can't identify a way to postpone PCIe wake-up af=
ter I2C wake-up.=0A=
This patch is still present in latest NXP kernel 5.15, but please let me kn=
ow if you think this should be approached / fixed in a different way.=0A=
=0A=
Thanks=0A=
Regards=0A=
Pier=0A=
=0A=
=0A=
> Thank you for this comment, Alexander. I second you, this needs=0A=
> explanation.=0A=
=0A=
> Happy hacking,=0A=
>   Wolfram=0A=
