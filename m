Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 806D36B2C0C
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Mar 2023 18:31:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230004AbjCIRbC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Mar 2023 12:31:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230110AbjCIRbB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Mar 2023 12:31:01 -0500
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on2080.outbound.protection.outlook.com [40.107.14.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFBD0F8F35;
        Thu,  9 Mar 2023 09:30:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NiGMMiipFg6MaQieGmv+euQSBoLFM5e5Z5TkSroy2a2hMndz5l6kvfotrdryQx0eqdU5kNSCWe7K5WB2WTkAIDXGbLBnYls6usDNh339RzqblkCQZfoTzn98DmfvnEVCB38S5gF8xjweixljwr3Hx7O/evP1du6Rdj0g3l22zSSdVifZet0MIbhjc9kK/a5B79XfFQxIThAklZVcBYoUYcZI0El5O9S0AihbbQ1P+B2lgoS5l12veQxxZRvmBA22jziZgWMaNa4CDaCPA2NxETfxhPf7VaMgbORnRsMV1OOgGgyKt6/QQmskt4Le7FH9r63iYy2ixdMt306ovt9Smw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IWI6yxA3G0qUW1Oh6kbyHfjxL2wtcJRjpaihbjZk9fE=;
 b=UttppMhsyn5pMdW/oijc9grHSR7X5eMdQ5LnFKCHEBPzaSNI5KjK8nTIgNglfe/dT+eDpAOX8oI5eIa05bFC2pzQWySeoUVaVYEzXs6vwSYp6K86RZfT7vV7VJcGfs90U1OO3nbdvZ8uok2N0nETwT6Ya07uBHNLZpGROPijrmL+KEzws3Vmwrk1xEOnpiVVp61c0rh6P2/qVzd+yjxKmXGAu5TCgI2a/K6RFBop6R6U+teFXcyF+50TOTP/ISLsaU8baYr3LukXmta/3u2WSnvOwpYXikp7iRxcLHklUhnD95/S0lA3lF1oeOgb2DDTn9nOvnCt9HQzbNXiDUYVGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IWI6yxA3G0qUW1Oh6kbyHfjxL2wtcJRjpaihbjZk9fE=;
 b=RZ2O03nTfG+yn6Fl6g1ic4CnzZ4ymj4r+/HOr0RY4S01h3txGaMKsvoa+nwuhSI5zofEmND3WXIeoQGkS0YteNYVkcu8FSFrD2w/1hO001yx5+M+NBgR4ZfldhmB6QT2AOHBI3wmebWgLON41u9v73EA3A79DSEh/3suHZ/qZJLzEcz6H+0i5nagj+2gAI/8Mmp7NT0O941VY86LS+2eltcrHv0FN9vLtIXgJ07AgVak8lUSNXFBVQQvf5vSwCll0RMUYv+yy244d2axg2MSBNNz1YBsqlOhf4Zb6ey82PzpjrXGLTPyyeFvOUiZ4+OacL+z/LnNbINqLmBwB22utQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by DBBPR04MB7993.eurprd04.prod.outlook.com (2603:10a6:10:1eb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Thu, 9 Mar
 2023 17:30:56 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com ([fe80::2ea:4a86:9ab7])
 by VI1PR04MB7104.eurprd04.prod.outlook.com ([fe80::2ea:4a86:9ab7%3]) with
 mapi id 15.20.6178.019; Thu, 9 Mar 2023 17:30:56 +0000
Message-ID: <5b34408d-8589-d735-9a77-a651ea661e01@suse.com>
Date:   Thu, 9 Mar 2023 18:30:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 2/5] gpio: Add support for Intel LJCA USB GPIO driver
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Oliver Neukum <oneukum@suse.com>
Cc:     Ye Xiang <xiang.ye@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
        srinivas.pandruvada@intel.com, heikki.krogerus@linux.intel.com,
        sakari.ailus@linux.intel.com, zhifeng.wang@intel.com,
        wentong.wu@intel.com, lixu.zhang@intel.com
References: <20230309071100.2856899-1-xiang.ye@intel.com>
 <20230309071100.2856899-3-xiang.ye@intel.com>
 <2865f3d0-428b-0df1-fc50-f6af3cb9dac3@suse.com>
 <ZAnku01goVDCuNM+@smile.fi.intel.com>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <ZAnku01goVDCuNM+@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::16) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|DBBPR04MB7993:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ea57979-9092-4d7c-75f7-08db20c40a68
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: erNmKGom1EeWy+sCUCVG67Z+ZqpCrHuk790zLJKFfLGjlQGTph5/4Fez94uCTvVYSEFWzxIrFQK08djEapJ5WS1YAwTk0jm94jg5Cfy5Y/MTe3ty5UhWE1nCNbH51fj29WD3RnZ2IAqaeVCJ5EPVhXRX+KpnKUX4BRImppUmbJaN3xKw4f8yFPA5ftxsK1FIBLwNVeaUTmGm0SKeeXKSZUipej/0cyYe3ufHSbYfve/zu0YpRJNZAuiVAtlFz6V2tw2LgPn8/SfFXWxGSdQQgM/9RZCVTDv46FLcwtTHLfvsLjnilnnOd1CSktlOHylLUNcj9L393aIouh+a/nQFhlYYUBSQ8eLEmPM21HpXc0It6OmMM0ug/ciJT/KiU2giD/xXAN/P835OJBfDW7eG9eP7hI884bOMSmWxP2xMWoJQMQVpS6K8cP/0gsIUMfNpYWyRjknC1CSnaakkrvtkrge76bd6hoh9iHg6ay3HLW6C5sw6Z2xiMZVWQvG+w+qF1hXUkk6BIV1SZIv/CzHGszYFIQyokW9KIBl9kGjPE8QSZID71cwXxfkw7deGxp+SmyEB7TZkVFuXu7vNmdgqZnKZP7V3zrdvS2xh3cgBcrYISuxUzUoS0uZkuMBFgKyvc43/fI0i/0BLp2fPojxx1w2+dFdpHC8wTm+a3Vj7xbzZgVrygGpL2xDicEttxYhjHH1uNZ3hCHPBpg6y8YZpa40l9fB/fLfKiAm/kENQYFI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(39860400002)(366004)(376002)(136003)(346002)(451199018)(36756003)(66476007)(8936002)(5660300002)(7416002)(6512007)(53546011)(6506007)(6666004)(38100700002)(83380400001)(186003)(2616005)(66556008)(316002)(86362001)(31696002)(66946007)(41300700001)(54906003)(8676002)(4326008)(110136005)(6486002)(478600001)(31686004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2pVVDc3cFMxcDVycUswTVBmNXMwTWJ5dlpUQlNzU0FaQUJiRkdUS3kxVW1y?=
 =?utf-8?B?S3ViUVh0OWtwbWNJMTRUKzNUbElxd201cFg3azNHeVhQTUxlYUdKZFpiUWpF?=
 =?utf-8?B?ejZzUXFabVpZWW41SmxwN2F2QjJDdW91TTArR3Z3blFBN0k1ZzM4N2VVcUsv?=
 =?utf-8?B?OXkvcWRnS1ZDLzNvZzR1bW43UnEwRmJ3VWJodGdxbmZ5TDZ5Rk8rSnZzdGVy?=
 =?utf-8?B?UGlib2NtQzdyeE40RG5IRSsyN3NPTjRZK0xTZnVhMjNWRWltWjlCL251RlRN?=
 =?utf-8?B?M3NrSjdlK2diaUZ6eXpEaXl3dVhVSWpvcjF5cGFmd3VHQ005Yk93M01Ydzhw?=
 =?utf-8?B?Q3FlV3JuczlOYjk4cHowOEdhQ1B2SkxKTk9mNEw0QjdEMWx4RWR5dHhLbW9l?=
 =?utf-8?B?U3QzYU9vZlFNMmtLcE14QnB5dnR0RFd4SVYzcFZTbHVVU1BrSUNlbENjdU5I?=
 =?utf-8?B?cy9WQ2VHT2tkTEpTSTE2dktleUFiY0M3am94NWdJYzZvYWpRUVhaWW1GRlNW?=
 =?utf-8?B?RmxJMmJ5YjRZMmkrSnd2cXZZUWJxL1lMZzVJVnA1YWRjcjFpNjcrdmoyT29P?=
 =?utf-8?B?SWxmbTREcWRPL3RqR1VUblEyRkl1bHFObFoyMFZrcENjNExicGVKa2hTbmZS?=
 =?utf-8?B?bk9MR1F6aUtkQVJORnA3OHJrSy8vazYrSnBCNitqYlVzbGt0TUFmcnQzdGsx?=
 =?utf-8?B?dFQvUkN3d1YrVXVjS05xd01ZTEJsd0dVcEVBaWtLVkhPUFVkQ09Obk9OWmho?=
 =?utf-8?B?U0xTSlBpZzFRRmR4UDFENGpURk1Vb0pBendjWEszM2RHMlljS01TWHNuNjNU?=
 =?utf-8?B?S2YzcTFZQkNQaVJ3U09JVGtCbHZXdnd6M0ZrcTlJMGJLNzJIMVVKN0RPeVFG?=
 =?utf-8?B?dkVSYnFsa3dZS0Z2S0QvY0NsVmFYc2JmMzVHa1Zxb0NsdXpIUUdQOWRBTTNF?=
 =?utf-8?B?UUNWQkE5UEttT1gzYWtONzZjblBXQVVHc0srUnVDWnRFUHQxbzBNemFkeklv?=
 =?utf-8?B?eGNoTTQ5dHRXMWpkNFRkNG1yVGhEYVBxcytjenRMU2hPejBNOUl6MnRldmNP?=
 =?utf-8?B?L0N6a3NlTjg0KzFtaVVVU0tWTXB2SSthK1dtazhvWU1xZ3gxN04yY3hwTWo2?=
 =?utf-8?B?cmJIaUlsVjU2aUJoYmN3bkw5UHJtcWdrNDUrTjBlZHFWZXBXTzA4aGdGUGs4?=
 =?utf-8?B?dy9YS3A1Sm56OXRhSmxiZjN6R2NETEJib1NDbXNBUXFhYVRCaDVya01SdGVL?=
 =?utf-8?B?WFFaUS9UTk9IN2c5by9ENGxhM291cUhnNDFyU01UR3VxYXBEVk1mRFpKV2Q3?=
 =?utf-8?B?MUk0ZWQ3VjJ1NUovaGJTTTl3SjdtcVBsWFNlTWM1b1hKSnRJZUZ2bU5ML2Za?=
 =?utf-8?B?U0txc2s3VUZ4NGJJVEphWWVBYXQzOGJDdXpBSjRobHZIa3lTMHJ3V2pYc2gx?=
 =?utf-8?B?bmh2aGZid1NmalFCWWYrTWw1aXpSQWFGaXRvdHoyNHNNR21sN0RuOG1pTHZP?=
 =?utf-8?B?d0s2bllGV1dVRG93RTRMdlBSeWw4Y0RHdDBXWGZHY2VaRmF0YndCT1ByeTRq?=
 =?utf-8?B?MTQwNmdjbi9Ma2R3UnRiWHZ1RWRuVnd0aThSSnpKQXl1T0VNaVdEVjZYTURD?=
 =?utf-8?B?UCtQVTk5aVpBU0xzZzdWOWtzSWZwN25OZi9aYkROLzU0amdRTkM2WWIxZVpN?=
 =?utf-8?B?U01UMnRuRGZNeDVKUENVTXk5Q1QvUCt5MGN6N1NGRmtPZjlKaE1vQnNNOEhY?=
 =?utf-8?B?VlN5MTAxbCs5eEs2ZXpDVFhqQU9IS2hvdDFQUkUxVWxMNkh1Z2dmUStmTmN3?=
 =?utf-8?B?RUZJSTkrZ24wY1VsK3l6RTJTMVlrSWI4a2p4OWJvWjFzSTlGb1o4Q09OV2FQ?=
 =?utf-8?B?Si9ldWdkTEo0ZUJTSW1HVEt6c3BEVm4vNGlvS1cyS0hBeWs4eW12M2Z2ZkRY?=
 =?utf-8?B?TnVkVHFYQ3NqY2JSV3RySUM3eHRlOVprMHI4ZkxsL2xHcmREZ2JhcVJnM2cy?=
 =?utf-8?B?Zk9Bd09kUjBVR2ZkcFR3ZExnZnJNVHVwbjByOEorWXpIUjFJWkdoa3Nhdi9M?=
 =?utf-8?B?ZjBkY2V5UTB1dEtnZDZEN3E3am9pblJrNFNIdU1UYWQ5UHBwdFJnZ1NpbjZv?=
 =?utf-8?B?anQrRUFQZXI2STdQT2hzSzVmaWwyYndsdG1GWWJYQUU3b1RSa0tFMDZwL0No?=
 =?utf-8?Q?kW/p9+wUy0r4GtV+gvauYKJTvA6l1ViSwY6Ykp2aVjvP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ea57979-9092-4d7c-75f7-08db20c40a68
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 17:30:56.6322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Me18N8AWNBa5PmzHR+TeBKtoV3i5dpWSlVlwM9wECiA3TO6hyVLTACmdwJ4SRN6GAZoq83ZvqCbK8HVJeIJo4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7993
X-Spam-Status: No, score=-0.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL,SPF_HELO_PASS,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 09.03.23 14:52, Andy Shevchenko wrote:
> On Thu, Mar 09, 2023 at 02:40:10PM +0100, Oliver Neukum wrote:
>> On 09.03.23 08:10, Ye Xiang wrote:

>>> +	u8 obuf[LJCA_GPIO_BUF_SIZE];
>>> +	u8 ibuf[LJCA_GPIO_BUF_SIZE];
>>
>> And here we have a violation of DMA coherency rules.
>> Basically you cannot embed buffers into other data structures
>> if they can be subject to DMA.
> 
> Huh?!
> 
> The problem here is alignment. But other than that I can't see the issue with
> embedding into structures the instances of which will be allocated on the heap.


Hi,

These constraints are documented in dma-api-howto, but perhaps this
is inconvenient to read through.
  
Let me explain for the input case. On certain CPUs DMA does not
update CPU caches. Hence when you want to read data generated by DMA
you must read from RAM. Hence you invalidate the cache line with dma_map_*
operations.
Those cache lines must stay invalidated. If you wish to guarantee that,
you cannot access a data structure that shares a cache line with a buffer,
until you are sure that DMA is finished.

On the affected architectures kmalloc() makes sure that no allocation straddles
cache lines.

	Regards
		Oliver
  
