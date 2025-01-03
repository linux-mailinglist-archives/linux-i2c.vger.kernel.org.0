Return-Path: <linux-i2c+bounces-8887-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AF366A008A1
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 12:30:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6A8CF7A1F44
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 11:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 025B41FA144;
	Fri,  3 Jan 2025 11:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a+dSub32"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5370F1F9F51
	for <linux-i2c@vger.kernel.org>; Fri,  3 Jan 2025 11:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735903824; cv=none; b=Sww5Y9R2kPLNd3QHgBzC9VQhqlikDQJib+ki70kCoyR3l1UV5sfJ9hYgB3LSWdLxz+gJB6tiqkW/w0WGa71ASg97i4uhAVqo34VBHLTmXxmUAt0+VnR/+6ViCns/rO8y4mdhe/gkWSc/9C7J2XekWvVtPdJVsLinjsk1iKUSk0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735903824; c=relaxed/simple;
	bh=xIe09ebymTzrmNS3ehuwtU+HDBREWaPhxBx+WASpvJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gPHgGGwOvhiMWJRk5HsQ50Y+cVN+7o8I5XkYT1f0YSIF5R60c9vYK/MoGReN1TXercmEoFOn+ryOG2E+vNwz+3vxJAKksAILgoGcLYkj+sJRf8IpEJAI3fpoh+nMj7TNCofOLvbGoXO4/FipMrLbDLc9gwuAzrf/KyLpMSurkBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a+dSub32; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50375u7V031530
	for <linux-i2c@vger.kernel.org>; Fri, 3 Jan 2025 11:30:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o2MRsFx3bMUSG9QzwttMjqbwl6vaosB+gmA/2Y/BBj8=; b=a+dSub32uRRJEQ48
	Qz5RsRK4oDN0DlX99oW7yw6XZ4xlb4mxu1Znf/G7AoMajJ86Zw4VLiklK6DgWvwa
	IbcuRwMK+7cXwkrIn1Rozz6kSvt1SnHrxSBaZh6j+qL6uZofSPQt0b5KLpwbR/C3
	788tpHNVDg0ynkLvaSFi8FYQWl1khoqnrfNxuepTPx38/tPnZx+quEqhGqdEXrs5
	qb+Z/qjTv2OZ0MKQXYuhvJ1Y86ZhWTyVV7KU2PEINRZP1r8fZgKYiZEYYgr069uY
	bcGSFz6BB915hC8ggydBwnZ0cibrgM2YkzYIndliFQvPpAMSv0pZNVoJe4AH2I44
	AGLlvQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43xb700je9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Fri, 03 Jan 2025 11:30:21 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6d8f15481bbso28649136d6.1
        for <linux-i2c@vger.kernel.org>; Fri, 03 Jan 2025 03:30:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735903820; x=1736508620;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o2MRsFx3bMUSG9QzwttMjqbwl6vaosB+gmA/2Y/BBj8=;
        b=pBICUU6A+eHAb4DkWJBhPYvj43esrh8S66OmXnIviv3qs3CgBS1MmSJYMLVCg6SDs5
         sX9OhAiQB3NHHjZKI2GjU3ki5nQQb2gQ8Qhqm1nA16UZ0sKH87uhvaPIk7J70GFoBfoO
         r8bHeBZRDdk7siHnX8ssnDAlY3mY8+mKe7xU7A+s2aPdjVVHKlq96kNxTZFPAYR5Xo8G
         HznxwmjRBvCRUFSIZYqE5VlGfK304ge5Mfv9kW9KCygEpu6C7k4768BxFYbbbPtQ6P4V
         dSXxd3WLr3IS9Zt0Oo3s5FS6hk5KZU0vHYfyeyVARcrA8z3Z/lAQCSc94c3cMGs1xPrm
         JPsg==
X-Forwarded-Encrypted: i=1; AJvYcCVmgrLswERa6v0kmk9PgX75acV/YcKOZGGfGT/nmqVAZxPkkWM7vqSO2am3qxHFN16A1nCX7kjWF8g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmpQLwzAqo+mnq1OwTsdnNC9ba3VSh1fWlsRmmuNGAYj8g1F7S
	weye2/mFAqtwlNbMhJxdakZlD7b8q20EI/j66KEs2EkJBmHrSHZAnkHSTIv+UHIOKZU5M3PHwba
	6H/GIraisn2ngTrKjqMKzCKeueqtbzmKypWeqjfbeLOmj4VTX/rXTMYW0Jv8=
X-Gm-Gg: ASbGncsLVGK9OWvGymlqknlw4EZkz4eXtT4F7u300NB3QN6pkohLe9ykZGzT7n5EpxU
	KDJVpyYH5uKgTBZk0RedtnCl9Pifqxd6xKSeXqwijWw8KMk0HWc4M9zPgxgoUHnAoxa1/wyBrvT
	/NN8qumR+7+NY5o2/LneiNW+HAhW6Uuou//rIEEFZ9uyQcBmcFxLKakQt2DssjG1qpxrb/T4CEU
	UwYaKzsGQPiuN0Oi9zH1KD80JcOtqIw8bhYS+KNXJW2FUKHn0bhSYeEFlNSw3CRNFZjUSDLxU8Z
	Vm7esa171VTKo5/1/Pv79s6/CXVwJkFSOMo=
X-Received: by 2002:a05:622a:1a03:b0:467:5eaf:7d23 with SMTP id d75a77b69052e-46a4a8bd016mr278472171cf.2.1735903820395;
        Fri, 03 Jan 2025 03:30:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6yfhfXdw6egYbhDHkpAKPnsfYJ/f65rP+b7aYP2oQNqtV105SjlWWqv3GWFFKMbv3p8e9EA==
X-Received: by 2002:a05:622a:1a03:b0:467:5eaf:7d23 with SMTP id d75a77b69052e-46a4a8bd016mr278471971cf.2.1735903819989;
        Fri, 03 Jan 2025 03:30:19 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f01285esm1888510066b.141.2025.01.03.03.30.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 03:30:19 -0800 (PST)
Message-ID: <1e224db1-04d0-45a6-b0e0-e43de7c7a0b4@oss.qualcomm.com>
Date: Fri, 3 Jan 2025 12:30:16 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable
 camera EEPROMs
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250103-fp5-cam-eeprom-v1-0-88dee1b36f8e@fairphone.com>
 <20250103-fp5-cam-eeprom-v1-5-88dee1b36f8e@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250103-fp5-cam-eeprom-v1-5-88dee1b36f8e@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: O88QpOiiarL8r_Pynp57e8CVvGt528yF
X-Proofpoint-GUID: O88QpOiiarL8r_Pynp57e8CVvGt528yF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 phishscore=0 bulkscore=0 mlxscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=839 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501030101

On 3.01.2025 12:12 PM, Luca Weiss wrote:
> Configure the EEPROMs which are found on the different camera sensors on
> this device.
> 
> The pull-up regulator for these I2C busses is vreg_l6p, the same supply
> that powers VCC of all the EEPROMs.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

