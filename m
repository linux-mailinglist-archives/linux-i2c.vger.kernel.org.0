Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8ED3E5B063F
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Sep 2022 16:17:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbiIGORX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Sep 2022 10:17:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbiIGORW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Sep 2022 10:17:22 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60104.outbound.protection.outlook.com [40.107.6.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 840E36CF69;
        Wed,  7 Sep 2022 07:17:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gxxu7LnvNOXitu1qlusNXKThDZh7shTIoiI6CyWWdn+3A6WsWvm1dzh3qwH1qvNd1W2QfCOXeAd40qvbI8UkzYSPrXb8JRnFcS54v6jiv7Ds6TthRc2NVdL2yk4F/jiwHD9fujZZ51zBsqGJEG3031KEI1YgBLr0S/HUy0eoT5voTCXiko1ziAMXiOC302jgEp7fcsMeQTOAOZ7OChViadYTTyQ8sUiRO5pcMlYp5u3IwR8Pm3nBv+vzkMNikBIwbYd1FWsDNv38RqQHcAZLTBTXkVAGsdWon3N/p0EmpIKZCof/8C38DOw/xMd9S4c0LCBqrIhYkQ6Wnx2aJDczSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8i7gF75epvDtqpBPfxjvrxWa1LQMnuHF0K1FJFbnAs0=;
 b=bGjwou6xOTDGb33+By4JQ3sA9MedL6t0Ff8qwVYV++u0Tk4fVXLKXOqAuX84IZfRUq7w0eo5R4TBHxUchB6oan21LtNz4oGFktAneYjf6d2H/ephZn5TTXGV8q+SDgnkFSIAcIKAwq99sX6fspB/0/TzR72s/C75N8gDqATn+iwwJ8ipSL9n/D780FfbofXfPE7rNz9gXm2WXgsqwP4SQjW1OT9xZaKqOfNsD4/QqPtmw4yTi1ALtOjMy0d9Byf7s38nMPaIDuylCnRri40QZtFxxYgpiU5ZnIeytX9dlUP1uzkL9DuACa/lOIS1GzZZtqWoiEl1zOH06/MLANWV6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8i7gF75epvDtqpBPfxjvrxWa1LQMnuHF0K1FJFbnAs0=;
 b=WarKHaVk7ArE8p6TGzxog9O5BArhWmNAMMY7GsjEG9HxKrTvgiyyqixvELlIapHXuB5yVnpjd72qFbS6mcS4lZiyQnJPZGQJpdCWenQxdyfEAAP7faB0IW8rSLomjIAJHU9ihIf6x4BHql6K8WwGjHuPBUrCtHlLRfSUytcbBak=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by PAXPR02MB7888.eurprd02.prod.outlook.com (2603:10a6:102:282::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.16; Wed, 7 Sep
 2022 14:17:17 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::1d88:3306:c280:3179]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::1d88:3306:c280:3179%6]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 14:17:16 +0000
Message-ID: <1ba9cf9d-2980-974f-e9a5-ea53e1915d45@axentia.se>
Date:   Wed, 7 Sep 2022 16:17:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 2/2] iio: si7020: Lock root adapter to wait for reset
Content-Language: en-US
To:     Eddie James <eajames@linux.ibm.com>, linux-i2c@vger.kernel.org
Cc:     linux-iio@vger.kernel.org, wsa@kernel.org, jic23@kernel.org,
        lars@metafoo.de, miltonm@us.ibm.com, joel@jms.id.au,
        linux-kernel@vger.kernel.org
References: <20220906202829.1921114-1-eajames@linux.ibm.com>
 <20220906202829.1921114-3-eajames@linux.ibm.com>
 <31b44b63-4cf3-6fdd-b2b8-6f00070af89a@axentia.se>
 <c7f6baa3-8181-a612-72cc-23f570f31ab3@linux.ibm.com>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <c7f6baa3-8181-a612-72cc-23f570f31ab3@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MM0P280CA0024.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:a::13) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52efe4c8-be3c-4903-65a0-08da90dbaadb
X-MS-TrafficTypeDiagnostic: PAXPR02MB7888:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JU0kOKJSyz4Gd/ByGayPRnpKq1bPJDukfCVypXcQEDErtd8MWhSRDSBx1seqqNWo5eFfPwp14hlAGiQ0b1bP6KmkueX8eyW2Swb7k/one1CMsh8jNPiEtL+g8rqbt//tmH69fPcjugNnm4AHcdhlM99yXOGCIhjUT+EAPROI4oasOas47jejQ7EIbjaHWHjBbJzykHuFcouc/FG5LtZu4Gu/ih3cS8AogWBzdiZBj4IixS0zxduIw6xDapNLmj9LrgNlBw06vtMX7xvpSkUz1pD1u2SNxvycZsMaPIEczIFZs+LP/miDF/XnLgvIBY6QiCB7UCpvM5JPSwqN21mBo95qHc8ektxZff5zsfOvNplbEB09nORIznd3/qdza5+BZL8+QstWsl7vCWP6UlqVKaxgpwg1L762qMo1upatfASnPz/GmQoXDjP/uErTUE80eENU1RHIA2WUz6VfPE8ycogpU5T/tEqbhV/6ijX1dujp5e+2gBc4BqZjxFsscwkNqmzo9sW9IlBiikLpZY2LpeNNGwsolVTKs9zAckTEEv+NANpj84h8fJen6HV+OK9vk/NDBuinJCncvxwpOSej9XXbKimFn7f+syOtQfMr1GpMIYy5MhCLuFxtVPojHzU78Vz8mVjPDHba+jCyWY5E+Xs079vfGqzHyIZ8du6IhEv67ZHb0KLpMCoCgZpg8UrRyajd7lyHtMTsuEKlB9r3hNvLblF4xABpVlMUYOEjWafxtgrrnVQxn7TzbI6OBojUGYSiIT1MlibN1Q9e9Vaxv7r7QbgKBbc3VPEnyspmVvdiWpbgABCdH97RH6BxHv9il1jD3sSrzODTQulRkvMHNA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(39830400003)(136003)(366004)(346002)(396003)(31686004)(2906002)(6506007)(53546011)(26005)(6512007)(4326008)(8676002)(66476007)(66556008)(66946007)(31696002)(5660300002)(86362001)(8936002)(36756003)(41300700001)(478600001)(966005)(83380400001)(38100700002)(316002)(6486002)(2616005)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3E2VmFvbVNmZHJmdkxqbjBxQThFcFN4YTF1OFl0cG5KTWJ5d2x2dGxhWE9t?=
 =?utf-8?B?c21PTTZJSXJMemxCN0VsOGhZU3ZDaTRvV0Y2WXNkeFJBSlIwU3RtZmxQM0Vv?=
 =?utf-8?B?MFhwa3YrYXlVODFvRnNFTzRoK3FkdTJ0aGpNTjJaNzlVYzBXTW9ZWmxHa2Fj?=
 =?utf-8?B?YjRKeSt3NTRLajhjNkNUd2pVOFErRXR6Z25qV3JXTmg4TDRwdHNFZzNqZTFJ?=
 =?utf-8?B?ZU9JNnlMMzQ5d1Q1c2Y2MkZHMXBFbzFxOUY1aGVPeVRFQVp1THBSeEhyb0RE?=
 =?utf-8?B?cDFRWFYyb1RrVzROUlQ0Q0RyaStpVC9vTlBmYTN3S0xpcm00dkhMc3ZlK2N2?=
 =?utf-8?B?dkpNcElCMllyZlFiTVNidVpvRE05Z3U4b1NFSEJEbmRKMDF3L2Nrb2VScEFn?=
 =?utf-8?B?VEtwbDJ0dGxDZnZXQmpJTVExK2JQRVNJRC8wNlE2Rmo0bHF1SUh4djc3T1Yr?=
 =?utf-8?B?YnNpcHJGRkg2YnhqRzJzc0k5bHNQQWljRVZJM3pidXB3ODNDNzludzV6N084?=
 =?utf-8?B?eXlPbmV5U1NxRDY5VUJUR2lHOEh2cTdoRVArZS9Cb2hxSzQwWkNpb21BYnpm?=
 =?utf-8?B?bFBhTU9zd2JmWERVWU81ays5Y2ZxZDZoMVd2a0VITDM0bTcxbDNKaDhFeXIv?=
 =?utf-8?B?WUJ4cUVMKzJya21jVklsV3JXUVNGdzZqRnJVMDFCUG1DWmVCcFIraWlJb2x6?=
 =?utf-8?B?VmFwS21BeXkwa05IMWhWamVpS0g4SUQ1bXFYTUd2MUNNMmJQUE0rSnF3byt3?=
 =?utf-8?B?K3VzakRzNWhCcGJUeWZVUzNiYXVSRkhmRU9mNy9lZnJJbXpTSUZvdjhKaDVO?=
 =?utf-8?B?OXp1SXNDbGZRemRLeTE3bWV0TWhxKzRXaFp1K1NIKytqOVJFanFzYm84dTB1?=
 =?utf-8?B?SEN4QmxtTitSRW12RUhVV2FXSmJRMnhYdzhCbHJKdFVVV1hjeW1sbFUrNXc4?=
 =?utf-8?B?bHZ1Z1NhZ1ptNXR0YjloQmVZVko4SnFwRkFQajI3ZzZHcEExNjNJNS9pNHV2?=
 =?utf-8?B?YmNMam9ZU1JkcUxRcXMwUWU5WjVuUWlOVURKL2M2cUFrck9vMUMyRFNRK0lP?=
 =?utf-8?B?RkRsTGNSZU1oeGMwMkoxdlVvaEVtaWYrUmtsVlhINFdHTHNCUllJbEhISGdl?=
 =?utf-8?B?Z3d2d2NaL0NpNzJ5NlB5Rk1nN2ZPaDZCNHJzMnZ0aFVFRTU1a2ZZRGViSnJZ?=
 =?utf-8?B?SUVTci9YVXh0a1JkNUJUbSsrRHNXVS9DSExwUngwRldaQ0hiMTNoT04rVG9q?=
 =?utf-8?B?bmRJSWJkNlRnNmRCeSs5TVJaMFNsNEp2MDIrdWpwSWJQSVdVY0tZWlBtSmU3?=
 =?utf-8?B?ellPQXFVTkc1MFNSUHl4YWgwRzgrWjdRVk15UVhML2lVR05VVlYwR1dneStn?=
 =?utf-8?B?QjliZWo5MjloalRCWEw1Ymp4cG01emFuM0lRRUk3bDJtNUM0VG1FY3AvTTBP?=
 =?utf-8?B?dzdsOVlWSnB4QTd3NldzQlJOSVRSOXBDcnlOWnNGZC9NWmRNQWpBdzk4cURy?=
 =?utf-8?B?NVF0VnRwNlNISWd4T0VqSS9xN3Y3a2ZzdVJtRnZKYjBLVEpLbitzN0pDdWYz?=
 =?utf-8?B?Y2ZZWThxU01JaE5Uc3ZUUFRpd09iZUF6MXFQY2RmRHVpZlk4SkpjMWhCQ3pD?=
 =?utf-8?B?OTZRZCsxUmpQaytCa1ZaYmFKTzd1dkxaNEZ3dWxMYzlFejd3SiswR2Y5K0Q3?=
 =?utf-8?B?bjBSZUhYbW5RcEF0RDBEdEt6emNJVDIxZkx5OHE3L1IxV1N2V2dNaTRaK3FE?=
 =?utf-8?B?dGc4RXMzMUo5UEEwMzRVMjhRcXR2dm50M05xdW5ZVWZGQUN3ell0UzR3U0dI?=
 =?utf-8?B?ZTBrNEl6U3RldWRmbERac0tDckxwb3JRRjhDTm12NG9WZDZjbUN6ZmpNT2gv?=
 =?utf-8?B?eTFzS3Y4YTlNK1N2S0c1c2dDcGFUblJONC9LQjhYK2M2VFl1M3luY3B3Qkdj?=
 =?utf-8?B?bDVqWGwvLzFjenIxQlFaVnpLd0wyd1poZU53NXVmTjNpVFFNYlo5TDJjQWdq?=
 =?utf-8?B?TXBwVGlOYkpYLzB2QzNWMTltTzBTSzRleTVSMzRYYm0xQU5ZNzNiTkJnN05i?=
 =?utf-8?B?dXRWTVovZzkwTStGa0t0YTJaS3lBTDZiMHRtZjA4VHRDaktHTGhLbTBub2JO?=
 =?utf-8?Q?I1iC2OQfnNJxxwztylHD4UBrz?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 52efe4c8-be3c-4903-65a0-08da90dbaadb
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 14:17:16.6651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7fvCfApE7/mWX5jOa53KGHH5wET/GDv0sY4dFLWUzWsxGr/lUW6q69xhvbU5mSO/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR02MB7888
X-Spam-Status: No, score=-6.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

2022-09-07 at 15:53, Eddie James wrote:
> 
> On 9/7/22 02:10, Peter Rosin wrote:
>> Hi!
>>
>> First off, I'm very sorry for being too busy and too unresponsive.
>>
>> 2022-09-06 at 22:28, Eddie James wrote:
>>> Use the new mux root operations to lock the root adapter while waiting for
>>> the reset to complete. I2C commands issued after the SI7020 is starting up
>>> or after reset can potentially upset the startup sequence. Therefore, the
>>> host needs to wait for the startup sequence to finish before issuing
>>> further I2C commands.
>>>
>>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>>> ---
>>>   drivers/iio/humidity/si7020.c | 16 ++++++++++++++--
>>>   1 file changed, 14 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/iio/humidity/si7020.c b/drivers/iio/humidity/si7020.c
>>> index ab6537f136ba..76ca7863f35b 100644
>>> --- a/drivers/iio/humidity/si7020.c
>>> +++ b/drivers/iio/humidity/si7020.c
>>> @@ -106,6 +106,7 @@ static const struct iio_info si7020_info = {
>>>   static int si7020_probe(struct i2c_client *client,
>>>               const struct i2c_device_id *id)
>>>   {
>>> +    struct i2c_adapter *root;
>>>       struct iio_dev *indio_dev;
>>>       struct i2c_client **data;
>>>       int ret;
>>> @@ -115,13 +116,24 @@ static int si7020_probe(struct i2c_client *client,
>>>                        I2C_FUNC_SMBUS_READ_WORD_DATA))
>>>           return -EOPNOTSUPP;
>>>   +    root = i2c_lock_select_bus(client->adapter);
>>> +    if (IS_ERR(root))
>>> +        return PTR_ERR(root);
>>> +
>>>       /* Reset device, loads default settings. */
>>> -    ret = i2c_smbus_write_byte(client, SI7020CMD_RESET);
>>> -    if (ret < 0)
>>> +    ret = __i2c_smbus_xfer(root, client->addr, client->flags,
>>> +                   I2C_SMBUS_WRITE, SI7020CMD_RESET,
>>> +                   I2C_SMBUS_BYTE, NULL);
>> I'd say that this is too ugly. We should not add stuff that basically
>> hides the actual xfer from the mux like this. That is too much of a
>> break in the abstraction.
> 
> 
> Hm, I guess I'm not sure I follow - I see several drivers that use the raw __i2c_smbus_xfer or __i2c_transfer, some without a lock in sight. If it's not acceptable to use the unlocked versions in some cases, why are they exported in the header file?

Doing unlocked xfers w/o manually doing the locking is a bug. If you are
aware of code doing this, please point them out!

Issuing an unlocked xfer on the same adapter that has been manually locked
has been a thing since forever. But issuing that xfer on the root adapter
"behind the back" of e.g. an address translator is simply not going to work
at all if it never sees the xfer and thus never gets a chance to modify it.
A mux might also in theory add quirks or adjust xfers for whatever reason,
and that possibility will be made impossible by hiding the xfer from the
mux.

> 
> 
>>
>> Looking back, expanding on the previous series [1] so that it installs
>> the hook on the root adapter, handles smbus xfers and clears out the
>> callback afterwards is much more sensible. No?
> 
> 
> Maybe so, though adding the callback is a more intrusive change, in my opinion, since every transfer has to check if the pointer is null.

The runtime cost will be negligible. The bigger cost is IMO the maintenance
overhead.

Cheers,
Peter

> 
> 
> Thanks for your feedback!
> 
> Eddie
> 
> 
> 
>>
>> Maybe the callback in that series should also include a reference to
>> the xfer that has just been done, so that the hook can potentially
>> discriminate and only do the delay for the key xfer. But maybe that's
>> overkill?
>>
>> Cheers,
>> Peter
>>
>> [1] https://lore.kernel.org/lkml/20220518204119.38943-1-eajames@linux.ibm.com/
>>
>>> +    if (ret < 0) {
>>> +        i2c_unlock_deselect_bus(client->adapter);
>>>           return ret;
>>> +    }
>>> +
>>>       /* Wait the maximum power-up time after software reset. */
>>>       msleep(15);
>>>   +    i2c_unlock_deselect_bus(client->adapter);
>>> +
>>>       indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
>>>       if (!indio_dev)
>>>           return -ENOMEM;
