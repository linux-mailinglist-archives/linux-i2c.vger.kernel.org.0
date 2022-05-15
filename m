Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF26A527A68
	for <lists+linux-i2c@lfdr.de>; Sun, 15 May 2022 23:34:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232120AbiEOVe0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 15 May 2022 17:34:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231289AbiEOVeX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 15 May 2022 17:34:23 -0400
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-eopbgr150122.outbound.protection.outlook.com [40.107.15.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE3D0C05;
        Sun, 15 May 2022 14:34:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L6JSAtIumXCJhrb0SzixTFLWnIc/mGbpldgNYuPnFyhYcrqRAJVM2z7+qT8mjGKjTi023nSp5DGimRvzQhB9nwBwqj4hySdgZ49xhOihu6/bExf2D8Aw6pNP1wLo0kK+1RsTVxRbAdqYhEgggU4baqee+5qqIrCxKCmRz2kGnemvaYMKx3gNOpJ9WHb18+lEOSD3BNtrVjEakmEl3r5tB2qMr4Hw73VcOSQwEUjVaj9W+eshY/oP2k+v2eJFtDcl/K7oGzUVsjSqZvDz42jkt5yB6P2PKs7o1fo5NjxGISLNIM4KRTHgNGyVyWz1o40ZTt9S+cNKjRm+tjGgBDEQvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QHOen47HhErskXsg7TwGZPlRzYlxjc0JDak0G1u972M=;
 b=AexfIn/cheaavdB/WR/WQp/+Q833vNVnQPoldAF0OOf+oKpWVAMoIGOAi5SOnhdXuw6H+XLU7AU5yPUq95+HGbeG0zmWXVjkIY81aQ+ckkPCnHFfa6HvrCyXNNt0mAjcSq5n7RBWtliIx/4Ptq7QflDtIGeUYeTo+fB40w0kQCweOfDmKvFVY/op6BcM8TI14TrxjHtB1iMXR6txB1x/rzZzYrE5E/zm8/9BqVaQo+cRoacDb06d/fstxObzXWsrSoOXMmn2E7MaZBlTvEk8G5BpTzh9Tgvnup3dU9tMtFKICFLp23ZIcvFtWvRHMzWLqUu2/EyhOHVkw/CqDnhpZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QHOen47HhErskXsg7TwGZPlRzYlxjc0JDak0G1u972M=;
 b=P+YwDLLJ0EnSiV7bWFzwlILIksB4BKClnng/JbFEUrqJ9cAGifsS14kQzM7TzJKsCwyTx0wlnYCgjc/k4Max4TJ1hpG4qSwockKQBzxc/fUr9lYcI47zE3plhiCL+umrDIprct+r+i3sSvw1OOztKZNyS58+UYGLoae9kTool6k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by PAXPR02MB7743.eurprd02.prod.outlook.com (2603:10a6:102:20e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Sun, 15 May
 2022 21:34:19 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::dcef:9022:d307:3e8a]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::dcef:9022:d307:3e8a%4]) with mapi id 15.20.5250.018; Sun, 15 May 2022
 21:34:19 +0000
Message-ID: <12be48dc-b5d1-063c-87a0-050886cc2505@axentia.se>
Date:   Sun, 15 May 2022 23:34:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 0/9] introduce fwnode in the I2C subsystem
Content-Language: en-US
To:     Wolfram Sang <wsa@kernel.org>,
        =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Len Brown <lenb@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Allan Nielsen <allan.nielsen@microchip.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
References: <20220325113148.588163-1-clement.leger@bootlin.com>
 <Yn/BFKwzVLwrjF/F@shikoro>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <Yn/BFKwzVLwrjF/F@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0112.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::23) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 949b71ca-cf72-44e9-4d50-08da36baab30
X-MS-TrafficTypeDiagnostic: PAXPR02MB7743:EE_
X-Microsoft-Antispam-PRVS: <PAXPR02MB7743A5A42D11F2CA827F720ABCCC9@PAXPR02MB7743.eurprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x4bjfXuZdwQZXL7Mhf/1oxNFweY+VItEWnj/fONP1sEytAW1jd2Xrg6IhvuqzMEJPMN62UD6sY1WRwM/JLdlXgFPY8GEnkFlIF23Uh1PXJJdKNS/ofYdJ6Jqbi8cf9VeTXKt9Y82DUKCRRSXIiEArCItVwO4Qp5243yUiWPKIwzwaDlq2YvZurFGICsXsN2WnIMPdGwoDQLeCOOhlS9Pv8iYhqiYVRZmW2gtHr0FaKD90Q5OpJFAMEHpSqovdcMVa2hCp9mLvOiVjXBOiPKgqKJf5d71FqbLG75f/uompXpNdGkTdKyEEC1WyKCjQk1du/T7YSA3WAPc7aQW024umoV/HDAJI+x4HnbFERidKta+fIT8Fj4rdvRFhJLcRPVXf/zogBVpLeY8NqEPQIrwcMt90TRPE46gpScO0xU5pT620FbABjou9rXpWbI39637/8a6IgpjcJ1zC2ls0CHyp7wZAl1b1NWTQIpr+CP7NFsYNNW/2yCsfVLlCFA1ATKh1R7j90mrsNu5byDXhpgcRNka6Na1dprAOb/hCxJbCzNTfrbnmUep2T5Kq8TqsXZT+yw0Axy2ICxOvYRrRATKf6z7CbtQFXS/Mc1a8YAAafAwV7BaXwuPTvPSwty4l1pfRFCLNN9RDB+QgZl+Jw9eG0MHtwmvqrQI71NFi+eCBtdIUV1tDLqw3B2+HAyhmU1+bTxq+Zx4FpXbT1+Rj1i0k/bbi+l5wKc+GgB6Q55cpNjeE/LNSA/AfobMjBsHIwM9
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(346002)(39830400003)(376002)(136003)(396003)(41300700001)(8676002)(8936002)(36756003)(316002)(4744005)(7416002)(31686004)(26005)(6512007)(110136005)(186003)(2616005)(5660300002)(31696002)(6486002)(2906002)(38100700002)(86362001)(6666004)(921005)(66946007)(66476007)(66556008)(508600001)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVBZQ2ZMZVdqcHVpa2xTZm9PQ3kzOW5hd3RVUjQ0VitlRUFyYU55ZytBc20r?=
 =?utf-8?B?MkxqeHczb0FUcHBHN1NnMGs4c0VmVTFyUk5jSERnbE5zSTV4dWFmRzhrMTNE?=
 =?utf-8?B?UzdaQnk1SDJTT0R0b0FFLzVVVDhmaUh6MyszQm03RFBsSkM1cVcwUDRGNlBS?=
 =?utf-8?B?ZERTMzVjRHpUVVJSVTRMZHF6Uko1TVQ4ZVZrN0tRaElPUEdZaHloSWx4Q2p3?=
 =?utf-8?B?ODYvWkxTUTBJMG1BZnVHcXk3WXpSd09vOW8wM1ZTc1F1SllJZDk3Y3R2Q2ZN?=
 =?utf-8?B?eVNvcGRhSHgzTUlGRHBrM2RxRFl5SWczTmZ3MlIvT3BvQnVuZWdmMXlVQVJi?=
 =?utf-8?B?QklKbkpWaW9mQU5qeFE3dUJxeHpYYlZJYTU1amx2S0o1dzBaekx0azdYTkRt?=
 =?utf-8?B?amRCU1RoemQraGRsa09zVDluMkNsTmRUOHp0VmlhS2xSZW1iOVRxcThtb0VG?=
 =?utf-8?B?Z0p3eTl3YVl0dTRLZ2pNTVJDMHpoUjY2WlBnMWxlVFk0RStwN3pPbVFYaE9P?=
 =?utf-8?B?cEI3RUxOTDNxYzFPMFJmQnBmOEgyK1JaUDhtQXVYUTRTVkRNL2c2eVl4TDFF?=
 =?utf-8?B?amplZ2t6YlQvUXNmbzRWTk9GcE1aSmdoWVQ3RXNhZGI0d251SDBoaGh6WUZh?=
 =?utf-8?B?MUpIVThzaHl0M0lzd3UrdWVZRFJGbUgxT0d3VkZ6U0NYOHRzMlFFdWFPWlNn?=
 =?utf-8?B?VDlCZkZ6bHhPalpWSUp0VWNPYjBPY1k0eFlhVkpBVktjZXZaVkVjKzJET2FO?=
 =?utf-8?B?V1pwVkhNbGliYncvd2liK25Kb2FZWlF3V25KcGdlaUpqWjFoZE1ydXFOcU1s?=
 =?utf-8?B?Y2Z6TXltcVZIYUx5S2dpK0pVUk82YUNCNW8wVGJMYnJ0dmZLeTZPNGUzNjZj?=
 =?utf-8?B?aTdGL1JhempzOGhsNmNYb2tGSGZmMHVCTXdCQWJUdXVWWHlKanlaRkhCc2gv?=
 =?utf-8?B?cnh2TFoyQXlpZEV4cmQ2c2tFUGh4RE1Wc2tiVFVvVDNNcFhWTkFid0d3MHVC?=
 =?utf-8?B?eEExaGRUN28vNHUyOGFhemxXQ0kydGZkK1FlZnF4bG42a0VDYkxqaGkyY08w?=
 =?utf-8?B?cEF3VFZBY1h2U2ZyanRrUFJReU5tVEp3b1A1VnB5NHovL0NoN2ZOUGRvRnN3?=
 =?utf-8?B?bzU1R010alNYd2pmSGNlczZSWHIxWUV0dWlhb2FtSi9NNjgrR2toaFB5T2k3?=
 =?utf-8?B?YkpVTjJlaUVhRGtta3JQTXpaSU5YMmYvK251YU5OUU9Vek5FdE1PcVVuZ3VV?=
 =?utf-8?B?aGY2dkRITUEwUFpGK3lLbTJvYnJnNi9tTWdibXNmZXFaTFdUVkliU2RtZEVN?=
 =?utf-8?B?MmZHdjNudmR3T1VLNWt0YXd4N3l3ZE1sejQyTkhHeE10djRrUEhTLzBob1NY?=
 =?utf-8?B?ekdmNW9mV3V0b0Zod3V0NTZ6aFUvQzAyczJJQzNPNWo3NVUrYllna09BWUEr?=
 =?utf-8?B?ZkJvWVg3OHJIcG9KcU8rT3liQnE0d2dLMHFQVjNOOENyWGdTTitobjZ5UkVo?=
 =?utf-8?B?ZE9WSEJsb3FyUXR0aG1wNGo4dEVMMDdlQktGMiswVGk3VHZDTGl5eXU3S1B1?=
 =?utf-8?B?YStPeXNkWFBka2RUOWJaTTJ6Szl4anhvaEk0MWU0UDhtQ1VMa2dkWDlaRXlC?=
 =?utf-8?B?OGNYb295aHFGcGlEWEg4Y09vTjRvYWY2K3dtWVBHV05yYlIxYk9vU0EyZzVz?=
 =?utf-8?B?Ri9ocFBqeWQxVHcxclBXbzN3M1ZsZGU2NHNxdVYzTG0rc0Zuakl0OEJJazJW?=
 =?utf-8?B?Y0J0dzRvK3gwbmhSOUJlSmJmNitiaWh1dGVxalljbC9lZGt6NUxnd1Vkclk0?=
 =?utf-8?B?VHlrS0UrUFBFaUZibmd2YlZRdi95QmhYbEZnd3RGR0lNSmhEZlZ2T2VkLzR0?=
 =?utf-8?B?M2dQRDdsenY4T0pTZHVKaVZJcGo4SFFLQjh0bHdlTG8zUVVLTGtDdG92UkM2?=
 =?utf-8?B?eE1PWWR0N1NCZHpJekUrVFBDck9MQlJZVkNpZEI4dDVHeHZtOWJyN1BER0Qz?=
 =?utf-8?B?U0tMOHR2TzE2M0xNMVNqZVNLdnNWMDc3a0pERldyNjdwYXZBL21pWHl5eVZi?=
 =?utf-8?B?VzVhMmR1UHQ0V1JHdEVMczYxa0QwWlRZQm1vNjl6Z2tTa2NZN0M5K0JwU0Jl?=
 =?utf-8?B?dDFsa1ZtSCtxeHVhOFVJVFVXbWl4ZkJzQ3BaVWNVaUMyYS9GVjZCZFdhY1ps?=
 =?utf-8?B?ZFZnN2V2MG1ZSGhQVG9WcHA4Q1ZudTZpTkNMSnlwQm1kZXB0S2NYaGhrc2xm?=
 =?utf-8?B?eEZkcEFaWllTUURaUVowTTc5MDlLektRdzhXcjJIa3Zod2RqK0JVQ3k3QUNo?=
 =?utf-8?B?OGpzOEZ6bWxvV3N0cWVBbWxTTS90K1Fpb3d3ZldJWjBYV1BvdE4xQT09?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 949b71ca-cf72-44e9-4d50-08da36baab30
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2022 21:34:19.1951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H0oalLzwCQyD6abl00RWOVOkPpzNSDWrKelTtbGRt72UWaDDhQJRUiiSWlLVoWum
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR02MB7743
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

2022-05-14 at 16:47, Wolfram Sang wrote:
> O
>> This series is a subset of the one that was first submitted as a larger
>> series to add swnode support [1]. In this one, it will be focused on
>> fwnode support only since it seems to have reach a consensus that
>> adding fwnode to subsystems makes sense.
> 
> From a high level view, I like this series. Though, it will need Peter's
> ack on the I2C mux patches as he is the I2C mux maintainer. Still, I
> wonder about the way to upstream the series. Feels like the first 5
> patches should not go via I2C but seperately?

Hi Wolfram,

I also think it looks basically sane. However, there are a couple of
comments plus promises to adjust accordingly. I guess I filed it under
"wait for the next iteration"...

Cheers,
Peter
