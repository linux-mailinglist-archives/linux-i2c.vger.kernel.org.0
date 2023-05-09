Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 962896FBF0A
	for <lists+linux-i2c@lfdr.de>; Tue,  9 May 2023 08:10:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234364AbjEIGKS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 May 2023 02:10:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233401AbjEIGKR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 May 2023 02:10:17 -0400
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2122.outbound.protection.outlook.com [40.107.247.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B97083E5
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 23:10:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xdt6Hb347L/kqKTRuEitlSOvL3zVnWbBxy/Fn/E0/AkAO4Q/m+nv4/Qt3Ayz+zVcvO0VwWGk7eJR33SYc7Its78TGS9kGByOIyrNLoOAYUi/0RCNU52U3U8V8xxv5c9MVtIkUQ7q17l77VHvJ+2BlF5qOYVQiPvSGV57vLXjAd/pcNHXQtUmrr1yUStY+qgCl4/RgQqEmW9S2XiZhIIaQE1yP3LnbcNJemYcYoCdEh4M2yr5EkXeerBJGveJJ6oKvxNa+8byWjFFOwCbu/hazUCoYn7wU6Qv9hlv3q7x+rRxsuYvaPtMUNI+bJWto7MuQBIQuFe924ORM3Q+CcC/zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YqknQwbXS4OBOv/HtNaYZe5AWgMLWsNlJKiWkjJE770=;
 b=cCKQicU3R33PTX7FnLBWrg+ND/xn9eZsh/wmvggArdMz21OuOySEogunvaWU4b3Vh4jhqFZiSeCCklyJcLckJGIu01gcvwLMXoQehfKkCO5bTFzhCDw7oVWtuC9oFmPJWYzRra1WsfqPt2LnitLd5UHqPIPcKdMhkUaLbELkbYTrodaAlvlHI0WINKViF0z9HN2QZGc366GK+DBwm/mFwKA2fdO06b8Pima1nVNstp+kHoicD8ehKQ33GYgT87n2KBAz9ORV1YFnlwfJC07WYXMBwF7FhdzsNOkS7imZSOLCx5rq2ZGJj4Kac5zDEz+R1yb/1SvVXRcpJfUiWEGjHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YqknQwbXS4OBOv/HtNaYZe5AWgMLWsNlJKiWkjJE770=;
 b=Th3tEK3te/ZzCeGh2EMxPBIAbbMP8R+XiU9l0gA9CZWKbtBv7oCqBdiOcZJMGuMcxvmRPlc5TEURjRji/MZK/B6e9BD3yIlAOL79udf5Np0eH2M2WKvPLlKczcFwLuw9O2o6p0vnQK4oSQUYlYchHumAtYdqSxxAQyOI6gE+i1w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by AS8PR02MB6936.eurprd02.prod.outlook.com (2603:10a6:20b:2e6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 06:10:13 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::3d67:4b0:82d5:1daa]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::3d67:4b0:82d5:1daa%5]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 06:10:13 +0000
Message-ID: <7b8ecba0-158d-0749-db7c-0bcf26d984f9@axentia.se>
Date:   Tue, 9 May 2023 08:10:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 84/89] i2c: mux: demux-pinctrl: Convert to platform remove
 callback returning void
Content-Language: sv-SE
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
 <20230508205306.1474415-85-u.kleine-koenig@pengutronix.de>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20230508205306.1474415-85-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: GVYP280CA0041.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:f9::25) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|AS8PR02MB6936:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dc219db-a142-4870-332e-08db50540d72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G02X6L2Twix0+kulAogJFxxiOkq+/60mvDEz7QgakLZ/GRVbo2A+8iOYTMObq3K0WBhyf1uz7my3nowj499SeFkho2SvxT8lYc5ocr2CfEHdoXREEcTAAQ5f3xz6q14kVEGo4lDq3mVJDFxHJDTsCBQNJsMq+pixMY/OkP3KHLt2s+m7P/DzUFcDGQfMerGwH322xOpx8VSB0nWEzDjGD5oSZIlfTCdf7TfEQfm/gEazIaYFM6vyIi+z1IKg5TCNPsKGkY+ti9j9lQ1cXsEAN/cMn8NXPpQekqA4NBcfhnerei15j3KUDfHWdzzBq2AXo88+nfOahWTBAKqWsjwpZCeEHFzW6WwqzH7wzfP/A06UqskxQxEZqJzCjJMvQjoPymHF7k6ows/SLMbHclQeDETnzSKXwlBG5+HPDjMulNiK/WPTByJhousW4LhMqWz2aPbk/04eVM7nbLtEnQmpYTOXwXoiXtc7MCIKvH77dKEbonoaJUL0BZMFkEyOW95Qzt5xYsFx8xldNXY64PoX60PofhBZDEyhrvM/MuJh/ilVMdqKXTp/H76QWWbddCOEsAzZMToL7DnONcGlWGKWAJRMJPUuHQON/KnybCa3Pde8W7M2EGLqpJyfAnrxmoR6MuDuirXnIqwsm75rIuzsZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39840400004)(376002)(366004)(346002)(396003)(136003)(451199021)(6506007)(26005)(6512007)(186003)(4744005)(2906002)(38100700002)(2616005)(36756003)(31686004)(31696002)(6486002)(8936002)(8676002)(4326008)(478600001)(66476007)(41300700001)(66556008)(66946007)(316002)(5660300002)(86362001)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEJZakpwQmYxeUpYN3RIL0dCVHd2d1RNQ2NjaWVWd09SZStPOWNibXVrcHN6?=
 =?utf-8?B?L0NVMnpGUVdxeG1VcXRXQ1dSdEdoRjhRbXdTbU1pRi9tdzlYckd4bzNEeTRV?=
 =?utf-8?B?enhIWXBGNEsrQ2dORGtleWFhS3pPSzQ5cU1aZmJXWFZHWEJCNXZEVVBFZmJa?=
 =?utf-8?B?a2xRazFzRFpqM1RUUnpJMlk5TkN3Q3hkZlBHTWNHR2ZlenRNeTgxcnFPWjRW?=
 =?utf-8?B?N3RhcVFIendvQmFrQ2tHR2dsZzRWKzNBdjVGOEFDNURCYkpkdTU2TEZlMEhP?=
 =?utf-8?B?dzU4aERWR2o4V0Z5RFFmb2RDdlFxKzFoSktHOTZHNVY0WVRLY2FpZGFTQTBY?=
 =?utf-8?B?RmR6N1FNdXBEeVNZQklPR3NweFA4Z0xNUmJyWW1lWkMxb21qaUZXVGxBempD?=
 =?utf-8?B?TUdzbU9ZdDhrbVJqOElpU3B3RWxnUThLdUxnN2FIOHBDNnZoSDJFdm9YaDg4?=
 =?utf-8?B?ZFZ1UjIvc3ZWajBYSHBVei9zWUh6L1BoTGpDZGsvMUlHNHJ0eklHYmVzS3Ni?=
 =?utf-8?B?TmdwWGxJMFA0MUhteWRQWUJHRTBXdU1mRll0ZnQ5aFZSUVRlOXE2RCsyeE5l?=
 =?utf-8?B?Ny92NlZhWXFSa29FaVljZys3R0JOQ1M2QU1qS0twMmwxTnRmOGNIQVk2OWI2?=
 =?utf-8?B?OHNCeEEySU5uZWJRN1pFbkVkYkJFa3pqeHQ0cXRuQVZQRjFPcDMvVENSc1Mr?=
 =?utf-8?B?aDlocTN0MFBFUnRhV1ViZFNzKzdxY0RxSUJDcEtGcGIrcy81TzNOclNwYVgz?=
 =?utf-8?B?VFFMbHJtdkw3dHltenVSOEdCU1llMFpTMXdOeUR0VGhZYkRvZDU2TTdwZjd1?=
 =?utf-8?B?N2cwVVhFQk96NE5VdVNza1g4K2RDYXJva2laWlJoNDg2V0t5ajRZTkR0d1p6?=
 =?utf-8?B?eUdoYVdOSE4zVERIK3pQd0N0bFR5b0FTRzZJNVJsV2tqb2wyS0dzdzNYcDE0?=
 =?utf-8?B?OFExc1J0KzcxdnFCc2w3ejcydHE2VzUvTy9TMmlDeFZIdlJSSThlNG1nVWhs?=
 =?utf-8?B?ZnQrY0RGQS9Fb091Z29GMitjWlBaZ2hKMWVWRDlYRWlRWVZiTDE2TFJMeVRX?=
 =?utf-8?B?TkJDVG5GZ3ZjbGVGdnFXQVFNWE1wZzF2S2padklDYTlzdEhLUFJqQ3JwMk9Q?=
 =?utf-8?B?c3h0RXdxaE9jVGRjUnYwNnFZQzlmdlBCN2VFSjAzcDRtTkUvUk1QbXEzakpz?=
 =?utf-8?B?MXplV0tmSHQ4aWJSZy9TS1RxR2x3Tlo0TlNXWTY0NHVqR0hHcGJXbVNXaEpn?=
 =?utf-8?B?eTd6ckk5VmJRYmdVVW1QQ04yOTQxeHYvMW45UWJrblRiSU92L0dJOWNnOW1R?=
 =?utf-8?B?Wm1hT3EvNVpJSStyYTlJWGRzWkNTREZURGNhSk1BaDBiNEF5SDFsam4rUktr?=
 =?utf-8?B?KzUrLzVqK3VnZjFCVzhaRkhXcEg4SGVlVjZ0WFlXb2FaS1lKeVJZMm5kQUp5?=
 =?utf-8?B?bndoRHRLbFl0OHAzeWNLcWdxWU14dFd1UW1LNVp1YVFPSG4zYW01dUlWaEpE?=
 =?utf-8?B?NzZ4RmVnMDJHZ0tJelFxK2pSbXU4SS9ZcGFQbnJZMHFrV3FSZVVJU3o3R1g1?=
 =?utf-8?B?emtUcXZWR0NOS0lEbXhRS0Fxait6YlVyK3kxMEhzckYwSmpENW9MWlpQMi9k?=
 =?utf-8?B?ZDlGVmpXOFJXU1ZoMU9RZThOT3M4NDEra3J6TjlxdGZaQ0FTR1BpYUJiOW45?=
 =?utf-8?B?NmVOMEF6RnZvcXV2aHlSSWU4NjBuWGJyRFkvaGlCdzlLUFhMZjIwRUpGWnNB?=
 =?utf-8?B?TEZrUHgveXo5YkhoKzlKa1Uxb2Z1Qk4xekdxMDVEL2d5Qjl4eHRSdlU2WnFq?=
 =?utf-8?B?YWF2VTFHcXVoOWZnT2F2NTRha2RISWdRdTNTc1RWY1VRN2drMXJCZFpHSHJa?=
 =?utf-8?B?d1NOV2hYWXk1ekJORld6L3lFTGpDL0l5TFliWkNER0VyUG1rVnM0cGY0Ui9z?=
 =?utf-8?B?UzJUd3NNZ1pVV25yakw0cTBFSEo1S25GZjJLMThqdVZqa0FkZUpPR2F4MHYz?=
 =?utf-8?B?cFFTMkpiRjh5Y1JyRTRpWG4yU29aaFdTNDhoMmRVeXZuYzFlRHVmbUZYaUlh?=
 =?utf-8?B?SWFJZDhQU2VHb2FRVGwyRVN6cU9GU21uL0dZdjVzcVg3N2Z4akhWSGQxK1U4?=
 =?utf-8?Q?1FNbgdd18yEtlCe3zRJvBJ4La?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dc219db-a142-4870-332e-08db50540d72
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 06:10:13.7766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Zx3xtWI2GGY0fU6zxBNsGnYeTh8xuz08kXzzLdKB7K36KtMiLqnJ1MgmkDEt06s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB6936
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

