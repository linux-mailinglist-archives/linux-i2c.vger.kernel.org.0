Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77F3F77FBF1
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Aug 2023 18:22:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353624AbjHQQWZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Aug 2023 12:22:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353626AbjHQQWB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Aug 2023 12:22:01 -0400
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2092.outbound.protection.outlook.com [40.107.249.92])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5461B173F;
        Thu, 17 Aug 2023 09:21:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S44M9Asi3oJ/wbg/lAnUD2taItWuV2aIHsdBhI3QMUXohjqxRrvrb9s0PzG8BvAY9hk45jzfRX0Aemwo6F3jSPPIiDoe1qaonvu4AP+gsZnqpgPhldkupISFqqKEWRzMSZmCFGuuee41/T22iqZ2qNok06X134cKdNrGZJ1UR5zE36pIdRljJxYMIL4pLoMQhBsj5wc9CrzuyBGQYn/9GkA0rpM5LbzX/onxCM44nII1WJy+90r6qeBE9BBZXJcmxEDsM7r1DzhK9FP7msw/0QT0c/x+jpQQRg8Q98EQ0RAoxB/rvq2qKkWtdIWcnTcfcKKtB1MxqAlMBBU8wXaMvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3l5QnojYHyNhA/hv6Gl/7pYx8YkLOGALlAtjDVqctHo=;
 b=nEslf1syRHGo5BOClzwIP/j5xYecJ1SZFtL4wecGX1vss3C+BpHp7/pYjobLL152WgvJFlyReN/ZqU5O4qRLejGLVQrh0U9GyscTeal1FKl4tayvOlFd13hNQyAfGYfY3QDKJcQ5CH8KKIXnx6B1vxQDeXKQUsDGcr1hyPspTcT/hkmDKU1LpQGTVa7Zj3+6rSmtneZ1s4D7gc0x1IEPnMZHkOw9ZaiZm3DFDh+jABEgH/enemkrEbLe66zjtQ3zAsmjeIeH3Xl9tI6trQuiamBBa8HcipOA6l6grwTMhxat4FOalH43WgCVXAJUVXSLbxCixkiKmZ4yYcqS0J+yJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3l5QnojYHyNhA/hv6Gl/7pYx8YkLOGALlAtjDVqctHo=;
 b=To1ApM7Nh6XBdEdecc2uBGFFuQ8Jcy1XQuqcMRPEpUdApGVTSrP8Md/ozq35qlD4whDzoBI9en6SGsPxkh6CMU1N2TxCr9XErW/ia3ps0lyLsLUHFGKNYqQ0SbN+yQ9DpSDgkC6bcWne+XEBWNLaQ6ozScQlZuLmImPfMlyP7jc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by AS8PR02MB7318.eurprd02.prod.outlook.com (2603:10a6:20b:3b2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.14; Thu, 17 Aug
 2023 16:21:56 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::7b40:7a7d:595e:623c]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::7b40:7a7d:595e:623c%4]) with mapi id 15.20.6699.013; Thu, 17 Aug 2023
 16:21:56 +0000
Message-ID: <a2418f66-5def-2ec0-ef48-2e8615a499d0@axentia.se>
Date:   Thu, 17 Aug 2023 18:21:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v15 1/4] dt-bindings: i2c: pca954x: Correct interrupt
 support
Content-Language: sv-SE
To:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     naresh.solanki@9elements.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230817071056.2125679-1-patrick.rudolph@9elements.com>
 <20230817071056.2125679-2-patrick.rudolph@9elements.com>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20230817071056.2125679-2-patrick.rudolph@9elements.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV2PEPF000000F0.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:1:0:f) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|AS8PR02MB7318:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c48235c-48e2-4562-cfe1-08db9f3e135a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ozRtabQyC0U3OxDEwJHsASVcgwQOMOUd6niDW4p39di9nOoU8BkZvRLW0kJBu7Y34493IHwyE0vh8x/WrusYWmN6xCKwlOU8SrA7Lyv64wfQyXAN6SkUGrZmY8QXVJ/jP6f6NQoZ35E6ZVleZ2VMC7d/oPtlDfkUPwgd3NDvnRDdzGFLW3EO8zEkrHUTLcSsf8E75tZUP0KNz6B6iFAyYKclSse4tB5c8CO4mpr52ykufYWaHCSdBKF3ywNiGnMre4lrcKtHAHtO3LLk5zjB88gsYlCzh+tRm+soIidZrn/ti0zdooUlM6fZ3BnxrYykCOCrAv//eUPCvTgKRNeEib+MvInASYJ5ckd8iRyAnDksULVT3JopN0tTnWzqE1VO3MbxfY1Tdfzj70onUds11i3MS75wxCGOotHriKE6YwXIzZXLcEzFjyI3L44FiCxJ0+UR35WwKMeJ4pV1bEVBhtOlpAVRTsvp8g2OTeFnlR73Wy88RLKlZEKLXacbSxWfi5PMZAddayoySfwTFQSUeyk1y6+j7PfE1SVFX7n3heiVbyaN31tucNt0hpwGLqSmm06YnWtAxkEas2LcNqZInqDNl6oTox28yKmlGRw+4mgpcj7BmEv8pZMwov7c71WJytzVptOQlHMRSzGnSDc4zQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(39840400004)(366004)(346002)(451199024)(186009)(1800799009)(2906002)(66946007)(110136005)(66556008)(66476007)(5660300002)(8936002)(478600001)(6506007)(6486002)(4326008)(316002)(54906003)(36756003)(4744005)(8676002)(2616005)(38100700002)(26005)(6512007)(31696002)(31686004)(86362001)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDBlQnEvNlArMmFlZUZLelI1WEo2N2Y0ZnMwQ0h4SThBZDZVNU5GQkNGcFNH?=
 =?utf-8?B?bUcwWWZSUGtXNTdpQkZjRnZVS2VoNG9sdWRjVVNiOEV5VnF5UklOK0lVeGtl?=
 =?utf-8?B?cFVSWHlEL0FOcTc5Q0VsTjFjdHZSS3BuWlgwUFZ0ZE9Ea3A4TkR0cDd5Y0FP?=
 =?utf-8?B?SkhFR0RtdHA1WXp5dDlmczFqbVBtcjh1S3JrM0Q3d20wYkNER0pOaDdhd2c1?=
 =?utf-8?B?S1k0SDhVLzNGZkNSN0NpZkh1dzNUV056V3lzL29WVmpyZGIxTmdYSVZoc2pT?=
 =?utf-8?B?SksvM0hNYVJqbWJDK3lMT3hlUWxYemhFZTRSMUNsNkNvQTFtUmhqdnl4OVNn?=
 =?utf-8?B?SjBMT1B6NG50cElUUjBCSUxlVDRwOVlLbnJYY0hWUldJUm5nTHBnRE5VZ2d1?=
 =?utf-8?B?OXh6RE0waVlzelk2Q0xrVzE5Y21BaSsvN1lab1FMQ3Q1ZzgwZkFmeTlyL29L?=
 =?utf-8?B?OS9Wbm0ra3U0NHV1Z1NoNjdzT1RyMFRPSVg0Unh6N0JsOE1icThRUEk1Nldw?=
 =?utf-8?B?Q1RFekRyWnhRVkdFTG9DMk5PTjl4RHJISDN0UlFiK0FoVkdjK1Y3N1ZkZkFE?=
 =?utf-8?B?TU02NHYxd1lHeFpFRmZudTJVR0lIRVNTejRnUWFmSnNJdnp5M3RhWEswdkl0?=
 =?utf-8?B?U1REZHVva3V4bHFEYk5Ic3dYYVlpZ2V0OWh1a1E1eWlzOWNJZks5dmtjdmx0?=
 =?utf-8?B?cDdDK056MEZKcUU2bHJqSEkySXRQR21SbHhGNEdPUzRaTUl2OW5RSUxNUFE2?=
 =?utf-8?B?d0hBR3luVUhVYUVGckhCd0g3MmpwZDdWTmFUTXRUUk1ML3hXelhYdm1SaS9v?=
 =?utf-8?B?MVdkMldmNmdyNGJJd3Q5TDJLK1gxNHpQT3NMOTExR3NiSnk5YW5wcHF6dHFP?=
 =?utf-8?B?cXRrQ2o4Ri9USUVDSWczRGg2aWl2YzZFRFN5b2NhSldHS25BVEVaRXJhb1lX?=
 =?utf-8?B?VmhjTXpWV0ZGRmVtSS93R0ZHU1o0aUl6c2N6VWlETFlFR1ozV1hObVhWMllN?=
 =?utf-8?B?K2t2d3JxOTZqSm9UM1lpTmw3NENRalZLRnFpVmZtejM1eTQ5djZtemNKZlpW?=
 =?utf-8?B?bHhNU0lBd3dmSjJ5Y2ZDbFFqVEdHVW56aVA4d3lnSWlIVGo1L2I4YWxYbWlu?=
 =?utf-8?B?YWpZVlNmL25rODRXZ3ZqOGtuRXJPSFJRQXBoSG5pUkxXUlcvNlQ5ejI4Zngv?=
 =?utf-8?B?R3R2QUJIYVllbGF6VFF4NURYQ1g1NGh4MUVMcUxzRVJyTHdzZEpCMDc0alVH?=
 =?utf-8?B?Z2R3Wm92NkR5MjJsZzJOZ3Q5ekhnbnJibDgrbUZzR1RiYkREVHBaNy9yWkVt?=
 =?utf-8?B?QlZzRzJuZENKcG1ZTTFaS04zam5WSDRJb1JtL3dyM3ZubTlHN0FkSDF1OVJw?=
 =?utf-8?B?RFR1VWZTUzIwSTcvTmRzeXVsYkJsWWhkODUwVytuUzA2R1JEL3pvVDZqMXEw?=
 =?utf-8?B?RHlRM1ZYdVVSZGo1UTlLZWFDaWJnNktkQkNtWVVmV0xXd2Q0eGpGb21RS1JO?=
 =?utf-8?B?UXVERG53S0M0QjMwaVB5TEcwZEhiY2lnMTNWcXNqVER5czJZRjZJN3lCeGdR?=
 =?utf-8?B?b2M4RUdFWDdwREl6R2srWEFjaFY2aWYzdkRVdmtZdWY3WmRFd1NHNTdmem1E?=
 =?utf-8?B?bDVQVjFTUHh2UVEwQWZvcFZJQ3BmRDZ0bTgrcCtMREc0LzBHaVBkQ3RzTGh0?=
 =?utf-8?B?MEJxb2FDNFRsZWxTWGlReWptbVdkam1TVzBYZThTeGtaMXh6NVE3dUY5cHFx?=
 =?utf-8?B?Z3llWHIycEMwMkNEVmgwMkdESFJ5bzEyeCtESWdmSTFYbGJ4cTB1QUhuSlg0?=
 =?utf-8?B?cGlsMnhyQnhLd0NjZU9FaWo5VnZLTHZaOXJ6cEVzKzF1UU05VXFXRHJCQjhw?=
 =?utf-8?B?VTZmY0FNcE9kOUZVYTVFeE1ZTGhOeEpLNHRBR1VUNy83VFlBY1ZxR3BxZnYx?=
 =?utf-8?B?ak9mVXZIZ0d3emhVbnQ3N1Vna3k1dG5zQmVGN0VUK01ha0R5c3FSQmJmZEsz?=
 =?utf-8?B?dzV4bndFTm1CekpXSFdaYlpDQ2NNd3hvWDFwM3BCQW0rWkNyc0hybUd4NXFq?=
 =?utf-8?B?Rk5KVTkxYklrYmZPeGpYMWVoR1IvYjc5N2NLT0NZQ3VJN2FhdzBYelNjQnlW?=
 =?utf-8?Q?mu3PunONLpdhqetJxPVimFtgq?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c48235c-48e2-4562-cfe1-08db9f3e135a
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 16:21:56.5591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EUbgB8SmnOisnTQ4RBh4X/JRlhS04WwsLMSy3m1XXZT8oN5Z7BQcC/NKjjukWW5U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB7318
X-Spam-Status: No, score=-6.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

2023-08-17 at 09:10, Patrick Rudolph wrote:
> Only some of the PCA954x compatible ICs have interrupt
> capability, but the binding advertises it on all ICs.
> 
> Sync the dt-binding with the driver and only advertise it on:
>  - nxp,pca9542
>  - nxp,pca9543
>  - nxp,pca9544
>  - nxp,pca9545
> 
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter
