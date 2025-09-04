Return-Path: <linux-i2c+bounces-12643-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 119C7B43F99
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 16:51:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 425447B55DC
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 14:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E0E53002DF;
	Thu,  4 Sep 2025 14:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ad3dPfKy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2ECE2147EF
	for <linux-i2c@vger.kernel.org>; Thu,  4 Sep 2025 14:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756997466; cv=none; b=Kvw9nAeSl2PRN6VWrYsGnldfaGabrlSYQ0h9VDFUCuVSMPIc3UUeBfTx/gwi3Zd076A5WSyuX7TraJjB6BLQ5M79EyucTg6387lLi+CWs2jR85VHL+uZG0E98WIPOYBsRf6SvAtJwRGiLd8XCZIX7KFYf4Z2gLo/i/xyr/JvGaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756997466; c=relaxed/simple;
	bh=mFi8f12a1bnt/zRkKSTt0ZafY90Bf2dQ+K7+kVMIlZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r0B7pW4W96BZ894Xq/6BKkkWIqarsCmdTK+jqPCU21spTip0r4PMYJjAxMBzC2dgppCG8xUNVBPZzXgegvXMSGfUcuKz48OwgLYoJ0/Bhj349OW4/+C2sYdK4GXoRkuls5qJNL1BJHgi90ZhHxAnb9zNtNI19dot44lU7k4AYaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ad3dPfKy; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45cb5492350so7778475e9.1
        for <linux-i2c@vger.kernel.org>; Thu, 04 Sep 2025 07:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756997463; x=1757602263; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mm3xj885WkKRhuZyxbu5LG7P0HRA9OEYlHlAJLxX4fs=;
        b=Ad3dPfKyqQ41DNzpxCzTtiMqbCSl25zh8K3r9RAroQg2QQrjzCjBN4N9qJx3v/wYai
         /ruy2l9highlRFVPcgahoFE5JESgCnn8zuycfQLoOeJs351O+TOF5b51MK5Dxto0S5Am
         4zV6h0dxkqnYcKVl9S2u0eoT76fkV1OYkmSeLJVDeUR8PaYApYbfh4hmS3sNHbS+x7EL
         6yFjJHsw+Rm7q3awBX3LjAFWhk2OXlDWRDKpha4K51QzO8x1Bi0VN1TG0/VQV4WbeRCm
         zZuxWnhcY2f1J4rPnK1eJis6Su1WNG7vO8Rf4uUrX/d5xNDBvsNW20anGC9kXtdsn5xx
         NYFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756997463; x=1757602263;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mm3xj885WkKRhuZyxbu5LG7P0HRA9OEYlHlAJLxX4fs=;
        b=NQh23a4ovP+kThhMGfUYyBN3mfiK/oZi3otFINbeYwWa80cXc+xw5i/YgwJvz0N+xu
         66deMf3tVkE/9i3/hUyvawELmTll/8qpTPtKiPMdR3XuJl/vwtZiaovN4+O2FdoAf/5r
         PCqz+xlVuhrnBIcj4lHThDYV+UsuSyUv7KALanM4mmjHHzIATi0KYiK6/NZdpTEcNaEs
         zb52ki+fmBPGV+Uf8Ho91gH2U28NL6NzYQxDEFXWqQyz0xQJtYjSG4DtRU+6ArXQPpnE
         qLwEXfMR6TTantnjIK+LABnLUTPVG9a5k39o7EX0wm3Iq8+kLaOE9W8Fzfn15gBtZ2AA
         lBQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzmKxlnEzf6mmbErSBgMvZlhXq0LiCKw2PFDkseEPJpQ5+e8VidAM+VMV7hfw+thRVa9pNrRUVR98=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVYzdhqVNaKPod+azY8fWI3Z7xXFfKumFgkt9K5Sa1UGQGJtex
	R2fcZzKK0ZK4afaQzz1f6zorQZQkpDf4ZvLXHVscHfalWG01ChBgQdVKlkkgKeca21w=
X-Gm-Gg: ASbGncsuGWZkXrLbNHM1l1r3pq0gXqSCsrhcxG2Sg2je2p6xp3CzGNEoNh4v1UowmwX
	C6tsHyLKpC+1Za4X35L2O3VOO4muTQOvGm6oTMDtZ85i/unx0jZsfP93D8Plo/PWMNKsaqLsNir
	blN7QNy19ZufZQZWqS0UKZhEUYChweA4yuQV3d3NHG3LhE4KlsWsx3eFLFiSjyklY7+8YT3kcjW
	oMiozGCg4kWzf3eG84JtN1tCeN/ZWr3b14ZN1ENOkTLoJsmA2S+qADNUPjPdYS/glmy56P96jZI
	nL/x41toL+LvB5GokGb8Pdtz+AfYIt8dTfkDGmmF/O9kAR3kNyioQ40668DQYkP5RJXJIvpRdfz
	Fqp0Gw1j/iw1DgqnxgC1C57Fhw1yoWNnHNSU04eqsykppj2Ydr7d6945iojZ/CNb2ifbITEKTI3
	84I0/8TotmpnQQZFs53u8ryRUsqQS92A==
X-Google-Smtp-Source: AGHT+IGkh7sZxoYPIJSgoKIuQWnB6gAGim5zG62ByEZJnBJdkEVQMXHIGjBKP7FG3mVW3hDjXTcWGg==
X-Received: by 2002:a05:600c:a04:b0:45b:8504:3002 with SMTP id 5b1f17b1804b1-45b8554eb18mr173687245e9.10.1756997462953;
        Thu, 04 Sep 2025 07:51:02 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dcfc414f4sm22307435e9.0.2025.09.04.07.51.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 07:51:02 -0700 (PDT)
Message-ID: <6607f82a-e0d0-421c-a87a-fe67442c1c80@linaro.org>
Date: Thu, 4 Sep 2025 15:50:59 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: i2c: qcom-cci: Allow operating-points-v2
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
 <20250904-topic-cci_updates-v1-2-d38559692703@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250904-topic-cci_updates-v1-2-d38559692703@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/09/2025 15:31, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> An OPP table is necessary to express combined voltage and frequency
> requirements for the CCI hw block.
> 
> Allow passing one, without requiring its presence.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 73144473b9b24e574bfc6bd7d8908f2f3895e087..1bb9a70661a944c1bdc01d336475952221450dba 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -54,6 +54,8 @@ properties:
>     interrupts:
>       maxItems: 1
>   
> +  operating-points-v2: true
> +
>     power-domains:
>       maxItems: 1
>   
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

