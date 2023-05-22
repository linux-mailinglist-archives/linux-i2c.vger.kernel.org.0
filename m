Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E86DF70C19F
	for <lists+linux-i2c@lfdr.de>; Mon, 22 May 2023 16:58:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234167AbjEVO6B (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 May 2023 10:58:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234221AbjEVO5x (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 May 2023 10:57:53 -0400
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2044.outbound.protection.outlook.com [40.107.102.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 011BAE50;
        Mon, 22 May 2023 07:57:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q3EFyzjh4kYPJM8xIo6C8+Gb3Hc9PnAhirtj4RM2XjgobtNwHOh+B48NhnU2odFGw6jfb4Ft5+rOxl7tuigJCrbk3YUcVc5RVBBi71V3IP0zuij26e8FvS0q8RgOlWmLei1Szos2anSPSkQqPezj/5gKRObV89DHGMu8Tx0Sh7XbLaUYz6uXylDHsHZF66l4ofoUbv+p1Uxo3q+9itUPfluwdu/7p65FnFm6Dzg8MruTESEE9BWLeTKgiemLFWYvjODwHdV7njcr2QUAPvezABvruFvVHCgGwOaL20jFMwy82+D1L4bA6WGyISgblMMUI38MzLYVU2i4jNZWf7e/fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jxpo/3N9tWP8bq0cr/daVUXV2tCv0FO7j7UbFe+WfHA=;
 b=jdBFO5+yYUGeWGFokj+lo+QRirJdshwTc5qqvvc8N4lCl5tkkKGIs5VqCKPO0GHn1TJT3lAa3LPpoNYmBXo5moVMwUUcTGgzEfgk0rbfAZyrkEOGVg1FnyncYc1kjxeeOS21agmlO1WYQsCQrCs+AkQsOX4UcvMGm4dSyg9XmTLn3MJ17wGso6VhaPxRP2nYtv5gW8Zy6lvwqkUsYJSNM/JViJBhzTKOKLy8obgM6A6j461DEun3OjargDWmOu88+e5yjsdhIM8d9lRBpC7JILLGFT75SAHnYRZcyEfuz5yMzou014K9kRjMv1nMItAfuMM3cRlV+EcqzZM/1TBtsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jxpo/3N9tWP8bq0cr/daVUXV2tCv0FO7j7UbFe+WfHA=;
 b=siZzWr3PNM/VzUV9pmGhQRSwpkYcHawr9B3mMA1xkT1NiP+hhb81de4zif4OAVTrQAkPnGQ308i9kB4B9OB6p8I/+9Db1VfP9DrK6rWuTX03O4UH/T6M0WogrMMQ6gVBCHUQD6qKUGNqTpefikFPIcbijzix7K6UMd6iBy2cW/Ls+IS3qItwRMewA1UY6vyNMkRBkl4IthhBEZv13WTCaMXoRItQMdA7P+qUqlPGFr5me+EFGy0z9BJtb2nmCB2N0+RYNwNqfEWH9Y2UvRuYT9ijgo5P6iCBpw7v7jEl6Oa/uXygr5+oiU3QGFUAfeN0+LEMdE2+2nyrp8peSK3RJw==
Received: from SJ1PR12MB6339.namprd12.prod.outlook.com (2603:10b6:a03:454::10)
 by PH7PR12MB7939.namprd12.prod.outlook.com (2603:10b6:510:278::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 14:57:31 +0000
Received: from SJ1PR12MB6339.namprd12.prod.outlook.com
 ([fe80::f1f:d17e:f142:5a09]) by SJ1PR12MB6339.namprd12.prod.outlook.com
 ([fe80::f1f:d17e:f142:5a09%7]) with mapi id 15.20.6411.028; Mon, 22 May 2023
 14:57:31 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     "christian.koenig@amd.com" <christian.koenig@amd.com>,
        "digetx@gmail.com" <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "wsa@kernel.org" <wsa@kernel.org>
Subject: RE: [PATCH v6 RESEND 2/2] i2c: tegra: Share same DMA channel for RX
 and TX
Thread-Topic: [PATCH v6 RESEND 2/2] i2c: tegra: Share same DMA channel for RX
 and TX
Thread-Index: AQHZeQVjukkoZDQlT0ytqbLKguU57a9miJoQ
Date:   Mon, 22 May 2023 14:57:31 +0000
Message-ID: <SJ1PR12MB6339C29CB538C4FD54B72810C0439@SJ1PR12MB6339.namprd12.prod.outlook.com>
References: <20230427123915.38199-1-akhilrajeev@nvidia.com>
 <20230427123915.38199-3-akhilrajeev@nvidia.com>
In-Reply-To: <20230427123915.38199-3-akhilrajeev@nvidia.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR12MB6339:EE_|PH7PR12MB7939:EE_
x-ms-office365-filtering-correlation-id: 98fc07bd-f1f0-46ba-b9d2-08db5ad4de3d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qpOX2N8/Zzw1XknXL3aBEcJzfDbg9l967JOOA+u9GRcvsOIaVCcuhtP1B3+lb0RH0wdnVQWYuU+D/Sp6u8SV7l5n5HyozVo/r+RiZTBZzZdZROfUmb4KJy0ZE6GfKmBmxqOlr21Zyj9UD7QhwG+upcsg4YzHkXqOWStwbB9ZnB7RMwcdddeeZVsu3mFNdaAni4Yw1NfpxrPQg/6ZDvniyYq9sRxbUrzEeU14ab4YjrVTGHacxs4/42tOAJrgD7R7Ph1rGhEIt+O6qXkEBQpDUBhZo/sAtU/c2xioPjVGxAHpbeKyk1+SV0TafAiQhFeND36bjH2j/OfM0PDWGMSA7KpuRL+CaVlEE42C9GF7uWWuEextDMYRmhqm3GW/oGvHP0jSUoV+s9smksZQphYe7g5qSk18vnd5N8K7GHCcKcupfXHFhOF4H3rLtABzkIncNVESHuzaGIdCTxLQ+ych7gYyktJ9GNPccKWVrKzSf4tmPXDJcWyNHM0Nvl6PZnU+I7dPz2niN2WHNvpo9aJOFOnlWrYvClM9ISZhpWgngopI5NGqc+fNmYlFxhihKpMjxI6WVvrfJoc/xRUv/kIdyGks1wOgIumUuGCOcQ6h2afP112tIADBvdt8I3//6I193xuKCOVdg6fwex+PTfNrfg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6339.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(396003)(376002)(136003)(39860400002)(451199021)(8936002)(8676002)(52536014)(5660300002)(83380400001)(186003)(6506007)(9686003)(86362001)(26005)(122000001)(38100700002)(921005)(38070700005)(71200400001)(41300700001)(7696005)(64756008)(33656002)(55016003)(66446008)(66476007)(66556008)(66946007)(76116006)(316002)(478600001)(110136005)(4744005)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gTWFx0mZma7zqMYXxsi/q14U8kqtpg2WY2UpFRjBMRWjzutd3xN003hSh/V3?=
 =?us-ascii?Q?KRWM4kJDr5hHpFlsgPnNRClXA161pvokMBzyS9mySu1IfgS5cpNS3Ql9CVst?=
 =?us-ascii?Q?a8ocIirOfi2IjG5/ITIAAvOAPpN+Mh8HgKgChWN7zmZ1utMJGEgIfT4M/p0N?=
 =?us-ascii?Q?sA2HSW4k/zR2Y+dF09IeW1iBO8jlizcxPfjC9AgmvvI8HeT683JPmP/yfjoO?=
 =?us-ascii?Q?FzAUPm0EC5KqlXzlF03MK672hMxOqK2vGLgkuKA0ZTw+s4G0+jCP/1cWOT5H?=
 =?us-ascii?Q?UMhDIsvC4JBNMFsHeEmdycp+i0no6Q+x8ph4tWWWARFdAZWzFEGStbiw8kf8?=
 =?us-ascii?Q?bbUYPJVhgijUc7zXb7bl0O1uAt4oUAxcNLikkSL6/zC7TcL69V4LyzbiEJlp?=
 =?us-ascii?Q?iTra7ptuKAI0TNoftHXdukRUEvyhLGC4SZUzkl6cWwV3De10RJl1RbfOrfI0?=
 =?us-ascii?Q?Cdjvm9mLDuN8spIoTlZPCB6qFs31FNrJ+sdK8vSduJcca0/yAjLjaac5qjWz?=
 =?us-ascii?Q?3ONTNhj0l8tEQFMJ9ephYX0JJwIvGFWTjud5NMf3wmjTBrMgDGZuWfScxqbI?=
 =?us-ascii?Q?oXKof/aVYhA3bW6Lgltx+e8Orxa+5vfzakm71zR0Bxy8kt8BgHDbJzUk2tY2?=
 =?us-ascii?Q?w9VSHDZzwYJ4Ss12h9Fwro8uqRkTpxkeopoiDWujXDyJAUIU1XEljcvgyWWq?=
 =?us-ascii?Q?m0saEDOEGmZCv2O6VtzYvJZWXD7scd+mZlzOiRvwxk9kukl5veWSu8C6CvRM?=
 =?us-ascii?Q?9DSI2C9iIIpjrhuu2SevLqdBWzUswXFys0Xx+6wXVQz9JH2H8g5bqf7sDvDe?=
 =?us-ascii?Q?dp/WCRG0wag8NPu+CshtmYhi4mPfNBt2V58ruj0cKKzOS2yTZjj9HmDdrGKp?=
 =?us-ascii?Q?GvW1FnYMACj+4Xu3NZxvgO+QVo3824xBUkUb8STaY5r/Ci0s38rz9QtGoZS/?=
 =?us-ascii?Q?oXJ5HEqHjtwvnN6EGuehIDQHHgRMXAzNrrPc6j8fvZrC4W+aOKhb+xSliRGb?=
 =?us-ascii?Q?wLM4kQdIvBSJzvv2tqrwr+ZJ1z7rYffOKSdIGDF2kmuTrLyyfbM34matVqMw?=
 =?us-ascii?Q?ZBlW65YWuwpSU2mvaviUbYqG8y38CeWTyNGZDCGkGjdUUftxPoIaZXb/S56X?=
 =?us-ascii?Q?nmBapT9f8cMIoIJVAoSFZTfgmzboc6kJI73C9bkKa5muvLpNBtDGYlMHdkve?=
 =?us-ascii?Q?KjtR7www2o4io+uuvhdNzENFdlieRtvusS0htVpsVMc96pOV0rDVGz1jc6Mb?=
 =?us-ascii?Q?VoO1CTvuy4nqRr4YcA2SgQytC0aF+xnbjlOabrYVZ5v0vUqP/TU4ZrXbEMQG?=
 =?us-ascii?Q?rAvMl5YV40uqNIuSi11dJQEjxD8WRPWtUIVboxk+SxGpfpomtn65yyWmRKxQ?=
 =?us-ascii?Q?GxVZ6CMHAWl9Tit2lHBG5cQKsrznAfaf5S4QKY4wRXJAczfiGKWdWq4wjmOo?=
 =?us-ascii?Q?1nXnYxcRzpC3WhfwhVKtGl9TIhlpO/1H5aDG618hdHwQweEKF9U3i31AxoSU?=
 =?us-ascii?Q?s4sVrF4pr3Fa5BGypGO0FJlP1ejUA/kVwnnS3sj1F/jpZdlmne2968VKtGV5?=
 =?us-ascii?Q?TjbE95w706yrp9cW/ie5cZnLfErIy/K+n94hhU54?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6339.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98fc07bd-f1f0-46ba-b9d2-08db5ad4de3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2023 14:57:31.0959
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rm+BzJ53CMcHkZ3WI8wP5gwGIiMlRXKhpAVTpfBdWWSERu0HWJB4SgiQWe5PWimm6EZtA/4twouq1CjQ/bWwJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7939
X-Spam-Status: No, score=1.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SORTED_RECIPS,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> Allocate only one DMA channel for I2C and share it for both TX and RX
> instead of using two different DMA hardware channels with the same
> slave ID. Since I2C supports only half duplex, there is no impact on
> perf with this.
>=20
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 69 ++++++++++------------------------
>  1 file changed, 20 insertions(+), 49 deletions(-)
>=20
Hi Wolfram,

Thanks for applying the patch 1/2 of this series.
I saw that this patch is not applied currently.
Do we have any concerns on applying this?=20

Regards,
Akhil
