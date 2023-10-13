Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BC057C834E
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Oct 2023 12:39:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230194AbjJMKjf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Oct 2023 06:39:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230429AbjJMKjb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 Oct 2023 06:39:31 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2083.outbound.protection.outlook.com [40.107.6.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5F7F10B;
        Fri, 13 Oct 2023 03:39:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aJIiPxcj/F0L/Vwlpdv1kKpoiyQtki06QGl8GI0MQk4MjOWlITRUvBqlPqwjeBCjNLeM+rxQyooubEMw2H1/t2XJnZB1V+9pbuYZmzS+ZwHHWZYSxUGai17tYZdsiNGPpm65na1aq951L9HP5dcD0UWxGmF6sirlcqPIQQj4fhUWDXSwqr377hAWbEJbPoUk5J1qa3+Z5JSHTwkMLPWFws9zA9gJhTZx1uo25prxLargo33jwiJDhfZMlqc1t2fIK0Of+hMcuYD69Lw7Tpr9aqJgYYTi6dNeOOnppeFvfPqlqAfaKIqCroJrNs+z0t+vDbEQXzFhivhVMEpSXE0Y4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/q/Q4y6ab/DuhdpLXSBA9//nauFzjd98lt9HvmG6hoE=;
 b=eS/CspCCS17eaW/MdjwMan/K2W5usKla/nuMRbdllkbTdd3WQlHGGyXrfxLUxte2mWhr5q1/d4H0zm5X/sDisJporsWc0rnESbAseF5tmrMYAag8aaJ5u4lH9gS2/4evLqByOPPju4Qomu62h8tDbNp1KzWHwO7rDF6URK3oddUiZE9JVqb2WkvAFUunukhqMM3Y7E+dKMDnXReXOcXKyzKPN3Y6S0NuJJjWLhRlXycKqD67oqJEU6/wWqRf9CjExrblj4QkX6jBayQncSk1WCwhA7cxiz3AKGM2xAskSw43irI2bRUZ55qHyXPJQbOiN536q+/3PoL891Lff+X12A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=piap.lukasiewicz.gov.pl; dmarc=pass action=none
 header.from=piap.pl; dkim=pass header.d=piap.pl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lukasiewiczgov.onmicrosoft.com; s=selector1-lukasiewiczgov-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/q/Q4y6ab/DuhdpLXSBA9//nauFzjd98lt9HvmG6hoE=;
 b=sfmus0UprdqtMnm3mdcTsjAtWTIDILOOVB9XREuY+hMzvr+5t+g4ADxMDn3XSr/oMdFRYNawqfXv2M15evHXQdiYgA5s6mE5uBZOFU79aoR4E2Zk5geaPUxYv6VNNjZlRjHMFS4fHXC/sBXKqv06ZA9x9WjTSAas9NgFidADZj0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=piap.pl;
Received: from VI1P193MB0685.EURP193.PROD.OUTLOOK.COM (2603:10a6:800:155::18)
 by AS8P193MB2302.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:44f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.46; Fri, 13 Oct
 2023 10:39:11 +0000
Received: from VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 ([fe80::bd36:39a7:40e3:c90e]) by VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 ([fe80::bd36:39a7:40e3:c90e%4]) with mapi id 15.20.6863.046; Fri, 13 Oct 2023
 10:39:11 +0000
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Stefan Lengfeld <stefan@lengfeld.xyz>
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
        <20231011101553.we3r73xejvqdql5j@porty> <m3fs2htn7g.fsf@t19.piap.pl>
        <20231012220127.GB27838@stcim.de>
Date:   Fri, 13 Oct 2023 12:39:09 +0200
In-Reply-To: <20231012220127.GB27838@stcim.de> (Stefan Lengfeld's message of
        "Fri, 13 Oct 2023 00:01:27 +0200")
Message-ID: <m3y1g6st6a.fsf@t19.piap.pl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: WA2P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::16) To VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:155::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P193MB0685:EE_|AS8P193MB2302:EE_
X-MS-Office365-Filtering-Correlation-Id: f212bc5f-a398-4047-a585-08dbcbd8a2c9
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MbYYD/c0RG5gyd1TC7a6jm2RwmCeu6Wm613/oUd1j9F5jYgJLaBGOMJvLwdo9W62sXERC7euKTK0bZwTuZY9XcgS5eNHFQtTBVqFESh2Jj2sgL8Zq1TDYpzIYK6Kn99SN1yPCLK1+zEZoibY+YAgI1u86BtU9V1F58YE63J6M7rzosyFUAI8YN7SKbaSz++zdlsu0OoDxoKaYgftHOrTgegVSmIVZzreLr3We725Ut+OJUEPe4jHF/+EBKv4DIj43L9iQbsUNpwm6qjCayTPvhBiCSYT0SOZKOjQ1WlXsJHgAqyefRtHucw8Zsyp7n8Pl6/A8H2cU95oBh7MpUWUPt/yzGnq4ot7SUCzAHOxCz8fmuTdqagBUcO+VPZUA4ZIC0JH0g0WsyCwU2Bd00m/1OSOZC6wVnFv1kFTNmjc0HLLf5nHzvtzrEUFv5TSwAj3vJK5j+qH4AW6TeGQ0mp4ZWZGg8yAcyjNsyYcLf9XWnrE9OAJtSa1A4UgnG6AmdT4ElzqguKTtKW2elxAt/lRLaEH3yVN+JpffYNSrqPpGn0EIqVBPUVKGTSb7UyxCklZ3LePBPdE71NbQJbH3Cq/5YNbkUvxcUX39HAM+1pZei7tVTWKuXKbGllJJsFOvImj
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P193MB0685.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(396003)(136003)(346002)(1800799009)(186009)(64100799003)(451199024)(6506007)(52116002)(6512007)(478600001)(6486002)(26005)(83380400001)(66574015)(316002)(42882007)(7416002)(2906002)(6916009)(54906003)(66476007)(66556008)(5660300002)(41300700001)(8676002)(66946007)(786003)(4326008)(8936002)(83170400001)(38100700002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDlSNlBQNVZjSkZScXZMbnEvWFk3aDhUOHpnS1QwUGl5YWlUenFwakE4aEhH?=
 =?utf-8?B?ZnAyRjlHVWVUMEk3OWNLdHUvZDZhQ3dBbGgxQkdtcTdpYXZwZSs1aDZlOHNu?=
 =?utf-8?B?aVNHeUhJUDhFQ0trZitKc00rQVBOVGRBcThOb2l4elBMMWYyeWJLR2dDODV0?=
 =?utf-8?B?NkRJdWVkTit5OFlMTVp5ZTlCeDRGOUV4WVhSSE9TU05pQjlzem5MY1NYaHUv?=
 =?utf-8?B?SzNCQmcxMEV1SDdWS1k1UmFZMkx2ZEhOcE5GT3NKNDVESkhxWGdNODl1MkIx?=
 =?utf-8?B?Ujd4VkF2R1pzb1lrM1NEMHMrcnVVWmVSNnBuNGtwTVdsemN2S0dZOWQ0RzNQ?=
 =?utf-8?B?UDZvVWhBWXJGOGNOcVE3bXZnZ1NIS25lOWtFRzhWUVJEek01bzVTUG50VGlV?=
 =?utf-8?B?WVlqT2VGR2Zncm8zdGdRaTZ4QmZ4SHpjblR0Z1F0c3ZTSFlkYlQ3UW04Ym96?=
 =?utf-8?B?cDBXbXdKSzdHR3I3djJQZENDQ0xPS0xYdXNUWlRyMFhYODN1cG1lQXg0Q05w?=
 =?utf-8?B?N2g3UVVyNTNKRk9Hc2Q2VlhLQ3hrMERvUE9SVlN1TXdxd3FjOXdyU1ZpcS95?=
 =?utf-8?B?eEp1MDVwNXJNVWxlMW9vZU9nSElNdlVhK1VJclgxNSt6dUJxWS9ZV1ZVY1Bh?=
 =?utf-8?B?am03NEwyQ3dPNzlobGpKOWdYYjk3WXdCQ0JqOXdQTmM5S1d4ekViUWxFYUpO?=
 =?utf-8?B?alhibjZOMFNzVHFXWVl2R1FDbGp3d2E1cDlMRFZLOWtzY0dJWnZtVldYMld4?=
 =?utf-8?B?YWFsUDR2SmxtRFRzTjIyMjJDVXh3ckFJMWxvRy96cTdlWVRCRGlGZ1VQVlgz?=
 =?utf-8?B?b1o1NTJYN201RTl2eDZmdWQydFFrZkdFNmgxT0RSUmRmWDk4TTVaQmFQeE1m?=
 =?utf-8?B?TTQ0a09Hejh2S1kydG9EY3dHMXdWSDhlS2Q3eWg4MTdvWm5GN2dqTkxLYXpU?=
 =?utf-8?B?VHZndXNaMC9MQkxOYW1KOEo5ZjVsRlBIYnR4QXJxN2pMVGV1aS9XWk9COFFF?=
 =?utf-8?B?N3g3QVVnQURXWWtiQVVROU1BRGQ3RDFxeW16VERpTHEreWhFakJud2ZyazBi?=
 =?utf-8?B?MEM4OEorellmWXhuZ0RiamVLby94UDE4R0E2eFJLbk4rZGp3MVQ2T3RSOEdn?=
 =?utf-8?B?Rkt3SFNjWWJLaGllQjRSbzlxTWVMdW0wUVVZUzBMRitMVXhRb1hqem4xeVlz?=
 =?utf-8?B?NnFQcHM3aklMV1B2ZTVYRVlPUWljU0N6L0lTTGFpWmYvaGpsSnVkZ0hOYVRt?=
 =?utf-8?B?cUp2M3ZFb0dsU3ZTOEZYcnlab3JQWGZEeWNMQjF1SlNraGVBaUJZaDVkNGNq?=
 =?utf-8?B?NlRLdlZrN3pzNTdJaHUyOTlPUzcyM2p6MllYSE9SSHJPVUhXZit0dmtBcU41?=
 =?utf-8?B?cGw4MXYyZ3Zpekt2UmFjL05Tanh0MHJKNGFIbjJrakZhNGpXdGc2OFdGRCtv?=
 =?utf-8?B?SEFOc0YwVzVyOXRiWUdwMnJ2dzlIdm5LUHFFNHRReGh2RWhNcEtjcWoxN09w?=
 =?utf-8?B?b1ZZYUNTbWovTFZXMkhUMXNTcW1tWjcyTXBIM2RCZlNXSW1GVlBmSzJtL0Rx?=
 =?utf-8?B?SFZSdDBtT2JSeXNiTi9RaSsxdE8yZzFaOHFiMGxDeEUwQW1GZWZGa2VxSDJl?=
 =?utf-8?B?cDVFWFpnR0YvUkV0QmhJT3lucFdaUlZrQ1NYKzZrOXcyU01GL2hVZnZtdzZF?=
 =?utf-8?B?bEIyWms2KzdnU2dwdFdXQmlPVG5PU0FUQyt3emxnVkMzemZjdFVLL0VZeUJP?=
 =?utf-8?B?WjJsMGVlK04wLzVBU3hsWVQvWGxuMFhmMHdYNHZsUm1qNW9GNW9vZlhLVnll?=
 =?utf-8?B?aFNVUFp4bWFkZ3F2VUNpSERhYjJHQlUrL0VTeXJDZ2w2UVJVdVByRXlHTW5Y?=
 =?utf-8?B?d0tWcEJSdTh0cVBrOGdaMmxUTmcyLzdEV1crNHVOc0FuTkF2aUM1dTBqRUtl?=
 =?utf-8?B?NHB4c05GWW9qM09EY2xwYU1HZ0RyVXdkbHBGUHlDQytxZVlROVlEc1pIK0pj?=
 =?utf-8?B?ZWZFd1JzeGo0SnpnVTRLRkxKKzhDWTdvR0V2ZEJQa0FtcWJJb1FsQ2tZSUNU?=
 =?utf-8?B?Zm1WaXFzZ2hseUJieVo1d3BuRURsM2NIS2lPSFdFK2F0dk1GWXhiQzE2TEtp?=
 =?utf-8?B?VXJwZmtHR2JzTUEwWXBRM1Nzdk8rTXYvUXBob05sS01JcjAvREdYbVF1TGJS?=
 =?utf-8?Q?WACJ3cNuFAlwE2jCIWYlzzWXd9hdfLyYNDphWvu3rHZj?=
X-OriginatorOrg: piap.pl
X-MS-Exchange-CrossTenant-Network-Message-Id: f212bc5f-a398-4047-a585-08dbcbd8a2c9
X-MS-Exchange-CrossTenant-AuthSource: VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 10:39:11.0252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3e05b101-c6fe-47e5-82e1-c6a410bb95c0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p2Mx+LKWUrEtPlDH8DIClLugtcFyimSCZM5FdxMEgMCWctdbFiziAF21GpGMfGel69Uw4B/Fw1gh+mbzgtLzqs/evM/yhYDx0S2lmTfBPYIXuVKT+xTA5QTzyo8qAg6my7p3KZrMB5H9i2N5DvDHug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P193MB2302
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Stefan,

> Maybe you just hit a corner case or a bug, that can be avoid, in the I2C
> device.  Maybe check with the manufacturer directly?

I don't have direct contact at Sony, I guess I can try to escalate this
through the part supplier, but I won't hold my breath.

> Do you know the I2C repeated start feature [1]? This allows to batch toge=
ther
> multiple I2C read/writes in a single transfer. And in the best case, this
> transfer is executed in one go without a delay in between. At least in th=
e
> kernel it's guaranteed that no other driver can go in between with anothe=
r
> transfer.

Sure, imx290.c sensor driver use repeated STARTs. In fact, it only makes
things worse.

The timeout counter seems to start with the regular START (falling edge
of SDA), repeated STARTs don't reset it. After 2^18 + 8 or + 9 MCLK
cycles, the sensor simply disconnects from the bus, generating
pseudo-STOP if it was in the middle of its 0 bit (0->1 SDA change while
SCL high) or starting sending pseudo-1 bits otherwise (0xFF data on read
or negative ACK on write). This way repeated START -> longer transfer ->
higher probability of failure. Not that it really matters.

I don't know about in-sensor race conditions, for example on WRITE to
the chip, when the ACK it interrupted by the timeout (this can be
detected by the CPU, but not reliably, depending on actual timings).

OTOH with my "always use atomic xfers with these sensors" hack to the
i.MX I2C driver, it seems to work correctly (at least as far as I2C is
concerned).

I wonder if we could/should add some special handling of these sensors
in the mainline kernel. local_irq_save() and the atomic path do the
trick, but it would have to be done in all I2C drivers (or at least in
ones used with these sensors). If no other devices need such treatment,
well... Everyone can (possibly) use a non-official hack.

Thanks for your input,
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
