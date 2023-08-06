Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 350E3771596
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Aug 2023 16:21:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230338AbjHFOV4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Aug 2023 10:21:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjHFOVz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Aug 2023 10:21:55 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2085.outbound.protection.outlook.com [40.107.244.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49540E49;
        Sun,  6 Aug 2023 07:21:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RtYCfM2AKIAVBUhPvf+oDA4umDf5224YDecpN/NEjH4BK4BbkiblIrHrTHI18adIntoHi47dipVendtD9ZVwUdTniIg5YFLpk2JnMvKsyvUVKDeMcqTLTQs8kG+dYBHb5PLVvdyDJb/6ft9TXllUi5HV+Bs5T/PcGAi7vZ9fRnwCcuw7RoiNPHm5YatYEaAKUC9d2hp9wR9IwPcpAuKN6J9et4mL/qAixRwcgL9ljuF4g8zZH5RoOBvI/LxOw1g32E1PsRUPfhCykVvV+3MTuUVnq7pV7KaMqSpwyZ55flH6zAAuh2jRB2l3O76RtlYOAziBj4C27fPjY9UrIbc5Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CtqaAs7HS2Qzv2XvPgo5eQA/BTuLCLd3genJkzQgNfU=;
 b=AXOElirZWdwhV5Sx5pvPSWUY5/I1oPFtL3Vk5wcJdO9qmjQ5WydpsyhTBPPTquA0t3A3JQ+PYe7VTc6k1xnJyL+ruP8U4WayP7mDolI+40GG4OP88ADpiE5WRUNRnCllLA2uIpvk4mENyrpJZGJ5cani/6egFiH34P2E8Q6xO5Mep0ghknpS9UierUTdQXhu7cySdBci09BlGQgjPKs8n8FBoXVSQmsA68fdTuYgDcreeZCIwjcIOi/70P2PLSGVkfr7qmkNcq0iDBtyo8X+3j6u5g/jX2XoQXL5T7qpqkVXdsDRlFJy2osifo2ayePGCqDGgcm/d1LuoJ57eSzgCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CtqaAs7HS2Qzv2XvPgo5eQA/BTuLCLd3genJkzQgNfU=;
 b=utjbH6w64sLTSiHPFkRQTQ9/3kE+5fqs0N4pApcW1QWv7eX5WCeuSKFEJ1XBikBKhz82/L/CLiM9cvu2EFZ3pfRhnK4eX+zCSsFS/2oEwZfkIgrgaQJMn+iQQa+ajHahYiGY8T3fOIBV9xls8EPYJRKKJROu3tmYqgU3KimAHO1ILuowvxp8yHNWlzMfW1nk5ADoBpD2nTX8xLt6VzgLCEwqvsF++R0gxBQYugxYcC0RhoJQhzdixvYXlMjBbiCj/ur2UnjwpK17TMUer7aIy1vbeN8d4gWYJ73GnsyD56TFTCxDCuRHv2r7O38ru8fjNUvwFO5W6D20Yaaxs3CLNg==
Received: from DS7PR12MB6335.namprd12.prod.outlook.com (2603:10b6:8:94::11) by
 DM4PR12MB7551.namprd12.prod.outlook.com (2603:10b6:8:10d::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6652.25; Sun, 6 Aug 2023 14:21:50 +0000
Received: from DS7PR12MB6335.namprd12.prod.outlook.com
 ([fe80::b545:e43e:779e:84f]) by DS7PR12MB6335.namprd12.prod.outlook.com
 ([fe80::b545:e43e:779e:84f%4]) with mapi id 15.20.6652.025; Sun, 6 Aug 2023
 14:21:49 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     Andi Shyti <andi.shyti@kernel.org>,
        Parker Newman <pnewman@connecttech.com>
CC:     Laxman Dewangan <ldewangan@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] i2c: tegra: Fix i2c-tegra DMA config option processing
Thread-Topic: [PATCH] i2c: tegra: Fix i2c-tegra DMA config option processing
Thread-Index: AQHZxx6LzpeyXcck3U+NjT3QFNG5jK/dQvCQ
Date:   Sun, 6 Aug 2023 14:21:49 +0000
Message-ID: <DS7PR12MB63358D8D877BBC81BF94C53AC00FA@DS7PR12MB6335.namprd12.prod.outlook.com>
References: <fcfcf9b3-c8c4-9b34-2ff8-cd60a3d490bd@connecttech.com>
 <20230804215631.wc22pkyetsyyt5ye@intel.intel>
In-Reply-To: <20230804215631.wc22pkyetsyyt5ye@intel.intel>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB6335:EE_|DM4PR12MB7551:EE_
x-ms-office365-filtering-correlation-id: acdb719f-f41e-4799-7056-08db96887964
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g4BWpRBaCOsO3d/55SfMHPtNb9RpSBoUI9WJKggqtEWYDOiDnsfkmm3mCqC8fOYmGv/wqxh4ShCqppAa6LWfyc0BvVWggDm1MRjSgS+iAFs59sRLJ306CWy6jR+wBM6nUF7h8CClYebeUmNvF5WxBQC0GbtrSOi9+twxPZEwTPMCjc0+q+gqmwW2Gz7B6xu4fR19la/6PyGl6gkgBpbnumCKzIt+G+WB5DNh+IBiBqLxDkIWN8GJB1es8A6jHjhFVv0bQp+Po+f9JFAvIw1JU+JR4PlwEnWOfspzORkNa2z68LJ5PWHWzRcXNlRXrwEjpZkhHpRiSEGE+4Za0/2K/spmz88TxhOb7IaVuwZ8j8Bp0x7rzTH36XLet1z5Zqz+kQe+kykKxYwo+rdBTzx5BKqO24KZdLIxbz+KyBAwpJBBmDTEgj+mEnRAIpd3GEX3TG7JKm2OepQMnZKI/FMRRIX1Vaz2e3U5G49LgC3l+5XhLZcY9OOjm5Dpcec5fF/LJFTJ6AvDPV4c/A9WuxRif2+6fH+YuAaE6agJs3Qct2yEyTgiLnOQ0g7TBLTbU8VuKCDGEM3ZP/aOfG7FjKoYfb8Jnp4G/5cYOipZvY2a5GJKeaKI+oDuJ8YTm1GQUkzR
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB6335.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(39860400002)(366004)(396003)(136003)(186006)(1800799003)(451199021)(52536014)(38070700005)(41300700001)(2906002)(5660300002)(83380400001)(8936002)(8676002)(55016003)(122000001)(478600001)(86362001)(316002)(33656002)(6506007)(7696005)(38100700002)(110136005)(54906003)(76116006)(64756008)(66446008)(66476007)(66556008)(71200400001)(66946007)(4326008)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pEpv/22U6tPGt9jv/pz9da0yv0mEa/SBc3VakXxhaNkUDP2ZZWn3mCTFu+xj?=
 =?us-ascii?Q?p8B9GTs2BAK+eRb0gCb0GhaDDTFeXXbzAYWmyGFPq7TeoS1p95/Viz9DOrYb?=
 =?us-ascii?Q?fuQ01kMNo1NkrX8XUCUe6Jrmfiu9f2VdnKBgoooNaGXeTYaClyoIMIIga4Us?=
 =?us-ascii?Q?eqpAMBnZLUvTykPYaZx635X0AFon8onSm7INttKUhWbt9WCdNWhce8ssbAA8?=
 =?us-ascii?Q?en+uF6AKq6CyJVH/5ZKsawCl/f6oteIB3Tlq2pytmrsV8Nd8+Oz8ReCLJoFZ?=
 =?us-ascii?Q?vZOntLJi2lumjUhN247367NvihGXzn+dQAQ3pgAbb3DJ7kkIZdXrPO+bJS9D?=
 =?us-ascii?Q?yHjoDaYXc996kUs4ATqefectlCctal2zJ+WgwC2FkkoJO1Vk3E23h1MDi1bc?=
 =?us-ascii?Q?mSNgfOycJKCYtqu5TcxxfuMFzI3u8loBjP41RKE2h4kzXfyTgLgKoAU1xqUP?=
 =?us-ascii?Q?PpnuVKkXJDgvLxTDoGXuZX7cdFrbCQXDJFZNKQRkjHrd0s3qClydj5yCuzJM?=
 =?us-ascii?Q?Ps//ofstxgppqoPNNJq6pn+nYFKpgDKOCscqwxQndUs7WRgmyug8hyUBGrxm?=
 =?us-ascii?Q?sE/injmx2ZTM9mNJtPOjo553dilt5pDzpKu1XELcwcH3zyPYTX811f1YQlul?=
 =?us-ascii?Q?fN8mVZpMBSSd+C74pljboDXq59txjUlzEs85FFlytatkJGntdf+omwXusLqL?=
 =?us-ascii?Q?ed31q/PiB7ta9EaVyryCYMnJ7LGJ+TyKyIUdWo21zPCqWoczS2L2UJwsp3jq?=
 =?us-ascii?Q?pf+hYHcDqoE7RsSr/zqUk6SPIR8PJVyzImMdVEPCCmH1jSUKTXjUJ8UNeqyP?=
 =?us-ascii?Q?yQdOFe24ur0KCjYKagXyIxV8osMT8OxAvS64haawCWNxC6v6vAMPslyH35Ww?=
 =?us-ascii?Q?FRv/s7gSo1/itPztD3SDDIY5eMeAnpz/XIkJtdzL7UfXLKzZzcoFJ/ZMTaX6?=
 =?us-ascii?Q?gnJrFu+GkV2QFpKLe9JetjVf4B8+MVJfbIbbWKw/pieUyGXY5wT7mp1WpA/w?=
 =?us-ascii?Q?LQq6GkNCg7CHWDEhPSBrg7DTy1XqHayn5V5xAOlSIU/3w4blTsFUHmzuKYeG?=
 =?us-ascii?Q?k3P7yqYE/4ihWGuG580JbGTyjconesof4amPyaJg8TDH1pKJGDT1pEVSKoPf?=
 =?us-ascii?Q?K3j/oNhgs4XmhnEy3pQqUy22bp6u+GYCrzu3dWQef/Zlu3QH/FhvQgaq0n+B?=
 =?us-ascii?Q?WNtk6a/3RCEEa44yCiSnvkwH7UyxwGZqah87r9MPHXPul25pnSpOLWVZuKtm?=
 =?us-ascii?Q?oaQnKMPLk538goA4LcbS74pvR7ckHnvdVbYK4sj91h1p57ykxfl6236mk/V2?=
 =?us-ascii?Q?S3R7W38o/NXrL/Bb9Bk3YjWZuMXm1joqsXT2G8vpxOdeCeRw3XB20SQCzpPr?=
 =?us-ascii?Q?ZanV+fmTFjtgt8H0Scen8s0k2+v1WYJQ0y9VtYdNKu3XkjWm46YGfRLrCh80?=
 =?us-ascii?Q?kqJqJGGIicCC05W3NUEwNg+Sca5I+mLv/g32+UhtMLtiYk7pLWamWBnZJ7mi?=
 =?us-ascii?Q?4lQNlcImSqtmkdl8lmUIFPVwYIRX25ExZ4BuUZ4zRihxUPtgzUyIMVJ25/JB?=
 =?us-ascii?Q?Q3ki5faU33J4wTc+UtQZh3JikSl/4HEE2rJPxj5CDeFqJWTit5dmGmf7MVrN?=
 =?us-ascii?Q?H0NQoibtkB2jrTdSh2tVACJvmNKcdYYAO3KguJscI3L2?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6335.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acdb719f-f41e-4799-7056-08db96887964
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2023 14:21:49.9135
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9lO9RjCrkB7F+yRpws/PlhDS5/2wxljWVVWcZ/NDdYL0YEi2P4CuBCVoHNRxn6x8bdcdCxkX1NGssiNj+JsdAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7551
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

>=20
> BTW...
>=20
> On Thu, Aug 03, 2023 at 05:10:02PM +0000, Parker Newman wrote:
> >
>=20
> you have a blank line here.
>=20
> > This patch fixes the Tegra DMA config option processing in the
> > i2c-tegra driver.
> >
> > Tegra processors prior to Tegra186 used APB DMA for I2C requiring
> > CONFIG_TEGRA20_APB_DMA=3Dy while Tegra186 and later use GPC DMA
> > requiring CONFIG_TEGRA186_GPC_DMA=3Dy.
> >
> > The check for if the processor uses APB DMA is inverted and so the
> > wrong DMA config options are checked.
> >
> > This means if CONFIG_TEGRA20_APB_DMA=3Dy but
> CONFIG_TEGRA186_GPC_DMA=3Dn
> > with a Tegra186 or later processor the driver will incorrectly think
> > DMA is enabled and attempt to request DMA channels that will never be
> > availible, leaving the driver in a perpetual EPROBE_DEFER state.
> >
> > Signed-off-by: Parker Newman <pnewman@connecttech.com>
>=20
> As this is a fix you also need to add
>=20
> Fixes: 48cb6356fae1 ("i2c: tegra: Add GPCDMA support")
> Cc: Akhil R <akhilrajeev@nvidia.com>
> Cc: <stable@vger.kernel.org> # v6.1+
>=20
> Cc'eing Akhil as well for his opinion on this.
The fix looks valid to me. Must have been a typo there.

Regards,
Akhil

