Return-Path: <linux-i2c+bounces-7965-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BE69C7859
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2024 17:11:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAB8E1F2563A
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2024 16:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67411249EB;
	Wed, 13 Nov 2024 16:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SVtweeOL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E004158DC4;
	Wed, 13 Nov 2024 16:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731514255; cv=none; b=sH2WnEczhvrCHslfP3e9ujQbRe9QfVhI57cHrjbMeJAu1a+Y+XTk0ug3o/x+4l0oKLySBdfvWKEqPrLyjZyr3/NoZJVvoI5RBlxXR+mqnluHt3/7xNZFx5VXd+AGkLwor2bdIDnf5eY3PRX/zexTyccBF0FVdkbs3D8K3dOLuDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731514255; c=relaxed/simple;
	bh=07vn2WYaIiTIdjb7DdSnO6mqXwHZ9cnmNt3olG+c/yY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kn+0wufhVY/ZirJHqhjsv8SitsKl6UNlr5BGWliEAih8SIaaF3coEQcvTXso06UEe5BailTY4b2w4dDdI/mopI5Grr+TyW3Ky7gsZCprViMZu1z2On4ZdU8Kl9aZnjMDobQXP6QbBZDgU5soD6PABJatgMqxAuMI+wHwkqfTLjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SVtweeOL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ADCljxn030398;
	Wed, 13 Nov 2024 16:10:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/VqO27XBldIsWpo7ihs4mogTaikB4ZvhXdqC5i/FfOI=; b=SVtweeOL6AfLdfzW
	Gn84B8+aDeR63kLwslkrUOIQVgMvXZ61Q8LF9ZU3pXTjQ7Kp1xvlAJXNg7Tu8kMR
	QVhfXFRxSiUeAav+THG3ZtuVRtRBAL+BvpqeN17wuyuM4cV+q54f3h2/oV2SKZEH
	FOaT4wgtg74oEGhwUrcZydEs70DXMUiGSztXmg9CnxFxKPsEEuRl6oLF5sTMdyWo
	n2gB/K+A0R6x024SQGls8R9KG8/l5Ha34VDtkhAfpls01s+9gaplTsBEbZc4jQBm
	aR49+pQYcHR9Oo0vDnjUs2+LO0Ye4SPYKNMeQm+vaX6lg7dvZidAxus6Tbk5MLnw
	sFm6Gw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42vkvr9wv7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 16:10:46 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ADGAj9q005418
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 16:10:45 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 13 Nov
 2024 08:10:40 -0800
Message-ID: <71b5a108-a38b-4260-b683-d1a70178afc8@quicinc.com>
Date: Wed, 13 Nov 2024 21:40:37 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] i2c: i2c-qcom-geni: Enable i2c controller sharing
 between two subsystems
To: Bjorn Andersson <andersson@kernel.org>,
        Dan Carpenter
	<dan.carpenter@linaro.org>
CC: <konrad.dybcio@linaro.org>, <andi.shyti@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <conor+dt@kernel.org>, <agross@kernel.org>,
        <devicetree@vger.kernel.org>, <vkoul@kernel.org>, <linux@treblig.org>,
        <Frank.Li@nxp.com>, <konradybcio@kernel.org>,
        <bryan.odonoghue@linaro.org>, <krzk+dt@kernel.org>, <robh@kernel.org>
References: <20240927063108.2773304-1-quic_msavaliy@quicinc.com>
 <20240927063108.2773304-5-quic_msavaliy@quicinc.com>
 <lmo4jylfwt3wingdqb6zc6ew2537kqksuckfyd7vwuu4ufg5cr@ic2j7bv2r6e4>
 <42e0622d-0bb6-4850-bf5a-629996c702db@stanley.mountain>
 <7eg2g2ykqccc74l6chkwlq54wcobzevqlzngkr3lnegv36pcsb@t3asip2mbmew>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <7eg2g2ykqccc74l6chkwlq54wcobzevqlzngkr3lnegv36pcsb@t3asip2mbmew>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: sY6gqdoXglrVMzvtIK5Y-M1K3Mocbw0n
X-Proofpoint-GUID: sY6gqdoXglrVMzvtIK5Y-M1K3Mocbw0n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 priorityscore=1501
 bulkscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411130134

Hi Bjorn,

On 10/1/2024 8:09 AM, Bjorn Andersson wrote:
> On Mon, Sep 30, 2024 at 11:21:23AM GMT, Dan Carpenter wrote:
>> On Sun, Sep 29, 2024 at 10:46:37PM -0500, Bjorn Andersson wrote:
>>>> @@ -602,6 +603,7 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>>>>   	peripheral.clk_div = itr->clk_div;
>>>>   	peripheral.set_config = 1;
>>>>   	peripheral.multi_msg = false;
>>>> +	peripheral.shared_se = gi2c->se.shared_geni_se;
>>>>   
>>>>   	for (i = 0; i < num; i++) {
>>>>   		gi2c->cur = &msgs[i];
>>>> @@ -612,6 +614,8 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>>>>   		if (i < num - 1)
>>>>   			peripheral.stretch = 1;
>>>>   
>>>> +		peripheral.first_msg = (i == 0);
>>>> +		peripheral.last_msg = (i == num - 1);
>>>
>>> There are multiple error paths in this loop, which would result in us
>>> never issuing the unlock TRE - effectively blocking other subsystems
>>> from accessing the serial engine until we perform our next access
>>> (assuming that APSS issuing a lock TRE when APSS already has the channel
>>> locked isn't a problem?)
>>>
>>
>> Hi Bjorn,
>>
>> I saw the words "error paths" and "unlock" and I thought there was maybe
>> something we could do here with static analysis.
> 
> Appreciate you picking up on those topics :)
> 
>> But I don't know what TRE or APSS mean.
>>
> 
> The "APSS" is "the application processor sub system", which is where
> we typically find Linux running. TRE is, if I understand correctly, a
> request on the DMA engine queue.
Yes, Thats right. Transfer ring element, it's like a command to the 
engine. Can be configuration TRE, DMA xfer request TRE etc.
> 
>> The one thing I do see is that this uses "one err" style error handling where
>> there is one err label and it calls dmaengine_terminate_sync(gi2c->rx_c)
>> regardless of whether or not geni_i2c_gpi() was called or failed/succeeded.
>>
> 
> The scheme presented in this series injects a "LOCK" request before the
> DMA request marked first_msg, and an "UNLOCK" after the ones marked
> last_msg. This is needed because the controller is also concurrently by
> some DSP (or similar), so the LOCK/UNLOCK scheme forms mutual exclusion
> of the operations between the Linux and DSP systems.
> 
> I'm not sure if it's possible to tie the unlock operation to
> dmaengine_terminate_sync() in some way.
> 
I think terminate_sync() should clean up all xfers and will continue for 
the next request as a fresh start.
> Giving this some more thought, it feels like the current scheme serves
> the purpose of providing mutual exclusion both for the controller and
> to some degree for the device. But I'd like to understand why we can't
> inject the lock/unlock implicitly for each transfer...
> 
Explicitly adding lock/unlock per transfer adds execution load. Lock is 
meant for taking an ownership of the bus which is better to manage per 
session.
> Regards,
> Bjorn
> 
>> regards,
>> dan carpenter
>>

