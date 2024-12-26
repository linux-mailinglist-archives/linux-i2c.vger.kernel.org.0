Return-Path: <linux-i2c+bounces-8725-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 024519FCB0E
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Dec 2024 14:06:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B4247A14A3
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Dec 2024 13:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86AD61D47AC;
	Thu, 26 Dec 2024 13:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FwRo17f6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD88182D7;
	Thu, 26 Dec 2024 13:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735218391; cv=none; b=YZixLDfMpQ0bHANLw4CY4iu5JntDYzDZppdHnlRX/qU9yUkT74OfOQ5ylruffI8o2nFOIbU6F1oXsr72zJTtT8wcQ9aLYH9FznAlNHj/g4DTooPMnJ2fcz2AoeCZzmH13r0q6fOojtg6q2L696m9bKAkOSyUA2jYmLbMs0xjq68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735218391; c=relaxed/simple;
	bh=OUFR84oQYehGSmeLoAPIQbPkAAZFwf9CkId1WOgq/Dc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TBA82W+5ypBvpO5O3LkX44x6DmWYsqf9hMkkC3WnLfJs3IceAfk9Oj+dVgzZ0nVrB2nNk2aAj5rGdKMFH5CMZNIOQ+GzQBdZtUMZU/xnr8GryBGs2zgAsao0UU+NSm5IhOK7uZwMPn9t5e7Gb4yPik07icyg+TDa1SHSh65haFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FwRo17f6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BQBS33S006166;
	Thu, 26 Dec 2024 13:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RhOENLybUnzcRuOvBj4kQ1aB/y1Y1wJ0KD/g5oubxuc=; b=FwRo17f6W9yOUSF7
	s4v3x/82nqa1zSjwailbsw3Knf8zh0Zd3uIj+/FAFcbJ8BeQIojYbgyaO4IMLYpJ
	EYBH+a+mx3ThufIzceJ/iF4hBtQQITsLghvIshzm/E7yhEnLswpEyp7+9I8QYRq/
	S1AewWi10p+lqvDsTJfVAC8z8OfkPLN0bQdrZxnMvL8wQgmjjsr9g/FTEtCvaKT5
	oa6xH7ZmMQwtloCI+V5If+JkWet+axZZQnq8E9Psrq2qiPAXiodZV7Ml2uDQuXwC
	tQz4dLJ8LXCmlrfqpADMkTonE0TY226QjzL/+I92n/HqR5CqD00uNL4TZZqbj3OY
	8XWXgg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43s69ugfj9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 13:06:24 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BQD6GP1021156
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 13:06:16 GMT
Received: from [10.216.14.233] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 26 Dec
 2024 05:06:12 -0800
Message-ID: <bd699719-4958-445a-a685-4b5f6a8ad81f@quicinc.com>
Date: Thu, 26 Dec 2024 18:36:08 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] i2c: i2c-qcom-geni: Serve transfer during early resume
 stage
To: Bjorn Andersson <andersson@kernel.org>
CC: <andi.shyti@kernel.org>, <quic_bjorande@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_vdadhani@quicinc.com>,
        <vkoul@kernel.org>
References: <20241129074742.1844031-1-quic_msavaliy@quicinc.com>
 <lun7au32tizcahzridtmx2dv3qz6onpnstadla5sf44o7o4my7@s6joggbptwgw>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <lun7au32tizcahzridtmx2dv3qz6onpnstadla5sf44o7o4my7@s6joggbptwgw>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: r5iyzPhcXzaMZE2FMrrcKNNygL6aJDGJ
X-Proofpoint-GUID: r5iyzPhcXzaMZE2FMrrcKNNygL6aJDGJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412260116

Hi Bjorn,

On 11/30/2024 9:59 AM, Bjorn Andersson wrote:
> On Fri, Nov 29, 2024 at 01:17:42PM +0530, Mukesh Kumar Savaliya wrote:
> 
> Your recipients list is broken because you crafted the arguments list to
> git send-email by hand. Please read go/upstream and adopt the b4 tool
> for sending patches.
> 
>> pm_runtime_get_sync() function fails during PM early resume and returns
>> -EACCES because runtime PM for the device is disabled at the early stage
>> causing i2c transfer to fail. Make changes to serve transfer with forced
>> resume.
>>
>> Few i2c clients like PCI OR touch may request i2c transfers during early
> 
> What is "PCI OR"? Do you mean "PCI or" (or "PCIe and touch"). I'm not
> sure why touch would need access to the I2C bus during early resume.
Yes, I mean "PCI or".
Touch has usecase when system is sleeping and we touch in full system 
suspend state, the event/interrupt should fire and request to i2c read 
happens during early resume stage. This was observed in downstream and 
supported to customer requirements too.

For now, let's consider PCI which is actual client on upstream codebase.
> 
>> resume stage. Any i2c client can keep transfer request very early resume
>> stage like noirq phase of PM. To serve the transfer, register an interrupt
>> with IRQF_EARLY_RESUME and IRQF_NO_SUSPEND flags to avoid timeout of
>> transfer when IRQ is not enabled during early stage.
>>
>> The actual usecase over i2c is(Not in upstream yet), PCIe client ->
> 
> This text goes into the git history, which means that this statement
> (not in upstream yet) will become incorrect before this patch becomes
> needed.
i just wanted to explain the context and usecase.
> 
>> PCIe Driver -> I2C driver.
>> PCIe client needs certain configurations over i2c after powering on the
>> PCIe switch.
> 
> In the first sentence you use the word "client". In the second you use
> "client" and "switch", but I think all three cases refer to the same
> component.
> 
Yes, i2c client is PCI client switch. shall enhance this.
> The description is much better, but I think you can polish the wording
> to make it even clearer - remember, this will become the only
> documentation to why the code looks like it does; it's going to be read
> by people outside your team (and company), who hasn't been part of any
> discussions leading up to the patch, and it need to be clear why so they
> know what changes they can make.
> 
I agree and understood. I have got the latest writeup and enhanced it, i 
should update.
>> As part of suspend it uses suspend_noirq() to turn off the
>> switch, because some PCIe clients do some transfers till suspend_noirq()
>> phase. And as part of resume_noirq(), it enables the power to the switch
>> and configures the switch again through i2c.
>>
>> If pm_runtime_get_sync() is failing when runtime PM is not enabled, then
>> use pm_runtime_force_resume().
> 
> Tell us why, not what.
Sure, will add reason.
> 
>>
>> Co-developed-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> ---
>> Link to V3: https://lore.kernel.org/all/20241119143031.3331753-1-quic_msavaliy@quicinc.com/T/
>>
>> v3->v4 :
>>   - Enhanced commit log by explaining client usecase scenario during early resume.
>>   - Covered 'usage_count' of 'struct dev_pm_info' under CONFIG_PM to compile non PM CONFIG.
>>
>> ---
>> Link to V2: https://lore.kernel.org/lkml/202410132233.P25W2vKq-lkp@intel.com/T/
>>
>>   v2 -> v3:
>>   - Updated exact usecase and scenario in the commit log description.
>>   - Removed bulleted points from technical description, added details in free flow.
>>   - Used pm_runtime_force_resume/suspend() instead customized local implementation.
>>   - Added debug log after pm_runtime_force_suspend().
>>
>> ---
>>
>>   v1 -> v2:
>>   - Changed gi2c->se.dev to dev during dev_dbg() calls.
>>   - Addressed review comments from Andi and Bjorn.
>>   - Returned 0 instead garbage inside geni_i2c_force_resume().
>>   - Added comments explaining forced resume transfer when runtime PM
>>     remains disabled.
>> ---
>>
>>      V1 link: https://patches.linaro.org/project/linux-i2c/patch/20240328123743.1713696-1-quic_msavaliy@quicinc.com/
>> ---
>> ---
>>   drivers/i2c/busses/i2c-qcom-geni.c | 47 ++++++++++++++++++++++--------
>>   1 file changed, 35 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
>> index 7a22e1f46e60..94f875aca9aa 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -695,17 +695,29 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
>>   			 int num)
>>   {
>>   	struct geni_i2c_dev *gi2c = i2c_get_adapdata(adap);
>> +	struct device *dev = gi2c->se.dev;
>>   	int ret;
>>   
>>   	gi2c->err = 0;
>>   	reinit_completion(&gi2c->done);
>> -	ret = pm_runtime_get_sync(gi2c->se.dev);
>> -	if (ret < 0) {
>> -		dev_err(gi2c->se.dev, "error turning SE resources:%d\n", ret);
>> -		pm_runtime_put_noidle(gi2c->se.dev);
>> -		/* Set device in suspended since resume failed */
>> -		pm_runtime_set_suspended(gi2c->se.dev);
>> -		return ret;
>> +	/* Serve I2C transfer by forced resume if Runtime PM is enbled or not */
> 
> That is what the code says too, document why.
> 
>> +	if (!pm_runtime_enabled(dev) && gi2c->suspended) {
>> +		#if (IS_ENABLED(CONFIG_PM))
> 
> This condition doesn't look right.
Sorry, i should make it opposite.
> 
>> +		dev_dbg(dev, "Runtime PM is disabled hence force resume, pm_usage_count: %d\n",
> 
> Is the information that runtime PM being disable relevant information
> for the average user? I guess it can be useful to have a debug print
> telling you that power is being forced on... But this could probably be
> expressed more succinct.
Sure
> 
>> +			atomic_read(&dev->power.usage_count));
>> +		#endif
>> +		ret = pm_runtime_force_resume(dev);
>> +		if (ret)
>> +			return ret;
>> +	} else {
>> +		ret = pm_runtime_get_sync(gi2c->se.dev);
>> +		if (ret < 0) {
>> +			dev_err(gi2c->se.dev, "error turning SE resources:%d\n", ret);
> 
> You don't need "SE" in this sentence, but "turning on resources" would
> sound better. Please also include a space after ':'.
> 
>> +			pm_runtime_put_noidle(gi2c->se.dev);
>> +			/* Set device in suspended since resume failed */
>> +			pm_runtime_set_suspended(gi2c->se.dev);
>> +			return ret;
>> +		}
>>   	}
>>   
>>   	qcom_geni_i2c_conf(gi2c);
>> @@ -715,8 +727,20 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
>>   	else
>>   		ret = geni_i2c_fifo_xfer(gi2c, msgs, num);
>>   
>> -	pm_runtime_mark_last_busy(gi2c->se.dev);
>> -	pm_runtime_put_autosuspend(gi2c->se.dev);
>> +	/* if Runtime PM is disabled, do force_suspend() else autosuspend the driver */
> 
> That is what the code says.
Sure, will remove it then.
> 
>> +	if (!pm_runtime_enabled(dev) && !gi2c->suspended) {
>> +		ret = pm_runtime_force_suspend(dev);
>> +		#if (IS_ENABLED(CONFIG_PM))
>> +		dev_dbg(dev, "Runtime PM is disabled hence force suspend, pm_usage_count: %d\n",
>> +			atomic_read(&dev->power.usage_count));
>> +		#endif
>> +		if (ret)
>> +			return ret;
>> +	} else {
>> +		pm_runtime_mark_last_busy(gi2c->se.dev);
>> +		pm_runtime_put_autosuspend(gi2c->se.dev);
>> +	}
>> +
>>   	gi2c->cur = NULL;
>>   	gi2c->err = 0;
>>   	return ret;
>> @@ -833,9 +857,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
>>   	init_completion(&gi2c->done);
>>   	spin_lock_init(&gi2c->lock);
>>   	platform_set_drvdata(pdev, gi2c);
>> -
>> -	/* Keep interrupts disabled initially to allow for low-power modes */
> 
> This comment looks incorrect. But your change doesn't change the related
> fact. Please send a separate commit removing it - with proper
> motivation.
> 
Sure
> Thanks,
> Bjorn
> 
>> -	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq, IRQF_NO_AUTOEN,
>> +	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq,
>> +			       IRQF_NO_AUTOEN | IRQF_EARLY_RESUME | IRQF_NO_SUSPEND,
>>   			       dev_name(dev), gi2c);
>>   	if (ret) {
>>   		dev_err(dev, "Request_irq failed:%d: err:%d\n",
>> -- 
>> 2.25.1
>>
>>


