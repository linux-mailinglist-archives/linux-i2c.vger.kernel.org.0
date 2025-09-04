Return-Path: <linux-i2c+bounces-12646-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 61464B43FBE
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 16:56:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E52007B8B1A
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 14:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D4DA304BDA;
	Thu,  4 Sep 2025 14:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KEjJOXZh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72C1302CC8
	for <linux-i2c@vger.kernel.org>; Thu,  4 Sep 2025 14:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756997801; cv=none; b=TkrKhhayLD5JSc+VBsbQYZcQGhExBovmpFO82yNFts3081EsIjl4FztUquklokiH6S08jcY0RHfryRX7BEP/HVun10h9UiiasiyJ1d9ESc2nfkDRVHPviTgTEkmmaSgy2VFde12ngZnNwVN1B0cYg4e9wINfeyAuHbDZwawOo68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756997801; c=relaxed/simple;
	bh=ZgJ9kzqD0PMG1LADlO6mUBMdemIt/OfOhX0BVt61tn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uY+Bun1/gbQKEuP1cQeuYffA6j6JqyAMkNDWVEXUspD8a/qr5Y9I1mLOkQNmMSOm5su1t8YQTm+g/56h3Mu6JciJ5Mv2SvKMlionV4le17thq8YAIYWsk8AwNFvJWEOA/90Jj52wcqmv8zWG6ZVMqmgxDrq6+SGMFk9DUuK++po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KEjJOXZh; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45cb5e5e71eso7190195e9.2
        for <linux-i2c@vger.kernel.org>; Thu, 04 Sep 2025 07:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756997798; x=1757602598; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mAvtMvbpag1P1t5n4MNNRTUhp+vNJydkntuVQmj0g54=;
        b=KEjJOXZhtJGHKiCVFnIlIfcaaIajagQ0K1BXsGM2b1adrLGdadq/8bkXNdulXEZOoX
         9YjEnwk2JwYei8kMbu4D8mt4wdZoMV1IbkVziZgJo4rWl4vtp3WidtgQL2NNbBlJLnJu
         H10Z0PMsuBvUxcJKVYQP5xt9/IxYdH3IxI/fUqnrV61aCjvi/OIRozT8rYhyVG6saVEN
         XlXUsDyVFManETZ7Q4vxnj0dWGORDoTvQKL9Akfiewnw/yG+HTQTEQms4XmPzIRqdodR
         /wBnJkGa4MYhll8V0V1qmcxVUKKob24zalmQG8ixgFTlYCQm80q05xKvQ1LxlXVDAFpU
         N0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756997798; x=1757602598;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mAvtMvbpag1P1t5n4MNNRTUhp+vNJydkntuVQmj0g54=;
        b=SAaOGp0nk0bjMqxiMYZvzFz/B8J+yAUluxWq6cqTkgtpFHz/zOq/ISZq1+b1lJzKDg
         VZ1VBlg1tnGW6fW8F4EkuYlj9nVjMIbWALu8v6a2Bp1ebXmVDW/OmH4JDtmgwKvreJhJ
         0nlTPlk7xByVT0symg0vicUa1Xcxv/ljMG50K0JB87/axWp+E7K2SpfkgrjmYSRpwwUh
         m0yVV1d6tJAxTyqtxQawzz1mDgw2+dh0yp9u7+hCNL5nOO3R6q11q9ZNLYmN5FiksxA4
         W0PMSJlyUtnl69WHIwxIqmU6lw174jxnoQJUhQdVpC6tPyjbvzk7HXt2h/ptsu2LFwyC
         r7bg==
X-Forwarded-Encrypted: i=1; AJvYcCVcG40MbYy5FvWaFXC43YOrdEeHgC9s+/WRUPe22EMS35SEyBWR+mrVseV0lLNrJQzJ48plvo9DO0w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv9Ea+PMdXqtE3cRY3aPP/DAUdQJKq5ydiL1BixzFPqRp4B/SB
	pJQe98gOUtKapr2FNUtk2NNne0TWYODN+cmpdMQ8d6EL1bMPPgVLGr4wVYcpQv23JCc=
X-Gm-Gg: ASbGncuSfpKQCuJTX+gSv3GxFUsOgo9BzcwZrfwLhDw4hd8XZPCiPe0qTeMcPx2UCYc
	LZOzsjYyu3m6r9DSap0sw7lcHgrHaThFCHBMFvzXQVfrF5LRVRHw/2aR6JpqK87Oa7mL05vBW06
	XT0WOB6vcYIlYMnDWM6WCHng+tJAzQYW+MXCxD6cQduyv0pvAE12DKV73VmhizrOx9nusCijusd
	sDNWZeX7aewIRK71sHrwQYxZ3MeSqwmUK8uLqe5OtH2WruToBvbphpcCs0R6rB562gt4mbRKQ80
	V7XgkwjHj8wOsYpic1id5M0uDH5662VtLvVsz0eUX/oQ3WD9SORDWrYXBA4Hhkrbive+cQE8WT+
	GWXGyuJJw2yL1WpX4fGvgCWxcqDJ+nYtpXXnzoRYFLrr9Fw4IOTerREkyVH5cAIGVaZntkRjSRI
	gYIT3GUyo7Yn6K1+Jo5W0=
X-Google-Smtp-Source: AGHT+IHsQzqLy0ydpxrwsgY1FqsNJlfNwe1T2aG2lvDjkIzbpWCbYkB2877CRZ3PURf2lYrkGFbnLw==
X-Received: by 2002:a05:600c:c4b8:b0:45d:d403:332a with SMTP id 5b1f17b1804b1-45dd53df7e4mr5247225e9.32.1756997797960;
        Thu, 04 Sep 2025 07:56:37 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd3aadbcesm15507775e9.17.2025.09.04.07.56.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 07:56:37 -0700 (PDT)
Message-ID: <548b3a0d-01c0-46c3-aad0-a820447f86dc@linaro.org>
Date: Thu, 4 Sep 2025 15:56:33 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sc8280xp: Add OPP table for CCI
 hosts
To: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250904-topic-cci_updates-v1-0-d38559692703@oss.qualcomm.com>
 <20250904-topic-cci_updates-v1-5-d38559692703@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250904-topic-cci_updates-v1-5-d38559692703@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/09/2025 15:31, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The CCI hosts have both frequency and voltage requirements (which
> happen to be common across instances on a given SoC, at least so far).
> 
> Express them by introducing an OPP table and linking it to the hosts.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index 18b5cb441f955f7a91204376e05536b203f3e28b..c396186317d49f411d7162771a358563329a02a4 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -391,6 +391,15 @@ memory@80000000 {
>   		reg = <0x0 0x80000000 0x0 0x0>;
>   	};
>   
> +	cci_opp_table: opp-table-cci {
> +		compatible = "operating-points-v2";
> +
> +		opp-37500000 {
> +			opp-hz = /bits/ 64 <37500000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +		};
> +	};
> +
>   	cpu0_opp_table: opp-table-cpu0 {
>   		compatible = "operating-points-v2";
>   		opp-shared;
> @@ -4181,6 +4190,7 @@ cci0: cci@ac4a000 {
>   				      "cpas_ahb",
>   				      "cci";
>   
> +			operating-points-v2 = <&cci_opp_table>;
>   			power-domains = <&camcc TITAN_TOP_GDSC>;
>   
>   			pinctrl-0 = <&cci0_default>;
> @@ -4222,6 +4232,7 @@ cci1: cci@ac4b000 {
>   				      "cpas_ahb",
>   				      "cci";
>   
> +			operating-points-v2 = <&cci_opp_table>;
>   			power-domains = <&camcc TITAN_TOP_GDSC>;
>   
>   			pinctrl-0 = <&cci1_default>;
> @@ -4262,6 +4273,8 @@ cci2: cci@ac4c000 {
>   				      "slow_ahb_src",
>   				      "cpas_ahb",
>   				      "cci";
> +
> +			operating-points-v2 = <&cci_opp_table>;
>   			power-domains = <&camcc TITAN_TOP_GDSC>;
>   
>   			pinctrl-0 = <&cci2_default>;
> @@ -4303,6 +4316,7 @@ cci3: cci@ac4d000 {
>   				      "cpas_ahb",
>   				      "cci";
>   
> +			operating-points-v2 = <&cci_opp_table>;
>   			power-domains = <&camcc TITAN_TOP_GDSC>;
>   
>   			pinctrl-0 = <&cci3_default>;
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

