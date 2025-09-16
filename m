Return-Path: <linux-i2c+bounces-12972-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB98B5947E
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 12:59:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53AD62A61EA
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 10:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4039B2C15AA;
	Tue, 16 Sep 2025 10:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iyu5PinM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B608F288C35
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 10:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758020367; cv=none; b=l4+hkalbAAEqaPLADz5ZAXo01OH78ZargM/+BYgd6dAVVW9KPgoyUNLsA7PFLAjMzK7flajeV/koPM5+F0odrKKsBNG+GNiFOiEnr6mk2Ay5e8wV5P9KfnaHqwPMSXY4qwBGT7cSMK8PDCJAdfApcXmsElpPPjbujl4dvhfdUC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758020367; c=relaxed/simple;
	bh=3dM7vJjkg5Mx5e5iRX613YlVuqKV1/6CMF1mfmG8ByA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mjb4Kwh8XAJTUioAc1NSY7+EygPeN6/suRx5G2FTHzfEwemWewcPhpGTQ6KgUODYClAx2oN14TXKNYlLjL4E8eOK3FmnlLXwZFaDqSouigyBQXFGqqu0f2UNBRD7aCt+UgClN1kriRqfS+0yA2YPAbUlqMIDTSzGdl3h4/RVPpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iyu5PinM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GAJxxI012590
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 10:59:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mFiDkj+L3cwYNIifGEmZEYEZ
	JXhnfzx+t8PT08ZFf5U=; b=iyu5PinMriJk0GeFWONK3k72LxXT9dlRpzDlwyID
	4isrTtlsPWxGcINhGfRg2Gz5klPHcUspF3zgrVQ+seHHm0GDEZbC3vFJAlvWN1W7
	J9KZCeD8idbZDwUHjhannikKtAwrG4llLAVfqxzB1vfwixDftMI+ZtJQiHpQ4QiD
	vHkr0TDI/RcA2d40hH0TN3wDURsxw6x0VSyS9ieY2/L75xobUQ7HFngo9mMaOdit
	hv6c0eRkZA67mzRSBZQVbHCoSgiDq1QDbtnHZjhaa6JU5Jp3TObH8SJSkVPB08ir
	56dC+5seyG2nJwTCZcx+QaWjJ2DZuxXjJPFFCr5GokZ8uA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496g12m8gv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 10:59:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b345aff439so136928001cf.0
        for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 03:59:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758020363; x=1758625163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mFiDkj+L3cwYNIifGEmZEYEZJXhnfzx+t8PT08ZFf5U=;
        b=PoV868NAwW866gQ4L4GihsHzkYC6TPD8v9e/bSdtaIK6phx/hSIDgfMvhZepUvkPkf
         d5X31H4wSMnx3vuTa7JhdMDDymri0rnTRzphSp5drs2c6B0xBncRyPL3/REMtuF/COGQ
         a1JGX0ArmJrpBKlgBAf+/lHVHJUZ6Qh8qnIJ/dQ0+IgH3PkGuo8HqtNbniwqXvG9L7gB
         6mCXygYLbD85JFpeA37etT2cUvShhJk8EIx2t+ccuHXghIT1RIvGpUfWyIeNJPNZ3G6P
         J0NYu8Sk7INnuewk73iHbU8A6R4V9BF0a2VbvjcqKHltVYmTesl3ddYxrWd7N+KAzwrJ
         Z1bA==
X-Forwarded-Encrypted: i=1; AJvYcCXmKb73iKiB9qDZa39D+zTmUabE/sLleg/fNEvEuAvPJCggF7AQlvNm9AuJm5sU9xt5/OTtVC8SZo8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh5BLSdWl7kMOVwvA5NkmpPZSgxMgk05CU0545jDCT9XAEgp6T
	MlvxPlRpOcuCcigEGJ6Un6N+JVGl+NxkyES56hEbD0ya87ISYR5M7cmIYzVOVi/ZQSAZ7Jb2qER
	8yF0862mHA+j4yWU+j1LD3HW2OLB7vzNnCKP5lVkiGuqXRfDtxJEP02X+I/8A+PA=
X-Gm-Gg: ASbGncsc94H7/vfnx1EFLw2rvPhDSbIKgQfbbnIaxNU7sxXm0RtiNxCJGVKFnIP49gq
	YuvaHAeqGhvjBXrS/IibUpF6Tf9eRZHmyVAuKM2srNGxIGILUyYTCjel+9y9gZE5obU/EGD0Bx3
	jMFLxzKxWGIsN9oGfkAObuGakXVe4U/cebQJf2ULMAsHb/okoeUFlQDJAUqRJ6qEmmZKVhooxhe
	cHFskMjuEJSSHwPp+TnpafETDchYN2A2GnC603IbDWU5rEBnCacjGwIjBGdya6pUahA2VOe6wt4
	8iF1K/+2xz1yqdjxxtQZxeH4+mqsgpc7nT82ZOtztCGH8dZhQrzPSzlbPEqaFfYyjnDTfPoZKkd
	T/UeDBt1rsE9Fnr4JYw36TwHhe8QFzDDwoKZCI6RfR84VPEbAsFR3
X-Received: by 2002:a05:622a:5e18:b0:4b7:8cf8:21a1 with SMTP id d75a77b69052e-4b78cf8257dmr88217061cf.82.1758020363402;
        Tue, 16 Sep 2025 03:59:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDj/hhJ5O4jQLZi/UnXUBCLpKD2mcKKa7z5f6/+2XEQQYMmtnF8am0LXMBESmcmRpgg7zgUA==
X-Received: by 2002:a05:622a:5e18:b0:4b7:8cf8:21a1 with SMTP id d75a77b69052e-4b78cf8257dmr88216741cf.82.1758020362518;
        Tue, 16 Sep 2025 03:59:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e663c5005sm4331812e87.149.2025.09.16.03.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 03:59:21 -0700 (PDT)
Date: Tue, 16 Sep 2025 13:59:20 +0300
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
Subject: Re: [PATCH v5 02/10] arm64: dts: qcom: lemans-evk: Enable GPI DMA
 and QUPv3 controllers
Message-ID: <n4p4www37qz4hw75l6z2opeqks4g3u26brceyxi6golam7f5aw@raandspcihi6>
References: <20250916-lemans-evk-bu-v5-0-53d7d206669d@oss.qualcomm.com>
 <20250916-lemans-evk-bu-v5-2-53d7d206669d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916-lemans-evk-bu-v5-2-53d7d206669d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 3Bwtj4JqiqrFEyr8Mp3v4r8Np6FiSwnf
X-Proofpoint-GUID: 3Bwtj4JqiqrFEyr8Mp3v4r8Np6FiSwnf
X-Authority-Analysis: v=2.4 cv=E5PNpbdl c=1 sm=1 tr=0 ts=68c9430c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=E-8pkxSmLjkzrIbgvO0A:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA4NiBTYWx0ZWRfX+bVSCEmyKwRC
 TMpuxZV96tQtE5iit0XYhLO0uUczOEh3wzwL1Hk+WDUl/ubrtKA/faf6MOnpV1grGvv7vn+U1uJ
 O+60PGQCcfYusq9iELNbA/Dh0oLEm6brCyhj3jtt/rs8pFOyFhcviMVyZl92wGrshlbkz5FCi/m
 K2FR3DvLauNsuy/TCwwXNTzfVd7/WHSxjrx4SIK/mLjWkxAo6N4JuzIac38R7s+pbk4SiSxt6nD
 ss6ybKhRazhzDb+b5DTxdxK09qOmBdj761b6leT3qZfsfLa15MTN8N3EUF+BOymOjZ7pQTcaDLD
 TUqS7yPlxvqkeIXQkiCiM5IOmllc4DBzZelG0tv1YwnXw25d7T+auQUpXUcUG0gplWdLVXYp7nd
 ZisxZyVc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150086

On Tue, Sep 16, 2025 at 04:16:50PM +0530, Wasim Nazir wrote:
> From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> 
> Enable GPI DMA controllers (gpi_dma0, gpi_dma1, gpi_dma2) and QUPv3
> interfaces (qupv3_id_0, qupv3_id_2) in the device tree to support
> DMA and peripheral communication on the Lemans EVK platform.
> 
> qupv3_id_0 provides access to I2C/SPI/UART instances 0-5.

Nit: used for foo, bar, baz and slot ZYX.

> qupv3_id_2 provides access to I2C/SPI/UART instances 14-20.

Ditto

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

