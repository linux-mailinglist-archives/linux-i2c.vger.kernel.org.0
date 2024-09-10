Return-Path: <linux-i2c+bounces-6465-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E40972D12
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 11:12:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA8561C243FF
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 09:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEBB4187FF9;
	Tue, 10 Sep 2024 09:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IsPjTcdD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A308187560;
	Tue, 10 Sep 2024 09:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725959528; cv=none; b=sRQEcYp++a2ABtWWiZ4f9+kLDfl2gJiVu0eHjlQRutJmIiqcykBBFYR3HaLxAuOSjtsi+0TPZeFhmOcsji3WYjTt8ox3S3AWxTaH3IIjfCjlhbpDGtBOSpDYhfv41UsIbCmBGylhixnb8aupSigmW0I0myHqh4VFK5O2EA+eXk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725959528; c=relaxed/simple;
	bh=9NwspGEPaIwk/tX3NOPleDdcqKCXPdu2siKLOS2T2BU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WsH1a/2MtFmfBq1KH6fzhRSf6Mr7Dl7ihU9j/NTZl9bthEQpbWuHKhTzbI5ZL3S1hsqPmLRieapDrcOwj/9vLn9MKSM1iv0xEqoyD8Y6OU12s4FXDnbVK4BcCmt3QOfmcx46Sc+VVE7yE31fj+2f7CXPnsR6EBB7LaqXAr/TGkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IsPjTcdD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48A4i4kL021316;
	Tue, 10 Sep 2024 09:11:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	figzAY/VqQX9UkrH9HhOe3UiQKuqA1LH6GURnPOcyQI=; b=IsPjTcdDh0kaM3NH
	h0LoidNNUsWcoAy4h4zuWiVqKGEqZIFgQmpYi9ypTl/1Ky4UAAL8LQhrRNTsIaWG
	lb9o0rqjgALfSXhEjmm69uIck3xbDvnXTVjD1DW5Fd3dfLNqIjehygeurWQ0hWcX
	RzJY9+hbmIhO7hgXHK4HcjingM3I8aVGoBh9QSrex6BotuhPYEE/FgkfKrVsQrtt
	30huEJlBMxVeaoy9eaeAc1jIdNLs0ifFECvstBppc64nKBzlQOyC9Xn29/4WcoQk
	3BMAoqKAAmYi+NDiyq/xWJxaNm+x9y0Kn2DEX1uO9JwlvZsjCwawnMDr8BuPS5wv
	C0KzSQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gybpnc2f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Sep 2024 09:11:59 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48A9Bw8k009793
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Sep 2024 09:11:58 GMT
Received: from [10.218.13.83] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 10 Sep
 2024 02:11:52 -0700
Message-ID: <a88a16ff-3537-4396-b2ea-4ba02b4850e9@quicinc.com>
Date: Tue, 10 Sep 2024 14:41:50 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] soc: qcom: geni-se: Export function
 geni_se_clks_off()
To: Konrad Dybcio <konradybcio@kernel.org>, <konrad.dybcio@linaro.org>,
        <andersson@kernel.org>, <andi.shyti@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <conor+dt@kernel.org>, <agross@kernel.org>,
        <devicetree@vger.kernel.org>, <vkoul@kernel.org>, <linux@treblig.org>,
        <dan.carpenter@linaro.org>, <Frank.Li@nxp.com>
CC: <quic_vdadhani@quicinc.com>
References: <20240906191438.4104329-1-quic_msavaliy@quicinc.com>
 <20240906191438.4104329-4-quic_msavaliy@quicinc.com>
 <bbdd95e3-9090-4952-beb5-ad52f2a3dcae@kernel.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <bbdd95e3-9090-4952-beb5-ad52f2a3dcae@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: EOEJKx09u3GhllRVCFK0GrVj5wkcSzkz
X-Proofpoint-GUID: EOEJKx09u3GhllRVCFK0GrVj5wkcSzkz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409100069

Hi Konrad, Thanks !

On 9/9/2024 5:05 PM, Konrad Dybcio wrote:
> On 6.09.2024 9:14 PM, Mukesh Kumar Savaliya wrote:
>> Currently the driver provides a function called geni_serial_resources_off()
>> to turn off resources like clocks and  pinctrl. We don't have a function to
>> control clocks separately hence, export the function geni_se_clks_off() to
>> turn off clocks separately without disturbing GPIO.
>>
>> Client drivers like I2C require this function for use-cases where the I2C
>> SE is shared between two subsystems.
>>
>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> ---
> 
> Well, i2c is probably not the only type of client you'll want
> to share and the current approach requires changes in all protocol
> drivers.
> 
That's true, it may require for other drivers too in future.
But logically seems more aligning to be handle at client driver side.
Meaning if it's required by SPI  client like touch, they can add this 
flag into touch client DT node.
> How about adding a parameter like `bool shared_se` to
> geni_se_resources_off() and changing the pinctrl state conditionally?
> 
Sure, Looks good design. This needs a change in common struct geni_se 
which can add this flag and set to true from i2c driver struct 
geni_i2c_dev->se->shared_se.
Then geni_se_resources_off() can bypass pinctrl state based on this flag.
if this is aligning, please confirm so can make the change in V3.
> Konrad

