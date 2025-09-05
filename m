Return-Path: <linux-i2c+bounces-12686-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97002B457D9
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Sep 2025 14:28:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CE5B3A4C39
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Sep 2025 12:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7708C34F483;
	Fri,  5 Sep 2025 12:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ThIs20tG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734C134F47E
	for <linux-i2c@vger.kernel.org>; Fri,  5 Sep 2025 12:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757075189; cv=none; b=MrkzDkiLyDoTA993XF17JAPVW+WozOliUDDduX+Y6etIkfkE2zSyKDlYeU2C3MydlIoUbz7BsEyW98zU4Fj9TD7qPHt6eAUNai5jge6CO5HW2YiumLwsF4MnYW3/ytD8eyDLPPEj82zAyHWN9lRxR0iwfNmAoTlD4mha0hnRF2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757075189; c=relaxed/simple;
	bh=JkUf2vIGxOiyFPoVNdwA17YFnAIws6TxkLfW0TPXFlI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F4i4V9GLhNsNXnDVKH23FlWzECMNYz4yk8bYKjcb/r48MpezLCZuu/0BuLUmwarvfWDW8KZy+L/TSN+8A/Kp+QESud2Lq384jrfg6i0SZ8tcnQyqsfm6mR0Is9eFbrVQ+ifoik/aTXypeNvlXflvYj4d/YaP5jEXEicV4XNPBfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ThIs20tG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5857TM1m031754
	for <linux-i2c@vger.kernel.org>; Fri, 5 Sep 2025 12:26:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kyI0487W0JqbBUoFU2qAu9jSBfGKKX4t5Zjxjpcd4FU=; b=ThIs20tGdSL4xOLh
	zGd7ULBE2BUErfKiBlNO5oeUXwhrBE5DtRFI2Jkq4mM86mMQcoAuB/N9FtJc4kjD
	5mfvZW3bdqw0RouzAjSFZkcxe2BNrVv16FrN9wXzRhj+DnWzGAH3xS/jPi5LUJ92
	oOg++dYIYcYZ1M7VsEv2krWlmLwpFZ4/a7kSpqFc+XIG3GUr10Y+y7AbD87x5MAD
	O7Ei1ghpuyNUCV3HRSOU+epkRljIFcBTI9qcB+tmk4io0y9wVxKl1GjPMmLAaYj2
	ONYPAV4BUGdA1EOMZfdQPN6jCvjHZNuWi0Q5nh9rHV1ZyIehNux6vnrz+NAn748c
	TtxMhQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw0b5qc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Fri, 05 Sep 2025 12:26:25 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b5f38448ffso44371cf.2
        for <linux-i2c@vger.kernel.org>; Fri, 05 Sep 2025 05:26:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757075185; x=1757679985;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kyI0487W0JqbBUoFU2qAu9jSBfGKKX4t5Zjxjpcd4FU=;
        b=k5c53uy4qzDZ6yCWtRLCFGf1p3ubcsItcdjmnNtvqUv6yu1ZxV2qws/iKJHa1Uq7NF
         ITHcie1jUnNiKI1J3DvNAGx3qXIHX0Tmgen32kpN6Rl5SMXOHUBm8yWF5+vDwWNM/FjC
         k4ZoY0trD6023/VTOlaJ+WcUPpzHk+FcYZqr9xuC3Xb0+YlWuhZeMXuc2M7T6z0YvpST
         2LvCXnURMDV/WPL9fvWSAjmyEqscJrnp//3iaf6HX4iCEZ2cKJmuqS38gI9iJaW4VkE+
         7JInPlUMQsQ9lKjuxSHBzGpogg3/E4KY/vwCrLK6wOitzhnkxxp5arKwssP7nvMvUcT9
         7oAw==
X-Forwarded-Encrypted: i=1; AJvYcCXI4Ixt9dt3Pd43GmvQMZJNrdqArWCyBJdF/+PbTa9Q9Cc6dgjNelsHIGSH3CcKQomWoDW7aFXSPZ0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2MwXvbgFWx7xG5oS9oaiyM9KgP+8XTD0/OrSN/ugIuKpVlo0i
	/PHTVjF99nBjrnaJbB/EUSfyojD6qZSO5H6vkWdR00ky4j8wtci7hUujoeqOwUcWZy/azWuBjI8
	yn1ESKeCx+yPy8KJBnroln28k3N0EDMTUxHec/bz6B7FqSAqGakTjTUSDtKyR+ds=
X-Gm-Gg: ASbGncsNuU7252oFxhnk9XM0E6mz6XKAvF2zNUjlmUoPx2+mQaOW34Wx/9ai6NDQApe
	Uq5dUycC9Y/Qs+YoIeyo14MJKOrP1x2esZB9IfxkY4b0l0VdqikMkKrwSYZj4BNxPnS9xcuBwK3
	+JSf2e0ITsFyIrb7SlHiCPndIB+iybs06tBpUK67s00tUmOR6vf/PYz8tItLwH20BxL5Vac8qsd
	/cN7B5mCh03cpRiDy+vW3v+kiuFBqzyfWW31YAC3906QF8rIXkmOGC7VbL8ipwXLa/r8z1OrYad
	mAU1IBaabVMCMt3/ElfkyBKRoEn7fzQv4fJZnPu/FE69DwDPgo9UR4KR30EQFV6McQXmFXTQrTi
	zlFgnHQE90Ro05JL1SbYKWA==
X-Received: by 2002:a05:622a:295:b0:4b5:a0fb:599e with SMTP id d75a77b69052e-4b5a0fb5d27mr60505181cf.2.1757075184946;
        Fri, 05 Sep 2025 05:26:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHIZ1IK9XJ4FfWiCBoKZm9Dc77t4hxWRO8SKHBZ1qvz1azh9QEBjD3+6lYU1NQiV7h5+pluA==
X-Received: by 2002:a05:622a:295:b0:4b5:a0fb:599e with SMTP id d75a77b69052e-4b5a0fb5d27mr60504851cf.2.1757075184359;
        Fri, 05 Sep 2025 05:26:24 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b01902d0e99sm1546636466b.12.2025.09.05.05.26.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 05:26:23 -0700 (PDT)
Message-ID: <34d9ce02-5711-42ec-913a-772ee744b7e4@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 14:26:20 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/14] arm64: dts: qcom: lemans-evk: Enable first USB
 controller in device mode
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
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
References: <20250904-lemans-evk-bu-v3-0-8bbaac1f25e8@oss.qualcomm.com>
 <20250904-lemans-evk-bu-v3-10-8bbaac1f25e8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250904-lemans-evk-bu-v3-10-8bbaac1f25e8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tUBKgg50n_E7pAQ-ngL6aFU34oTbjtKf
X-Proofpoint-ORIG-GUID: tUBKgg50n_E7pAQ-ngL6aFU34oTbjtKf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfXxFcDrzReej2I
 2NwkMSZU4EhvAuNlwB5vUF4K7/GRnjYWtrUIFcQ86DKis9puw/j7iKevvzCGRmD1m1G3nfclGfq
 w+lgq0beNMdhO/Nfewq9TwfycIXf7g8OVQ+mKcOR4N52E514KzyhhN/TUSsVT880R6BavKxid39
 4GLe+j02v0RwAZ8kMkuZlbqYuxbxNO4n/b0GkBz7vYOfDtKummazd4twiyvlZfLwzUd1KdPJy1m
 c5Yct1oGs+kesEOiwKcCX1YnZg05ikaj+07QPt2OifbV2qM7HG/+JCxvu6RHJ7N04KkbJwXYOwV
 qqQ2J2P1ECA+XJVJ4hxK9m5yMHv42s85M6inB3fxg/48qdh5oajdY91725yA93DS4EnKvbkrgqe
 gjJGlu8P
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68bad6f1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=B3P4ua6ZyXwAq7e7NPAA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

On 9/4/25 6:39 PM, Wasim Nazir wrote:
> From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> 
> Enable the first USB controller in device mode on the Lemans EVK
> board and configure the associated LDO regulators to power
> the PHYs accordingly.
> 
> The USB port is a Type-C port controlled by HD3SS3320 port controller.
> The role switch notifications would need to be routed to glue driver by
> adding an appropriate usb-c-connector node in DT. However in the design,
> the vbus supply that is to be provided to connected peripherals when
> port is configured as an DFP, is controlled by a GPIO.
> 
> There is also one ID line going from Port controller chip to GPIO-50 of
> the SoC. As per the datasheet of HD3SS3320:
> 
> "Upon detecting a UFP device, HD3SS3220 will keep ID pin high if VBUS is
> not at VSafe0V. Once VBUS is at VSafe0V, the HD3SS3220 will assert ID
> pin low. This is done to enforce Type-C requirement that VBUS must be
> at VSafe0V before re-enabling VBUS."
> 
> The current HD3SS3220 driver doesn't have this functionality present. So,
> putting the first USB controller in device mode for now. Once the vbus
> control based on ID pin is implemented in hd3ss3220.c, the
> usb-c-connector will be implemented and dr mode would be made OTG.

Hopefully that's somewhere on our todo list

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

