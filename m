Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ED222B1736
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Nov 2020 09:28:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbgKMI2p (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Nov 2020 03:28:45 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:10350 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725866AbgKMI2p (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 Nov 2020 03:28:45 -0500
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0AD8R67D030468;
        Fri, 13 Nov 2020 09:28:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : references
 : from : message-id : date : mime-version : in-reply-to : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=kNfsi7ZtmZxFM4ZtJQvG2R+5IFYOpR6oyz11MxeQh0U=;
 b=Xx156703FE+Jx/MC4tXWCC6Do/CaKcNA2hA4ZOOOK/lPFTL34zHv/RRsUHgiD2FUN05c
 HAwrn0Gk86r7YqX6cWRStD+a1i6isnGMla4D6J7L4KiF+OIDso3TdgdmI9DEyBC+v7pz
 H4B/qIFQ1WO435KQcFR7N32G6vZlJW3XFwTZLyBsWjia+3qosHH2Zp/OnE5GoqiO7NtR
 d9JoxOSbeZiUx3rBHxGVlD1yGlMRH/JBNVIx40v/ikv9fRj9NgMYqSX6HpoCrMAoAs8R
 6W3ErPosprCZrDdmqKP+ldYV6kbqXAT54eMYqKEb7JxVDhjwV1P5CD2GcN4+G2aKC06v 1g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 34nj819krb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 13 Nov 2020 09:28:17 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3047F10002A;
        Fri, 13 Nov 2020 09:28:09 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag1node2.st.com [10.75.127.2])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 19C0222A4C0;
        Fri, 13 Nov 2020 09:28:09 +0100 (CET)
Received: from lmecxl1060.lme.st.com (10.75.127.46) by SFHDAG1NODE2.st.com
 (10.75.127.2) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 13 Nov
 2020 09:28:05 +0100
Subject: Re: [PATCH] [v2] i2c: stm32f7: Fix runtime PM imbalance on error
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>,
        "kjlu@umn.edu" <kjlu@umn.edu>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20200527013853.30252-1-dinghao.liu@zju.edu.cn>
 <20200601055634.GB17269@gnbcxd0016.gnb.st.com>
From:   Pierre Yves MORDRET <pierre-yves.mordret@st.com>
Message-ID: <22cad188-c13c-207d-ad8e-fac9d7277346@st.com>
Date:   Fri, 13 Nov 2020 09:27:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200601055634.GB17269@gnbcxd0016.gnb.st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG1NODE2.st.com
 (10.75.127.2)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-13_05:2020-11-12,2020-11-13 signatures=0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello

Looks good to me

Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>

Thx
Regards


On 6/1/20 7:56 AM, Alain Volmat wrote:
> Hi,
> 
> Reviewed-by: Alain Volmat <alain.volmat@st.com>
> 
> Thanks,
> Alain
> 
> On Wed, May 27, 2020 at 01:38:53AM +0000, Dinghao Liu wrote:
>> pm_runtime_get_sync() increments the runtime PM usage counter even
>> the call returns an error code. Thus a pairing decrement is needed
>> on the error handling path to keep the counter balanced.
>>
>> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
>> ---
>>
>> Changelog:
>>
>> v2: - Use pm_runtime_put_noidle() instead of
>>       pm_runtime_put_autosuspend(). Fix 5 more
>>       similar cases within this dirver.
>> ---
>>  drivers/i2c/busses/i2c-stm32f7.c | 24 ++++++++++++++++++------
>>  1 file changed, 18 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
>> index 330ffed011e0..822fd1f5b5ae 100644
>> --- a/drivers/i2c/busses/i2c-stm32f7.c
>> +++ b/drivers/i2c/busses/i2c-stm32f7.c
>> @@ -1620,8 +1620,10 @@ static int stm32f7_i2c_xfer(struct i2c_adapter *i2c_adap,
>>  	f7_msg->smbus = false;
>>  
>>  	ret = pm_runtime_get_sync(i2c_dev->dev);
>> -	if (ret < 0)
>> +	if (ret < 0) {
>> +		pm_runtime_put_noidle(i2c_dev->dev);
>>  		return ret;
>> +	}
>>  
>>  	ret = stm32f7_i2c_wait_free_bus(i2c_dev);
>>  	if (ret)
>> @@ -1666,8 +1668,10 @@ static int stm32f7_i2c_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
>>  	f7_msg->smbus = true;
>>  
>>  	ret = pm_runtime_get_sync(dev);
>> -	if (ret < 0)
>> +	if (ret < 0) {
>> +		pm_runtime_put_noidle(dev);
>>  		return ret;
>> +	}
>>  
>>  	ret = stm32f7_i2c_wait_free_bus(i2c_dev);
>>  	if (ret)
>> @@ -1767,8 +1771,10 @@ static int stm32f7_i2c_reg_slave(struct i2c_client *slave)
>>  		return ret;
>>  
>>  	ret = pm_runtime_get_sync(dev);
>> -	if (ret < 0)
>> +	if (ret < 0) {
>> +		pm_runtime_put_noidle(dev);
>>  		return ret;
>> +	}
>>  
>>  	if (!stm32f7_i2c_is_slave_registered(i2c_dev))
>>  		stm32f7_i2c_enable_wakeup(i2c_dev, true);
>> @@ -1837,8 +1843,10 @@ static int stm32f7_i2c_unreg_slave(struct i2c_client *slave)
>>  	WARN_ON(!i2c_dev->slave[id]);
>>  
>>  	ret = pm_runtime_get_sync(i2c_dev->dev);
>> -	if (ret < 0)
>> +	if (ret < 0) {
>> +		pm_runtime_put_noidle(i2c_dev->dev);
>>  		return ret;
>> +	}
>>  
>>  	if (id == 0) {
>>  		mask = STM32F7_I2C_OAR1_OA1EN;
>> @@ -2182,8 +2190,10 @@ static int stm32f7_i2c_regs_backup(struct stm32f7_i2c_dev *i2c_dev)
>>  	struct stm32f7_i2c_regs *backup_regs = &i2c_dev->backup_regs;
>>  
>>  	ret = pm_runtime_get_sync(i2c_dev->dev);
>> -	if (ret < 0)
>> +	if (ret < 0) {
>> +		pm_runtime_put_noidle(i2c_dev->dev);
>>  		return ret;
>> +	}
>>  
>>  	backup_regs->cr1 = readl_relaxed(i2c_dev->base + STM32F7_I2C_CR1);
>>  	backup_regs->cr2 = readl_relaxed(i2c_dev->base + STM32F7_I2C_CR2);
>> @@ -2204,8 +2214,10 @@ static int stm32f7_i2c_regs_restore(struct stm32f7_i2c_dev *i2c_dev)
>>  	struct stm32f7_i2c_regs *backup_regs = &i2c_dev->backup_regs;
>>  
>>  	ret = pm_runtime_get_sync(i2c_dev->dev);
>> -	if (ret < 0)
>> +	if (ret < 0) {
>> +		pm_runtime_put_noidle(i2c_dev->dev);
>>  		return ret;
>> +	}
>>  
>>  	cr1 = readl_relaxed(i2c_dev->base + STM32F7_I2C_CR1);
>>  	if (cr1 & STM32F7_I2C_CR1_PE)
>> -- 
>> 2.17.1
>>
