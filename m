Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD1847C51F8
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Oct 2023 13:26:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231695AbjJKL0F (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Oct 2023 07:26:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231312AbjJKL0E (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Oct 2023 07:26:04 -0400
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2043.outbound.protection.outlook.com [40.107.104.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AA3C9D;
        Wed, 11 Oct 2023 04:25:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eu0VaQzRisPu39LTzmDj2BR3cC1nuYDdTGIpayZZwM7W7J8lyhuIjAXBIzjPTR6EnGG3FaCfssp2acIxrd4jK11+Qh+VRXxV3WNgPe3kiVNPnl2cW3kQxsOX4fj0b4iI0aK2a80SwEi9TADYrmQQId0Y6bVrxSSqY7y6ySYWJ9aQMzNMnStpIJ7/PgFKvkINPT5UTrCO8K76NZINZ3HzsZVIGSwVt3snHkFdEw3ZBSmHTIHX/ajuGRPaak4t9txrNqM4UlaMM4xoqEYW8ul6rIPwr/w0p8IpniydsgreoeXRmv1v+3q8qSW2CJd0DI08BDE+BoqSlhX7zMzzCpF0YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ukLRF1HXskwIN+N/ohzWVbbOFwxa4A/S+jmFd6Lj+/E=;
 b=ciev8V4mB1ndQKTRDqepk56jmHsrq5uwx1bdZVfVBm2Fb40C3qCCtY/MzPLPY5hICfTvgkQa5Zt4Eu4Uo/SKu2UdF054dqT4Qu3Gw9Yzt4zw3aw4AaIgGaYTQktcpAt0GdM4+6Ti8EWbgYGFi+MZTJk4GrfDw6y0y30UtqSwyC9tVez9nZQxb4Le/NTp37FQ5mh3buhZexTVM+WAzERjsEDlKBM6paIvNaWcyUFYgEi2pGBrCq8Sf8HRej24QUP/kSQPsmr8JNe+VAJzaRNhT8bEz8iXsxBeGUFxBf03hJ4wL3gjPISQ93rVKlcwElaMaRkld8YRC2c+d2VavqzLEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=piap.lukasiewicz.gov.pl; dmarc=pass action=none
 header.from=piap.pl; dkim=pass header.d=piap.pl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lukasiewiczgov.onmicrosoft.com; s=selector1-lukasiewiczgov-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ukLRF1HXskwIN+N/ohzWVbbOFwxa4A/S+jmFd6Lj+/E=;
 b=Hxy8McxU0/kPh76aLASs3V+tGxPlACPwYs1MVqLRCUWuFlZEj7HTUiJ7HqIHk2SJPANA8k0mTzepRIcwUQzxUPTaMMcv7Dc+/uwE2jkpMAeoSvdTrpRQDFGsX2BVwQDNln6zAABhRdVvUwPzvV7cBF1NdklBDaRT4aX9wsqfoR4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=piap.pl;
Received: from VI1P193MB0685.EURP193.PROD.OUTLOOK.COM (2603:10a6:800:155::18)
 by AS8P193MB1176.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:336::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.43; Wed, 11 Oct
 2023 11:25:57 +0000
Received: from VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 ([fe80::1bd8:1a5d:e69:d1a7]) by VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 ([fe80::1bd8:1a5d:e69:d1a7%3]) with mapi id 15.20.6863.041; Wed, 11 Oct 2023
 11:25:56 +0000
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Stefan Lengfeld <contact@stefanchrist.eu>
Cc:     linux-media <linux-media@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>, linux-i2c@vger.kernel.org
Subject: Re: Sony IMX290/462 image sensors I2C xfer peculiarity
References: <m3y1gpw8ri.fsf@t19.piap.pl>
        <CAPY8ntASwh3AcRqE+2zF4Df=u+=wJ5K9icAeOrXTMJGDd1+caw@mail.gmail.com>
        <m3o7hfx3ob.fsf@t19.piap.pl> <m37cnuvmhn.fsf@t19.piap.pl>
        <m3o7h5tthf.fsf@t19.piap.pl> <m3jzrttrmz.fsf@t19.piap.pl>
        <20231011101553.we3r73xejvqdql5j@porty>
Date:   Wed, 11 Oct 2023 13:25:55 +0200
In-Reply-To: <20231011101553.we3r73xejvqdql5j@porty> (Stefan Lengfeld's
        message of "Wed, 11 Oct 2023 12:15:53 +0200")
Message-ID: <m3fs2htn7g.fsf@t19.piap.pl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: WA1P291CA0017.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::17) To VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:155::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P193MB0685:EE_|AS8P193MB1176:EE_
X-MS-Office365-Filtering-Correlation-Id: 767bc278-32c3-48a3-00a4-08dbca4cd660
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HFvfLQ68hN7dvg4n+/i6tZRrvhCtzwyJvEO/cF+4d9kWRne/lavag2zjyKEByiZPMdnHUe9mNT9bv7DzFBySWdubgDfto6QYYsjYNc9WKwnSGAbxGOBvEFd1MLv5U1isq9tW6OVvymAhUbznrzQyNl2mm/xnQ21OHIf9rnbLZct5/VivPCiNBrwLL9RGsjt5X8UoDFdeMdD1JnXFYtxBbKwGYS0CM5jtAB+kC/S50ZIlmvYlgq85+V+qBIH16JhSspduCMHViI36VUwyDhePfcpWXnGfqGjVmsMyI0lXrhi1KgDzwGe/35UDVaR6NTwU3IEDBtwbBdXr2gKhBOMxcHVAINBjS4WrZyB/vV/icq7V0ks2dPvt1jsupzZRGX/J7x1IAOR4xsWkfOag5t20y2h6d8DGNFc1MGGCsYPOBdbul9Iuf/ASYpd1NuEFPZKJeCKWcwEdurVKHDgbzqC1Fy31jzmMfH3U0O9AFscGfQisyYt+irN2PDGngZsXysAyfRgx5T2VWtoGVgyMPgM9myVm3X63yhyenhOcjHSAiU3PmueXPpbaCcytRw7tPZTrROsFlnBg9mnGdJx8RuJwiQHdXyaNuX2/9P8HpQZjiO8V7d549Mcvn1Bd9siJP9gH
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P193MB0685.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(346002)(39860400002)(366004)(64100799003)(186009)(451199024)(1800799009)(52116002)(6512007)(6506007)(478600001)(6486002)(38100700002)(38350700002)(83170400001)(2906002)(83380400001)(42882007)(26005)(66556008)(66476007)(54906003)(7416002)(66946007)(6916009)(786003)(316002)(5660300002)(41300700001)(8936002)(4326008)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGxWZ1dsb0o2N3RkWEhvcjAvcEhkZEdkaFFlelRxdTd0WUZZZTc2YTVGMTg1?=
 =?utf-8?B?RGVDcC9CQVE1RGR1WndqalgwbWRpS0FJZXFqSFMvM2VNalhud3d0eGZMOXJI?=
 =?utf-8?B?N082ejI2dmlmQlVhMWgvZ2srdzdpUTV2VlFZYThuTWRUTUpoNnB6M2krSGRV?=
 =?utf-8?B?UTRHZVV3WjhKOUZib0RmTzgvTWx1dWx0Zm5UQXNGQjF1YUJjSWlYeHBlSkpt?=
 =?utf-8?B?cGFNU0JJZzJGTDg4WXJzcHYrRkRlUjB2OFVjRkl6NTNqWDZLNHNacTdyM3F0?=
 =?utf-8?B?TVdYWFBtZFFjZFN1ZWNIWEoxRCtxeW1SbDhpdzEvTVh6elVubGpkaG1mc3Jr?=
 =?utf-8?B?WHNYSVY2NjM2WDVlUTN4MHRlbXBWcy9nTzR1RDF1RjVnR2tDVVhqb3M4azYv?=
 =?utf-8?B?UUwrSGhXWnJJQ0NaTkptbmt3RzltcGdoemcvMWpCRXpSdzBTVWF1cTRXL1pV?=
 =?utf-8?B?amxHaWY4dmpsS2NjZFk2TnZrT29aQmUxWXF2VnM1VE03a2c1SlJyeU5VeERM?=
 =?utf-8?B?QzVyMlhVd2tuUzF3ZEx5K2x4RVhJcGhFNitoS0NXNUVsZURINnJpTVJUc3M5?=
 =?utf-8?B?a21YVzkrWUl4TWVXOXJqMy9CdEdUWHBuRThYRDV5dEYyR05DSUErU29mSG92?=
 =?utf-8?B?ZlJSQzhUbVMyZWUyaDdKblRaekt0emppUW5QZWRmeExiakJtS1dPdmw0Zmlk?=
 =?utf-8?B?VFRLQzgxVnU0QTVBdEVJdGlvK3RlY3JFMmw5VkxVM0R1L1lPUEZPV0l1V1Vw?=
 =?utf-8?B?UStmY0ZMcmJWZ0EwcExzQkFwNjN4LzZvbEx5RlpBa3A2VjdyZkJwaURKeTQ4?=
 =?utf-8?B?enJoZUFrUEVvdjEzRHlkSkc3WU9sWXovcTFtRm5PZTgyak1DbGxtQTVKSEZa?=
 =?utf-8?B?OGVpT2w1WVFwSHFxRmg2SzVpM2o5ZWJ0Z1IrMGYyTUUydE54WW9DL1ZWN0Jh?=
 =?utf-8?B?Wi9XZjhjRm4xeVhLcDQrVGFLbk5IdE5wQUIzcjhCZSsvTHkvQVdMTC9rY0hG?=
 =?utf-8?B?WWVRSjhJMkxlR2Y0ZFpsc2xvOVl2M1RuVTBtMGh4OXNrdjdiWFN1YzZyM3ho?=
 =?utf-8?B?R3dhTkdndWVwZFdxQlU2MTJVV3hRS0hvakxxVXo5LzNBbU1ITnRSVVJ6S2tu?=
 =?utf-8?B?bkdsRHhWSUpkYVVnQ3FKb01KM242RkRtbGRvQVNEc09jSEFwOEk2V1NqK1g2?=
 =?utf-8?B?bUV3Ukdobmp0bHRvZkcwUGRmZW13WE9TTC9URXIxN1FmbnI0UEEyVVFidkMy?=
 =?utf-8?B?bWVCTWhqaWtwb3dtUnYrQjdsaVVaRVRQM0pGY1luRjcxS3FMVWFMYnExTU1l?=
 =?utf-8?B?ZmJHY0pLYzIwMFlqTXI5WTRoNlJKeTgxY1AwWm9TQk9hZ1dQTitkZ2Nmd2pN?=
 =?utf-8?B?UmFTdHdTTHppZ2U5WUE5OUhuL0wrdlU4Wnk5TmhXcVBwbTNpS2UySWtzbUtJ?=
 =?utf-8?B?QnpVTTR3aVNSRC9qL2o5U1UzTWdXblFFRGo5eCthb2svaWhjcUhrREtmYzhT?=
 =?utf-8?B?ZGl0bEtMRGhnTU1LMUhLSHB1SDZ6amI1bjYyL2d2SERpcWJpN1U3U3pnR3NX?=
 =?utf-8?B?a21UK29nU3JDQmZRLzhZam9hblNSUDZ1Tkk5YVNhcFNtdzYzTk03MDkrR0VF?=
 =?utf-8?B?dDljckFDeVZaak9HbVR3b1BDaDZKTlN6UGhjZVRIY2p0SGh0SEN1WUxHaFF3?=
 =?utf-8?B?Q1VXeEJhcTVhKy9NWXBGUkhuQVYrbFlYMXBqVFhCMGpIVUtWOW1kbG5nVmJF?=
 =?utf-8?B?YkVsVzZoQ2huekdMeCtHVWVhdU9vUDdmdmJEYWRuUWZYT2QxcUd6ZmVWeEJy?=
 =?utf-8?B?akRjcnF5M1hyZDNuOHV3ZVZMY1YwVy9QWFJoeEg3S09zcDRGeHFxdlRaaHFD?=
 =?utf-8?B?VWRkaWExa056WHVxVlA0WFVxb2MzTk5IZnR1RGVMYTdCajJKeTJtSDBzcFJj?=
 =?utf-8?B?TXkxM3doZGwvVkVaVjlmNk5FSVJ4RHNhY0o2YkRuZzcvbVVFZWpZRCtpSHU5?=
 =?utf-8?B?RmgvSGd6Y1JRaHpGcnJ5bitoTWl5Q0xWNkRvcDMxeVNydGwyb1FqeDFmU0M2?=
 =?utf-8?B?SmNtVmUxU1hzb3JpT2drY1V6cFlieVMzT21VOU5Kdis5Qmd3RkJ3SVpmV0FL?=
 =?utf-8?B?UEMzQzZuN01MYlVVdXNDMGJnZUNXMk5xQ2RTVGt4ZTdVd3ErMURBV3ZCenps?=
 =?utf-8?Q?E84cEhvjiJ/2Nz4s05C2t17KECzidcKsXwJuUbsr1k1l?=
X-OriginatorOrg: piap.pl
X-MS-Exchange-CrossTenant-Network-Message-Id: 767bc278-32c3-48a3-00a4-08dbca4cd660
X-MS-Exchange-CrossTenant-AuthSource: VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 11:25:56.7257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3e05b101-c6fe-47e5-82e1-c6a410bb95c0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: chnB0sWvtOyRTZwoU9Uktc5SyUybPPRewqPWbZhb6yBwjCVFEG+CtDOQ+DOxesrT5j9W+nrSm48R6oDjSwMiggttzd8Q3j/pPftK3FlttPkumIKWV6NXlH1fnzJj+LFeV2E4P82hnr5B59zaHSIU9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P193MB1176
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Stefan,

> I cannot answer whether the delay is needed for atomic transfer or not.
> But I can give a bit of context for I2C atomic transfers in general.
>
> These where only introduced for a very narrow and special uses shutting
> down the device/power with external PMICs in the kernel's shutdown
> handlers.

Well, I guess I'm abusing this code a bit.

The problem is I use Sony IMX290 and IMX462 image sensors, and they have
an apparently hard-coded timeout of about 2^18 their master clock cycles
(=3D ca. 7 ms with my setup). After the timeout they simply disconnect
from the I2C bus. Of course, this isn't mentioned in the docs.
Unfortunately, "normal" I2C accesses take frequently more than those
7 ms (mostly due to scheduling when all CPU cores are in use). So I
hacked the IMX I2C driver a bit and now all accesses to the sensor use
the atomic paths and local_irq_save() (inside the driver only).

> My understand is that an ordinary I2C device would just use normal (and
> sleepable) I2C transfers while the device is in use.

You are spot-on here :-) Now I use IMX 290 and 462.

OTOH I wonder if such issues are limited to those sensors only.

Thanks for your immediate response,
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
