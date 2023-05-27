Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDAC17135AE
	for <lists+linux-i2c@lfdr.de>; Sat, 27 May 2023 18:15:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbjE0QPZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 27 May 2023 12:15:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbjE0QPY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 27 May 2023 12:15:24 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2110.outbound.protection.outlook.com [40.107.113.110])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEF60E1;
        Sat, 27 May 2023 09:15:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lcUl5SrKxhfjbQh9ZEwgMf+y3dwGLkpmz1C4dl3cZSIKuS7mproWcJHVLWJ560UpJYNbJ2/ZERDHqk8dpwD9CDI5jBdy9GoMGNvEQi73bWy8XWIY1vSAGrbpckI2eapcFJZpzVi7sh4RHM6H8qFzkq1M2+xU/DwG0NyXyTOy3NteajDspb8wqEkWEPjEUYbXzFigtYIcnN29URYsYzo119+nsF9PlwFRyp8sBYuIcNUsOU+IZC8UDeBzj6xDsVOdbMGPB2ZBTJpPYP3ifU6Ah3I6e65KA/GrYL0J5y1E1toIV3wyExEBD/jrIgrKMh54GnV40zw4+yhHR3IQSp3svA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c8ZkYrUjDjsAiaNeR29WyXMjpa5+MR3t1Lb36vrXk4E=;
 b=C+AZvp7fQHz5CbsU8SGrmR2x9eS+R4rd+sjKmuOU7fO8MMwLTDkx6Ep+dpAXUmaVd+cQ6765+XryFWcbQoeCoRb+025iOUWbQ/2nZIfL7/oWNPowyD8UXP6I6VMur9Eg7lFY2JkbNLrMGbOiy8TXsEaDaYaEYOP4cnK56sz9S86XGJ/yhHG/8iD2nf3J40Us2bCWxnkupMTOwwuzXzdr2pCW7l/uZ4gzdZS2y3iOALGQK2mz9/lbOjycVhcZaDx/Xe7lYKpONLPOx0F/yWTezaTTEbmGHgYMz+w/kMVz6vjuuHFbkHAjKnQG8ikb18Xzcxcewh6r5GyzmTqIyTsm0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c8ZkYrUjDjsAiaNeR29WyXMjpa5+MR3t1Lb36vrXk4E=;
 b=wd5SAYw7PhVF6PrJJEkVt1+T1PNupDM923oM/Hd1QfAfcfD9g4FCgcZFRbTTL7vT1NHzIjbVHTfrBOFiutKQZLT+68u0If5/d/Ta2yBvvHYRGfM9UMwPwXlepVTgY2mXO7x7CFuYRuwbcDTnWpXJo2RxcTAKZpgj15ipVL+P/PA=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB10197.jpnprd01.prod.outlook.com (2603:1096:400:1ed::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.19; Sat, 27 May
 2023 16:15:17 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6433.020; Sat, 27 May 2023
 16:15:14 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Wolfram Sang <wsa@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Pavel Machek <pavel@denx.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 0/3] RZ/V2M I2Cdriver clean ups
Thread-Topic: [PATCH 0/3] RZ/V2M I2Cdriver clean ups
Thread-Index: AQHZjxAnYpF+4f6x3E2z+KY20oJWUq9ty9OAgACB74A=
Date:   Sat, 27 May 2023 16:15:14 +0000
Message-ID: <OS0PR01MB59222CF103A34FCA5471B97E86449@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230525135226.240732-1-biju.das.jz@bp.renesas.com>
 <ZHG+x9J+AAYYTumR@smile.fi.intel.com>
In-Reply-To: <ZHG+x9J+AAYYTumR@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB10197:EE_
x-ms-office365-filtering-correlation-id: 1c18f295-6fda-4a3b-39cc-08db5ecd8de1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +uIUpFye9p/Dtek8GxUMyTCArdAEX7rUMSMjh4Pvst6/H1rckNxtkyLWa2VQrF9Ev5gIn3ZqXTkjgGH76XfzMRREYukNgdjXqCSL+3SVCKQ9973C6rOG6htrr8fEkRFnk1a1Y7Os6HLh6N0nFDiukaHV/yWKzabUhqs+KDpyG402+e2ab3gpfQUy0qYUqkps+iPOOmRgAb/v7p3Be2zpb2E4U7gUKgBtJ40PoEKSRMjgpjxVFPSyCmWbg3yN6zeLPKMoAWWbA/VnBuCRM/b9aqrJszIx8THoCTjRIC4ifySiZWfTCXNB30FZc2vKtAn7HbXCGTWNm/h5pQyW9G7bHvfgbapNWMohA7xc/dr8bHQFm5EHNgVj74HU3BZMzIPbOy2SeQk0TVveVe4J8NZSZKvA3XYpQnE5/CcqZeBWscJY5LbVjfcHFrhXeYM9nYZG/l8WqGjOwlZHivW2J3XLr3c+GcUk9cpRbd7uexU8KzRi62UdHaXNkBChtQa7XWUivd7Fg+T7HUM4jwEoUBnrgX/kTirYw9kGjeEmZGyOUPx2nzPTYWqbhHgVBlP9Ueg/K1+DmxrIR5mgS3fzUKIhOT/1KN4Di8NmI95MoM0kCCM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(376002)(39860400002)(136003)(396003)(451199021)(41300700001)(7696005)(38100700002)(316002)(8936002)(38070700005)(8676002)(33656002)(86362001)(186003)(2906002)(4744005)(5660300002)(6506007)(9686003)(26005)(966005)(52536014)(55016003)(478600001)(66446008)(66556008)(66476007)(76116006)(64756008)(66946007)(54906003)(122000001)(6916009)(71200400001)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?G1rsIhonxkOP+XtOehbydHCygE6wv++iOor5/bn3DXcs3Y4tEEcgn/J0jvqX?=
 =?us-ascii?Q?2Mlia4dntoeVONXFJ0d6EdAnk7FzdojwG3WAUULGQ0i0RYOn/ejmW9XEWRXL?=
 =?us-ascii?Q?j0IDVel4WuHKiSnMFLB2kQs/pjQowsitd0vhkTHDdLZByEfXS2OvFvGl9uwt?=
 =?us-ascii?Q?uZRsMke1szrmU+rmMfLnGHfusfoSnB2BG614cERqGAqMrRW04YK/W+5S35H8?=
 =?us-ascii?Q?CQvzWI6muCcaOZOQFu+DUZZvcyGy7SXM855IeDN3MUt79CbZOPX0d4Jcx9fY?=
 =?us-ascii?Q?nQaO42F3bWc7L+3RYwqU/8gX6A5UQ0iY1F/0BOS21DQ78C8w1FbSsvd+NDyI?=
 =?us-ascii?Q?+SWvNCybdRTEgLq2jVN5d/sxdzLnf0NuxkXIW3P2UFoB6PTWyDnbrD1IReZp?=
 =?us-ascii?Q?0GMDbp0IhXIL6iBCCqHOZxo+0viiNwJ7Chqw5vfIF0kekbO+oFbiKlqyJNlc?=
 =?us-ascii?Q?2lrWluXl5plph5X7WiaQT6iKx4L4cKdQD/quz7oNFZRv2RcwYmyxMIJt+oG+?=
 =?us-ascii?Q?s12cJUwF3y4wXK1h2SEB+nCLTwEWgiT9Mr5qL0doO7beqK/JvgwN1Xf6lPkW?=
 =?us-ascii?Q?5AJT9xpONlQJedAVQFIviCu6OHmDfppzDtQ1MlW9VlEf4cLbi1yCoUzK5yvv?=
 =?us-ascii?Q?Z+ClM60l0iFn9EFq4E8nAhdU//MZQyi+ue+3ETyFxkUuuvPuBHdvmJteCwiR?=
 =?us-ascii?Q?h4Zia9g2tSU2M/86ea093ggcs5hLnseqLGbpbG8HLD+IS6wJj4uxjFMkCQiX?=
 =?us-ascii?Q?FxcNuyZ1TUAeZx5gn86/Aqfnf43Dls6jP6RJnW9kmSG6n9uPOpDYc2ySA2XP?=
 =?us-ascii?Q?ZGn1WRJ2NFC5rUehrkMReFFhRI/CULdpnqXFnpsxis69OOypfXB6zAcN0edT?=
 =?us-ascii?Q?A9fARHrfLuiq/IrXNDg1cxPpoYsLttqbMtmmwAK1vswV2mxoVb3LgX9y+jOQ?=
 =?us-ascii?Q?PKRipwTn5SD7lVKVwdhdTvqQ5k9iALLn27vXkiNqSYgCrVamuM9Wa0XmCjKs?=
 =?us-ascii?Q?9voHtBK/pGUPSZ00DgHxqrv2q1uVUrHXc1oHmT6qL85KqJ8svi2Fqv27eZyi?=
 =?us-ascii?Q?/P+kCkYVFUzqP2AYKnHh7exUCqVcBZSxcH6LQvwMF1OFn3cP5K0gqGqtTaft?=
 =?us-ascii?Q?F3/pEWc1hZuMCUyPgF8E/oT+qFtA+Cw91NmGfo/bbHwLrWJTgfWZpl3ndgeM?=
 =?us-ascii?Q?TtJaS6O8iJG+OXft8UNEITcKEudMKyIUTBdfc/EeILiY94NTDaIYQiYgl/in?=
 =?us-ascii?Q?eajFJLgE5oxRFb0ZGLJ0t4kWltVggtUuu50Dmf+9MyvsxkQiCyigKxkf6HSD?=
 =?us-ascii?Q?N5lyANWRdR5zKako7ErjPoKkjgtZ4GxOlrRPetiHzOmKWjDGchB9FKVJQ0wu?=
 =?us-ascii?Q?YEYlmxPWijisosnhOORjzBVdivISHPpelr1Xhej1md8ET4XsKl0OPCnaHPyl?=
 =?us-ascii?Q?u1XnKsLm4gG7+RsrPwba+E4plwfsKD7dhYg4tooQSGfF31d7/Zae+i+dSoUx?=
 =?us-ascii?Q?tbMt6u7U5TMkIIgl4GWCUXCvX5396eciYjo3mRfIGH/LVU/DhOl9B4GH1mOe?=
 =?us-ascii?Q?sTUxqCMy3dKp9JH5oKQ8j73pTv6NJIVa+TTDvVMT?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c18f295-6fda-4a3b-39cc-08db5ecd8de1
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2023 16:15:14.4565
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8PY+zRWY3c5pvPhW7kp3UjiIPktR+ks9dQiEnbHx0/XgJMErC3JzIp0kp/YDP00C5uEjkZpLsnInVihTUUCjVzLdc5qbc+3C9517mVzdgFc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10197
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy Shevchenko,

Thanks for the feedback.

> Subject: Re: [PATCH 0/3] RZ/V2M I2Cdriver clean ups
>=20
> On Thu, May 25, 2023 at 02:52:26PM +0100, Biju Das wrote:
> > This patch series aims to do the following clean ups based on feedback
> > from Pavel while backporting this driver to 5.10.y-cip kernel.
> >
> > Drop extra space from config help description, Rename macro names in
> > all uppercase and finally in probe disable the operation of unit in
> > case of error.
>=20
> This mail is detached from the series.
> I suppose you forgot to use --cover-letter option and/or --thread.

I missed adding email addresses for cover letter patch, while sending
out with the series.

So, I send the cover letter patch separate.

New version of patch series can be found here [1]
[1] https://lore.kernel.org/linux-renesas-soc/20230526135738.348294-1-biju.=
das.jz@bp.renesas.com/T/#mbc7757b1417e301a56d30b8533ac36493c19d693

Cheers,
Biju
