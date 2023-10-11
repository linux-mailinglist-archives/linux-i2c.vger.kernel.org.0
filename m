Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0A897C5374
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Oct 2023 14:18:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232126AbjJKMS0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Oct 2023 08:18:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231889AbjJKMS0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Oct 2023 08:18:26 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2085.outbound.protection.outlook.com [40.107.21.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A20EB9;
        Wed, 11 Oct 2023 05:18:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VNBHmXX8cRMsuzbvkDXI9KQQzESMvQN+bSHyLX66ErA8HfKLF5u3uQ1pJ5HJYGNc3rYeStzn8L/4Umwnncp6Di1WmcdJhD1MHWc4+CrTLksFU7ldhBA7TlLEZPJOXfNo+cpbxWl1xjgKB50YENJxPPoOY45UmPjE9/WHN0x+frD5NqrQ86l73QCrBDvop/AUlEjcDoaq4lqZiSyJkrNGYYs5b3azmiPuPkgbKnWbMyKzqryleWLjsW79mUgJ3z68U6FrTcsLhbWVx0NQabEKw/CNYrNQ0YKamDl4YH1fbAmkxcgLi7wt6iMk7yTJmQHQNVQDT2TWIjUalbF+1MmBnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k23ZPvJIJDUa3Fu5ZSmhQ2aoRV+Bq1qKQUb/rvrEAJ0=;
 b=jEZHzZ1ocN4+TK2xy8bfoIosUo2iSoPmTaOzbN7ZVk8DoTE/UR13d6FsFWNYHphp+vUTpHp/uVMJFlyGOPWu9afrtcxOj5sh5ySYBdjwuma5HbMG6JL5ACui1oEv+KKFfFNzGsIEX1hBEOBCh7DM58ETsJxTBf0jclGumOufQu0FZgNzVS4pAwgjiI17/c6pit3xRlaTRYbIvVspExnvKmSlaHyKLpi5g/gf+3qoHTi55RZq5SLbQY2qUdOkBBxvDVUqBAq7A6SAVhDZLM6mjucSRQ41NAN6O/ft4yHCghC1BZWbjC9z2Ikfh1mNMfXfkjYBQPIA3KZqXcc+6hrlBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=piap.lukasiewicz.gov.pl; dmarc=pass action=none
 header.from=piap.pl; dkim=pass header.d=piap.pl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lukasiewiczgov.onmicrosoft.com; s=selector1-lukasiewiczgov-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k23ZPvJIJDUa3Fu5ZSmhQ2aoRV+Bq1qKQUb/rvrEAJ0=;
 b=ZA97BUHqVMXh9XjoAsVqmDveu/XT2mjeht2wC8jBmfI0cnDbtTW+4KV5hmhNQTWm0L8XDq333Qrm2Tgq0j4TXV9HfNv6d6b0V7JdBgqjoa77pEdBcwwpO6bNGpT//YfR5UAsLohw9FzW782UvWXp2FXKoHyQgCSjA0Z9ZehD8Dg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=piap.pl;
Received: from VI1P193MB0685.EURP193.PROD.OUTLOOK.COM (2603:10a6:800:155::18)
 by PAXP193MB1648.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:15d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37; Wed, 11 Oct
 2023 12:18:21 +0000
Received: from VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 ([fe80::1bd8:1a5d:e69:d1a7]) by VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 ([fe80::1bd8:1a5d:e69:d1a7%3]) with mapi id 15.20.6863.041; Wed, 11 Oct 2023
 12:18:21 +0000
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Stefan Lengfeld <contact@stefanchrist.eu>,
        linux-media <linux-media@vger.kernel.org>,
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
        <20231011101553.we3r73xejvqdql5j@porty> <m3fs2htn7g.fsf@t19.piap.pl>
        <2905840.e9J7NaK4W3@steina-w>
Date:   Wed, 11 Oct 2023 14:18:20 +0200
In-Reply-To: <2905840.e9J7NaK4W3@steina-w> (Alexander Stein's message of "Wed,
        11 Oct 2023 13:59:50 +0200")
Message-ID: <m3bkd5tks3.fsf@t19.piap.pl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: WA2P291CA0016.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::12) To VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:155::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P193MB0685:EE_|PAXP193MB1648:EE_
X-MS-Office365-Filtering-Correlation-Id: 587d428f-14ee-4175-e62f-08dbca5428c1
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nIANatbMok8KLzKN6yZQED253ddyhpVOaSBbPcKM/yA904eN/MCmRSDUtwS7yK3FlyxG2BE92b2GcbXMFxfAjnjaRhMjCmVAwprPbOrOYvcaHd7H0FiWorfny96Zf/UU/NZECCZ2E9/yFrwL1l1ZiuAFnt27xlcXdDlen1NTf9HEzdCm0ZEpX6l1XZ6lArv4WLb+Hlf1tOMW6bVUSZjRpoeYaOwjJTSpQr3a5vYw1zcut0s7jr0OR9rgH7TL+buPIR9II5Wb5w7RSP9czV9N6jmhmPV7wjBPHTbRNTvn9Mb/95ZXY1enf2ip5DgwQpNGSd/E+pzbmQMZq9mGc+pZORFnbmIOsulg9fdt2lz4X32zhbk9aClurNmZzvH9N2OZHAObVkZPNhg1aNkaA32HK2dh5kr3towGApX8PLqWeet+Ey9NF2oNqy9XCE+NTUxDsply0l8N31s6A247JFpW1/sxdE8msqP5JNXVg/8nxA6K6/Gpwv8SiEydZW90uS0nLl3CTQbKfOH/FCyeVxLpnRxkD1XWnsEeHOjPUDeo8XfAph7t3z2ZwE8/m/yn+FCgBKg3i8YpWD5CoygMsEInWUNw3TCUti4w2TrULynpK5eIlPKGK8TBSNdCnfrkKeR6
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P193MB0685.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(366004)(39860400002)(136003)(376002)(186009)(64100799003)(1800799009)(451199024)(41300700001)(478600001)(6506007)(52116002)(6512007)(83170400001)(316002)(38350700002)(38100700002)(786003)(42882007)(66556008)(2906002)(66574015)(7416002)(6486002)(8936002)(66946007)(83380400001)(26005)(4326008)(66476007)(5660300002)(8676002)(6916009)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0dsYVFBUmtuNytTc1Ziblg4ZzBNWTVtL1d2MjlPR0xkMmNaVmpkRG9oSm00?=
 =?utf-8?B?MWoyaU56T3ErT2VSSFZyd2VlVzVjOFBIMVlZNUhOTTFsempaWWVBZmthNWRr?=
 =?utf-8?B?WTJiUjhZd1p5dVBBbm0wNGxPb1BONXhyZGlFQm9sSXQyeU8rdVZmeUx0ZU14?=
 =?utf-8?B?Y3FsekpxZkNJQUYzc21RRVV0K0RUVDFIYkM2SmxxMEJVNDBtM1FTYjBPL0lL?=
 =?utf-8?B?TndWODZYQjVvcE5za2ltbEppcS9DaFZpOUNUbGJ3OS9Ham5kdmY0aUp4VC92?=
 =?utf-8?B?MjNtbnRQcDVvOXNlYWJ5U05Ca0ZaaHhDL0NsZkNEd2YxSlpXa01LMjZLa2Jj?=
 =?utf-8?B?WmRpU2NqMTRiVE4vZ0N0ZVA0OHNwZkgzNStCY2dkMVBaQUorUThXMHNrRHR0?=
 =?utf-8?B?TmVtWEEyVXVWSkNQZlR2Vk5UUG96WFVvUmlORHlLY0Z6YnBWYWZyVFBrbW02?=
 =?utf-8?B?cXYzTXJjaHd4Tkk1TXo3N3V2d1FkRWZqTkNQQnRwaHlpcGNidC9OcmxwMWxI?=
 =?utf-8?B?OEp5a0VkQ3JSMkVLZnkrUGtSd1V1RGVmYXUwRWdjNG9UQnVETllaRTB3VnM0?=
 =?utf-8?B?WGp0d3RpaThWNHBaSitxRHpGM0lzQkdNWVl2aGw4bk9iSjJkbTYvM1NpUlFQ?=
 =?utf-8?B?OTY2OU93T1M1RUpMQ2FkZUtFd0VlNVJyb1N3WUlPS2c0M0tSeVUwcmNZTWdi?=
 =?utf-8?B?UzNFcDB6WWtnZzNpVFFhS205MW5HNHlnR1ZmYjlHSjVxSFNsQWIwejBTYkJS?=
 =?utf-8?B?SHFSLzBZWjVIbnB5dVUxN0pQekR1VVM1cDMxbWFCcmlxQW1ZZHkvbUdWSEh0?=
 =?utf-8?B?bFZVT2VNWTRBUHB6WDM4cFJVUnhUZmNqMWZ6Q3R4RCtEOWswdjkzckJodk5u?=
 =?utf-8?B?dWtwYzRxUHZ3ckNmSGdEL0dRa3dMRUhERGxDbEtVT3lVUkd6UVpVQUFZOSth?=
 =?utf-8?B?OHl0QUF4K245STdYSmQvTHF2a1MxRzViNWVlallqS2hIZWV3ZzBub0F6K1dD?=
 =?utf-8?B?ZXdJRkFpcExQQXBQYXNPUkgzSmN3RVlITUVuSWNMd1NOS2JVM0NzYnlHYm9O?=
 =?utf-8?B?ZjVWTm1BcW9vTjRWTkpDQUl6WHNPNXVLL29YVytnTEZiMEJXUzVZcnVyTUta?=
 =?utf-8?B?T1JHbDNPaVV2ZnNYSittcjArU3FIYkYyM25pMDg1bzZvZm1TQTJESmo0SGJj?=
 =?utf-8?B?YmU5TUQ0V0pBZk5jWUhFWDBTbkRJN0lETDFnaWs0blZCU2FTNHNadklWREpH?=
 =?utf-8?B?RlI4QU93bTlYNlBSRXlWbVRyWUsycW1uYUx6VlY3dDNJRlphb0d3ZzhDRXhs?=
 =?utf-8?B?YTlDOVhFemlhMWNVdlZWZTJ2cTZMamNCa0JoZkRNRE9MOThtQXRXNEJEa0N2?=
 =?utf-8?B?VmpWVFdFQ2Q0ZjlJa0JxcHZiUll6NEptVFFmaDRZUFZnRHdLYytTRTNBZ3Nz?=
 =?utf-8?B?alJVbmZHR2FHUWp6czgzWHdtNkpBZ2R0M0xMRzZBSjcvUnc3SHRLcy9tZHY5?=
 =?utf-8?B?OUJES0JOUjBQYk5Wb2VEZFB6cjB5NFYzZ3cyRm5xS3ZCVDIrVDdWWmlLcmZq?=
 =?utf-8?B?V0hvZzZ6RnRLQzNDN09VeFh0UEN2L1p6N2xZZ3o0eUtRMUltRWpHRlh6SVdZ?=
 =?utf-8?B?NTZKekpzYlNld2gxMFJxaEY3WWZwZ1RCRjI3dmJ0MjZIQzBGTDZwdVNyOHNK?=
 =?utf-8?B?ZlY1OTVoSGxEUjFOTU8xUk1HVkxrcVZ3Q3NudWRKaFdZMXpyeU00QzYrUmg1?=
 =?utf-8?B?V0wzYjdET1lTWTBOdDVoZllNVkFtWmt4OWpHRkdyS3YyQUV1QzMrRFYwZ2lq?=
 =?utf-8?B?QjRpazUwZnlQRm02NjRENjNiRTdvMkVPcHZhOUhsd09jOEowTWtrWEVnOTR2?=
 =?utf-8?B?aU5mamlBUDBseW1Mc1JKaGhhd09kNEh4aEpFaWVWWWpiUWRIZ21DVVZiS0wx?=
 =?utf-8?B?bUlYcWR3ZHk5TW12WVE3ZGZFV2FBTUR6R3NabjRJbWI2NVVmcnlyOWFaZFdU?=
 =?utf-8?B?UHRQTElCT1YrM1RMVWt5eW9zZ2JoY2RFM29FWDJoL2xmNnNNR3ExUWVuUkdp?=
 =?utf-8?B?QlAzaVJ4NmFaLzdNeHZqVWUwSE92QTVaYmdMM3ZLRDBuZlhGSHB1cDZWS2cy?=
 =?utf-8?B?NGQ2a0ttSWFOZmRSWi93UUYzNjdaS0JrQTREOGpGQUFuWE13QXJTWHZPdVY3?=
 =?utf-8?Q?PsQ2rOeNa8nA3tYnLyUdz5/unSfftOwt510ic/dXIYzn?=
X-OriginatorOrg: piap.pl
X-MS-Exchange-CrossTenant-Network-Message-Id: 587d428f-14ee-4175-e62f-08dbca5428c1
X-MS-Exchange-CrossTenant-AuthSource: VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 12:18:21.3991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3e05b101-c6fe-47e5-82e1-c6a410bb95c0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZGvPtTqv/dYReTPQfwkyI6kyuO03m3RteM+F39BbAMBcc4FBOEkfMrkE2VA+1fR2rMNVpIle9v+dZY/1xMYCb3JlVcRZbAXjL469XmAnFMU0DXaNg866vLbVQ90zcTEwE2VRJRuBK3bjZuf1IlKCew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP193MB1648
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Alexander,

Alexander Stein <alexander.stein@ew.tq-group.com> writes:

> I assume that the master clock is running independently to I2C from the S=
oC=20
> the sensor is attached to. Your calculations indicate you are assuming ~4=
00kHz=20
> I2C clock frequency.

This is correct.

> But nothing is preventing that sensor from running on a 100kHz I2C bus. E=
ven=20
> this "atomic" hack will not be sufficient in that case.

It will be sufficient. Even if all times are 4x longer (they shouldn't
since the CPU won't get slower), they wouldn't reach, say, 1200 us.
There would still be quite a lot of a margin (the timeout is 7 ms).
Even with the faster MCLK (these sensors can operate on 37.125 and on
74.250 MHz) and IF the timeout is still 2^18 in the latter case (meaning
3.5 ms), it would most probably work.

Of course, the atomic hack is not meant for general consumption (at
least for now in its current shape), only the udelay() reduction
(100 -> 1) could probably go in.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
