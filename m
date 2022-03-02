Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA6F54CB280
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Mar 2022 23:46:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230120AbiCBWrF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Mar 2022 17:47:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230207AbiCBWrE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Mar 2022 17:47:04 -0500
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2127.outbound.protection.outlook.com [40.107.20.127])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CF7E128DCC;
        Wed,  2 Mar 2022 14:46:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FjavvG37Bz/cwUnOoElqCwpwC7NGdIZSwIM36rSHKdRr04qQAHxQy5GINyy1MpKvG7Dz8C+L4GODM6TJyEnioUZgTEr2K7SYR8+oFa8qdqgUhkdoXd9uoHuus5s9Gp3LFwtFtnnAVU01xaRcEYFXuRq8roP1719pYxBia8dJRZw2EPfXTixXYmjgfJ/hzATNuqmyR9gNxsjGk6xr1sRLfPi0UGygXbv5Jy9NdyyhTBaiRhxrySSimB+oTd4R1E1gpeCbeD+0n067FOLjKqhrBn38qC8lV185oA+SKwppt8tUCGzzvd1SewAMtIQ13djEGaD1yBK4eyFoe++e9GW/9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=//8Yxp9KrFGQ+fG77AiBHXLFmCZeaPaoMQNicwJhLZM=;
 b=jZq1PPUHOA3BA2Y7A/QyZ+2hgCTTaCzvTVhIshP534DLM6YANrooMN9oZJdbHvZtNeRg4nwCLvaYLoeuSSGPAkKsMvKox3Du02dRliZgghE01zef1M+aXchai08RI3e7B8wjFCCQj8XrC/i1CIDi/Yws2HjXbPtGJTr8VRPvAw3GsFHmKdYxWx7BiELteXzCT1rJEfGhrFKax/tAyv6Kp/GTg492zImajQy6nudxqOAnPxZkc0D9l1KiFmmaxWGTAV4BLIW7SpN8rHef8DLBdDADbIN7ds5U4aQvOWks6GosG6KxFjgwIkmpkpXEsljY+6K10gVgDXfMoR93tab3+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//8Yxp9KrFGQ+fG77AiBHXLFmCZeaPaoMQNicwJhLZM=;
 b=bJ0pSLugB9JW1pdPzMYvt1M7HwCaQ32FZEqyOAeV5IM/BzjUaXxAWXhpysRR3QfJ8qW+xkDcxQixn/yV+lSjicipTxwEsT2Iw7FcoJO6Rk83AsysMVwDnmcjzlFe79vQaBuZ9QuZApmNBjNXlViBjzgNPYJzNSffcUAWzZ1e87k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by VI1PR02MB6109.eurprd02.prod.outlook.com (2603:10a6:800:18c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 2 Mar
 2022 22:46:02 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::7d29:dd84:d2bf:a1a0]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::7d29:dd84:d2bf:a1a0%4]) with mapi id 15.20.5017.027; Wed, 2 Mar 2022
 22:46:01 +0000
Message-ID: <c916d9a9-fa9f-104e-8078-083d96f74343@axentia.se>
Date:   Wed, 2 Mar 2022 23:45:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] i2c: mux: demux-pinctrl: do not deactivate a master that
 is not active
Content-Language: en-US
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <eca2bf56-7abd-55c0-a423-dce47c38fd66@axentia.se>
 <Yh/e4OzQ/hYSb+dg@ninjato> <Yh/gHSaRNs9Z8La2@ninjato>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
In-Reply-To: <Yh/gHSaRNs9Z8La2@ninjato>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0061.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:a::28) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f04baf2-e81c-41ef-8cbf-08d9fc9e6d10
X-MS-TrafficTypeDiagnostic: VI1PR02MB6109:EE_
X-Microsoft-Antispam-PRVS: <VI1PR02MB61098B7572914637591EC8C0BC039@VI1PR02MB6109.eurprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ArcIbXfCOjZHUat8veWlQDsWCEvTD1XwOwgpPXEWM5rVVHUeZqA+Fb8CqZ6fkmDyFvUu/Nf0KiTid4rCV7cziE7AvkNJLiVNucdusPP3NKekmJkui6bxfU5qjG1152NZfbJIv8ksXQC+Y4IumyQQkH3KZE9i7kXyt4diN6AjQ8uIJtxOqhFCP+5WbM07iUAi1VxbH58flFykq3c2yCYfBXHDKLyvbcz7faNTN9bGGoguiLI5MWQPSj1WnSjO19UZIMZnsKtmjXZgqNIQWro+iuDwrKG90boB/RWI/MMeCq1mRqcd59ru4A3QLZnnMGIvv6JPp9u97r2p2OklWpRjwMlD/17nVgge6w8NlO+HDuyX4wGw6Ekbh+V5UPS/8oEkBe6v7PtEA7DzEGXwvY+bHEbkbEJfH2hxSxq6WtC5SBny3w2C4NytYSbwfjuWWvl6VxNOVYO5webcdh4ZZ7NuqGIj0H4utq1wSbWuyy6+MVTLPkk0OzqLRSumo4ISc1cn4Lnjrx/N596VK86k/qNfZzYOMy9b5IAdiGRob6+KKyl+FaGvdB5SIf6kaBuSIkBJ+L5fl7x+EYp8v/0vVvCPpM3CH91wljjnHzn7gbtn8tRgFhsC1clJ9HKg+XpV42AkVWsUOLXY5o4GsZKtZ+ZZrusAu5H4Kf+K8CXXmofjVQfjno/h+WbBQLzsJ8PX6UDltpay31SwJwAcUuFr1eBHq7UTvNrxp9YRE1Lw7QfRX48=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(376002)(136003)(366004)(396003)(346002)(39830400003)(5660300002)(66556008)(66476007)(6486002)(38100700002)(316002)(66946007)(36756003)(6506007)(8676002)(31696002)(31686004)(86362001)(36916002)(186003)(26005)(2616005)(8936002)(53546011)(83380400001)(508600001)(110136005)(6512007)(6666004)(4744005)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWlMbys1cG5YdXJmZzBJSFUwM1FDMm13TjI1M2EvZjYrSkI1RFdsNnZtY0Z3?=
 =?utf-8?B?TWwwelI4SUJZeWYxR09BRnZmRXJpUHVLa2d6Z00rWVZMZ203dkdhOXVKZXZn?=
 =?utf-8?B?Q3IwNklmRzdqTkdLV2hFcDJtYlB1MzlIbHJPOFRGUUdKMDM5RnlUSUxXNHFS?=
 =?utf-8?B?dzJLT283U2NnVHIzWG4vMHZDdjE4Z3gxS0FvcnRqSkZMUDBsTUQxVzdVSkxv?=
 =?utf-8?B?OTJZYzByTTBGVHFnQ21UalJjZXB1MENBMC9kZTRxbXY0SGQ5VjZFOHhCcjZQ?=
 =?utf-8?B?b1paQnVmZHc5MjA5Z1BQUXZxS3p6Z2dUMk5qbGp2R1NicWtwRTRRcTRyY0Er?=
 =?utf-8?B?KzVuWFM0MTZqY2NnNmFHUitGNjRLM2lWL0VRdTJyZWhZQmRHMmZxQjBPdkNI?=
 =?utf-8?B?b1VUMkd3YW5JOEFaT2VhRVVYdk96a1J0aUloYWFSWmdURE5OVjlNZWFpejhG?=
 =?utf-8?B?RTZZS1VrUTIyeHJEYlVqZW5USlViUVA1eEhwb0hlRTJHdkdaNkoyUUZneUxO?=
 =?utf-8?B?eS9XeDhWV1AvS29FZTA0aDczN20zZ1hsRG1WNkc4aUsvMzZxSzJDTUJrTDI0?=
 =?utf-8?B?eHF4dE5ocEV5anNXaCs2a3dYSm9SNkEzTE9FQmpLdzdwc2xRSVhpQjArME1G?=
 =?utf-8?B?SFdlNmViR0xCeS8rNm96YW5QTERvd3V0Q0xoY3owZERRK0VBMGhMUEdsTE5X?=
 =?utf-8?B?Z1dzaE5jOGNNcW1nSFZrUWtqVFN1bVBQMk9QS3B6Qkl1YXhnZXZuNDhmY1lB?=
 =?utf-8?B?ZEVnVk9Ya2M3a2s1ZkxjVWlWWENUMEFrdE9IN2EvTEtkWDgwaFFjdmkvMUQ5?=
 =?utf-8?B?QjJxNjJ1ZVJhWjVKMXZkSEdQdHRCSWxPMWVGaUhqdUo5eU5ma1EyUXd5VnRB?=
 =?utf-8?B?ZEZWUEZTNFFqVVVIcSsrZnN3OEZ6ZXFrOXNhVllLMG82RVdGaWhjRDRSQStN?=
 =?utf-8?B?YzBzNnRCRE4zNmlaUTljcW1uK05TV1dtVDJPNm5salNIRDI1RGxlV3VsZjZV?=
 =?utf-8?B?aEVscnJQYVdjTDROTkswLzJjZEdWdm5xbTB1UE1FdnJCcHp6ODNqMmEyamk3?=
 =?utf-8?B?dWliNkI5UWtvS29rQ2dvMTF3eWFPb2gxUkZZbVlLOEJjdXNmdHFXWkdhNEls?=
 =?utf-8?B?NXRUYUJqUlBwOTRBREZ4eVFXR0pmS0hSUlhRTm9naHNHRnNWbXpndnJ4elV6?=
 =?utf-8?B?cFlGWVdia3kzMmt6SjgwTVV1OFJhSkIvalZZcHRNalhuYkNoanp1WnVreWZT?=
 =?utf-8?B?Tm4wS3BjS3pxR1ZpM1dpT3Fld0h1RVY1elFYOEQ5U0U4SlEzUThOb3VnMVpX?=
 =?utf-8?B?eE8xUVEzZHJHWjU4YzlEUE9iRzVjNzlqNVlJc3hOYWk5Qm1RVS84Q3FzajJM?=
 =?utf-8?B?ZXZ4T0hLY1FMRGFDeEVhdjRicnRCUDVyMzBNVWhUMGNKQVlXOWt3MDRJUmtq?=
 =?utf-8?B?ZVRVK2xEbk9Icnp6UU5mOVJudjFubUsrMnlMbWEySGx4Unp1dnNLMHRGWjly?=
 =?utf-8?B?MDZrZWdRY09ya3JMK0dEcFJWNFcrWk9CQkZJN01haDQ0ZWZRZ3dQMXpPd0dD?=
 =?utf-8?B?VkVReDY4WTJGcVRTZVhGTzc2MmdQTUtrT25HeWRYamI3d2VLN0JZRDFQVUJX?=
 =?utf-8?B?WnR5QS9Nazl6QVh3Qit5b1l2NWExNDZkWU00bUx1OHk5WXZINktZZHE0VkxV?=
 =?utf-8?B?eUF3R0pvZXRvaVFYTmd1OGRpRUhVZEx6VXhoRy8ydEU0YWs1ZW43aExVMUd6?=
 =?utf-8?B?WktuZmtqQUpleUVQeEllZmMwZHEvbkpYeFZlVXRDMXg2cEpkNjkrZEF1M3lG?=
 =?utf-8?B?bnV5MSt2V1h0SmFweWpEc0MzRVdyZFlCNHVGVzFPbngrb2c5ZEU0SHdzYjRk?=
 =?utf-8?B?bGNzR2ppcjU4OHVwSkpDMEhXVERQMFlvSVVIQUtiN2xBYldGdmd5OGdpZW9a?=
 =?utf-8?B?VlpHWEgwRGFYUExqazlGZUZOb0N0NWh5ODB6S0s3OFpLamJsa2NHUGlnOEh1?=
 =?utf-8?B?N1BLK2NTWkNOR1RBSGR2RlB3aXJpMGZNS1JDTzlIY2NFTEJzNGdlUUVBSzZW?=
 =?utf-8?B?akdkcHF4TEVmMTZXN3VVYXdYQnYrdU53UzhrdnMrbzNDdmZXVjN5UEsydDlM?=
 =?utf-8?Q?P2ig=3D?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f04baf2-e81c-41ef-8cbf-08d9fc9e6d10
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 22:46:01.8687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dIBqVc/Th25f9/94dbW5lNmbeSQ0khyPBnOx4sNgd9LbpO+H+RMRZ177og2qnABR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB6109
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2022-03-02 22:22, Wolfram Sang wrote:
> On Wed, Mar 02, 2022 at 10:17:20PM +0100, Wolfram Sang wrote:
>>
>>> Attempting to rollback the activation of the current master when
>>> the current master has not been activated is bad. priv->cur_chan
>>
>> But the master is activated?
>>
>> 259         /* switch to first parent as active master */
>> 260         i2c_demux_activate_master(priv, 0);
>>
>> Or am I missing something? :)
> 
> But _this_ code is affected by the problem you describe, or?
> 
> 237                 if (!adap_np) {
> 238                         dev_err(&pdev->dev, "can't get phandle for parent %d\n", i);
> 239                         err = -ENOENT;
> 240                         goto err_rollback;
> 241                 }
> 

Yes. That is the error path that, if taken, results in the faulty
deactivation. Sorry for not spelling it out...

Cheers,
Peter
