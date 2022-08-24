Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C2C359F42A
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Aug 2022 09:25:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233776AbiHXHZ5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Aug 2022 03:25:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233226AbiHXHZ4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 Aug 2022 03:25:56 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2115.outbound.protection.outlook.com [40.107.21.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50273B6B;
        Wed, 24 Aug 2022 00:25:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jpi9YMY22CEphsOeHHo4S6ewQr3lhByFvIqBeuU3JisX23N+3B97QNsUDdKZluxKIZJ46XM+/ghDLv/FZzRQyI26oNmPYELAe0hTYaU/upkQC0izcYgSeqlPhsNMtGiZuGthVPGfSM5/l9w9u9BJogTYGPNUbVUboc8dl6YgtHFIb2JU0D3zd15PM3/GCQFUfGD0UlFe1OE+6sdU19dufWVANrU0A7tWcYdxfNcDha+ivOSGnV0sUTTUk8sAEgaYxHDfnt687rWK1i76geAbNK6EPXOfI58xo0lq1ZS4H3fw9psX/NfGjXk04uYHlq7yWKAUDNkT24A9iSJg+h9azw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vt79qw+PDajQF8MfgZnryCeGYbSAvy25JB4KceSJv7Q=;
 b=kJqePjWKuWWOYHzXP69NMluTF4Wnv2E/PSaOW9/81GyT7kpJtwh9s5AfGzoe3sEwzS4OmEsLC5nmQZaZIkcuXagZ2lKCPxqvGLxh5CTnnKiwW9Akb5Lh4bSyUyZiGEJ13zbqqT35x9O9sto9d+4j9YXgBQjah181omelQ1Cz4gcnjsFi/DvBehIb1cUnQEqtiNADKoscCFnOFQaOjDKGDWLjvZatbMAM+oW8VcarklN+3HVkIAW3JzHDXebboc8XYVxW2tBB/l6401JVnLZd3RlMw4ys55B+t8STb8v94L7cdX/ACQhJM04DNx9xmBytEnvSzGd3maDiKTbj6d6MvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vt79qw+PDajQF8MfgZnryCeGYbSAvy25JB4KceSJv7Q=;
 b=Kii7lWseX006q1fhEvVRGyj41xS9ODzVQ8CWYduTaN5MxBTir0s0/y6lUvTS5vZbWTc4sv8BSWsuDkLk1qyAU4/kR45WQ1+olEf7mX+rlrTyfQe/lTAbNuTMokQ7D1+2sMu/aT/5NwywSyKgbyudaI62K4ldc5tgYl8c/C8Jmrw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by DB7PR02MB5307.eurprd02.prod.outlook.com (2603:10a6:10:7a::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Wed, 24 Aug
 2022 07:25:46 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::1d88:3306:c280:3179]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::1d88:3306:c280:3179%6]) with mapi id 15.20.5566.015; Wed, 24 Aug 2022
 07:25:40 +0000
Message-ID: <102125ad-fbec-7f23-bb17-b73ff49fe57b@axentia.se>
Date:   Wed, 24 Aug 2022 09:25:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 2/3] docs: i2c: i2c-topology: reorder sections more
 logically
Content-Language: en-US
To:     Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org
References: <20220822091050.47099-1-luca.ceresoli@bootlin.com>
 <20220822091050.47099-3-luca.ceresoli@bootlin.com>
 <19a22449-c9fb-1eba-9a47-3e3d340a13a1@axentia.se>
 <20220823230110.115a3fc5@booty>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20220823230110.115a3fc5@booty>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0012.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:a::31) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3211e37b-44e4-4b2b-01a1-08da85a1d933
X-MS-TrafficTypeDiagnostic: DB7PR02MB5307:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: as5W+PD9ytKeBxV1jlEWWnun4yAaUEFJ6vU+sAjdZMPmchlkW5g2hBhh4DpK6r80wKL0Axmj/uJzwIOvsM2aXa7+0RwV5aF3lUHObFm96VDpYk5bw8EPCD4AbG+ge0zw6soYpkVZbBpUtcwhQf10O3DZlMQQlfOeQ8DutQufPpmyhf7ZUU9yQ5mEfUjFO2LDJ5IpfQqpy4owfc20eBG0Ggvk0LbWvHqkaOsEBGbm2neMRM6l8qdGAz9nianFbhYtLJPj9EfEVsteRv0ZkPeD39zaSji1UNehrOxTdNBDR4G6lnE9iEy5Yc1+ufUWMtGczX3YoP9/jK0XuoDtlP2afdHCs5i3DBDYbO6JblzvQCSvc+SxQGkh0RrCkjoekvND6fz8+ia5o7iJamb1auGIQywZkxh4rCXQafbIXRSK4dIBwTnR115Wi3D1IAfhKS382aueGTu89Yv8wAtfIAUVaFe/LdTOWr/kObUmXCpphZnr+Fc5g0NmMwLNTxeuMSa6nRlTysNFr9ablDpKfQuI6p4/ExKBp0R56EWltWTgR0vWtbZQ4twC8JqwmYwMX8IaMqhHTZ0nlhwuu9OBmCvjcQK1mjtej+lfwLQq32oYr/R72pwAuRzGocdB39BAwsCPavdxTLCFoN+Bs9AvquUym+ZnltAGSYjZNrX+gp4ttjfdTM4nGXofszNAC1P75Jc7NGy1vaeDF4O9M6UeIoJnpqHVfO3/lEU1si465+X1B/5lMPtmn/5yT02XOZ1owW6LKyZxL1PACTdNrcJib6Yjq/LDoY79rTLwfg+ViotxWFU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(39840400004)(376002)(366004)(346002)(31696002)(38100700002)(83380400001)(66476007)(478600001)(66556008)(8676002)(4326008)(6486002)(5660300002)(66946007)(8936002)(6916009)(316002)(41300700001)(186003)(2616005)(6506007)(2906002)(86362001)(6512007)(31686004)(26005)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVhsWnpOMHlrcU9zYTlvUkNqMzRRYmg1Q3lkODIrb01uVW14UmQ2cFJOZnJ4?=
 =?utf-8?B?dUdDLy9zWXFoRE5Kbm5PTmEzaktJWC9pdFhadEpHTm96cWVGOUZCbjA0VTNs?=
 =?utf-8?B?TVY1ODRHMEh5T2wxVkRtQk1uTFRPWmxvUy9sZmxBYWRvcWYyOEJ5b2VrYUVN?=
 =?utf-8?B?em45SGxYWGFkVDdGSTkyVUg0dXlIS2hnRHljZGo0M3hyREdZUzhya3B3Wlli?=
 =?utf-8?B?QzVYN0dodE1LYTBDMjErdkhWcEEzd0V4TVREWlMyeTRqaWtTU2QyV3I0Vk43?=
 =?utf-8?B?SUNHTE9iNm5VU0JPQkk1elVMdWdrMjJIbEJXZW1rTFdkc2VxM1g0OWw4S0o2?=
 =?utf-8?B?T2dlTzhQSEFyWlN5bGlXZC9hcVdKSU9GZXhjT05vaXlvWmdnK1NIbXA5ODE5?=
 =?utf-8?B?NllHSnd1Znk5dDJJZkp5Y1pSSUVWMGMyWWdiOHFBekNYU2FWcit1QmozeHFr?=
 =?utf-8?B?aEdDTnNnWHgvTkg1S284ZTJBd1hSTmVFNU1rbnVMaFFFM1J5ZTFZU0UwdlBi?=
 =?utf-8?B?QjRwdDRZS0QxSDlkM2ZaVUtWUEdTdWlMMDUrUTlIaURtWXE4Z29RKzZsSjZX?=
 =?utf-8?B?RFczOTZ3aitWQ1JEMmdkSDFTS0RxcXJ0V005RWVweU9ma2JabC9IVTNzQTIw?=
 =?utf-8?B?cjJuZlIrU1hRM1JHV0Y1WUpCL0ptdnE5WlA2ZXYxWUw3YXI1UTNvY2VOUjNq?=
 =?utf-8?B?alU0dVJvaFlBVjMxb0lJQ0NPdVE0bGk0RUhDYTh1NXVUVE0zWkgwVXV1RXRH?=
 =?utf-8?B?N0ZBTWFDWXpVejZjbytrODNIRFM0aFRyQ29VRjBORFJZaWRZMmRpN2FISlJH?=
 =?utf-8?B?Tks5ZWdROERQRHpEdUljSzEyQlhPdmNSVGdZbzNaTkhrRXVqZWYyeERXQjNp?=
 =?utf-8?B?ajUvVG1kRnQrQ1hGUnZTVGwvZmVQcndTOGxLV2VteE42NE1FZGlTWVQ5cUF1?=
 =?utf-8?B?QnpXeVdkdkl4ZEJTSHZ4cXdWMEgyd1pGeGowMEl0cWRxOWx0ZnFUeGVMVk9Y?=
 =?utf-8?B?ZDhOTzRGUW1MeDhqOG1kNk95THlWaEU5TUR2bUh6NGQwOFpoUmNJdnBhOThi?=
 =?utf-8?B?b3ptNXl4U2R2elY3V3gyUmpmT3RHTmRyVU5tSDNyRW9tMUNKNUlFSllELzRw?=
 =?utf-8?B?NG5IYWQyUFltZVFTVnVKRE5xRi9HeWxBWmRTcVhkSXlhVE1NMHU4NXYxQ0Vz?=
 =?utf-8?B?SXR5a29TZVc2RXJvVmJwWDE3Si9VWGxqRFp6Rkx4MFdMc3dBM1RnZXhDSENM?=
 =?utf-8?B?L091RHRZUDVkVDY3Mk1JbEUrTnJoVzZhaGJTTnJTbnZua09sTnVJZGtZOVB2?=
 =?utf-8?B?QlVEUFpGM20yRkxxUkhXU1VCaHJJNFdCM0tWaTFnUy9rNWNvTGNQSDM4NmRW?=
 =?utf-8?B?ajZYVTYrVW5USG9Jd3U0cmhrREtOZUJJUXRMV1k5emQvV1M4MWZzYjJuTE9w?=
 =?utf-8?B?RzdMYWZ6ZU5PeFI4YWpxM3ByVlJLdStHSzRKaTIvb3JxcFZJU0FmWU84d1lj?=
 =?utf-8?B?SUhzZ05SQWZYQlNrRkt6S2ZJWmpaY09saFQxVGEwdmJIMXMyUlFhYktzVFlq?=
 =?utf-8?B?NnlyQUxmTGg3NzllcUtiQnU0Y1ozSnZkak85aG1POXJkMkM4QmRhZjRKZEZD?=
 =?utf-8?B?dnN0MllKU2EyanNTdjlwNXNoR3V5OWR5S1JJTlU0NncxZ2FrSWlVZ2swTkJS?=
 =?utf-8?B?enZtVlN6RE91SnJWZU1oSFV2cDVwRVpnOTllOWxLeVVqQ0kzUWtkOC9WYi9l?=
 =?utf-8?B?M0c4aWxhdk1iVWNvbDVCYVE3YmxscEFHSzJJS3lMdnJNVU9CWG9CeEVFNFdy?=
 =?utf-8?B?dFNOaGp6NDBUbjBhdUh3WGlsQlJzQjlGUSs4d3QvUldHUVpWL2VuQnRaWE9V?=
 =?utf-8?B?SHQ0YXAzS1h3bU5EbmdkK0p4ejZoaVF0WWpMT3NhZk9SSEZib0hncm1za3kx?=
 =?utf-8?B?eHFjVmtzaG5EYUY3d0NuTEtLRzRvVDVES1UvRVVUV2Ntc09JMUhxQWVicy8w?=
 =?utf-8?B?enREeG9MU2VtTHZqcENpRHpRQmZZS2JRdGYyZlIwSTlkOElMWjlZR1llbWtj?=
 =?utf-8?B?TzJOdkNPT25jZ1hQMWtKMGV4dEw1Nm9QVnYwM3pFUTAySncreVgzMjhNeEtv?=
 =?utf-8?Q?+cu+RNxUyqyO3z7lR2ihk1cmN?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 3211e37b-44e4-4b2b-01a1-08da85a1d933
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2022 07:25:40.8448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pAwwlqkjGbiESnYEscMAgzRrIo1uAIq9ZbimVymCR6Wix/8i285SeqHF5UzUAJop
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR02MB5307
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

2022-08-23 at 23:01, Luca Ceresoli wrote:
> Hi Peter,
> 
> On Tue, 23 Aug 2022 11:26:51 +0200
> Peter Rosin <peda@axentia.se> wrote:
> 
>> 2022-08-22 at 11:10, luca.ceresoli@bootlin.com wrote:
>>> From: Luca Ceresoli <luca.ceresoli@bootlin.com>
>>>
>>> The sequence of sections is a bit confusing here:
>>>
>>>  * we list the mux locking scheme for existing drivers before introducing
>>>    what mux locking schemes are
>>>  * we list the caveats for each locking scheme (which are tricky) before
>>>    the example of the simple use case
>>>
>>> Restructure it entirely with the following logic:
>>>
>>>  * Intro ("I2C muxes and complex topologies")
>>>  * Locking
>>>    - mux-locked
>>>      - example
>>>      - caveats
>>>    - parent-locked
>>>      - example
>>>      - caveats
>>>  * Complex examples
>>>  * Mux type of existing device drivers
>>>
>>> While there, also apply some other improvements:
>>>
>>>  * convert the caveat list from a table (with only one column carrying
>>>    content) to a bullet list.  
>>
>> I want to be able to refer to a specific caveat if/when someone has
>> questions, so I prefer to have the caveats "named". Not that this is
>> very frequent, but if we do remove the tags now I'm sure I'm going
>> to need them a few minutes later...
> 
> Now I realize the reason for those labels. Thank you for taking time to
> explain!
> 
> What about this one:
> 
>   [ML1]
>     If you build a topology with ...
> 
> It's a definition list, and the [ML1] gets rendered in bold.
> 
> The advantage is the text is still rendered as a regular paragraph,
> with the same font etc, except the left margin is increased.

Sounds very good to me, go ahead! And feel free to add my ack right
away with those changes...

Cheers,
Peter
