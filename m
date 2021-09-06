Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 430B24016AA
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Sep 2021 08:56:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239783AbhIFG5V (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Sep 2021 02:57:21 -0400
Received: from mail-eopbgr130107.outbound.protection.outlook.com ([40.107.13.107]:19329
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239629AbhIFG5U (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 6 Sep 2021 02:57:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dyNIcP8Cr47jSJlctw011r7mDYpza8WCgVHU+ybjS0LxEweaDurL+JJ4gCypHINty0DWPIgHVJTQKLkD57/Uv21eGMRlL2N81QcWTIzLfQ9j3DTYc4eHm7AOZGwU2upRZM0BiI0gKHNGcExg2hTKfMhz1+7Or1TK/Sll5pAynfJLJlMSGBFsCtD9k9XUkxx5+fF1pFNlMzZ03JAGZKR4wu9Uq2Q6dW+r2D8XOT/7UE30v2x9JVE5/k+swINm5oFGwyWNN0VzTRF7Judzv31aLof/brIEE6X1C/nY4Hae0tb0gMjA5ES13Heg9slX2XIUcJpyQd6BdkM/I5PjfeN6pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Sa6q0Qwv0+wvikGUpqwvcr2yirxDNQvQCh/2JbC2fHI=;
 b=Ga/l7GeE2iIFiO73M3VWrhi/mv7FiBxsti1KdPZUgdp93CowEHuVYU3aA/RYqDzAFFj7loDIxAh1ti7apKRM9JC0kYgamNKssL9zEuOtS3z+Vaj38ICriYVwEz199ErybHAMI6T/U2JJf5mrXDpsAwkdcizW5l5WqPV2FtRFPVvVLUoVhA0teLbXcqWQsP++BOFBBiP47ajvstr1yeQt0NMJFkGN3ce6hIjvWllJCGhlgfnftGmX/b6zSp/Un+WqYdpsQk7QFmHGvLhM8PpBCae4L1QfrnQjU6MxXwl1p2B7FhfGhHTYL6XByy6mLREE8yxX5xFL/ON5nu0b6vW+YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sa6q0Qwv0+wvikGUpqwvcr2yirxDNQvQCh/2JbC2fHI=;
 b=im1mR4zTIAXn3gLGbC+20942cn8Brrs31M7KNpukaCAWvdj5TYNICRpAdM6U2xRDuvL+D2iJBwEBGHsJ2IM7oYdjWsrBSuVbFBG2eSfvpP8Z6ZUXgGnIPurH/Au1jFk+SnMfm/vT0mHtLbdxLKdixb37Lc0AHh3o6VIkFTLpa1E=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DBAPR02MB6248.eurprd02.prod.outlook.com (2603:10a6:10:17e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Mon, 6 Sep
 2021 06:56:13 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::35c9:1008:f5af:55a]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::35c9:1008:f5af:55a%4]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 06:56:13 +0000
Subject: Re: [PATCH v3.1 2/3] iio: chemical: Add Senseair Sunrise 006-0-007
 driver
From:   Peter Rosin <peda@axentia.se>
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
 <5e9dce02-2884-d91e-78ef-da2f32258ea3@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <02f30a94-4b37-fb7a-da7f-d557fb22b431@axentia.se>
Date:   Mon, 6 Sep 2021 08:56:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <5e9dce02-2884-d91e-78ef-da2f32258ea3@axentia.se>
Content-Type: text/plain; charset=utf-8
Content-Language: sv-SE
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HE1PR0502CA0003.eurprd05.prod.outlook.com
 (2603:10a6:3:e3::13) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (85.229.94.233) by HE1PR0502CA0003.eurprd05.prod.outlook.com (2603:10a6:3:e3::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17 via Frontend Transport; Mon, 6 Sep 2021 06:56:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 826af44b-8fd1-4f60-ca91-08d971036a2d
X-MS-TrafficTypeDiagnostic: DBAPR02MB6248:
X-Microsoft-Antispam-PRVS: <DBAPR02MB6248475B89342F61E50FFE7CBCD29@DBAPR02MB6248.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jHU6PxY0nYc7qSxaHCOjOaeOuGHllGg/o3XUX/NTXoyUuSQ6BMxUUJybiTD4+sPm+1OBNp0ctWga17QEgKJ85BD6i8VKaQ5HBedxSsEgSDAgAaQ7pteyGGpKu/9/xSlxAP280UhNyynyly1tZiPJ76BRfr4qQr+jelu/qLK1t8b7XFz0GtbgPxw36P0kz3N3NwqNqhztwRnd0w8DeAYyu/LTbbl3B+EcK7GLDbluegfx/EyFddzcKOgiLimtj4I9HS+Hf4b3w+Z7ZVPIMSySzcE7EyXZExI+5kqB3rG7B6Zr8ZsXRQaTEf0kHi5u/e9x1KupFFLOVkWseSZczykaaijY8UEX9z1bjLz+uCMACRzxOFCODARV9DDs8dEQ2b3jUtDNtloby9w3xKhWswoVgdHuac972cM85Eu+7M/wpupqtI7JuMulvY66d0Yo59Yr2+eHTwnlFIycnsmmyUwC8/lgrkollRYQeIOz9mKqX0vkYYiVwgx66rMNmQKfb7yW0IvL1DMlSJpa0PoGiKaITPn4MoHDBPikNOkpbJ0WohikKUX4v+OMXCVtnEC52QevJgbD35x047XURC4F9H47YyUpM7XA/yspLebgokWv+MOw1hLnh0HJZIyZ39C+0jTyYHFAiaCcW+HD0CHDBTeNqj0W7vd+8eEKETJI3CMe35uhM0SL5MwEqwgcR3ygQnYaIO7W3pAgaZMUeqz9tStmxVZbq/ejYxaFHXKUqOAmZy3CmMRmpVW+QQGmAD8mqA3ksqkDClyVS+QcC8TYj5xD6jgq2mWAAlcftwez8XKsKWSEgto4/WBgOBp7epNRbssB
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(39830400003)(396003)(376002)(346002)(366004)(136003)(53546011)(110136005)(54906003)(86362001)(66476007)(38100700002)(66946007)(8936002)(6486002)(83380400001)(5660300002)(4326008)(36916002)(36756003)(8676002)(2906002)(66556008)(2616005)(956004)(316002)(16576012)(478600001)(186003)(966005)(26005)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1pBbHJSVWlWWGZKbkF2d0V5L0FkQ09xR2IrQTRDNjlJa0FPaklmckJXWlRj?=
 =?utf-8?B?Y0ZGSlhIYm1WM2pGWWtwZW1iekF0M3p5R3pCUW5mZmlsSzZUSC9yU0d5ZW1Y?=
 =?utf-8?B?SGxvOXBramFjTEZmVFNKSkQ1b0U1dnhvWU1MT3VaVFNoQmNhZTBnVnpzRCt3?=
 =?utf-8?B?aHM2ditiVXpaV29QYlNObkRYTWtCOGl6Sit0OWY3SnJzS1NTYnZXRTdMVzBE?=
 =?utf-8?B?MkpZNUJYdDJDak9kZkpncXdBOFBTZHJKR2tDWFcrTkFpVEFodnpyT0poblc0?=
 =?utf-8?B?ZjNWOWc5RkllU2RndUdzL0ozYW9EeVZNcnBQdDFsK2Y4RmNKak1QSUVEaFZU?=
 =?utf-8?B?VU13TnFkUEMrNGpoSy9qUmVGajZzSGVBV1BDbm5KNlh5b1M0VDByVFJ0TEhn?=
 =?utf-8?B?d3N6a0FaVVJSMzVKMy9taFh4cVp1ckJaaHpkZEx0UkN3MHJlYW9jL0JxQ0Ny?=
 =?utf-8?B?K1NVb3d0cmJyMDRTVUM0VmNvYWp2TkpROGVrZG1hNGxTN2FzY1d1Rkl3Y3NV?=
 =?utf-8?B?c0NaN1VhQUd4V2hGYWx2WURHWEMvYVFCRFdEVWZlNjArSGhQeTR1VXY4N0FZ?=
 =?utf-8?B?WmsvZm1LZlJURmdaNHhVVDUxNXdxclRBd2dWYjMzWTVEbFpHamp6cUpYMVJL?=
 =?utf-8?B?UVFpd1Q0dVJvUlpTekxVd2lBd1RTcjdubURMRFNzQXV4OTh5WTdOWGFONDlR?=
 =?utf-8?B?amJWS01VZXRtUDFMSTlHR1JycU03YWNIL2FkSE03cmEyK08yS1NsbHpDNm9Y?=
 =?utf-8?B?Y2hGUmlWK1RtNmdmQzdrbHE5dmcwUTRVRHk1MzRGMlhEYkNiSkVlTit2ZXlS?=
 =?utf-8?B?YlBFWHdOM051OERmTlY5L1o4RFNhNFlyd2JUeWVtWlB3YkJVZVM4ZmZmUXJH?=
 =?utf-8?B?NG1XZ28wS1o1Y0RKTUtJUzFTWm5TWDVmODd3MlVRaGZNQ3NjZEttWjhpT1c0?=
 =?utf-8?B?RW5ubE0rNERBU1Q4aDlqM2dKV0MwakJOMEhnVFhuaEgwVjdXTzVFUVA2VWQx?=
 =?utf-8?B?dWRYOGVZT0d0dVloYUR4d2NGNmdrSWVEN0JaekJ6eVMzcVpZOEwrakMxaU8z?=
 =?utf-8?B?QmFGMXR6MVNtU0xlUmZaU0ptdGNMNzJUNERnalpYRTByUDhOa1Z1eFlXNDQ4?=
 =?utf-8?B?dXdzcmoyaVduZXhtRlpSU1RFbng2YjcrUjhEMUFCaFkwQjlYbDAvOGhIek5a?=
 =?utf-8?B?U0hCRGZmd2lUWFR6WTVQOU9CTnhPdmVMQ3dlQWdrc3pIdzJMblJyc3JWSkNa?=
 =?utf-8?B?N0NVQ0tUWndpOGREQ0RHcHFteFc2alFMWERPV3B0cFpBcFVZcC8wV0xaZjRW?=
 =?utf-8?B?OCs1Wkw4TDVYWXAvNC8wZFgvQTc3d0RGNytBaERSMTJUdnZiem5lRXZyOUFV?=
 =?utf-8?B?MjBoR1FXT1liMlQrR1dCZHBrWEp3NUx3VnZmaGlxZDNuWVlmSjNiVStxVzMy?=
 =?utf-8?B?djVQRGhiLzZZenhKa1YwcU1VUFgvWXhJUVdva2pseTgyNmYxZ3Fud3lsdS9M?=
 =?utf-8?B?ckJLR1pNbHFmc2JCbHIxbm4rWWZ0Nkt3T3VTT2hMS1VEVGxiWEl0OWYrY05a?=
 =?utf-8?B?NVVJRC9jUGZJbkthb1liRk02b0Q0aVlqMWF3UWFFTEtvelN1aHRhOHkxRHpk?=
 =?utf-8?B?YmFKNDBXY1pwRU5rNk9OTlZoU1ZKemdpd3JJc0JUdmo4amVkaTd1SHo1aEFE?=
 =?utf-8?B?cXVLTm05cElySlNEUzYxNElGblBUVndnT21ibC94NUtTMVR5MlBCYStRb0Yr?=
 =?utf-8?Q?AwQdntsTiUQiIzH85eNUlcOJJcMTSSqKqgMAZtj?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 826af44b-8fd1-4f60-ca91-08d971036a2d
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 06:56:13.1591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3q34mPUOwadojBxSpbTw7Y4Xh/Z8QYnTpLpK6jtvVaBRrEc+f3wB8xSEXabcvtSU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB6248
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2021-09-06 01:03, Peter Rosin wrote:
> On 2021-09-05 12:04, Jonathan Cameron wrote:
>> On Tue, 31 Aug 2021 09:40:11 +0200
>> Jacopo Mondi <jacopo@jmondi.org> wrote:
>>
>>> Hi Jonathan,
>>>    two more clarification requests, sorry to bother :)
>> No problem.  First one: No idea +CC wolfram and i2c list.
>>>
>>> On Mon, Aug 30, 2021 at 06:11:17PM +0100, Jonathan Cameron wrote:
>>>> On Mon, 30 Aug 2021 18:20:51 +0200  
>>>>>>> +static int sunrise_write_word(struct sunrise_dev *sunrise, u8 reg, u16 data)
>>>>>>> +{
>>>>>>> +	__be16 be_data = cpu_to_be16(data);
>>>>>>> +	int ret;
>>>>>>> +
>>>>>>> +	sunrise_wakeup(sunrise);  
>>>>>>
>>>>>> Hmm. Technically there isn't anything stopping another user of the i2c bus sneaking in
>>>>>> between the wakeup and the following command.  That would make the device going back
>>>>>> to sleep a lot more likely.  I can't off the top of my head remember if regmap lets
>>>>>> you lock the bus.  If not, you'll have to use the underlying i2c bus locking functions.
>>>>>> https://elixir.bootlin.com/linux/latest/source/drivers/iio/temperature/mlx90614.c#L432
>>>>>> gives an example.

Forgot to mention, regmap does let you do that. See e.g.
drivers/media/dvb-frontends/rtl2830.c which wraps regmap_update_bits,
regmap_bulk_write and regmap_bulk_read within a local I2C segment
lock along with a special regmap_bus that does unlocked I2C trasfers.

I think the driver does this because it has an I2C gate that needs to
be opened with a regmap interaction that in turn needs to be back to
back with the "real" regmap access, or else the gate closes again.

Cheers,
Peter
