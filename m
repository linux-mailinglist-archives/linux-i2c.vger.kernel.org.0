Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C85DC7127B9
	for <lists+linux-i2c@lfdr.de>; Fri, 26 May 2023 15:41:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230355AbjEZNla (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 May 2023 09:41:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbjEZNl3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 26 May 2023 09:41:29 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2115.outbound.protection.outlook.com [40.107.114.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 880DF9B;
        Fri, 26 May 2023 06:41:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y6NpNStghRyzfe9FQqtm4FxD3txyiDxca6c5dWrRal9Ks8WxTiyScx5gFgO1xdq2Ec+u+mdOypboCRNxLgYj6NCND4Ieh71gGfXziLl5s4J/x94ke8dH5ibaH2h4gIntUPgD4z/nHWN8j0TgwzTdmrSXpWLs6z1Y5kcwSU/LYpL4YbGdnUuy/1xKqu3xOMNlV3LWGAdWd82RbVYADHBdeskDFlh0VIBFvHzwnLh/V26gs01yijNBniRv9NU56O3wneA5WkeB7C18nmxxzqnNcqbcY2180ZzLP9P9rFoS7XznlGD63bj9ppLFLG+fjJpdgvZWmTv27Jv4y/n9odTAaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0pQk13LzYETeCe4J/jMArmmVFTRyeBXt8804/Ukl7ck=;
 b=Im5meANDTS2cX6sEOzHU6AWBxe4OZ7KKfiUHXY3kv3QerwAumCxg6jNuDzDofc4bkIgIITiyyM/PcvoH5HP2+7ivZyO/z40/JvMqPLln4RWvUU6leHaLxNnEirKDhlJMNyebgRdVbbc5NJgpkZQBeVJ4GdhRjFWFZG/YRFLjIlxzx6q0GYPHk8C3X3GgNKBavdPUjC8AwKKDzdZl0N7BGK0W3EGbJwMGbrOYXA46V53WWR4LrFyMasJ+loxO/JO6VzxiWSqFycc//6o7OQTXvQ7XHKMqpuRhIBDSQIAT0tSapatg9o1nwN3SyVMYpRyy1d6alkXxp2jTd6KOeBiicA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0pQk13LzYETeCe4J/jMArmmVFTRyeBXt8804/Ukl7ck=;
 b=leiHjoxEhQGs2XXfx7KaH2VuFD1kdaVnteIlDjqNhyy/nqvl9+Fvq4B25qLxz69nUsg+RE+/eIoLHHGowFXw9NYENNJEGA8B5Y4d4qIUvqZvgxfJV1/73hSXKSVOYU9isvz7oCm4uikCvpPwsTa3KgTiWKWae+GbnxJgnQ8NSdQ=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS0PR01MB5844.jpnprd01.prod.outlook.com (2603:1096:604:bc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.19; Fri, 26 May
 2023 13:41:23 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6433.016; Fri, 26 May 2023
 13:41:22 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa@kernel.org>
CC:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>, Pavel Machek <pavel@denx.de>
Subject: RE: [PATCH v2 2/3] i2c: rzv2m: Replace lowercase macros with static
 inline functions
Thread-Topic: [PATCH v2 2/3] i2c: rzv2m: Replace lowercase macros with static
 inline functions
Thread-Index: AQHZj9aihpQC5ZkPkEO0Mg4SWYxIuq9sjhqA
Date:   Fri, 26 May 2023 13:41:21 +0000
Message-ID: <OS0PR01MB592291E7B6BDF38ACC057BFF86479@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230526133303.309582-1-biju.das.jz@bp.renesas.com>
 <20230526133303.309582-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230526133303.309582-3-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS0PR01MB5844:EE_
x-ms-office365-filtering-correlation-id: c7dbb32b-8cdc-4a9e-2a5f-08db5deee47f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lDIfvhZNr24CZDYN0SSjKJTLFf9RjXE85zJD5z9g5dEG7dQttxM4ra1uJeNq4eSEXZd15OhbAvexUTROnEY5B6c4aXpVBV9IpHVKKZsjpvPdjS/3wyXcksRvCqHEpsKHWnz1mFVYkKiPfsp2ei3QrYsR290s8gB/xvryB7gt5rc0I7iCtb6FJXQoHM7IuoWQvjQQO3eO3DcQilRtPZipGkgwTb9QybhhBgMP2eRI6KVC+yHtKREzyVlxPR0/e9l6oQNMhcRMQ10DLpNg/eLszLf4FzcQ6y7IY0R6JZ0rFQp/LQZjOr/0nEvNZgjtty4FYW5Ccfa/F9DKw3QAL8/SNr6h2CEgktSOt0ofhnhuNEP2m+ECNMY2TdYHZxDeH5UCRtKHluNEyVCjIbep4LM/2rhqqk+CkQKy/N458K8unsHYppWHMo529eBYs19GsH6y6avPRWimYQsXkFEo/yFC5iNTUVw57sHh0Q9oj5bR21ujDqPIfQIROixbVVh9O4vPHNQO/SrhNfyfGV+rvQjozU/KhaHIEp57zImwSQSfSnpBmY0T3mjroYJj0uAyT59A+Ef3Dg0cx+bHQncgWTbKVgGAYo3DATy4jVHQlDhcvMg9Nqf5RvXZBXr5B4v04jR0
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(346002)(136003)(376002)(396003)(451199021)(6916009)(38100700002)(4326008)(71200400001)(122000001)(53546011)(9686003)(6506007)(26005)(66946007)(64756008)(66446008)(66476007)(66556008)(76116006)(316002)(33656002)(41300700001)(7696005)(8936002)(8676002)(5660300002)(52536014)(55016003)(83380400001)(86362001)(478600001)(54906003)(186003)(2906002)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?G3KdVlssIVkf/ToepDb+4KD7hxrC73iMj6hwtPiCbrgeI/QhothxptBkFoJ0?=
 =?us-ascii?Q?oyh4jsEVY2PuOH09Wy924rJcUGWbibTnmuAio8JFwSDxwbRv0E8VMldUGb1B?=
 =?us-ascii?Q?uCmMToJlBzThYDIL++MLXsuxGtMO+Kk7zv4B0rneAsXNFcjbh8/9OeGL3YiX?=
 =?us-ascii?Q?SsQF83oqlNs8MT7vYrmKRRoc2iF7qbrVL9bA8Q/thLt2MDEXJlZkoGkILjXf?=
 =?us-ascii?Q?lvLUNDKp8maOfLirKYEMrKAjRF5TJkv/XRlDG7O169CW7H1RvB8srs5kPL/l?=
 =?us-ascii?Q?XIuZzIZP4KyOVN/I3VwRH2gITehEamAUCJMlimpFR5AZ/pGxPfB221R7CLJu?=
 =?us-ascii?Q?RzmEqK366Rms+Cw1x8QAL9yOWo7gWvOf4nrdtO6/+9bKVySTEHhvSbDxPSEs?=
 =?us-ascii?Q?CxX4PCOyCdJyppSXiPq+qJR16CLMTBXS+OKWSCv1aK4k3VTMhs4ZYbU8uj+K?=
 =?us-ascii?Q?t5+eSR0QBYI4vNlHBsu2LKARH7FWFwkVHCafu99EJfeaQHbD1lb3n21LKzwu?=
 =?us-ascii?Q?uW8Tb0i8oxlvdJAdF0JU5ntbo7NfkbeJ5hWbtde3kiK4qZB3oAjpkTMd1Oqb?=
 =?us-ascii?Q?amOFhblAJwlABakkYkI8bKDXl6ADgreGgwJjrA1ClW6vZG/MR6c1o6POawHu?=
 =?us-ascii?Q?2fG+ZHRsKHVwoTEgnQFYNLa+72cq4bzAKyOPlDXQiGZPNSC1h1WWhmcDXvto?=
 =?us-ascii?Q?n8+B2XijOKkGW2rcR0jJCEm8Q056sO8AAao49MDe0YzRw903PLTTeoAhEzuG?=
 =?us-ascii?Q?i91fAkp4Xch8e2xUlrne1pd4+GjiRB7LGVR7BDL6EhGw4KSwDeA3mD+bFRvu?=
 =?us-ascii?Q?FdpkJJYJZZc5Iq+YNpYcvzslORwIxF7gMJyJzDrgpBrEy9ITYmWME+uAy5IM?=
 =?us-ascii?Q?PRZgfhEqe6f/ThPV24Of0tPbqL9nWQc4iFXZ2P/b2ZIVaw4Mxn4Z8lT8qEhC?=
 =?us-ascii?Q?RyK7XMcVX7ix6KaLwU9+GWZmjairYLeDVZiqiQ9G3ND/KVwDIo/cxI32Lq/6?=
 =?us-ascii?Q?iZt9Tru1CPjDl9aeMKsrgmUH3lgs92K6jv0wcgOlqFI+ceItWvDBlVeRYXcv?=
 =?us-ascii?Q?A3a7KED6E8rIuvm/5sLWm+r5xiDyoD9wOsaOTEtipS/U6t6sSfBxDB6fKMwm?=
 =?us-ascii?Q?B2iW9lziK/tBjwJkPRSa/Vzr9qQ+XWMUuCMfvFVkBcnLnji99TFUVvQnV0H+?=
 =?us-ascii?Q?Hi7uOht1YhuI2/NDG3ZJRphllhnhJbdRhKLmOWGLTEKLLF4yA3xbT1LrvOWG?=
 =?us-ascii?Q?cZtrsNkbland5glpuExH7BlKt7v99ApYHHMf2Qfva7x+UO+6uiQZJqLOMucv?=
 =?us-ascii?Q?EgDIneYYoBOx/1v2zVpPAt/71b0B++HD3zL9eW2Wf3KDr99N2fqoYUiwBtJV?=
 =?us-ascii?Q?W+W1FtWY0O2eqeeLxpwflS3goCy4/R8mc6D8rPDoPouN2Xb5v8vZ9ghFDPLe?=
 =?us-ascii?Q?bSWJrXOcivqHyytrhL4jBLFIrm4RyBAJJd2XkWhePzXLUuenef6h67PydbB1?=
 =?us-ascii?Q?96XC0SCabzSQPKXnQkrrece88WNgIBZERXj27HYAsGAVl2B+OazXWA/ll4Nb?=
 =?us-ascii?Q?j9X3HHnUgM9yyqd191Ysjjce82fcYI5elOC4JyRH?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7dbb32b-8cdc-4a9e-2a5f-08db5deee47f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2023 13:41:21.9601
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7dr6NGEyWfpLSxvoC9Hj5a9APCpLzY4/J8rpwvs7C6//+5zDbtasOgAWhESsQUwBWHX+fjyTy8zBPg/C1NjkyQuwVf/huqDYdCJhg1jMREg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5844
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: Friday, May 26, 2023 2:33 PM
> To: Wolfram Sang <wsa@kernel.org>
> Cc: Biju Das <biju.das.jz@bp.renesas.com>; Andy Shevchenko
> <andriy.shevchenko@linux.intel.com>; Philipp Zabel
> <p.zabel@pengutronix.de>; linux-i2c@vger.kernel.org; Geert Uytterhoeven
> <geert+renesas@glider.be>; Prabhakar Mahadev Lad <prabhakar.mahadev-
> lad.rj@bp.renesas.com>; linux-renesas-soc@vger.kernel.org; Pavel Machek
> <pavel@denx.de>
> Subject: [PATCH v2 2/3] i2c: rzv2m: Replace lowercase macros with static
> inline functions
>=20
> Convert macros bit_setl and bit_clrl with static inline functions as
> normally we'd put macro names in all uppercase.
>=20
> Reported-by: Pavel Machek <pavel@denx.de>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Updated commit header and description.
>  * Replaced macros bit_setl and bit_clrl with static inline functions.
> ---
>  drivers/i2c/busses/i2c-rzv2m.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-rzv2m.c b/drivers/i2c/busses/i2c-
> rzv2m.c index 56d0faee5c46..8518ae5dfeee 100644
> --- a/drivers/i2c/busses/i2c-rzv2m.c
> +++ b/drivers/i2c/busses/i2c-rzv2m.c
> @@ -50,9 +50,6 @@
>  #define IICB0MDSC	BIT(7)		/* Bus Mode */
>  #define IICB0SLSE	BIT(1)		/* Start condition output */
>=20
> -#define bit_setl(addr, val)		writel(readl(addr) | (val), (addr))
> -#define bit_clrl(addr, val)		writel(readl(addr) & ~(val), (addr))
> -
>  struct rzv2m_i2c_priv {
>  	void __iomem *base;
>  	struct i2c_adapter adap;
> @@ -78,6 +75,16 @@ static const struct bitrate_config bitrate_configs[]
> =3D {
>  	[RZV2M_I2C_400K] =3D { 52, 900 },
>  };
>=20
> +static inline void bit_setl(void __iomem *addr, u32 val) {
> +	writel(readl(addr) | (val), (addr));

Oops, forgot to remove parens.

I will resend the patch.

Cheers,
Biju

> +}
> +
> +static inline void bit_clrl(void __iomem *addr, u32 val) {
> +	writel(readl(addr) & ~(val), (addr));
> +}
> +
>  static irqreturn_t rzv2m_i2c_tia_irq_handler(int this_irq, void
> *dev_id)  {
>  	struct rzv2m_i2c_priv *priv =3D dev_id;
> --
> 2.25.1

