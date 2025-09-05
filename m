Return-Path: <linux-i2c+bounces-12685-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A51FB45756
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Sep 2025 14:10:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 210687C0DF1
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Sep 2025 12:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 379AC34AB08;
	Fri,  5 Sep 2025 12:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m0r9UQ4C"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E3D34A334
	for <linux-i2c@vger.kernel.org>; Fri,  5 Sep 2025 12:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757074234; cv=none; b=MIyoRyOMKu9U0OT6hEmLd2W2JmjUK9A4ULf1slx+k4QmLDNvFd7jDOoxzfZxLi9dc3/zdsarQzI4Vt0gYnV0uDln43+x5GDscm6zh7AmQCSE7iDAThg/cjARQBtwxIlxoaxXoPiESDlDbjFis3MlD6Kg/KIsMG2qf8USRM9gjqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757074234; c=relaxed/simple;
	bh=ErCJ6Ql1rDMt2vKVLJW9jn9Ni3tpQtFY2dmm34Q5uBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UKKS86XGbOtl/YwTAbMdPrnxhV97akFjK8BtmBYM15MEAZSjJPdmZGFXR2YlfscX1XQM+dVRl4mQX9DdhTyQIES40Aukun0J9wpo4K+7W8rjuo7uIvJepkUY/Ov813lNgouqc0GDJzSvoiBGOAah2y2/sCtwhnPddhDtQzregTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m0r9UQ4C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5857iou8023904
	for <linux-i2c@vger.kernel.org>; Fri, 5 Sep 2025 12:10:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B3CXvHZCGtK3JzFKnruevi9kzIT/zr8k7RvjkNKrle0=; b=m0r9UQ4CLWMjutZQ
	qETbEc2XdgjwRETjCNkkIMt0KynIg4Qxw3/QNyNYNWIoF5s6EQK+MmTf8jkzQ1KK
	SlRMk0Y2Cn+TAsMW10hykObKOX/tZ/7PRIJ7tLOoNGnN2dZOPm7XzgnJKyGOVZmn
	FC85p/oGlW/yqEQvbmqO7FTO01Wu5ktI+iuC31bDI8/ydyfM6taqlZaAw9dwc+P/
	oxO2b/8jg+eaF4roRMEgRimjFezbnlVumB4ywh+Sckr2BOFj5tMpQKwOK1v1VuKy
	T5Rysd6oAMP0z2HdnqLBFPgfl+tgqE8TIyZmPkO5h7HZHYWi8LupJLaQ6Q+ORNds
	oCOtlA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2ftx08-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Fri, 05 Sep 2025 12:10:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b32dfb5c6fso8111611cf.1
        for <linux-i2c@vger.kernel.org>; Fri, 05 Sep 2025 05:10:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757074230; x=1757679030;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B3CXvHZCGtK3JzFKnruevi9kzIT/zr8k7RvjkNKrle0=;
        b=O4IrBzIJODY3BCYC24QmaKDQU1YP7pztuF1DSnHOyM3Ix7KR/knZEyl7lYR35K7CU2
         /d26vscLYS0QbJaZuOSQDLa5mc5qFgwMWq4g9JOrh1HnOe79fT0IJK8AvFD9NAmSoKP9
         BddxA6deC0tTolZgE57lrWgnHtV860ZNB1kR/cxj/TiZAxsCHlwiwRqpaZqaotbabHoz
         YJn6MG+bvSRWxfb7sn3VZKjTx6Hp+BtYe8uqMIE5AmYndhq4imZxd5teRq7JIROUQ20i
         oVKOU6iJnxu10X1sj3iek0AdDwn+OpdTzFfYwjP6BQFaRKh7L77+K8+1Ah96PYo1bUmH
         LBIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHCrniYnt6lLT17V2gqVeMNxm7tzE1wK8etiXFmWkEo45dM1jIwWZRSdpoyPN7MJE1tnNihJQwrwY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEmAtQdot0bDcrzgUUs+DfVYSaE2qpzTwA8uASK7Ynm/jD9DfY
	Ayn2dzKZBZST4QaLtxm9fG5Dpg07S5p5oqYbjFKgA4paRPr/PKaRF77X239XV0CL0yC4HLx+clG
	Vm7ZPyj2NmpSBLx58oGU+0z4w/ci7Ro1ilZtdaUP1o13ZDTjdAkXwB+zAaDDziSI=
X-Gm-Gg: ASbGnct5U0DQqotRwbSINHA6JdHIKc3YH58VFVzVZxGLjmXry0l/GU6R26MtHdddo03
	VFA128b4junJa3Na1j/vDZYVZYonShU413kFEzSI2OEyQDonL1KX9JA8FL+GH0Uo3UgRRQf2yzZ
	310mmge5HJ16eP+uHuT5WYqGuLhXwkzhnJRsx+87EFUxqR2qTDjWSKsfY3Vp5S0RIGrZ39eywyq
	iXyyTKQ2chsZDlPebc4KSYe7jKqLz5RVOYDiUIrBeV9LTBo954JJT4tCxFcYcMp7zB+PNleJcGk
	KDXnBS2rgmu1pDXv59FWQw4dgTShf2m0gwzH8Iey0tzZsowUt6rH5WshQKcifu4hA/+uJEL/xOF
	/6fa9b6v7oAXzuePjTPywtw==
X-Received: by 2002:a05:622a:11c3:b0:4b4:946a:df22 with SMTP id d75a77b69052e-4b4946ae541mr79002051cf.9.1757074230295;
        Fri, 05 Sep 2025 05:10:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/V1Ut9FoAm3PMIuMlaHnEJiGeKOqT+3I7Y49huAY9u92oCVKu3lzCxSzcPEtH0e3dxFF09g==
X-Received: by 2002:a05:622a:11c3:b0:4b4:946a:df22 with SMTP id d75a77b69052e-4b4946ae541mr79001621cf.9.1757074229739;
        Fri, 05 Sep 2025 05:10:29 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc1c7caesm16131666a12.9.2025.09.05.05.10.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 05:10:29 -0700 (PDT)
Message-ID: <a61d5e22-6a0b-49df-a203-aa408856cf43@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 14:10:26 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/14] arm64: dts: qcom: lemans-evk: Enable 2.5G
 Ethernet interface
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
        Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>
References: <20250904-lemans-evk-bu-v3-0-8bbaac1f25e8@oss.qualcomm.com>
 <20250904-lemans-evk-bu-v3-12-8bbaac1f25e8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250904-lemans-evk-bu-v3-12-8bbaac1f25e8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX4UYNQFeNOdGJ
 f2rh3z5Lxdtz1FFd0M5XFE5RwDPxi1ZsnUk9dkAbPEpYP/sMbMQkzh4k47CQLx1j1mGsuS9GnXh
 JYL+5W3YL+5WwuM/lmHlWRuOWqh1jja2bLJUVe4RZOdjkp6CshNiZJMMxsBTacumQ1IDgvS9LNu
 Owf/hh1a3Uj+n0cq0365GfDI3qKAt9ELcvK0dDPIRcDxw9AurHLhR5KRBow9VRtL09CGFfw8haa
 2EriYkQriSUYeTLovId+vEuM3GwrQMxdp2uvn0sZamhZg60Gq91t+ESGhCr1fnHi44EcF3+zy3p
 xhH5dL0OyhtODIrgrlhbURKJc4FYJ43sgHB8JcI9LjisF7caq7ZXFS/3PebfVfT7Q4Bk1gj5iKC
 bPd7OV1s
X-Proofpoint-ORIG-GUID: gR-3gAZARiwD0ZkEX7pGlm86G-3Ds4y1
X-Proofpoint-GUID: gR-3gAZARiwD0ZkEX7pGlm86G-3Ds4y1
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68bad337 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=eKh8lGy-H4yf2MGC_tcA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038

On 9/4/25 6:39 PM, Wasim Nazir wrote:
> From: Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>
> 
> Enable the QCA8081 2.5G Ethernet PHY on port 0. Add MDC and MDIO pin
> functions for ethernet0, and enable the internal SGMII/SerDes PHY node.
> Additionally, support fetching the MAC address from EEPROM via an nvmem
> cell.
> 
> Signed-off-by: Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>
> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

