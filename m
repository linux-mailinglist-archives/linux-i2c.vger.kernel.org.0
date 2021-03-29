Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C503034CCD4
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Mar 2021 11:17:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231929AbhC2JRA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Mar 2021 05:17:00 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:14144 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S235074AbhC2JQi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Mar 2021 05:16:38 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12T98hNb031476;
        Mon, 29 Mar 2021 11:16:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=1fp/BXYLYqPxjXC4DncX+Os2t1/CmOZQmZcEUOGAWj4=;
 b=mDnUly/cLzf0OalgOT4c9qfTj1+9QktPJ6VOtCEBceg+6xGwZj6pKaRnARqAx4cTBtMA
 VlkTIKa4YOY9j5ej6UTaXp8UcWLVxix59NDkcWCLrQOUDLXSTky3L6/p0+RDYcAm3xUN
 5VmJgvmPnIb5VAziWBim2+Igr8DabjB+/U58EVtKECZEqrg398Aa7nVmu1LAeatKqwBl
 bLTMC8pmLxKajGOgNCBUzQLG0Wx/M0izURvpi+xhmk3rydQS7TKfE7VV6QOFd5mUoGdJ
 cx+EES2czIgYvvYs/hAkX3CYbtq3xW6mq6RHR8IKQaHQHWR7PR8yMUf7LUbUi1eYdGH3 bg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 37jvdmkn3h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 29 Mar 2021 11:16:06 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5DFC8100034;
        Mon, 29 Mar 2021 11:16:04 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 28D85237AFC;
        Mon, 29 Mar 2021 11:16:04 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 29 Mar
 2021 11:16:03 +0200
Subject: Re: [PATCH 4/5] ARM: dts: stm32: enable the analog filter for all I2C
 nodes in stm32mp151
To:     Pierre Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>, <wsa@kernel.org>,
        <robh+dt@kernel.org>
CC:     <mark.rutland@arm.com>, <mcoquelin.stm32@gmail.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@foss.st.com>
References: <1612515104-838-1-git-send-email-alain.volmat@foss.st.com>
 <1612515104-838-5-git-send-email-alain.volmat@foss.st.com>
 <59aec92b-9e5d-b9e9-0fee-d14d50281d4b@foss.st.com>
From:   Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <da959215-eb44-1dfb-61fb-0ce8354db7ce@foss.st.com>
Date:   Mon, 29 Mar 2021 11:16:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <59aec92b-9e5d-b9e9-0fee-d14d50281d4b@foss.st.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-29_05:2021-03-26,2021-03-29 signatures=0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Alain

On 2/10/21 9:39 AM, Pierre Yves MORDRET wrote:
> Hello
> 
> Looks good to me
> 
> Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
> 
> Thx
> Regards
> 
> 

Applied on stm32-next.

Thanks.
Alex

> On 2/5/21 9:51 AM, Alain Volmat wrote:
>> Enable the analog filter for all I2C nodes of the stm32mp151.
>>
>> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
>> ---
>>   arch/arm/boot/dts/stm32mp151.dtsi | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
>> index 3c75abacb374..558fc8fb38b6 100644
>> --- a/arch/arm/boot/dts/stm32mp151.dtsi
>> +++ b/arch/arm/boot/dts/stm32mp151.dtsi
>> @@ -493,6 +493,7 @@
>>   			#size-cells = <0>;
>>   			st,syscfg-fmp = <&syscfg 0x4 0x1>;
>>   			wakeup-source;
>> +			i2c-analog-filter;
>>   			status = "disabled";
>>   		};
>>   
>> @@ -508,6 +509,7 @@
>>   			#size-cells = <0>;
>>   			st,syscfg-fmp = <&syscfg 0x4 0x2>;
>>   			wakeup-source;
>> +			i2c-analog-filter;
>>   			status = "disabled";
>>   		};
>>   
>> @@ -523,6 +525,7 @@
>>   			#size-cells = <0>;
>>   			st,syscfg-fmp = <&syscfg 0x4 0x4>;
>>   			wakeup-source;
>> +			i2c-analog-filter;
>>   			status = "disabled";
>>   		};
>>   
>> @@ -538,6 +541,7 @@
>>   			#size-cells = <0>;
>>   			st,syscfg-fmp = <&syscfg 0x4 0x10>;
>>   			wakeup-source;
>> +			i2c-analog-filter;
>>   			status = "disabled";
>>   		};
>>   
>> @@ -1533,6 +1537,7 @@
>>   			#size-cells = <0>;
>>   			st,syscfg-fmp = <&syscfg 0x4 0x8>;
>>   			wakeup-source;
>> +			i2c-analog-filter;
>>   			status = "disabled";
>>   		};
>>   
>> @@ -1570,6 +1575,7 @@
>>   			#size-cells = <0>;
>>   			st,syscfg-fmp = <&syscfg 0x4 0x20>;
>>   			wakeup-source;
>> +			i2c-analog-filter;
>>   			status = "disabled";
>>   		};
>>   
>>
> 
