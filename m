Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33A366FBF0C
	for <lists+linux-i2c@lfdr.de>; Tue,  9 May 2023 08:10:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234413AbjEIGK6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 May 2023 02:10:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233401AbjEIGK5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 May 2023 02:10:57 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2101.outbound.protection.outlook.com [40.107.8.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E5E19EE1
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 23:10:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lzyUikXh/nsu/dWuTiZ16CQ+vDh45tH0p6NbXDKqzH+ScQb3xWPB6nHEc61sUxd/T3on8eisiiCcamcgVzGy8JjA8BhPcpmVkzfy0O5FR2rDbUjBHsLl+zGdP3YkDnHw5LDqXGTam5Pt6cgk/iU+TWd9alwGuMUfml4xo+CcJXVaT52AO7SWrjh664xCzvneXr5ngXuag3/7cI6P1ZKUv/hfG/2jSfb+vG00xv5layx88SE68Ry3E4rSMVHoTqxh95aFUZ/Tm0U3J30tHHCwRyo68sDFx8GlQNcQhJhRPJmd6X8DKl3F2gy7lj6oIjkTbMOMZ4Sg4REwdygkstE/9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YqknQwbXS4OBOv/HtNaYZe5AWgMLWsNlJKiWkjJE770=;
 b=PiITBQycuAI8wrBS7QiPz9Qr1O9N/BI1194KvJv0BI03oBjS0Y0/7qU2HiKY05GF1ewd4kKeqm3Fzc/jZhLcKio9vdED25EsCpb/Z6oitQc9u56HZrHI7yonHIIxw8Oqo7K2jotG7eZs9LCPDiQAVK7BBS/twr+lr0Pr4yFR3Y10Jt5xcQJAvy0QKzDAaBC4a0O3cdTeB+s9cmaFPOPXm6moXE5BaQ2Wt8suYkZA6qsfvZZBp9PLMFKBdVG9dIFFIlPIde5g6DeGnAQovNsfewSUjQWZiKFo4KkGceZzq00FjP0q/v9kXsKV1x1YRyaWJzkQnCHrvVjbD65qqJDwGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YqknQwbXS4OBOv/HtNaYZe5AWgMLWsNlJKiWkjJE770=;
 b=b0lOaKtOButukg6yyaYMxGCa/iB9TxT4SchFkrKvwZJ8U1AWiEyaoMGGaShF/UF8wXtwTJ5ITU561ZshqXJzqcufu0kVxxGE4BJi9Dmtj0qr50vZoKs9q843EVIqNEjvH1e6U0e5YnATtkQ7JJYhu50cY926Pc9tXYYhjocyFlk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by VI1PR02MB6031.eurprd02.prod.outlook.com (2603:10a6:800:179::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 06:10:54 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::3d67:4b0:82d5:1daa]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::3d67:4b0:82d5:1daa%5]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 06:10:54 +0000
Message-ID: <7dbf2e2a-a64d-5db3-b28e-df9d40672644@axentia.se>
Date:   Tue, 9 May 2023 08:10:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 86/89] i2c: mux: gpmux: Convert to platform remove
 callback returning void
Content-Language: sv-SE
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
 <20230508205306.1474415-87-u.kleine-koenig@pengutronix.de>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20230508205306.1474415-87-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MM0P280CA0084.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::17) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|VI1PR02MB6031:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d2959cc-07ea-4102-9ada-08db50542563
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HXSCFWkZ9oGayz1Nko9no7aFj4DhLSPpxp4llUxKqFiiOyogFUJLAl+bad9TpgIxO4tEdS+9MzAveUKQv2Qn7bQWE8B1thfxN9caqCLG8Jv2gDbrkrPZLFNN+kwV4Zx6X4hqfRgc3+rEjxBkytaJWXwAvs9Ayy0PDXzWn0/edly3KnGI0Jeq//RxJalnIlSMVTLjf3JZoKRs9MNE8Np29b6fk5cMtgzfEKTXQK7T7b5ACRVfSLF0O1P0v5xJrWMqrJXMStCHBMTq+CTqTKPZlOU2ESKte96AbXh8g68MCmAjyLKep84mD82PAmTzHrnpq5Wu5QJGIswtqas51vl4/MFWs+hdaoLMDN4FrR7BzmapFp0Xq1+IWGsUpMAUxcYmwV+v6apn07uf3CSG0yoPSnncFJ2KYXj5CuFFzxFHKdazxEi34X6UJGv3WKawOvWJaD4lETjQ7MqTaFD/f8EypjqELkUwQ/eQARWluF/eJ8Xqa662X1+68Hln2U4zSn/nataZhSl5DX4UT9Ob1300DtiynVyPClYhqUrukNPz3YoM8dGKBZ6F4YFztMHZUfip00pOzXjfpnt+HWWn23r+fcjlQiWo7/qUhsbzntYZPIaiV8BRWCNBs5uUThSGrfaI/DUuL9eOkKt5hJyq5uCaqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39830400003)(346002)(396003)(136003)(376002)(451199021)(31686004)(36756003)(41300700001)(4744005)(2906002)(31696002)(86362001)(38100700002)(8676002)(8936002)(6486002)(5660300002)(66476007)(66556008)(4326008)(66946007)(478600001)(316002)(110136005)(186003)(26005)(6506007)(6512007)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Njg0WUUrWmM4RDVVUTk1cDhMY2d6R3FxL3VsTW5Qa3JrTTdROG85Z08rVFdi?=
 =?utf-8?B?YkgrU2VpaWZaLyt6KzBTZkNETTJ6cWlTcWphZnY3M2x6MnlSQ3lISjl4V29x?=
 =?utf-8?B?aGVBSTRqeWdCU3hnbU1oTFVNZmhIb3UxV2MwS0RFbkFRYnBWUnBtcUViRWFG?=
 =?utf-8?B?NnZsTnpMM0d4M1JONDJTSUpkbGlBRU45aU5UV1RJajEwbjYrTDd1cU9tbnY0?=
 =?utf-8?B?b2R5T3VFeHpVQWlmMXNtQWI0dGI5a2U1RUl4V1RQRER1MTVLOFpmTkF4UVh0?=
 =?utf-8?B?eVRacEhjQzR5WHRXb0tVMzFiNjA4M3pLRnYydmRxRXdoalczREdzWk1mUkZy?=
 =?utf-8?B?NnkrdjN6OFdsSUUvM0pSMmJnMkRFRmkzTVcvei94bzdWZmgyb3FjUVo5OFZ2?=
 =?utf-8?B?MFJPNk8wVGJnbkYwMXdDYStLVDNzRmpKblAvV1BlY2ljdmRzcHZZblBVd0M2?=
 =?utf-8?B?dFhXWmxhaFpnNEd0dDdCNUhtOHZ5aGlueDVqYy9oYS90d2l0N0E4K3d3SUll?=
 =?utf-8?B?VFg0c2JhSlhBRS8xWWg4REZlS2V0TVZkTXNaVUN6cVNCNUkxZG5NYmx5NENV?=
 =?utf-8?B?L1plcjhxcDV6R0FPQ3krVmxwV2dSZTM2QWxvb3VNeTIxYlV3NEt0M0prR3dz?=
 =?utf-8?B?a0VNVDBlSXlpa2R0dUVEODhVcWYxU0VhMkJwK29HV045MktOSmt6RGpKdCtM?=
 =?utf-8?B?eDFXVkNRMDdiWGJwM1l0blZvYzZESllmVGFXRUFpbSthallrU25uY1NtUkd1?=
 =?utf-8?B?cnpCWitKZ1dTek84VmJ3ekMvQjdSSXVQVEpSVXNZRGdvbTZiMklaZXVlU1RE?=
 =?utf-8?B?T0lTRVFkRXpNdTJuendMV3labVduLzczMjNmUFluSFNhTjAvSUVDaWRjM2pN?=
 =?utf-8?B?SFVyMDBwcS9yaHZ1bDN4YjBMR09LREd0dFFDekEycVM5OS81ZGJidkFDSzN4?=
 =?utf-8?B?Yk1wU0VzLzkyTXJGR2R0TEd1a3M2Mis2SkZDaWNXczg2enJyYkk5TDVyc1BK?=
 =?utf-8?B?Y0ttK2l0L25nNDJYK0VOTUpXdGNDV2VzQ0ZsSWNXTDJyQmdYakgxamw2NFE2?=
 =?utf-8?B?TWZqQmR4Zkx2YThUUTdXR2hFanMyWGo4NFF5OUZMdElnaURQTjBlcFJIUDA4?=
 =?utf-8?B?REZXb1U3aGw0L1ArbkZjemlqd1VBalVVSzhIcVNzbnZhSStQWFlFamorZHN0?=
 =?utf-8?B?S2F4TzRLS0I2ZUlaVmZCLzMraGlSWDBROHljRkFwMDM2VTZiLzBhU0prQmtJ?=
 =?utf-8?B?dWtpQzBNaCs3V1ZmcnVheEQ4UXhTZXB0M0RlRnpIZmJzSHJQeTA1UDBQcEFv?=
 =?utf-8?B?THFvYVVvVks0bVZBaDI2SGdtaHFCa0ZSQWYwbjFtMFpnZzZGREtiSlZNNDRM?=
 =?utf-8?B?Z3ZyRllLN2F1K3QrWFJIWUM5WHZNMFE2QXNRYUExOTI1bTFuQlR0QTE2eXZN?=
 =?utf-8?B?TWpuTWJqb2JBZTR1NFp3UXZ5cEQ4TVdHRXdwVTZlY3ZsdHVTclBUZnFOb1Qw?=
 =?utf-8?B?ZitMd0xuN3BtbTVUNnBnVUFoa1ZZVjZYaVdCRktLeXRzNndnZmc1eTZ6SWow?=
 =?utf-8?B?UGpmV29rb2V2YVR5d3lxWWpvMzZOc2I5UlRKeGhJOGZjcHhjNnlPQkJkaEk4?=
 =?utf-8?B?aEI2ZjVndStJV09UVGZxZ0JVM1BrY1JvSWJ4MFkvUWl5SGRnYXZPWnJpQmFB?=
 =?utf-8?B?akppcWE2d0NNU1hyVXZya05FM3VESlhMODluUjI1VkI2Q0xXU0JCK2xTdjlj?=
 =?utf-8?B?ZlgvamUrWHRERUJQVE9MUTZQUHZCNzNrd2V6NzdsZU9FaUFvd2d1NENkNTNV?=
 =?utf-8?B?TzE3TlNJLzFYQ1YvUmVDZVA3Y0NYcXIraDZKYkJMdE1iMzRkSVhBQllVYWRq?=
 =?utf-8?B?bFgwMDJlYXdrakFYaGhoMDlTZXArQXN2L1EvNXpIV2tVQjUzZFdLRW94eDRD?=
 =?utf-8?B?dE1UT0RLUjlxNEhKdE1YUGJ1aGpkeEpxR0E1MU5kRjhHSlVMTmNQcUZpMmVL?=
 =?utf-8?B?ZHBwaW95N0JVYUsrdVhpa20zUUs4WXhFSU45cnVOM1k3dUo0QW5UTkUraHo4?=
 =?utf-8?B?bFhEM3BHTGdzaWdXZXBBTFkyNHR4VjJMRml2ZEo4MDVPbjhGckMxbjZKR0lq?=
 =?utf-8?Q?azcL8CulawsdjShmu6eMUSJOV?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d2959cc-07ea-4102-9ada-08db50542563
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 06:10:53.9660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 56yGdEaFV0eGHiGQlKr9/odMfMaq4eYqDx0niu7iNj4gpWRQVLtiqVaS/Bsrl0rK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB6031
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

2023-05-08 at 22:53, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Acked-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter

