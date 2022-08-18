Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8C35598919
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Aug 2022 18:43:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344877AbiHRQlF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Aug 2022 12:41:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344881AbiHRQlC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Aug 2022 12:41:02 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5ECDC00FF;
        Thu, 18 Aug 2022 09:40:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FrfSQ4dINPXFS2PXRjxWVBALKWAcd3eimlt8xfnTsY2BapxeevSL5QujanqzQ1G2XhHZpQiKPbobUt8FLNjHevCXgqzm21iBRaSr3M3KFgRKQgKIlXNYyv5HUkhFqulIyF/QiyhUhBfTOsL91TlgRwsne2Y0fw2VSCO3fmEwV4ePbsfDIhTrS1DgBE1B4GoYugLDierDMNy4qFdKg8kd2EJEvyncKCH51h9r0ucj8Y+X69FQchFzkc1p7ltvZGxCo6d/DElOZUg6enRIRZ9LOgjCRnv86COrJC4kQz5S6Mk6W0OvnqlTBTkjX+l0okA6eKYp7A0p/zvtjJvGEBQ4Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RexA9UBwVptnBTZ756vdkTdcdjUKUCirC2b7ScB3lBs=;
 b=K6HAASJ6pUFw6g8P2zQt2RWnpZzzaKC5+T7wO8MW2JWM5G0lMcxhiUVjHqu4JR4eM+lHFEEQzqCg2O8+ERYufV0eQ6p9OOk85jis14vn/LQ7yPKUQb4mRcQspYiaubWRDf3ZGB2wqLIwU7Eok1j5+in28vw6cr5GgLoMGYiUuwRxMwXTbVww8G7eCJAA4XkVyx/x8Y6KSYiTQTaxc0K0e3j+/EsHEtuEfuwuMIxxWyasB3GmTFpwR++ToR00cEDB1WXgj391gjtn6aj87V102BaMSTaI+6ULgp2WAOEMpYzQgPGnh60R7HkxqCGDUzVsDH+7sESSvXroriO8AXSiYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RexA9UBwVptnBTZ756vdkTdcdjUKUCirC2b7ScB3lBs=;
 b=hVvukwZTytRnEX1O6CAYTHJGkpbuc0ez98DAZPzUE76UgivJk0/8ydoARNzcRusnj2FXjt4M67hVGm+3IfQktbOcijQV+LAqc51tBUL1nBsYRYjY84GtC5oY7jl4MOmnc/BkBKy0JzCGnLEMhl71t0Redenq6S/asJ/OKorync/EsoqSUNbqohplsoqO0P9WQHRt85faYRpfE2QP28h7NQXNe8I8Q/AqSeYoS8WrS8eRDFV/bsNaAjrCz01FzbinyXmtKrLCL+ysEE/j5f9ykozNQROtgrodWVQUvIT9CxCErYlkT5u7742LVu7rWk3ocz2q2eqfM8/O3Rb8ZuV7YA==
Received: from CH2PR12MB3895.namprd12.prod.outlook.com (2603:10b6:610:2a::13)
 by BL0PR12MB4675.namprd12.prod.outlook.com (2603:10b6:207:35::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Thu, 18 Aug
 2022 16:40:54 +0000
Received: from CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::25d3:32f3:4be5:da11]) by CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::25d3:32f3:4be5:da11%7]) with mapi id 15.20.5525.017; Thu, 18 Aug 2022
 16:40:53 +0000
From:   Asmaa Mnebhi <asmaa@nvidia.com>
To:     Wolfram Sang <wsa@kernel.org>
CC:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Khalil Blaiech <kblaiech@nvidia.com>
Subject: RE: [PATCH v1 4/7] i2c-mlxbf.c: incorrect base address passed during
 io write
Thread-Topic: [PATCH v1 4/7] i2c-mlxbf.c: incorrect base address passed during
 io write
Thread-Index: AQHYscMo59o17RgFDU6O7GkYAYNjea2020kAgAADfQA=
Date:   Thu, 18 Aug 2022 16:40:53 +0000
Message-ID: <CH2PR12MB38951132E24E6F1EDCCD18C6D76D9@CH2PR12MB3895.namprd12.prod.outlook.com>
References: <20220816225412.9095-1-asmaa@nvidia.com>
 <20220816225412.9095-5-asmaa@nvidia.com>
 <20220818162728.lnq5y7qzxbdsyexr@the-dreams.de>
In-Reply-To: <20220818162728.lnq5y7qzxbdsyexr@the-dreams.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1111da6e-1ec9-4205-85f4-08da81386af4
x-ms-traffictypediagnostic: BL0PR12MB4675:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tMbxaeUVoFV1LDBo7qgxg4L5u3dblU4NaVEiAwQfOaZ5zSNIUYLusyqpJo1Et7KNOZ3iDN2ozdXdSak6JcWlxqDnhsIUlFQWEJfCtNTzm3/ppzCp373AQ9A8QIU4seJNyjhhVdd4M/GJ7oP34RBuL0Z+D+S6mu1cd2rxIONobVkxxUK//yUK2YPzQ/DH+uHVP0OCa+P1hXMeZj7szKgOYgZCWqT9MDRl3pWdOikqBeJtUiVrIw41d23AwZfh4B+M4MJGfGOCxt/l41as04ig9CWkEH6i9EZ1Argd45GxKXZv13/GjFPKcisTKdzfLrFtVkxj78V/qhc3ADv//zGPAhfSl8Nng/Islshq6/FPooINuCbUMyl2TAsw2qZux/gpgZyUiuoQWMkLM/7muVUtzFrEcfksqFxgPp7CoD+Ws3l11qtBl7eyOM/8Rwo3865zAUsif3ri9yM8ranvLcs9Xl6Cq23g4+tq4rrA6YXda6T8e4iCHN0InbwdvCXYsGqQCPgPTw2iV2kyAMYdbAqpRFQUJIi6+xauZvxxORHLvFPH8ngZCp7uzBit3YtNp40FdFY0D+CG9mBJMjd0lGEk0DIvo9UFextVQ1+N8HJqmxfbh7pK2Ydjdas8BLnex0/9CoGO7Jrtey3AhNNnaQvgya/nBA3SiyLrTTuPJt4bn5k7FEGLjJxNT+xsUa1xmKeTZ/OaIGH/85xhTV7sZ3ocoChJZ9YajUAGCKxxWZFeiu8gu3G1SEjNMC8ijh5hPhXB4hWbvf9EeID857XmjKKEjw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3895.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(376002)(366004)(39860400002)(396003)(53546011)(38070700005)(6506007)(26005)(7696005)(38100700002)(83380400001)(9686003)(6916009)(54906003)(122000001)(316002)(33656002)(8676002)(76116006)(66476007)(66446008)(64756008)(66556008)(66946007)(5660300002)(52536014)(8936002)(478600001)(41300700001)(107886003)(2906002)(186003)(86362001)(71200400001)(4326008)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2NbqhvUosvph9S0Qs4oLy53ZiPQWrRUCg3Ieoykm2Txudm80p5Vq94dAurUZ?=
 =?us-ascii?Q?X38CxiNwWwSHicdmf+bbdRov3quUZp+ssmh/+VtEVsofF6JtagCDAsesQv3Q?=
 =?us-ascii?Q?nxDBSb39wmv45GvJT76mDNQuMDfrRKbTDQYQreQJ9SsKro9CB0Pb9ncbM1je?=
 =?us-ascii?Q?dZ8YpkOF6mD1uvKUnjkfdVt88m7w2l6RNx5/9tl0ShMT6LoCGwfocc1CMd1c?=
 =?us-ascii?Q?lPGLxB9CPwe4vTeMxorDPPULnr0q3+4hP9T5tdGACIV0FbioPiOyntX9cmRJ?=
 =?us-ascii?Q?xNK9wpkY5DenLycb9IhJ3R33Ae5SerzX+NT2KPRSAHFMqJb8kxEPDDqtrnu0?=
 =?us-ascii?Q?tHJUmKTZfHsobXbDVZRomguPONjshgA7y0PmapnFACJ0G66W9osZHOSot8Y+?=
 =?us-ascii?Q?yTKU5P3Kz4KIzeAWuM71E7WrH7r2tcjiZ+S22ZL/hVI2oQNG6k1U8+zl9Nf6?=
 =?us-ascii?Q?Ebpf3uIpwtVI8bfQ+NWXefrxgmOMV9Igm0hHvFTgLpgRisFgOdqmKmiVvF6U?=
 =?us-ascii?Q?BpnyJtPaRg85cxvFP/aScp5zGAzmFvT8pjU5QGA9mMfpSYvvzPRa60HfxLqb?=
 =?us-ascii?Q?zeXyukFlJzicQS4lmmvIxnLBVZvDd1vdpap8Mu9V5Yshkh0gbZJcTTBSVfVk?=
 =?us-ascii?Q?Bo9rVU/Bt7hDtZB+l4MXw0Xd8DeHacXEyXLew4kqDTv6pqA6Jqimh5Nqs+cC?=
 =?us-ascii?Q?VlUBBRhy6kCfsuyQI5J2ZwLyat8hnS1l5dE4QjZN6UVmJuiP04ryLAX9ksZT?=
 =?us-ascii?Q?3YegFCO2kPI1LuwDs+RhvsCEBpZ+VkWc96bot5qkA8WPZeZ5ENvygqhKw70f?=
 =?us-ascii?Q?aKBPfaAqHT+fSo1LvCRg9EZdwtBfJkSkKVe6VljPpRZyA5iBq9lafItdzEWD?=
 =?us-ascii?Q?6YgdDu7jhiAYCfaxGxlnYcRVL2Jqbn6UgdUE13Zgx8RqShGQ2iqit9PdE3cQ?=
 =?us-ascii?Q?Yin3FPWsU5dVJaSEK8+GV135PVj4j0xC9MpE+2H32LsCapj6caHG4o+iRBZQ?=
 =?us-ascii?Q?SItH1MkERlRTkXb+OvYBJsmiNYHU1v9v+g4qkwfrDEdxB/jf/ADv4pvZe0me?=
 =?us-ascii?Q?Wl/oCLqP7QVXgTHwVu+no/5kM/8e5eZwJDTCUppcrLOljspK5cmkjEzY1pLA?=
 =?us-ascii?Q?bDqUkIP+/QvamS2abTy+4eFpoI36GQcU1Y8aPzdhZtAqjfxz0MuKUBVNRcmO?=
 =?us-ascii?Q?0ppgnm0tpxu+Y10wU5pXkxPlBQhr3uzTNSbY2SUvl7oyY79m8pzTSbBsZNdh?=
 =?us-ascii?Q?xeFes78QofUKDMXIxsCxN1/Ezk9fGq6K487JAIVTfrDlPrUaiVkYb782qGB1?=
 =?us-ascii?Q?PrUJq+1IHcJrPbEeOWSUz1Y1feelP+C7aUu+XoO6tYVzB4MSPisqUvGPjJnw?=
 =?us-ascii?Q?qt7gzia/SKFfgL3ULK/HiHIkI9O+XHyrONSPPrDG+89C/oaTo78qVOisTPVo?=
 =?us-ascii?Q?GUX3XVlOszXKwgT+M32lCgacjNWWidHL34GAdnnonZZukPn7DLyPo3qYY9Ck?=
 =?us-ascii?Q?B8k68LVw8CHjxyaS5dNhoTT7AgOxXDY3VZrz5VrqANZ86mYJBPDZ1eCzd82d?=
 =?us-ascii?Q?g7YNzjQJNbjdNvtOgl8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3895.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1111da6e-1ec9-4205-85f4-08da81386af4
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2022 16:40:53.8283
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B9EvXdIAczvZPvpFAhdAeEqAowczBNz60Jib/4c9PtvcLU7Ve2c8SJV4xt5E5AKVaBYFTfI4KjUha59g275Ntw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4675
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

It only worked on our first generation of BlueField (and we were lucky I th=
ink), not in BlueField-2 gen.

-----Original Message-----
From: Wolfram Sang <wsa@kernel.org>=20
Sent: Thursday, August 18, 2022 12:27 PM
To: Asmaa Mnebhi <asmaa@nvidia.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>; linux-i2c@vger.kernel.=
org; linux-kernel@vger.kernel.org; Khalil Blaiech <kblaiech@nvidia.com>
Subject: Re: [PATCH v1 4/7] i2c-mlxbf.c: incorrect base address passed duri=
ng io write

On Tue, Aug 16, 2022 at 06:54:09PM -0400, Asmaa Mnebhi wrote:
> Correct base address used during io write.

So, the driver never ever worked? Or were we lucky that it worked somehow?

>=20
> Reviewed-by: Khalil Blaiech <kblaiech@nvidia.com>
> Signed-off-by: Asmaa Mnebhi <asmaa@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-mlxbf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-mlxbf.c=20
> b/drivers/i2c/busses/i2c-mlxbf.c index 39051c4a6db2..02ed6983c35c=20
> 100644
> --- a/drivers/i2c/busses/i2c-mlxbf.c
> +++ b/drivers/i2c/busses/i2c-mlxbf.c
> @@ -655,7 +655,7 @@ static int mlxbf_i2c_smbus_enable(struct mlxbf_i2c_pr=
iv *priv, u8 slave,
>  	/* Clear status bits. */
>  	writel(0x0, priv->smbus->io + MLXBF_I2C_SMBUS_MASTER_STATUS);
>  	/* Set the cause data. */
> -	writel(~0x0, priv->smbus->io + MLXBF_I2C_CAUSE_OR_CLEAR);
> +	writel(~0x0, priv->mst_cause->io + MLXBF_I2C_CAUSE_OR_CLEAR);
>  	/* Zero PEC byte. */
>  	writel(0x0, priv->smbus->io + MLXBF_I2C_SMBUS_MASTER_PEC);
>  	/* Zero byte count. */
> --
> 2.30.1
>=20
