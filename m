Return-Path: <linux-i2c+bounces-12687-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9388B45818
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Sep 2025 14:47:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92C841C2272B
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Sep 2025 12:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09367350824;
	Fri,  5 Sep 2025 12:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YJrdYtEt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E46B26B2D2
	for <linux-i2c@vger.kernel.org>; Fri,  5 Sep 2025 12:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757076413; cv=none; b=iXPYz3IHEDqaO7Rmz9d0FDh2SJZPe2N+07Aq5WRztiQWbWbkQwDvmYaFydO4KejKvQEiPc7nH2JZv5amH4W/ni1SANEhesVJqquihUF3OuqcZOf9UwOlgJWbmhsIu0ICJKtTET+TDAj2S5fZlaW3HA6DQBCDBJUmqN4+Qr/BHCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757076413; c=relaxed/simple;
	bh=WdzrylW6D5k/Tf3MlXm009pxRMhKTuh6CF95xa9C5lM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EHfigLz10TLhfx721glpV4TOQHOozwzT71BFTjXn+FMaBJ3XpO8+5diAtuwoogH89K7K3/aILidJpEcZaTLiT07T6LF09w5UPqfs4XlNXVNpKpVpSxfShSx5oKqw5U7YvWpqHKEGKQeKBatojX2xX0zTrpyYvrPqPIZAKuP8x6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YJrdYtEt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5857E3YJ004654
	for <linux-i2c@vger.kernel.org>; Fri, 5 Sep 2025 12:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1SB7U/jII62BtLsfK3kvMJLkTFF545hw+zs878TRZ3c=; b=YJrdYtEttXAITCPY
	4qYd8AMnHHfAG/l+5jjnZLO8fLK6foNRQnVcZp67dxmdhGF0v7r/eqgP3l46j1sl
	f5jXTVz8d87UBAyagvT9l4cMu2QYvBRN5g2ECHq9bD8vkEfaGxuIJUri/OKQ+q85
	QtWaRis+ADqBGL6KORlALm3UJHwlYbMylZ+hmz5XPCoCFfcEc49ZdUQm8mstRF2W
	4BSiMS/mdr8nHL41mM7cHXDtjDBjwK/G6kiB/rF21aGgz/90cbrKk82TNLYJFmgy
	/9BIYzY6vn1BDyOuw8brJPIbvKsudX6L/f4iZ9XbZtK1P++x1E5r1SlDlIxMhjM9
	5ZH+Rg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8sb8q1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Fri, 05 Sep 2025 12:46:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8051d4916b0so76103185a.1
        for <linux-i2c@vger.kernel.org>; Fri, 05 Sep 2025 05:46:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757076410; x=1757681210;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1SB7U/jII62BtLsfK3kvMJLkTFF545hw+zs878TRZ3c=;
        b=irOojUbcruzMSiMnN4oJeid3ziIOkls6XKzMZPtGkxUh0ayTkLsywzjYGpvSAA+3Rg
         ztpDdKxgPfZ2qh9AJRGzHK3e2XPT0HLAEBiASJN/DduQ5hXCL5LLFogIEaUK7qUJJBDD
         lMLgVIYsta5juDSAffNSDB05eU6mDTNlw6wkdZwmHNBeirvnMET46y3hrXIkEEP0xP0n
         rxi1QZYsxJppN1mBCRsFFS7PXrftCJ+PsYl0SRR1coBEIBnuEaUEiSSlY9nSEICo372+
         EQzB36oR7J9ls962Ye3sRHpecOxD7ykRz+PKbdndrKL7v+/N8wWhj9QszvCspRZ7YSCb
         Tiiw==
X-Forwarded-Encrypted: i=1; AJvYcCVSgilDNZ+D56RR20UVsJ7M4ZLSW+prmeRd+LrAg6Nq78ARapwrPjnm2vZe8AH7p1aom23/qwP70PI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3luaGFgdazDRkhJ9RWOkMkQR0IckvXoCDSye77EL+6DeCQk5T
	od99JcKoYZC686pVp0LaTc9EypqX+uTWnsjJNzsFl+ia32Je3tgfvHZQSXUg7RUG827rEBnqH0M
	6ywaCRppJW4SlKmzO/OASgWZLVQlxEh/P6OPwHov3eU9/kL7LhT4dyBh1W8YC3yM=
X-Gm-Gg: ASbGncurjGfs+49ruNwo00KOIokZetaA/KygNEb/qEEkIKE5shwKuR3afOevtRDG6gR
	5mBS6wEq1Zc9/XMzMKIO0Bt/aMUOUoPjsImEsx4LW/S26vqkZAQ16UAEiSOUVU9SuK3fkXIIvJJ
	7N5I5kn+F45OU+VqIx0ZMYk4BCTU7Y9fE1mI/qAJwgpT5uNmso7UVadQfQqdNhU3DUdEIQSz+Q7
	VJazuRS2lunc3hdeGnHLbnAGeZH+EfNACMRq9qQ2eQQT/bOUF5ybaSs1k69k5/jNRTZz2K64eEK
	vrY9eNFxdpf0pORliXKyJqpf1EEh4+OwV4B2lSO3FewcyfET1Pmap/x9+2xdgyOjzxWipCu2CV9
	Lj+77ZeHxVTzs4CBG3OrPnA==
X-Received: by 2002:a05:622a:50a:b0:4b5:e9b6:c96 with SMTP id d75a77b69052e-4b5e9b60fa0mr18609551cf.7.1757076410253;
        Fri, 05 Sep 2025 05:46:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IED88BDkAu3hHD2gZnrUFPzTysohw+/x37Lmb3zruLYrQfgSkQsU1HdrPUH85++Pzq/cKzFMg==
X-Received: by 2002:a05:622a:50a:b0:4b5:e9b6:c96 with SMTP id d75a77b69052e-4b5e9b60fa0mr18609281cf.7.1757076409449;
        Fri, 05 Sep 2025 05:46:49 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aff0cb2cb07sm1727752366b.16.2025.09.05.05.46.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 05:46:48 -0700 (PDT)
Message-ID: <055bb10a-21a6-4486-ab0f-07be25712aa5@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 14:46:46 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/14] arm64: dts: qcom: lemans-evk: Enable remoteproc
 subsystems
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: kernel@oss.qualcomm.com, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20250904-lemans-evk-bu-v3-0-8bbaac1f25e8@oss.qualcomm.com>
 <20250904-lemans-evk-bu-v3-8-8bbaac1f25e8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250904-lemans-evk-bu-v3-8-8bbaac1f25e8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX8jbcLAGt43xk
 JTPXkB1SANyncqJhzmQLoOunfZVdnwbRsLRExEyDTwzbrIab8ZCH3iVnAH9Q39MYa5KDGq8IUiV
 HAQCYD5H9grMb+wr34cdywqFGS5+eIy565oBa4GHtw/FoKLDqMJM6Jy805w7lWy25yVKUcpzNAk
 80CMbXRORVv3ykgAv7792RUESRgJWkKEppR6Et8FNE3aFvr7mQuFD3PRY3F482qkPHJfdp4SaHI
 7jp71ag/JrGSQLbzftpaZUutQw6ijpAR5c1P/SBzLZRRjAo+3m420IffgatDAMjOse5O++ih+j2
 m7+0ulyxzlxMyxVENR0uIRaw1TdTemIQfeIPfMNnzfx9hqw7opX7GIbBIfu0xgQTwoCesvaCEhj
 qplaVMxL
X-Proofpoint-GUID: nxMCUcrPQ386nVS7p3luoWU0NLG_u3Kl
X-Proofpoint-ORIG-GUID: nxMCUcrPQ386nVS7p3luoWU0NLG_u3Kl
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68badbbb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=3WfgD9H-dY_QjJaUS7MA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019

On 9/4/25 6:39 PM, Wasim Nazir wrote:
> Enable remoteproc subsystems for supported DSPs such as Audio DSP,
> Compute DSP-0/1 and Generic DSP-0/1, along with their corresponding
> firmware.
> 
> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> index 17ba3ee99494..1ae3a2a0f6d9 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> @@ -425,6 +425,36 @@ &qupv3_id_2 {
>  	status = "okay";
>  };
>  
> +&remoteproc_adsp {
> +	firmware-name = "qcom/sa8775p/adsp.mbn";

Are the firmwares compatible? The current upload seems to have
been made with Ride boards in mind by +Dmitry

Konrad

