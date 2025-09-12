Return-Path: <linux-i2c+bounces-12920-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C839B54DE7
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Sep 2025 14:35:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2735FAC0EF4
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Sep 2025 12:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10D1D303A00;
	Fri, 12 Sep 2025 12:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="isoXHVb9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54357301017
	for <linux-i2c@vger.kernel.org>; Fri, 12 Sep 2025 12:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757680086; cv=none; b=K8zBPfXHqN1ii4c7EAgdkMLpAVTxk30giH+z9EuL6qFFirfVsPupNVO0JhRSDLBihF+v4IMz6rjMfCvQbU2U5vUUNNxTCaExewJupKzr7Ngnx5vv7IZmViS2wh+9cJvCYGeb9yiY+eaQxUynjuM/FgiNagti0jfISH6kg2djgLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757680086; c=relaxed/simple;
	bh=iJsSVwqOcKJ+jvcqQulAE5UoFoAGbSHsV9vI7EwrTJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JUxQGYmm7X9/x8iQ+a0NNGVQzqIFiTJm31ICelncwtupymIV+FG+acHX7lo+yVoa2pDdWDwrbSF0o7Eo/ImZgyeNmlorTyl1MouZ9lEOSxhYlN2L1Mv+4gYcSWXKdqcDfs6TeihOXyxqQhb+NfDwFXKwN6ovTPKXJtQ/160B9Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=isoXHVb9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fDiM018555
	for <linux-i2c@vger.kernel.org>; Fri, 12 Sep 2025 12:28:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hFUuM/6CWr6E6Ua8sjPcJgSq1lagiIOIVJ2nUPnOckM=; b=isoXHVb9i2tKsBRJ
	TQm4lxsHWuFDL7n3ICfQNr262hzzQiEbEnirW7xfG/7AoV8ef1UK6Oc8txWnMXkA
	uxSc1ukeqFtUkLzScgVskQLkNub7tfNBboRwknb7MMknY+C1DYWtSTbt0mEKpO/Z
	PApWevCNI/ZjOkWlZL5uoMwBfZOKfYiXZNEWLsEPPeQf/9sKmO7E9cZr0ulIzkqC
	XQoQwgJPqog8flCd5Bhxp0fZwSS2vxDQs9v9x/lo2QEEa46wKaxYKXGXXfYfLna4
	UC+J23gHmjvSNYciHYAvf4nvezoEx3vG9Z2g2XJVajs19Z2ktEeWUwgdZDQ1C+Tw
	uJbHGw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8akm98-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Fri, 12 Sep 2025 12:28:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b5f15a5f3dso1134131cf.2
        for <linux-i2c@vger.kernel.org>; Fri, 12 Sep 2025 05:28:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757680083; x=1758284883;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hFUuM/6CWr6E6Ua8sjPcJgSq1lagiIOIVJ2nUPnOckM=;
        b=vtbcC3W0t2n0YALxyXLnoemYdaPqs2ICFJwXU0XyHl2eK7TfNaDQ4nqyP7Upn756c1
         dixN7bZYww3QMHcnR35EfPOvkJIuyfr09sPlg9pis8vUOWY/mJ6emNLHiTsjnCVM9a4v
         qAe1DDSGZc4XUaMPVKsbNMlHzPYsZQfx9T0PJWw4yf9a0CjmBV2JV3lsGSv++j8FvE3y
         Ibl4ry3WfZyfLA2XXx7soWdDF+QXQoerhKS7rXiVNTuCy9J5EjaGW9uV51q8Lw9hJwEM
         eWN9b4GpFHOPaNFZHit+JuIwydgf1zjrs22oYeYAOMLgcVY1HQnODQ0hc26hcgGCeHnI
         1j9w==
X-Forwarded-Encrypted: i=1; AJvYcCXEOOLTLXmUGy7w3POrp5bb3xEPyCKpxBlKHGIDWMYq9euKiMpsEnUmt+DnSL1b744pZihH4EgOSc0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl5tCHXRticHZWcZQ2koDEpZ811xbJjFVJx7uOZj+VXn1fxP9F
	CrW8kPkag9z1q0Zsi4qoAr7eHF2+KYLWySbef7IycQPs8XEr584HiagBB52hcHZJQsGhy5oVAH4
	kjaqIEiZe89myTtVr7L0c4yv4Kf8lX6CoIQZrhJhIRN6mFyhCTckqBi57Q0kS5bw=
X-Gm-Gg: ASbGncugSldpt3koM2O6WeipqlrV5nJgGE02xjPxwZY+yIChqphK1i+1QZ2thkA45e3
	JlfJY3n2OGZx+RuecKnRbGFb+4HsjC7bw8nKtxJy072+F17tl78envt+UCrsuQ6DSRkh+ze/2KY
	zhK9U49NPGF8aorI1+HA8vxnRRDJRZcAearxpAeq4awyUyk50hf4gNyb32iBk7SGi9sxh0+uEnt
	huV3f8jpT4grkca7jHicB2lFgR2inryvbLea/b755MfLZXkMsD5Wa1WC2h7WSw3I5mJuyaY+YrU
	LDys65S/z/m6UQpzCIfI4oATFH5TJ+5AhEYk+t+JyaYIhSwRN8SYzXjpYebqrXjn5dTVj4kTfXV
	nwzPdu++ZqJmlh3Ne6PtE4w==
X-Received: by 2002:a05:622a:1984:b0:4b5:dfdc:1f0c with SMTP id d75a77b69052e-4b77d06ecbemr20553691cf.12.1757680083110;
        Fri, 12 Sep 2025 05:28:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8QzuRduFlaCIEb8iFypsFpoHRpXBscWN+xA6q9Sfc+5OImw0a6uM7bXGrxC/zLDbpdQwBZg==
X-Received: by 2002:a05:622a:1984:b0:4b5:dfdc:1f0c with SMTP id d75a77b69052e-4b77d06ecbemr20553301cf.12.1757680082556;
        Fri, 12 Sep 2025 05:28:02 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32dd6f3sm359239166b.67.2025.09.12.05.28.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 05:28:01 -0700 (PDT)
Message-ID: <cb2a5c93-0643-4c6b-a97f-b947c9aad32c@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 14:27:59 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/14] arm64: dts: qcom: lemans-evk: Enable PCIe
 support
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: kernel@oss.qualcomm.com, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
References: <20250908-lemans-evk-bu-v4-0-5c319c696a7d@oss.qualcomm.com>
 <20250908-lemans-evk-bu-v4-7-5c319c696a7d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250908-lemans-evk-bu-v4-7-5c319c696a7d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c411d4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=nUKbQzcQiuh6IjOItDgA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 1RfrZrkdKibyWCHg_RHw-eh3pJ3zNqLU
X-Proofpoint-ORIG-GUID: 1RfrZrkdKibyWCHg_RHw-eh3pJ3zNqLU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfXxaltJLtOnKYv
 12G9j7lCdOErZxRAdRvU7IntgbtJb6bQ5snoTvqXwJisSObxIC6nbkxMabCpYwG0W8pvhW5scLO
 c32QSaB9a5BrjbSTi5f8E/GQEZTYD9thJFP5uqnhgOukVyRNldWgaGEOWhQRAwu1SQ1I6acVTzv
 9HZb778VlGv+GSdZ52fNrM+XsOQzTG7hNNSXbNyHjWBnDKXDR8xVgpn3wjzDnwizJSY+/yDfBWh
 o5gik8zyKn80GeTw5VWWno+DSXQHhzoRe7rYtgtYcwCFfNSYMC9ZG4w54hkbK8g4uRar49fk6Pl
 e4fmoe1y8R+GRzwacXPKjWXHDm0VZ4oI9zhBAAi6tIU+APnA0kLtu2CTeXHDlJ4fffEs2IaWduO
 98kmDzVW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039

On 9/8/25 10:19 AM, Wasim Nazir wrote:
> From: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
> 
> Enable PCIe0 and PCIe1 along with the respective phy-nodes.
> 
> PCIe0 is routed to an m.2 E key connector on the mainboard for wifi
> attaches while PCIe1 routes to a standard PCIe x4 expansion slot.
> 
> Signed-off-by: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> ---

[...]

> +		perst-pins {
> +			pins = "gpio2";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-down;
> +		};

Pulling down an active-low pin is a bad idea

Konrad

