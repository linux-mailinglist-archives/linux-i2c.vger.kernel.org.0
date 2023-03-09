Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E66336B2C23
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Mar 2023 18:37:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230035AbjCIRhr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Mar 2023 12:37:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230468AbjCIRhl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Mar 2023 12:37:41 -0500
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2070.outbound.protection.outlook.com [40.107.8.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BF33FA8F5;
        Thu,  9 Mar 2023 09:37:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oZEj1aXKB6SYGeIDJByupbuFwJv1gKp9XCxpTYi1z60erSJdkzgdGRyX/E6gnh57dQ7yQmrw0m4NZatI3+lnzUX0DLfYdKgMabQo/F9T7y2Pbd7q7Z7yOZC41PwYaa/ZpAVwuKdzTaNATPXE59X/dBJFgRuvnnE4aYaehe+TWdqZzXED2yNjdMC5uCypgo5qXbikWcPFRYgbKthjIBQn8IPvydVKth3IX2RW2a6WjEjWGOYDn6TvgmKNC/rSq26qVCSf+XXFzo11I9jyB7/FbnDTHYgE71zGia5udnOrXtSczH9fKFUXLEYSgVbcHuLd28RRUooNZFM62TXXrYfXcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l+GUBgwuBGRNnYCwp+O/L9JFvpy/TU86rbDCHZ1iFOw=;
 b=m++vZqYZImvezQalplbGkn9BNBjOvsWyS/ijEPK3DH6qvhTZX1xaX1sQmlRLLBs0OnROhiXOZHN/XvGlHWuunXukqpEn8OFmFBcuwQDCUmRChStBCl5Wm9NvOLGw/lCYdkpXiJyiJlUY3JHGhQek8R0KZN5saU533UJ4y3awAFAoHBlVFkXrbOjXYY0tuZJy+PHs39maR92WSV+kLBYGKBI7kxbX48snVxKPLC2KYrFfG88ToI3xwZJvqn4+LE8GydyD5fcL4CQzXIf8hVK+FBqY/vlfN9n3Z1+veYGAwi1FaHYxz4fhUSGz/BJZitt3AlgCmkMvtI4XCPQ2MXu1zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l+GUBgwuBGRNnYCwp+O/L9JFvpy/TU86rbDCHZ1iFOw=;
 b=J3QTPxt9h5/ZNfAmoq5b9sztNTIwknMi1XvTY1mnr5J8HfuciSQ7T3goNkpOO9pXLPbDrnBJG74F2FeRW6F9P6hgr8hpVP94yezF/eN5+qh4JDGYlxPVp0ATWtesrFBwis4qUSskMTL+hBn2mWGBpCHml5h/f1YSu2hY0RdHFuaI4K6n0yU4dYHPr46ApbFpkvPNvxYKqvLStVp4XmqNNoswjKRjuupfGtDRe2sL2UezT1+ouScqAmbgStd0TG77+nUyGN395JwIItpkrHgvFGOWdvGgOFME8gyBBXrmWVsayR5NVYDOe23/yP1Yaxhqg+em9sto2gFiS2oCZXV+vQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Thu, 9 Mar
 2023 17:37:33 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com ([fe80::2ea:4a86:9ab7])
 by VI1PR04MB7104.eurprd04.prod.outlook.com ([fe80::2ea:4a86:9ab7%3]) with
 mapi id 15.20.6178.019; Thu, 9 Mar 2023 17:37:33 +0000
Message-ID: <f2276121-2e58-d6be-f253-8c639855da98@suse.com>
Date:   Thu, 9 Mar 2023 18:37:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 2/5] gpio: Add support for Intel LJCA USB GPIO driver
Content-Language: en-US
To:     Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Oliver Neukum <oneukum@suse.com>, Ye Xiang <xiang.ye@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        srinivas.pandruvada@intel.com, heikki.krogerus@linux.intel.com,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        zhifeng.wang@intel.com, wentong.wu@intel.com, lixu.zhang@intel.com
References: <20230309071100.2856899-1-xiang.ye@intel.com>
 <20230309071100.2856899-3-xiang.ye@intel.com>
 <2865f3d0-428b-0df1-fc50-f6af3cb9dac3@suse.com>
 <ZAnku01goVDCuNM+@smile.fi.intel.com>
 <CACRpkdYQfT=JXvmjKR_9O74H2dmwx1EF4QjCHM6fKAetpbrMOg@mail.gmail.com>
 <d307b36e-4901-458d-a366-eaf478a77412@app.fastmail.com>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <d307b36e-4901-458d-a366-eaf478a77412@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::7) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|DB9PR04MB9626:EE_
X-MS-Office365-Filtering-Correlation-Id: 09c8b002-eef9-4bdf-f9e2-08db20c4f70c
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7pZ4fzgrktlCfB48hADf1z0MEe+RVBjFnyqqw2i3nqAh6v2u+LzpshW+UN+mYRct3LL+L2QHYHcnAQmlgmSdcueRsnfHAUa1oe8m5zaMSyMxdfMTzF8oinhZGYOCukVVCeatPswirQUmWWG6W4JREVJgC3zeIw2MAwIeEhf/RMdAW4S516gEhwjwxtjgfzp8Tu5wjkE+y+1GWiDdDv92rMMaFpQRLUZQqjHlbPbwicYJqfNLVl0Mk8hq+RGXnvbE1dFc70BGNf21B0Z1qzibF7hKAdzY8Q3r/vBELiEt5LRQ80dWKPqdMEnJwyAeoR29Nen+NEGfg/dQN84PSyW78Z5BGxyFgMVMITduld6UYeIRS30YYYQ2Z1/gNNuE9EMyzCRUlwWJ0Dx9UDwr/bwSHEpm2U1PaDsSd8MgO0bnh6/ctWNOgrNvrgdbeOHhRYtQ4vix2UmQ/IHM2vlJCV9OWlvli86nybBliDIWDI1u1XQCH7E6jf7LE9QlhN6EmPTCyvc3PPM+LfpFClZyXIJ5/qTFU0kz3yPjCBSn63QsjdwHyK6yzSxH6pEGk6yMYGaEdq0vpxpjPBR6A0TB6xKOpFO0hWcbQNjvjEZkPsSN3VLNxATH4hjdOkNc7+8JpodPtbH0Y/W793WfP2IEDNyy1IsgeXTqtxQybCLPo0lJiCwnrfe6wnws/QBW8y6LRsKt6b9jKM4giJSi+5Nj9C3GhCwqiIIhaKTTKw91KTLjIHw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(396003)(346002)(136003)(366004)(376002)(451199018)(186003)(6486002)(36756003)(478600001)(31696002)(110136005)(54906003)(86362001)(38100700002)(316002)(31686004)(6506007)(6512007)(83380400001)(41300700001)(53546011)(2616005)(7416002)(5660300002)(4744005)(66476007)(66556008)(66946007)(8936002)(4326008)(2906002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UklpUjRDNUtEOGlVcVF1WVJLK0M0NGsvZFdyTDZoNHpINEkzQlZpWnVxNHQ5?=
 =?utf-8?B?QkdVUjJLSytEekJkWVpYbkhGN1ZLc2JyTFNKOU0zVzVOWXg1eG4vLzloeXVp?=
 =?utf-8?B?Y2dYeEhsdEhySFRhRG5ZQ05rejhIS2dMZVN5THlFU29jQ240cUNXbnJGTmk0?=
 =?utf-8?B?Y1dQSUxlR1lta3hYTjZkR2VpUXBWLzhQek56cFVabXZkOXNnb0VHaXZGTUpS?=
 =?utf-8?B?RjJGVGl6MGVxTHdNVXNIZnFlTU5LUFZuMU93NEFoMGlJYkhOYTQvb2w1cGxY?=
 =?utf-8?B?VUEvYS9FWC92dU5rZWN5WUJEQyt6TzYwdEtCc0o1TFNnY0hCNWNkUGtLOEx4?=
 =?utf-8?B?Qk1BMGJXMkRtcWZkanU3WHZZNG8vWDhJS2w1UkdEOGlSK1VEbEVjV05nalhk?=
 =?utf-8?B?SDZaS1dHcVVDZktrc1hLbFpxTGlTSnBBWU5QVTNBMmR1UTV6TUZFZDFxTXc0?=
 =?utf-8?B?TWNMWXBKMWZZUkZJdlc2dENGU1J1U0k3U2RKWGIyK1NMU0ZMU0xGTlI3MTd4?=
 =?utf-8?B?MEVDVUhWSGh6MzhsRnViUE1wMHVTYytwaHhsSUo5SkR3d2drb1loT2hLK3FT?=
 =?utf-8?B?dXlIazlsTnVDSDd2MTA1dFMrRWVnRUUwL3krejFrUE5YaldDRUpkRExVeW1n?=
 =?utf-8?B?bWdaVWQxcVVib1JpUmc4YmZzTnpQOVZvWU5hS3VLdGZXcExjVE9xUFFBaCtz?=
 =?utf-8?B?ZW9DSlBTWVBqcXhHQk5kcnZSQVRWTllJT1RzajdjeHlsQ2xYTVY4NE5oa3NI?=
 =?utf-8?B?Ti85RXRSZlpyN2xtbFlGc1ZIWG5KWVRqOGFjVWN5UHVSU29zRGZFY3NQc3RP?=
 =?utf-8?B?L29RU2V1YWRLRXB4ajRjYUxyM00rTWl1cExJOGpsYXBvdE1iK2FiVDlXRkVX?=
 =?utf-8?B?V3Z2eDBEWS9lZEc1MFREWTNnQ3ZZWkVHNEc4dlpEYzlyNzVDK2NGZUNLV0NM?=
 =?utf-8?B?YzlxcDFpbjdwU2dQV2w1a3FaQUl2QVkrNTZrMFVPcngwMG5yVXlNamZqa3Jv?=
 =?utf-8?B?VGpUVUYyaCt6KzhCQmhrdThvd1F1aWhCQ0tpenc1UXVtc0kyNUVPRG5tTERo?=
 =?utf-8?B?cUtiV3FoMGdRUmx5ZnpSUndSZ21RaGxUTWkybGtzNkx0bHhESlc3R0pIK2Zw?=
 =?utf-8?B?Zjk3clYrR0ZpcHdlN044bnhBQkZYcjJzZ3IzUGxQZ3FmQXJjMmdNZlBwS09y?=
 =?utf-8?B?cEVIZkVvSGJjakltQ3Y1QXRLV0locFhJZklZNElBemJJUFJPNG9ZVkVVUDF4?=
 =?utf-8?B?RHc3TjF0U3g1UStLc1lubFgwR0RuN0JyMktNL1RxR2V6WW1ZVFRBSzBYR0l2?=
 =?utf-8?B?TE9UUkdnZ1NTbkJOakhqYzVzemJmblYxVXA5YU9kVkVUU2srNUNyUEJJdUh2?=
 =?utf-8?B?Y2oxOWk5VEhyVmZvbGJsdm10YTRhOVp4YkI0WCsySGlCbkcrSjVqdWtnZWtF?=
 =?utf-8?B?K1pXYk5Ed1U5U2ZQcmdWNlpBZ0FvcEFTd1l1Z3NWZUZ0ZjN5dnpnSGUwZnhH?=
 =?utf-8?B?U0J4MjBQTFRpQTRVQjhCL2JtcDM2dTNSbE5CWUdlbjlkUFNKczFxZUl0QTA4?=
 =?utf-8?B?bHhJenJmcGdpZTJjcnZlWlVLZ0pGelRSbnBFeS81T2ZKRXVzNGtZY1QyNDJE?=
 =?utf-8?B?SkNkbU81WFl6TytPcUMzSUdtZHhMVTN0b2JiOC9DZUs3RHVQYVAzZUlleXJN?=
 =?utf-8?B?VlVJOVBuSk5SRHphcVRjcWZNR2RBRkl2eE1OS1FiY3NkRHVBcmlCbzNMVXcy?=
 =?utf-8?B?T1hhUXJJV1o1MFJKQ1RMM2g4dkZYNGFXNFRjYjZBVDgwYlBRc0FJbVorNHZM?=
 =?utf-8?B?bUJwdERxWTlrT2dTQS9CSS9lcE1QYU0xNW83TG42aFI0aWlGWS9LNEtwN3B0?=
 =?utf-8?B?RUZxbk10VW9QSk5FdmFESzF4OEQxZ0h1OE10eWMxS0N1QjlkTWY5ZVFXd1hZ?=
 =?utf-8?B?bTdkUndqb1lNd1ZSVzEweEk1dUwwQ28rTitKUTRJUnByUXVLR2ZyQWpHaXE5?=
 =?utf-8?B?QmdubFpCNUdIUmJMeWc3VC8yTEhIQmZlU25ZajVSNkdTNnNYTkV5WFhMazV4?=
 =?utf-8?B?N3czWVpxd2tZcjhtU29NUmRaREh1VHJCYkpkWU5QTm1GOU1hRHVFUGdoRUc1?=
 =?utf-8?B?VEZYdno2ODhYTit2YldrcEthZ09kV3l6WisrM0IyYVEwMHFvNnRkeFN2TnZP?=
 =?utf-8?Q?l5aBK/PprhbLm1OOPz4TfMuDu+TZMEu9NkAIsHkGtNeb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09c8b002-eef9-4bdf-f9e2-08db20c4f70c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 17:37:33.5589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eLMYehpXucDJzZkultcMUdYe0rfEtVDw7yPqiTBqShxV+oLliE89YHKwL8NM/Xbd+a8/5ai1AVUCEA1fi20gHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9626
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 09.03.23 15:48, Arnd Bergmann wrote:
> On Thu, Mar 9, 2023, at 15:18, Linus Walleij wrote:
>> On Thu, Mar 9, 2023 at 2:53 PM Andy Shevchenko
>> <andriy.shevchenko@linux.intel.com> wrote:
>>
>> Yups. And I think the solution looks something like this:
>>
>> u8 obuf[LJCA_GPIO_BUF_SIZE] __aligned(8);
>> u8 ibuf[LJCA_GPIO_BUF_SIZE] __aligned(8);
>>
>> __aligned(4) if it's 32bit DMA I guess? 8 always works that's
>> why we use it all over the IIO subsystem.
> 
> I think it must be __aligned(ARCH_DMA_MINALIGN), to account
> for architectures with non-coherent DMA.

In theory, yes, you can do that.
Is that a better solution than using what kmalloc() is
designed to provide. I don't think so.

	Regards
		Oliver

