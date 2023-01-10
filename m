Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 839BC663B6C
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jan 2023 09:41:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238045AbjAJIlX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Jan 2023 03:41:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237988AbjAJIks (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Jan 2023 03:40:48 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01olkn2081.outbound.protection.outlook.com [40.92.99.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 786CDD65;
        Tue, 10 Jan 2023 00:40:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQJI5Rs6x9O9Ws5U3QjQBvoNI88BAyTVz0QhVJQi7E/XAiRTb6K4ol76LTeCGynTHV97oU6kmxUr3g0t8qQ67PAnzk9IIow2fDLXFRgf7R3EbFiNQ103/Fc2eVsu5+nHRSiGE0PQnInbHBYXMlC47mpI5mJobEY+5tJejuoov1TxXF6y+dNzmprPsJqNa9u+ENWNBDopBIrvKAj3A1hYDVA63kSrlv9HfbdxXopPOuQRFlstIdhSicll0mNCK4F2lEbgLjTOHskS8c+QqY5hEN+WsCYeg9i+Ix3WZ7b7K8TJM13BazrMZMBo3RmeOy9l6cx3kik0JgGtZJytpBNuaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+JZ4giDhCNyHRPtKNrOXZMb/39YsOO5Y9jO2/kky7gM=;
 b=UlglfA6tbB0+QvQjEyMCyqClNVLpoVuxgX3UMnZM4iPLM87UvVo2CkSMgb2z6JgDU6fSXZpfHAhSGjdfrsb5kH3AMOmdS1YhRP7nnm5TmQ79fxAoRaLXvmZj3gJtWwHiJCWUB8EWpxRdIsUEUF8F3+dkFbhCcto5vMsif1Keci81rPqyY6gMu3YFJLaljaCDbGQMjWgRzsa6ZxDpW8KS9Rqy991Dvx4KjdGB3RSQ9nIUnnogXjqDxSuYI0scV8zr2lCmvZBzBNT3ePqjQ+5OsOaZXPmhrRGpH6sHKBVokblJ8a9uy8+JQ9c7q075moZVEDEZ0KwHN6Ef1+rnY8Oj3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+JZ4giDhCNyHRPtKNrOXZMb/39YsOO5Y9jO2/kky7gM=;
 b=C9tv51HNivVjxmHBWsGkKpjTcNXUxim2TM/Fm3lz0B+5XkH6a/H9Z/CtmSJN74rMg6/gBVN1RFUvP9sk7ku7KoBDsu+NmSyQYHKKMqU3Hl5p3RK7qXnbPwsT2PbPKfE1c+WuWxd0mZ1f/xRlZRacXZJce/maGvhGCVqllqGUHMsTgBN9xR1h++OK+MiF6aRHIDpryI5+WIWGePEfBXAA+sa7BZK6ZMB/iQlQNdl1GXgK22qkZiWUxqNZz974s5N3Ys1dnGtEjpfx7G4DSIJGkigbCN0wpvTXOnogwt2uIB9pzXZJW3vMbuA37SFHfMtO/hHzhBDFMSBZIADCzcZcVw==
Received: from TYCP286MB2607.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:242::11)
 by OS3P286MB1733.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:162::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 08:40:44 +0000
Received: from TYCP286MB2607.JPNP286.PROD.OUTLOOK.COM
 ([fe80::cb1a:a539:b3e3:e496]) by TYCP286MB2607.JPNP286.PROD.OUTLOOK.COM
 ([fe80::cb1a:a539:b3e3:e496%4]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 08:40:44 +0000
Message-ID: <TYCP286MB2607A8F23BC707F4E4FD8859B1FF9@TYCP286MB2607.JPNP286.PROD.OUTLOOK.COM>
Date:   Tue, 10 Jan 2023 16:39:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1] i2c: i2c-core-base: Modify the maximum idr id for i2c
 adapter
To:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, xiongxin@kylinos.cn,
        Riwen Lu <luriwen@kylinos.cn>
References: <TYCP286MB26079F414019C8AC9303E412B1E69@TYCP286MB2607.JPNP286.PROD.OUTLOOK.COM>
 <Y7wvLi2lA1bSH5By@ninjato>
Content-Language: en-US
From:   Riwen Lu <luriwen@hotmail.com>
In-Reply-To: <Y7wvLi2lA1bSH5By@ninjato>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TMN:  [foSQThLzOTBvyKsgeTNq6VbTxcrVIaBlTkO/x9xwoZU=]
X-ClientProxiedBy: TYCPR01CA0065.jpnprd01.prod.outlook.com
 (2603:1096:405:2::29) To TYCP286MB2607.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:242::11)
X-Microsoft-Original-Message-ID: <579faa8b-d967-7faf-d7c0-9e322cfdb39f@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB2607:EE_|OS3P286MB1733:EE_
X-MS-Office365-Filtering-Correlation-Id: dd52ed9c-24a6-445a-ff42-08daf2e65cd0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r3lkc7HpafZN85fkHQrXuPNxnAAHZ6E5VZ/o5RJWnKCtyDg+oJZcP6vfFPow0VUeyCCrgWoyPQE0nBipR9XCKCEsGWX/4XVDKCVYTqqNN6aG62IaagPga+GzGdF006lx56TCWRH5VEZxNnPo/maryZdcCYn/c+aSvrz3gwszwuSjM69up5a3f4JsSJOPqDpCOW6cTQ8aeGPOxxWjQ2Lk3lXs+Ar5KDW5BY4UBbrmcmoPujeOBM16AMUXfKiFK7XM/T60ARyIenCWZpbqsECmKYnaKIXhNS8O3nOTi01G7Dx6g/w2HFAA6hmN8+rNPsf2zxC/o2orE2tpn1u6EVEhz70hq7hQvtl9pDhIFVAdK/KSID34bfyvccXRaO2koZbmJLvOKxTEO9GWT8gUkjdV4ZVpVtTHLJ/uJA0UctRyNKYcOBWCokP6vSDjdO8vTyKzOi4ehZNBtqW3fKeKlI38kP8fR54YKqNFgw4C8AAGAlaDniRvPm8Iv6eO9tgy+cfOgITA0cIc/PjW/OJiZZxUouD1olqeu2BnzZhh+sbp08YWu77IQIvZnUh1CILUMijRTOLes1G+U6+CyuyWY88dat6mBMzd/Hvd1ZsqzjYWHP//Ia2mhkgHej/DiPzNRecaH6nIHocBXpdcZCUd1z2tFw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmRCWVNqYzNWSFgvd2VkMUVvS05VUEs0Tmx6bmhBbzNZd2dkWkZyREExQ1RS?=
 =?utf-8?B?UllRYUpXdm9CQmp5dWhkOGNXekx6SHJVOEZzalFtVHg3cTdlMlZWcnhhUXFM?=
 =?utf-8?B?VEpaTWw4TGJ1RjdRU3AzUTVQSW5GQXo5M01oSGlQNnRZNDV3Tk4yVEVzM24z?=
 =?utf-8?B?MWYyb3lkNnh4MUFWemdmSFM0SVlLZmlIajA5QkcvY1VvZ3FTaW1zRzJ4Y3RN?=
 =?utf-8?B?blZibFlGcWdheDhCQmRpODVMTThEZmNWZ014dDVVdXFCRnoxbzd4QzByOE41?=
 =?utf-8?B?MGNCTWVlUTRPemVaanltNFJoQnk3bXFFY282TGFvblFBVEtWRTA0SWd2NW5n?=
 =?utf-8?B?c3VLRnBkVmpyeVhydFc2WjUxVFZNK1piNHZVdlByZjBTVHRBRDV5T3M1SFJG?=
 =?utf-8?B?TWtGbW1IM1BRNzhkcmNiNEV2K2pOVXFRRHh5WklmZms3WVI1MmEybC9KcEg0?=
 =?utf-8?B?MnhPUXpFdnpFSTBUZEtJemFTMUFnNS81SDQvOXBUTDlqVFNPNlpVTHV0SUNt?=
 =?utf-8?B?OXBEYmRhanl3WWpTWjIxUGt4ei9YSFRqRXRDRjhqSXFUbWJWWW1jQzYyY3Fr?=
 =?utf-8?B?OHQ4T3NVbGhhdjUwNFA4MHZiWFc4Qis1R096Nms4WTRGYzlWWkZjZnRhK0pw?=
 =?utf-8?B?SVhSYmIrdWg3TGRLVlhtODZ5cndiUUtvb1B4a0xHZTd4L3pvSGpkc3p0V1RK?=
 =?utf-8?B?VFJieWZHNVU3STM4aUsyZWx6dms1THI4RFlRbWlxWlZMWGdaZUw2bTRNN1F4?=
 =?utf-8?B?RWN4RzY0MXIvbXJPQlJZR0pYVm5HaHhpdlVlMkY5M3dUUWpIVjZLcSt5ZlNp?=
 =?utf-8?B?SzBjSmFLb3M3NXlhVGg5RmhVS0o3aFkzVHBsTWR4U2xPV2RubHJlL1dmZjBr?=
 =?utf-8?B?dmh0cmlnYXp3QWRVbWhMMGh6czRZTTJObHpJTmVZdkhSNGhxSUJJR3BlQU14?=
 =?utf-8?B?Q0loM1BmRjZ4Q0M4aEV4TDdaSU5DaVdvQWZFdERGUk5DUTNrZ1p1Z1JaL0p0?=
 =?utf-8?B?UjcyS2UxdzBwSEsveGs3OFZZVkJXMFpGM2ZhZlBSSFVYWWsxWjJRQ3NXa2JY?=
 =?utf-8?B?aCtmVk5HclRKWmhoNEtzTXZHTXZwVFFPQXcxL1VjVWRLOSsyWERWeDBsWkF6?=
 =?utf-8?B?T3owWGFVRlFzaTlWL2N5cDl5MjcydDcvKzBRMEJOY1A0LzlNMHI4V0NlY2hh?=
 =?utf-8?B?b1BLWmtzQlNOZ3Q4ajVJMTJ6djdUTk1Oa3FiRzg2WENXM3d1VkpWTHdlVE95?=
 =?utf-8?B?MGJxd1hiYXZ4cC8vbzFPdUxWZzh2aTEyY3NiODNxLzBVSUJwZ2I0bDkwTUxI?=
 =?utf-8?B?MUdpVkErYjF5YVlXUms3MVZzRm0zd0YxUUhRSVdjZGtreWM0bFM4S1VxcjZU?=
 =?utf-8?B?SER5UzM0WkxMZHk1TTlhcTl6cThiOFppZWNoSm10SXdkZCszejdnWWswUnBS?=
 =?utf-8?B?RStBQnRwdnFkbEozK3RyNnI3NkE5WDhsYnREYVA5UVZqRm94ZXkrbGI3bU5X?=
 =?utf-8?B?UFM1OXltMDhBSUNoZ1F4YnNDbFV6eFZzTTB5cnlFTXNmeTdvMUdVYnV6RmVF?=
 =?utf-8?B?WVFVRUJnU0RxMStVeUVEVURteEZDTmVmdTlZbmxLSTNNcXlzS1hObU1jeUtn?=
 =?utf-8?B?NG1rMjZrcnJZTGtoTmt3RVVnS0lRZ29jK01CRmNNQnFpMk5nUEJyaVdCaXdG?=
 =?utf-8?B?UC9FOHJaRStCSUNQa1hVb2hNM1RIaE5pUEMwUFRzMG1aTENNb2dFQ0xnPT0=?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-05f45.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: dd52ed9c-24a6-445a-ff42-08daf2e65cd0
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB2607.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 08:40:44.2448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3P286MB1733
X-Spam-Status: No, score=0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_MUA_MOZILLA,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

在 2023/1/9 23:13, Wolfram Sang 写道:
> On Fri, Dec 16, 2022 at 10:07:51AM +0800, Riwen Lu wrote:
>> From: Riwen Lu <luriwen@kylinos.cn>
>>
>> Change the maximum idr ID to INT_MAX for i2c adapter.
>> This fix the following adding i2c adapter error while the idr with
>> adap->nr has been allocated by other i2c driver, and find a proper ID
> 
> How did this happen that another i2c driver could get this? Were you
> able to follow the code paths that lead to this situation?
> 
Yes, it's happened in Phytium(Arm64) platform with MWV207 GPU.

1. The MWV207 GPU driver has registered I2C adapter, and allocated idr 
id 0-6 with i2c_adapter_idr.

# cd  /sys/class/i2c-adapter/i2c-0/
# ls
i2c-0  i2c-1  i2c-2  i2c-3  i2c-4  i2c-5  i2c-6
# cd i2c-0/
# ls
delete_device  device  i2c-dev  name  new_device  power  subsystem  uevent
# cat name
MWV207_I2C_0

2. The BIOS's ACPI DSDT has declared I2C device with _UID 0 as following:

         Device (I2C0)
         {
             Name (_HID, "PHYT0038")  // _HID: Hardware ID
             Name (_UID, Zero)  // _UID: Unique ID
             Name (_CRS, ResourceTemplate ()
             {
                 Memory32Fixed (ReadWrite,
                     0x28014000,
                     0x00001000,
                     )
                 Interrupt (ResourceConsumer, Level, ActiveHigh, 
Exclusive, ,, )
                 {
                     0x0000007C,
                 }
             })

             ...
         }

The Phytium i2c driver would register the i2c adapter with idr id 0 by 
calling function i2c_add_numbered_adapter(adap). Then, function 
idr_alloc(&i2c_adapter_idr, adap, adap->nr, adap->nr + 1, GFP_KERNEL)； 
allocate the idr failed because idr id adap->nr(It equal to _UID) has 
been allocated by MWV207 GPU, and print the following error:

couldn't get idr
i2c-phytium-platform PHYT0038:00: fail to add adapter: -16

This patch can solve the problem.
>> for it.
>> [  357.620685][ 3] [ T3655] ------------[ cut here ]------------
>> [  357.626544][ 3] [ T3655] couldn't get idr
>>
>> Signed-off-by: Riwen Lu <luriwen@kylinos.cn>
>> ---
>>   drivers/i2c/i2c-core-base.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
>> index 7539b0740351..c2982861057a 100644
>> --- a/drivers/i2c/i2c-core-base.c
>> +++ b/drivers/i2c/i2c-core-base.c
>> @@ -1535,11 +1535,12 @@ static int __i2c_add_numbered_adapter(struct i2c_adapter *adap)
>>   	int id;
>>   
>>   	mutex_lock(&core_lock);
>> -	id = idr_alloc(&i2c_adapter_idr, adap, adap->nr, adap->nr + 1, GFP_KERNEL);
>> +	id = idr_alloc(&i2c_adapter_idr, adap, adap->nr, 0, GFP_KERNEL);
>>   	mutex_unlock(&core_lock);
>>   	if (WARN(id < 0, "couldn't get idr"))
>>   		return id == -ENOSPC ? -EBUSY : id;
>>   
>> +	adap->nr = id;
>>   	return i2c_register_adapter(adap);
>>   }
>>   
>> -- 
>> 2.25.1
>>

