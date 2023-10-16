Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD54B7C9D88
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Oct 2023 04:51:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231216AbjJPCvV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 15 Oct 2023 22:51:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230451AbjJPCvU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 15 Oct 2023 22:51:20 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2110.outbound.protection.outlook.com [40.107.237.110])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6547AB;
        Sun, 15 Oct 2023 19:51:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QKvji5hpMuR4gmA6aID9Hy+tk4RbJnC5w8VLYFwV+f7vjmoUdnIZ1IWnNlTzoglG4jIxUWz7oTTNI3oZGYISy60vLS252jRZ76cOSRMl8n+uni8Yo0BqtWkOh5eBh83C+D3aVJWPkWBbxKM7de4OumWTY/hKr0rYNBvl9nzmxzDj2cl4DaMvLLWJFc1HaHlR2o04FABGgsbiVeN7aF4lRuFfgco73W/w8+3G+hpP37rZNj2JCBfxpOuDkgS+xUcU3lK+KP/wheWWIjAabCdwXNemyALKCd6aQJFm049SoDnZxI4QO8ylSX//q9OqiwULyZzoU/iuzk0EsQ/gDlx5LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U0BYKBBr89xS2YbAar/mrVMgfL0OUf3YU1LP3o0vVrU=;
 b=UjGkXmrdy4qs+p95LqCcvg5/qMvHP4T+5/Eim2xaN8Z1haFdIds2XlL2tK7H2UEXfakXswNUaLxdtAMjB0eoZQhyZjOyF1xBnBfduyHgoQmq822zRB1fQECEFB2I16iGMboLGEub5kMaQf6onELWq8608+cGbdvuOwaDhmyf7tsRKx6OIZ09PaGdVZ0+4Vx+GDANPp2j6HejlNAhWVbz9jjoabZ5793IrxyFe8IpeSHU8TpwxJJYrWbTzYitKofxBC+3WZ5JZ1H7EFpJgObf8b9j2h6wCTC+hu3hKVYx8rgaBtbKHcHSkq9boN9+rl68CZqHvFgFV+uqRfKDHVI0Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U0BYKBBr89xS2YbAar/mrVMgfL0OUf3YU1LP3o0vVrU=;
 b=sKzMdwETpxIAvLX4yeBitzeEAiA44/jCPhjio33YJPto4axTb7+sJvM0BKLk6fwEGKO2R7FabrQyGDfL7cdzXvH7Le+LHOlSeUACl+XXfievUEY6vYk5K3IpTzpTP5p1TUFBRpIbM69dfEJIVTd93UJ8kUL1y5ogpluiR5yQtJg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from SA1PR01MB8131.prod.exchangelabs.com (2603:10b6:806:325::8) by
 CH0PR01MB7049.prod.exchangelabs.com (2603:10b6:610:10a::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6886.35; Mon, 16 Oct 2023 02:51:15 +0000
Received: from SA1PR01MB8131.prod.exchangelabs.com
 ([fe80::5dd0:9039:f27d:884c]) by SA1PR01MB8131.prod.exchangelabs.com
 ([fe80::5dd0:9039:f27d:884c%7]) with mapi id 15.20.6863.043; Mon, 16 Oct 2023
 02:51:15 +0000
Message-ID: <d227ba4b-2078-5b84-363b-3b26b0a2e10e@amperemail.onmicrosoft.com>
Date:   Mon, 16 Oct 2023 09:51:01 +0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1] i2c: designware: Disable TX_EMPTY irq while waiting
 for block length byte
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Tam Nguyen <tamnguyenchi@os.amperecomputing.com>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        patches@amperecomputing.com, jarkko.nikula@linux.intel.com,
        mika.westerberg@linux.intel.com, jsd@semihalf.com,
        chuong@os.amperecomputing.com, darren@os.amperecomputing.com,
        stable@vger.kernel.org
References: <20230929035356.6435-1-tamnguyenchi@os.amperecomputing.com>
 <ZRvXlqCcEuwR7YzM@smile.fi.intel.com>
From:   Tam Chi Nguyen <tamnguyenchi@amperemail.onmicrosoft.com>
In-Reply-To: <ZRvXlqCcEuwR7YzM@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGBP274CA0012.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::24)
 To SA1PR01MB8131.prod.exchangelabs.com (2603:10b6:806:325::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR01MB8131:EE_|CH0PR01MB7049:EE_
X-MS-Office365-Filtering-Correlation-Id: faa681dc-db4d-4ff7-7434-08dbcdf2c366
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CNxfQI5vRFS8AqimSkh/y95EOtt2eNQPnOwxo4wCk9JjnsWfYR2pXW584q9HzYyeWHYKeLvvovdiMI6rTus9Ksdbrn+MJ2gA+ZObpYX1eqxKHHzXshwmPFvnqQ9hSkn/YoIwCVuXXztYM4BEDwK0v9oAY+4qvsoIFpgSgzIgAub2ThuRFpgrItrbl+OE3Z1oQ4gBeF07/0EyYpd+9CwXELA2mIUmdEdudwcRvTU4EegcrADBiMlj9pHbvS2DJDAR0nvVRects1OtnWDzPPzfBuIkMIoGCOSH8oVa6lfLQ+BFO7NMpb5cxdD3oVX6Pk+5mxN97pySHsiCH3wy16jhQep8yaqfc+ZGckuwVvMVEpn3Ww+cbsuJdd2yiguxLCC/gaDr0aU5Js/CKpQ+qGSjJTgbbrF1eZc/i81hTs0RJg+cFsmQGGB+v69EPWKyi1vGBbDyFZVPD+Qencnqz9Dvey0Z89X3OpQGlBVa/UJBq02UimBWuanMLXWQg+miTOO/c/fri2gXXzkX2F2hb44qDNyHfbaeoJyq7a4uErGu6CTA7CxvdMadAzOxSloDDBW6tOETw6rasq95U7bHa51cQRglf8lYwbHajLa2P1ggT9oNnESFopNPCRY6WjF7r1K2
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR01MB8131.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(39840400004)(366004)(376002)(346002)(136003)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(478600001)(6486002)(6666004)(66946007)(110136005)(66556008)(66476007)(316002)(26005)(42882007)(53546011)(2616005)(6506007)(6512007)(4326008)(8676002)(8936002)(2906002)(5660300002)(41300700001)(31696002)(83380400001)(83170400001)(38100700002)(31686004)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGRnL0NZK3RJb205K1A1dktPa1UvV3ptenJHcmRIQ0lXbjZxTllrRTZ5T1lx?=
 =?utf-8?B?S2JncTJLeTY2Z0ZNdHptN0NGVTZMRnRFYXora3MyMkFsOFVBQXZETGVkbVB3?=
 =?utf-8?B?M3pKSjd2cHlkNXJVcXNuREhMaTZwSHJLZkwyNWZxcno3U2x3M1pXOHNKU2tK?=
 =?utf-8?B?RWgxR2pkbjNBT2xPN0tUdTR1ZmExRGZyRXBQNUNMdGNTWDU4VlpPOFdvZ2Y2?=
 =?utf-8?B?V1djUDhQbGRQTXhHK2xVVWwvTmROU1ZDcDRhL2E0a1cwVHNWWHgwVEJNd2dk?=
 =?utf-8?B?ZnBRNnU3YlAwVysvSDc3d0VQT21hMkpyUHQ3YlV3cUxNME14b0ttb0pXU0ZI?=
 =?utf-8?B?REM0U1FNUk0yNzI3R1hwUFpXK3ZjSUJDVDJtSlZVS1BQa2lWaG9IN3hpZ2kr?=
 =?utf-8?B?V2pXOWFoL1I3anRYcWc2SkdFNEtFQkIyenJmR1gxYjdqRzVwVmF1KzJJNnI2?=
 =?utf-8?B?TEdscmNwajNoV2NVNXhWWDc0ZHRIeFpjOTd2Z3VKODRuMzkvRDZBeFdiZTJz?=
 =?utf-8?B?MGpwN0RmSEJkOXJZNkttd3dnV0hjSGhxSUdMY29TM3BxM1FVOEZTKzZ2YS81?=
 =?utf-8?B?MGFOS09nVm45Qnl4VWVNMktpVkp6eVUya3JKS2tFTzJLODJqQVJtekRmVllF?=
 =?utf-8?B?RjdwV3E3K2tzTVhjbDgwbkhlVEluM2lUaFpUdnFsMVVJVXh2VmZzS2o3a0ZV?=
 =?utf-8?B?WWgzVW0wejQ5MktDbnZDRTQ1QVMzaVhicW91V1A1UHNtcVR1cEw5U3pLYWhz?=
 =?utf-8?B?bDZCa2dURTViaWtycmlWTHpBdCtBdFRvbERiN0RlT3JQYzh3aUdOODdlT0xs?=
 =?utf-8?B?UGR2Z2xXQWgyNDk2TFBGWTdhSGk0QU5IbDlTTVZ5Mk5pSkhRS1labUdubFhF?=
 =?utf-8?B?YnNaVnU2V3hJRnQxQzFpRlpkRjQ0TWJoSTFXZk8yZnVINGMwdCtpVjVxYWhU?=
 =?utf-8?B?SFhzNFkvUGxiWW4xcXRGRnkrNzlHUmdKbHYxZzNnbWU5TW9pclVJa0h0VDBr?=
 =?utf-8?B?WVk3amVQMmlIODFtam85dmdacVp6QWNRMWh3SjNhRFR6UzltSlNTZDA0Z3Zz?=
 =?utf-8?B?RnlQblpwRUR6LysxRHUyNXc1S0ZMZDZFVG5JN1llVDVKZW9ORTBRK242MXZF?=
 =?utf-8?B?WkxXRTNvRzZ0eUpFa1kydlhmR1dCVzNEVG1GUCsyVS9XQXlUcWFzdWpTcFNr?=
 =?utf-8?B?OUY5SzZLMUJjNzF0Y1FFWkZ2OHBWcFFhR1Y0dTN6VWhIcWQwb1lHbFBtdVNJ?=
 =?utf-8?B?WlBQSi9LbG1kNXJXUm5yVDhNYm1veVpuY0FVOU42WHFCTVZSQVVWZ0JIT2xv?=
 =?utf-8?B?b20zMWxUR280blh2akc2Wk5zTVl5NXVqc2kzU1pQbnRFUHFhTXJGM1RNQzIv?=
 =?utf-8?B?UU1reXRaYzNJMUdnMlNKWnZpSTlVZlJjUXFUR1htT2pBNGZSYjdBY0hhNE5T?=
 =?utf-8?B?RklSaEMxdDZCKzBYYy9sZVRlTzdaYkY5M2tPSEpZNnNwM3R0NE9KVnhDY1lj?=
 =?utf-8?B?Z1VpQjdEUFBOSDVzZEpxcExZcmNyWVNqMFptUE9VblZMeDVJc29Nd3pJUEw3?=
 =?utf-8?B?cHFaU1pUM3NDT0lkNkV1YkZYSDRQbnJ2TWExWUFaUlY5Ni9VU3l0RlpVSUs3?=
 =?utf-8?B?cXQwdEpZQ0s2WXNJVUVCdG9jSmpOVGxJN21qVk85Y2o4dmpLaDBiN0lSalpv?=
 =?utf-8?B?K01lT0VPSzhQOUhodUh6Qzd0NkN5OWkyb2lqQ1Z1STJ0UElZZ0l4RDZGYk9Y?=
 =?utf-8?B?WEtBVGNueDNnNDBBMGtVT0pOLzhhcm5weElOWURJeWNjYWpJQmtwRUs1OXVK?=
 =?utf-8?B?VEZ0SFlIVmF2eStGUHRPSDl4cGppOHY5UGViNXhucGR3VGFvaTl3bHkra253?=
 =?utf-8?B?cCtEWHRhMUZkUmZNdmIvMUdST2RDMVk2Z2JEV2NkUmJqQlB4cERzYlI5ZnRT?=
 =?utf-8?B?TXVFNjJQQVhXRWJ3a2xWQndhVVp1ZGhxblUwRXMrajlRVVQ5cnQybENuZ0lO?=
 =?utf-8?B?Z3RYZzgvQ3cyeXNEWHk0UldHY2JMK3VpdFplWGxWVkk0MVRYT21FMjlDOXNK?=
 =?utf-8?B?NThpYWFxS2M5c1NNSjV3STlyb3dVWklFRVVEa1RMdjFyU1JzaDNIQzBvNzZz?=
 =?utf-8?B?bEFrMS9QK1R3RU9CVmNZVTBrcWNKaldIc0hWWmo3dm5sZ0twczFTOTJjUS96?=
 =?utf-8?Q?H8hCqnqMv8NAh1nJl05uOJSSx3mta6VDTBHd1xKeka+F?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faa681dc-db4d-4ff7-7434-08dbcdf2c366
X-MS-Exchange-CrossTenant-AuthSource: SA1PR01MB8131.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 02:51:15.0870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Og65LKxj4MOFK5DTKCE97BH+xBKMlUaQSyvg6mEgH7oKwlHzAl6/vj859N0ZDKwnyHkI+7UdX07pmDeSyeSbGo29vp3bxudR9avcARnZEzqGtPWf7HxPBPHX2XTzsIlx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR01MB7049
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 10/3/2023 15:57, Andy Shevchenko wrote:
> On Fri, Sep 29, 2023 at 10:53:56AM +0700, Tam Nguyen wrote:
>> During SMBus block data read process, we have seen high interrupt rate
>> because of TX_EMPTY irq status while waiting for block length byte (the
>> first data byte after the address phase). The interrupt handler does not
>> do anything because the internal state is kept as STATUS_WRITE_IN_PROGRESS.
>> Hence, we should disable TX_EMPTY irq until I2C DW receives first data
> IRQ
> DesignWare
Got that. I will update in V2.
>> byte from I2C device, then re-enable it.
>>
>> It takes 0.789 ms for host to receive data length from slave.
>> Without the patch, i2c_dw_isr is called 99 times by TX_EMPTY interrupt.
> i2c_dw_isr()
Will update in V2.
>
>> And it is none after applying the patch.
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Chuong Tran <chuong@os.amperecomputing.com>
> Who is this guy? Do you need Co-developed-by tag?
Right, that's my bad. I will update it with "Co-developed-by" tag
>> Signed-off-by: Tam Nguyen <tamnguyenchi@os.amperecomputing.com>
> Other than that, agree with Serge's points.
Thanks both of you. I totally agree with Serge's points and will update 
them in v2.
>
