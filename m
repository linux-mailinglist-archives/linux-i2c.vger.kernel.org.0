Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58E832F21B4
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Jan 2021 22:24:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730148AbhAKVXu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Jan 2021 16:23:50 -0500
Received: from mail-am6eur05on2120.outbound.protection.outlook.com ([40.107.22.120]:9927
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730086AbhAKVXt (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 11 Jan 2021 16:23:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SoFvTRcMCjCkWPAA/Cdlex/EFMS/lJ7n1b0auckO+6vLpXrwvFOoPfaGQ+ClVim3Sbh1U6dX0IdfV6v2JbBztT4ElAmfTFezQnXxgB/TKM3QJH89tFqg6TsVdA8HyVaxmY7KPnMZ9g9xrLvucJhxYrXHCeKegBbUc/x2hWl1AnXprtRKaGRpWw2Aw1UFrv9k/bERhQyWQzi1HDwDCva/hd9VA/bSjlvnJdQQWifk2aGlnYUD6LmESF6rmlugwnqEp9QYCBpLszTnSIWfKBXWM+QUNkVYbtISRQPY5VwNi0txAvRfjea9FxbGu6r2ql/Q/oaXvShZw2MZ6Yrxo0ypkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2z1uDKbLcD0MGeayVZkrZ1tMgQJ+hh+4xOT/hkhZ7YE=;
 b=c60J0NwUhPH8X3C1s6mr/2AoBL7gmPCMRZeqZDe6O+aGENDMe2rgz/LGz6ci73uG80lO14ntWThEEJ7oBUK+cKe/W2H3GdZ+cdj4gIq5pmkiFhlXsQ1NEdK606dKYiqNkObPWwM3BTBzi0ruIWWZ6zW6vYkLwyCJHP1ht3q559pSPV9lbKdDqtV+2HIIMiUgHgWLfM3Is+h8dfXzr/QdOLxI3gVbZYktSMnghMe0A2NMaOhERvCDDvIfNssDKvP0aZyGvnsXGkXIUrIJ28snO3LyWJ74h8qdFvQJqpnLYg+11qEy/wqwpbOyWj6js+3jxdjuakvCP915EBZ5vUIphg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2z1uDKbLcD0MGeayVZkrZ1tMgQJ+hh+4xOT/hkhZ7YE=;
 b=KCO6MrdKdx81ZzhqXVAbzIQF3Om2NhDtdsCIvcj2X7IzLTjZiaAR+pa+bVfDwk5ATOWphM2m701Al0bSTuMJy4AFjI4ZgtDIDJ8N+bcC8wKuyixrP7kw21Z8cPKcEfRyA1xx6CpYmRKAmsZYsJ4jHdqaotxZ4Y52V3JWsXoCukI=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB9PR02MB6747.eurprd02.prod.outlook.com (2603:10a6:10:1fb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Mon, 11 Jan
 2021 21:22:59 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f%6]) with mapi id 15.20.3742.012; Mon, 11 Jan 2021
 21:22:59 +0000
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
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <e02caf3a-86b7-23de-2723-3abe97fb92e4@axentia.se>
Date:   Mon, 11 Jan 2021 22:22:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <DM6PR12MB389804F87C41F41210837810AFAB0@DM6PR12MB3898.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: sv-SE
Content-Transfer-Encoding: 7bit
X-Originating-IP: [85.229.94.233]
X-ClientProxiedBy: HE1P190CA0001.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:bc::11)
 To DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (85.229.94.233) by HE1P190CA0001.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:bc::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Mon, 11 Jan 2021 21:22:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4e76ac4-f96c-450b-4534-08d8b67711e1
X-MS-TrafficTypeDiagnostic: DB9PR02MB6747:
X-Microsoft-Antispam-PRVS: <DB9PR02MB6747859F20EFCC88FE1C5074BCAB0@DB9PR02MB6747.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jqh2gWhXR2KS9IjO2/p5UacSt0Xg3pmUoSy80XxhgvsjHvSGBYc2fLdqbaBDwhC+bPoxqgJFmkFVQNjwqJ+pgETeHsjKamfP6QE/JL8wB4PAGFQIPzlxqYIjqGTZiC+4QWmLm6rHdAQOs9OzL8hEvcNvXPMZ15IxwNSsPFPFw/eHz6EJhlEKH4aV59GPwBPbv49Cp1XsWKJDcj13JTjOmz51esYVHhIZCscFBrd5++MSRUCr/GymooLx4CYCB7qmgHFugQK806FbyvMX3gLjvlEMrSlV4FHJ5Ju2p5kPJuOAq68+p3jKSFTiPlENBaaGxaZy7FuVUTmad3oejrm38tHNg81lPyoxMrZH5+tiNVam5LZHWn3g+pC7/PBWU5rP+uKwpTYku+dy7athvKrRCesMN9lSlPvYuVA61m7ZtD2pksXzbt41q4gsMFNUjya9Cs/EUK0a/yKrNGb4j3TAXFdz320s9ymPhc+8PU/6YFhs8xIDEw3GJ8n0Mid5UQD4
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(39830400003)(366004)(136003)(376002)(66556008)(66476007)(66946007)(2906002)(478600001)(956004)(4326008)(36756003)(16576012)(186003)(16526019)(8676002)(2616005)(83380400001)(6666004)(6486002)(31696002)(8936002)(31686004)(110136005)(26005)(53546011)(5660300002)(4001150100001)(36916002)(316002)(86362001)(133343001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NDYwaGJGMVBicU1LTnJ6NDNmUGdPU3FGWnJ6SEpvVEpoZ3VBcjdrNVZneUQ5?=
 =?utf-8?B?U1htUmJzRTdSQWw0WkVmUjRndXBDaTBtcjJ5ajIzdFBoSUs1NExmd1RnaTlU?=
 =?utf-8?B?VUV2OGdDWklHR1luVzJWc3lJcnkxck1BNlA4ajN5bnE1aWJ1a1haMU1MWnYr?=
 =?utf-8?B?VnlRVGM5OWRDRVVFeTdkOUtVUDZjOGE1OGlocW1pbHNGU2dZUElOZ3FoS3Jw?=
 =?utf-8?B?TFFySExOMUJKNmRBY1FIZGlOcnU3WElBQlF4SzNha1hoYkQ1UkRYMzRiekli?=
 =?utf-8?B?TFE0QWhHYm9wMXdnZEVWZzBndDJoYm5Td2FnQlVUZWJmVG9yaWxSWXJnZXNH?=
 =?utf-8?B?eExGL3AxU1lUTGpRS3hZYlNROG9mU2dvblgwd1FHT2U4cWNUYmdUZjJhSDVu?=
 =?utf-8?B?eVUyT2RubWZUendDWnpIQThra2hPOFRKR0RsRGpPVHRlR0plZEpBdWNDUE5H?=
 =?utf-8?B?TWgrMnl4Q0xiaEpZbnVhbkxMb081Q0loWklVSEYzUGd6TTRJc2dDS0E4ak9u?=
 =?utf-8?B?SEc0WTlubmMzNmFJZllGWkJnR29iM1hkWTlpMmY3WndFQmhBMHdUbEtabVNW?=
 =?utf-8?B?eWZ1SForNnRPS3VnOUM2TjI1SE5pNTdJMjRIa0tNeVJ5UytuY1h3S2ljblJq?=
 =?utf-8?B?QWFDNTdHRXZPY3l5M0s2RWg5eS9KKzRHd3M4NmZITmhZNFl1aWk0WENOT1Vw?=
 =?utf-8?B?UlZwc0U0WXFsS3ZvZ2VhMHBMdmpTN0hiMCtaYTNJRDc2Q2hzYlRjZWdmaXF5?=
 =?utf-8?B?N3g4SitsejNOVHlqS3NmdTUxb1JMZ21TcCtpWDFEQmhmNmhzZnRFaFpNL3JW?=
 =?utf-8?B?RG1US2UrUjA5bTl1R2dWeEs3Sm5uQ1lkUDFpUkUybTNJVnUrdEN2ZDFXNGxj?=
 =?utf-8?B?L09Ra3hST1dzT0lqNS9wcXBSUyt0OVN1OGoydlNxRlNRYWU2RFoyazNlbFFB?=
 =?utf-8?B?djBCb1Z3NXVYeGtsM3dqUDZKT3hZbGZNWW9rbVRGUGxaM3hPVnU5SEtSVzhQ?=
 =?utf-8?B?NHJtY1p4Z0IyaUJRb2tQRGJuM0JDR2lZQ0RLYko2UXdpRVh3RUNsUTN2QThk?=
 =?utf-8?B?TTNTQWRkZFF1YytaUCtIQmxQdENSTVFJZDY0MGY2a0lSRkVKM05hYnU5SGo0?=
 =?utf-8?B?dDcrY3FzRVJvbGhKVEtSUXowWThaZXYyMkJuSHhLODFMblNRUjB2STVnMXJo?=
 =?utf-8?B?M1RBc1NKQ3NvMHI1VEQydUJYdGVxbUFmNm9kNTNXaURVR1RzbFpoM2E4NjIy?=
 =?utf-8?B?QXpGR1hYUUdRYmpWdC9nMWM5emMzOU4yOWg2anp3WVRuOTJVWTVLY3A5MnY2?=
 =?utf-8?Q?dClNN2DLeahQ9ZoKhGi8OmmTsGWsoJQsGQ?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 21:22:58.9155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-Network-Message-Id: d4e76ac4-f96c-450b-4534-08d8b67711e1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rIMaEEmGtF5Xwz+zxVtmvO8lWBlO8WNnpn6hmDyl/tc8IxXVBgU640S8y2KiGFbv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB6747
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

On 2021-01-11 19:11, Vadim Pasternak wrote:
> Hi Peter,
> 
>> -----Original Message-----
>> From: Peter Rosin <peda@axentia.se>
>> Sent: Friday, January 08, 2021 10:02 AM
>> To: Vadim Pasternak <vadimp@nvidia.com>; wsa@the-dreams.de
>> Cc: linux-i2c@vger.kernel.org
>> Subject: Re: [Re-send: PATCH i2c-next 5/6] i2c: mux: mlxcpld: Extend driver to
>> support word address space devices
>>
>> Hi!
>>
>> On 2021-01-07 21:43, Vadim Pasternak wrote:
>>> Hi Peter,
>>>
>>> Thank you very much for review.
>>>
>>>> -----Original Message-----
>>>> From: Peter Rosin <peda@axentia.se>
>>>> Sent: Thursday, January 07, 2021 12:04 PM
>>>> To: Vadim Pasternak <vadimp@nvidia.com>; wsa@the-dreams.de
>>>> Cc: linux-i2c@vger.kernel.org
>>>> Subject: Re: [Re-send: PATCH i2c-next 5/6] i2c: mux: mlxcpld: Extend
>>>> driver to support word address space devices
>>>>
>>>> Hi!
>>>>
>>>> Again, sorry for the late review.
>>>>
>>>> On 2020-11-18 15:44, Vadim Pasternak wrote:
>>>>> Extend driver to allow I2C routing control through CPLD devices with
>>>>> word address space. Till now only CPLD devices with byte address
>>>>> space have been supported.
>>>>>
>>>>> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
>>>>> Reviewed-by: Michael Shych <michaelsh@nvidia.com>
>>>>> ---
>>>>>  drivers/i2c/muxes/i2c-mux-mlxcpld.c   | 57
>>>> +++++++++++++++++++++++++++--------
>>>>>  include/linux/platform_data/mlxcpld.h |  2 ++
>>>>>  2 files changed, 47 insertions(+), 12 deletions(-)
>>>>>
>>>>> diff --git a/drivers/i2c/muxes/i2c-mux-mlxcpld.c
>>>>> b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
>>>>> index 6bb8caecf8e8..c76180919fc3 100644
>>>>> --- a/drivers/i2c/muxes/i2c-mux-mlxcpld.c
>>>>> +++ b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
>>>>> @@ -21,11 +21,13 @@
>>>>>   * @last_chan - last register value
>>>>>   * @client - I2C device client
>>>>>   * @pdata: platform data
>>>>> + * @sel_buf: I2C message buffer for mux select 16 bits transactions
>>>>>   */
>>>>>  struct mlxcpld_mux {
>>>>>  	u8 last_chan;
>>>>>  	struct i2c_client *client;
>>>>>  	struct mlxcpld_mux_plat_data pdata;
>>>>> +	u8 sel_buf[3];
>>>>
>>>> I think it's a mistake to have this buffer here. I'd rather create a
>>>> buffer on the stack in mlxcpld_mux_reg_write() and fill it with values for
>> every xfer.
>>>> Sure, I bet there are external locks that prevent any clobbering of
>>>> the buffer, but it's so small that it really can be on the stack.
>>>>
>>>>>  };
>>>>>
>>>>>  /* MUX logic description.
>>>>> @@ -60,26 +62,42 @@ struct mlxcpld_mux {
>>>>>   * for this as they will try to lock adapter a second time.
>>>>>   */
>>>>>  static int mlxcpld_mux_reg_write(struct i2c_adapter *adap,
>>>>> -				 struct mlxcpld_mux *mux, u8 val)
>>>>> +				 struct mlxcpld_mux *mux, int chan)
>>>>>  {
>>>>>  	struct i2c_client *client = mux->client;
>>>>> -	union i2c_smbus_data data = { .byte = val };
>>>>> -
>>>>> -	return __i2c_smbus_xfer(adap, client->addr, client->flags,
>>>>> -				I2C_SMBUS_WRITE, mux-
>>>>> pdata.sel_reg_addr,
>>>>> -				I2C_SMBUS_BYTE_DATA, &data);
>>>>> +	union i2c_smbus_data data;
>>>>> +	struct i2c_msg msg;
>>>>> +
>>>>> +	switch (mux->pdata.reg_size) {
>>>>> +	case 1:
>>>>> +		data.byte = (chan < 0) ? 0 : chan;
>>>>> +		return __i2c_smbus_xfer(adap, client->addr, client->flags,
>>>>> +					I2C_SMBUS_WRITE,
>>>>> +					mux->pdata.sel_reg_addr,
>>>>> +					I2C_SMBUS_BYTE_DATA, &data);
>>>>> +	case 2:
>>>>> +		mux->sel_buf[mux->pdata.reg_size] = (chan < 0) ? 0 :
>>>>> +						    mux-
>>>>> pdata.adap_ids[chan];
>>>>
>>>> I get the feeling that you are desperatly trying to get some specific
>>>> numbering in user space.
>>>>
>>>> The adapter id is one thing.
>>>> The mux channel is one thing.
>>>> The value in the register is one thing.
>>>>
>>>> Often, it can make things easier with an easy mapping between the
>>>> latter two, but you program the system global I2C adapter id into the
>>>> channel selection register of the mux. That is problematic. Just don't.
>>>
>>> OK, I will explain what I am trying to get.
>>> This is not something related to the user space.
>>>
>>> I want to access some device, located on a line card, which is replaceable.
>>> This is for modular system, which can be equipped with the different
>>> type of line cards.
>>>
>>> I have mux selector register in line card CPLD, which is located at
>>> some offset in CPLD register space, f.e. 0x25dc. On other systems it could
>> different offset.
>>>
>>> For this line card type in pdata.adap_ids[] channels mapping looks like:
>>> {
>>> 	0x04, 0x05, 0x06, 0x07, 0x08, 0x10, 0x20, 0x21, 0x22, 0x23, 0x40, 0x41,
>>> 	0x42, 0x43, 0x44, 0x45, 0x46, 0x47, 0x48, 0x49, 0x4a, 0x4b, 0x4c, 0x4d,
>>> 	0x4e, 0x4f
>>> };
>>> Ids from 0x01 - 0x0f are used for access to devices like  voltage regulators,
>> hotswap,
>>> 	EEPROMs, iio, etcetera.
>>> Ids from 0x10 are used for FPGAs.
>>> Ids from 0x20 are used for gearboxes.
>>> Ids from 0x40 are used for QSFP.
>>> On other line card type it could be different device tree, but it
>>> still will follow the same convention.
>>>
>>> CPLD is connected to some upper adapter at address 0x32, and device on
>>> line card is connected to adapter = base_nr * slot + pdata.adap_ids[channel].
>>> For example, base_nr is 100, slot, at which line card is inserted  is
>>> 1, channel 0 will be be configured for adapter 104.
>>>
>>> And access will be as below:
>>> cat /sys/bus/i2c/devices/104-0062/hwmon/hwmon5/in1_input
>>> 11750
>>>
>>>              cat-17623   [004] .... 1152583.810824: i2c_write: i2c-1 #0 a=032 f=0000
>> l=3 [25-dc-04]
>>>              cat-17623   [004] .... 1152583.811276: i2c_result: i2c-1 n=1 ret=1
>>>              cat-17623   [004] .... 1152583.811281: i2c_write: i2c-1 #0 a=062 f=0000
>> l=1 [88]
>>>              cat-17623   [004] .... 1152583.811281: i2c_read: i2c-1 #1 a=062 f=0001
>> l=2
>>>              cat-17623   [004] .... 1152583.811700: i2c_reply: i2c-1 #1 a=062 f=0001
>> l=2 [2f-f0]
>>>              cat-17623   [004] .... 1152583.811700: i2c_result: i2c-1 n=2 ret=2
>>>              cat-17623   [004] .... 1152583.811704: i2c_write: i2c-1 #0 a=032 f=0000
>> l=3 [25-dc-00]
>>>
>>> When the same line card is inserted for example at slot 3, the
>>> adapter, to which this device is connected will be 304.
>>
>> Yes, I think I get it. You are however not introducing base_nr until 6/6, so at
>> this point the code makes no sense. But even after 6/6 with base_nr in place, I
>> suggest the following:
>>
>> - The adap_ids array is for forceing the system global adapter id. Leave this
>> variable
>>   alone and let it continue to do what it does, and only that. Or...
>> - Since you stated somewhere that there are no users of this drivers, I'd be
>> happy to just
>>   see the adap_ids variable deleted, i.e. I see no need to force the adapter id.
>> - Instead of reusing adap_ids, intruduce a new "channel" array and fill it with
>> the same
>>   values that you provide in adap_ids, and then have the driver feed them to
>> the 3rd arg
>>   of i2c_mux_add_adapter(), i.e. chan_id.
>>
>> Would that work for you? Or do you somehow depend on predictable adapter
>> ids?
> 
> I can drop adap_id[]s, use chan_ids[] instead and modify loop for adding
> Adapters like:
> 	for (num = 0; num < pdata->num_adaps; num++) {;
> 		err = i2c_mux_add_adapter(muxc, pdata->base_nr + num,
> 					  pdata->chan_ids[num], 0);
> 		if (err)
> 			goto virt_reg_failed;
> 	}
> 
> In such way I can keep convention for adapters numbering for card in slot 'n',
> nrs will be:
> Form 100 * n + 1 - for voltage  regulators, hotswap, EEPROMs, iio, ...
> From 100 *n + 16 - for FPGAs.
> From 100 * n + 32 - for gearboxes.
> From 100 * n + 64 - for QSFP.
> 
> Would it be OK?

What convention are you talking about? What makes it interesting to force specific
adapter IDs? I just don't see the point. I would do

		err = i2c_mux_add_adapter(muxc, 0, pdata->chan_ids[num], 0);

and let the adapted ID be whatever the I2C core makes up.

What's wrong with that?

Trying to force specific adapater IDs risks failure whenever any of those IDs
happen to be taken, and you have no way of preallocating some range the I2C
core should not use. The only way to do what you do is to select some
high enough ID range and hope for the best. But what if someone else does the
same thing? It's just a slippery slope. So, why?

Cheers,
Peter
