Return-Path: <linux-i2c+bounces-12973-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 16791B5948C
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 13:00:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A569A2A723B
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 11:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48C182C11FB;
	Tue, 16 Sep 2025 11:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cxxFqk+s"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9987A2877D7
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 11:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758020431; cv=none; b=YrcquwB+Ukcllj8TdCHdI+AnLx06KALyxRDCf6HxIVrKH6spg8LOWrcx0iqsa0wCqWCiSej4DZQUgI3HSp+Undk6+f7j9rpoFFF+F3CrGNOguEf/GwhUpClPAZve0Xw8RaWtfS4YvVW2+f8BCOzSnPUB0q+1osimVK8rqpDLKiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758020431; c=relaxed/simple;
	bh=M6Zqo8Ymcxu6eRx/7fcnIg/xojiXutzI75zXFiJxqNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gV3UMI2Kmya0Kxhs9ymxasf/IN/Rql1huxqMSaKu3XUACrihnR23eJhwSIRWeVZX139w+dAbAve1iGq3o2Yvd/sLjRmrYUbfCsFIeYSQRsTmQE3tqmyCHJgEZjhKpc9LKzbx59WpplmFYasu8jjhMuqWeEd1fHedndWBkg5bKbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cxxFqk+s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GA6CPm013393
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 11:00:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vH/Rjq1TuanzbCVidX6mw4sX
	aElF2T/40jPPuQxAJJ8=; b=cxxFqk+s3TclutWcPBPpzYKxUvMqL8f+BX1NlLvw
	ABaC7fj13xTysRPsNiqHutQuPgUXUfajjvhnPcgnpF3yFjWIDJC8tU0AofVVaW8q
	b+A2/WlC8ytZpKXSJSWwCR9IUSv56vUbt5zYFwbxV8qRkdMEIqNaNVnek+qeUd3R
	aOyLlZ0T9sbcnTkZsSV126/F7ICaKJFIN8DwiTUrfEiT+ksKZDUAgIKXUmLOzCSG
	tpiEucz+MK2winOlvCc7US0oDuiJqYqr+hC81zk5kAIZkcezCUHAzvC4kZqAtD9j
	aW/LUY5E9540RHna9YvXk3SxcXqqWJMQtGOJL3t1alw8/w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496x5asqtf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 11:00:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b78fb75a97so33390311cf.1
        for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 04:00:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758020427; x=1758625227;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vH/Rjq1TuanzbCVidX6mw4sXaElF2T/40jPPuQxAJJ8=;
        b=UCYhFPDMjU6SGU6WOUHoN+zz+4Linzw8dtO9ASMFCGEmjsjdzurVM61S21QeyDOIdg
         se5zn4AdrvdGcpMIVlcGPsKGJW5vrq1c9EtRn2DYBVLCdM7SqhMdfVVNz/Hq+u3q7L1q
         F4VH61FtAbuomUTuNWb2qiapH/bJhmcRf5pP+HJPYKx0DKOZx03RWf+w6kvatnTJOEkw
         0NCVyMeU+1Z0TxRDNIRVBJXyu6Y8BnreWhGUSWYqprvSmRlFo2xnGnwdrJlieHReE9sl
         yv6iIeNR0DK8INAqAo5ULP8LDzxBfUKcK3VNkvajjc5zSmPS+jiCenHp2Q2qvHs5C8XL
         eNaA==
X-Forwarded-Encrypted: i=1; AJvYcCX2XKi2B8M7LUa4OgAQEoBy1iCZ3TtQKb7Vk/YRbBU1j8N+kwgnNBgvBdmECcsrQ8DO+zqbi0EKVqE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhTn1QxtmzSDEztjg62jLimWdCaV6Gy2KSFDFLoN81YFZOwUnM
	ZWUkGHt822YkTp42NF+jT8LZB4IjtE0fTsIDwfKq3ZNdTucYaUQeveez1jmBrWHEcQLk1cb1pPW
	ZbEMIARqfsWr+D9D1Xz1rJK54KHbrKiuQEz64n7xXqUw7tTq2M02ZAu/6N9uugUM=
X-Gm-Gg: ASbGnctne/Tvz+kP8voFrKDRlF7e8GYKVx4KQzKOrM298TfzEyfJJcYEMdvW2h+wjKP
	eg5LH3aBIwY+LT6BtAHG5/NhSBKQCQ7QlsNr9k4uG11+GWmsWcCNHV34XvtApucjvY53NjFv8qR
	rfvjvn1MU/1wZSz23Co6+3JjPQZrWuUwmoQ15m3+Ktgpd5+I1W6ly9JUxDZzGwL5lzdK7/hJDxG
	jd6WSyy4sZ/Hkpxi9inpGHs5c+QG3cI/Q0KpklSfwGFjX9zCi8r8qjJK2eWRE7+JAgBYj/nHg/K
	Ni5dw8lS9wSjmEAEyzo1a0UsxAfWufgijI0dSQr2GMD7DIqDjBDfDycEaRfY4cb3pQmIGPjlCjL
	367ZIPRqEMx1CXr6ISvL0QCgyAlpQNSBFYD/LAi7HfxO5yD+BHZQa
X-Received: by 2002:ac8:5d04:0:b0:4b5:e12b:9e1 with SMTP id d75a77b69052e-4b77d0aff86mr159715041cf.60.1758020426789;
        Tue, 16 Sep 2025 04:00:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEqyqBzvf06O0P8M/2FvHMvziCp9UQog00iNc315yVML3/M3tQIwWCuaULaNoan+pHArDzpA==
X-Received: by 2002:ac8:5d04:0:b0:4b5:e12b:9e1 with SMTP id d75a77b69052e-4b77d0aff86mr159712941cf.60.1758020424897;
        Tue, 16 Sep 2025 04:00:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e63c63d9esm4235593e87.70.2025.09.16.04.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 04:00:24 -0700 (PDT)
Date: Tue, 16 Sep 2025 14:00:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, kernel@oss.qualcomm.com,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v5 06/10] arm64: dts: qcom: lemans-evk: Enable remoteproc
 subsystems
Message-ID: <kq7dqqjaw5rgdx7nubycj3wuwqor63e37vploqw3efo6qa4oir@faorattts2vs>
References: <20250916-lemans-evk-bu-v5-0-53d7d206669d@oss.qualcomm.com>
 <20250916-lemans-evk-bu-v5-6-53d7d206669d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916-lemans-evk-bu-v5-6-53d7d206669d@oss.qualcomm.com>
X-Proofpoint-GUID: KgoYlcCP1unDM08hmxaGzAj9p-bsTFBb
X-Proofpoint-ORIG-GUID: KgoYlcCP1unDM08hmxaGzAj9p-bsTFBb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDAxMCBTYWx0ZWRfX1CME7bUoVAs0
 cHSmOr4StWauZ9a5zBkHvPbI9guS0zIae4/Uec/N1tzOLtVVPU3eeJbkFOrAHwtrM5mP9YrASoe
 n3cX18SFxaOkTKb3S0Dnms7c3G8jk8zItZ3l/9G+4b6ysGq0+Y98dA98JYqYxhC+a5YJJUxuk9+
 vT/5gMRT1dhAiZ7nMtZVu5AbUBcW8NQHx8QxkXxFrO0ZQeNTQ3pAC0DXgbeD1kHChOtzNEgxh7f
 tQOWhYM4LMhOPHztdblFKqUXuqYQEEBDGHrRXX1m730wSnvEBMPuum5/SwCD9sUvpjd1X8Vfyhi
 wIC4T1Oc7ktjo3wIE3zPsv0CKaMF0CMly+xl2JvVnvbnTyhC+uOtWlxOnVMj+i52yzIpSZVHtVT
 pVLHCLxE
X-Authority-Analysis: v=2.4 cv=WpQrMcfv c=1 sm=1 tr=0 ts=68c9434c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=woMd_khH0HIeFH28_EQA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160010

On Tue, Sep 16, 2025 at 04:16:54PM +0530, Wasim Nazir wrote:
> Enable remoteproc subsystems for supported DSPs such as Audio DSP,
> Compute DSP-0/1 and Generic DSP-0/1, along with their corresponding
> firmware.
> 
> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

