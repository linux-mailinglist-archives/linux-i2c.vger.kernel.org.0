Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07B1B4C7C7E
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Feb 2022 22:54:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230153AbiB1Vy4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Feb 2022 16:54:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbiB1Vyz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Feb 2022 16:54:55 -0500
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (mail-eopbgr20097.outbound.protection.outlook.com [40.107.2.97])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2A732458E;
        Mon, 28 Feb 2022 13:54:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JSWLLHIjXFgUTS4YBh0mMSTjcW5HCxXNzF0QgTa3+oft2goqpLhNQUaSFwlcwiMg6qBKh45Wm6wTb7X7ln08Q3cig6Rijlg/RvIwotSNogTNtO9c4xuRzfHszK45tcW3fDV0YUYAjaI8Jk1ALu9dg6LTSSymqO/SpoW6NuIpCWoLUnVeFd5Xli75h+ZfwuG5xiyKULQ+CE1/1omvfLwa9LwSAABbWJSWS8v+7a+n+ouDIB/v4+whKLdrQ6cd4Oe5M6LCr9mo2cpmHvJKCXhz9IorSgfHkXtbxTChARIZqg/KP9M520Uz36izfv2IeXL65bOnxHjpvMzPB2wTPyCtRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZOjrOQgOLcAYBsxp2mpvhiTVxemqgbSP/aJhKkbsSio=;
 b=kts4CLdupMuYiP0/2i5KiNZeb3vhejeVwKOrj/EwFuT2ociEebJHhyoXDbA4F2UqBo/8FclnMeeAgb/noX1v5M+5CyXFcFbW5lg6Ipo9dQc6dRRE2nKcTqnprIRowyZ+uJATv9d7YSEaQkmqArFQjukyXyYKn0QsnSXTYKaOIJlAuzieZj/A3nzjprD2rEPDqJH+JHwnoH7OOAs1xn6RmeWuXIQYk8Dm2ZaHYaGXEVr+okWVVKB9qnr09GATAoBPaGBgbcpm0UwIh0yMl9vCl1dBs6nexul7h8FbyufmZAIrPb7qL11pOHorgidiMFv/jAT1FidibENUpMtdNdLWhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZOjrOQgOLcAYBsxp2mpvhiTVxemqgbSP/aJhKkbsSio=;
 b=SmEWHcALmEUlu3Wc3Ns9+hBkjrEKmkqpEXdTk55mIxsv8BIOIvFm29ymDims7iiXLhdTUNWRHXRh86PLeDC1tfBwrIBsyjS53RXrMcjTKJcKUwjbyjlJeiCSG8/2c/Z+xoHl9teRDuwKgObN18VEOO00pkPP4j5cuqczH/dEBTM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by DB7PR02MB4282.eurprd02.prod.outlook.com (2603:10a6:10:4e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Mon, 28 Feb
 2022 21:54:12 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::7d29:dd84:d2bf:a1a0]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::7d29:dd84:d2bf:a1a0%4]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 21:54:12 +0000
Message-ID: <ae14fd3c-2f50-b982-c61c-9db3bb28c809@axentia.se>
Date:   Mon, 28 Feb 2022 22:54:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 0/2] ic2: mux: pca9541: add delayed-release support
Content-Language: en-US
To:     Zev Weiss <zev@bewilderbeest.net>, linux-i2c@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220201001810.19516-1-zev@bewilderbeest.net>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
In-Reply-To: <20220201001810.19516-1-zev@bewilderbeest.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0068.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:a::20) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abf9f1f5-3f9e-499f-cfe5-08d9fb04db07
X-MS-TrafficTypeDiagnostic: DB7PR02MB4282:EE_
X-Microsoft-Antispam-PRVS: <DB7PR02MB42826ED63F6AD1493200E758BC019@DB7PR02MB4282.eurprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hWc3rjjz1gymR5Wdd+SzEp6kN0NU3Mv1WuYyEbjuthK4lELYQE7JtA9Tl4h/Ogt6gZVu+Os3nQny2NoBkCVXD+DvtPhClCtuzDwbJxXzgAMogkmCX8IynBHqBEWXl81bXuCcqsWViH3vf/Fx8yqO5fvQh8s2SmcEQeYt3fuNi7q+6tRyyEF86vbspcF/GDXnrF2WS2N1ErEuE34LpTd4d/Hty0c3aIu2cNsPQZ4RNPA/zOe3VY8Dk6BZtQLnJZowT9+R9fEu75n2FxERIHsOjO8OpOUw9g5u/g1XRguBXdXXBDjeM4HAELpcrotf8KFeO44yruEOKVNKlp8SvHvbdZf5YrMU5UBwN5knp7TLhguRKzws7+wFqL+MkXaAhR5UsjeXJlRWR3DD0TKs8G/v3KuzyJzLttwaGmUn9x7t+81zzy/lUwXLlWPV6GXUYOIxivHZ75BlJsvxZmLrz+U2X8bR+F6LFeRJEdFbKxu95KsgPZSuHuZArDOClB4Tk7YSzx/3v6rouZh3L9ErAE0WZ1LTQjcMvMxYejIQh4JsJi+WaQlQLRPJCvi5wdWMwEm96UKikpcZJfEEPnehpCI070ysO/VfKRTdpp2E1aoKH+6VaDrCNaDTNw1Nfk6tj7upZLWP/5ocRJdl2SdMQj//3tSFG9p74Y6LF+F6gDaPCbH1xwzq+IJpCVy+2GJ4xuvhRQ1xLqAuZ7eRZIR/i+k2Xp2jPj2VOzQkIyCOShvs1CdTCMQv3gQS5rrmZGSU7e+b
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(396003)(136003)(366004)(39840400004)(346002)(376002)(6506007)(2616005)(6666004)(508600001)(6486002)(36916002)(53546011)(110136005)(86362001)(66946007)(66476007)(66556008)(8676002)(186003)(4326008)(8936002)(2906002)(5660300002)(26005)(38100700002)(83380400001)(36756003)(31686004)(316002)(6512007)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXI4c3E0TTF4ZG4xSzQ1MXZUWW5rbEs2RnZJVHNtbnVHczl6czZKa1ZJY3Np?=
 =?utf-8?B?c1ZEb0grOTdOaDkxVnRZNDZmOWRUN2lBeXBkaGs3cHFWWjN5eldpUWJuanMw?=
 =?utf-8?B?a0RqemJDWmllcXo3SnBCbEtRSmh6WFNGMyswbEYwQjBxeGJsUXlIeHFWOWNm?=
 =?utf-8?B?Q294RVhZYXRtVHJncWk3YU4yc0E0VC9GRytGbzBDdmdFTHk2dGdNS1k3TjJ1?=
 =?utf-8?B?Ym5UWWl1SU9vVjhDWk56Mmd6UkdUY01PWDRZbThoL3l2TVVkTjdYSkV5UVVr?=
 =?utf-8?B?V256UzB3R0ZkTUtVYlhiT3FFOFZNK1lCUlR6VmF2dDBkcEN5UEdZQnhiSktB?=
 =?utf-8?B?bDZGRGpMN3ZyWjVlODU0NWtVVXhVZHZEQnF4RlpTK1hrU2h1ekpjTFZodmdC?=
 =?utf-8?B?c3h2dndwS2wrRUk3Y3VhYXJIemRLUUcyK3hRaEFyaGZNMFFieC9qTEhhMmZQ?=
 =?utf-8?B?c2dCVHZRTW01UVdJcUszZC95WDUrQXJvVVFlOGxmMmcwYlhGSmZHVlZpdldD?=
 =?utf-8?B?djZWM2hLZDkzMmkrcXBDZmlJdjRtQjRhTUJHbjBERFlvWDU4K3VCS0tJNjNV?=
 =?utf-8?B?WlZLOWNkbjdWTkQyMzE1NFp3dHZZb3RjNjZmcERBeUxQMksxOGtvNXJoUjJI?=
 =?utf-8?B?TkpscnYxZTE1a1VPVzBoblU4cFowTVJWbGdnRnFBbUw4WHJJRDVPS1pmMm1x?=
 =?utf-8?B?WVI5MWszRHd3VDJKd3dUbXFBeGFmbUduaFhhTE1vUDkvWGNoRDRSZHpTM0sx?=
 =?utf-8?B?TGxUb0pCV0dEZDRiOGJQYVN5TU43MzdsQXkrK2FnRDY0ZjVqbURIWlUydzda?=
 =?utf-8?B?NU1kQU9wMzVGS3hoRFZ3aU9uaFNIN1lCaEFocUV3eTlYMzhtN3RNVnZSQnRC?=
 =?utf-8?B?K1FKMUEvanZWOXJxQXEzVFVEOHpVV2gxeG1QT2pVbW5CRW9MZ21FWE5YaXVC?=
 =?utf-8?B?WnNVQkZ5dWdQai9PVlpPakk2NURVTWZ3SjVhR3FGU1dGSjJKejE1U3NwM0FF?=
 =?utf-8?B?NUtUNjZkdTd3cDJNSjQwK1BaSDRHYTlhVlJNYi8wb1FmK1hHYjFkZ3dtUnlq?=
 =?utf-8?B?U2MxbzJCT21iQktXYnV3MFI0S1gyZXd2QkZMbVE3SllIVnkyZ3hGdlRDRDF0?=
 =?utf-8?B?S29xVUVCNEsyN0RKbHJZZFM1UHBTS1VQVm9XZkNoN0RpUU9QY1hPMGxVWmVn?=
 =?utf-8?B?d3UwQ3plL3BEaURCK1NOcUVRZjYxamZDeXRNN2xsUzVCNnk4d1VSTklsaVgz?=
 =?utf-8?B?RU1RcGZraDJINGlCTmNhOVkwWFJzd2VwQXFiMmhsL1huUk44dFZMVnhRQTJi?=
 =?utf-8?B?MHo2Uys5dXJoTlN2WVoxb2wzRHp0TDgvZVNaWTVzZ2NHWkV0QU9TTUVVaDYx?=
 =?utf-8?B?UWhPdURQcjJ0VnVOaG9GZXBnK05Bc3NHdWN5SEtoZStwR1ZzeVQrZ3BRbU1P?=
 =?utf-8?B?OUhYdjNyeEE4akQvbk5IdS9aYkh4eGVMTkk0YUVFRWxOTHcvd3ZFVUxrVUk3?=
 =?utf-8?B?aytrekdWTHVUR3VCUHFMOHZvc2RLV0haNjI5NzlzK1lKdURjQ0E4T0lUMXNa?=
 =?utf-8?B?bmVyNFRjTFluOEl3V3dyL2pOeUFUYkROMU1uclFkWDVXOER4R0ptejAyaGh5?=
 =?utf-8?B?Mjkxb29SL1RZV2hvYnRKSzMxcjNXU3YwMEhvKytsc3BROEVJSGNNWHdPbXZH?=
 =?utf-8?B?QjQzTGJST1UwWjhpT3dlL0VEKzduM2E2dDFBUnZJMllybWl2V3k5anI3Q2oz?=
 =?utf-8?B?WVp4S0RlallKcUUyTTZsNDE0RFFSWEQ1OXgxQUNRWktmRkZkVENiVlVaRDFl?=
 =?utf-8?B?K2hnR01OZXlmMGUvaWh6VmFXMDNyZmQ5OExRQU5tZzJDL2phL2lHKzFsSUx3?=
 =?utf-8?B?TW82OFRpdFhHeGQwRWQrUGU5WDM3dXFBREdvOEdjdmpGd1pLQ1RseFNKRDZo?=
 =?utf-8?B?SndSeE9OTU1mT3dBWEtFTlpXTGZZN1lzaklvZ2pnYWdNMXNYUW5DS0dyRkdu?=
 =?utf-8?B?T0FZaXV1QTZWbjZsT1RpclQ0MWhPRHFCWnFEVzBlQzFUNnlZd05lK1craFE5?=
 =?utf-8?B?UndsalM3OWFIcm9LRlBJQzNQZm0zdUR5QlNWUEVBWm00TWtGUW93ay9tS1o4?=
 =?utf-8?Q?Gy08=3D?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: abf9f1f5-3f9e-499f-cfe5-08d9fb04db07
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 21:54:12.4673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gRt3pAeC2S6W020GCVUKfq+RMA+C+DAIJFvL9wO22YqYdhZmSbLbtM6FjYnVWCU2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR02MB4282
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2022-02-01 01:18, Zev Weiss wrote:
> Hello,
> 
> This series adds support for a new pca9541 device-tree property
> ("release-delay-us"), which delays releasing ownership of the bus
> after a transaction for a configurable duration, anticipating that
> another transaction may follow shortly.  By avoiding a
> release/reacquisition between transactions, this can provide a
> substantial performance improvement for back-to-back operations -- on
> a Delta AHE-50DC (ASPEED AST1250) system running OpenBMC with dozens
> of LM25066 PMICs on PCA9541-arbitrated busses, a setting of 10000 (10
> ms) reduces the median latency the psusensor daemon's hwmon sysfs file
> reads from 2.28 ms to 0.99 ms (a 57% improvement).

Hi!

Sorry for the late reply. It seems I'm forever swamped...

There is a risk with this scheme. If you have two (or more) of these
chips on the same bus, and there are clients behind these two chips
that have the same address, accesses to one of the clients might
"leak through" the other arb to an unexpected client when its arb
is in it's release-delay state.

In other words, it is no coincidence that the segment lock is held
over the whole acquire-access-release cycle.

Sure, you can always say "don't add a release-delay when ...", but I
see no such documentation.

I have no access to this HW either.

Cheers,
Peter
