Return-Path: <linux-i2c+bounces-12782-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFC7B494DD
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 18:15:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B89C3B0900
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 16:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A20ED22FE11;
	Mon,  8 Sep 2025 16:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JWP7pwRJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E13530C341
	for <linux-i2c@vger.kernel.org>; Mon,  8 Sep 2025 16:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757348103; cv=none; b=Dt/fJ70TRF7K3RPYQ3y1NZxNElLhtao9rs2tVbcAFmH6pdWAmxEl46EpCo5/Lkt2PUWskp2yWVevlKm37Zm+f5RGibxbmspmYz7O+7x//tXwHO+QILSOBvr0HM9Q10iwSgFgvgn67+AG8YnOpdM7XhAuhrbDbT1nSmSpsnHsnv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757348103; c=relaxed/simple;
	bh=my2J7ZSJKgwOGws1Hzn3zA5jTkV8FObsyOMISQJ3baM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KuEhRhnpuY/fmsuoQ9ujQwUM8ZME6EMQt5jElIV7ank684CPdEH19q2Qrjz6uO4zTGB+k4xRUrQVzY3tfgXHFvZlbOXnV8pWz/9CQOmBeTsm+AJxLwCXLUvkvXjgml2zBy5pBG+9w5oFgB4+mfjOnZlAhPCDkRl1SOOhncP8YAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JWP7pwRJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58890Df1026682
	for <linux-i2c@vger.kernel.org>; Mon, 8 Sep 2025 16:14:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uNUg7SeCQHOb1a3Kr4zUTJOlns3BsZPwl8vdQ/gvp4U=; b=JWP7pwRJqb/4XlNK
	BSNvvQAQIwgdwBtdYDtuX4xfXMrzCZkoe4s3IuBXiYQ+9P/hGqp9akDdbZ6c9dAL
	iVyB3EjQJp1Y+Gsxs8Yopt0UTQzUfMlo3jfxNEmoqvgfFjgGScLVHoHMsWjp6Rrf
	+rs7Eo2/IQhagay0vlyaCMy4JwQTpZRUiHY1oqXq2glG+jG55s2zJ+QUPVpZQF4E
	NWcB7jKWAwGmcBH+u3gTsUazNdi2+nKGBcmgLxcNMppUfgsr7Gqj6dHX3yfEBQVf
	fwaCklWz40tP12XQt3qskJTB8hHCbHFnQU80gthIPNLsD7d751jx0ExxPhkIUX1w
	BM/eBQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bws5a8v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 08 Sep 2025 16:14:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b48f648249so17215341cf.3
        for <linux-i2c@vger.kernel.org>; Mon, 08 Sep 2025 09:14:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757348098; x=1757952898;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uNUg7SeCQHOb1a3Kr4zUTJOlns3BsZPwl8vdQ/gvp4U=;
        b=efLb8ZBKG0ZxENJ+QvaTlsb1QUpjw3dGReoBCS312gta5jtPBK3EfhNZrK0z2Ivsty
         nc83fLkOEoQiSW8/EWGRmvOGmhRfzOVwiycaGQU1vIYXGzHIdsEzf3y/PuR7YALmOCn0
         fAsSMag1n6TQA+Zjy6tQpXXPXWNOcrA1hzsZ5mrqTztTLzusdYH02bqRrBpQFzUgZpJu
         rubXJz5Tsgvfvuj3Yhg8565959rjejwTZDTDTALH7S55E5PxbG1FJ67o/lu7jGdR19wl
         oHsfSVH8Ot6YJs1sVIqr/xDewmAoY2RSiA8bA1VOmd6WvfWhzHwfXCVVBfubHHaJ9uN4
         43OQ==
X-Gm-Message-State: AOJu0YxNRNsw938imOKfeUfoh12wlW19q5qzYOGrwptmMjDCSGpm/cPV
	1qIVVjuXEZY+KpQfNSfK6v5WUkYDHKY8wqtlLYkG0sOOuf5G7eVtDZJH0t5S2mrIA3QXRepD1Ek
	q7hhws4ohlCan6PJB/8SkcMUe5sREIq4Lq7uWpNKWDYd4YLV67teFCJRNXVjWQVw=
X-Gm-Gg: ASbGncsuccmdky/p8EmCx9HlRirARYMhhWlPmiaNCAw1ZY/1ebrZ8y+HbO6EWr/uAXC
	tPtYSd/uBmRFxYo8C+e4RPdvMmV3N5LgVj+co1gGRoPEWtu3/NG3wOBj+qGbMGOhOCmkOdE6jqD
	6HWPEotVlCiJFSjIcSIcDGR08CDE03Prb+dJQ+REwQylcSLRHzv9EfDguo+wHLNbuKtfaz8rNFX
	fM437znsFT9YQgT5t9ZSH7g8wnABO/OALQr0WyWWCDUksSYvEjaoDPRjn5dgeXQigUB8tcxuOFQ
	7flQ23jzrYODKz5yJA2zWqPcIU0+Q9/48DcmXe0+LgJ/zCRLJdDr2qolqkvOrdYAVeca2jptaN2
	tleRWfpImPXAYWMFoLuNDig==
X-Received: by 2002:a05:622a:1803:b0:4b5:eeb8:9dbd with SMTP id d75a77b69052e-4b5f8389c08mr70178111cf.5.1757348098029;
        Mon, 08 Sep 2025 09:14:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEco+Q/q3RTA++gNO5I3yZ9Bu9pgiKTfiyr/MiXQ9nF5ACsplPzOWYy4LyCZQCEZJJixvAMtA==
X-Received: by 2002:a05:622a:1803:b0:4b5:eeb8:9dbd with SMTP id d75a77b69052e-4b5f8389c08mr70177621cf.5.1757348097446;
        Mon, 08 Sep 2025 09:14:57 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0307435422sm2283685766b.78.2025.09.08.09.14.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 09:14:56 -0700 (PDT)
Message-ID: <0583a79e-d87a-457c-8416-f3a0b240d63b@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 18:14:54 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: lemans-evk-camera: Add DT
 overlay
To: Wenmeng Liu <quic_wenmliu@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, bryan.odonoghue@linaro.org,
        vladimir.zapolskiy@linaro.org, todor.too@gmail.com
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20250815-rb8_camera-v2-0-6806242913ed@quicinc.com>
 <20250815-rb8_camera-v2-3-6806242913ed@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250815-rb8_camera-v2-3-6806242913ed@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: W2hhpplUnVwuezW0gLDXNN9tmGvYMMQ-
X-Proofpoint-GUID: W2hhpplUnVwuezW0gLDXNN9tmGvYMMQ-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX0KuBNa+QHqUr
 7Y3aEfhfWg8Xch5TD8/8/6xVBs9QBk43gx7gpqh4DS0iOS7CPEuAw5ghnmt+N1guzPyRNTcCPNC
 hhOmoU7MQCqZ89n72pNFVJ+ufgLHlYdAbbXYVPealJORRFvgfWPiMlFTv6WfG2yRLod6gfUHE8P
 nfJG9cbrf6jOZzUjZ87SCiZGzIWAPuYolJX8PffssEmk/S2sYj/pRVH/uiwzR9ay0/LQ05HylHG
 19zQrzHVvUTIJX3+th920f4CPI2Yzg8srCFEFMqKxoHBGvh7E+E/7cvMu6YDHM5V6TxV0yBq3Uu
 Xgz1KH4szT6b2cs3FIYAj+1g2Y2re75lt7I3lHxrCdilpJOcQsk7N5hij8PbYJzf7eNJ2Qz0hHc
 Sg8Ne6HT
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68bf0103 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=gJbItJof4LNU2qWXpP8A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

On 8/15/25 9:07 AM, Wenmeng Liu wrote:
> Enable IMX577 via CCI1 on Lemans EVK.
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---

[...]

> +/*
> + * Camera Sensor overlay on top of leman evk core kit.

"LeMans EVK Core Kit", this will also fit in a /* single-line comment */

[...]

> +&camcc {
> +	status = "okay";
> +};

It's enabled by default and there's never a good reason to disable it

Konrad

