Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7579C74A5E3
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jul 2023 23:28:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231675AbjGFV2W (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jul 2023 17:28:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230235AbjGFV2V (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jul 2023 17:28:21 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2125.outbound.protection.outlook.com [40.107.113.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B4CB1994;
        Thu,  6 Jul 2023 14:28:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zg1a0Fs7T7H2DVsosBs7TM2GPrFeZnETolzePNUFtj41MAxcWOD8Ti808B9i1G4uF/CISe+IAtJnjTJn5haflacusow6t2+j3+woJuIOcluTGVqzr2KjJt9tOJ+GX/lknw99PdhdDg0hNcyBchzqiXyakRdN2SS08DpP0q090rEh+pCpi572g8ry8G/sUE2idgf8TNJdYeepQlSbp4qXRSU7MzRKtPMPtmFRRZbzq6uhpg4x3FTA+NiU6xVNou7O/4f7A5h1dMxQKA23W+A14LH5FM6heF5H64WL16+XHBGqsZfAKtmqvj9mBilk0LBSQ3vOm/cGyGtIlfUiyPmbgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pJc3hHr8huUYBXJGBHHcWBddOgxw9DP6ievQBbnPj+o=;
 b=LsmIxl2RfBY2w/C0QvKaaiMDk0bgA+BZZ3SI12gXjlVYzzVk8PjWnJqUpvoZnZoBNtAW2mJVJ8jLmzo2EvqFowywnPpeoh1ynEka5zXcdyb+4uF3Yak25Zkp/dr/GBUez6xktX31bqpzxYIbOMOtTE8pcxZK4r8ODmJSpkSL6iqD7l90uZx8e8dphN3tzV5hMeYn1YTaXG4gi8YFEoOEIeHkK/XUJ0zhwriKfOwEiYqyfQPFXUOovBtpwKsirX6IzP1jlntYBHwPnSdkoREWwGqkCNov9Qp6kE3yflW20e5Ux9mBdQ916csQKYP2fdkbW3+7PoQlalJD5k6j8E47Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=connect.ust.hk; dmarc=pass action=none
 header.from=connect.ust.hk; dkim=pass header.d=connect.ust.hk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connect.ust.hk;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJc3hHr8huUYBXJGBHHcWBddOgxw9DP6ievQBbnPj+o=;
 b=QFCMQRQz04CmTkbNtafVu1QYwHs4Z/c/BPIUUUFWg94BxGw4v5eAlhvPykICiF1CJG2K/a6B109N1NW9J5OM/rhEQhPZCqWaj4o3LzkxgpqAaREMt65C+X32UrPSK+kHCXC2iQ3Bs8mPXAURZawBL66+Z4rA+B0RQMwKjtxWSzM=
Received: from TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:b7::8) by
 OSZP286MB1606.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:1b6::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.25; Thu, 6 Jul 2023 21:28:18 +0000
Received: from TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM
 ([fe80::b429:5aa3:12f1:6b8]) by TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM
 ([fe80::b429:5aa3:12f1:6b8%4]) with mapi id 15.20.6565.016; Thu, 6 Jul 2023
 21:28:17 +0000
From:   YE Chengfeng <cyeaa@connect.ust.hk>
To:     Ray Jui <ray.jui@broadcom.com>, Wolfram Sang <wsa@kernel.org>,
        "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
        "rjui@broadcom.com" <rjui@broadcom.com>,
        "sbranden@broadcom.com" <sbranden@broadcom.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>
Subject: Re: [PATCH] i2c: bcm-iproc: Fix bcm_iproc_i2c_isr deadlock issue
Thread-Topic: [PATCH] i2c: bcm-iproc: Fix bcm_iproc_i2c_isr deadlock issue
Thread-Index: AQHZptF4vW+xYGiqv0K3I948JeZ3Oq+tNJ0AgAAJDQCAABUGng==
Date:   Thu, 6 Jul 2023 21:28:17 +0000
Message-ID: <TYCP286MB1188CF4BEC5319D2E940EEBB8A2CA@TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM>
References: <TYCP286MB1188708B1CE64D95FBACF9E78A20A@TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM>
 <ZKcXrt3vGzncO/0d@shikoro>
 <82362ecb-2049-14f4-f176-36bfcbbf84ad@broadcom.com>
In-Reply-To: <82362ecb-2049-14f4-f176-36bfcbbf84ad@broadcom.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=connect.ust.hk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCP286MB1188:EE_|OSZP286MB1606:EE_
x-ms-office365-filtering-correlation-id: d6f79604-54eb-4f34-fa76-08db7e67ea27
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3djJ6tP0DYQJvf6WIB6pEbSvieGcbwiqmwOMvbqS1m5kSPnVXuhRjP31Gnie8QtjmucI2VLXz2cX0dTl1AnO29KGkQfFAvdRjGYp6LyOWT/qsJJwwHxcsP8FuGUmwVr2ollEUoVx4UWdXIGv/LViHBS7rnw2/Inab93z1Y20qpwjqukTeEpQZivaLR7+SCE8c6egcLIatcR8YLgeTmIe2qqmSHG5topBtEHKVP/M1vz1Wm56IRH+TDP3i13hWZyrb06MHy7LBMfoLo9iQrHzF3XU8ihes8nKkJQ8UtnsIJHORGBGjEx+YfSumsvFUzvLy7xVlewMNOqQMRw6VsME0EjItSJioXeUUKP7rDB0hy7CJx0dlBcXYfV551j8a3df7Wi100Eck2Xs44ykAGIwoYPvu6gxFEZ+GgxkKKvCVRDFG3BDjG3Z3UMiQtI4/v8mZJ0mQqnwQIkZpkI9uj6dmYFoPtOIwI05nDUsOkPxKIbnRfpZCZIamFTvP1sg+SW9HqfT0PU3JqNYUHTA8SL0cZ/SfnsCOBpkay5Id/ww7Gw/c53G3tz2mW4A4YExnAReGCCRoRsXGJLB2QQ1G3DwAKX/i8YL4QZ82xNf/cOlPUqIvK1hwHdKKiWLN39JGyc89mFXIGFBX6jzUufmvxVokw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(366004)(136003)(346002)(376002)(451199021)(55016003)(786003)(8936002)(8676002)(41300700001)(2906002)(316002)(478600001)(71200400001)(110136005)(91956017)(7696005)(9686003)(66946007)(66556008)(66476007)(76116006)(64756008)(66446008)(38100700002)(52536014)(5660300002)(83380400001)(186003)(38070700005)(86362001)(122000001)(6506007)(558084003)(33656002)(26005)(70780200001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?FNAFzVXRL6UhiRFlJquulCY20bsQxPqkoX6aJA7Gq81YXaVrRiPxW8aqtQ?=
 =?iso-8859-1?Q?NTOZAd9/pIJJT+IkNWFvVN7fDOTnDxDnzcervix1tQ893KwvOWPb7qbtPQ?=
 =?iso-8859-1?Q?HW+CAw3QWEd2wxdjQnkzcIqzHzTrWeYbvX63CYrRRyVhB0PRx1lZRltxMi?=
 =?iso-8859-1?Q?swOZy24o8xq5fqh1Ho/dQBvyVf2cNXdQK0tA8Gqv8KB4JVdvqQWUgE4YOY?=
 =?iso-8859-1?Q?vcqnBlK9KA53407eKmwybeJMPBAMTV99WJ/bcloASx6nyXpF7bkMnu+6K5?=
 =?iso-8859-1?Q?jMV0rzPl8LX9z2OBuE7Um5XKXv5YFHX3qWFAfMzJkWEOuUe6YSEmvOj7NY?=
 =?iso-8859-1?Q?tB8N2p0tbClLwuE10aYBi8Uh60g8u9low6shv/Umyr4zESKJnBdwE7M2VI?=
 =?iso-8859-1?Q?3ecHvjYxMRncesIT1hGr1XYTv2zYsw5olq5+gXiU+iv69xwB9pZ8pW3o8X?=
 =?iso-8859-1?Q?GjQG3mowLpJfbMZNOjCL5MqFNZ6HzJfcgsd0Lon0AcDUrfBAQQkn+5EJ+R?=
 =?iso-8859-1?Q?MuvL4XsyDCP8nMlCdQYB//hgxUgH/HPPKjHxbxzp25uDLLOLtkGOScRyM4?=
 =?iso-8859-1?Q?RqWy2k17oKaLlGYQ+I2QvKagunW3rqS8GdFsND+zB8RYqnlvZMlU1BXMKd?=
 =?iso-8859-1?Q?M8aTdGRWLdbA7azfY0R0+7tRPdfj6EdEFNXnC8bu7wqt41uBNEiH71RazO?=
 =?iso-8859-1?Q?/429+46TXGeyVk/ZkWPVJHEwqRGS2ghc5z9hkC33dceFcxc4vLgkdwjRL8?=
 =?iso-8859-1?Q?FYIMtaIr1UzUDf7WUS+cRZYGqELbakpOgpAPHmIFpu5ca9e4X84M0pFEZA?=
 =?iso-8859-1?Q?6NtiR8gUdBjZCaQkuhLAl2mYLVz7PAWtyK4d/AgT4bzx6NVoGtYrQKxoll?=
 =?iso-8859-1?Q?JWclapWxv5I2fSBHUxZM46i22FrxI07bZyA4ic9jld+cfcJtrXVPyfbR1+?=
 =?iso-8859-1?Q?Tso2wioaTSJ7FMRwUpTTbfx+h7fE95sXAcbEtXRfMWd7jAfthQBr2AzsA0?=
 =?iso-8859-1?Q?vOCvN2C4ME+DWgxvPH2OA6WfWxXgsYNmqY9NUrOjgfGu4Y2ffMMtc8ZECn?=
 =?iso-8859-1?Q?jA3TynpTm7S8Qw7FIk0z/isJW3ZSznApFUkkD+NzPSVK3KfdQY7iT6TdR+?=
 =?iso-8859-1?Q?C6SP25OdOMSrQEYk4cCVobDoVe43DZTHPXr6bspzHAMjfL7H7HhbxiWLmZ?=
 =?iso-8859-1?Q?RxhOrNkRjXv5p2hPnCPA1yL1+I7wIMmsPC6Oi6zW9tiaWHuhuOxwG3vVEF?=
 =?iso-8859-1?Q?xDSoLnCGN1MbduBDwB9adlQp9Dd678vZe0yUh2SqW5acf6jbQPFenKXiLi?=
 =?iso-8859-1?Q?/6wE5F4mrUKGOngCPiTAuhr9AefiNorqfeBrXE8/i9lVjuos8pHy6tAqxr?=
 =?iso-8859-1?Q?o3ZxGRLuUprs1ajcTbRAG2TJpxVxSpoWo4ZY1NeSs2f0x5n8uyKNLLZ2Fa?=
 =?iso-8859-1?Q?gmqGjCY7Pu3fiESYTs2VCN0qr0qwW3ZTg+pVNDmb6n/juyrKx+Hq7/NOL4?=
 =?iso-8859-1?Q?0BrQYow6Qgf2p04jtaU6UStDkiwGQE+G0axfPt1q15uX3VdviLgJyPn575?=
 =?iso-8859-1?Q?0Zh4X2rKWPpZ9fg+hbOlNtF//0p7zVRWUs6e7zgotbTn89wPxy63NOks80?=
 =?iso-8859-1?Q?sO+zTOYFwEkpVEYM7MMjEqbKMt+rpK0j3n?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: connect.ust.hk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d6f79604-54eb-4f34-fa76-08db7e67ea27
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2023 21:28:17.8099
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6c1d4152-39d0-44ca-88d9-b8d6ddca0708
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gweafuOnP71P0ssAF1PU5qJMAiWm60QHNF16Y+ItGDWbXz0bB24V1wcvtJbdac7pf/lHj4WQYqZoEoCZZhWyVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZP286MB1606
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Thanks for the notice.=0A=
=0A=
It is on 6.4-rc7.=A0=A0=0A=
I just resend the patch, I think that one should be able to apply.=A0=0A=
=A0=0A=
Best Regards,=A0=0A=
Chengfeng=A0=
