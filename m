Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF6B3607764
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Oct 2022 14:57:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbiJUM5y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Oct 2022 08:57:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229854AbiJUM5x (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Oct 2022 08:57:53 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5078121E124;
        Fri, 21 Oct 2022 05:57:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AtVDcjt1rGu159hise2CcRN0eshdYJ9idAjsqdw2ItteTHl5sxJPYuu9++gXBT3lrzdqL4RUYCprn2Kxb224opT2hA3LSH/4zAVbRCFFa/Xsm5RCdD40cuabISnEgzSKbzMzHRIibb1Xi3MDadoiqDx8L03+8TAos7TrrPOMllede+zN3ysHbTacQ7hIeFjMeuDtwFktsG7ZmvvFfaLdH85B1sM1crYEps2GbpgJONzZAKa3/dsafoICi/BILXf93UHoxQsJWoUentnfyepG+AevyXRhrQFz7j3vbHwwHdJUPv0QwYRGQj93g2UpNOwqwtA1Vq82JLKerdPFD3pkRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A756cZ7Zl9lT6dtJpo0CUaVrCP0124lKAapI5T+AbI4=;
 b=H7ktXjCqBYISXn7wdLj37dv1K77Zp+zcBKEqA227/3BGBUqSK75hkSGElOqikDuhhzj5nSuL0KQD4I9l+ZWVrYiRcOavRpCcN2nRFcpGVpJkYLyKMQTLLDyHvyo4f9RRxUHq7QivCTl9nVZCH+4o9Jq8NxQi9WO+MUuS9iidpeby0M3R5YtEKX+RRKIA9/9XB2eq8tG988mg6/Z2M5uefYCEoECln+pxMZFHaR04NFJmTMD/6wQDWCp6dRQ+xejOvoI/mkwIaqrXDiw2+QSYGvS0pVrmVJow+wYzvd1RPb6RMO2Gacp6CMR2FfcfxEEzz1IR5ehes0/myTdIiwrchQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A756cZ7Zl9lT6dtJpo0CUaVrCP0124lKAapI5T+AbI4=;
 b=Zpi0oQIQRQ7IP24RAt1pqaEBGhiEKnhD9B5+msfk44vxerzWC59GtKM0k+CFJhffEMjEz5QUTpcP7epYKP1hrltEgqMtzmuhObsoR64rnx4iVlyOSvciGPo/rsSF7SOxNErAHstYvRxqJaBie5oDptV4r2qHwVuvmvU9Ym+JFS/4R/D97szp2kWpzq4kS5tlaHkquER4LsHeNrhaysjpeb3e6DDMsozMdOQ4FLqaeQ9KYWZo9aXrMVd9dc5YTAzy57Y3ky0TCt1x5iTjhrOg19UrDQjUuj53ivaPvMmkq7c/66a+kdC0rvvmVF2k1wo1u72FjcIkddStenavhuqmrg==
Received: from MN2PR12MB3616.namprd12.prod.outlook.com (2603:10b6:208:cc::25)
 by SA1PR12MB6893.namprd12.prod.outlook.com (2603:10b6:806:24c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Fri, 21 Oct
 2022 12:57:50 +0000
Received: from MN2PR12MB3616.namprd12.prod.outlook.com
 ([fe80::5bc5:4ead:6c2a:339c]) by MN2PR12MB3616.namprd12.prod.outlook.com
 ([fe80::5bc5:4ead:6c2a:339c%3]) with mapi id 15.20.5746.021; Fri, 21 Oct 2022
 12:57:50 +0000
From:   Khalil Blaiech <kblaiech@nvidia.com>
To:     Wolfram Sang <wsa@kernel.org>, Adam Borowski <kilobyte@angband.pl>
CC:     Asmaa Mnebhi <asmaa@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 5/6] i2c: mlxbf: depend on ACPI; clean away ifdeffage
Thread-Topic: [PATCH 5/6] i2c: mlxbf: depend on ACPI; clean away ifdeffage
Thread-Index: AQHY5RhmKvDHbzdAh0CyLQRf42EKga4YztlQ
Date:   Fri, 21 Oct 2022 12:57:50 +0000
Message-ID: <MN2PR12MB3616E0DB1D333E5111C1F1D0AB2D9@MN2PR12MB3616.namprd12.prod.outlook.com>
References: <S229853AbiJTWkg/20221020224036Z+12888@vger.kernel.org>
 <S229897AbiJTWqk/20221020224640Z+957@vger.kernel.org>
 <Y1I/hRG9XGTFDTr3@shikoro>
In-Reply-To: <Y1I/hRG9XGTFDTr3@shikoro>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR12MB3616:EE_|SA1PR12MB6893:EE_
x-ms-office365-filtering-correlation-id: ea5e40ee-0ace-43cc-259b-08dab363dc3f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PjDShSJqWg39WQg6C2ktqNMO28pbtyTL4emq6RTu906+qFzhDFLLIVH4TYabx3aDSKQojDVzqZznIiCyZEeL1Sk2oLB686GAdlczFmW4yKxQauH/sN0uo7rDitBVk/4LlHfW//8Y4KoLmyizM1/QxpYymFtp7tt5VyCzGQVVgDNXiGm3MdF9K3wseN92y1bQ/SabpP5+7vuj8GHZE2CPW8AGReESAV4cmy+rZnhT2TbwFPH5fG7HwNO1rSPv59pmY/MelTfb9x3WMePCVqQzP2d2A4SycDgXrofRhiCNMnQ451mmgKI2CvzqwzIHb1DAdwsBMl9CqqQy9SVw9g2PGn+8Z6PnxCEryFiL3fePoS6e9btDLmtvztfwexq6K4UhzcpBxiqTsTHO/ZYaPUdesmOCA6wvKNRHXE1H9v8/0RQmq3nr3IrQRIKzfqOj8X5f+cO60djXMwtQq4BP5yS9+8MYhIiB8kpNCmKCuzi3Ox6O590u1ocBN/8FA+iDD98H3L/951FiijMhkvM9VvFIszIytzvi1QPlSl+MGsgUnskAjcdVlnfTm8wFjwqXFngZp0snZNsbK1oe0jD6T5G9LRvQvkSTInm8g9dRnAtTT6ufej56U95/gAuHEn/xZ9ZCM0N2Dd7JD9W0dD/xafs24aFPUhA/90qGoxf91sAFF74iNntjKcmQAEcp3WH0iLegwZVr/EBZYvFFcW3UVqmvZvxMMJq9CO6qZhz4/KWzjgtfiuAITHlioIc5BK9T6y5kW8g1+mB0BM3b283Ta3qEFQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3616.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(366004)(39860400002)(396003)(376002)(451199015)(66476007)(4744005)(5660300002)(76116006)(66556008)(54906003)(316002)(110136005)(64756008)(478600001)(7696005)(9686003)(8676002)(4326008)(71200400001)(66446008)(66946007)(41300700001)(8936002)(6506007)(53546011)(186003)(52536014)(2906002)(38070700005)(83380400001)(38100700002)(122000001)(86362001)(55016003)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?N1Vm31643kONX/j1eP8ygfJgBgZetuK/DtytxZ3XBZRJmfllAJ3KMGjQEOzT?=
 =?us-ascii?Q?xDGU32fPgGLcJdhccqE2VE/8GhIc43NQwDeWMBCNcX/7HgHLCf0uqNPdXhCS?=
 =?us-ascii?Q?OUwlFArwNFT6bRK2YYYOUPqLZB9tWeSVOOQOLJ80LqiW3nyJEkKtKAy5MNAC?=
 =?us-ascii?Q?9Mvcn+IcaYhLMFK7APT95S6OanbrhQClYfuUL74rEwQEkS/Pb1hJfT7vkO7y?=
 =?us-ascii?Q?V96yiCS66kJs1eom2i1k/5DbIUpZ3d7I0RhAvnRA8lxKD0J1mUUT31P8Xc7W?=
 =?us-ascii?Q?nC9qRXvlLc+hh5NfswJeM9N2UKA50RPJIir73p8qpqEq5Q5xdSk8kidilpqh?=
 =?us-ascii?Q?gN4hQsTaYvppPMqqqLuf+4MvchMmlt9OaDu71QjmvOG2kYFwTGXp1r+l0TyO?=
 =?us-ascii?Q?rAPwhwSP5VExXG4Pwd3ouly0W05YTaAmHAXhq0qMnacb0MRjW7y/kk60NzEI?=
 =?us-ascii?Q?Gg492gifA+wLPozIT82O4CIxqTxuA1TX0lhngRdgkbGQUrRhK3lDlo2RY7+E?=
 =?us-ascii?Q?W2elDjp+vXklq3EsOwCplcZNdY+fKHb60Dqpmy64oghv+Ee5VKpS02MUOZ36?=
 =?us-ascii?Q?7IQjG1SzCZ/hWtsf+Ijvmo9efr0NwGFqRP1kvU1ix4uRzpeySLBhlO9zmPfs?=
 =?us-ascii?Q?KmnLSrOS6XdTK/GaewHX7W2ggubGG9ZUln5QcFy6Hr3hggMcXHuAor6cnt7y?=
 =?us-ascii?Q?eQQguzP2MNlYt6vQ6SDjRqK86s5VPBB313rsO49pJZSrvcbQsjXQKWsgXFcD?=
 =?us-ascii?Q?+WkA/khzI02d6jtHA7OqW5CNlC7DRuyJiepAbw5Fog2u/FaVPiTbGTGPSLE/?=
 =?us-ascii?Q?cNQorEBYHzueOaRIVvifr222Tfp7Zn/mRKbTnKWrJcvNkiQmYEvuMqdzDJxQ?=
 =?us-ascii?Q?Xd4WmM0qHEf4ZJDHBklowefBSIpsBpWZ3PuwrcWrM9I5NBWPQ5YqbiO+GPRe?=
 =?us-ascii?Q?Ay05yfw2Cg2nTl/imWTKkrccrh3bKD0WYGLYGoHVOpHqNbweRuQv9f91EVx1?=
 =?us-ascii?Q?9ynSPAHPPRVtgvZ1Cuu3AxPTwaAD3RTncm2N6CLRqMI27gd1IknOVXAn4kio?=
 =?us-ascii?Q?YLciUdrDBZUlk7wdhbIjYjuG0kL2e4YeM2XiZNXgHP9coix2EvfQpNHPJtyo?=
 =?us-ascii?Q?/gXfIbp1Hnt95LIP/BnlmNa+gyV5HO8m98s94JtPFNhFv1XpI4O1NgpzyEcJ?=
 =?us-ascii?Q?+ycFvuAH1swbUAw7w6qLAYVufKV9ImRkLiEuuRz1697QjAZCjyV9fEnNwd57?=
 =?us-ascii?Q?u1lVpg/lMIR1EGj5nfVPgZ4W+3+DsS2poeIjMP1wRH5YnU2s18E1SKJExtrb?=
 =?us-ascii?Q?Sem5OttUGuQMHKks4ZYad5VlPeJB2iyoC2c0R8zzWz6YHa9pHQBuFmjkFeOs?=
 =?us-ascii?Q?ERxQh6owjYcNDSjwXyTWmxBFI8e3+gV2nxJk2OLTKS/oli1h5VYJi7kzXZxf?=
 =?us-ascii?Q?F7yNEd8VrMl2iksprWaZHRgzUzTOsx4zuPYWyiGhbczBKpEbPWkRLbOL8+1h?=
 =?us-ascii?Q?uVrgP3UNAeVroUbMjwS9svOI3t80aGCC/+y2dCcTGpVJZqJ/drFWaKjbdSia?=
 =?us-ascii?Q?5/axQcwCzjpDzP8r/TYFbuH7SYo2poWJbps0OvXSJINopEuN86IuDzrBuqPc?=
 =?us-ascii?Q?8fY8shixhJSeQy6J+AOX8vb3Bk+fDDFsyQRBQHhQbrmx?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3616.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea5e40ee-0ace-43cc-259b-08dab363dc3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2022 12:57:50.4450
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C20XPI22/pXAWY2TPe0wWWXRNB05tGZJoLmXb1GDTwWDFc/IdLYJmo+oONkfmnI5oHO23L+wzGDKkqKBCg9NsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6893
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fine with me. Thanks Wolfram.

Acked-By: Khalil Blaiech <kblaiech@nvidia.com>

Thanks,
-Khalil

-----Original Message-----
From: Wolfram Sang <wsa@kernel.org>=20
Sent: Friday, October 21, 2022 2:43 AM
To: Adam Borowski <kilobyte@angband.pl>
Cc: Khalil Blaiech <kblaiech@nvidia.com>; Asmaa Mnebhi <asmaa@nvidia.com>; =
linux-i2c@vger.kernel.org; linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] i2c: mlxbf: depend on ACPI; clean away ifdeffage

On Mon, Oct 10, 2022 at 08:33:51PM +0200, Adam Borowski wrote:
> This fixes maybe_unused warnings/errors.
>=20
> According to a comment during device tree removal, only ACPI is=20
> supported, thus let's actually require it.
>=20
> Fixes: be18c5ede25da39a0eda541f6de3620a30cf731f
> Signed-off-by: Adam Borowski <kilobyte@angband.pl>

Applied to for-current, thanks!

@Asmaa, @Khalil: normally, I will not skip the driver maintainer's ack but =
wait for it. I'd like to make an exception this time because I don't want t=
o get another dozen of patches fixing this build warning. Since Asmaa alrea=
dy acked a similar patch, I hope this is okay with you.

