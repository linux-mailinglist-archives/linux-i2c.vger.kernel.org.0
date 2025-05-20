Return-Path: <linux-i2c+bounces-11072-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0144AABE00B
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 18:09:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA3A3175212
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 16:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FDB026C39F;
	Tue, 20 May 2025 16:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ls9reJSI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA12826D4D2
	for <linux-i2c@vger.kernel.org>; Tue, 20 May 2025 16:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747757335; cv=none; b=PCIh1cfHlRB1+abCke5dUCWf1OsotD/ZIkwTcRUKCbYvDX6qyf8XTpplCpHCp4AcVWEbN494ue6t2lfrJCJbYKi5AwtFBJ0q7aLUnazBxnuJZuhl56YF1a3E/A9OuASXtIDiF8mSUZ+Ym5Osb3CKX4dGmkBncFp89EZK3u2/azQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747757335; c=relaxed/simple;
	bh=wYTaVwvNsbAu2UjkeaZU968DhSOzxXgvk2nExcpMZ7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DwXzGsdMywrex1ylPogFzaKHdhMxV+yAYK/u81Ug54Lw97hZlalJKcI/xMF0Jf68r7xxbrUhgvBJ3ZgGLYiQ3e06WMke8dMW4+lun6h2L7//elJT/kmHOY95oyZ5sLucKqfbpQe7nJypSglpWDoLZcBOfo+x1yAUTY3QWEFoB+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ls9reJSI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K7tbCx022751
	for <linux-i2c@vger.kernel.org>; Tue, 20 May 2025 16:08:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZNBYPSDwYBwcL0JlUFsjFsIcMrNE3FHeUbnIgo/55M0=; b=ls9reJSIc0Ps1nQY
	X6+XHEewVfzKWf+aglBFzyw+7OddUtb6MPYGZ9flKuW/4FvbRW02V8u19R6r7oqO
	s+c2ya58YrsNTzHsmpTuap/no0YT/so4QVwUlJjqj8GbPG5WfEgEh7yXwW+ML+MZ
	9koRM1/MAR4741n8D+iw1ltdbwrkwt83XfqfZwVVuVKDx617Akwebml1UmJaWfgj
	DyibvQ/L1ky+e0ckVYoilFG2OvHXWNQnRKnA0No2IwFzri8OuwpjZ5VO/W8CLPBC
	5iPZBMMtC2LHgz0Ng8IDIlrNEBwvvZ6t1v+VSnbDpGFq1mu0TIIiyCveJx32M9pV
	nll/5A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r29d4frp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 20 May 2025 16:08:52 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f0c76e490cso14840056d6.1
        for <linux-i2c@vger.kernel.org>; Tue, 20 May 2025 09:08:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747757323; x=1748362123;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZNBYPSDwYBwcL0JlUFsjFsIcMrNE3FHeUbnIgo/55M0=;
        b=FijK0aiHxcQkSZrRBoThNe3CDSeKDtxBGIwsdn5zmEnp/NVNhYq8aFdx1akprJzb3M
         yfsi8Y24D5b0RSqKYyHa7sn0YcVhojAhfaoQaOyPOgVS4XilPL4VsfL1O1+rsXLasix/
         y7CJMIzJhglKKZRt/96fnOFx6eaHcaZA3mtOUnvMNA+ylLnjgyYx72tCeqavWt0Lq25W
         52spAFxBKbmUggkFz+YEUk3cNOt4Tn9cNfh1/oXZpjfnvXaGWX9BkX6q1LgqZJlzXsvi
         kclCR7WV1MCIvyyv5ktS/vPQkO4/jxWuaFM2tl9VA0M0EqHFitvgNG4GT1ln+kNzObc4
         63fw==
X-Forwarded-Encrypted: i=1; AJvYcCVeWWMAvmW+S4Xm6aOzUj47DxD8T3eyAYmyFGMy5ncz0NvwTyaHQB4KH2ig4KYHikY3/zZGjlQen/g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkI7pLdqzr+zErT0+ObEWhG9b07hfW97cCBtVnYgy32lUjY071
	jS9mgq7zv8ajFFcIPVOlYaUkxiNk2SSKLQVs55xEtGf0Csj27uAH+XZoGj9OO4srEuBeJ46BIDV
	rg1DuOG2PzO7W9iWnB0Dqpc4/Gz5SiJoB7+FWVZGs6WpT88C5oli0G3fxsJkK788=
X-Gm-Gg: ASbGncvBtiEduyuSr4cQ0OzqYnRHSlQsQ4Ee53s7PA+cCiDLZZ5x1Oy1wZp5IvywxJa
	2aT1e2xZ0f2GX+W5gIh0Of2piasdCA+W8sSPnhhROOJN5REWkk/9L8O2Grm2ArZ8xl9JMTLYrVl
	hnF7FrwxumOajUkGOdEyAqguIdTkogjrw1qLo6p+W+yLah0SnavELnpWcr8xDb3YUUIhAmqZx9i
	lG0UDMiLMCixdd+6OvXP0k2+QHYb7Pc2Gry+lLNSTvl9eK6tvUSPkMHEI50oZ09NkZxFHRi9vc3
	n4Y/LXvRyf5jYjptCKgqC/aQmtZHV2baCoy6hrA3iOSqxden9eFgOIlLCswXso8NkA==
X-Received: by 2002:a05:6214:48d:b0:6f8:af9c:b825 with SMTP id 6a1803df08f44-6f8b0881b2bmr101922266d6.3.1747757323155;
        Tue, 20 May 2025 09:08:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvxo25X0xwc+Sia4cHOSRvAs8I2RKXQTr31HG6wPXMbAy/2Bmn5DJMjpgKZAqen7UvAExheg==
X-Received: by 2002:a05:6214:48d:b0:6f8:af9c:b825 with SMTP id 6a1803df08f44-6f8b0881b2bmr101922106d6.3.1747757322446;
        Tue, 20 May 2025 09:08:42 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d437585sm740241366b.115.2025.05.20.09.08.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 09:08:41 -0700 (PDT)
Message-ID: <898a2204-f129-44d0-9f73-74370524112c@oss.qualcomm.com>
Date: Tue, 20 May 2025 18:08:38 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sa8775p: Add CCI definitions
To: Wenmeng Liu <quic_wenmliu@quicinc.com>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vikram Sharma <quic_vikramsa@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20250514-rb8_camera-v1-0-bf4a39e304e9@quicinc.com>
 <20250514-rb8_camera-v1-3-bf4a39e304e9@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250514-rb8_camera-v1-3-bf4a39e304e9@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDEzMyBTYWx0ZWRfX/wC2dwp6ERpX
 Eh9tGCxCuDirHFW8RFLxs8Jiq9eAwjXHITr7AmuNSsscToCV2L4epdXsnKsDjYJzUHJE3YO+LkC
 Zn7Cu7mogIlmS8iqbXLuxHxaoa2ZY/p4qClZyTTe1TArIm0Hw0eIWSe4MdxRiPamO6R4lc7Uemd
 Qaa4tYA7+mrnwxpb1Dc/mt65ztj8UVdOTY9z9EibosquNrgXES4pT7rA1fFxu7+WJdIiHZ29jCC
 x9Kt+f5n6U8b03vlV2EKPKq36RfpXL/oiQ2MoX0/b153RalxB/235ndRIKxEc7gSwWHwTs31m3Y
 VxpGu/lbJ2pJ541Z+u0kS8Q84aWDxR1FQDYP5h5TLuh6vH7uZOVXtSJnNZAXM3klgHGAjh/VS3r
 aNKEt/vvUtMNjG3jJjF4jvLbyeD0qwdX8aSGQ0PrXajZemRI5PP8ay49JjoI+rEe8wYRnEYm
X-Proofpoint-GUID: XUgMU5uU0OqyVvhSn4nkXJqLD7ZgE_8a
X-Authority-Analysis: v=2.4 cv=KLdaDEFo c=1 sm=1 tr=0 ts=682ca914 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=IC-rWu3oLdSMw__OBeYA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: XUgMU5uU0OqyVvhSn4nkXJqLD7ZgE_8a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200133

On 5/14/25 4:40 AM, Wenmeng Liu wrote:
> Qualcomm SA8775P SoC contains 4 Camera Control Interface controllers.
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 268 ++++++++++++++++++++++++++++++++++
>  1 file changed, 268 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 9a8f60db87b1afdf16cf55eb2e95f83eb45803a5..a867694b15b307344b72041e972bae6e7543a98f 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -3941,6 +3941,162 @@ videocc: clock-controller@abf0000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		cci0: cci@ac13000 {
> +			compatible = "qcom,sa8775p-cci", "qcom,msm8996-cci";
> +			#address-cells = <1>;
> +			#size-cells = <0>;

put these two above status, please

> +
> +			reg = <0x0 0xac13000 0x0 0x1000>;

0x0ac13000 so that it's nicely paddded to 8 hex digits

> +			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +				 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CCI_0_CLK>,
> +				 <&camcc CAM_CC_CCI_0_CLK_SRC>;
Only CCI_0 and the SLOW_AHB clocks should be necessary

[...]

> +			cci0_0_default: cci0-0-default-state {
> +					pins = "gpio60", "gpio61";
> +					function = "cci_i2c";
> +					drive-strength = <2>;
> +					bias-pull-up = <2200>;

Please set your editor's tab width to 8 spaces

Konrad

