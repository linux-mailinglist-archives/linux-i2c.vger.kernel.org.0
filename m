Return-Path: <linux-i2c+bounces-8045-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7AD9D2836
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 15:33:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15E5CB2EA51
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 14:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF8BA1CF295;
	Tue, 19 Nov 2024 14:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="COfzrCD2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0601CCB37;
	Tue, 19 Nov 2024 14:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732026596; cv=none; b=CAwGS815LRzmOG+oJwvMArtF687u3jACAPRWm9nZFRt1sA+Ph1IIHNbRQK9HufvmJOUk53H8ykVrnjOvk0CpWL7mdhE3z9bi67Glyt7RhbYosQ+wy6WcvXPgzTmd7R2VOaelwOldZu9ySlevwqIKcirVqrAU39U9KCcy1bW5MI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732026596; c=relaxed/simple;
	bh=EO3sfTmhyUx5iue2RICmgxoTkF0h093Jx5l0j2IOeAM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=jguV3D/3cZny4LG/R8W4herfhheEitFryp6rIvojN291zfHBxGR0VOHmSty9UA+LIgJ2TP5vCqXap6d6Zj9Tmcgyige/Mw11DUpuykZyQYY8urcUrHqZyPH65LDEwoz//eXeDsdx1+3HKW8J+8IRBrILpa6gyMQdS5eXFMqN3IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=COfzrCD2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJ7t7Bk022570;
	Tue, 19 Nov 2024 14:29:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ofAYoofWTIk1it3ZO0tvccKOORJ5cLPrfxut7KWrleE=; b=COfzrCD2OGvFvTq4
	t+SMrd9jthcxwhCYEpRnY9nCGjOuuFdLGW0R4KMz8NdjjhocLXM5zWW9I5rXyvhs
	LvuZGCP4Xn7KdcgQ2GzXSiQF+JwdbhxnAUjKZ99X2kzHK0LpXCDxh/QWyXNLWlMJ
	WJtLh/gz+pbHuLDFu33lPt8279/hutDHe/wqoLHBArEi0QWJxRTqQMtc55PqcqPf
	4in2FR4Fp7wCLJBgvbW+GQ+GsNymfUuNCyBZp64Vj4HBwr8kKc0LlkJTM6zv4j/R
	Brq3Fm1r7kyuRItlh8rCjyXBG+y7V3YQ17GmE6QLXyHtQOLtx55TvhrHq+5LECFf
	uw5c/w==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y62rb8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 14:29:50 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AJETolI010664
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 14:29:50 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 19 Nov
 2024 06:29:47 -0800
Message-ID: <3797c11f-b263-4f5d-9307-963fd6662b26@quicinc.com>
Date: Tue, 19 Nov 2024 19:59:44 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: Re: [PATCH v2] i2c: i2c-qcom-geni: Serve transfer during early resume
 stage
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
CC: <andi.shyti@kernel.org>, <quic_bjorande@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <konrad.dybcio@linaro.org>,
        <quic_vdadhani@quicinc.com>, <vkoul@kernel.org>
References: <20241011121757.2267336-1-quic_msavaliy@quicinc.com>
 <ZwlnWIWkS1pwQ/xK@hu-bjorande-lv.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ZwlnWIWkS1pwQ/xK@hu-bjorande-lv.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8AYKc7W3tgfOo7c2-Qc1Ny3E9FRRdF9n
X-Proofpoint-ORIG-GUID: 8AYKc7W3tgfOo7c2-Qc1Ny3E9FRRdF9n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411190106

Hi Bjorn, thanks for the review.

On 10/11/2024 11:28 PM, Bjorn Andersson wrote:
> On Fri, Oct 11, 2024 at 05:47:57PM +0530, Mukesh Kumar Savaliya wrote:
> 
> Your recipients list is broken. Please check go/upstream and adopt b4 to
> help avoid such mistakes.
> 
Sorry, My mistake in keeping output of maintainers script separately 
into --to and --cc which i shouldn't do.
>> pm_runtime_get_sync() function fails during PM early resume and returning
>> -EACCES because runtime PM for the device is disabled at the early stage
>> causing i2c transfer to fail. Make changes to serve transfer with forced
>> resume.
>>
>> Few i2c clients like PCI OR touch may request i2c transfers during early
>> resume stage. In order to serve transfer request do :
>>
> 
> This problem description is too generic. I am not aware of any use case
> upstream where PCI or touch might need to perform i2c transfers during
> early resume; your commit message should educate me.
> 
yes, it's generic as of now since we have an internal usecase with PCI 
is yet to be enabled in upstream. Not tied up with any usecase in 
upstream, i just heard recently.

Provided the scenario is generic and possible by any client, can this 
code change be reviewed or shall be kept on halt till PCI usecase gets 
enabled ?

>> 1. Register interrupt with IRQF_EARLY_RESUME and IRQF_NO_SUSPEND flags
>>     to avoid timeout of transfer when IRQ is not enabled during early stage.
>> 2. Do force resume if pm_runtime_get_sync() is failing after system
>>     suspend when runtime PM is not enabled.
>> 3. Increment power usage count after forced resume to balance
>>     it against regular runtime suspend.
>>
> 
> Please avoid the bullet list form technical description of your patch.
> 
Sure. Made the changes in commit log with free flow writeup.

>> Co-developed-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> ---
>> v1 -> v2:
>>
>> - Changed gi2c->se.dev to dev during dev_dbg() calls.
>> - Addressed review comments from Andi and Bjorn.
> 
> That's nice, but spell out the changes you're doing so that reviewers
> now what you did.
Sure, changes done are also listed but i will add reviewers name per change.
> 
>> - Returned 0 instead garbage inside geni_i2c_force_resume().
>> - Added comments explaining forced resume transfer when runtime PM
>>    remains disabled.
>>
>> V1 link: https://patches.linaro.org/project/linux-i2c/patch/20240328123743.1713696-1-quic_msavaliy@quicinc.com/
>> ---
>> ---
>>   drivers/i2c/busses/i2c-qcom-geni.c | 61 +++++++++++++++++++++++++-----
>>   1 file changed, 51 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
>> index 212336f724a6..e1207f1a3de3 100644
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
>> @@ -675,22 +677,49 @@ static int geni_i2c_fifo_xfer(struct geni_i2c_dev *gi2c,
>>   	return num;
>>   }
>>   
>> +static int geni_i2c_force_resume(struct geni_i2c_dev *gi2c)
>> +{
>> +	struct device *dev = gi2c->se.dev;
>> +	int ret;
>> +
>> +	ret = geni_i2c_runtime_resume(dev);
> 
> Wouldn't pm_runtime_force_resume() help you do what you're looking for?
> 
Yes, i have reviewed and seems this API can also serve the same purpose. 
Made the changes accordingly.

>> +	if (ret) {
>> +		dev_err(gi2c->se.dev, "Failed to enable SE resources: %d\n", ret);
>> +		pm_runtime_put_noidle(dev);
>> +		pm_runtime_set_suspended(dev);
>> +		return ret;
>> +	}
>> +	pm_runtime_get_noresume(dev);
>> +	pm_runtime_set_active(dev);
>> +	return 0;
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
>> +	/* Serve I2C transfer by forced resume whether Runtime PM is enbled or not */
>> +	if (!pm_runtime_enabled(dev) && gi2c->suspended) {
>> +		dev_dbg(dev, "Runtime PM is disabled hence force resume, pm_usage_count: %d\n",
>> +			atomic_read(&dev->power.usage_count));
>> +		ret = geni_i2c_force_resume(gi2c);
>> +		if (ret)
>> +			return ret;
>> +	} else {
>> +		ret = pm_runtime_get_sync(dev);
>> +		if (ret == -EACCES && gi2c->suspended) {
>> +			dev_dbg(dev, "pm_runtime_get_sync() failed-%d, force resume\n", ret);
>> +			ret = geni_i2c_force_resume(gi2c);
>> +			if (ret)
>> +				return ret;
>> +		}
>>   	}
>>   
>>   	qcom_geni_i2c_conf(gi2c);
>> @@ -700,8 +729,19 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
>>   	else
>>   		ret = geni_i2c_fifo_xfer(gi2c, msgs, num);
>>   
>> -	pm_runtime_mark_last_busy(gi2c->se.dev);
>> -	pm_runtime_put_autosuspend(gi2c->se.dev);
>> +	/* Does Opposite to Forced Resume when runtime PM was not enabled and served
>> +	 * Transfer via forced resume.
> 
> Please polish this comment.
Sure, Enhanced my comments. Thanks.
> 
> Regards,
> Bjorn
> 
>> +	 */
>> +	if (!pm_runtime_enabled(dev) && !gi2c->suspended) {
>> +		pm_runtime_put_noidle(dev);
>> +		pm_runtime_set_suspended(dev);
>> +		/* Reset flag same as runtime suspend, next xfer PM can be enabled */
>> +		gi2c->suspended = 0;
>> +	} else {
>> +		pm_runtime_mark_last_busy(gi2c->se.dev);
>> +		pm_runtime_put_autosuspend(gi2c->se.dev);
>> +	}
>> +
>>   	gi2c->cur = NULL;
>>   	gi2c->err = 0;
>>   	return ret;
>> @@ -818,7 +858,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
>>   	init_completion(&gi2c->done);
>>   	spin_lock_init(&gi2c->lock);
>>   	platform_set_drvdata(pdev, gi2c);
>> -	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq, IRQF_NO_AUTOEN,
>> +	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq,
>> +			       IRQF_NO_AUTOEN | IRQF_EARLY_RESUME | IRQF_NO_SUSPEND,
>>   			       dev_name(dev), gi2c);
>>   	if (ret) {
>>   		dev_err(dev, "Request_irq failed:%d: err:%d\n",
>> -- 
>> 2.25.1
>>

