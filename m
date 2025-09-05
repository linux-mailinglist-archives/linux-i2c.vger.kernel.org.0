Return-Path: <linux-i2c+bounces-12682-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF1FB4573F
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Sep 2025 14:08:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0DE11BC25A2
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Sep 2025 12:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB39234AB06;
	Fri,  5 Sep 2025 12:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OcFxGNNr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E41134A329
	for <linux-i2c@vger.kernel.org>; Fri,  5 Sep 2025 12:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757074078; cv=none; b=l1dX2sdgiC2zVWLrYrkRLYNFSAn8plK+yoYKoBDUQANBEo2SUX5PFjcON+XjLR7OMu8QPG5wnRcZ/Lup6jHko8FRurmsfR/iTg1V2S0Cnl/L2aJPZ72u+HZEsMs+TLjlTPVZWHvB/bGIxt3ZBQ8e2KG7I88Iqpbm/HE7puy4ThY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757074078; c=relaxed/simple;
	bh=qlohNMfmjA6RpvE7A5Xc8gTHqy7dxZ1ZxD7ony9bB2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XuM82ZqgWMF9DtB8nqBR3oH4j3qcQ2Wf2EPEjg9O4ThZJcFo0fq7jb/ZuQeSkGCGm4TJLTSFj/a0pFoA+7js5oK+5bZXLlSwXmHhwUNoTG9gZsgUbCQFASMfy+H44ve6R2D2JKbG+k0aJADe30eSMPGBLBBRv408+SP7/bg6pD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OcFxGNNr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5858ofQ4012061
	for <linux-i2c@vger.kernel.org>; Fri, 5 Sep 2025 12:07:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2ywG7DrxAJyha9p1n1s1uGe2eRAGhfx1UZDypRxMjFI=; b=OcFxGNNrlOznCtwh
	oW0F1GgSoQZXLTjJ5VCCRB5O/5z+rVjokRTjne2CkLvlf2U3+z/3ePAoFDGAXjcf
	FXHbC0uDw24SW9cWIUpeCK+Is3y75Z41ae6kb5//rXQdnn+ELvRtc4sKa5OEs5cH
	d6/3R2AweOCRkOiyfjXbWGh9Vn2bE0MlA/mJCS3eOA1cmXZlE4gCZ2fAnGCjpQ7O
	y4G4yuqVfdmXW/pNOwv2kffoJIZhz3k8QxDqGakw6P3yZSsOSqrEK5d28cWWNNYM
	gyJQw0rulMJlu3n3gblmXPtO9nrmb+XYByklAk6k3YkIwz6lnSGk0arBydqDeE9z
	DA5KiA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk9awsj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Fri, 05 Sep 2025 12:07:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-812a08b8254so5556385a.2
        for <linux-i2c@vger.kernel.org>; Fri, 05 Sep 2025 05:07:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757074075; x=1757678875;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ywG7DrxAJyha9p1n1s1uGe2eRAGhfx1UZDypRxMjFI=;
        b=sybqD958Wi09m7vWSMwfonVLnfwB2VoMsQySi03SDRFPOk3ji7EODo4FkEoIWa6qDh
         FBMVHzyItG5JHcAnl14xWz9NizdY1YBDwjrBIsOphh7Of7iTkBabaiDd2aNemTx6+sl7
         GJU+eV4OuXKNW9DTf0ZuVrsBzXRix5kx4gk3N0zzkoyb/V8URvvzCupJtKlEeWwyzW2i
         UnlB5/jKd4l9meLSJKRlfyx0NrKchWVNxRWQ9tETyyPgqpqnB875dOHHZ5bHqJfdY61O
         G7fQQaEbig5jXIOVYB+ckVqYX/GUq4Fh2OGptaSJ+sI0zcuz3zdluCwwIGnQ7paM9qTm
         uu5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVi7tMWv+sZSCzXoJP18wuedaHFC0Jza8asMR7gVSiHAkrXothh5t7QJXPup9sSPBh6pqLQzLktqbI=@vger.kernel.org
X-Gm-Message-State: AOJu0YykidFh/iAhvXP/eaNFxwVXlyuVFoQSqeP8V2ZNGBFSKqa8Y7pI
	D/S9F8wixE4ghBrhm97v5TxtC4nCvUi03KNZKYPD1YgfPbfzXGwmVUYg04Uc0jP4ydwrjpfKSJz
	LIoaTQ+BrPKMrmpdcZnpZY9Y2ddVwxQUqoj5cx6tOpERoZtjtvCdFIWadThRvEiUlFTg+hAg=
X-Gm-Gg: ASbGnctyP+TkFg8tZvtgGVdJ0C48EYtgDVzaw7dW33kEYtAXv3u9GsZtVq1HQiiGYcT
	OuXdjDOm/i4khjwfgjF+YxCQ5SEqkygBqByqyVPEyfG0T0h+paEUP+eUApnElnk2LL+AdcLAEhO
	Wik7LLJh8RLqgSNIKmDBIXzgtIUmYiBPlolHc7B1XoC+aUbUNkSu98HF5WALGqTaRxarlSp0VG5
	riTXvFo4T0LIQx2ghZ54NNMCGfDChRqIVhGpqdI8aNt7E9xdus1OYQNwoZyQP2X0x31dO+uM1CI
	c9vlpiL+urGN1wpwsOvoTCsmLiSlbW8otNLVjVa2w+lebsSepuf1rz6dfPBEFuq9VXRkKvHXjnJ
	sMWWmreaqSGE8DjqHh/dzZQ==
X-Received: by 2002:a05:622a:450:b0:4b4:9d39:3432 with SMTP id d75a77b69052e-4b49d3935cbmr67851331cf.10.1757074074414;
        Fri, 05 Sep 2025 05:07:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsdeBb4+ojSZLfqlx5FwAf1B8QozAeBTYPMWIY5jTEhRL6G68cKRSVMxgkPGjlTzVIJxN9Sw==
X-Received: by 2002:a05:622a:450:b0:4b4:9d39:3432 with SMTP id d75a77b69052e-4b49d3935cbmr67850851cf.10.1757074073738;
        Fri, 05 Sep 2025 05:07:53 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0413ee67a3sm1405722666b.24.2025.09.05.05.07.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 05:07:53 -0700 (PDT)
Message-ID: <e1c593d2-603c-4c3f-850a-07c14467b8e9@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 14:07:50 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/14] arm64: dts: qcom: lemans-evk: Add EEPROM and
 nvmem layout
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
        linux-i2c@vger.kernel.org, Monish Chunara <quic_mchunara@quicinc.com>
References: <20250904-lemans-evk-bu-v3-0-8bbaac1f25e8@oss.qualcomm.com>
 <20250904-lemans-evk-bu-v3-6-8bbaac1f25e8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250904-lemans-evk-bu-v3-6-8bbaac1f25e8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XTwRvb9PpZFCWc4TOBOZV99j-QzIQv1d
X-Proofpoint-ORIG-GUID: XTwRvb9PpZFCWc4TOBOZV99j-QzIQv1d
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68bad29c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=E-EgujyPmZ3s1dcs9ZUA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfX79lLwb9idhED
 O7DhxsEl35gpLFyypuvEoukvutDJOGVmyAvPWCriXCXlq5P3CFJYqpE6IPWOJQlkmwPt11nkI5z
 ZKnNYs5YHZo4DVZ0dFS5CgWfLZI0GRj4JHJydEkYBRhQxD0nTsKkcsfGvnB6hSdQYh+rzNiFcjf
 pWV1jDDuBKQMI5iLD5xccfv/OtfMneRYCEkF+PITJYA2WdzcRLvSBnlyQxTUKP+XSKYfiUrq/Nv
 MY2mX5fWfRTGp7oZjE5gNoqpnKP5EymVOVSNuKxG4yIGdqBkOoyHNmyzDrLqnCicpn626kmpKUF
 tw4wmiZpZ9ebDS8JL+hrJLn0ACqJkYLfvyMtEHv9ryPyfxuE7u21yDZaFH9GKHnR4kj9Dftawud
 ub0YpcP8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042

On 9/4/25 6:39 PM, Wasim Nazir wrote:
> From: Monish Chunara <quic_mchunara@quicinc.com>
> 
> Integrate the GT24C256C EEPROM via I2C to enable access to
> board-specific non-volatile data.
> 
> Also, define an nvmem-layout to expose structured regions within the
> EEPROM, allowing consumers to retrieve configuration data such as
> Ethernet MAC addresses via the nvmem subsystem.
> 
> Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> index c48cb4267b72..30c3e5bead07 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> @@ -319,6 +319,18 @@ expander3: gpio@3b {
>  		#gpio-cells = <2>;
>  		gpio-controller;
>  	};
> +
> +	eeprom@50 {
> +		compatible = "giantec,gt24c256c", "atmel,24c256";
> +		reg = <0x50>;
> +		pagesize = <64>;
> +
I'm not super happy that this would be the only line of defense, but
you probably want to add 'read-only' to the eeprom node (or not)

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


