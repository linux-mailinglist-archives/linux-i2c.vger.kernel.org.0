Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2408771F955
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Jun 2023 06:30:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232019AbjFBEac (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 2 Jun 2023 00:30:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbjFBEaa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 2 Jun 2023 00:30:30 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2092.outbound.protection.outlook.com [40.107.223.92])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67C8AD3;
        Thu,  1 Jun 2023 21:30:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SFi9FlDQeDYEJmmufbFKUtQMXonfwoIP91RlGqxoww4pKm3nw3dUH8d5wpoa4WQXbOb48FWOXmtGfLjFWkJdOkZEC5KL3+a9hP8sxLDvK8bhBYc2F7D8P8sB3RrV3xSjiWUG51rdGPqzvqnAF6tXQiloQ382LNYqNtF0g3AOsvq2EgSOv2/MZo1tTfdDVO1sk/zKqoMxe5SsLcmcQC3pF2zkqba4bhbi/sLy3y+D9XfDfvUK3Occ6fRtAMc6YeSm/0jyje0M9ZFAyGxfPoEa1Jv+spaPalx8FN9zj1mlcjjHukH83w7HkgV09gjbmDtpLsvYkWP/moCQLuTIK5ueWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/lB3fQwm2uu7JvGBFKWzyUcedkVtxHDPlGHVxzzXEgY=;
 b=Ay+JN/EO/fSxfVbaPdHyGS/EvM7qJ4SMG+jTJLQrQNk2tPZmzTeo7rXL39Ekzl104LNlq9xzyBwQvcR53Qcm39cHHJn/Oq+nOk3nhi3Mwqp0N3WoNd87DXPZVDGvD3JiGH1/AMU1osse188vk85Vby6V3edmTKZyZMdTaMvUY3hh2veytGufUWtUWzIr8EQ7LpbtqazSPmH7fwB6yupAfkG4f6y6nmKcsKMWiDxpr1vQ2zz7gwpkdKfwIs6CHFXkIIqO53LKk+lUp4z0ez+T0WF1lrAsCX5mdDTgjDGlNRkXcjDACliesS11OvT8y64e4FY9prhfhin4WdJ+3au0dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/lB3fQwm2uu7JvGBFKWzyUcedkVtxHDPlGHVxzzXEgY=;
 b=xKANT5h/GON4jQBuTDzd5CIVuFU/o6gSrQKBUFc6/eVsG/SniR0HV4pK3RXBJ+8rNKQ3+RELQYhmmOv6Fo7eZechxXAYkU8gVvuKx8dCv/BgXGRS/mtSx6rW1UjVFY75g5AWscWtFhz3FuRtddBlKXPz2cFVi28R2N619kx4t+s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from CY4PR01MB2840.prod.exchangelabs.com (2603:10b6:903:eb::13) by
 SA1PR01MB8564.prod.exchangelabs.com (2603:10b6:806:37b::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.24; Fri, 2 Jun 2023 04:30:21 +0000
Received: from CY4PR01MB2840.prod.exchangelabs.com ([fe80::32b2:1b29:f4b:8fe])
 by CY4PR01MB2840.prod.exchangelabs.com ([fe80::32b2:1b29:f4b:8fe%9]) with
 mapi id 15.20.6455.024; Fri, 2 Jun 2023 04:30:21 +0000
Message-ID: <95d838d5-ea27-ef75-4ac6-575ebd75111a@amperemail.onmicrosoft.com>
Date:   Fri, 2 Jun 2023 11:30:12 +0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v1] i2c: designware: Handle invalid SMBus block data
 response length
Content-Language: en-US
From:   Tam Chi Nguyen <tamnguyenchi@amperemail.onmicrosoft.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Tam Nguyen <tamnguyenchi@os.amperecomputing.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     patches@amperecomputing.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, jsd@semihalf.com,
        chuong@os.amperecomputing.com, darren@os.amperecomputing.com,
        stable@vger.kernel.org
References: <20230523082118.10935-1-tamnguyenchi@os.amperecomputing.com>
 <bf392104-96b0-a85b-f68e-088bd3884d9a@linux.intel.com>
 <6def5691-2462-9707-f75a-09931d26d4af@amperemail.onmicrosoft.com>
In-Reply-To: <6def5691-2462-9707-f75a-09931d26d4af@amperemail.onmicrosoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0055.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::16) To CY4PR01MB2840.prod.exchangelabs.com
 (2603:10b6:903:eb::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PR01MB2840:EE_|SA1PR01MB8564:EE_
X-MS-Office365-Filtering-Correlation-Id: 70b3af44-e0ef-4be0-4a4a-08db63221375
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +XdHfO1k4dirsoutLH4P3yBHwqCx66g7MyUshzr1rOwYt/JUKjnx4bkjQTmsVw3t0OrxqZ3rktVSPtPJgGBlOJmJqHxkSuRLTbI6E96a5tsMdLdlY9mZrDM6neE5nnz20wPru9yK2twL5oTSq2p9rIB1AfylHcKq7zaFzTnwASRZEKCvOEfgBoYuvhLdNqCvxnffxLhg4wyZtpMBqosK3EpUBlCtjVlpA13r/XnP2LLlG5VnQArR0G4AajjhPiM9iw6HAoxpNA/7O/Iyk4fzZp+fTa2DWfemfL9TAuS/E3EavBSHoUGYEuG8nCkO2JOsYmvRkf1AqBy0nABu+x9eSAeKAMM8ZIX75ZgW2ak+mJTafgCbWHsmcRWcaBFgfu7/loScSO5NqNGZU04eaHnXAoazLIoXoBMmndUFK2/Iz3N3Yer8Ko6G/QJV6zlmrS/+RPiah2joUuKQsskXAMCMrBFUMnlBG/y06kt0NNKQK0jvBCHmb+bg0UklnTWWYqCsFj0mjeKnP2ZJPem3aeE4EeD4udUNhtRABR/LKVooRiG8AHZO4RHOkTQpl6F9h3k/KdK81GBS7D3uv4eHvQzoBaKmYicpNrd3Y+ud7YnNNpo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR01MB2840.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(39850400004)(346002)(136003)(376002)(451199021)(5660300002)(66556008)(4326008)(66946007)(66476007)(6666004)(31686004)(8676002)(8936002)(110136005)(316002)(53546011)(478600001)(41300700001)(6486002)(186003)(6512007)(6506007)(26005)(42882007)(2906002)(2616005)(83380400001)(38100700002)(83170400001)(31696002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkRaTVI0YTVWaldPQzBKR3Y5YkNBeldHRUs3NzROcXhxb281ZnlVU1BVaXZJ?=
 =?utf-8?B?enQvd2E0WmRvU3hoNnlONm05T1RndGhQdjRCV1lsM0JLa3JZVzZudG9PZWtM?=
 =?utf-8?B?b1htMzdaL3ozcW9Xa1NYdFZUeE1SR2pCUUhudktBYm9YN3ZXeGNvdEd5a2hQ?=
 =?utf-8?B?OS9QWWE4YmwzQnZyZ1orQm1ZQ3dmTmdsRG9JajM3Yk81L2lFU2d3bElhcVh4?=
 =?utf-8?B?bmdsdEdkak01RGZlM2NmL3Z6dDdGRnYzWW1NN0x0U3pyZU96blBtOGQrd1h0?=
 =?utf-8?B?OTZZU0czY1c4eGtwdUxMdDZnUTNSL2ZzeGNISWhyWkFoOWxVaDVNSGdpWHRo?=
 =?utf-8?B?VmhwT2lIaGVKZStSZFlqQTZuSUdmQS95VzlrVTVmSnIrNFlPVVgzSUJLdkFz?=
 =?utf-8?B?bXVlSEN2TitVNFpBWWZEMnVUSHpPdG81aEprQm9QdnovODU1T0dnR051Kzcz?=
 =?utf-8?B?YTFRNHBtVVdmMFBtZXdXZ1BkVlZLNVY4MFFFYzhVNzF6aG1MNC84VURqejQ5?=
 =?utf-8?B?STAzQ2pDenlRcU9HaWgzOURUemxuclNkNUI0UXhkWTFCTTd1Sm1OTE5kbC81?=
 =?utf-8?B?d3NMM3JYdUxBNlZ3YmF3K0pxNmQ3QUtTbk5udm4rTmNlUFF3dUJIY2VzYjVp?=
 =?utf-8?B?UWNLTHJWcHNNY3dVYnpoanJMUU1DZG9tZThDdE1xY1BEczRrUi9QZnN3L0I2?=
 =?utf-8?B?RWlkNjlNQ1graWxYOUhwMkpFREVCelpqdnpSb3hDbS9TSkFmSjkzT2dad2tl?=
 =?utf-8?B?TnR5dWFiZEJWOFNOK0FwUlFWdld0bmtMVllDS0tUUnVlQWY2OHpnMmdQRWs0?=
 =?utf-8?B?Zk1zdmpKVnFSNmpUNVFiajRPaE50aGhXa1VzM3lyMzQ1L0pJcDI1Y3VZdFNI?=
 =?utf-8?B?YmY4eHphb25sSTI3Wk9IUC83S2NYUWUydlhaVys3MFUyZVdnLzdubldicy8y?=
 =?utf-8?B?cmh0RGtNZFp6RDA4Nk5NZ0VjL2VKOVc4QTNvYnZOVkllTlZqaFJYeTNGVmVW?=
 =?utf-8?B?Y3crV3l5RkFUVklFam92M1VmV0VNdmJHeURnNEVHejViRmhNVEFpZ3ZXeCtm?=
 =?utf-8?B?Y0dkamZaSmZ5d0p6RzNPdHYzeFEwTm5jZFEzVndOVCs0MjlyUDdIa1ZXV2F0?=
 =?utf-8?B?WVhmcXZzU2orcjBGQmRhdUxWNFgvY2hRRktWclNML2NLMlE4WEFOdXY5MVc2?=
 =?utf-8?B?UGpEZHlWS1FWZmlSeWxITWNEeG96OFY5MjZTdnpGTEdpaTZyQ0ZBT3pkOXpl?=
 =?utf-8?B?NnhvQTkrMVdzRWltRWpCNjg2L2JxZkNmbHZtTG1xc0xlZWFSK1kxMktVUity?=
 =?utf-8?B?Q0FTcUxjOTdLT0FxbWtZeEJjWUd5RW5abHptNUExRXVuT0QxK3hxWEtGSE9P?=
 =?utf-8?B?NEw5Z2hJU2MraTU4Y1o3SGRZUXF2cEJvQTYrZXk3dlVVbTRlMDFHUlVmL3Vv?=
 =?utf-8?B?ZUQ0anJPbzNJbGx5dzVQcGlzbENLT29waS9pLzQyZms4TGxKT2JYQzZMeXcw?=
 =?utf-8?B?czJnb2J1Z1dDQzB2ZUV2MW52OVRJYWVPZ1R0ekFXYk5Cb1ZCd3NJSU5SVk5D?=
 =?utf-8?B?bVYyS0JpbzAzMStFeUhzUU1mSGx5TUVVWmRqd1c5TDRFNnc4VjBjbWZkMjU1?=
 =?utf-8?B?RWg3cUswWW9oZnhFZ04zRjZjSGU5NEVjL21vMG9xMVlRdTY0Yjh4N1lrRlcv?=
 =?utf-8?B?RmxhSzhxZUdjcS94YzdkUjR4SFlpNUFvOEJ0Q0pVbWNSYkdwYVBFOWtrbmVO?=
 =?utf-8?B?ZDdTS3RuT1ZKajRtbFNURGJQenIwL3NwSFEzUnJmNWh5N3Z0Y0luSlVXR0RB?=
 =?utf-8?B?ZysrNU5KSi9sZUhTaDdXZGl3bUtkK2hZUjhpTGRYWCtkWHZiZlNaUE5EZ2F6?=
 =?utf-8?B?aFo2MGFtNzExT080cmNsbTczV2VNQ2UrTXVwT0ppZGl2U3VYeURRS21YT2lv?=
 =?utf-8?B?ajdNUUhBS1RGRWZ2b0o2bU5ubE5TMG1DSEtWZzQwbjczNHh2OG5YYVBnMnp5?=
 =?utf-8?B?bk5ZTThVU2xEUG9IUUI4amUwRDhtRXBEYmY4dmpuWlhMc2hZczNKaURaNCtr?=
 =?utf-8?B?aEFYZVI3bWg5aFFHYTFRNC9zcjdKSk1ONi9pdURYbUcwZmljSGJRQW43Tytx?=
 =?utf-8?B?bFRudkhTeTdPV0krWE9aZW8vc3p6RFhRRjZqSi9JcjBkQi9OcTZRakY5d0ZS?=
 =?utf-8?Q?PHQRpmT6DToy3CKeF4VUhf0kK/dgOGwcr+Q/c4L3Mv0T?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70b3af44-e0ef-4be0-4a4a-08db63221375
X-MS-Exchange-CrossTenant-AuthSource: CY4PR01MB2840.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 04:30:21.4498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gat9zokjjMVWQrDCAvC9e6FG5P2rTj12hqA9Gqdk4vuZkFCkGfidTEMQOU3BYoTVeLy9H7DZOz6IMG46KuMmy2HM40v4d1HlC5F1d9SJ7UjyNGufsgTD018Mb0KuZh17
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR01MB8564
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jarkko,

Before pushing the v2 patch, I have one more question to ask.

The commit f53f15ba5a85 ("i2c: designware: Get right data length"), you 
mentioned,
does not handle bit 11 set (on a HW where it's supported) correctly.
"tmp" was not marked with DW_IC_DATA_CMD_DAT when passing to 
i2c_dw_recv_len function.

So I plan to update it in the v2 patch by adding this
     regmap_read(dev->map, DW_IC_DATA_CMD, &tmp);
     tmp &= DW_IC_DATA_CMD_DAT;

My question is: does it need a separate patch for this change?

Best regards,
Tam Nguyen


On 5/25/2023 16:30, Tam Chi Nguyen wrote:
> Hi Jarkko
>
> On 5/24/2023 19:33, Jarkko Nikula wrote:
>> Hi
>>
>> On 5/23/23 11:21, Tam Nguyen wrote:
>>> In I2C_FUNC_SMBUS_BLOCK_DATA case, the I2C Designware driver does not
>>> handle correctly when it receives the length of SMBus block data
>>> response from SMBus slave device, which is outside the range 1-32 
>>> bytes.
>>> Consequently, the I2C Designware bus is stuck and cannot recover.
>>> Because if IC_EMPTYFIFO_HOLD_MASTER_EN is set, which cannot be detected
>>> from the registers, the controller can be disabled if the STOP bit 
>>> is set.
>>> But it is only set after receiving block data response length.
>>>
>>> Hence, to prevent the bus from stuck condition, after receiving the
>>> invalid block data response length, the driver will read another byte
>>> with STOP bit set.
>>>
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Tam Nguyen <tamnguyenchi@os.amperecomputing.com>
>>> ---
>>>   drivers/i2c/busses/i2c-designware-master.c | 15 +++++++++++++--
>>>   1 file changed, 13 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-designware-master.c 
>>> b/drivers/i2c/busses/i2c-designware-master.c
>>> index 55ea91a63382..94dadd785ed0 100644
>>> --- a/drivers/i2c/busses/i2c-designware-master.c
>>> +++ b/drivers/i2c/busses/i2c-designware-master.c
>>> @@ -527,8 +527,19 @@ i2c_dw_read(struct dw_i2c_dev *dev)
>>>                 regmap_read(dev->map, DW_IC_DATA_CMD, &tmp);
>>>               /* Ensure length byte is a valid value */
>>> -            if (flags & I2C_M_RECV_LEN &&
>>> -                (tmp & DW_IC_DATA_CMD_DAT) <= I2C_SMBUS_BLOCK_MAX 
>>> && tmp > 0) {
>>> +            if (flags & I2C_M_RECV_LEN) {
>>> +                /*
>>> +                 * if IC_EMPTYFIFO_HOLD_MASTER_EN is set, which 
>>> cannot be
>>> +                 * detected from the registers, the controller can be
>>> +                 * disabled if the STOP bit is set. But it is only set
>>> +                 * after receiving block data response length in
>>> +                 * I2C_FUNC_SMBUS_BLOCK_DATA case. That needs to read
>>> +                 * another byte with STOP bit set when the block data
>>> +                 * response length is invalid to complete the 
>>> transaction.
>>> +                 */
>>> +                if ((tmp & DW_IC_DATA_CMD_DAT) > 
>>> I2C_SMBUS_BLOCK_MAX || tmp == 0)
>>> +                    tmp = 1;
>>> +
>>>                   len = i2c_dw_recv_len(dev, tmp);
>>>               }
>>>               *buf++ = tmp;
>>
>> Looks otherwise good to me but I'm wondering the "tmp == 0" test can 
>> it have the bit 11 set (on a HW where it's supported) and should it 
>> be covered with DW_IC_DATA_CMD_DAT mask too? Please see commit 
>> f53f15ba5a85 ("i2c: designware: Get right data length").
>
> You're right. We should use the DW_IC_DATA_CMD_DAT mask to get the 
> data part if HW supports reading bit 11 from IC_DATA_CMD. I will 
> update it in v2.
>
> Best regards,
> Tam Nguyen
>
