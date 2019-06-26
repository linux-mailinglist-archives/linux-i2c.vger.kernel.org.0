Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34C8356B9E
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2019 16:15:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727516AbfFZOPI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jun 2019 10:15:08 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:36794 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726157AbfFZOPI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Jun 2019 10:15:08 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5QE6Sop016102;
        Wed, 26 Jun 2019 16:14:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=WC3M5mQ7yREfwEdPV7kKxdDvvWYQOrxeml4zeAizf3M=;
 b=M9CdTU8a0eBLpab+3SnE9feWBOzkHJz2OpdgAtiDVRsmMHTMNeiieG0WPOZBMIuYFyCL
 q6/wC7J7y56YYd0k6d3j9YGQeTZJT1C4lJ6NmFjeJfSV5QMi/5BM5kJNHydg3TjkXoCq
 BDmV5tw2+fUgj3bYHtiwLPpKanLNjNJSIshsjY6wckQNSWqkx9rYyZ6eTamZDhi7sORk
 1CEC7Nx8Qqlw9KR3G9NLe5Sj9hmcigDw/v4/KjTNeMTrLSfH4Mqcaxd4yv9SDROw13nF
 4uLWLOMc+f6W+ReEtzGIdSuk/2slqfP0TSWIaM+bQBx9dX3DjDr1xPG9kCTiSRyuxVZ0 Hg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2t9d2ggnvf-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Wed, 26 Jun 2019 16:14:56 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EB3E038;
        Wed, 26 Jun 2019 14:14:54 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BA4712A63;
        Wed, 26 Jun 2019 14:14:54 +0000 (GMT)
Received: from [10.48.1.93] (10.75.127.51) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 26 Jun
 2019 16:14:53 +0200
Subject: Re: [PATCH] i2c: i2c-stm32f7: Add I2C_SMBUS_I2C_BLOCK_DATA support
To:     Wolfram Sang <wsa@the-dreams.de>,
        Fabrice Gasnier <fabrice.gasnier@st.com>
CC:     <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <1559654451-26612-1-git-send-email-fabrice.gasnier@st.com>
 <20190626134535.GN801@ninjato>
From:   Pierre Yves MORDRET <pierre-yves.mordret@st.com>
Message-ID: <762d7038-62e5-4192-e471-e18194e528f9@st.com>
Date:   Wed, 26 Jun 2019 16:14:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190626134535.GN801@ninjato>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG5NODE2.st.com
 (10.75.127.14)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-06-26_07:,,
 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

I looks good to me

Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>

Thx

On 6/26/19 3:45 PM, Wolfram Sang wrote:
> On Tue, Jun 04, 2019 at 03:20:51PM +0200, Fabrice Gasnier wrote:
>> This patch adds the support of I2C_SMBUS_I2C_BLOCK_DATA transaction type
>> for the stm32f7 SMBUS Controller.
>> Use emulated I2C_SMBUS_I2C_BLOCK_DATA transactions as there is no specific
>> hardware in STM32 I2C to manage this (e.g. like no need for PEC here).
>> Emulated transfer will fall back calling i2c transfer method where there's
>> already support for DMAs for example.
>> So, use the I2C_FUNC_SMBUS_I2C_BLOCK in stm32f7_i2c_func(), and rely on
>> emulated transfer by returning -EOPNOTSUPP in the smbus_xfer() routine
>> for such a case.
>>
>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> 
> Maintainers?
> 
>> ---
>>  drivers/i2c/busses/i2c-stm32f7.c | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
>> index 48337be..68a751e 100644
>> --- a/drivers/i2c/busses/i2c-stm32f7.c
>> +++ b/drivers/i2c/busses/i2c-stm32f7.c
>> @@ -953,6 +953,9 @@ static int stm32f7_i2c_smbus_xfer_msg(struct stm32f7_i2c_dev *i2c_dev,
>>  		cr2 &= ~STM32F7_I2C_CR2_RD_WRN;
>>  		f7_msg->read_write = I2C_SMBUS_READ;
>>  		break;
>> +	case I2C_SMBUS_I2C_BLOCK_DATA:
>> +		/* Rely on emulated i2c transfer (through master_xfer) */
>> +		return -EOPNOTSUPP;
>>  	default:
>>  		dev_err(dev, "Unsupported smbus protocol %d\n", f7_msg->size);
>>  		return -EOPNOTSUPP;
>> @@ -1803,7 +1806,8 @@ static u32 stm32f7_i2c_func(struct i2c_adapter *adap)
>>  		I2C_FUNC_SMBUS_QUICK | I2C_FUNC_SMBUS_BYTE |
>>  		I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA |
>>  		I2C_FUNC_SMBUS_BLOCK_DATA | I2C_FUNC_SMBUS_BLOCK_PROC_CALL |
>> -		I2C_FUNC_SMBUS_PROC_CALL | I2C_FUNC_SMBUS_PEC;
>> +		I2C_FUNC_SMBUS_PROC_CALL | I2C_FUNC_SMBUS_PEC |
>> +		I2C_FUNC_SMBUS_I2C_BLOCK;
>>  }
>>  
>>  static struct i2c_algorithm stm32f7_i2c_algo = {
>> -- 
>> 2.7.4
>>
