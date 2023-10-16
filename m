Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98DC77C9D8B
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Oct 2023 04:52:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231392AbjJPCwg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 15 Oct 2023 22:52:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231314AbjJPCwf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 15 Oct 2023 22:52:35 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2095.outbound.protection.outlook.com [40.107.237.95])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3955C5;
        Sun, 15 Oct 2023 19:52:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kqSTKr3+fE/CkkfVMZ4LgjOrVXG+M87OSfpr88XpEWm105BXP7j3L/TuG/U5uXpPCAKeE3oGppVKiDRfxo2YWtooLVO2MLeE1pXoFL192jG53zXzJJYk5bUFhoNwOH1/QEN8OUdkfdlGHxN+rEV9mj9KL3vDaHmwmYj5OPj9YPoxYPvSHX2I9GHf1hrE5DrXI2KaBdNhFmgkYt3P4wF/beNg//A2S5ao1gozgadpPUtODEqmV42uXNcpUeuFCCV7XahnPvOE1idBw5vN0g9bpzrOLClYI5J0vfWX7XHQdyJriBtYKx606lwixE1Ico2dqSSo0dzAkwIgzV0RaxunQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fFlL/Dj9GQlR+7Kqfq/QEtuet6VaNfOxK6QNhKupZGA=;
 b=RS+PV4g0p/a7lY5pUad8T3wGlkETOHyDuHa2SpFhpiUmT2mYWuPeVrfENdNyCyDUnhQ727koq5bn97gWWGVyZ9z4mF/Xx7Mzx11ll1RQX43Jg7sux0NnRJtUiQvfJhUvErFBuxagj4V76YDUZRTtIaSgHoS4GIzxl6KuJ3jBZBq7cP+fin4AHMe4sYpSIX8IhhS8FKpU/iQZf6ZlynN2rp392FA4PJu0UlkPxK8WoM1By/DcrTMbQOrlGRcV68kAO2+7QzDkfRQt8WyU5dfYgkgxmJKP8mSnPxrhovJ/12JMySj6sIEtduxCSeCOAraY0M/S/eZ/5aQsnVFJWaDN9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fFlL/Dj9GQlR+7Kqfq/QEtuet6VaNfOxK6QNhKupZGA=;
 b=b49oe9p5H2nPaXE320J4ZvhAuGGFgGgTsTg9AHmP0EP7W1JGB6L1Pg+Lffh5dmlQENw/JfvFTLKeA/FZL/Ai6MsuxdiSrrOlrc8SbVLJajewxHSQgCUnC7tt8qzQp+skXqcNseo/G5tJyzmM2KvBtCrYrUS3VBzcHKHd92PaKnY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from SA1PR01MB8131.prod.exchangelabs.com (2603:10b6:806:325::8) by
 CH0PR01MB7049.prod.exchangelabs.com (2603:10b6:610:10a::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6886.35; Mon, 16 Oct 2023 02:52:29 +0000
Received: from SA1PR01MB8131.prod.exchangelabs.com
 ([fe80::5dd0:9039:f27d:884c]) by SA1PR01MB8131.prod.exchangelabs.com
 ([fe80::5dd0:9039:f27d:884c%7]) with mapi id 15.20.6863.043; Mon, 16 Oct 2023
 02:52:29 +0000
Message-ID: <4999b3d9-e299-6c0b-0a08-11b33d06a636@amperemail.onmicrosoft.com>
Date:   Mon, 16 Oct 2023 09:52:17 +0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1] i2c: designware: Disable TX_EMPTY irq while waiting
 for block length byte
Content-Language: en-US
To:     Yann Sionneau <ysionneau@kalrayinc.com>,
        Tam Nguyen <tamnguyenchi@os.amperecomputing.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     patches@amperecomputing.com, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, chuong@os.amperecomputing.com,
        darren@os.amperecomputing.com, stable@vger.kernel.org
References: <20230929035356.6435-1-tamnguyenchi@os.amperecomputing.com>
 <9e737b85-95bb-66cd-301c-3a2d1d41f4c8@kalrayinc.com>
From:   Tam Chi Nguyen <tamnguyenchi@amperemail.onmicrosoft.com>
In-Reply-To: <9e737b85-95bb-66cd-301c-3a2d1d41f4c8@kalrayinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG3P274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::30)
 To SA1PR01MB8131.prod.exchangelabs.com (2603:10b6:806:325::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR01MB8131:EE_|CH0PR01MB7049:EE_
X-MS-Office365-Filtering-Correlation-Id: 17373cfb-83ae-42f1-f115-08dbcdf2f002
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yw2xoagi1hvlLCiBE6Xvuu690+7O8BcSgaKXVLznNw4VP762eiWdY+LY66Q33nYYhvdtJWmO5wO8z2KsGPttCVwHkLe5O0REjyvDCeGDSd11veWkmXhKUBO2KFAbd3uZ8m5FgHosmwIo567b1CJ3Dq+BvSF41DdmDx0nBcd8RO0WhBQHH188u19vyAypunIkm4gyZNCwo7H46R0Cc+38NclPetAPDEMmmgFuvcOQCjo2TiRTmFGvnnc3zt1vQbVx6mchEWbYwLI9ya/X2q0VFh375HRyCmNUSpF5ELdn9y3ohn0LLhG9fSepzZTPZQhyOvcC1jwOoGcxcQJmLYCrMv99ZwQDOG5w4QXahkw7krKA4BGA1U3xFFIDtO2jV9QfxlyCttDtUohL+C01mZ53BIqKljKJt7Wlw7xKMArYuPB0Y/sybl0H6u9IkzJ1qo7WdpN/lKUMWyaAzRhGhC8xdFWkZ3cbxHk2KMki72QTbTy4o0ei2ZbNWBJPeDMttbZIf3rREwMWZbk3gR9qVooct/aPIEr/GA1+d12ZZpXep6rvwZIE5BTzmnaOL7F7rv3M/YWyWNCdqmX3VlSK6Z/jyQ5Zc2ZiOVYVTu3I5zwR+5Xgu7JVGV+OGU0OP7aJ0Tjk
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR01MB8131.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(366004)(376002)(346002)(136003)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(478600001)(6486002)(6666004)(66946007)(110136005)(66556008)(66476007)(316002)(26005)(42882007)(53546011)(2616005)(6506007)(6512007)(4326008)(8676002)(8936002)(2906002)(5660300002)(41300700001)(31696002)(83380400001)(83170400001)(38100700002)(31686004)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0FCVW5FSUFaRjl5VWhJWGpYdWs5OEZqZUVod29UM0N1WmgvNlB5MmtYT1N1?=
 =?utf-8?B?dExDbURiMnUxUWpoVW5YR2lNelB3d08wMnI0MGk2ZldrTW9LTUVkZjdEZnRv?=
 =?utf-8?B?Qm5ST1FCc0ZzMitnSVRLb3luc0hnUXBhc1hmRytmNm1lSzN1UjltdC9RbmFV?=
 =?utf-8?B?TndIaHdKd3hEQUpwZVdrVVhQeWxFM0FNdk1hUzdSRy9pSm0yOUpDc2NtNFVD?=
 =?utf-8?B?WExLaU1uRzhsM0RRTWEvN0tmMWdSMDg1WkhoalExdmNtbjRxQUNYNGtuL0NZ?=
 =?utf-8?B?SHRnUS9hbjNuZHZuR3B0UDNlejhXSVU1a1ljc2FDbDRyM0dzVWhqazF6ckdj?=
 =?utf-8?B?UmtUZmxQcno2UjV0ajJGL2dkZ1Q3em1BbmJndFB4cVVhRStRckpmajNHb2JN?=
 =?utf-8?B?QVNINWc2OUcxbGUvQVRSRFNhUjM2dUpPTFdiQmUydnh1dlhGc0g0elA1VjVJ?=
 =?utf-8?B?emVYSmh5NUMxZ0k1MytvNFVkK25FWjdGY2llbFc0aUR6WFp4cVJBSXR4dy9Q?=
 =?utf-8?B?M0R2bjUxQWNqcGhjOFZuWTBUaXZxeUY3ajBxeVBnNXFsK1psV0pWdkJWQVpL?=
 =?utf-8?B?WTRWTnBkTVlHTTUwMDNKeS81WmFERHBYZ25Ub2ZoM05sdFJ5UHBubW1wKzhu?=
 =?utf-8?B?dkRXNFBOekpUOUNpWDBqOEpDbjJOSVRIT0xXK1llSzFIcTFMMXJSNmRRMGdV?=
 =?utf-8?B?SUZyRmpxQXk3UmZuSkNXd0hycHZkdVhKRU9RNEUrUWpza3JCM3V0TXY0RG9C?=
 =?utf-8?B?UVNDTG9jeEVrUnJ4bmNzWjQ2S0JzR2hneENEOWs2V1RiMkRBZC8wT1lOQkF0?=
 =?utf-8?B?V1FDTkhmMHd5Vkl5Y3RBbG1ha3k3WE1Cd2s2ZUw5Q0lkKytzSFdnZkZNWU5G?=
 =?utf-8?B?MWtPVXlFeVloY3NycW9BczFueUo5QWNGaGl1U2paLzJycGtPQUhHZENKdWM3?=
 =?utf-8?B?ZnZSRSs0NXp4K0JNVFBEMTExaklLTDQ1cHFLSjl4UkZjN2FPM2NsTUFJd3Vw?=
 =?utf-8?B?aStaeUloeElhdFJUaTZ5SEE2R0RIeVdOdU9iNEp6QWRXOXpnL1Q1cjRUa2pY?=
 =?utf-8?B?QmFmemhma05LY1BDaExQeGwzVTZmYThDeW5La0hIQzU0QlhNNjZ1SC9JaEpB?=
 =?utf-8?B?Y0ltU1pUWjhBQjhxMVdIWjFQOWlwUWQvRFZUSFJTS3V4ZElHT1Jzc1dBU2lQ?=
 =?utf-8?B?K2hzTVo4SGc3SmUrVmxYT0FZOG4wK0R5b3RJTzlZcTQrb3g3R1NlZzIzMVVC?=
 =?utf-8?B?bGQ2VEZVUmJiYTFJWS9NWlMzOGV2L2NqNmJRVFYyczFlVkRTUkQ2dk83SjNk?=
 =?utf-8?B?MjQ0azUwMVlPaitqT3NrWlF1RllaMVZGSmxIQzdaUE5JbGpaS0FwWEV3aHgr?=
 =?utf-8?B?Q1RWNW9xb1VzemFrUWx6UUxsMFZ5ZDE5SXI5V0pUa2wyYlVFNlk4VDFubGlt?=
 =?utf-8?B?V1NtNlJRWHhiZ3NDQnI5eUJ1dFE3Zk9zUHRwdTlSRUxIb0Z0NmtTV0VMdXNp?=
 =?utf-8?B?bHJEK0xRVFgzV2pCV2ZMcGdOaC9aZGF2bTd1LzJ5MHU4bzI4UXRzczRETEhq?=
 =?utf-8?B?ZFVIdDZHQzhHZ1AwTW44TXdnVTkwME9pVlg5elh1T3VHczdEZFNPVzd0ZTV1?=
 =?utf-8?B?cnE3N0w4N1oxeFJjWU5tZFdqZjBZaHdHVEt4ZUt0bXFvRm9ob3VQdVh2S2pR?=
 =?utf-8?B?aTNZaGhpbWQ1aUNsSy9TZ1Y3ZWlsbm1LUHVmazEwWTkxZkVuMDNzT0tqajBr?=
 =?utf-8?B?UnZDQWhtZVdpOS9KZzZvbmJ6NFBIbEo1U0cwa1d3WFJXd2p2SHFza2dXQjdo?=
 =?utf-8?B?U3pSOWVtZ0RUNGVUNCtEZ2xKVmhhNUVRSW9SMWwxWWs1dWNrWnNNNVdsU1Bs?=
 =?utf-8?B?VncyNk5CWGw1eGptZjk0a2NSa0VJR0o0MSs4Wk9tWkpnUEtJNkVBRERpNE1l?=
 =?utf-8?B?SGNoMGJGZUY3WFdGc2tNOGdwdkdsbkF2ellRMEV4UDVmWTFCQkdNK21Qbm05?=
 =?utf-8?B?MjhuL2RFOUFjdXlJRzlHdkRBYzVWUEhWcktyU0FWMGZmWnJhelhhR1c2VjFp?=
 =?utf-8?B?T0JNaHpQa2JuQVY0OW01Zm41RzBMT2hkeUVYUnJCeStSTWxLUHo5WVIwOXVV?=
 =?utf-8?B?bnFHa1N6K1luc0RVYm52VnRzNzZYUXVvU21kRnZPbGdUdmN1ZnNPUnJiYklW?=
 =?utf-8?Q?rpe9xIC3wYjHORiyMuRsR3w96YsInyn8dS7GUs3AdeC/?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17373cfb-83ae-42f1-f115-08dbcdf2f002
X-MS-Exchange-CrossTenant-AuthSource: SA1PR01MB8131.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 02:52:29.6768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8SJjf0lwiqmaRis2dAnsFfWXVi5D1qOZX71YUuN0mSluVxVV1wk8CVdzGdDihAdyp4bPuVZOyb53ty28Jhoe371/oCUzNzkDBq2lp6algV/AQw74Id+RgKY4ea8eUrFf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR01MB7049
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


On 10/3/2023 15:11, Yann Sionneau wrote:
> Hi Tam,
>
> On 9/29/23 05:53, Tam Nguyen wrote:
>> During SMBus block data read process, we have seen high interrupt rate
>> because of TX_EMPTY irq status while waiting for block length byte (the
>> first data byte after the address phase). The interrupt handler does not
>> do anything because the internal state is kept as 
>> STATUS_WRITE_IN_PROGRESS.
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
>>   drivers/i2c/busses/i2c-designware-master.c | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-designware-master.c 
>> b/drivers/i2c/busses/i2c-designware-master.c
>> index 55ea91a63382..2152b1f9b27c 100644
>> --- a/drivers/i2c/busses/i2c-designware-master.c
>> +++ b/drivers/i2c/busses/i2c-designware-master.c
>> @@ -462,6 +462,13 @@ i2c_dw_xfer_msg(struct dw_i2c_dev *dev)
>>           if (buf_len > 0 || flags & I2C_M_RECV_LEN) {
>>               /* more bytes to be written */
>>               dev->status |= STATUS_WRITE_IN_PROGRESS;
>> +            /*
>> +             * In I2C_FUNC_SMBUS_BLOCK_DATA case, there is no data
>> +             * to send before receiving data length from slave.
>> +             * Disable TX_EMPTY while waiting for data length byte
>> +             */
>> +            if (flags & I2C_M_RECV_LEN)
>> +                intr_mask &= ~DW_IC_INTR_TX_EMPTY;
>>               break;
>>           } else
>>               dev->status &= ~STATUS_WRITE_IN_PROGRESS;
>> @@ -485,6 +492,7 @@ i2c_dw_recv_len(struct dw_i2c_dev *dev, u8 len)
>>   {
>>       struct i2c_msg *msgs = dev->msgs;
>>       u32 flags = msgs[dev->msg_read_idx].flags;
>> +    u32 intr_mask;
>>         /*
>>        * Adjust the buffer length and mask the flag
>> @@ -495,6 +503,11 @@ i2c_dw_recv_len(struct dw_i2c_dev *dev, u8 len)
>>       msgs[dev->msg_read_idx].len = len;
>>       msgs[dev->msg_read_idx].flags &= ~I2C_M_RECV_LEN;
>>   +    /* Re-enable TX_EMPTY interrupt. */
>> +    regmap_read(dev->map, DW_IC_INTR_MASK, &intr_mask);
>> +    intr_mask |= DW_IC_INTR_TX_EMPTY;
>> +    regmap_write(dev->map, DW_IC_INTR_MASK, intr_mask);
>> +
>>       return len;
>>   }
>
> I tested this patch on Kalray k200 and k200lp boards (Coolidge SoC, 
> kvx arch). With this patch all our CI pipelines are green.
>
Thank you for your time to test this patch.

> Tested-by: Yann Sionneau <ysionneau@kalrayinc.com>
>
