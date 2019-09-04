Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BCB8A7CFF
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2019 09:47:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727787AbfIDHr2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Sep 2019 03:47:28 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:26660 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727144AbfIDHr1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 Sep 2019 03:47:27 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x847bAmM000836;
        Wed, 4 Sep 2019 09:47:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=4UyuBYEhSmaJWCoduBpGAY7jENPHNN3jaF8lnYU4bFY=;
 b=avLB/K+6dY1CH0Jiwo9EBM5miectu4+Tap6y9Zoritd2dLPoZcLD1Dwpl8D9oCB3J2Db
 ULwNIdfpicC7HVHo8X7839kHq/yt7EGMps7uItCDQFhABO5T6SM0VM/HE5tEvjtjdO9p
 /3BU6I0Qkgfc/iYkWYvRFBsws+mOklltKTUGZzlqmiXGGtJUdUrx3RJdOjsFqrfh60Ur
 SDLYlCTnRnBPUaVfoL81ZPNOg83zjEzLqE+B+iUi+5m/csvhwPx/ECXDhLx2k/TxaihG
 uLnV0r/Ixi7nnpAKDgedAU6gZyF0pwLsBMmD914k4waeTETbLoP5koubBxysrtTNg/z4 jQ== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
        by mx08-00178001.pphosted.com with ESMTP id 2uqe19r07v-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Wed, 04 Sep 2019 09:47:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7F74E54;
        Wed,  4 Sep 2019 07:47:09 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 35A4A2BA693;
        Wed,  4 Sep 2019 09:47:09 +0200 (CEST)
Received: from [10.48.1.93] (10.75.127.45) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 4 Sep
 2019 09:47:08 +0200
Subject: Re: [PATCH] i2c: stm32f7: Make structure stm32f7_i2c_algo constant
To:     Wolfram Sang <wsa@the-dreams.de>,
        Nishka Dasgupta <nishkadg.linux@gmail.com>
CC:     <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20190815055857.1944-1-nishkadg.linux@gmail.com>
 <20190903180552.GI2171@ninjato>
From:   Pierre Yves MORDRET <pierre-yves.mordret@st.com>
Message-ID: <662b171f-37e2-f58e-3e05-41a52737b1f3@st.com>
Date:   Wed, 4 Sep 2019 09:47:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190903180552.GI2171@ninjato>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG5NODE2.st.com
 (10.75.127.14)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-04_01:2019-09-03,2019-09-04 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram

Sorry for the delay.

Acked-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>

BR

On 9/3/19 8:05 PM, Wolfram Sang wrote:
> On Thu, Aug 15, 2019 at 11:28:57AM +0530, Nishka Dasgupta wrote:
>> Static structure stm32f7_i2c_algo, of type i2c_algorithm, is used only
>> when it is assigned to constant field algo of a variable having type
>> i2c_adapter. As stm32f7_i2c_algo is therefore never modified, make it
>> const as well to protect it from unintended modification.
>> Issue found with Coccinelle.
>>
>> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
>> ---
> 
> Are you guys okay with this patch?
> 
>>  drivers/i2c/busses/i2c-stm32f7.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
>> index 266d1c269b83..d36cf08461f7 100644
>> --- a/drivers/i2c/busses/i2c-stm32f7.c
>> +++ b/drivers/i2c/busses/i2c-stm32f7.c
>> @@ -1809,7 +1809,7 @@ static u32 stm32f7_i2c_func(struct i2c_adapter *adap)
>>  		I2C_FUNC_SMBUS_I2C_BLOCK;
>>  }
>>  
>> -static struct i2c_algorithm stm32f7_i2c_algo = {
>> +static const struct i2c_algorithm stm32f7_i2c_algo = {
>>  	.master_xfer = stm32f7_i2c_xfer,
>>  	.smbus_xfer = stm32f7_i2c_smbus_xfer,
>>  	.functionality = stm32f7_i2c_func,
>> -- 
>> 2.19.1
>>
