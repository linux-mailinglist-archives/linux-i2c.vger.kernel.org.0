Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CC1E5B0EBB
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Sep 2022 22:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229871AbiIGU63 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Sep 2022 16:58:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbiIGU62 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Sep 2022 16:58:28 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70132.outbound.protection.outlook.com [40.107.7.132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AE99AEDB7;
        Wed,  7 Sep 2022 13:58:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FVSqgyG7FqoCgWvIExBFkaHD/XJGF4ZP4zlD1BT7P38fLCkSifZ86zHQzjJOCazlXrbjb38bxn6Yv3ocPlrUQ0HEsmY29Ta3wq9LxZyLaHFbN7DXDly0e+R0UQCoXxdqI+IE+rHzfIrpw/5F2ocB/fzFrqAARXO6qCC7dI0rqchAUhJjSLw+tVc+2+Fi7AlJthBt+TlfD10MnVfM3lWV/1wwhk3PDG/z+zQ2mAgY08Ylj/UzSBFIY2vasNUIWrJ6ivA5uj87Gg9rFLsBvwpn14h+zMdHxB78JR4VGBt1+2nIvGSMzigPUN9pMfyels0tIOeSjLAAVz569mHMkQ1tYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7LH2QrWM62wY5TBcm0TsFLXJwIB2ANq+4DIv/Jo9WQ0=;
 b=KCs61dI0uxslBo0tbDJl4f3cn66XMlvgPhUc1IEPulhWaaeGpLJFOiSDmS4v+3zW3fAmWswkIWecPlL8Ke2G/ctV2YueujCtjO12183DlEcEihKZt2mtDPdLUYTLhv3hzXkaepm5lZzY/vJ9t04uEXiQILCgBbZIWF2ABvGSSS/SKtiDtkcVqQ7cIh4z+1ffYZKNxclxZg+SFqYjwsSUBOmidfEvRdtI5O8yi9hmwDP9wI7l6bwqvUKT7Do/ZYezx6omCzLRzGa47FwGua361RSmnI6LhFOgA4lzC/bc5SlyB2QYbJ4qJCke4ywEJNL+jIPCIZAdrDDzmGOPWJSGwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7LH2QrWM62wY5TBcm0TsFLXJwIB2ANq+4DIv/Jo9WQ0=;
 b=doe6qU2Y0RSvwEGBDVZMH6BAj8t4HtJff9FCTNKTFgN8sz+QDPBgYf/Hp49+C2YC0r42L+Ll1cWMNrI9q+rgLMMot5GrQ00LGIZJwoFlhFAUJTOsLJ4iJyAvQW1pcyUlMYqMUNFEEQZC6Zba60Yso5vOs95CgslOh0rTj7oF6m4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by AS4PR02MB8768.eurprd02.prod.outlook.com (2603:10a6:20b:580::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Wed, 7 Sep
 2022 20:58:24 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::1d88:3306:c280:3179]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::1d88:3306:c280:3179%6]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 20:58:24 +0000
Message-ID: <19c15068-35ca-de7d-3d3f-56c60cd5b498@axentia.se>
Date:   Wed, 7 Sep 2022 22:58:22 +0200
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
 <1ba9cf9d-2980-974f-e9a5-ea53e1915d45@axentia.se>
 <9374c411-c8c5-41ff-5c66-ff997c502426@linux.ibm.com>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <9374c411-c8c5-41ff-5c66-ff997c502426@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MM0P280CA0018.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:a::32) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 540d9c8f-92f5-4e54-1cbe-08da9113b47b
X-MS-TrafficTypeDiagnostic: AS4PR02MB8768:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: St2JJjdIxyHEXGJO6utSX/duQr5wxASVoNOdoJbr/y84+WnbKazUY0gseWwGFbpygridgeOCW4qQDpA6Z9vS7FwVmpqqKoKwf4rOLsNZNZeoUgs+mQXo4L3grmPKS8nzxki5TRU5HzmNnNqiNvxShm8V59ymhYx7pgv8QGeXl4clXwGlZH018qFpMUIwmQ4BY65GpT7h9ZGpchoRhgehXVxSUZs5ADodhBoOYHX9ErqBFAT7x8zLslEyTB34DuLy5u8lutA4ApqLsExjXWgncFB0sbTI5L9AwjBWP1CyiKyfpEkstus4JwAdIzJwEHF8/hm+8ajdvhotE2/vgqrxHsdoH2bHKWXOgqmlHj6yW0Iz49D0Hz3oJZBluIAzkFKp69Dbs51j7a0ePhixPc5h1ceVAjYQJ1tFz3ZpEV9tN2JMtLwZaChiKSEuFxDJVUVBM7lmFlTGRGN3UGkYkt0WyF4TjTgWaxoodFqlDwl1lGGl9gk8eZ1RQHrFRjA9Ro6EEdigI94m/ACLzCOiyj2IIi83yd5NrfivWXrlMa1f8CW9KqDdU9Nk8GTxH8bydjzr2rkdGpNWtKO+yYFakISXq/sO6wlB3Z3VwHce7fehx1JVFsVpqae0DYO3M3mb76c9Q6pQiG9mTRcmUOheXhTA3E+QDHSTxp2JSDguNcraQTTzpH4YnUKOACjypuSzhIuAF2psCvRwIpy4GDqT828fm8KXwtjpLQ5G/PoUkuVX3Zkp61kv8LyPZjxnjMCjEqW/A+fU3nN/3bPv4O6lRYS5kbtnqiD03zRX7NtP1vbv95eZel6XFK/JBZXlV7cWSExI
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(346002)(39830400003)(376002)(136003)(396003)(2906002)(6506007)(26005)(478600001)(966005)(2616005)(83380400001)(53546011)(316002)(186003)(5660300002)(41300700001)(6486002)(6512007)(86362001)(31686004)(8676002)(66476007)(4326008)(66556008)(31696002)(36756003)(66946007)(8936002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azRCWlVjV0Z4cDFCM1d1dmlNaVRSdGJtM1pRcXduSDZNcVlibWpXczZMUDlS?=
 =?utf-8?B?aFdpeFRkcE5POG5zdnJCcUVRNkZ0Y2FpY3E4SHR2NC9va2oxaUorcXNJam1i?=
 =?utf-8?B?RmIyUzViWWFWcTB5K1RPVUdVZlZoRi80Z2w4ZmgxRzZlS2crODVaeU44bllJ?=
 =?utf-8?B?OGN1MDhBeUFHNzdTYTZpQzRtL3lDWkxvTzNWY2k0OEdiaHVieGpKWWlCNnY3?=
 =?utf-8?B?U05rS1RzMlBRcUd1VWt2TVYzNDk0R3loQlpqL3c5Qm5iYVFOeGFhclJ3THFW?=
 =?utf-8?B?UEt6YUpadEtmb0ZRdE9jT3hrQ0dpTGpjVFN1NGc3a0d4Y2xqNlRGVTVVejBB?=
 =?utf-8?B?blBjeUF2bFRUN2VwTHE4K1h2V2t4VGN5VGdpK2VDYXdJaDBWVWtMR2FGeXNP?=
 =?utf-8?B?cDNVZUsvTUR6QWpQRFNmamczcXMzeGE4MVpEOE9HS0w3Q1N5VnpaRFlsdmQ0?=
 =?utf-8?B?a2dHcG9ZYVFldmYvOVd2eGhNUmlZa1c4NThJR0dBVUUvbUJtVTY5WitOc2Nq?=
 =?utf-8?B?SzZ6UW9IVGVFU0xYWGZ6K1NUc09TOGs4ZjVqZFdycFF4bUZhT1I4bmxvWStR?=
 =?utf-8?B?NEdHd2F5b3NKclVMdVRTdnUwaENEWDRqczcxU2ZONGc1Z0g1d1NadVA4V3RB?=
 =?utf-8?B?UGMvU3ZBMm5NUlhhSVFaU2tJV21YZEdCQzYxMnFzSWp5L2diWUFBODl4dGg3?=
 =?utf-8?B?bEt0YXhvNHo2TFlwWHVyTmlOcERRRnJ0V2FtY1dLQXdwY2paUUJVVk12UzRm?=
 =?utf-8?B?MlgrQ0hmajh2U1pqQ1dZS2x5ZlhhK0VaTkp4bWRKTDBFcWd3WGdySjA0M0hw?=
 =?utf-8?B?SCtLSC9IbWdvTytQbW14c1RvVWNENk85NHJEamUxSENJWGp4bjQxd3RQL2oz?=
 =?utf-8?B?Qjk3OVI2czEwOStndnkvVjUzVHJqRlZpVDBZV1lHR1BZVGtPQzFhSGdiNXc2?=
 =?utf-8?B?NzRrNkFHVm5NelFOMnlvMmRneXlxVHB1LzJYcTdFNW1KQnlxMUMvNjJzSm5F?=
 =?utf-8?B?YUE1dmxsRExseUx5bGZpR29Gc1U4NnNMcUJlZ2U0OTE5NXNVa0hGUzhpV2Fx?=
 =?utf-8?B?KzFaYTVNSC9kL0JEZVhQcVRncWVuZE1hc1lBbEd4dWNCUkdSNEtnNlYwYXZz?=
 =?utf-8?B?MmFpVW53eDRrV3NoT2lIdXNua3p6aTRQcWpKL2VSdFdPTU5OVW90b3c4dkhL?=
 =?utf-8?B?cXg4cy80MzR0em1zVmlveCtpWSsrNVB6MFByaFJ3R0FsYzJHK1ZQNDdhNFpw?=
 =?utf-8?B?Y3liMUtsVnBGZ2psdzdwVTRuUFgrYWg1WjRIRnlRNXZFTHhnOCtnUEdrOUEx?=
 =?utf-8?B?aVZhVEpldERrMHlWYWNPN0ZxSVVTV2pUdkU0b295c3pCalM0NWt0WWt6Y1dY?=
 =?utf-8?B?Ym5xOUVZdUcwVUZ6d1prVGxzRjVJbFVwSUZHVVJWZmF3QzRlNGVZQVRVdjIr?=
 =?utf-8?B?WHliV2JUQTdudXJNNkR4WHRpMllKUWlMK2N1THBUSW5zWVJsQTJVT0hUaklH?=
 =?utf-8?B?eUpUZ043ODFnYURTWU5jSDFUZ1hFQlUrenJrOU01a2JIT3loN0U3WkFVQ0o5?=
 =?utf-8?B?aWJ4RWpoNUJQWHBUYW1GV2ZQaXBkdkI1bTBoSGlNKy9UeHppbzZ6Um1GRldx?=
 =?utf-8?B?MlFRTks0NThaQkI2U1ZYNERuNzczR0ZTZStiUnh6S0FzK3NhditFeUVPVUtD?=
 =?utf-8?B?b3RvNU1QNk9GMmlNWHJMT0ZpaDFwQUVBdXMra1BaNGJGbHFZU0FjdkhzYjE0?=
 =?utf-8?B?VGNicnFqRUg5bVdmVXkrVHFFSUh2eWdDa0RIbVNvTkRpRTQvSnJqUVZrMjgv?=
 =?utf-8?B?VEV2UldmbTF0RHlaZ0podXQ1UVEzUDQvM0lhVkV2aVJQcWZqZm8xYmJBWFhL?=
 =?utf-8?B?T016S24zekNTVWczK3dTbHljeldTQUpmcVJwRHdTdk1zeURsYTNONXdlM0x2?=
 =?utf-8?B?UUk2WkVqMVliUE9JZFVKdHp3Zi9mMHVQbHpaeDFScTlzaUFjcUN3MWUwcCs1?=
 =?utf-8?B?NjlZVEFiNElOV3krTHU2c1dLMkFUanN2YlVHYkV5allUNDB6a01pdXZtNFhV?=
 =?utf-8?B?TVhMeW01OE1kRkFISXpqYjg1bjZEUzRpcmZaa1psbjI3a2VQYnZPWEkyb0Fm?=
 =?utf-8?Q?0hq3UIaEsDwSg9JdyKfF2RRPS?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 540d9c8f-92f5-4e54-1cbe-08da9113b47b
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 20:58:24.6282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TFPmnQnn6t74r16yD3/Hibhlzr+fTG2fhe6/5GymFgL+PsKkQ223zWCcV4gojm1f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR02MB8768
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

2022-09-07 at 18:02, Eddie James wrote:
> 
> On 9/7/22 09:17, Peter Rosin wrote:
>> Hi!
>>
>> 2022-09-07 at 15:53, Eddie James wrote:
>>> On 9/7/22 02:10, Peter Rosin wrote:
>>>> Hi!
>>>>
>>>> First off, I'm very sorry for being too busy and too unresponsive.
>>>>
>>>> 2022-09-06 at 22:28, Eddie James wrote:
>>>>> Use the new mux root operations to lock the root adapter while waiting for
>>>>> the reset to complete. I2C commands issued after the SI7020 is starting up
>>>>> or after reset can potentially upset the startup sequence. Therefore, the
>>>>> host needs to wait for the startup sequence to finish before issuing
>>>>> further I2C commands.
>>>>>
>>>>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>>>>> ---
>>>>>    drivers/iio/humidity/si7020.c | 16 ++++++++++++++--
>>>>>    1 file changed, 14 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/iio/humidity/si7020.c b/drivers/iio/humidity/si7020.c
>>>>> index ab6537f136ba..76ca7863f35b 100644
>>>>> --- a/drivers/iio/humidity/si7020.c
>>>>> +++ b/drivers/iio/humidity/si7020.c
>>>>> @@ -106,6 +106,7 @@ static const struct iio_info si7020_info = {
>>>>>    static int si7020_probe(struct i2c_client *client,
>>>>>                const struct i2c_device_id *id)
>>>>>    {
>>>>> +    struct i2c_adapter *root;
>>>>>        struct iio_dev *indio_dev;
>>>>>        struct i2c_client **data;
>>>>>        int ret;
>>>>> @@ -115,13 +116,24 @@ static int si7020_probe(struct i2c_client *client,
>>>>>                         I2C_FUNC_SMBUS_READ_WORD_DATA))
>>>>>            return -EOPNOTSUPP;
>>>>>    +    root = i2c_lock_select_bus(client->adapter);
>>>>> +    if (IS_ERR(root))
>>>>> +        return PTR_ERR(root);
>>>>> +
>>>>>        /* Reset device, loads default settings. */
>>>>> -    ret = i2c_smbus_write_byte(client, SI7020CMD_RESET);
>>>>> -    if (ret < 0)
>>>>> +    ret = __i2c_smbus_xfer(root, client->addr, client->flags,
>>>>> +                   I2C_SMBUS_WRITE, SI7020CMD_RESET,
>>>>> +                   I2C_SMBUS_BYTE, NULL);
>>>> I'd say that this is too ugly. We should not add stuff that basically
>>>> hides the actual xfer from the mux like this. That is too much of a
>>>> break in the abstraction.
>>>
>>> Hm, I guess I'm not sure I follow - I see several drivers that use the raw __i2c_smbus_xfer or __i2c_transfer, some without a lock in sight. If it's not acceptable to use the unlocked versions in some cases, why are they exported in the header file?
>> Doing unlocked xfers w/o manually doing the locking is a bug. If you are
>> aware of code doing this, please point them out!
> 
> 
> Ah, I just meant the lock wasn't right next to the transfer call, since I didn't fully understand you. I'm sure everything is being locked correctly.
> 
> 
>>
>> Issuing an unlocked xfer on the same adapter that has been manually locked
>> has been a thing since forever. But issuing that xfer on the root adapter
>> "behind the back" of e.g. an address translator is simply not going to work
>> at all if it never sees the xfer and thus never gets a chance to modify it.
>> A mux might also in theory add quirks or adjust xfers for whatever reason,
>> and that possibility will be made impossible by hiding the xfer from the
>> mux.
> 
> 
> OK, I see what you're saying. But that's what lock_select does, it locks the bus and goes through the mux channel selection function. With the way muxes work right now, they can't modify the xfer at all, they just deselect/select channels. So this code should work fine, unless I'm still misunderstanding something.
> 
> I do see your point about a possible enhancement of the mux interface... I guess I'd argue that whoever wants to do that should have to worry about it! But if you're firm on this, I'll try the other way. I'll also mention we (IBM/OpenBMC) has been running this series on lab systems for a couple of months now, so it has some testing, though admittedly with just one configuration of device/mux/adapter.
> 

Good, thanks, because I do not like how the approach in this series paints us
into a corner, making e.g. the address translation series much more difficult:

https://lore.kernel.org/linux-media/20190723203723.11730-3-luca@lucaceresoli.net/

Cheers,
Peter

> 
> Thanks!
> 
> Eddie
> 
> 
>>>
>>>> Looking back, expanding on the previous series [1] so that it installs
>>>> the hook on the root adapter, handles smbus xfers and clears out the
>>>> callback afterwards is much more sensible. No?
>>>
>>> Maybe so, though adding the callback is a more intrusive change, in my opinion, since every transfer has to check if the pointer is null.
>> The runtime cost will be negligible. The bigger cost is IMO the maintenance
>> overhead.
>>
>> Cheers,
>> Peter
>>
>>>
>>> Thanks for your feedback!
>>>
>>> Eddie
>>>
>>>
>>>
>>>> Maybe the callback in that series should also include a reference to
>>>> the xfer that has just been done, so that the hook can potentially
>>>> discriminate and only do the delay for the key xfer. But maybe that's
>>>> overkill?
>>>>
>>>> Cheers,
>>>> Peter
>>>>
>>>> [1] https://lore.kernel.org/lkml/20220518204119.38943-1-eajames@linux.ibm.com/
>>>>
>>>>> +    if (ret < 0) {
>>>>> +        i2c_unlock_deselect_bus(client->adapter);
>>>>>            return ret;
>>>>> +    }
>>>>> +
>>>>>        /* Wait the maximum power-up time after software reset. */
>>>>>        msleep(15);
>>>>>    +    i2c_unlock_deselect_bus(client->adapter);
>>>>> +
>>>>>        indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
>>>>>        if (!indio_dev)
>>>>>            return -ENOMEM;
