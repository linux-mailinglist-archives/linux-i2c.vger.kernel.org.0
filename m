Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C8812F2B78
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Jan 2021 10:39:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391267AbhALJgX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Jan 2021 04:36:23 -0500
Received: from mail-eopbgr140090.outbound.protection.outlook.com ([40.107.14.90]:53476
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732700AbhALJgW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 12 Jan 2021 04:36:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQDVRUCM8915ds36gYjhpRswrmo0qO+AdOgg1NiB4u6Rl+NvWjqfJgyG8lEuAFohtmcf5CzWQhLt5hVGQjtaSX1XXGGhFiBKybY4ZXicyO4E2q6PwucWtTp5uBeTV17hpxT05yh3xxScJa1KmFIqjAwiAwL7/StRwwgsfP0NNeuVPiExUoQemVe7oGJccADmUfNd7oJVjc5ZbRdasVIW81pWDYlyaI4bf25UGyAlDajd1T/iz0mWaxByDlzDWmtHAuKzGknPBb2hblpuUJQhk4esAXcYfO3J8znX3asAm7xTYwwV6PlG5BQwGfn0LYaa0elraP3kugU2XQjxJyiZ3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fmf4P/ePN6UB8jiPqZvUK6u22i8n2ANCcrUuTN+bz0Q=;
 b=QEpn8ztnuVbnBhqtRmhebLBYYekA2oa3sOlIIOMAqiis/OyLKzv6AJY5B0Mo9yzwQuP+l0oULbuVWlLMl47DjS/s3jE/dLglCzy+lM4syZ3+Aseh8UWsQDOMTkLiXwR/8XOwbhdzie5TwEOgz6myJX8r7Sg4KwIcjwbgkPdzZe12Fhs6Lwi7lnb2xasI8k//yGXXmSrJmPzgWH/2DUkBLh0kEVzHO+dCy/qY8yohcrCF5ZDoQGuV359cSWsRRcPNZorUkYxN+jKEcgh2HWWF4lpc9e2yuibd4TGkMBysRzbpHbRnvBJ2hcnBylukKHm8v7h1fU/VdZbbFtdO1QAUgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fmf4P/ePN6UB8jiPqZvUK6u22i8n2ANCcrUuTN+bz0Q=;
 b=JQ4kBvGWjX3B4HkhWx/0DizB4eqvGYbeYJ5swLvz3b4LavjglLpAugeJK69R8kYklVvMUaYZFNrF3mhmCqYB6mj78zl0+y3sl2PMq2k95cAMlJFO5b0SyOaZEF7oaV6qLf7Qg0WXH/t0m5Sxl+t1PTS/PCA2tLa9jHBP8+YXegI=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB7PR02MB4602.eurprd02.prod.outlook.com (2603:10a6:10:66::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.12; Tue, 12 Jan
 2021 09:35:30 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f%6]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 09:35:30 +0000
Subject: Re: [Re-send: PATCH i2c-next 5/6] i2c: mux: mlxcpld: Extend driver to
 support word address space devices
To:     Vadim Pasternak <vadimp@nvidia.com>,
        "wsa@the-dreams.de" <wsa@the-dreams.de>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <20201118144416.184120-1-vadimp@nvidia.com>
 <20201118144416.184120-6-vadimp@nvidia.com>
 <b1e3b52d-ddb2-ac56-665c-7500c939a55d@axentia.se>
 <DM6PR12MB38989872E06EA9593E862F23AFAF0@DM6PR12MB3898.namprd12.prod.outlook.com>
 <268612bc-dc4a-cfcd-f529-e8540adfd8dc@axentia.se>
 <DM6PR12MB389804F87C41F41210837810AFAB0@DM6PR12MB3898.namprd12.prod.outlook.com>
 <e02caf3a-86b7-23de-2723-3abe97fb92e4@axentia.se>
 <DM6PR12MB3898A35B743227426802C081AFAB0@DM6PR12MB3898.namprd12.prod.outlook.com>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <5860104a-f922-068d-18ca-32b69c7970f7@axentia.se>
Date:   Tue, 12 Jan 2021 10:35:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <DM6PR12MB3898A35B743227426802C081AFAB0@DM6PR12MB3898.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: sv-SE
Content-Transfer-Encoding: 7bit
X-Originating-IP: [85.229.94.233]
X-ClientProxiedBy: HE1PR0102CA0010.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:14::23) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (85.229.94.233) by HE1PR0102CA0010.eurprd01.prod.exchangelabs.com (2603:10a6:7:14::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 09:35:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b0eb56b-205f-4741-65f5-08d8b6dd66fd
X-MS-TrafficTypeDiagnostic: DB7PR02MB4602:
X-Microsoft-Antispam-PRVS: <DB7PR02MB4602F7AA612CF27014D61D42BCAA0@DB7PR02MB4602.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SbJwDU1hQJFU3/bl/8wg5DDVUuBtMNUl+1N1cicySlTIvl8IsrQO8qBdhDdmxR5/TfzvDw8y8mPfLIoiFoVD149IW/7gnpcQL4D1+ESbCVcP+ZiyeKvJ1dqbi92KpeJnrl56DCw7T8/oRPtaW7SjxQbpZPIUq5d5wund5tI54qUSTfHaYFfzw977cq30IBdBxoMJ1L61XGz1OCcWZm9/UGHoSlDtWonA5ycIrISojVXUwTMANTB1uE0hGlR9J7CHFwx3xPX1ls6Un+O20nI15/zZCQ23I6Wp2Sb/hHlzkzeppI0bHciFE3ZjjV7rIyKSNoutiNfQm2hzHZClw9DviCCtFfbhQR0hKjGdubjwfcDrp80u0zvbm7bMi9Tr1jlf/2Sv42jZU0HF/Re44zhqc23yrXLjOOYOyW+4CRdSEXQgIyzvvl34MFhw5IH0X3sOVd1BuDh2oBFok6581qKg/8GKOLJcEzgE2PA3tIPCSDc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(39830400003)(366004)(376002)(136003)(396003)(346002)(4001150100001)(36756003)(16526019)(36916002)(4326008)(66946007)(6486002)(186003)(53546011)(66556008)(31686004)(8936002)(478600001)(66476007)(2616005)(5660300002)(2906002)(86362001)(316002)(31696002)(30864003)(26005)(83380400001)(110136005)(16576012)(8676002)(956004)(133343001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NG16L3JvQWNwSnRjVjQ5U3VnaVRwUDNEejRpU09xeU9yTys4a2N1ZGxMMFRa?=
 =?utf-8?B?c0RZaHdmaTQ2UTNXZnFkQm5OZ1dkWFdnT3FuZ3lzd2dWSWxwNmFtTUdBQnB0?=
 =?utf-8?B?Z2RDRlZISlhlS09HbzVIODU0SmVOUm16NEZKT2E0blJqbkhVeUZ4OXJDWS9m?=
 =?utf-8?B?bExNWkZGK282cm4zdDV4bHdnTFdCay9Ib3o1R0xoMERrdXlKTEplTUczMStC?=
 =?utf-8?B?dFhxQ29rVkpxZmc3QW8xdUlhRGNIZFFnVmlJeVJMQXBrQzdhcVUvMVQrV2Vw?=
 =?utf-8?B?MnU5K04zL1cvK0hLVXBxTC9wTWxUQXVyUmU2NGJiNGJjSmtIejNmaDVGQUkz?=
 =?utf-8?B?eDZUdk0rMDd4WnRVYUhpbENEekF2UWpzZ1QvYXFmQk9xbFlSZHdXTlNUNXRy?=
 =?utf-8?B?Wm9zMW1JalZiUCtxVUdLbzV6UHVzcWtyb2ZRdTZQYzB6YnFOTlhYc21xdGk3?=
 =?utf-8?B?akhvVmFIampJSUxDRnJpem5EcHpOaDIvNkNYMWVOR01laVNheVdDV1hSL0th?=
 =?utf-8?B?QWZnMjR1OWdqNHRmcHdTZC9najFFMHNXTGhoS3p6U2RYUGNEQk56ZGRwdTZK?=
 =?utf-8?B?eEVZalhxU2RKaHRPTDkzd29zTWZpZVhHc05JaWo0dmRJNVFmWGR4YVdlbFpp?=
 =?utf-8?B?STZXK09xaGxmYnp5a2F0M3prY2NobXhuTElhVUx1WmNOUnZTSjYrVHh4dmRa?=
 =?utf-8?B?eHg1YW9FMFhac1I5SjluNkhBa29pNE00bGlMWHRTZXpDRnJnYnR3MnV5Z1NM?=
 =?utf-8?B?aHVNM1FvR04rQUdGOEhUcjhGa1B5ZWxHSDJ2cVFaV040L3N3UkxVT2JlcHlq?=
 =?utf-8?B?UzBBRmhobk9nSWFFbW5JcklZejBya21TWEc2N0xBYmg4a0pQQjJ6VnlsbWZ0?=
 =?utf-8?B?SzEwd2FnemJaYldEdnBDSFlyc2lxeEdqN2VmbVlpRmczd2hlMi8yUy9xZEdB?=
 =?utf-8?B?TnRTZEVBR2ljaWtSUnUyQlZIYThRUVZybGZvK1F4ZHF6eFRKN1FZRjNtb0tV?=
 =?utf-8?B?VStTbVhSNFNKRmxYTzBpK3AvRDFNYUtMcnFJRUl1bkhGMXlNZWdVRnZJYWIx?=
 =?utf-8?B?VU9MSnRFT3hsRUY5RGFPSFZnYktTMTBVWGE0akNWYzd0aHhaRk5zTkt3TnVC?=
 =?utf-8?B?RFJJTUlkVGxZaFVhVkNmbENEaUgvNVBUME8vcUZNWVNVOE5LUjRTUy9zbkdK?=
 =?utf-8?B?TzdZYW5tendPZ2wwb2QrMVBkY3lHd2szSkhQanpwMElodnZ1YnBwbHFyYXR2?=
 =?utf-8?B?K1JTWEcxZ0UrVFdoZFQwL2JpUUFJbTdLM2RGUnI4eW4zZVZXZFhoWFlIdk1K?=
 =?utf-8?Q?82QilZwg34kcAQtVk6cDLYHg4xOrLToPaQ?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 09:35:30.4335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b0eb56b-205f-4741-65f5-08d8b6dd66fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EOuCMptCU6YvbMVY8O2Bhssgq0472sOYJ212jJj7Da7SlYEBcyr4Y1pqM7t2bIsK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR02MB4602
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

Wolfram, question for you below!

On 2021-01-12 00:24, Vadim Pasternak wrote:
> Hi Peter,
> 
>> -----Original Message-----
>> From: Peter Rosin <peda@axentia.se>
>> Sent: Monday, January 11, 2021 11:23 PM
>> To: Vadim Pasternak <vadimp@nvidia.com>; wsa@the-dreams.de
>> Cc: linux-i2c@vger.kernel.org
>> Subject: Re: [Re-send: PATCH i2c-next 5/6] i2c: mux: mlxcpld: Extend driver to
>> support word address space devices
>>
>> Hi!
>>
>> On 2021-01-11 19:11, Vadim Pasternak wrote:
>>> Hi Peter,
>>>
>>>> -----Original Message-----
>>>> From: Peter Rosin <peda@axentia.se>
>>>> Sent: Friday, January 08, 2021 10:02 AM
>>>> To: Vadim Pasternak <vadimp@nvidia.com>; wsa@the-dreams.de
>>>> Cc: linux-i2c@vger.kernel.org
>>>> Subject: Re: [Re-send: PATCH i2c-next 5/6] i2c: mux: mlxcpld: Extend
>>>> driver to support word address space devices
>>>>
>>>> Hi!
>>>>
>>>> On 2021-01-07 21:43, Vadim Pasternak wrote:
>>>>> Hi Peter,
>>>>>
>>>>> Thank you very much for review.
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Peter Rosin <peda@axentia.se>
>>>>>> Sent: Thursday, January 07, 2021 12:04 PM
>>>>>> To: Vadim Pasternak <vadimp@nvidia.com>; wsa@the-dreams.de
>>>>>> Cc: linux-i2c@vger.kernel.org
>>>>>> Subject: Re: [Re-send: PATCH i2c-next 5/6] i2c: mux: mlxcpld:
>>>>>> Extend driver to support word address space devices
>>>>>>
>>>>>> Hi!
>>>>>>
>>>>>> Again, sorry for the late review.
>>>>>>
>>>>>> On 2020-11-18 15:44, Vadim Pasternak wrote:
>>>>>>> Extend driver to allow I2C routing control through CPLD devices
>>>>>>> with word address space. Till now only CPLD devices with byte
>>>>>>> address space have been supported.
>>>>>>>
>>>>>>> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
>>>>>>> Reviewed-by: Michael Shych <michaelsh@nvidia.com>
>>>>>>> ---
>>>>>>>  drivers/i2c/muxes/i2c-mux-mlxcpld.c   | 57
>>>>>> +++++++++++++++++++++++++++--------
>>>>>>>  include/linux/platform_data/mlxcpld.h |  2 ++
>>>>>>>  2 files changed, 47 insertions(+), 12 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/i2c/muxes/i2c-mux-mlxcpld.c
>>>>>>> b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
>>>>>>> index 6bb8caecf8e8..c76180919fc3 100644
>>>>>>> --- a/drivers/i2c/muxes/i2c-mux-mlxcpld.c
>>>>>>> +++ b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
>>>>>>> @@ -21,11 +21,13 @@
>>>>>>>   * @last_chan - last register value
>>>>>>>   * @client - I2C device client
>>>>>>>   * @pdata: platform data
>>>>>>> + * @sel_buf: I2C message buffer for mux select 16 bits
>>>>>>> + transactions
>>>>>>>   */
>>>>>>>  struct mlxcpld_mux {
>>>>>>>  	u8 last_chan;
>>>>>>>  	struct i2c_client *client;
>>>>>>>  	struct mlxcpld_mux_plat_data pdata;
>>>>>>> +	u8 sel_buf[3];
>>>>>>
>>>>>> I think it's a mistake to have this buffer here. I'd rather create
>>>>>> a buffer on the stack in mlxcpld_mux_reg_write() and fill it with
>>>>>> values for
>>>> every xfer.
>>>>>> Sure, I bet there are external locks that prevent any clobbering of
>>>>>> the buffer, but it's so small that it really can be on the stack.
>>>>>>
>>>>>>>  };
>>>>>>>
>>>>>>>  /* MUX logic description.
>>>>>>> @@ -60,26 +62,42 @@ struct mlxcpld_mux {
>>>>>>>   * for this as they will try to lock adapter a second time.
>>>>>>>   */
>>>>>>>  static int mlxcpld_mux_reg_write(struct i2c_adapter *adap,
>>>>>>> -				 struct mlxcpld_mux *mux, u8 val)
>>>>>>> +				 struct mlxcpld_mux *mux, int chan)
>>>>>>>  {
>>>>>>>  	struct i2c_client *client = mux->client;
>>>>>>> -	union i2c_smbus_data data = { .byte = val };
>>>>>>> -
>>>>>>> -	return __i2c_smbus_xfer(adap, client->addr, client->flags,
>>>>>>> -				I2C_SMBUS_WRITE, mux-
>>>>>>> pdata.sel_reg_addr,
>>>>>>> -				I2C_SMBUS_BYTE_DATA, &data);
>>>>>>> +	union i2c_smbus_data data;
>>>>>>> +	struct i2c_msg msg;
>>>>>>> +
>>>>>>> +	switch (mux->pdata.reg_size) {
>>>>>>> +	case 1:
>>>>>>> +		data.byte = (chan < 0) ? 0 : chan;
>>>>>>> +		return __i2c_smbus_xfer(adap, client->addr, client->flags,
>>>>>>> +					I2C_SMBUS_WRITE,
>>>>>>> +					mux->pdata.sel_reg_addr,
>>>>>>> +					I2C_SMBUS_BYTE_DATA, &data);
>>>>>>> +	case 2:
>>>>>>> +		mux->sel_buf[mux->pdata.reg_size] = (chan < 0) ? 0 :
>>>>>>> +						    mux-
>>>>>>> pdata.adap_ids[chan];
>>>>>>
>>>>>> I get the feeling that you are desperatly trying to get some
>>>>>> specific numbering in user space.
>>>>>>
>>>>>> The adapter id is one thing.
>>>>>> The mux channel is one thing.
>>>>>> The value in the register is one thing.
>>>>>>
>>>>>> Often, it can make things easier with an easy mapping between the
>>>>>> latter two, but you program the system global I2C adapter id into
>>>>>> the channel selection register of the mux. That is problematic. Just don't.
>>>>>
>>>>> OK, I will explain what I am trying to get.
>>>>> This is not something related to the user space.
>>>>>
>>>>> I want to access some device, located on a line card, which is replaceable.
>>>>> This is for modular system, which can be equipped with the different
>>>>> type of line cards.
>>>>>
>>>>> I have mux selector register in line card CPLD, which is located at
>>>>> some offset in CPLD register space, f.e. 0x25dc. On other systems it
>>>>> could
>>>> different offset.
>>>>>
>>>>> For this line card type in pdata.adap_ids[] channels mapping looks like:
>>>>> {
>>>>> 	0x04, 0x05, 0x06, 0x07, 0x08, 0x10, 0x20, 0x21, 0x22, 0x23, 0x40, 0x41,
>>>>> 	0x42, 0x43, 0x44, 0x45, 0x46, 0x47, 0x48, 0x49, 0x4a, 0x4b, 0x4c, 0x4d,
>>>>> 	0x4e, 0x4f
>>>>> };
>>>>> Ids from 0x01 - 0x0f are used for access to devices like  voltage
>>>>> regulators,
>>>> hotswap,
>>>>> 	EEPROMs, iio, etcetera.
>>>>> Ids from 0x10 are used for FPGAs.
>>>>> Ids from 0x20 are used for gearboxes.
>>>>> Ids from 0x40 are used for QSFP.
>>>>> On other line card type it could be different device tree, but it
>>>>> still will follow the same convention.
>>>>>
>>>>> CPLD is connected to some upper adapter at address 0x32, and device
>>>>> on line card is connected to adapter = base_nr * slot +
>> pdata.adap_ids[channel].
>>>>> For example, base_nr is 100, slot, at which line card is inserted
>>>>> is 1, channel 0 will be be configured for adapter 104.
>>>>>
>>>>> And access will be as below:
>>>>> cat /sys/bus/i2c/devices/104-0062/hwmon/hwmon5/in1_input
>>>>> 11750
>>>>>
>>>>>              cat-17623   [004] .... 1152583.810824: i2c_write: i2c-1 #0 a=032
>> f=0000
>>>> l=3 [25-dc-04]
>>>>>              cat-17623   [004] .... 1152583.811276: i2c_result: i2c-1 n=1 ret=1
>>>>>              cat-17623   [004] .... 1152583.811281: i2c_write: i2c-1 #0 a=062
>> f=0000
>>>> l=1 [88]
>>>>>              cat-17623   [004] .... 1152583.811281: i2c_read: i2c-1 #1 a=062
>> f=0001
>>>> l=2
>>>>>              cat-17623   [004] .... 1152583.811700: i2c_reply: i2c-1 #1 a=062
>> f=0001
>>>> l=2 [2f-f0]
>>>>>              cat-17623   [004] .... 1152583.811700: i2c_result: i2c-1 n=2 ret=2
>>>>>              cat-17623   [004] .... 1152583.811704: i2c_write: i2c-1 #0 a=032
>> f=0000
>>>> l=3 [25-dc-00]
>>>>>
>>>>> When the same line card is inserted for example at slot 3, the
>>>>> adapter, to which this device is connected will be 304.
>>>>
>>>> Yes, I think I get it. You are however not introducing base_nr until
>>>> 6/6, so at this point the code makes no sense. But even after 6/6
>>>> with base_nr in place, I suggest the following:
>>>>
>>>> - The adap_ids array is for forceing the system global adapter id.
>>>> Leave this variable
>>>>   alone and let it continue to do what it does, and only that. Or...
>>>> - Since you stated somewhere that there are no users of this drivers,
>>>> I'd be happy to just
>>>>   see the adap_ids variable deleted, i.e. I see no need to force the adapter
>> id.
>>>> - Instead of reusing adap_ids, intruduce a new "channel" array and
>>>> fill it with the same
>>>>   values that you provide in adap_ids, and then have the driver feed
>>>> them to the 3rd arg
>>>>   of i2c_mux_add_adapter(), i.e. chan_id.
>>>>
>>>> Would that work for you? Or do you somehow depend on predictable
>>>> adapter ids?
>>>
>>> I can drop adap_id[]s, use chan_ids[] instead and modify loop for
>>> adding Adapters like:
>>> 	for (num = 0; num < pdata->num_adaps; num++) {;
>>> 		err = i2c_mux_add_adapter(muxc, pdata->base_nr + num,
>>> 					  pdata->chan_ids[num], 0);
>>> 		if (err)
>>> 			goto virt_reg_failed;
>>> 	}
>>>
>>> In such way I can keep convention for adapters numbering for card in
>>> slot 'n', nrs will be:
>>> Form 100 * n + 1 - for voltage  regulators, hotswap, EEPROMs, iio, ...
>>> From 100 *n + 16 - for FPGAs.
>>> From 100 * n + 32 - for gearboxes.
>>> From 100 * n + 64 - for QSFP.
>>>
>>> Would it be OK?
>>
>> What convention are you talking about? What makes it interesting to force
>> specific adapter IDs? I just don't see the point. I would do
>>
>> 		err = i2c_mux_add_adapter(muxc, 0, pdata->chan_ids[num],
>> 0);
>>
>> and let the adapted ID be whatever the I2C core makes up.
>>
>> What's wrong with that?
> 
> The motivation it to provide support for new modular systems which
> could be equipped with the different types of replaceable line cards
> and management board.
> 
> The line cards could be of different types and could have different
> I2C topolgy:
> - Line cards with 16x100Gbe QSFP28 Ethernet ports.
> - Line cards with 8x200Gbe QSFP28 Ethernet ports.
> - Line cards with 4x400Gbe QSFP-DD Ethernet ports.
> - Smart cards equipped with Nvidia ARM CPU for offloading and for fast
>   access to the storage (EBoF).
> - Fabric InfiniBand cards for inter-connection.
> 
> The first version of modular system will be equipped with 8 slots.
> 
> With no enforcement, for example, it could be the next bus assignments:
> - if system is booted with empty slot number one, and with line card at slot
>   number 2, i2c devices i2c-{n1} - i2c-{n2} will be created for line card at the slot 2.
> - if system is booted with line cards at slot 1 and at slot 2, devices i2c-{n1} - i2c-{n2}
>   this time will be associated with line card at slot 1, while i2c-{n2+1} - i2c-{n2*2} will
>   be associated with line card at slot 2.
> - line cards could are removed and then re-inserted in some random order, and it'll
>   also could change bus indexes for line card inserted at the same slot.   
> 
> It'll make a big challenge for any user application, which wants to use /dev/i2c-{x}.
> 
> With enforcement I can avoid this situation.
> So, for fixed system it would be fine to have base_nr equal zero, but for modular
> I'd like to have base_nr = f(slot), f.e. 100 * slot.

My confusion stems from your response to my note "I get the feeling that you are
desperatly trying to get some specific numbering in user space", when you said:

	OK, I will explain what I am trying to get.
	This is not something related to the user space.

So, you had me confused. :-)

Wolfram, is there a better way to get something stable for user space to
interact with? Is there maybe a way to do this with aliases or something?
Setting up an ad-hoc scheme for forcing the adapter IDs feels a bit outdated.

>> Trying to force specific adapater IDs risks failure whenever any of those IDs
>> happen to be taken, and you have no way of preallocating some range the I2C
>> core should not use. The only way to do what you do is to select some high
>> enough ID range and hope for the best. But what if someone else does the
>> same thing? It's just a slippery slope. So, why?
> 
> Yes, it could happen with fixed system, but in this case I expect base_nr to be
> zero and IDs will be allocated just from free pool.
> But for modular system availability of specific IDs could be granted.

With your latest suggested code, setting base_nr to zero will not trigger
allocation from the free pool. Well, the first channel would be, but
that's ... not practical.

Cheers,
Peter

> Otherwise I'll have IDs reordering, each time when some devices are removed/
> inserted.

