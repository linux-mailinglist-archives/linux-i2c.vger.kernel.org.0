Return-Path: <linux-i2c+bounces-10596-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D0BA98B1D
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Apr 2025 15:31:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 069493B44EF
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Apr 2025 13:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 963B31990C7;
	Wed, 23 Apr 2025 13:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lln9v1Oc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6881891AB
	for <linux-i2c@vger.kernel.org>; Wed, 23 Apr 2025 13:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745415060; cv=none; b=HV86ObEWKMSqhXhadTccdJwIOgxUyH0o+uZCkHcq9s7mMt06iHJJQ2E0TRW+jDn3TC7ShC4Ep6QkdCrRJlXcsejjkmqkx2NpAhA6DVMIoLALIa7WmALwErBtkYRsTzm5Vsqamw/GL8AXPhTKr+zcaFn3w0WSPlTQuRUrGhh70PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745415060; c=relaxed/simple;
	bh=lPJJwHKGCbJcWTOy/W2KqY1hoahEC6Ch3aeOkRUot7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vl9VTELFjSk5FXrXPptN2b0siUmO7NOGsuyF1JGI6O0Hp26eASia4Xg9Y9lX8tbwvo0un2+rgPtzxaHJ3HjnjpNOztPkH8ia96Tmz5wZzgIOASBxhtbGtcNdBm3RIN+MQTX1ykfYs98FESWmD+1j5s0nsky+OvjF0Vl2cJcZJ20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lln9v1Oc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NBo8OK013353
	for <linux-i2c@vger.kernel.org>; Wed, 23 Apr 2025 13:30:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wj+FtiAGAkQ5P/5zChODPkrm
	ZAMKKPl/2U1Ld2vwF7E=; b=lln9v1Oc1wNdBAOcxgSa0NUOSO3GeARiFX0pWfBT
	TB72Ue87DJnryx3NjX+fkfljwpPeSHEttfHNXIMW0hMXfAWmCQz30Qfnr39qHxoj
	Lsz8T5pDCCM45mCE0VL7jq/tReu41HvWK7/F0k9p7WykLE8P6KYjRbdAbVTBQo7A
	RPpPQOoEZPn1+toa5OKpsOVAoTp02EWXjAQ2jnwOR+1nGzmnsNxXz5/jRHpWaMO6
	ZKUigtfJs+ZRGywq+p3Sl08dmcM8y4u+3rlYlzQjQ99zakY39vFtej73yslL+a4i
	J87Hg6K/1RRqiO4kV189DUnc/+QfgYfnPwl/yelkdOc3Ow==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3a807-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Wed, 23 Apr 2025 13:30:57 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3feed36a5ffso1278634b6e.3
        for <linux-i2c@vger.kernel.org>; Wed, 23 Apr 2025 06:30:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745415056; x=1746019856;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wj+FtiAGAkQ5P/5zChODPkrmZAMKKPl/2U1Ld2vwF7E=;
        b=VF3cHdgIfU21lFfNuaNZFUXDJMZhbe+EHx4woe7H5WH6y7egTIElwiqtCsCzL32Z65
         GZDG+R7i1qQ7RBQYRPLJZGDnXWXPTsTe7Lqjs17hHm1MwyapsLCkq4gFQDKXRebPvV/k
         go4ryFw0op+7AElLYUCCGcDTWMYy/GETUZjg4NTNGZwIoUAPYQdWYRF3sbJ/00Xi59aF
         XBXnFhMTnHKAvfUhk/1kgEcMg397bRthLKmrnF1D0Scwa7j+jfLLa3ggBU0uAQAykRZ8
         RExfTiSOYvz575PmvED6X75/0Cx7gweDuflwuMudDw8EWHjkVQpaJ1bvVZQuv5Cj/0Tq
         fyJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZ9LwAhC2CNhS3zEnEI/Z2h1Uj9zaaoCtY5F6iZeDvVhmLN9gxbYSmRUUoB6308zKi8HmrmVEFxRA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqoOg60Jp+myIFZbAJ7KKx6X6uyJrRDz2j1B36Hok6q8/O+Pes
	gAYVJ67rP5FIG5+92HgjhyCd8DaRFl0eZHkmaNVSzvhinoRZpK9HNBwKVCcyz3jkOvs41IuFl/c
	U4MS1boXDrXeyaoSzEvl48if9ldokFz+UTc453f12ayJx6IzwEZHklyndLl0=
X-Gm-Gg: ASbGncvMnUC1P7+fB9hd3ycMnrLOWVpnn2b2lqyPC+kl9JLMug3kXis61SqGghmGvWc
	34zz+80/BhhJyAjVTKHczKg77Hxjx3jVUpkWZvAPet0o8Xp+DCkRRo90f/5ZMZ7HiXeht2yUG6c
	dhpS01Scj3MeGNGgwGiA6+2rNf2dAoiaDvRy/FQetgre3PbHyu+3dJQWddMU/fs1uTZhhzDofQ5
	SzNEdJFu+mS/Q8ReCn1alEnPQH+GzGFNljLOpvSNidSA401uCrAroMOLrrEJiW7TlN/FR0Q+SaK
	2kkQMuHx5uKzWZ08nBnFfdwzKVCBxb6RhU+vt4qEWDwc/2um5w7IcDLZfsbQlIoZgG4ZczA2ICY
	=
X-Received: by 2002:a05:6808:6a84:b0:400:fa6b:5dfb with SMTP id 5614622812f47-401c0ca677amr12197775b6e.36.1745415056310;
        Wed, 23 Apr 2025 06:30:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDEi3rdB2ep6R+cK4PHyu/fZwFAeRdF3OHYastR6zA3OEKUX6hMlxowo/Y01S4Kl8W7OZkVg==
X-Received: by 2002:a05:6808:6a84:b0:400:fa6b:5dfb with SMTP id 5614622812f47-401c0ca677amr12197723b6e.36.1745415055890;
        Wed, 23 Apr 2025 06:30:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3109084e434sm18283881fa.104.2025.04.23.06.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 06:30:54 -0700 (PDT)
Date: Wed, 23 Apr 2025 16:30:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Lee Jones <lee@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Alex Elder <elder@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Andy Gross <agross@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Sibi Sankar <quic_sibis@quicinc.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
        David Wronek <david@mainlining.org>,
        Jens Reidel <adrian@mainlining.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, netdev@vger.kernel.org,
        linux-scsi@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, linux-remoteproc@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org,
        linux@mainlining.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 28/33] cpufreq: Add SM7150 to cpufreq-dt-platdev blocklist
Message-ID: <pywgehih5yrxbnzyjtufkh52xiuonsjv7wougvbauiw2yd3mpy@imcguzi5f7fm>
References: <20250422213137.80366-1-danila@jiaxyga.com>
 <20250422213137.80366-12-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422213137.80366-12-danila@jiaxyga.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA5NSBTYWx0ZWRfXyyRaoOZqbWjQ PTmR67hVdoog2O+BlybSo4daGGEr2BMrjnluK6Ic3hS75iqswV2aR9NgDMmNyhnk0t1HJpKPmQ5 54Vb/1myuSaHHM5iRyT9Pr8UKDA/k6p3G/RrDbhRyzW9KMac1kBCuKfXN/RDduQsFb55aQp1Z+d
 U/AZl/ZPIHppBM984OgWNWVut5c1dKOemuetZHMoZiQYXCWAvCEOj1b2d/1Wpq8XdiT9bTzkx8y HULA01mbQHhwCW3hHFMB6sT7Ev64YI5qKUy80YxZt8decdqvPuOwobbrT+w+2egj/+L02wER3YP HYx/izeJ3atA4WjYdjQ0pb3sOCY0xOWe+13mcpVd5QnrbAVW8MchAwRwUT9sDr8X3y2vxn67enT
 q/PEgjwkYNuCd6DmmpHw6GcSIJhB3xxcw7B9kLOiBHfXcj79A+QohOb0by4jv8i18yC88MED
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=6808eb91 cx=c_pps a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=7ibcVnAUAAAA:8 a=EUspDBNiAAAA:8 a=KMkCwTOw-m2sBZ1LepcA:9 a=CjuIK1q_8ugA:10
 a=efpaJB4zofY2dbm2aIRb:22 a=HywIFdX19-EX8Ph82vJO:22
X-Proofpoint-ORIG-GUID: KKcAU6wzwvoWLhzbCeZvL6ay_NLn-6q1
X-Proofpoint-GUID: KKcAU6wzwvoWLhzbCeZvL6ay_NLn-6q1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=622 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230095

On Wed, Apr 23, 2025 at 12:31:32AM +0300, Danila Tikhonov wrote:
> The Qualcomm SM7150 platform uses the qcom-cpufreq-hw driver, so add
> it to the cpufreq-dt-platdev driver's blocklist.
> 
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-- 
With best wishes
Dmitry

