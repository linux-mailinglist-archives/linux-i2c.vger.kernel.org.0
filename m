Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0D262EEE48
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Jan 2021 09:03:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbhAHIDK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Jan 2021 03:03:10 -0500
Received: from mail-eopbgr80101.outbound.protection.outlook.com ([40.107.8.101]:33259
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725869AbhAHIDK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 8 Jan 2021 03:03:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IFTXTbbFUC0tm8hObhnh2HNMHeww9g310xNtPUiUptIKLiTgE8FZU2LwAgDRhaJFZM+OaJlX/IwfF5h7JnjMHsKYowkzu0mtPLsQU9zQw9HyLPSMwoGfeTqQdELal0kXX2ZDUZicqAkfmy/gfwia+/N5XlXnJymiDclV/Fe4vtA/VmN+acpmzmfTmeTYvJWvrrz0N/ZOx9GZl38y/sm4sOFyh7mw3TYd2p6e/KOisrBX7eL/owCOJ9LRwK9jvdIyleG8FT8Ks6LDo7k15CYi0Tz7NBlQ2DkHBq6AecdA7LNiBRZ6/3AdxJlDaDLT0FneteQVKQ67rZe4hUgHO6/N1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QKb8n4Z/cPhIXvozvI5fEOuij6tGE/H9DbYGW2E9LvE=;
 b=GtZdo5PH3xs0/j6CQS7q6wGRCkcWmyZUyL4n0WOQyBFZv4kTLlkWqBuEsMvFJpp8tBbvMNZANn+y+46vRjdB3/S6ZicuPmBbNm4gQdgsXwwU8wwyEFKNbjEdm9yWI34hlVVSW0guCvP2G22R2F+ytsatWEtEhgV1mF3LqgYBOKtZJDHInltYi/fWyNgp1AVLD/HAYAGQTFMdANMKzPUpZSUuinly73SueysD4GtQ7IbmzozOmhAMZVF81Wgi5ba6GJ3QtUPTaBm0fTpBoPqeARX6cpYZgowfjGHQmTgmJb5RZbJM3l7giOanlbcZyJlvw8OzeR9KZwuyYvOjUa0pSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QKb8n4Z/cPhIXvozvI5fEOuij6tGE/H9DbYGW2E9LvE=;
 b=k16dJS7tVgYURFzmNzo+i9EN7iV27xi4g2FgFFBHt0nu67yTCSgQ4fvCKrojelbKCYvvdaExfLSKP4fAm9+Ly+h+sQb/ErldEraOBVUSqCT03DerUtO+PWFR5iH5YbfkOg9ytFAnuiVPOdisNdHYmP62F+0hyTjsAYcd6OKnLvg=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB7PR02MB3676.eurprd02.prod.outlook.com (2603:10a6:5:1::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.8; Fri, 8 Jan 2021 08:02:19 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f%6]) with mapi id 15.20.3742.009; Fri, 8 Jan 2021
 08:02:18 +0000
Subject: Re: [Re-send: PATCH i2c-next 5/6] i2c: mux: mlxcpld: Extend driver to
 support word address space devices
To:     Vadim Pasternak <vadimp@nvidia.com>,
        "wsa@the-dreams.de" <wsa@the-dreams.de>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <20201118144416.184120-1-vadimp@nvidia.com>
 <20201118144416.184120-6-vadimp@nvidia.com>
 <b1e3b52d-ddb2-ac56-665c-7500c939a55d@axentia.se>
 <DM6PR12MB38989872E06EA9593E862F23AFAF0@DM6PR12MB3898.namprd12.prod.outlook.com>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <268612bc-dc4a-cfcd-f529-e8540adfd8dc@axentia.se>
Date:   Fri, 8 Jan 2021 09:02:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <DM6PR12MB38989872E06EA9593E862F23AFAF0@DM6PR12MB3898.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: sv-SE
Content-Transfer-Encoding: 7bit
X-Originating-IP: [85.229.94.233]
X-ClientProxiedBy: HE1P190CA0024.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:bc::34)
 To DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (85.229.94.233) by HE1P190CA0024.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:bc::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 08:02:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 707480e6-4dd6-47e5-0b8e-08d8b3abb81e
X-MS-TrafficTypeDiagnostic: DB7PR02MB3676:
X-Microsoft-Antispam-PRVS: <DB7PR02MB3676E3690B9E19402D9CF081BCAE0@DB7PR02MB3676.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F8IiFNCqrV/2BIFogBfy0DVKnpOESQUK3dTFS8fUAupVNJwCtAe9b8itvTjIMCfME03PTGiRu08zRsYOtDmKGZvDoYIadfPuAC+/v9+NW90EnIe6D2Rkvd+LACJCTHWPLVoiA13Vc+lFJwu1yQtXI4msB6SfGko2RCaW6ooWu2SFMHh38+daSL4BRQls1LJadIohFq1v/dpp3IEc39cZXDvrDaA5sHN9Ijw9SKl0HAGgLHsrkGyX2W0xDKs2mSGhYZGsh69PfPT65MUu2ilgLnY3xymkVgfy5bg8njJeGKpLVmb60dktvFZFV46rDy5E6qtUJXVjIxoIUurPIf39iYf2xSYEZWyyCUkrn0QOpfIrwz+5SpYEJUFOS6PnIggqvSrE5rP5UuydGeKkl0e6xGfor6UX7u9i5nfPNt0mxCtBvJsI//D2/hVBKpRsxzZa0IAVnVOu3lDkacfPcBESyYLKZZDkDPHlTOjJjZPBq6e09Plo27CyBDp/kHbJ+GR1
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(39830400003)(396003)(376002)(136003)(366004)(346002)(6666004)(8936002)(2906002)(4001150100001)(31696002)(86362001)(316002)(31686004)(956004)(2616005)(83380400001)(8676002)(36916002)(16576012)(110136005)(30864003)(5660300002)(66476007)(36756003)(66556008)(53546011)(16526019)(66946007)(4326008)(26005)(186003)(6486002)(478600001)(133343001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Z0x6a1FrS1VqTU9GMXdCME54MzBlMDZWTWdmRWFSMkJ5eHV5bjdRMmRKWjhi?=
 =?utf-8?B?QjZlZWV1ME81d1NaS1FUSE5vbDZoUEZCMjBSb2dQRDhxRUJYUGNpREs5bExa?=
 =?utf-8?B?ZE1ub0tpNlAyRExhMnE2NVdacVYxcXZVMDQ1WlN1SEFQeHExS1NZdkFTWHZq?=
 =?utf-8?B?M3AxZG9QOHlCRlE4MWNsSFB2cVVldmJJWG85ZUdCbHNvekRENHZpZ0pQeWVv?=
 =?utf-8?B?S3NINmw3b1FWcHhpbFhCdzJramYzYVBCZEVXL0ZSc0doTE1FTkZqTXFaWDJi?=
 =?utf-8?B?MmdmNUpxVmpIMFEyZXdRTXVFWEgvQkhGR25oR1QzZE9KTkVSejJKZUlheEhm?=
 =?utf-8?B?Sm1YUTBvTWx2eHM0S2xIOWdubW1OSWNvdGFWajZteUs2Rm1lTytabEQwa1M1?=
 =?utf-8?B?Y1ptWW53RWlCSmp5alRIdVFYcHBHY3VtVWtzdFp5RWZvNzdXK0FodUdvRVlZ?=
 =?utf-8?B?eFVGMUhLN096bHR0Qy9xUXNKeThLQ3FBRWJEeVRpT24wZVhLWmxFTlhTWFVC?=
 =?utf-8?B?VkZzTmUzeElteWNqZ1J4SUpiNEdQdnFIM1VoRnJRSTR0NS9WeiswOFdXWGZq?=
 =?utf-8?B?NWZOSlpabThaYTJMTEJKT0NNV3lTdno5QXN6dWtUVTIrem1HdFFqMXdZR0dZ?=
 =?utf-8?B?eUVCR0N1T2hoR0lkQWN4RExEQmhwV0RtSzdxQzNzRWZoMWRacG0xSGs0VlpI?=
 =?utf-8?B?TEM1RHphZHJiMDNIblBsNysvbjg3WExTdXNsTU5iaUtLY3ZqSEZxTzB1Y0Jw?=
 =?utf-8?B?VDlMQ2hRckZJOUIzck9KMGVaSGlKTW9pVzlNQnBRU2FnOTJpN2VqeG5kOXdL?=
 =?utf-8?B?ZTRFdW85RU96SXpTV1VUeUlmSGdFaGFVR2tTTHVianVaV3hpaFhQRTRKUUFl?=
 =?utf-8?B?WXgrMXV2MWJyNGlXYk5NREpsd3dyNUczNCtZeXo3MnpFMGNCVkJySDZSVlhM?=
 =?utf-8?B?bjJrekdxL2FoNjhqakxBYVhHNllUZFZIcUhBK093U0kvcGNqZlFXM1B4N0xW?=
 =?utf-8?B?MUhvQmNXL0xPTGwvUVo5ZGhvMkkwMlVyaUwrN21wYkZoSTRBZU11TGtPTXgz?=
 =?utf-8?B?TzRkbUpLSXppNE1teDN4TVAzR3dPc245ZnpJcVlzUVNKMi9RRFMxZFk4RG80?=
 =?utf-8?B?dHNDbDhzVCszRTd3VXhSVzhod3JETXV3VDlsSjFoWFg1eEE4REZRY0VOWHl3?=
 =?utf-8?B?aWRkWVN4U0xwUytOM2pYTW9nUHQvWitWT1JRL3BIOTJLL296MXorRDNrN0Zr?=
 =?utf-8?B?S1BsWGFnejZSbXVNQkpnbHVjUGtyaUY4ekxIOG0rWEZlaUZva2IxYmo1VXhP?=
 =?utf-8?Q?gKD+cgzfSkD9/8lnPel9yg6rDli0gKZWTM?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 08:02:18.0242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-Network-Message-Id: 707480e6-4dd6-47e5-0b8e-08d8b3abb81e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xjUXSEq0MU5HVJgFaa8kO9iGEseZICXeMyuiSNR0607LO8C39e1/3L7daqKsdlvu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR02MB3676
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

On 2021-01-07 21:43, Vadim Pasternak wrote:
> Hi Peter,
> 
> Thank you very much for review.
> 
>> -----Original Message-----
>> From: Peter Rosin <peda@axentia.se>
>> Sent: Thursday, January 07, 2021 12:04 PM
>> To: Vadim Pasternak <vadimp@nvidia.com>; wsa@the-dreams.de
>> Cc: linux-i2c@vger.kernel.org
>> Subject: Re: [Re-send: PATCH i2c-next 5/6] i2c: mux: mlxcpld: Extend driver to
>> support word address space devices
>>
>> Hi!
>>
>> Again, sorry for the late review.
>>
>> On 2020-11-18 15:44, Vadim Pasternak wrote:
>>> Extend driver to allow I2C routing control through CPLD devices with
>>> word address space. Till now only CPLD devices with byte address space
>>> have been supported.
>>>
>>> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
>>> Reviewed-by: Michael Shych <michaelsh@nvidia.com>
>>> ---
>>>  drivers/i2c/muxes/i2c-mux-mlxcpld.c   | 57
>> +++++++++++++++++++++++++++--------
>>>  include/linux/platform_data/mlxcpld.h |  2 ++
>>>  2 files changed, 47 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/drivers/i2c/muxes/i2c-mux-mlxcpld.c
>>> b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
>>> index 6bb8caecf8e8..c76180919fc3 100644
>>> --- a/drivers/i2c/muxes/i2c-mux-mlxcpld.c
>>> +++ b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
>>> @@ -21,11 +21,13 @@
>>>   * @last_chan - last register value
>>>   * @client - I2C device client
>>>   * @pdata: platform data
>>> + * @sel_buf: I2C message buffer for mux select 16 bits transactions
>>>   */
>>>  struct mlxcpld_mux {
>>>  	u8 last_chan;
>>>  	struct i2c_client *client;
>>>  	struct mlxcpld_mux_plat_data pdata;
>>> +	u8 sel_buf[3];
>>
>> I think it's a mistake to have this buffer here. I'd rather create a buffer on the
>> stack in mlxcpld_mux_reg_write() and fill it with values for every xfer.
>> Sure, I bet there are external locks that prevent any clobbering of the buffer,
>> but it's so small that it really can be on the stack.
>>
>>>  };
>>>
>>>  /* MUX logic description.
>>> @@ -60,26 +62,42 @@ struct mlxcpld_mux {
>>>   * for this as they will try to lock adapter a second time.
>>>   */
>>>  static int mlxcpld_mux_reg_write(struct i2c_adapter *adap,
>>> -				 struct mlxcpld_mux *mux, u8 val)
>>> +				 struct mlxcpld_mux *mux, int chan)
>>>  {
>>>  	struct i2c_client *client = mux->client;
>>> -	union i2c_smbus_data data = { .byte = val };
>>> -
>>> -	return __i2c_smbus_xfer(adap, client->addr, client->flags,
>>> -				I2C_SMBUS_WRITE, mux-
>>> pdata.sel_reg_addr,
>>> -				I2C_SMBUS_BYTE_DATA, &data);
>>> +	union i2c_smbus_data data;
>>> +	struct i2c_msg msg;
>>> +
>>> +	switch (mux->pdata.reg_size) {
>>> +	case 1:
>>> +		data.byte = (chan < 0) ? 0 : chan;
>>> +		return __i2c_smbus_xfer(adap, client->addr, client->flags,
>>> +					I2C_SMBUS_WRITE,
>>> +					mux->pdata.sel_reg_addr,
>>> +					I2C_SMBUS_BYTE_DATA, &data);
>>> +	case 2:
>>> +		mux->sel_buf[mux->pdata.reg_size] = (chan < 0) ? 0 :
>>> +						    mux-
>>> pdata.adap_ids[chan];
>>
>> I get the feeling that you are desperatly trying to get some specific numbering
>> in user space.
>>
>> The adapter id is one thing.
>> The mux channel is one thing.
>> The value in the register is one thing.
>>
>> Often, it can make things easier with an easy mapping between the latter two,
>> but you program the system global I2C adapter id into the channel selection
>> register of the mux. That is problematic. Just don't.
> 
> OK, I will explain what I am trying to get.
> This is not something related to the user space.
> 
> I want to access some device, located on a line card, which is replaceable.
> This is for modular system, which can be equipped with the different type
> of line cards.
> 
> I have mux selector register in line card CPLD, which is located at some offset in
> CPLD register space, f.e. 0x25dc. On other systems it could different offset.
> 
> For this line card type in pdata.adap_ids[] channels mapping looks like: 
> {
> 	0x04, 0x05, 0x06, 0x07, 0x08, 0x10, 0x20, 0x21, 0x22, 0x23, 0x40, 0x41,
> 	0x42, 0x43, 0x44, 0x45, 0x46, 0x47, 0x48, 0x49, 0x4a, 0x4b, 0x4c, 0x4d,
> 	0x4e, 0x4f
> };
> Ids from 0x01 - 0x0f are used for access to devices like  voltage regulators, hotswap,
> 	EEPROMs, iio, etcetera.
> Ids from 0x10 are used for FPGAs.
> Ids from 0x20 are used for gearboxes.
> Ids from 0x40 are used for QSFP.
> On other line card type it could be different device tree, but it still will follow the same
> convention.
> 
> CPLD is connected to some upper adapter at address 0x32, and device on line card
> is connected to adapter = base_nr * slot + pdata.adap_ids[channel].
> For example, base_nr is 100, slot, at which line card is inserted  is 1, channel 0 will be
> be configured for adapter 104.
> 
> And access will be as below:
> cat /sys/bus/i2c/devices/104-0062/hwmon/hwmon5/in1_input 
> 11750
> 
>              cat-17623   [004] .... 1152583.810824: i2c_write: i2c-1 #0 a=032 f=0000 l=3 [25-dc-04]
>              cat-17623   [004] .... 1152583.811276: i2c_result: i2c-1 n=1 ret=1
>              cat-17623   [004] .... 1152583.811281: i2c_write: i2c-1 #0 a=062 f=0000 l=1 [88]
>              cat-17623   [004] .... 1152583.811281: i2c_read: i2c-1 #1 a=062 f=0001 l=2
>              cat-17623   [004] .... 1152583.811700: i2c_reply: i2c-1 #1 a=062 f=0001 l=2 [2f-f0]
>              cat-17623   [004] .... 1152583.811700: i2c_result: i2c-1 n=2 ret=2
>              cat-17623   [004] .... 1152583.811704: i2c_write: i2c-1 #0 a=032 f=0000 l=3 [25-dc-00]
> 
> When the same line card is inserted for example at slot 3, the adapter, to which this device
> is connected will be 304. 

Yes, I think I get it. You are however not introducing base_nr until 6/6, so at this point
the code makes no sense. But even after 6/6 with base_nr in place, I suggest the following:

- The adap_ids array is for forceing the system global adapter id. Leave this variable
  alone and let it continue to do what it does, and only that. Or...
- Since you stated somewhere that there are no users of this drivers, I'd be happy to just
  see the adap_ids variable deleted, i.e. I see no need to force the adapter id.
- Instead of reusing adap_ids, intruduce a new "channel" array and fill it with the same
  values that you provide in adap_ids, and then have the driver feed them to the 3rd arg
  of i2c_mux_add_adapter(), i.e. chan_id.

Would that work for you? Or do you somehow depend on predictable adapter ids?

> So I am using  preconfigured buffer with mux address, which I want to right, here it is 0x25dc.
> On select I write channel Id to this register (sel_buf[] = { 0x25 0xdc <adap_ids[channel]>} ), on
> deselect zero (sel_buf[] = { 0x25 0dc 0x00 }).
> 
> I can have a buffer on stack and set it each time mlxcpld_mux_reg_write() is called,
> as you suggested.
> 
> Which API you suggest to use here for sending I2C transaction?

I suspect that this driver will only be used with a very limited list of I2C adapters,
and that all of those support whatever method you use. I also supsect that in practice,
the i2c_check_functionality() checks will always succeed because of this, so my
comments in regard to this are probably mainly cosmetic. But it's easier to read code
when things fit, and problems like that tend to "escape" when someone reuses the code.

So, use whatever suits you, but make it consistent. :-)

However, SMBUS has 8-bit commands/registers, so it doesn't really fit. You could still
shoe-horn your xfers in there, if you desperately needed to support some SMBUS-only
adapter, but I think I would have stayed with __i2c_transfer() for the 16-bit case.

>>
>>> +		msg.addr = client->addr;
>>> +		msg.buf = mux->sel_buf;
>>> +		msg.len = mux->pdata.reg_size + 1;
>>> +		msg.flags = 0;
>>> +		return __i2c_transfer(adap, &msg, 1);
>>
>> Here you use I2C xfers for the 16-bit case...
>>
>>> +	default:
>>> +		return -EINVAL;
>>> +	}
>>>  }
>>>
>>>  static int mlxcpld_mux_select_chan(struct i2c_mux_core *muxc, u32
>>> chan)  {
>>>  	struct mlxcpld_mux *mux = i2c_mux_priv(muxc);
>>> -	u8 regval = chan + 1;
>>>  	int err = 0;
>>>
>>>  	/* Only select the channel if its different from the last channel */
>>> -	if (mux->last_chan != regval) {
>>> -		err = mlxcpld_mux_reg_write(muxc->parent, mux, regval);
>>> -		mux->last_chan = err < 0 ? 0 : regval;
>>> +	chan++;
>>
>> I question the removal of the regval variable. See above.
> 
> I will return back 'regval' and make assignment base on register size.
> 
>>
>>> +	if (mux->last_chan != chan) {
>>> +		err = mlxcpld_mux_reg_write(muxc->parent, mux, chan);
>>> +		mux->last_chan = err < 0 ? 0 : chan;
>>>  	}
>>>
>>>  	return err;
>>> @@ -103,13 +121,26 @@ static int mlxcpld_mux_probe(struct
>> platform_device *pdev)
>>>  	struct i2c_mux_core *muxc;
>>>  	int num, force;
>>>  	struct mlxcpld_mux *data;
>>> +	u16 sel_reg_addr = 0;
>>> +	u32 func;
>>>  	int err;
>>>
>>>  	if (!pdata)
>>>  		return -EINVAL;
>>>
>>> -	if (!i2c_check_functionality(client->adapter,
>>> -				     I2C_FUNC_SMBUS_WRITE_BYTE_DATA))
>>> +	switch (pdata->reg_size) {
>>> +	case 1:
>>> +		func = I2C_FUNC_SMBUS_WRITE_BYTE_DATA;
>>> +		break;
>>> +	case 2:
>>> +		func = I2C_FUNC_SMBUS_WRITE_WORD_DATA;
>>
>> ...and here you setup to check for SMBUS for the 16-bit case. And the type of
>> SMBUS xfer is not compatible with the xfer that is actually taking place.
>> WRITE_WORD_DATA is 8-bit register and 16-bit data. You have the opposite.
>> So, this check is broken.
> 
> Yes. I have to check for I2C functionality, so it should I2C_FUNC_I2C, yes?

Yes.

Cheers,
Peter

>>
>>> +		sel_reg_addr = cpu_to_be16(pdata->sel_reg_addr);
>>> +		break;
>>> +	default:
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	if (!i2c_check_functionality(client->adapter, func))
>>>  		return -ENODEV;
>>>
>>>  	muxc = i2c_mux_alloc(client->adapter, &pdev->dev,
>>> CPLD_MUX_MAX_NCHANS, @@ -122,6 +153,8 @@ static int
>> mlxcpld_mux_probe(struct platform_device *pdev)
>>>  	data = i2c_mux_priv(muxc);
>>>  	data->client = client;
>>>  	memcpy(&data->pdata, pdata, sizeof(*pdata));
>>> +	/* Save mux select address for 16 bits transaction size. */
>>> +	memcpy(data->sel_buf, &sel_reg_addr, 2);
>>>  	data->last_chan = 0; /* force the first selection */
>>>
>>>  	/* Create an adapter for each channel. */ diff --git
>>> a/include/linux/platform_data/mlxcpld.h
>>> b/include/linux/platform_data/mlxcpld.h
>>> index e6c18bf017dd..da4f7e8f5721 100644
>>> --- a/include/linux/platform_data/mlxcpld.h
>>> +++ b/include/linux/platform_data/mlxcpld.h
>>> @@ -14,11 +14,13 @@
>>>   * @adap_ids - adapter array
>>>   * @num_adaps - number of adapters
>>>   * @sel_reg_addr - mux select register offset in CPLD space
>>> + * @reg_size: register size in bytes (default 0 - 1 byte data, 1 - 2
>>> + bytes data
>>
>> The reg_size isn't in bytes according to the brackeded info. Missing end
>> bracket as well...
> 
> Will fix it.
> 
> Thank you very much,
> Vadim.
> 
>>
>> Cheers,
>> Peter
>>
>>>   */
>>>  struct mlxcpld_mux_plat_data {
>>>  	int *adap_ids;
>>>  	int num_adaps;
>>>  	int sel_reg_addr;
>>> +	u8 reg_size;
>>>  };
>>>
>>>  #endif /* _LINUX_I2C_MLXCPLD_H */
>>>
