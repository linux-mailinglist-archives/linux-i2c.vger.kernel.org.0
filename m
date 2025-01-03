Return-Path: <linux-i2c+bounces-8890-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5164A00931
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 13:28:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D0971884483
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 12:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E0391F9F5A;
	Fri,  3 Jan 2025 12:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ckz+aIRL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF13219E0;
	Fri,  3 Jan 2025 12:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735907275; cv=none; b=W7MyalEnjrsCowtvhaiP6FCt/yskIlqYjQoI4D5Q8t04Dd7cMBRos9gTq2JDVQp9FpE84KFbH/Bw29yg2mrMmeQ4ejxkq4PYAqtoXJjamTIvxyPYeCoDm8WaSc/7AMAYfUgzg4oR33lkftIYPqpdFyudaOuQiBArHAVlVAu7ciA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735907275; c=relaxed/simple;
	bh=rajRgg5JjehrlZpBlIzZk6nRpQpEQ1vQ8aHgvMD9jXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sFFIuUTAzw8ukQ6Wf12i/dcpQh6jqhPWQSb778E0kKeo/7hAjMA0G9qTeabcev6GPJTPz23tWw13RIm8xF64ayqm0w7wGMCs9Qh8pFFBiq2yaX3OEdUYYO7OlDJ8JGY7Hkm0sAQSI7QPSMuk+TCFErPW/TesGRdrT09h+cgKwNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ckz+aIRL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 503BJ9Jw008316;
	Fri, 3 Jan 2025 12:27:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DpjjYYrq/Z26vXv0hJLwz7iVJUs3bbjdoTiWtMOhdJI=; b=ckz+aIRLcTng2k67
	UPBArNNFqm0J3z4Rdb5ECrP+3nF97rFDBOkZyFNlDpMj/g/IXHl8zQy7p5r4uHpa
	sb+pO8Agtyi2CJiwWn2cX0HBCOeMaV9d9bJJT3ycCcxE+seXctAmiKRxFwy27SGm
	NTDpoULzWP141CFiir0/56DrvtCY92KEi5BzqlsbGnYlsSONNLxUH3bFqsfXIulg
	aQriHXfC8EH/X6VlkCOpQNDhB2MyRSk716KxWxWJM5IIee5xylJC15hqJPxvwdzL
	XPzkmQRW0fA4VeJTiDVS/mbTCpfk+h7Z1qrR7zflHD8QjW/H4hX+UXYsWp2QdVjc
	b1JFfw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43xewfg44u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jan 2025 12:27:49 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 503CRmth006085
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 Jan 2025 12:27:48 GMT
Received: from [10.216.47.210] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 3 Jan 2025
 04:27:44 -0800
Message-ID: <668b93c4-96a7-4326-9718-c4693cd64948@quicinc.com>
Date: Fri, 3 Jan 2025 17:57:40 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] i2c: i2c-qcom-geni: Serve transfer during early resume
 stage
To: Bjorn Andersson <andersson@kernel.org>
CC: <andi.shyti@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_bjorande@quicinc.com>, <konrad.dybcio@linaro.org>,
        <quic_vdadhani@quicinc.com>, <vkoul@kernel.org>
References: <20241227130236.755794-1-quic_msavaliy@quicinc.com>
 <aihmuvxxop7ipbsfzblbmywthxnklx34x2xlbvlrd4rio6rg77@gfqnzyjjewz3>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <aihmuvxxop7ipbsfzblbmywthxnklx34x2xlbvlrd4rio6rg77@gfqnzyjjewz3>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: i4NGDutln9c0h2nMLA1ejNDzfeW2AqP9
X-Proofpoint-ORIG-GUID: i4NGDutln9c0h2nMLA1ejNDzfeW2AqP9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0 bulkscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501030110



On 12/27/2024 11:51 PM, Bjorn Andersson wrote:
> On Fri, Dec 27, 2024 at 06:32:36PM +0530, Mukesh Kumar Savaliya wrote:
>> Fix the issue where pm_runtime_get_sync() fails during the PM early resume
> 
> No.
> 
> As we discussed, start your commit messages with a description of your
> problem. Don't say "Fix bla bla because of problem description", say
> "The QPS615 PCIe switch needs to be configured over I2C before the PCIe
> link is restored, but the I2C geni driver does not allow transfers
> during the early resume phase".
> 
Sure Bjorn. I should consider problem statement to start with.
>> phase, returning -EACCES because runtime PM for the device is disabled at
>> this stage. This failure causes I2C transfers to fail. To resolve this,
>> serve transfers with a forced resume.
>>
>> Allow certain I2C clients, such as PCI or Touch devices, to request I2C
> 
> I still don't understand what kind of touch device you have attached
> that requires I2C communication before the system is resumed. Who are
> you going to deliver the input events to at this point in time?
> 
It's like this : when touch interrupt comes, it goes to Touch driver and 
it directly starts reading via I2C. Hence, system is still resuming post 
receiving wakeup interrupt. Just wanted to explain, if you are fine with 
PCIe usecase, we can move ahead.
>> transfers during the early resume stage. Enable any I2C client to initiate
>> a transfer request very early in the resume stage, such as during the
>> noirq phase of PM. Register an interrupt with the IRQF_EARLY_RESUME and
>> IRQF_NO_SUSPEND flags to handle these transfers and avoid timeouts when
>> IRQs are not enabled during the early stage.
>>
>> A Potential usecase: PCIe client -> PCIe Driver -> I2C driver. It involves
>> a PCIe client driver communicating with the PCIe driver, which in turn
>> interfaces with the I2C driver. Upon powering on the PCIe device, send
>> certain configurations over I2C. During the suspend phase, use the
>> suspend_noirq() routine to turn off the PCIe device, as some PCIe clients
>> continue transfers until this phase. During the resume_noirq() phase,
>> restore power to the PCIe device and reconfigure it via I2C. This ensures
>> that the PCIe device is properly configured and operational after resuming
>> from a suspended state.
> 
> This paragraph looks like a problem description, it should be at the
> top.
> 
Sure, started with problem statement.
> Read and follow https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> 
Done.
>>
>> Use pm_runtime_force_resume() to address the failure of
>> pm_runtime_get_sync() returning a negative value when runtime PM is
>> disabled.
>>
>> Co-developed-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> ---
>> Link to V4: https://lore.kernel.org/lkml/bd699719-4958-445a-a685-4b5f6a8ad81f@quicinc.com/
>>
>> v4->v5:
>> - Commit log enhanced considering Bjorn's comments by explaining PCIe usecase.
>> - Enhanced comment with reason when using pm_runtime_force_resume().
>> - Corrected IS_ENABLED(CONFIG_PM) condition inside geni_i2c_xfer().
>> - Improved debug log as per Bjorn's suggestions during suspend, resume.
>> - Reverted back comment before devm_request_irq().
>>
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
>>   drivers/i2c/busses/i2c-qcom-geni.c | 47 +++++++++++++++++++++++-------
>>   1 file changed, 37 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
>> index 7a22e1f46e60..1885e1ceb11c 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -695,17 +695,31 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
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
>> +	/* During early resume stage, runtime PM is disabled and pm_runtime_get_sync()
>> +	 * returns error Hence use force_resume() and serve transfer.
>> +	 */
>> +	if (!pm_runtime_enabled(dev) && gi2c->suspended) {
>> +		#if (!IS_ENABLED(CONFIG_PM))
> 
> Per Documentation/process/coding-style.rst section 21, this should be:
> 	if (!IS_ENABLED(CONFIG_PM))
Sure, Changed it.
> 
>> +		dev_dbg(dev, "Forced power ON, pm_usage_count: %d\n",
>> +			atomic_read(&dev->power.usage_count));
> 
> What does this debug print tell you? Shouldn't usage_count be zero in
> all cases where suspended = true?
> 
The debug log tells the usage_count when powered on during forced 
resume. since it's debug print, purpose is to catch anything wrong 
during issue time. It helps if usage_count is imbalanced because of any 
wrong.
>> +		#endif
>> +		ret = pm_runtime_force_resume(dev);
> 
> If I understand the implementation of this function, in the case that
> you did not invoke pm_runtime_force_suspend() this will solely invoke
> pm_runtime_enable(), not actually invoking any callbacks and hence
> wouldn't turn any resources on.
> 
> Which makes sense given that this isn't the documented intended usage of
> the function pair.
> 
yes
> 
> In fact, the kernel-doc even says "Prior invoking this function we
> expect the user to have brought the device into low power state by a
> call to pm_runtime_force_suspend()".
> 
Do you think we should use flag is_force_suspended from inside the 
function and accordingly act ? OR you mean to say this condition applied 
itself is wrong if force_suspend()/force_resume() not in pair ?
>> +		if (ret)
>> +			return ret;
>> +	} else {
>> +		ret = pm_runtime_get_sync(gi2c->se.dev);
>> +		if (ret < 0) {
>> +			dev_err(gi2c->se.dev, "Error turning resources: %d\n", ret);
>> +			pm_runtime_put_noidle(gi2c->se.dev);
>> +			/* Set device in suspended since resume failed */
>> +			pm_runtime_set_suspended(gi2c->se.dev);
>> +			return ret;
>> +		}
>>   	}
>>   
>>   	qcom_geni_i2c_conf(gi2c);
>> @@ -715,8 +729,20 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
>>   	else
>>   		ret = geni_i2c_fifo_xfer(gi2c, msgs, num);
>>   
>> -	pm_runtime_mark_last_busy(gi2c->se.dev);
>> -	pm_runtime_put_autosuspend(gi2c->se.dev);
>> +	/* if Runtime PM is disabled, do force_suspend() else autosuspend the driver */
>> +	if (!pm_runtime_enabled(dev) && !gi2c->suspended) {
> 
> I find the asymmetry here suspicious, but I presume what you're checking is:
> 1) !pm_runtime_enabled() => we're probably in late-suspend or early-resume
yes
> 2) !suspended => we invoked pm_runtime_force_resume() above, which
> invoked geni_i2c_runtime_resume(), which cleared suspended.
> 
yes
> Such spaghetti should be avoided, but if necessary need to be clearly
> documented, and #2 is completely ignored in the comment.
Sure, i thought by looking at code it would be clear to understand by 
looking at the conditions. The conditions are really required to serve 
early resume time transfer. So i think i should be adding comment 
clarifying it.
> 
> "else autosuspend the driver", that part you can obviously skip as it's
> that's exactly what the code below says.
sure.
> 
>> +		ret = pm_runtime_force_suspend(dev);
> 
> The expectation expressed in the kernel-doc of these functions is that
> pm_runtime_force_suspend() should be followed by a
> pm_runtime_force_resume().
> 
yes, i saw that but we don't get always things into pair that way. For 
that i see most of the drivers do use SET_NOIRQ_SYSTEM_SLEEP_PM_OPS().

> As you don't follow that, most of pm_runtime_force_resume() will be
> skipped, but here the full pm_runtime_force_suspend() will happen.
> 
I think there is also autosuspend timer being used inside 
force_resume(), so will not be back to back force_resume. You may 
correct me.
> In the event that this is the last i2c_xfer before the system is
> entering the resume-phase, you will leave the device in force-suspend
> and then resume it "normally" on the next i2c_xfer.
> 
> If you instead make another i2c_xfer within the early resume, the above
> pm_runtime_force_resume() will suddenly behave completely differently -
> it will actually invoke geni_i2c_runtime_resume().
> 
The way we intend to use is - direct i2c_xfer() function making the 
force_resume(), do transfer(), then keeping back to force_suspend().
Rest of the things should work by doing get_sync() and put_sync() as 
earlier.
> 
> Perhaps I'm misunderstanding something here?
> 
You may be right. I have reviewed other drivers also, most of the 
drivers are implementing SET_NOIRQ_SYSTEM_SLEEP_PM_OPS() and which in 
turn calls force_suspend() and force_resume().

Please let me know if that can be followed in this case too.
> Regards,
> Bjorn
> 
>> +		#if (!IS_ENABLED(CONFIG_PM))
>> +		dev_dbg(dev, "Forced power OFF, pm_usage_count: %d\n",
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
>> @@ -835,7 +861,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
>>   	platform_set_drvdata(pdev, gi2c);
>>   
>>   	/* Keep interrupts disabled initially to allow for low-power modes */
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


