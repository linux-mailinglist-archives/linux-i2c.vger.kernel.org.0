Return-Path: <linux-i2c+bounces-7341-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DBB99A37D
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Oct 2024 14:12:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AD99281772
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Oct 2024 12:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C46EC216A0B;
	Fri, 11 Oct 2024 12:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Z4WgK9ib"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F167621500F;
	Fri, 11 Oct 2024 12:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728648757; cv=none; b=F53Ygp3+4spC0JHjQvBGytQXQ1EcxoI+XbIYMnTaqqYpAyPqJH9QZu9NQ3M6WxPaM9rB5tWdUegoWDEgt1jQuqx5dp8Y9c1jePtSce3a12StUncKIF2EMrmuVqjeoHnspEQND+24WTYv663h6kz7rMw1CjbAfOdbhDuaEXLj4n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728648757; c=relaxed/simple;
	bh=kxqWUy4zcFSTFiCdhxJFdTiPepG49W4Yq1HHpWxsB1U=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=Tz+F+JM6zNPEJHpp+giMoHkz/RWMDiDtqRMP916zzJWOi7kfg/Tne3FHjPeax9kERMTgtPOwGesx8zuWWHkiYIckuT7SRIX+UznBj51ElRxPhr/t873TBQ+UFBdcGqYXXDLIRlcrREXS1O+EkWuworOc1xPR4SxGp2SgabUEoSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Z4WgK9ib; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49B86Er5014880;
	Fri, 11 Oct 2024 12:12:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uLCS0UOy96Mb3H/jJ54bFvXWnhLgH0Ek8zfoPd+tDAE=; b=Z4WgK9ib+kYl9zT4
	4yiBvbUBG6IK6pP3BpdwB1PZIREpjjoYdxrJkqSsmboH9vQl+S7yu9LNME2ZbVvB
	udEEHs+p9b984j6no/w01Nqkn/GNuXnKjEPj1bL3LDfhR0cDPBnRuevwpo1riRrX
	3RhCp8mAdlG4pZN4GLLIROcscc3yx+F1l0eXKKJnXYQuZ7HhIhRumTQ3imIAxuRO
	7wYbpgnq0dM2sS8PhULLiS4FrGmpgdteOwEUHkdSHcYHasKq6lblqgIbmdcv3MBQ
	oBYDeUuEn4y2FUscsjuo7bzYY+m/wC5vRWZubD7Qh9p3/ZFwvmQpzjJ1bZbqj/Vw
	YIAlBw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427077grxq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 12:12:31 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49BCCVAV010158
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 12:12:31 GMT
Received: from [10.216.16.232] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 11 Oct
 2024 05:12:28 -0700
Message-ID: <c1f2b758-85b6-40af-a2a3-e214e625fd9e@quicinc.com>
Date: Fri, 11 Oct 2024 17:42:23 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: Re: [PATCH v1] i2c: i2c-qcom-geni: Serve transfer during early resume
 stage
To: Bjorn Andersson <quic_bjorande@quicinc.com>
CC: <konrad.dybcio@linaro.org>, <andersson@kernel.org>,
        <andi.shyti@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <quic_vdadhani@quicinc.com>, Vinod Koul <vkoul@kernel.org>
References: <20240328123743.1713696-1-quic_msavaliy@quicinc.com>
 <Zg9rkXddNC+G36O8@hu-bjorande-lv.qualcomm.com>
Content-Language: en-US
In-Reply-To: <Zg9rkXddNC+G36O8@hu-bjorande-lv.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PgM30PgTV4MwykU7m8qnM4SToeFHTtmk
X-Proofpoint-ORIG-GUID: PgM30PgTV4MwykU7m8qnM4SToeFHTtmk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 priorityscore=1501 mlxscore=0 impostorscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410110084

Thanks Bjorn for the review.

On 4/5/2024 8:40 AM, Bjorn Andersson wrote:
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
>> ---
>>   drivers/i2c/busses/i2c-qcom-geni.c | 55 ++++++++++++++++++++++++------
>>   1 file changed, 45 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
>> index da94df466e83..ed8201983a03 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -134,6 +134,8 @@ struct geni_i2c_clk_fld {
>>   	u8	t_cycle_cnt;
>>   };
>>   
>> +static int geni_i2c_runtime_resume(struct device *dev);
>> +
>>   /*
>>    * Hardware uses the underlying formula to calculate time periods of
>>    * SCL clock cycle. Firmware uses some additional cycles excluded from the
>> @@ -677,22 +679,48 @@ static int geni_i2c_fifo_xfer(struct geni_i2c_dev *gi2c,
>>   	return num;
>>   }
>>   
>> +static int geni_i2c_force_resume(struct geni_i2c_dev *gi2c)
>> +{
>> +	struct device *dev = gi2c->se.dev;
>> +	int ret;
>> +
>> +	ret = geni_i2c_runtime_resume(dev);
>> +	if (ret) {
>> +		dev_err(gi2c->se.dev, "Error turning SE resources:%d\n", ret);
> 
> "error turning"? How about "Failed to enable SE resources: %d\n"?
Sounds good, Thanks. Made this change.
> 
>> +		pm_runtime_put_noidle(dev);
>> +		pm_runtime_set_suspended(dev);
> 
> These two where the error-handling for pm_runtime_get_sync() failing, in
> one case below you get here after pm_runtime_get_sync() failed in the
> other you have not attempted to call that function.
> 
Hi Bjorn, could you please clarify further on this question ? I am not 
getting two instances for failure of pm_runtime_get_sync().
> Do you really get through this with things balanced?
We haven't seen imbalance in the usage count with added debug logs locally.
> 
>> +		return ret;
>> +	}
>> +	pm_runtime_get_noresume(dev);
>> +	pm_runtime_set_active(dev);
>> +	return ret;
> 
> ret is 0.
> 
>> +}
>> +
>>   static int geni_i2c_xfer(struct i2c_adapter *adap,
>>   			 struct i2c_msg msgs[],
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
>> +
>> +	if (!pm_runtime_enabled(dev) && gi2c->suspended) {
>> +		dev_dbg(gi2c->se.dev, "RT_PM disabled, Do force resume, usage_count:%d\n",
> 
> "RT_PM" is not a widely used abbreviation for this...
Agree. Modified as "Runtime PM is disabled"
> 
>> +			atomic_read(&dev->power.usage_count));
>> +		ret = geni_i2c_force_resume(gi2c);
>> +		if (ret)
>> +			return ret;
>> +	} else {
>> +		ret = pm_runtime_get_sync(dev);
>> +		if (ret == -EACCES && gi2c->suspended) {
>> +			dev_dbg(gi2c->se.dev, "PM get_sync() failed-%d, force resume\n", ret);
> 
> Different abbreviation, different formatting of error value in log
> line...
yes, improved as ""pm_runtime_get_sync() failed"
> 
>> +			ret = geni_i2c_force_resume(gi2c);
>> +			if (ret)
>> +				return ret;
> 
> This chunk looks identical to the chunk above, can this somehow be
> restructured to avoid the duplication?
I see different failure condition and then conditional call to 
geni_i2c_force_resume(). Could you please highlight exact optimization ?
> 
>> +		}
>>   	}
>>   
>>   	qcom_geni_i2c_conf(gi2c);
>> @@ -702,8 +730,15 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
>>   	else
>>   		ret = geni_i2c_fifo_xfer(gi2c, msgs, num);
>>   
>> -	pm_runtime_mark_last_busy(gi2c->se.dev);
>> -	pm_runtime_put_autosuspend(gi2c->se.dev);
> 
> I'm not sure I follow this part, please add a comment here for the
> future reader.
sure, Added comment in next patch.

> 
>> +	if (!pm_runtime_enabled(dev) && !gi2c->suspended) {
>> +		pm_runtime_put_noidle(dev);
>> +		pm_runtime_set_suspended(dev);
>> +		gi2c->suspended = 0;
> 
> Why alter suspended flag in xfer()?
> 
Because force_resume() makes it active with respect to the
> Regards,
> Bjorn
> 
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
>>   			       dev_name(dev), gi2c);
>>   	if (ret) {
>>   		dev_err(dev, "Request_irq failed:%d: err:%d\n",
>> -- 
>> 2.25.1
>>

