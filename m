Return-Path: <linux-i2c+bounces-7058-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3809884F5
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 14:32:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91E7D1F23134
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 12:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 496BA18C337;
	Fri, 27 Sep 2024 12:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SO0H9kP9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745413C3C;
	Fri, 27 Sep 2024 12:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727440349; cv=none; b=DfIRoGQ3TCsRYyftdkAgIShlFsS/Hs6LFQgKX1ZGzWbRjg9mi0X/IdFqqxigCfsOQRo15pnq4Clnd1J9eTDkgKaWhVFWIV3LDVECGGCHddaLE1dfL6GpwpDBsFERPyxaa3KuYNML7dyr4WrK9IOn8RN8geVJ4RUE0HWtJyLdEs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727440349; c=relaxed/simple;
	bh=Vr2od9I8KmP8ZZgSdu4bDmiFAz0gV+JBRg1M/m3NWTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GCi8qZntv6XA1PSS2iRHxP59WDih2vPa6qKOfMC3BBezHKc3MVMBCSIZIqRI9TJMuCd33s2Vzz2NAFcU/WPag1PFGOIHj7Olaj4tTw/Y/a3kK4MRC3KUxJYhrW14MKd090+oVuR+FXGBFSV4FeO3cM2bpRMMXrii0thtAF4ZC0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SO0H9kP9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48R6mkJo002675;
	Fri, 27 Sep 2024 12:32:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fd3m0LHZbGPCb3F2fnwV/5uC9cpanAPfAVRzgVQVOk4=; b=SO0H9kP9udoIH6SK
	s+WRIpuHhNA8Ptqv2UiADQghHw0i6frRoSOuWkvtrD6Mz2zKqsveqE+qSH5hvfLD
	YHOn/EixmQSzktSq3OryMKO/v+VCpyzELcM0DLAOa0j8s+Xv+POxCJ3I3Igo8QdD
	SIbpnx0D0Z0FMbuI7VHKUgZb/wrgzf/88xohF66XdNrgpTrpiqxnJnMwuGIa8o2/
	OY2lMtAcLCCUbfV8P9NvY+ohosznTYobsj9v0V1UTakPg1giWgsEK3UO5Hhs37GA
	VPI48rJO4pN5bcE7kyAxEH7co3le6bbJ5+AO7BZNIJvuKlvfNPhVgf9Nx1TSORvk
	vVC3gw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sph738gb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Sep 2024 12:32:22 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48RCWLRQ029028
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Sep 2024 12:32:21 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 27 Sep
 2024 05:32:18 -0700
Message-ID: <46f745e1-cb95-443c-803d-7bc838160d5a@quicinc.com>
Date: Fri, 27 Sep 2024 18:02:15 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: i2c-qcom-geni: Serve transfer during early resume
 stage
To: Bjorn Andersson <quic_bjorande@quicinc.com>
CC: <konrad.dybcio@linaro.org>, <andersson@kernel.org>,
        <andi.shyti@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <quic_vdadhani@quicinc.com>, <vkoul@kernel.org>
References: <20240402102741.128424-1-quic_msavaliy@quicinc.com>
 <ZuOpTjumRYAZTSXj@hu-bjorande-lv.qualcomm.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <ZuOpTjumRYAZTSXj@hu-bjorande-lv.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: q5zCTO7-KRn9e-Kkxpk7d6zX_7quFU3L
X-Proofpoint-ORIG-GUID: q5zCTO7-KRn9e-Kkxpk7d6zX_7quFU3L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxlogscore=999
 mlxscore=0 adultscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409270090

Hi Bjorn,

On 9/13/2024 8:24 AM, Bjorn Andersson wrote:
> On Tue, Apr 02, 2024 at 03:57:41PM +0530, Mukesh Kumar Savaliya wrote:
>> pm_runtime_get_sync() function fails during PM early resume and returning
>> -EACCES because runtime PM for the device is disabled at the early stage
>> causing i2c transfer to fail. Make changes to serve transfer with force
>> resume.
>>
> 
> I'm guessing that this is caused by some other driver that wants to
> perform an I2C access during early resume? If so, can you describe what
> that use case is?
> 
Yes, PCIe is a client driver and uses i2c for transfer during very early 
stage. We could not serve transfer request since runtime PM was not 
active during early resume. We plan to support the similar request from 
any client, hence the change.


I am planning to push V2 very soon. i was late here.
> Regards,
> Bjorn
> 
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
>> v1 -> v2:
>> - Changed gi2c->se.dev to dev during dev_dbg() calls.
>> - Addressed review comments from Andi.
>> ---
>>   drivers/i2c/busses/i2c-qcom-geni.c | 55 ++++++++++++++++++++++++------
>>   1 file changed, 45 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
>> index da94df466e83..30c335b02ac4 100644
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
>> +		pm_runtime_put_noidle(dev);
>> +		pm_runtime_set_suspended(dev);
>> +		return ret;
>> +	}
>> +	pm_runtime_get_noresume(dev);
>> +	pm_runtime_set_active(dev);
>> +	return ret;
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
>> +		dev_dbg(dev, "RT_PM disabled, Do force resume, pm_usage_count: %d\n",
>> +			atomic_read(&dev->power.usage_count));
>> +		ret = geni_i2c_force_resume(gi2c);
>> +		if (ret)
>> +			return ret;
>> +	} else {
>> +		ret = pm_runtime_get_sync(dev);
>> +		if (ret == -EACCES && gi2c->suspended) {
>> +			dev_dbg(dev, "PM get_sync() failed-%d, force resume\n", ret);
>> +			ret = geni_i2c_force_resume(gi2c);
>> +			if (ret)
>> +				return ret;
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
>> +	if (!pm_runtime_enabled(dev) && !gi2c->suspended) {
>> +		pm_runtime_put_noidle(dev);
>> +		pm_runtime_set_suspended(dev);
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
>>   			       dev_name(dev), gi2c);
>>   	if (ret) {
>>   		dev_err(dev, "Request_irq failed:%d: err:%d\n",
>> -- 
>> 2.25.1
>>

