Return-Path: <linux-i2c+bounces-8178-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2149D7B27
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 06:26:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B305B21B44
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 05:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E7F015666D;
	Mon, 25 Nov 2024 05:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ghEuYAx2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF094D9FB;
	Mon, 25 Nov 2024 05:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732512402; cv=none; b=SKHtbtX7LUzjyDxbBA0dbdTzyWKjEGH/vV6GJugP+7tY9XGFWfOcgHFcsJSUIHhrPIjE2yplzb/hhC3VxxkWqJ0cHmI+6E6PDXYKi+9hMJYx5WjcMCyEtBStgLRXLkfC6VG/clZ3QMRl5fW6fOyTQpFdnEuzHvbN6hVk1+emIuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732512402; c=relaxed/simple;
	bh=jlmVrUQm4JzI02JcNEr+Qb2LtCPkCl7Mq8KI9AlIjKc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=C5fDGeaSsG4vyoS7UEhYMTbSH9mgZrRHwceXsx3dVrfD3n+9zIUH8KBkkXQDKHLuqmMma6J7Pz0H+LrtlQdKAkgigNYhY071uB4sLDBpWFoR5dVcASPsCSWYX2Gcq2AU+TfkhhCiT7SmZyMo8+kC0SIdm5NEJdzuUcUr9vYaAJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ghEuYAx2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AOLueWd032678;
	Mon, 25 Nov 2024 05:26:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D+ZYEE/zzBwnUzJvbR5Du6cdh0vKFOvucrO6qTaMoQg=; b=ghEuYAx27+p/Ea7D
	XRANJn7zSZF7KMV1wM74QSkYZp4tQpxOYcnUypUWXAYs2XDfKZj9F2kkd8iRmj1N
	KD+QYZXl5+MWuv9E05dv/VZqxLTRgEr2yq+DxyKODR9hv0lTST43ZN8ZXN6p0Flx
	K66nOgOIQky0ykZcdAHBLtxrmeQ4K96k3a2NGPIFeHBoPzSPs3j2NXOKNPdUMKD0
	o2oVk8lj+M7ddgpTSJSO01ilFyYeZ5bec97djdn3McNpNRr1hYrFArmv3LzepGm5
	hKn+M9Bm0E2GM2qkauI0c/GV6q0ntcpHrA5xFgjU7rxAEUdz+cg0ES7mR/sCS8W1
	bWyb9w==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 433626bhbd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 05:26:32 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AP5QVnF000648
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 05:26:32 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 24 Nov
 2024 21:26:26 -0800
Message-ID: <8e0ffc82-e205-4ea9-8b84-7437564e28cd@quicinc.com>
Date: Mon, 25 Nov 2024 10:56:23 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] i2c: i2c-qcom-geni: Enable i2c controller sharing
 between two subsystems
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <konrad.dybcio@linaro.org>,
        <andersson@kernel.org>, <andi.shyti@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <conor+dt@kernel.org>, <agross@kernel.org>,
        <devicetree@vger.kernel.org>, <vkoul@kernel.org>, <linux@treblig.org>,
        <dan.carpenter@linaro.org>, <Frank.Li@nxp.com>,
        <konradybcio@kernel.org>, <bryan.odonoghue@linaro.org>,
        <krzk+dt@kernel.org>, <robh@kernel.org>
CC: <quic_vdadhani@quicinc.com>
References: <20241113161413.3821858-1-quic_msavaliy@quicinc.com>
 <20241113161413.3821858-5-quic_msavaliy@quicinc.com>
 <37762281-4903-4b2d-8f44-3cc4d988558d@oss.qualcomm.com>
 <cbbb78c9-54ec-453a-92ec-6b174bd3d9cb@quicinc.com>
 <8508988c-a74b-4f65-8060-30a0cb5afa64@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <8508988c-a74b-4f65-8060-30a0cb5afa64@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PpiuLxYIcGv_VCr_T94ghVE-J62wyQTm
X-Proofpoint-ORIG-GUID: PpiuLxYIcGv_VCr_T94ghVE-J62wyQTm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 adultscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411250044

Thanks Konrad !

On 11/22/2024 7:12 PM, Konrad Dybcio wrote:
> On 18.11.2024 6:45 AM, Mukesh Kumar Savaliya wrote:
>> Thanks for the review konrad !
>>
>> On 11/16/2024 12:58 AM, Konrad Dybcio wrote:
>>> On 13.11.2024 5:14 PM, Mukesh Kumar Savaliya wrote:
>>>> Add support to share I2C controller in multiprocessor system in a mutually
>>>> exclusive way. Use "qcom,shared-se" flag in a particular i2c instance node
>>>> if the usecase requires i2c controller to be shared.
>>>
>>> Can we read back some value from the registers to know whether such sharing
>>> takes place?
>> Actually, HW register doesn't provide such mechanism, it's add on feature if SE is programmed for GSI mode.
> 
> So it's more of an unwritten contract between subsystems.. okay
> 
yes, purely SW flag based decision.
>>>
>>>> Sharing of I2C SE(Serial engine) is possible only for GSI mode as client
>>>> from each processor can queue transfers over its own GPII Channel. For
>>>> non GSI mode, we should force disable this feature even if set by user
>>>> from DT by mistake.
>>>
>>> The DT is to be taken authoritatively
>>>
>> To clarify - Does it mean i should not have SW disable this feature OR override  ? And let it continue in non GSI mode even it's not going to work ?
> 
> If a configuration is invalid, you should return -EINVAL from probe,
> with an appropriate error message.
> 
Sure, i agree. I will make a change here and will bail out with an error 
and print logs  if (gi2c->se.shared_geni_se == true). Thanks for this 
suggestion.

>>>>
>>>> I2C driver just need to mark first_msg and last_msg flag to help indicate
>>>> GPI driver to take lock and unlock TRE there by protecting from concurrent
>>>> access from other EE or Subsystem.
>>>>
>>>> gpi_create_i2c_tre() function at gpi.c will take care of adding Lock and
>>>> Unlock TRE for the respective transfer operations.
>>>>
>>>> Since the GPIOs are also shared between two SS, do not unconfigure them
>>>> during runtime suspend. This will allow other SS to continue to transfer
>>>> the data without any disturbance over the IO lines.
>>>>
>>>> For example, Assume an I2C EEPROM device connected with an I2C controller.
>>>> Each client from ADSP and APPS processor can perform i2c transactions
>>>> without any disturbance from each other.
>>>>
>>>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>>> ---
>>>
>>> [...]
>>>
>>>>        } else {
>>>>            gi2c->gpi_mode = false;
>>>> +
>>>> +        /* Force disable shared SE case for non GSI mode */
>>>> +        gi2c->se.shared_geni_se = false;
>>>
>>> Doing this silently sounds rather odd..
>> we can have Some SW logging added ?
> 
> Normally such overrides mandate a warning/notice, but as I said above,
> we should disallow such combinations altogether for sanity
> 
Sure, taken cared with above suggestion.
> Konrad

