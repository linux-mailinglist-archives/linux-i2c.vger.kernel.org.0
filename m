Return-Path: <linux-i2c+bounces-12839-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A50B51B75
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Sep 2025 17:23:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 137AE7AB445
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Sep 2025 15:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF29931D375;
	Wed, 10 Sep 2025 15:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z9EHScQQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B93257431
	for <linux-i2c@vger.kernel.org>; Wed, 10 Sep 2025 15:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757517811; cv=none; b=ij3MMSGS//dxy96u1iqtGTTx0JUJWnzbkmYuE+dOyWhNVnwfiJcawVQFt6YTkxBcJSqm110HoBlF2OgGkD8/tN8llISCH683ArqcawalxGJn7BmqyjR4K9EuwR7xE5tFiw6AkK/T+Ai/pfA1VhAWXkZrdXbXWNw5mMYvo9szUeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757517811; c=relaxed/simple;
	bh=mMvHiXaIqdEztb0GmfYYTzoj1IAJtybwAgKmLEN3GaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PP5McCUXX1XIIH5ET8tPWHH4rxZE8KUDvvQpGHnpbfzyLJMYDh+OvDsu3W427DtaG6uuBohPAA9lbEMs0HC1UZuc1F7T34LLh9Srmle4CYFZ96GLhcLotePP2umbJnvsbMf9pUbnwUD05NlGBrP1fIhVt0kvlX0u6pMEO4K67Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z9EHScQQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ADZFIw031602
	for <linux-i2c@vger.kernel.org>; Wed, 10 Sep 2025 15:23:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ANxLOXFlXZv8uHlajIytN7Il
	IseSzgePw1DqeOok1Tw=; b=Z9EHScQQ8u48V6RehaDG80Rspv46gWZrPHxFKP4H
	h+78pWwiD8YrKeNSRBLttlTHqj9gcG+ythablH1KncaIH6pzrHQNkNQS+D95Zle5
	/D9oGIV5kWlHx/zslms9JyZKu+lxnHeh0+0KSzh9EdEnT15yUlZ4i4e6nXKNx0cF
	FsQ9ETcGGgmS2rKUmx0uxaVJtkZFkM3ECGeTya56s9sPBFQqWxbeDDeJFm3aFDbN
	8Xt3tIkG7DudJ5RyuZ+U0NfvQ9ZItpvbBeWDllwdSn7d0V+PKDIbJuMSW62Cuw+u
	SN4Xy/wJM8xzwrNFEhY/wOG2aMWHyQeAUy23C3wwmUeeDw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapmj7n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Wed, 10 Sep 2025 15:23:28 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-72048b6e864so71944946d6.3
        for <linux-i2c@vger.kernel.org>; Wed, 10 Sep 2025 08:23:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757517808; x=1758122608;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ANxLOXFlXZv8uHlajIytN7IlIseSzgePw1DqeOok1Tw=;
        b=NuqXmRpdk5Gyo/vgq13bJhZ5pA+Phe3+2Qwhn7ajIzMLfmCDIcQtODEh2MTXHrK7Xn
         L4zi91hFm+6SCZVIRvtFy5xG+HsSdjE3TWUoXg+gfugWPvCBzQHrk4ucjHkeFIn1WImt
         wdPJPGCw7Kme5+AF4SQXzslAVaheLaP2y2rf9FpKj/mH6r6xFA7dqQh+3wqSPl8EBTO8
         +zYuB0C6tTf5Hb55bZVhXjilDLhcgH951UHl1LmkQTQdDyQAGZYcq63HbNpzmrunjmjK
         mOnAYO8skpTw2I9YzdIPRcJIPCpiy7aErY3PeirFo9UcYKt52Am6N94c4392A+YGAZBU
         BGuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaV9aQ4l1bhMC2Wj6GtWnxIsgeYuCN50xsH1EJpF/VamtPUFNoIwrt6KPPXc60CyyCrCIAOqJf0EA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHbnx8gwuR3FxbPhoM2lngz00hGB2FBlx7oKKsIkqrycO3nkSu
	QI2bXqyzUzSZAj4+H/Mswoe25CiQVoJteceBDZibUSDaT6uu3ljh3nc5MeWAQym09/p0pWZ/kQm
	FjvePfKhNyVz1BnRY29+PFIgVozBfYPnmpROSLvJdK+Q3lGiiHA3iVwIIpMT/Q2tljWRZst0=
X-Gm-Gg: ASbGnctnZ5F1CEjYUNOwncNH7UxAW4g3f6Pl7MU+v3EkJlkEv2+yplG9ix2wmfUd0H9
	jsciwZoGjH3lhzUq3SfXtKwxT/WV0W0QYXDaOu4ckjcgtZJx8HB3BhyeddxJAE03+nTLLcDKj6I
	KmfB6UIKNY8S+DQ9drenR7py0xzjxJMiUdg3woSoTP64682o6LqeKM5Ld1M0uP4VQN0ctbER/oJ
	6riMsB1r7akpafUI9eHrTz5P7MiZT+nt9BkrPHY42G5DhCqKMrdqGUVz0YrerlR+7vwxxPUeab9
	cPqxFsLN+e6osFIRNR4BEgg406OFzEgQrJ+PL4LMDDghorqKv/34x69foGTc1sFY/T/Cd57DLTw
	XNAfC1PZi6NoixweV8TaAohcERdaqgorcmtCP9HHEB3A6Gh10f8sL
X-Received: by 2002:ad4:5bc1:0:b0:70d:749f:177 with SMTP id 6a1803df08f44-73940035cdamr172628426d6.33.1757517807523;
        Wed, 10 Sep 2025 08:23:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5Lb/Gj9Uty38HJPbt60WosvULTHdWQ65OW86uLHRn17q5V3PGeS08NkMbbeRO2k/y5Nlcug==
X-Received: by 2002:ad4:5bc1:0:b0:70d:749f:177 with SMTP id 6a1803df08f44-73940035cdamr172627696d6.33.1757517806697;
        Wed, 10 Sep 2025 08:23:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5681795eabasm1293007e87.91.2025.09.10.08.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 08:23:24 -0700 (PDT)
Date: Wed, 10 Sep 2025 18:23:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wenmeng Liu <quic_wenmliu@qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, todor.too@gmail.com,
        bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: lemans-evk-camera: Add DT
 overlay
Message-ID: <u437qomhok4yg6pef4xttd3a6zibuybzaeys33gxu5frbyp2kp@mgmym6c5dr72>
References: <20250910-camss_rb8-v4-0-28f44e1880b8@oss.qualcomm.com>
 <20250910-camss_rb8-v4-3-28f44e1880b8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910-camss_rb8-v4-3-28f44e1880b8@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68c197f0 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=AXas6eWRmEekrqqxQa4A:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: pHCE_Qd0kONb00nragrpyB6jRMFac_74
X-Proofpoint-ORIG-GUID: pHCE_Qd0kONb00nragrpyB6jRMFac_74
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX92Bwc48SJwTB
 5EPqGBmh65qpQC75rncNAIeRlGufBdvORk0JIwPh0MrPXKQzoKUxeZ1oba4i541XUGQO+p6wcxz
 2wDQQdj4Oila5UhEvq9jeXKZbULpY/3MrK6gwVqYUvzphsUIgt5WUbb/GveQCsVrSiJq0976v4i
 HUjS3feRX/SNn5/f4Rewdaybx3MfDbdXgxzgeUvM7CETesaZTcd7ZEZZLdUoZGRBSpDZrkUkHA0
 GqlFJlub76TZLObd6uASLjznTtpeSy89IszdG1LvrhIEtIq5spueM5e/lcdzQiEDdrHLfvyUonN
 Xj26URHJS1avW66+Bjf6naEUo46l5Z/z9txtZ43E3I9H2WJN8ZCgnsitDGY/QK2C2fFrdN8BEEF
 cf+tpRqu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_02,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000

On Wed, Sep 10, 2025 at 07:06:23PM +0800, Wenmeng Liu wrote:
> Enable IMX577 via CCI1 on LeMans EVK Core Kit.

Is it a part of the Core Kit? Is it a part of some kind of mezzanine
board? Why is it being enabled as an overlay instead of being a part of
lemans-evk.dts?

> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Wenmeng Liu <quic_wenmliu@qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile               |   4 +
>  arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso | 101 ++++++++++++++++++++++++
>  2 files changed, 105 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 0a7c308dec365263bbb7aa5f5cd306dbeacfd3f1..b27f60fbd527146027eebd4bb7b1f8a0a82b3af2 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -30,6 +30,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp449.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
> +
> +lemans-evk-camera-dtbs	:= lemans-evk.dtb lemans-evk-camera.dtbo
> +
> +dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-camera.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso b/arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso
> new file mode 100644
> index 0000000000000000000000000000000000000000..629992ced9b13b23505fc20562929a0ed17a9566
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso
> @@ -0,0 +1,101 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +/*
> + * Camera Sensor overlay on top of LeMans EVK Core Kit.

This is pretty obvious from the file itself.

> + */
> +
> +/dts-v1/;
> +/plugin/;
> +

-- 
With best wishes
Dmitry

