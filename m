Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 852587108E4
	for <lists+linux-i2c@lfdr.de>; Thu, 25 May 2023 11:30:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239986AbjEYJao (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 May 2023 05:30:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239929AbjEYJam (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 May 2023 05:30:42 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2107.outbound.protection.outlook.com [40.107.243.107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B39AA9;
        Thu, 25 May 2023 02:30:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YJcdqmJlBd/vWGw/naPTE/l5Uk1/dZIIUDGO+mLHBxkg1oETafqq5ZaLC2Bs0PECDrNhGV7zMiepLHQIXRGJ0pxmQYBPo2aXy7dbI/O/1PTyIETJeqS6tokj9XMej3Cj6yAQLxzW7Mkq37ECWFIQxZq131d+dVY6LVPHJH+r3wPFSlCBrMpQKYg7P2jywOAJg7MLRcacOKHtlX6egl/webJ4CQNkXxHyHS0lozbsNlwgp0E70qiwNWy1+EdcgoKJkhs5xbF30vjHvLzSGWvmhKOUkZcx6N/+8MylUNfSzSY95jTntphHysejW9IYoyDNTtgO6JJRWkVxfpEyCmg4Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DSHdcq6Z/QMZ6NL6vWqOebSqmTz/toyDWFen3tUgMdg=;
 b=nFfI/z82AsPzJhi/cgTrb8XelcNYlfJuaBRaRLEs8aYcelqL1BNd95b01tjvNiYMAAIhZlsoDMagezx+c5ZBXqq7sZUsG+qsfEInQkcynrIIf0eF5QTZkj3HZu/hurwZFHKeebba2HS4xLaRGZj5HQ4JbFxmtZrLFfrrc9NtIL6QeMO2odQEN92lKqDqqd+1M3tIXHbOjetfATUFHt8Zd/eVN04Py65y1IGEhJ267PjW+9qSv8PwFQaf6EE7ELFzSul5tdg0HimPhbeX19tl70yPA37PTYsldSOYf9SSHxSVn2MmPhUEK9tvh5LqdCYLm3V8SdBjIoZ4KsD5049HRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DSHdcq6Z/QMZ6NL6vWqOebSqmTz/toyDWFen3tUgMdg=;
 b=Jw97GCNls833G8VdHHry3lCFMzezXjtzwhXAZVKkKbsTpYuMxB95nhBRIpBYvur4i0gH2E5amy8DPU1I1K1ISOk6y9Z16cmhckmiezHsCMhCbqujYmZIs40E3Vbjn0Um5WLp86DtTVm6qgBL/PaKDFqj45R5UxUv69ui0/vCUD0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from CY4PR01MB2840.prod.exchangelabs.com (2603:10b6:903:eb::13) by
 PH7PR01MB7583.prod.exchangelabs.com (2603:10b6:510:1e2::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.28; Thu, 25 May 2023 09:30:36 +0000
Received: from CY4PR01MB2840.prod.exchangelabs.com
 ([fe80::6be9:32d4:b518:8b54]) by CY4PR01MB2840.prod.exchangelabs.com
 ([fe80::6be9:32d4:b518:8b54%12]) with mapi id 15.20.6433.015; Thu, 25 May
 2023 09:30:36 +0000
Message-ID: <6def5691-2462-9707-f75a-09931d26d4af@amperemail.onmicrosoft.com>
Date:   Thu, 25 May 2023 16:30:26 +0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v1] i2c: designware: Handle invalid SMBus block data
 response length
Content-Language: en-US
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Tam Nguyen <tamnguyenchi@os.amperecomputing.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     patches@amperecomputing.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, jsd@semihalf.com,
        chuong@os.amperecomputing.com, darren@os.amperecomputing.com,
        stable@vger.kernel.org
References: <20230523082118.10935-1-tamnguyenchi@os.amperecomputing.com>
 <bf392104-96b0-a85b-f68e-088bd3884d9a@linux.intel.com>
From:   Tam Chi Nguyen <tamnguyenchi@amperemail.onmicrosoft.com>
In-Reply-To: <bf392104-96b0-a85b-f68e-088bd3884d9a@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:196::10) To CY4PR01MB2840.prod.exchangelabs.com
 (2603:10b6:903:eb::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PR01MB2840:EE_|PH7PR01MB7583:EE_
X-MS-Office365-Filtering-Correlation-Id: 1945937e-2aea-4cf0-ff41-08db5d02b239
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +WfBpuoMgVZKy51eAFE2K1mpH4OKrG+lngnCRjhywiiGu0B4tPDN5IxuFIc1M1MfcYSOTKTXjJJh3miy5aiu04vaFvn3Pg5AmBo9tpwRFHbx7DuAb2whXKsKMda5c0SzmZ2m8tYje13tTjQ51z5dseNnnWSa7zY5Zt9e4B3jPpfnAFhFvS92mpnDiQe55oa7AXPjEIfqNWnElUnwYRhHlrop9eQoD7vWR5fVMZziqLH74DGM63w5UXL8yjRC0UOGDCz6AFlfJGauMJT2B0bR9EWz9gJ9ruGTgn30BvDgCeA9O6baGBI2CPwqlwhG+j6ZwHHrBRBWmOjqAftXxs4sFoU1cDWk0EtpbdIcxIUzbBn6mLSoqvzMGGVaitGjgGlHw69lKEitAAkaFvOvoNJf3roN8PSdrRjeJBu4JQ2sxm8YM5c8NJQY+/sFNqwRPBdd2AGIA6tP7gMIt0xRVIOQWG+OsKRJmQ4jipxcOvVgtMr1bRaXKGBlp4kj2WI/2/ylfpFGtA4mcFPQCx/J05ieGKXrNZxNbpaQq38xqFmJccWPpz5YEe6l9YjGoZQ5LKrrTuY0OH0eOd+n3IEyBP+VbcBS0nI+cg8r3uQTwbZESmSolYzbzABTZQFpHHlAlCNI
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR01MB2840.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(376002)(136003)(346002)(366004)(396003)(451199021)(83380400001)(83170400001)(4326008)(38100700002)(66476007)(66556008)(8936002)(41300700001)(66946007)(8676002)(31696002)(2906002)(316002)(5660300002)(110136005)(2616005)(6666004)(26005)(6486002)(53546011)(186003)(6512007)(6506007)(31686004)(55236004)(478600001)(42882007)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTV1U1VYMnN4ZGg2dlZXVndMTy96MStlVzZDQ284c3ppQlloSXRUL09NZm8z?=
 =?utf-8?B?YXdxT3VjQ1AvanpmTUkrQXhMZWpGVUp5dXdOVVpORGRSekpXWGl0VHlQN3A0?=
 =?utf-8?B?eEgwNk54YWgxSFdWRnNwdGdGcjU2MW1JVWpySVNRME0yTFhlWnUwdU8va0ZG?=
 =?utf-8?B?blptcDZSZDdDTUxxMlh0UVlrU2pwbDZJUGlpYkdDRUVWM1IzTnczWGdici82?=
 =?utf-8?B?d0hLU1E5cG9nd1o0eW15UVpKclViaGg1N2gxWGRvenduNzJuZEhBaWkrYnpF?=
 =?utf-8?B?M21XODgvbXNjZUZMQ21OdkIvUFBkaEJRNDRSUStxT1FCR3NvUk9EYUZCODlh?=
 =?utf-8?B?d1A0UmluNE95TjF0U3N1MHZ1THpwdXYzeDlaMkJlZzlvZEhXTjIvUW0zdWFX?=
 =?utf-8?B?ZDI1Wk9iWTcvWFJqSitNNDlrSzd3OVErYStscXdqc2hZb0pMMGhMbUJWN21m?=
 =?utf-8?B?Mk1tYWt4MHBYYUxtVmtEenBZODVqVk1WaklwbjgxY21sZ0Y0Z1dLUjZQK0FH?=
 =?utf-8?B?dTVoZXZJbndxZ1dEakZUaUlrM0dwOTJCdGhXdFdaaVg2UGNJVmNJanhYU1Jl?=
 =?utf-8?B?TktoTmVoYUw2QVlxNitPTHlaV0JmVzA5bEo0MG5JZzJ2TEFqcC9vVFovWXoz?=
 =?utf-8?B?UFd5MmJHTlFReHd5MWlxMlFaR0lPbXdjNzFEeGNuU3VvQjZxREw3czVwSmVa?=
 =?utf-8?B?QVBxRDFFR0FvazhpQ3UxYlFZaTdUQ1MyV0JPekZyWWlPSzBzNE8zSHA3SlZJ?=
 =?utf-8?B?Q1ZtUVdkYkxuOWpTL3U0cWNMc2Z4aHBYMVA1YjdkWXM3dEVrQzBIdWIwd05F?=
 =?utf-8?B?b3RiS1lLb2FRZWpRcXZjejZVQnZlLzZSc3V4WGxwQkhNSzhrZnQ2MnYrdnpW?=
 =?utf-8?B?V1pCaVRhVGorMkVyZHNVL016bVR6V0hCQXBZbjJqdFRodGpQQ1U4SXUxM1JS?=
 =?utf-8?B?NEtnUzRUdDRjU2NEbjhaNkxQVTRpbkl1Z2QybDVmK2NSaHFaMC9WcGNlaGx5?=
 =?utf-8?B?SXV0Z1duTGt6QncvVlBWcnZDMjJkaXVnMzFnN05kMFVRbkNyMU40L2lQTmwv?=
 =?utf-8?B?MGllNlFzb2pkcm9CTDRmSnYrK0o0alk0SEhXVFVtMTYwNWQrSzRwV0FIYmQr?=
 =?utf-8?B?aUl2cVhJem1ncWNPNUFVdy9KWXVyZDJDbFlOYVdHdFFTL2svZ1ZaRkdCTXhq?=
 =?utf-8?B?N0xjS0FYL0xuVGhKLzhnbVd0eFlnQlh3a3NBY0tlMTdvR3BCamk4TW9ZcUFC?=
 =?utf-8?B?TzlxS0h1OVpSUzllMWJ5YnNTNmxtNzVaUEhKL3VlRzNWMElZSWxXalQycHI5?=
 =?utf-8?B?QXlaVVFORWVmYVViSzBDYUc1dTRGb01oZzBKTHlXWTRMeUVXTC9RL2dMdzM1?=
 =?utf-8?B?YkVVS3djUlI4YSt1VUxZUXhKZC9DVFF0VTJzMTVpL3ZPV3dINkx5R3FwTHEy?=
 =?utf-8?B?Z0U3TFYwOHkwckNXUDRRckdNNjBGNm5TcEp6VGpnVTZQNkVwdWx4dnAyZE5Y?=
 =?utf-8?B?NHA0NVUvdW15TWdIRG8zRHpDc0k0RXpPeFpqckcvYVNOdEdpWDUvdHNhTE80?=
 =?utf-8?B?REViNmp2SHYzSGZwMXlicndBR0t3c2hlKzhYclhkekdZdFh3VVZUTmNPNXlQ?=
 =?utf-8?B?TzJhUmFqZnlIZVJPQmxFZGxFN2RVWm5aZjNsZGZFZk1sQ1IxQWZETGNyMkpV?=
 =?utf-8?B?NGZLZW1vWCtqdkpwVlowbzRjaU1EcUZ4YlJENVAwUVIwbkM5TGpEOHVzSGxp?=
 =?utf-8?B?YzMxNmN2NGZIQjgxZWVsN1JGSE9FNjJQOFZyVTcyL1FRN1E5OVVsRlFFeE9B?=
 =?utf-8?B?NVhZam9JWTgxTTkzczVWMEE5dTYvcDIrNlpsYkVvb1BYc1MvcVF2c3Z0MmZR?=
 =?utf-8?B?TjYycXZsTXdhWXI0cHNTdWJpTWY0WDlmSjdCeE1OZEZWVTJMRHZ2RVRMaG5C?=
 =?utf-8?B?b1d4VWNFcFVDOUlyeXBlNWQxU2pGTEdHeExVTktCT3dnS3JaM1A1R0ZoRWRt?=
 =?utf-8?B?NW5DVWJMYjhXeUxOWnhqc3l6VjFhL1pOd0x2R3dsWHJlS2d3eDhzMnpBcHFq?=
 =?utf-8?B?Uk9GaitQYzVkVlE5Qm5FLzdxazcramVoRngwZ2FHbnpJVzBkSXpFYSs2NkY1?=
 =?utf-8?B?bUt5RlNqeEIyNDdTMUlKNGNJTHVNTzh2VTYvK2pGQ083TFZWYUE2ck8rVHJi?=
 =?utf-8?Q?hth49+hpAvOBoSaB5yoN6RZ9r8hZ4LOr/EXWfxZNmNL0?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1945937e-2aea-4cf0-ff41-08db5d02b239
X-MS-Exchange-CrossTenant-AuthSource: CY4PR01MB2840.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 09:30:36.8469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sw2LNGicZcDuaniwt8oE2rcuuQ3rSmKHTYD64b6p0GQPFRpVw8qFBA/GuuMkWo+R5Otq64JL+LjEUjJKf6xA/KNQbawWNLcWvb6ToJbXVit1RPN/1c4bC4styXaGzLfo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR01MB7583
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

Hi Jarkko

On 5/24/2023 19:33, Jarkko Nikula wrote:
> Hi
>
> On 5/23/23 11:21, Tam Nguyen wrote:
>> In I2C_FUNC_SMBUS_BLOCK_DATA case, the I2C Designware driver does not
>> handle correctly when it receives the length of SMBus block data
>> response from SMBus slave device, which is outside the range 1-32 bytes.
>> Consequently, the I2C Designware bus is stuck and cannot recover.
>> Because if IC_EMPTYFIFO_HOLD_MASTER_EN is set, which cannot be detected
>> from the registers, the controller can be disabled if the STOP bit is 
>> set.
>> But it is only set after receiving block data response length.
>>
>> Hence, to prevent the bus from stuck condition, after receiving the
>> invalid block data response length, the driver will read another byte
>> with STOP bit set.
>>
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Tam Nguyen <tamnguyenchi@os.amperecomputing.com>
>> ---
>>   drivers/i2c/busses/i2c-designware-master.c | 15 +++++++++++++--
>>   1 file changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-designware-master.c 
>> b/drivers/i2c/busses/i2c-designware-master.c
>> index 55ea91a63382..94dadd785ed0 100644
>> --- a/drivers/i2c/busses/i2c-designware-master.c
>> +++ b/drivers/i2c/busses/i2c-designware-master.c
>> @@ -527,8 +527,19 @@ i2c_dw_read(struct dw_i2c_dev *dev)
>>                 regmap_read(dev->map, DW_IC_DATA_CMD, &tmp);
>>               /* Ensure length byte is a valid value */
>> -            if (flags & I2C_M_RECV_LEN &&
>> -                (tmp & DW_IC_DATA_CMD_DAT) <= I2C_SMBUS_BLOCK_MAX && 
>> tmp > 0) {
>> +            if (flags & I2C_M_RECV_LEN) {
>> +                /*
>> +                 * if IC_EMPTYFIFO_HOLD_MASTER_EN is set, which 
>> cannot be
>> +                 * detected from the registers, the controller can be
>> +                 * disabled if the STOP bit is set. But it is only set
>> +                 * after receiving block data response length in
>> +                 * I2C_FUNC_SMBUS_BLOCK_DATA case. That needs to read
>> +                 * another byte with STOP bit set when the block data
>> +                 * response length is invalid to complete the 
>> transaction.
>> +                 */
>> +                if ((tmp & DW_IC_DATA_CMD_DAT) > I2C_SMBUS_BLOCK_MAX 
>> || tmp == 0)
>> +                    tmp = 1;
>> +
>>                   len = i2c_dw_recv_len(dev, tmp);
>>               }
>>               *buf++ = tmp;
>
> Looks otherwise good to me but I'm wondering the "tmp == 0" test can 
> it have the bit 11 set (on a HW where it's supported) and should it be 
> covered with DW_IC_DATA_CMD_DAT mask too? Please see commit 
> f53f15ba5a85 ("i2c: designware: Get right data length").

You're right. We should use the DW_IC_DATA_CMD_DAT mask to get the data 
part if HW supports reading bit 11 from IC_DATA_CMD. I will update it in v2.

Best regards,
Tam Nguyen

