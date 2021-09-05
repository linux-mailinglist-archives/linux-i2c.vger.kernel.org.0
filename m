Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FD3E401208
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Sep 2021 01:04:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232059AbhIEXFE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Sep 2021 19:05:04 -0400
Received: from mail-eopbgr130102.outbound.protection.outlook.com ([40.107.13.102]:10629
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231443AbhIEXFD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 5 Sep 2021 19:05:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d+gHx0IlS2vOlemJrdcbZ6cB0/Il4wjc+ArRZ3KPv2zlzhjVsLglsrMLaEdyRlJedeyFJs2NO+0CIMzvb4OlNNqmu2GY1CebJkw7GqvHIXW9U10sEhbG2npL8t/eNlzN/kkizkQ89a9JiS5XoqcD8OqJ9gZ6+4RvbsZ7DW5r3QFpadIVRlT0zF6LXad/GkLuixtjoOYJEXeeTiiz+epeRehpz1KajhcvwmszEYBKJrwIomJL98KDgic4G23mRhXNNQeEzJCiOXMHntWpNoRimcBwX7VMzwe2pu+AGYjcaAI3c9IvqPr9R5+NptEOyys0SFCcko43G9xDoDzKwCju6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=TbTNbhZx6QG4WUGyfjw5lWWmgCinZ/Ip/TTUFwsduas=;
 b=fmKNnZL4+xfxTMK0/pUAb668yCT0j1ZC4PfrdIK4N9eZ6hrh8BuMwTRyuPIA0GX4guzVMvgjFXwI8zBLgzu+YNSMRrLQFiO/25HZDdh+hy/jKEQLNEBj7QGT/SYGndMbE3osiCALYYrfvlt7Kk3SsZA3IOCJr+XRNMk8XmIuNwnYK9LfqBAnkpGmuHlKq034xBeBIgDWIWhLZxgX97ALZF/G3cOwxzZdhd0q7gGg+a3wTFsDTbp7ClDTlKni9NPelsOf9hI0+HPgmedRFWxQfnktmaEIIyVfMSAPf6eTazhi1pSTvNQj1X9RWUnjtewmO5qZ2VG2xvGm+x36bYKkKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TbTNbhZx6QG4WUGyfjw5lWWmgCinZ/Ip/TTUFwsduas=;
 b=Bnr+kghm/pbmg6nkbfRFHGTsAz1jKgPmuvp6KWHBThBKUDZ5KSBj7vkwqbxiwC1fhM5Q4OnEJOo/TRfq2zD/AC9zHxKZ1Xv5VtL7O1MsrLONOmIJN7GtD4KlN0x7sjyV+qatLiLTUINu0UNdEAZONkr4x5XJeDoy3/YNhZ/LePc=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB9PR02MB7306.eurprd02.prod.outlook.com (2603:10a6:10:240::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Sun, 5 Sep
 2021 23:03:56 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::35c9:1008:f5af:55a]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::35c9:1008:f5af:55a%4]) with mapi id 15.20.4478.025; Sun, 5 Sep 2021
 23:03:55 +0000
Subject: Re: [PATCH v3.1 2/3] iio: chemical: Add Senseair Sunrise 006-0-007
 driver
To:     Jonathan Cameron <jic23@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>
Cc:     Lars-Peter Clausen <lars@metafoo.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Matt Ranostay <matt.ranostay@konsulko.com>,
        Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>
References: <20210822184927.94673-3-jacopo@jmondi.org>
 <20210823073639.13688-1-jacopo@jmondi.org>
 <20210829175413.7ce30bfa@jic23-huawei>
 <20210830162051.rjqlhwvtguaivt3p@uno.localdomain>
 <20210830181117.6808f085@jic23-huawei>
 <20210831074011.d6f5rsix2mgxqba5@uno.localdomain>
 <20210905110429.34763e30@jic23-huawei>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <5e9dce02-2884-d91e-78ef-da2f32258ea3@axentia.se>
Date:   Mon, 6 Sep 2021 01:03:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210905110429.34763e30@jic23-huawei>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HE1P189CA0025.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::38)
 To DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (85.229.94.233) by HE1P189CA0025.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::38) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend Transport; Sun, 5 Sep 2021 23:03:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4fc0c01f-960a-4cac-a1af-08d970c16fd2
X-MS-TrafficTypeDiagnostic: DB9PR02MB7306:
X-Microsoft-Antispam-PRVS: <DB9PR02MB730642FF1DE23684F3DA28E4BCD19@DB9PR02MB7306.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +oAleGmzZmPZt7Kl2mdpLQ9auCaOxwyPG2Pu0JYXusHHxNldswMGmb9VbQBoSqB3tVZGOCjFcjq4y8CqOourx/b0U7uvC+lwLn399cSDjZB7rbt9ANyeKJCQSGpYqz3OdL8ezNYl3azCu4WU1wlSkQHemCoIXoZinUa1hVS2IOY+ndu5QqlN4n1Z8WnNVyoxl+BsRLC/4/PRxTmzfWg9Kr3rgQbWIRkNTZoqMjS39vQRlkeZheG+LxRDsY94M4hNNsCCgnBzcvd2Sd40CjiPK4P5VRc45ZdfA0uh/JY5JR3+cr1M5XfX1EEnnISophVJIur+8YX74mMBJSrCqqWkBmv7PXsVNqgO8tBEwVoWq/gO9TezdhUFdQJd4sQX2au+bFiWjujUIjj0P9pSw+vhvSHeUIbCtEK0yD+ey3mNnbzb2WK9i7oT4QhtJxqhlklqtGc2pVS1ScyLtC9ErJ8SNq/ieJHjK6IAPUdNIQ8WXL/yAUfyoVI33THZJZS1Z41DRxql+FMDdji1AGkSPMIEZn41emGqeLWFfUw72W7LG39Z5VmYpSnIwdwcLNZ2W7M/NKxd/zjRBSeOGR8mLo62C/Zde+QJ+mmaMwPWKUwtI186+6DFRvDKCYGetdehZPJQ2ris5KqU0YtYsf3IwdouFYzU5jj/a+W8GJe7Qn7JEmxEb2lpU7eAav2mSYl3khf229k+4I6N4FBATysw4H7SK9/bR3ApjmKYJV3tHrrBaj3s+wRuVe9uiBMkA5VFn/KWsbkOQWiXrw5/P0YwpKCNwupOLEnEcAaGGyksnetnJ6NQfyVjVtlSVrzmGgiLxVqv
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39830400003)(366004)(376002)(396003)(346002)(4326008)(26005)(16576012)(316002)(956004)(478600001)(31696002)(54906003)(6486002)(5660300002)(110136005)(83380400001)(8676002)(66476007)(38100700002)(53546011)(36756003)(31686004)(2906002)(36916002)(66556008)(66946007)(86362001)(966005)(186003)(8936002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzZPbXZyVUo2VlF0TkYvaXhaWXFZYlNnb2Y4eFZ2bldMSXlKVHNyb1hZZUxX?=
 =?utf-8?B?Y3A2KzhMa0FZbW1PTDVpMGZLRDJWdDBlY1ZINnpZN0hSSEFZbnAySmUyUVVl?=
 =?utf-8?B?eCs5LzRCOWI4dkVvZjZWN1FCVk01R1BzanBUSE1wNlc2cmVHQzRtZmxsdUFO?=
 =?utf-8?B?a2lOMXVJV2NkS09PU1pGY25iWWtqaG1yTzBUSTdOdUlUQldQeG56UkEycjdO?=
 =?utf-8?B?dy9HM1RZZk5LV0h1RmV1bmo0eUk2V3VKMTdpZXB0N3F5YmVpa3pOTXkzWFpv?=
 =?utf-8?B?TjFIbkxEOXFPenpCT0JnMkR3eHZTazdTaW40bkVvZ3hqelp2UHhveHR4YXU4?=
 =?utf-8?B?YldXcnZjenVXaE04QkZ3QlZ1eWVJeHdYcGliRlV3SlpJZGJKSjJGbDNGalZV?=
 =?utf-8?B?K0I0eDlPS1RzVHlzempQK0VNZWxpYi9pTmthN3o3TTA2bnhuQUhWczlFeFA2?=
 =?utf-8?B?WWF4UHd3UkhFRE5EZEVSSDN6NFJmTlZCS29NcEVMeW9DZmc1Y0lROVhmS3ZW?=
 =?utf-8?B?eWM1L1dFdTVDeDhjemZCbDdVbTh4WHhkQWk1ZVRGeWo0QldvZXAzZXB3bUJY?=
 =?utf-8?B?d3Zhd0ZLYVIzQi9CZjBBTU54RXRsYkNoU1hhcmdXTThTdTFXQmVWTnh5ZUtI?=
 =?utf-8?B?TTRNTjdMMkJCYzlUeXdaZ2JwdHJkb1ZXZXYxQldvQmxNL2ljOXRaanduUm1h?=
 =?utf-8?B?L1N3Ujc4SnNpN01Qa1g4ZVVoSmE4ZHRaZDZNcnlyVktoSFV1WWlkUGhoNmpo?=
 =?utf-8?B?Z28rSzhlaTNkWTlHZnIrV055UjBHemlRemVDQ0UvMlVMS0VYb2tYWTErQ0xC?=
 =?utf-8?B?d08yOE92N09SdUJLc0tXakk4eHNRb0pMam9OV2xqNmhjaTNCN0pDQUpac1d2?=
 =?utf-8?B?V08rSWFLU2lNdVJYVWgyTGltMFRjU3RzWEFPY1Vjc0NGSGVCL3NLTVNwRHFS?=
 =?utf-8?B?SkdLVU5XYm1WKy9qNnlMQ1hpb2poNDBENld6cnVqam1SdjBQMWNKYW1TcHJG?=
 =?utf-8?B?NjVET1h5QytvRy9lQzlTWE44WEJGSXRtb25WNHdHQ3BiUzE2Um01UnQxZjVH?=
 =?utf-8?B?M0VMbGViYUhMWXZQTk1ocTdJV0o4N3cvUENXeEVpZTRWeFIrd3ZQUzdqSGtJ?=
 =?utf-8?B?RTRTUWdSZTBXZ2luMmdNaUpHVTA5SDdmdHFVNE1qb1lmT3dYOFBEZUFsUUNI?=
 =?utf-8?B?WVR4MjE0K25Sb05RTVFxd05QUEtvL21TeCttcVdmaGpDL0gyOVVvaTJNWjU0?=
 =?utf-8?B?ZG4vRmdFWGZqcXRsUjB3aDJ2aWdzb0dNTUZZVmVCYWw0WDNBVWpkYmlFa2px?=
 =?utf-8?B?Zmtpc29GN1lzRzFzM3VYSE9WM3hHcENEN2JIcll1cmpWTGQ0UTU1UjJoaGVU?=
 =?utf-8?B?L1VaZHlObG5UaEh6bzBEUURXNFQwdFl3eVFZMzJBTjRZcDlzaEhCeXpiRTI5?=
 =?utf-8?B?UE5OZlRmb25wcEFxTTBZYTJMTGtyUVBSKzBXN2xMWFJxQ2hubHJ2VjZUYkRk?=
 =?utf-8?B?c2QvS2FFb2dwTlJDRi9wMDY4UUw1MkI0a1RldWs4UkkzcnRZTitWSGdkdmFT?=
 =?utf-8?B?MldFMllxYU5GK09MTHl2M3RmbCt6Mjc3dklpZ0lpaTlCM1FMaFU5Ymk2N0VP?=
 =?utf-8?B?VGZ0WmtlRU1aMEZBakMwbmpuT2lyYUhVYmpVNUw0aGI4YThRMW9BVjFrcUlF?=
 =?utf-8?B?UnhseGNZdG5jNUpkSlM1bUErVW9nbW5mNmM1NnZvZngrM2Y0dlFHeTMzN0Fh?=
 =?utf-8?Q?29unTu4hBTcv9zFlS0tCLPXnGoqivrqhdUsrtye?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fc0c01f-960a-4cac-a1af-08d970c16fd2
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2021 23:03:55.8968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +WEKp/kMj2ons6kdZN4AbGv7s8Sq8AQ6YlMA2NheB7YdvBH+iGTyCQI4nm9ZI1cH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB7306
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2021-09-05 12:04, Jonathan Cameron wrote:
> On Tue, 31 Aug 2021 09:40:11 +0200
> Jacopo Mondi <jacopo@jmondi.org> wrote:
> 
>> Hi Jonathan,
>>    two more clarification requests, sorry to bother :)
> No problem.  First one: No idea +CC wolfram and i2c list.
>>
>> On Mon, Aug 30, 2021 at 06:11:17PM +0100, Jonathan Cameron wrote:
>>> On Mon, 30 Aug 2021 18:20:51 +0200  
>>>>>> +static int sunrise_write_word(struct sunrise_dev *sunrise, u8 reg, u16 data)
>>>>>> +{
>>>>>> +	__be16 be_data = cpu_to_be16(data);
>>>>>> +	int ret;
>>>>>> +
>>>>>> +	sunrise_wakeup(sunrise);  
>>>>>
>>>>> Hmm. Technically there isn't anything stopping another user of the i2c bus sneaking in
>>>>> between the wakeup and the following command.  That would make the device going back
>>>>> to sleep a lot more likely.  I can't off the top of my head remember if regmap lets
>>>>> you lock the bus.  If not, you'll have to use the underlying i2c bus locking functions.
>>>>> https://elixir.bootlin.com/linux/latest/source/drivers/iio/temperature/mlx90614.c#L432
>>>>> gives an example.  
>>>>
>>>> Right, there might be another call stealing the wakeup session!
>>>>
>>>> I should lock the underlying i2c bus, probably not root adapter like
>>>> mlx90614 does but only the segment.  
>>>
>>> Ideally only segment as you say as could be some muxes involved.  
>>
>> If not that i2c_smbus_xfer() which is called by my wakeup and by the
>> regmap_smbus_* calls tries to lock the segment as well, so we deadlock :)
>>
>> And actually, locking the underlying i2c segment seems even too
>> strict, what we have to guarantee is that no other read/write function
>> call from this driver interrupts a [wakeup-trasactions] sequence.
>>
>> Wouldn't it be better if I handle that with a dedicated mutex ?
> 
> I'm not sure what best route is. +CC Wolfram, Peter and linux-i2c.
> 
> Short story here is we have a device which autonomously goes to sleep.
> Datasheet suggests waking it up with a failed xfer followed by what we
> actually want to do (sufficiently quickly).
> 
> Obviously we can't actually guarantee that will ever happen but it's a lot
> more likely to succeed if we briefly stop anything else using he i2c bus.
> 
> How should we handle this?

The way I read this is that interactions with other I2C devices that squeeze
in are not a fundamental problem. Not unless there are so many of these 3rd
party xfers that the device times out again. If my assessment is correct,
then I would suggest handling this in the driver by somehow making sure that
it doesn't clobber its own pairs of wakeup+work interactions. But see below.

Because there really is no way to protect against those extra I2C accesses.
With a parent-locked mux you can (ignoring arbitrators, where another
system may possibly take over the bus if too much time is spent between
two xfers that were supposed to be adjacent). But if there's a mux-locked
mux in the path it's simply not possible to lock out all other xfers on
the root adapter.

With a parent-locked I2C tree, "locking the segment" is equivalent to
locking everything all the way to the root adapter. But the whole point
of mux-locked muxes is that they can't operate if you do that. Mux-locked
muxes are allowed to depend on other (ignorant) drivers using other parts
of the I2C tree while the segment is locked. If you lock the root adapter
when there is a mux-locked mux involved, you simply kill that property
and sign up for a deadlock. Which also means that you cannot prevent 3rd
party xfers to other parts of the I2C tree.

However, if you worry about 3rd party xfers causing the wakeup to timeout
again and that only handling it in the driver as suggested above is
insufficient, then it's an option to lock the segment. For parent-locked I2C
trees, this should prevent (most) 3rd party actions and minimize the delay.
In the odd case that there are mux-locked muxes involved, there will simply
be a higher risk of failure, but there is little to do about that.

See Documentation/i2c/i2c-topology.rst for some discussion on the details
of mux-locked and parent-locked muxes.

I hope I make at least some sense...

Cheers,
Peter
