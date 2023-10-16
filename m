Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07B247C9D80
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Oct 2023 04:47:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230478AbjJPCr2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 15 Oct 2023 22:47:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbjJPCr1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 15 Oct 2023 22:47:27 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2091.outbound.protection.outlook.com [40.107.244.91])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DAE1C1;
        Sun, 15 Oct 2023 19:47:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NKbGdG8fJTNkWWcYgk2PTZF2w0YE8ExOUIzzhA+L1woSBxNKhBrMAG1FTkM4/DT7qBDmnUmaWH9scH8ih/r/2A1WUrwsUUOkQIs3mY8XkeZy+FfG2mZ4ZJSjdU0lElrGvU3H+B68MDb58lEi+pbwvyvtTpIcQ25+zMzhwcvDWCh42/q36oYk7PBEFkFgrjASmlXmv1W36QE54ppl1UTCjaK2Esz7GRZVcAOrI5/arxQSv5mB3qD1AwZ23mecXw6UrnNsWwFvHcUh9wJOLG+GcrGbk1sc2XKxW0xzru04tccY+bKmgLQllZXA+98rccZatt8bjglWymCj6ZtN02jXxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7tTw07ARxSZoclzKDcLGk3EAoQO9BiW98gasCBsmTlg=;
 b=YsKziYKTXJ7XGORGMSKZPVtVS2CTeXTfLB18+/d3osdOIcWpUe/aXMsNWub1VEV4oi0DywainQ6t1JUZbwb7EYprvd2hs+i/066zAzCJSfOEyhB+d/dSXoNEerZGjziDSYyZcSDKHVKeEN5NGS8LeguZ5/yT+fW8rnrx24GRncmynZLG9KyCrx+g9Bk1cGs7Wzsc5n5d+Z6Bwy1g/8XGXbO9u6BZOYOtOit4mWqCWE629lpd+oXS+P8G7fSCGcHBZOfDTkXjk6XMpx99vSGXO5j/bDTJRGSrssdruU/ATXj0lp5JM0g2FkCtTl2U/EMQxXgNA9gUSqxxPhLOzQpsWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7tTw07ARxSZoclzKDcLGk3EAoQO9BiW98gasCBsmTlg=;
 b=wBQWke//9m8Cr43vEHODh5QDtLQlATPHlG3P0/KU79dgHXiSiS9OtBPvElREugC6RClCpP0lXqHtYD872taLSithv/umYjI94u9QAW8HHdjL7emduvZXaGs/CoBcc1YQ7UU5qMDq63YEA18eNtB2tiZcPCJYLIirzP9rln+G9yQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from SA1PR01MB8131.prod.exchangelabs.com (2603:10b6:806:325::8) by
 IA0PR01MB8571.prod.exchangelabs.com (2603:10b6:208:482::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6886.34; Mon, 16 Oct 2023 02:47:21 +0000
Received: from SA1PR01MB8131.prod.exchangelabs.com
 ([fe80::5dd0:9039:f27d:884c]) by SA1PR01MB8131.prod.exchangelabs.com
 ([fe80::5dd0:9039:f27d:884c%7]) with mapi id 15.20.6863.043; Mon, 16 Oct 2023
 02:47:20 +0000
Message-ID: <f71fc275-5afd-5ce6-83e7-938fc2580fb0@amperemail.onmicrosoft.com>
Date:   Mon, 16 Oct 2023 09:47:06 +0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1] i2c: designware: Disable TX_EMPTY irq while waiting
 for block length byte
To:     Serge Semin <fancer.lancer@gmail.com>,
        Tam Nguyen <tamnguyenchi@os.amperecomputing.com>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        patches@amperecomputing.com, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, chuong@os.amperecomputing.com,
        darren@os.amperecomputing.com, stable@vger.kernel.org
References: <20230929035356.6435-1-tamnguyenchi@os.amperecomputing.com>
 <avd7jhwexehgbvi6euzdwvf5zvqqgjx4ozo6uxu2qpmlarvva3@sgkce3rvovwk>
Content-Language: en-US
From:   Tam Chi Nguyen <tamnguyenchi@amperemail.onmicrosoft.com>
In-Reply-To: <avd7jhwexehgbvi6euzdwvf5zvqqgjx4ozo6uxu2qpmlarvva3@sgkce3rvovwk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: KU1PR03CA0032.apcprd03.prod.outlook.com
 (2603:1096:802:19::20) To SA1PR01MB8131.prod.exchangelabs.com
 (2603:10b6:806:325::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR01MB8131:EE_|IA0PR01MB8571:EE_
X-MS-Office365-Filtering-Correlation-Id: be8b9337-c4bc-4e99-4d62-08dbcdf237e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UyZ8vnZZApOmF01Cwstpfht6HRrRwzdEJp75nx6Lp5ZzVQnnlL96seootrvoDkzmTixc/oJy9T6JRKttAcardupmFh90huX3ykDKXkQdHgBCy/L+HZAUOMqVECbHoUqYeWuOPJV7sjaudDz0//ZQBnR70EEX7+B15ioAJWALEmajlqsksGz8CTfb6pxo4RDDNk0s3cE9f0eHSLinKtKd9nKP23eIPUkbCKK1f+uRwNb5/O7dIQnuBurfB3UqNvK9EYegejuvoaPQ2WjvhFcvaQ0mvkvbdlUbC+gyQFNnRIoSM3P8V/KLlXTMcv/eFI4CBajh3TdGMzZV2TuV41dOq6OnxhQmoyVvVyrQtWmWfay20PY87tpyxIF2cMssAGb6U+CM+/82F37LgWGbZRFBQUusYU1Tz3YV0X7UGhiO64ZEusipzYMJEPv3yayW5aQccKDFiF8bZ6PqMvk+A39eKr1JaylZQeE5GN8LCrhZekDCoqMeOE0hJ/vmQfthWL9sXZe4hauFw7X6fun/Pcit8XpQu+itHCPL5D13MfoKWN0rQ7y+YK6IqMboxl4p0uHo0Z8Qa2FGjxQYZNhjo+LltcYvQMIoDjhkrfk6bixjOpXn8MlOcnijXJMGJt2Ogwxz
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR01MB8131.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(39840400004)(376002)(366004)(136003)(346002)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(4326008)(8676002)(8936002)(5660300002)(2906002)(41300700001)(31696002)(38100700002)(6506007)(26005)(2616005)(83380400001)(83170400001)(6512007)(6666004)(42882007)(478600001)(6486002)(31686004)(110136005)(53546011)(66946007)(66556008)(66476007)(316002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1ROMDFMbkJwSHpDWGNRRzZFYU1GK0N2MjAzSzdpbFFsZk9qeXJScVdrOHlO?=
 =?utf-8?B?UVNFamd1UENIc1puREtrQ0NpU29kK29TbjNqQ0FGMytYWlpmblkwbDFvRDlH?=
 =?utf-8?B?bWZoWjVjeXh1WExrbG8rU01MNG95SWVIZjJpV0JiWm1aZEJwTDlzd2dxcGE5?=
 =?utf-8?B?NVBKNXZ3Q21rM0grSEVmbjNtT1FDYWRFWFg2eWYvSGwyT1h0L3R5RGhuMThC?=
 =?utf-8?B?TlpjYWNjYitXbkdDbEROcER6eG9ZaUViYXIyNXN5dXpjV2xLU3B2ODd5Yzla?=
 =?utf-8?B?VXcvcjAvKzN5MEZIZldnUVJaeVhNdGxDeHJENUZ5UkpsOTFCSkNGcHVHZjY1?=
 =?utf-8?B?Vjlwam5RUzByU2RPVEhTNlJkK0twejJnN1ZQSDVUb1dXY0NRaGV0alQrcERl?=
 =?utf-8?B?RTE1Qmg5RVh5UlN5RjFmZ3F5dWsvU1VCVVJYTGlTR0xPend1eFJCUENQNTJQ?=
 =?utf-8?B?TWg1eUozZXFEN1N0TG1xOXR3amIvV0pOWGpqK0hyQSs2TEJFR3AzblBkVmh2?=
 =?utf-8?B?NVRKM3VEQUluU2RIZi9XREJDVEluMDArOWo4L0dQVXJvNHVwV0tjeU9LOWlY?=
 =?utf-8?B?VFZNaFpPbGRrenE5TUE2RE5aYndPZHZJM0dhVTRNbTF5a1poT0I5Zm9RaUlT?=
 =?utf-8?B?UDE5Z0R6ajBvNTVqNFVGd0tBOVRqR0huOXVvOE5HVDBtcm13VEtNTXUrWGZ4?=
 =?utf-8?B?Yk1CZ3lUTDJLOUJtT3A2eU5OdkU3Y2ZmeFFvbmRYU0x4TWRUcnBtZzFWd2Vw?=
 =?utf-8?B?R05YK2RMK1NJK3VGOFhFR0hwNU5Lc1B6ZkxmMUxXNThjcmhnMkcwTGtVUVNX?=
 =?utf-8?B?WlFUWVB5aU03aEJsbTVpMUlPREYvc2x3VEowNEFRNjN1MGxiQWJiZ2IyRDdj?=
 =?utf-8?B?akFjMVZPNnZsa2haekg3ZnhtQTE5QXFFYlBuVnYrYXJTMlpLWDNDc20waFFk?=
 =?utf-8?B?UHpMT00zQk1NWmhZbVM0OFpEbXRqc2ZRMGwvbTBieE9TZFJQQWsxUTVpSWdN?=
 =?utf-8?B?Qy8zM2Y3TDdCYTdBcjJCd3ROZExGanpvdWtzbjZtd1FJeGYzaURKdmNhMHlL?=
 =?utf-8?B?dTdVMmtwekg2RFg0dkFISUExYjlTNFFFOUlBRnVqdnhpM3RWdUV6U0pRdDcv?=
 =?utf-8?B?VVEvTWdvZStHMDU4Y0NDMk9ZQnlEK2tKS2ZpRnk3Z25keW41VWJhaVJ4TG5w?=
 =?utf-8?B?Nm1FT3VwME85NUpUNS9wQ2JtZWVBVm5YckZ3blBsMmJkMEw1UHRMQ2FZQ2RP?=
 =?utf-8?B?SURTM2JmTjNaYms5ajk4WWNtNmoxSjNlcjBuWkRFV3N2MGFmWE9FeXBIWWEr?=
 =?utf-8?B?a1o0RVdhN1dtYzRVRzVSQ3B4ZnBDTEMyK2NhV29acko1WklPVzZpOEdKRkRs?=
 =?utf-8?B?emw5TTRES2hNdWNyZlRmMS9JZU1QejV2SWw1VGV6cmQvMHpKbU4vdTBtc3E0?=
 =?utf-8?B?V1NwbVNyS2JBMXZUWjg0cjRxMUtsKzhPTGVDbExoOXh3WGtOVjhRSm9KTGh0?=
 =?utf-8?B?cm13TEhZN052Vy9qM0RZSlhRUUlFa3J5QWFObkU0ci96R3dhWFN0a0UySG54?=
 =?utf-8?B?SlY2WlVBL2ZIYmIxcHRBOGVWZTdkWUduSXIwZTNuZ3N1Y0p4ZjZOSXRWM2VS?=
 =?utf-8?B?bVJXZGpPNzFzRzVXMEpxMWUzZG1Jc0RCZlVCR3VPeTVIQUVXeW1obXdVeG81?=
 =?utf-8?B?elVUM1NiM2lEclJCT2xnWEVFZ0VjUTNIaGRBdDR3ZzFXcnM0YXBOc2QxOGE2?=
 =?utf-8?B?SmR2Nk16VTVYcE84QnRjQTZjc3BlZ0l4amJzUHJIRmtFc2k5RHpKeXQzaFZ1?=
 =?utf-8?B?RTJEOXpqZDA1RlpYa1Y5ajdXdUhCb2hPSG9MUTY0NkVMZk1QTk1vSTgvRjdM?=
 =?utf-8?B?SkhjMXI2aWdIdFB6WUJGY3dhanNCdkpWUkJrSHgxK3dhcGhWa2w3ZHFNY0ND?=
 =?utf-8?B?b1pEMlFHSmlQQXRXM3VQNUJ0U0lRMDY0blJmRTZVd1hiMERlV2ZVQUlxSWZT?=
 =?utf-8?B?cGFnSktXQ3pjNWFUdzZISTM3ZWR0Zm5KS2YrM2UrZ1hhVi9pZEVaN0RmOTM1?=
 =?utf-8?B?Zjk5SmNBRHEvbzd1RTNXdGEvK1VCUUh5dXFsK05VZEEvcWlROEUwWFk0Zjhw?=
 =?utf-8?B?NFFqQ1V2dk43WGpZZnZEN295VVlyU25lYTVvTEMwSUhJbmZqRFk4NEtmNndq?=
 =?utf-8?Q?IFNiStFnLiavgtuO1GT51wrGeKt3LQXxO7gI3xYYmS1T?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be8b9337-c4bc-4e99-4d62-08dbcdf237e5
X-MS-Exchange-CrossTenant-AuthSource: SA1PR01MB8131.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 02:47:20.8180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: erlWbtVBEFxg7V5jbX9+EKkc4ZXH3Lf+1j8JeFYKz3+ukTsw3t9L6g6LTvZazDS2Ujo+xUyMP30/0NXKxyFXSMZhnDxEoe08FS+dU3gQPWYxxaZ2dM/nrwjuLcS2Ox/B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR01MB8571
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


On 9/29/2023 23:08, Serge Semin wrote:
> On Fri, Sep 29, 2023 at 10:53:56AM +0700, Tam Nguyen wrote:
>> During SMBus block data read process, we have seen high interrupt rate
>> because of TX_EMPTY irq status while waiting for block length byte (the
>> first data byte after the address phase). The interrupt handler does not
>> do anything because the internal state is kept as STATUS_WRITE_IN_PROGRESS.
>> Hence, we should disable TX_EMPTY irq until I2C DW receives first data
>> byte from I2C device, then re-enable it.
>>
>> It takes 0.789 ms for host to receive data length from slave.
>> Without the patch, i2c_dw_isr is called 99 times by TX_EMPTY interrupt.
>> And it is none after applying the patch.
>>
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Chuong Tran <chuong@os.amperecomputing.com>
>> Signed-off-by: Tam Nguyen <tamnguyenchi@os.amperecomputing.com>
>> ---
>>   drivers/i2c/busses/i2c-designware-master.c | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
>> index 55ea91a63382..2152b1f9b27c 100644
>> --- a/drivers/i2c/busses/i2c-designware-master.c
>> +++ b/drivers/i2c/busses/i2c-designware-master.c
>> @@ -462,6 +462,13 @@ i2c_dw_xfer_msg(struct dw_i2c_dev *dev)
>>   		if (buf_len > 0 || flags & I2C_M_RECV_LEN) {
>>   			/* more bytes to be written */
>>   			dev->status |= STATUS_WRITE_IN_PROGRESS;
>> +			/*
>> +			 * In I2C_FUNC_SMBUS_BLOCK_DATA case, there is no data
>> +			 * to send before receiving data length from slave.
>> +			 * Disable TX_EMPTY while waiting for data length byte
>> +			 */
>> +			if (flags & I2C_M_RECV_LEN)
>> +				intr_mask &= ~DW_IC_INTR_TX_EMPTY;
> Is it possible to reduce the indentations level? Like this:
>
> 		/*
> 		 * Because we don't know the buffer length in the
> 		 * I2C_FUNC_SMBUS_BLOCK_DATA case, we can't stop the
> 		 * transaction here. Also disable the TX_EMPTY IRQ
> 		 * while waiting for the data length byte to avoid the
> 		 * bogus interrupts flood.
> 		 */
> 		if (flags & I2C_M_RECV_LEN) {
>    			dev->status |= STATUS_WRITE_IN_PROGRESS;
> 			intr_mask &= ~DW_IC_INTR_TX_EMPTY;
> 			break;
> 		} else if (buf_len > 0) {
>    			/* more bytes to be written */
>    			dev->status |= STATUS_WRITE_IN_PROGRESS;
> 			break;
> 		} else {
> 			dev->status &= ~STATUS_WRITE_IN_PROGRESS;
> 		}
Thank you very much for your advice. I will update in V2.
>>   			break;
>>   		} else
>>   			dev->status &= ~STATUS_WRITE_IN_PROGRESS;
>> @@ -485,6 +492,7 @@ i2c_dw_recv_len(struct dw_i2c_dev *dev, u8 len)
>>   {
>>   	struct i2c_msg *msgs = dev->msgs;
>>   	u32 flags = msgs[dev->msg_read_idx].flags;
>> +	u32 intr_mask;
>>   
>>   	/*
>>   	 * Adjust the buffer length and mask the flag
>> @@ -495,6 +503,11 @@ i2c_dw_recv_len(struct dw_i2c_dev *dev, u8 len)
>>   	msgs[dev->msg_read_idx].len = len;
>>   	msgs[dev->msg_read_idx].flags &= ~I2C_M_RECV_LEN;
>>   
>> +	/* Re-enable TX_EMPTY interrupt. */
>> +	regmap_read(dev->map, DW_IC_INTR_MASK, &intr_mask);
>> +	intr_mask |= DW_IC_INTR_TX_EMPTY;
>> +	regmap_write(dev->map, DW_IC_INTR_MASK, intr_mask);
> 1. What about just:
> 	regmap_update_bits(dev->map, DW_IC_INTR_MASK, DW_IC_INTR_TX_EMPTY,
> 			   DW_IC_INTR_TX_EMPTY);
Right, much better with this update. I'll update it in v2.
> 2. The in-situ comment is pointless because the statement already
> implies the IRQ re-enabling. I suggest to add more details of _why_
> the IRQ needs to be re-enabled (what is supposed to be done after it's
> re-enabled?).

Got that. I will add more context here. Thank for the advice.

Best regards,
Tam Nguyen

> -Serge(y)
>
>> +
>>   	return len;
>>   }
>>   
>> -- 
>> 2.25.1
>>
