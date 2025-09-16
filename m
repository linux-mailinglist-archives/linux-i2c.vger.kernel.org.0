Return-Path: <linux-i2c+bounces-12995-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC87B59B98
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 17:12:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E386E7B65D4
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 15:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44B95320A38;
	Tue, 16 Sep 2025 15:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JL73Uz32"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28272D73A6
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 15:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758035507; cv=none; b=lvVovSSXyjRjsTNZqCTUUuIbkqVN8kroWOXHwiI2w57Zkp/ytfD6bNzaCk9xI71C/HNQYKM+zKmemYUjnqH+72cAhimD4ly/Z0T8DsIFvReHlzO7ChhauxreIF1PrLh8N6xIOvLfV2ZzSZVQj7R0BkA6flw+sfc0qLk/zl1VedQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758035507; c=relaxed/simple;
	bh=t7UUwd4xgMft90yTMEDkSkQCO8HRauBhf0Zx0laARP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H/idK73Tp+XlTSe/2Rl5k9/Kon+IjhRcNjxkAUxewK77xj1Jj/8YID9yizAChhS4FzCUManw0i5I9SrsvuZ7LL1vANRcLqZ5t9vVDnWBKLtnpoDjAjdNKqgOK8Y+x4BB2ZJgR2l+18pBVtiiBOuRFvpuH6iKmRqdGJPeeSwyZU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JL73Uz32; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58G9btCt001512
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 15:11:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TNby5qq49hfo4o9k//m3Xyh7
	0OtDv47+M1YG9MtLCxg=; b=JL73Uz322hjo7db1y8VK6MOqpZS/kNSXyhblTxji
	X/8ett4qqsRTgS904srclOUiORO9cUQ6fCNQAdqVvbcsd/FpA1QncRkBfd94o/9A
	ayIVhYJNJflxOOTiId6jWan/mBB5kLQNYuopyYXUUqOWrhXA8sAyxX78F0XvlXJG
	pHHv0lRCGDuOZLzhNvBwVoJrRRHia2ITx3ocbJdXEAH7TxVOXS2Ot2X3WxnxRsKs
	w1eOZm7vGwK6MbzBwazgwh3l3yTmEKfroCsKUCamZGZk1e5bGDicRtqDY167Q7ag
	Hs+kbQDaAo6941gLLkSbxgZDV1ZTBANlxA4/IP/V80SL4Q==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 495eqq0a1s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 15:11:44 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-54a1b15504fso1448123e0c.3
        for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 08:11:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758035503; x=1758640303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TNby5qq49hfo4o9k//m3Xyh70OtDv47+M1YG9MtLCxg=;
        b=cW/xsnwD/mxrYUdVb9B55G9rzyJ+VesW0EIRTDBWlDCa4nHwZoK3sWWnYrc/Kcew+D
         LJ4O9YqI0JxQXR5i/qwejGWamy2vxZJ0YcB/z6SehM4up+3yeqSe/iVpgcXmWqOnV6I6
         cqJ3DisThY4YPjCQMmaqmwqEBkxpZ6r8aUUWeLF7jB+pE2S1/rQ+vbPGZ9h2t9OugGkF
         Zvw+qRfHQoOAds9yNiCccSUTLrC0nWOP4eJuD1cLNUaqKY72mE8Q2rgacO88IQJ/7If7
         Mqq8p5uWmM8if4FeDcrH1CdQs8Y8Sre9x9v7Yb1ppt4E6xlgFc5ZdLTSGKSBaPLMYrlk
         tOlg==
X-Forwarded-Encrypted: i=1; AJvYcCVvxiAonE6iEBAE7oYZ9bfCNAc9FtVQBLdKx/vwxWjQjbBMYf9G78q7iFskZQdr/kIQceLqNqHr8y8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHJ75XbRq2vQiOITKfvdk6cD86W8okrKD2WUT1O/4cfUWoPvX/
	Sw+uzRIXIQWl3Pc+XB99eaUybKOL7E4BoxwpjBToWmUPJ885u2Q/VXCABpxkGnsaUM3YOQk23TG
	JN/K7OYs8H/Rsr6eMaWV79I+5WPDRQmfi8WliNWECn5Ahy7Iq0E0vWpd5ATCwnbM=
X-Gm-Gg: ASbGncsETv6vKy74q0AmvtVzvf50e6vi462zawmlffDFFeaCd46GfjBMQfRNPLal6sO
	nOCO4AxoeSLEmJjEQkqp0rrZhApEbxdmQFe8BVMl07K7wjtlJTo7wrc+3LNQQw1K3kMfYehJTHK
	urBsGGxFpZ6eJ9itzv6zVRCxt3/yQ6EjtzAGAUkAQdD5ekw6kE27Nf5HmUOweB4o8P49ubkhtxX
	cLhav+PGQJmWarR+lVjENjzhaFRcl2LXMQBOOU/d0eALeclyXmGXuxLR1lL9mXQpxns4pWtGUWv
	oZ9l07HbzOztxRLs0w/jOdF464o6DrVYb9h+VlgLymbAXsqM/EFVxG8Gr5mWUD1686gNB0Ic7zN
	5ONSYbjAD3Al5OA50rCZZ0RK6p8U0iN4GDoEPdeuVOGcdB44n05TD
X-Received: by 2002:a05:6122:3bcd:b0:538:d49b:719 with SMTP id 71dfb90a1353d-54a16b2c285mr4799750e0c.1.1758035503262;
        Tue, 16 Sep 2025 08:11:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjpODeFy3ymdDzfM3pALWwp0engqNOO0v2fjb8KygHwUWmCU8dovGzcM73w2iuBtRoo/d/ZQ==
X-Received: by 2002:a05:6122:3bcd:b0:538:d49b:719 with SMTP id 71dfb90a1353d-54a16b2c285mr4799705e0c.1.1758035502721;
        Tue, 16 Sep 2025 08:11:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-35828d19a04sm15474721fa.9.2025.09.16.08.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 08:11:41 -0700 (PDT)
Date: Tue, 16 Sep 2025 18:11:40 +0300
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
        netdev@vger.kernel.org, linux-i2c@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: Re: [PATCH v6 02/10] arm64: dts: qcom: lemans-evk: Enable GPI DMA
 and QUPv3 controllers
Message-ID: <pwnt6obqsyq3o2qzqk5fcydzlhwv7ycmywvdeo5pwhvt6kbw35@ce36yjyo3hp4>
References: <20250916-lemans-evk-bu-v6-0-62e6a9018df4@oss.qualcomm.com>
 <20250916-lemans-evk-bu-v6-2-62e6a9018df4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916-lemans-evk-bu-v6-2-62e6a9018df4@oss.qualcomm.com>
X-Proofpoint-GUID: EwcMXMy3oXBH-1j1uwWLsI2cbriZclnj
X-Proofpoint-ORIG-GUID: EwcMXMy3oXBH-1j1uwWLsI2cbriZclnj
X-Authority-Analysis: v=2.4 cv=XJIwSRhE c=1 sm=1 tr=0 ts=68c97e31 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=lcEb1VsSqg0gz2oZhFQA:9 a=CjuIK1q_8ugA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDE4NiBTYWx0ZWRfX4hoWQENWdvR8
 BZCD8bhedifN+R/Ofct1eAElvI/utqOQsvYAmOrgT+9z0X310uQaZIeWJ3dd3M1SIj8McRASyyA
 KFYLPsSNDrjdror2tOBndnYhOQuM9C31Oh6QcedRyP4/k1Jtn7SbZgMY2e32mnwT3nCmiU2aO5/
 HReWs2rxocMKdfB37xkGDR5s5TE9Zka5tdBAlE9VZivB+wj2NR2TsctRK09HVI49sywogWMrgjJ
 cMQcCHC0W11Oz4/6hzSyk8XKWY69//NYiZrPu4xbwma3JSPPF4XZbZauR8s2GY08ngojzW7P/xH
 WrdJpNKGimQWvDmZ3KI8Xs2j/SD777mkq23RHfHKQAM2+Bd6940cYc8MH6bWZLuYZHf1ZM/MGVx
 6gmPdBP8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130186

On Tue, Sep 16, 2025 at 08:29:24PM +0530, Wasim Nazir wrote:
> From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> 
> Enable GPI DMA controllers (gpi_dma0, gpi_dma1, gpi_dma2) and QUPv3
> interfaces (qupv3_id_0, qupv3_id_2) in the device tree to support
> DMA and peripheral communication on the Lemans EVK platform.
> 
> qupv3_id_0 is used for I2C, SPI, UART, and slots 0 to 5.
> qupv3_id_2 is used for I2C, SPI, UART, and slots 14 to 20.

Don't rush sending the next iteration until the discussions have been
sorted out.

> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 

-- 
With best wishes
Dmitry

