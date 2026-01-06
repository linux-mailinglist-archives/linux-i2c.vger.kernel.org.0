Return-Path: <linux-i2c+bounces-14930-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDA8CFA2C4
	for <lists+linux-i2c@lfdr.de>; Tue, 06 Jan 2026 19:32:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 850C830299D4
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Jan 2026 18:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61F52350D4F;
	Tue,  6 Jan 2026 18:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hcsvUPbO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DZr5z+7P"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23051345740
	for <linux-i2c@vger.kernel.org>; Tue,  6 Jan 2026 18:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767724174; cv=none; b=lHF9uK+VVsxP9luAtz1qm1HAS5Zj5LalrC0qThG2EL9giXnbMmefDBMLdZGl/AyUT/AqZteJzW5yOlJelLOE/Zrd2ppKUN+REL1EMJ/ncd1iLmTxxK7bDRK1dREZOXKjdOPm0nSMNuUBvNCc8hsvLju+XhCHxvnUh3YJIsz9nJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767724174; c=relaxed/simple;
	bh=EKwgbRjyFc0r5AWUEnHVthwLynoqvUWqfKVMs30yVYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kquXIL0n+DCssg1EzK/DGjAtanLlSMnzyPm/HVgA+rZHqBl38EAA/ioFyzSaY6XcUsk7NM8hkdHdGX23ZJn6B5yP7n3LI6oyBHl9MXYduLOdb5juyUk1wlrNh5WqOar9wMTR+S0+ToED4dbNLKZookv7G5vIuwuhL1jxjapIfs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hcsvUPbO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DZr5z+7P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606Gii9X4137048
	for <linux-i2c@vger.kernel.org>; Tue, 6 Jan 2026 18:29:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=df7CCdKJkxiAg99DIee87WT6
	5pqufwMeHAjkXo8qe+o=; b=hcsvUPbOLiqzS7Mn7GRcL2+0oDRo3kzwSl9vzTHx
	NCgsZoj+3HjQN1SYvAAwtYk3pE4y9EB9xRyiXWIs9+dko0cg5c/BJ25Tp2dMZ5qG
	MPlS7diJQvn6PwbfIKL8LhSwgKdjcd8GAZLl5fknjn1HnYBbg7RhIuIM5ibtn8P2
	wl1umhZ+XK5lvfFrAptRjQ9aYlNAclJAz/eu4xifLVFznbLUDQYiZmhUHGV44h7s
	JFmLVY6P4lppzdtbjV6v7Y8jfF+0lo8URmOL+uKT1gLTq4/S4ehyWgfIhMXRdytw
	ceUYdYRGYMKhVQFbr2afQyub0OQTHS2PUbfGM8Jq3wVMvA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh66e0atw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 06 Jan 2026 18:29:30 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8804b991a54so52122186d6.2
        for <linux-i2c@vger.kernel.org>; Tue, 06 Jan 2026 10:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767724169; x=1768328969; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=df7CCdKJkxiAg99DIee87WT65pqufwMeHAjkXo8qe+o=;
        b=DZr5z+7PNAdYSKAfJ/SfTbqUyIlp/xohcLw6yLktveFOrWxfIWzCI9eZO6ruz729+E
         Q8ilJJMQYAOXLsWuoxzHcnozHuDVAo6rNzK7wVkPnr7woF3WjAExA90yoPpycLxNb6mh
         3AgMKH9gMavMPqGMzcmg8J+DJ0QxSIyMF84/d29dEWApTW8PHEmUYgdI9Z3hhemmTykO
         /F4xRbYiQP0tKt9cXATfQY+2WyQSEV313nFKGp+h+35A4vRkDqgXR3C64FlvH0EAHwhk
         mpOsBZiLjxm6Kuk8oZij1qoEzi5gLm2YbflifDEEGbE5vTvblvQFkzQV8sypMPZ27mxG
         TCPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767724169; x=1768328969;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=df7CCdKJkxiAg99DIee87WT65pqufwMeHAjkXo8qe+o=;
        b=ajc5G6xMOyqVKmF0+5aBGo9qxyEhrx7gGENiSTPzU0ddQTjZwntHyfYTE5qAEQC/2W
         Ugrnn1xa6aLYCd2ok/OzQsYb/LlsVTwBhvK7l7E4CNsl1NEAtLNIiMS2PNQc9kEDVOv9
         W2i9jOgzdIi2/zaUNg5VyhrqDKJypRLGh7WFdLbmdnOn3yUlK4XhpuT7sdGn6r/cdcLI
         a928L9i2K+mbClrWAV1aPExuy3Iv1XUz5c+Q81GAhYVUAb/GZVT0Ck7s/i8tH/aH9u5B
         B9DHuOUiE/4KfWrlDowNYEXyn2NDUcuANKQrDEZ37/1kXqbD/ZxWuMumQSubFkaQZ2le
         wPhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgbBE8S/rsGGv21jE0+Ezf+XEWCOtwvBHWbmqbAtMrlmxnwiwWzmO8yP2sqSIdd18YbL542sJtR+M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSts7p/bv/e5ApXO/wQZPCNf2HsTgT2TDTItUqFOVd76bilBiY
	X3f1C437jxuzrM3h9zc3xeKj5zLdhewx6UDVTkGlHjJKNJ92gMKm44yC64rMJ+V2mbkzq1J+Hv5
	GLbeAx8zu46BC00Ee55RnJZLsVfmXwEveeMnM7jGC6NqvpdpSWkNLO73GxeR4SIs=
X-Gm-Gg: AY/fxX46SvEBpMIw2WwmVn32ZztE/pobqNiDNdljkHpneN5OMMGtyDMQD4Kyw3EHcq1
	mVjtyVA1jAdRdtyIlOdm4EaF9agCO8mIBKtn31QUUsiFkhgPIEk9wC/u7nt+EmtexNeuYcJkFWr
	0AVrJhIQ69riJNcb8y+pmct5I21WwAPpku5DHWmH2YeDWkE0So+DguKM1V6ZVps2hRH7MXxhlAY
	e79Udo4oOIaVbJFGk1BYo00f57Jp+BHptZegdIJ5uCujQ+rhka8svI+VJLLktA17qSHiFpjuUNS
	+2ZuTu06J3aSZbIWvmm/BAGSoaULc4lcpXaA/UiEQRPWmwMRop3FgQtdAGtZXwKqp3zrLWf2Vin
	ICGuzCGXOrzsJuuB9M/rcHt+VvfvtRvM1zpT/ISBmboKCQO9Noh9qYTC8RW8oNSZ5/zRk6YFnt0
	kgjWvdha6MO8za6owONvMIDlM=
X-Received: by 2002:a05:622a:124a:b0:4f3:4bbb:d5c9 with SMTP id d75a77b69052e-4ffa787bf6amr57406741cf.79.1767724169089;
        Tue, 06 Jan 2026 10:29:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHxJN/WZDh92ZrPdxWZQv073OHQmrZShWs/3kKOTTEht6iTJrhYMaZproAIKiVmgT1svYDhjw==
X-Received: by 2002:a05:622a:124a:b0:4f3:4bbb:d5c9 with SMTP id d75a77b69052e-4ffa787bf6amr57406351cf.79.1767724168569;
        Tue, 06 Jan 2026 10:29:28 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d5dcbfsm739376e87.59.2026.01.06.10.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 10:29:27 -0800 (PST)
Date: Tue, 6 Jan 2026 20:29:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: talos: Add camera MCLK pinctrl
Message-ID: <ihuiw4yxk7zqffidhbaixwzxmqgn5xcnt7ernygiuzm6gphud4@tkcuyqzgl6vr>
References: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
 <20260106-sm6150_evk-v2-3-bb112cb83d74@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106-sm6150_evk-v2-3-bb112cb83d74@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDE2MCBTYWx0ZWRfX4NDAFDEPay1l
 U57uqdTfFMCz9IJ01hmXvpmJ6WXsufQrJiMx9MHD3PmcAq6eTBi/3+qHaFQ5CB1VXP4YUqMeZIz
 5CqEtZcfbnf1ahwH2ocIoes5+/7xY99xQSIe2GgNPf3Xe4URiMHpYX8EuHGbDOu78aQIKvWwXzE
 Rex831ojewL/qPXj2vVwJOeOr8fdVTL2hhPigy6Dcyf0hBeIIHrcwDzf9INOOu4Zied0fGls8ND
 kiEfXy8/oJP4ffXdjf09yF4RYjr/GlmC4Qziu9O4isirmb6PtKNbfhvB8LYy6IDaX2LECEH0DSc
 gXWDkkUn6C4wneW32v3Zh0rul/XeYQxU2NHi1fhXBN5LFEPljprBMAsjrGkTztVMP/G613Zaj9a
 Vn7shgqF+uiNrazWNsyl8vWW27LczJEZ6KuHWKYsbiLrTdsNwN6XfTasA0jNBKx2JJEVLuGpVjT
 BmAEZ6072eSO4tppxeA==
X-Proofpoint-GUID: WzMvM7_WOcb_Sm0UNXqrQeQSyYb1KT3g
X-Proofpoint-ORIG-GUID: WzMvM7_WOcb_Sm0UNXqrQeQSyYb1KT3g
X-Authority-Analysis: v=2.4 cv=evHSD4pX c=1 sm=1 tr=0 ts=695d548a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=OD7J8LUZfBhgY_nOwAcA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060160

On Tue, Jan 06, 2026 at 05:39:55PM +0800, Wenmeng Liu wrote:
> Define pinctrl definitions to enable camera master clocks on Talos.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

