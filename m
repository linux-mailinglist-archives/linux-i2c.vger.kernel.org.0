Return-Path: <linux-i2c+bounces-2717-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5688B895002
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Apr 2024 12:27:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A04A1C22F71
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Apr 2024 10:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A7EC5D8F0;
	Tue,  2 Apr 2024 10:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YSFNzLx/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDB25D47B;
	Tue,  2 Apr 2024 10:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712053620; cv=none; b=PDew+OWt5qARoV+KX4kItj2DUJLvGiFBAf9WyaYtSQKlXLav+CoDOPWTRK3lqRpbbBmdDkCL2EKr+5QWpe/kd6t0PzK+ge4zf5R2T02Lzo0oLdH08C44i9iEYMuk2XOzjOU9eUHXhsGghOn/VGVIPriXfuaEpXkPNU+NJe6jfiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712053620; c=relaxed/simple;
	bh=+eFe3TBJLr87BtCWTElHnPERNcTzJNOrD7R50LH437Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Cma6r07gw9ChoI4DICAfBvinzMnHkU3eNRlWF3mD8vd3qI1wW60bHI7km02T66veP7neanqEEdkUWAwADKxcjWl4ES9stnSDJ1imq8TZZt7mCZsp/fxhyRWHMUxiTngMZS2ayXRenfVoeLhUM0ggkX2X/n5dYGCEwWoeHR8MQs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YSFNzLx/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4325HKeM031770;
	Tue, 2 Apr 2024 10:26:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=uksFEbTHLxU2cqRIXHLFh61JHGugwCO+k16/jtYBnrQ=; b=YS
	FNzLx/+3/HEL784FHnepSpVEQIMwhtLSyJfH7F97XpvK2zveyf6HtNDZGi1h8ITM
	lztHJxqT8MMAgIZeBKn9WTpo0vKJrmPie9384SnfCDF78t7utgTEhuR0YdiwX9SS
	YtGMJqGbn0I9Zwg7AaL0o4AUq4+Cujiaj+HnKu59xfOM3yiYtvvJs3q2AxKkYUxh
	sD8D595dWoxTwMNyo9RZJC6sqYNHam+W+wF1yrAKXsnJql8RMQzhnfVCQra4ibDU
	2RVHR0YtIfue8uqu9yGwDNpuCdl/VT4zTONnOsq/LEU4FDvYAG5bK+IaNwcEpYSa
	E/0e1gKTjfatyA8mPakA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x88eh91k9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Apr 2024 10:26:54 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 432AQsD4031657
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 2 Apr 2024 10:26:54 GMT
Received: from [10.218.22.190] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 2 Apr 2024
 03:26:51 -0700
Message-ID: <1b247a4b-a260-4f89-bdcb-e821a47914d3@quicinc.com>
Date: Tue, 2 Apr 2024 15:56:47 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] i2c: i2c-qcom-geni: Serve transfer during early resume
 stage
Content-Language: en-US
To: Andi Shyti <andi.shyti@kernel.org>
CC: <konrad.dybcio@linaro.org>, <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <quic_vdadhani@quicinc.com>,
        Vinod Koul
	<vkoul@kernel.org>
References: <20240328123743.1713696-1-quic_msavaliy@quicinc.com>
 <j5zai7pw7pxe2owjsoq2ncwhsmwe2llmcvb7vp46xi757eamub@inefovgffgpp>
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <j5zai7pw7pxe2owjsoq2ncwhsmwe2llmcvb7vp46xi757eamub@inefovgffgpp>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: E_nVZxps7922X-EC98fYyVfOLaUjSpNz
X-Proofpoint-ORIG-GUID: E_nVZxps7922X-EC98fYyVfOLaUjSpNz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-02_04,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 adultscore=0 bulkscore=0 mlxlogscore=916 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2404020075

Thanks Andi !

On 3/30/2024 3:24 AM, Andi Shyti wrote:
> Hi Mukesh,
> 
> On Thu, Mar 28, 2024 at 06:07:43PM +0530, Mukesh Kumar Savaliya wrote:
>> pm_runtime_get_sync() function fails during PM early resume and returning
>> -EACCES because runtime PM for the device is disabled at the early stage
>> causing i2c transfer to fail. Make changes to serve transfer with force
>> resume.
>>
>> 1. Register interrupt with IRQF_EARLY_RESUME and IRQF_NO_SUSPEND flags
>>     to avoid timeout of transfer when IRQ is not enabled during early stage.
>> 2. Do force resume if pm_runtime_get_sync() is failing after system
>>     suspend when runtime PM is not enabled.
>> 3. Increment power usage count after forced resume to balance
>>     it against regular runtime suspend.
>>
>> Co-developed-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> 
> Is this a fix? O mostly an improvement?
It's an improvement to serve transfer during early resume time. Doesn't 
fix any crash issue.
> 
> ...
> 
>>   	gi2c->err = 0;
>>   	reinit_completion(&gi2c->done);
>> -	ret = pm_runtime_get_sync(gi2c->se.dev);
>> -	if (ret < 0) {
>> -		dev_err(gi2c->se.dev, "error turning SE resources:%d\n", ret);
>> -		pm_runtime_put_noidle(gi2c->se.dev);
>> -		/* Set device in suspended since resume failed */
>> -		pm_runtime_set_suspended(gi2c->se.dev);
>> -		return ret;
>> +
>> +	if (!pm_runtime_enabled(dev) && gi2c->suspended) {
>> +		dev_dbg(gi2c->se.dev, "RT_PM disabled, Do force resume, usage_count:%d\n",
> 
> dev
> 
Sure, Done.

> nit: you could leave a space after the ':'.
> 
Sure, Done.

>> +			atomic_read(&dev->power.usage_count));
>> +		ret = geni_i2c_force_resume(gi2c);
>> +		if (ret)
>> +			return ret;
>> +	} else {
>> +		ret = pm_runtime_get_sync(dev);
>> +		if (ret == -EACCES && gi2c->suspended) {
>> +			dev_dbg(gi2c->se.dev, "PM get_sync() failed-%d, force resume\n", ret);
> 
> dev
> 
Done.
>> +			ret = geni_i2c_force_resume(gi2c);
>> +			if (ret)
>> +				return ret;
>> +		}
> 
> Are we missing some cases here? Do we need a few more else's?
> 
> Andi
> 
No More else cases required.
>>   	}
>>   
>>   	qcom_geni_i2c_conf(gi2c);
>> @@ -702,8 +730,15 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
>>   	else
>>   		ret = geni_i2c_fifo_xfer(gi2c, msgs, num);
>>   
>> -	pm_runtime_mark_last_busy(gi2c->se.dev);
>> -	pm_runtime_put_autosuspend(gi2c->se.dev);
>> +	if (!pm_runtime_enabled(dev) && !gi2c->suspended) {
>> +		pm_runtime_put_noidle(dev);
>> +		pm_runtime_set_suspended(dev);
> 
> this looks like repeated code, how about making it a function?
> 
Checked it, but seems we need additional flag too to be added at one 
place where as common part is 2 lines of code. If this code continues to 
be repeated, i can think of keeping under a wrapper function. Please let 
me know if still needed to make a separate function.
>> +		gi2c->suspended = 0;
>> +	} else {
>> +		pm_runtime_mark_last_busy(gi2c->se.dev);
>> +		pm_runtime_put_autosuspend(gi2c->se.dev);
>> +	}
>> +
>>   	gi2c->cur = NULL;
>>   	gi2c->err = 0;
>>   	return ret;
>> @@ -820,7 +855,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
>>   	init_completion(&gi2c->done);
>>   	spin_lock_init(&gi2c->lock);
>>   	platform_set_drvdata(pdev, gi2c);
>> -	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq, 0,
>> +	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq, IRQF_EARLY_RESUME | IRQF_NO_SUSPEND,
> 
> Can you provide a bit more information on how an early interrupt
> would be handled once the device is resumed?
> 
Sure, Let me go little descriptive here.
Post system suspend when system resume starts (because of PCI/touch 
device wakeup interrupt or anything else).

1.That time i2c client device handler will directly start i2c transfer, 
but we could not serve transfer because device is runtime suspended and 
runtime PM remains disabled. This happens during early_resume callback 
time, hence we have added forced_resume()

Basically system is still suspended and not reached to the point of 
enabling runtime PM of the i2c master.

2. If the IRQF_EARLY_RESUME is not registered, then we get timeout as 
the interrupt is not enabled. kernel/irq/pm.c has function which Enables 
interrupt lines having IRQF_EARLY_RESUME set during syscore instead of 
device resume time.

irq_pm_syscore_resume() => resume_irqs() => __enable_irq()

> Thanks,
> Andi
> 
>>   			       dev_name(dev), gi2c);
>>   	if (ret) {
>>   		dev_err(dev, "Request_irq failed:%d: err:%d\n",
>> -- 
>> 2.25.1
>>

