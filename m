Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54C71549B9A
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jun 2022 20:35:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343506AbiFMSfE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Jun 2022 14:35:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245736AbiFMSet (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Jun 2022 14:34:49 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80138.outbound.protection.outlook.com [40.107.8.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DBEBEA0;
        Mon, 13 Jun 2022 08:44:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dFECvAeyNmG+7iJ1NuL/E0u1a8ECQCHseqyee1O+Z9RZPYnUw1C+umE08c/D32sB4wj2K9WS36qQsD+AdOYflmuKpbO+k1KQx5Yg+U2PMym8lLfv+e0QhH+5VcIeXv97TJjB6fFYaW+hwZifzfVgm5QMALSATymKyixxhZjqeBAf7izpXKdXzB4Nnb1xiagOJcczcIaltphe48yqno4F7CSe97Fp0l8MV/jIE373djFCUFBnRUXOLBRYxbK6eushNkW4f3rOTSWAoTg4ll1WZAWYL5pON4JV0/y+FFuWySjcq6W2TfAHeFu2VYaNfdfjCBcHbSq4SN89JrjMqS0uiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GT6kCWQlMPODIzu7SyaYRQJqFP6y0QUtnMMflCPsrjY=;
 b=iJ3kd7uMxSJv9HCuDH3VqGdtbCwZmuCNaFBP3z1fCxeHWAP8GLlHnPNAstzCuHTRXs7VoIEgLi58bgbfSlYKbefbNmUzFYdPDm16+bfh4KK/o2XAZxxVMqAVJtVcITq/I2byulNsKk2dHsW466fB2xY0dkrphBaSx0W3IjuMV5o566hICplNGfnFavGuypUUg8g0EHezOI4JuAX/HfM9pc0tVEtaKp6uyMm09CFPNoFr15PTeVjgtdymJo+RtFwmM57G4jZP2V0SM9ZXAfGOgHgk7/kmo1kkaZ3rqlX3cOnrA97l3AADu9sGvelLVrlV9RBa/tuUtaqUt6IcwQvO+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GT6kCWQlMPODIzu7SyaYRQJqFP6y0QUtnMMflCPsrjY=;
 b=Ggom9GUz0K+5txM0+cJkFKAiUNVREQfI+rgFngRDolCONjXP4CFrJyynGzl6pSIk7nk4HlTH44AdRZ4M6Bnlj1K+nUFzPfwuAsTGAMqe1zSGzG1vN1jcMQJpg0C49SKZqZW7YdKCqxsZAzYDcuIK3UCOzWadTgr7VVdP2CvMP00=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by AM6PR02MB4582.eurprd02.prod.outlook.com (2603:10a6:20b:3d::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.16; Mon, 13 Jun
 2022 15:44:00 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::6c12:cd95:b34:7dde]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::6c12:cd95:b34:7dde%4]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 15:43:59 +0000
Message-ID: <0ce8b9d7-8a9e-cded-1762-71e230f4246c@axentia.se>
Date:   Mon, 13 Jun 2022 17:43:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: Regression: at24 eeprom writing times out on sama5d3
Content-Language: sv
To:     Wolfram Sang <wsa@kernel.org>, Codrin.Ciubotariu@microchip.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ludovic.Desroches@microchip.com, Nicolas.Ferre@microchip.com,
        alexandre.belloni@bootlin.com, robh+dt@kernel.org,
        kamel.bouhara@bootlin.com
References: <074b39c5-55fc-2bc1-072d-aef1070e284d@axentia.se>
 <2bb4868b-90ab-887e-bf13-9de8b79231bd@microchip.com>
 <YqdQoJbsgwjQ9PYh@shikoro>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <YqdQoJbsgwjQ9PYh@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0010.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::11) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 245e55b1-cc6a-4f3b-b70c-08da4d5388a5
X-MS-TrafficTypeDiagnostic: AM6PR02MB4582:EE_
X-Microsoft-Antispam-PRVS: <AM6PR02MB4582343C711BB1A323F86AF2BCAB9@AM6PR02MB4582.eurprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Knv/3JrIrGNnCb9DTUJK/gxFmglNInIeU9ut/gi4DPc98A4IQIll1NfU/NyJXICk+FGRg+N9Se18ahxE6h8u2tluhaCYljxYGaoMCRvnZS7kXSrX1N70Tng4yTf7sRGf+9Dow+xZWTpnpJ7ogsa87YDkYHBSRgraQWg63TXnIlBPQZV78TUuDAdI+eOwZydlotzaFWG5EvktTg9OHpSmLSViY+iMMaFHKPy9RUEKRBwP3eyLNDo4v4YIqAymaPvmg1uvH0r6mGJTp/cU1QDUZGxkHCtZtxLkqSLg2uJO9FXEh8/qAptZI7ZiBIootkI7Hd5HvHrYbJ145U5p8bas0SpxoXeJCqPeKW03/wglopBsktOTLUpCUhbe4jjCKuz++YYtHY1ub19cnDSHWe9wxCjkdKrruFJCAfivBhpKBRG8zK8/c0VDfjliRm1FgkQOFjmlzbaYEvWMADH53SASTUZk3XYO4ldwsvPc6Kz9aFDxlZXWU5YlPbVhlr1pjq4IEC8iUocBpytECR2f+5vRszaZA7/fZ2+rNpl9TK0PVGH4IN8DzKM0SSFVkxerzcyyOp7hYyGUK5P9vOVcayz9li3UvQU+66XREfeEg7LFZhgy/mmKvX0+DK3VaY5LKZuW5F83zpdymr+QR8LaNJO7aHVeD2sTB0epSqXBOIoGnEcDhMMRHx9mwmUZV23FvpGQI6dR5SwXS90012ekuS48NIrdArsZPMoQu4CqtR6GjmA4aPFoW2GiWwSYNTmpPJyt
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(396003)(346002)(39840400004)(366004)(186003)(2616005)(41300700001)(4744005)(508600001)(921005)(2906002)(66946007)(36756003)(38100700002)(316002)(31686004)(86362001)(8936002)(6506007)(5660300002)(7416002)(26005)(66476007)(8676002)(66556008)(6512007)(31696002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzlFRXIvR0NMOHhTZHNzVWtWQ3JZTHZmU08rOXNUNlBRYVBMN2dMSE1sMi9x?=
 =?utf-8?B?V01pQkNtQUxCSXIxOENTOW9iUm9JdEtqd1poc3FSY2wxM01RUFNwR25xUXli?=
 =?utf-8?B?SEM2ZDE4MkhWckp6UWR4K1EwOC9CS2dROXpPYUdZMEwzcEpNdis3TjNkRHph?=
 =?utf-8?B?QUhWOGpGNUJVSEU5VTFkNE9EeWlSeUVEVHRZYVN4a21JWnZOSUtLU2VEdzVo?=
 =?utf-8?B?aHBaQjZiWmw4YWtoSGhteFgrb0tzRjRFeDlvQXNIQWZjV3FrazlScW9SZ0xL?=
 =?utf-8?B?UUNaSUxubU9vT1RMa2hxc1UvbFFFR1paaS9lVzNveTc0eEZGZm82ejZVRXpp?=
 =?utf-8?B?UWlPT0NtN3Brd0xFbkZONE1rbVp6a1piMjlxNzA3YW1WcjlFYzJOdHFjVVRC?=
 =?utf-8?B?bzdQUXpOMGg3VllTSjRzZEtBY1NobWpIa1ZrUVdXL0ZUUTQ0M1lrNkk2RC9I?=
 =?utf-8?B?OElmV0pBMGVWYS8vK21sM1R1UW85MllaeTZ6cnJvRTRhNHhlT2tOYXhLLy9V?=
 =?utf-8?B?TXY2Z0FIcHJBTFlxNWZUV3lVVUFPdzNocCtsaHBITkROTlpzdUt6NWJSdGRB?=
 =?utf-8?B?RmN1SU1WM2FCd0o4UzdMR2JtQ3pvSlIvV2NuaWl6Z2Uzbk5WQ3kwOXJuLzV1?=
 =?utf-8?B?dFN2NHBaa1NLenpZYTZMaWhiNmRCZ28wSGZNNmFpN3cxcW84OFZkcWxuVVpk?=
 =?utf-8?B?WEZvbk9CM1lQaGQ1WmhueUdvVlAweVExUEdMV0RibzU3czREUkVNeXAyS1V6?=
 =?utf-8?B?R0ZWem54NEFIdEN3Z3Qwbk9hQitYNWlETUhFejg4MzQ1MEgyRk1BaEtDVVRz?=
 =?utf-8?B?U0tiU1ZiSm4xWW9GUU01eXMxSGJ2MUpvNEJmVXdFcWpjZnpmOHlMVTF3eTNT?=
 =?utf-8?B?U2hxV1F5ZXZKNDI2NGphTmRKWWE2SlZJVWRWNG9OMkFncDR3Tis5TDFMWkh0?=
 =?utf-8?B?ZUpqUEJRa3Vjb0NlMFlWclBpWkRwOVNxekJkME5yRTF5NW5VZmJzS1h1MFFF?=
 =?utf-8?B?ME5iczdRVHcvWExOME9wVkFRVW85RnoxU2lJSGRHMnorSERhaktWVDdZWU16?=
 =?utf-8?B?RHVtb1htWnpRK0dPTmVFMkhvemVIb1BFeVZkQVQrSXQwNVlWNmNQdHBKMVVo?=
 =?utf-8?B?K3FYRlVuVHJzUEZsWTFOaU9NbDRRVDloQ0txSlZqL2p3b3lrZXFkeU9zYmtJ?=
 =?utf-8?B?bHVhVnZBZWJobXRFVURsbFg2ZGlxVWRkOFJhVmxyaGlXbitnc3hySVRQSEFq?=
 =?utf-8?B?RG40RTBaMnFRQUp3SmQ2Y2JZN2xKQlFNbEY2aUxNQzcwU20ySUNxdHFJN0xo?=
 =?utf-8?B?dlEyNkZ6WUYrdDUvTVJDQk1YVWFQRjFaeTRhYTZ2VHY0QzZwK1gyRXRYUmg5?=
 =?utf-8?B?c2ZIQmQyWTRBSFBuSWZ1NkJHM3Q3VE5Jd05OeWxveFIrV01UMU1sMXBaNXZQ?=
 =?utf-8?B?Q3QxbjM4aHRBRUZLUGFEQTJWMXQxelBEdkFVREx4SlBzTmZWMUl0LzYvaG15?=
 =?utf-8?B?Vkd5SmZ2TzNLQS94YVEyeTVJZFF6YllsTGtDaGEwbWJSaWhISHhUM0tOTWsw?=
 =?utf-8?B?UHpmeUFLdlVHMXRka0I4OTVQU2NZNnVqNXBwUXhnVVU2cnltVnFSZkl6cDYx?=
 =?utf-8?B?bllkbUsyQVJrY01NdmR2ckVJekNyVDFwSnQ1RlMzb3p0a3ZPSXJuQ1dKaVRZ?=
 =?utf-8?B?VlA0RDZISjAzcXNsTGYyTW91YlN4NldSTGRBSzlWZU93LysrU05OOEhzU2RP?=
 =?utf-8?B?aHovb1Noc1NSZEdHSGNpVGlaeVV2c3p6T25IVGNmaEZLQy9FTkxhNFNmOTkx?=
 =?utf-8?B?T1lra08wUlQyYk91b3EzTmVwZHMvR0xrYVJRVzk2ZHJ1Q1Bmc3krbWpKT2U3?=
 =?utf-8?B?YlVZRVFVamhWUkE3SEJWQmp5UnlYQXU1TDk4QWlqN2tXZTdCT0orbk1Ba1FN?=
 =?utf-8?B?L1Uzd1lTN0dXRzc1WWNnbHhPYnNxa3BTZ25JcWVURSt2WTBoTmtDbU1iazF2?=
 =?utf-8?B?bEhNQlR0SHJhQU02bTNiN09TNnpVRFJBb3BrRCthOEZ0V2tBdHIrOUw0RjV4?=
 =?utf-8?B?S2xGdUxPZkJISkhXTnJrNmoxU1lEZmlYbmdFNnUrNGxobXFYQ1VCZVdBTyth?=
 =?utf-8?B?bWlqQ2hkOGJoWEF2VGo1NUZlUE1RaGdtYkM1c2RXRDZiOC9TeXdTMnExU3Y0?=
 =?utf-8?B?bDVoVHhUN1AzQ3ZoVmdlM0hkNjR1NzhlaFkwdnJZemtrZXdmUHg0SjlGcllL?=
 =?utf-8?B?YnozWWQwMzZtOXp6RDcraWNYTjQveThpL01oMWxqblBvaUQ1cTk5YytqSHhV?=
 =?utf-8?B?WkJNQ0VMVGJ2c29mWmFLNXNTZ0ZnbUM0WjVyYnpialRBYkE1UWkvQT09?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 245e55b1-cc6a-4f3b-b70c-08da4d5388a5
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 15:43:59.8876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kSL/LbAoVqp4uGb8bYW3VxlmYn6x6DysaltZAmZjCVebQM7FH7IDIU/CA4xrtQp9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR02MB4582
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

2022-06-13 at 16:58, Wolfram Sang wrote:
> Hi Codrin,
> 
>> could you please apply this patch-set [1] and let us know if it 
>> addresses your issue?
> 
> Any comments to the comments I gave to [1]? :)

I replied to patch 1/3 and 2/3 but have not seen them on the lists and
patchwork also appears to be in the dark.
Did the replies make it anywhere? Should I resend?

Cheers,
Peter

