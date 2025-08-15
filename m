Return-Path: <linux-i2c+bounces-12308-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 57991B27E9B
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Aug 2025 12:47:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADF821BC2C14
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Aug 2025 10:45:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 331192FF646;
	Fri, 15 Aug 2025 10:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nyECjAGZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169F52FD7CB
	for <linux-i2c@vger.kernel.org>; Fri, 15 Aug 2025 10:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755254682; cv=none; b=fKbghbs0R6AKG660YAsKMHXUp6kM87tPk1QCgg+NufskUrkC0b9Pe06Tg48GCeUro+1mOui3y1JTt0ANw0gOLNQS2fgDrZ7tHu0R8tq0hnc9Ig9QnWKO0MZu8Ht9vkYOOrMu45gVazbOnSvxqEMMmL8fOeWIBEyQKqbTjEDa4zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755254682; c=relaxed/simple;
	bh=8LA+2kJNuPIw2fJF/HLy1WPGQ4k/QzgOM/5kdp6JFgo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JV+rFwdSfnBNVDtzQla17Lwy9qTpVq+D7GYUtPu4d22WzIPQb2u8O52XI7lPRc5zLH+BV0VQMudQKkSRo3rB1sldqMT9ckZoA2Nidlv3F1vsEKcoohdP4XBb19cyCHM0MeOzWbFtHzOz99PeA5+vcZ8ku47Qf2sOy6YpZzdLKs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nyECjAGZ; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3b916fda762so1369867f8f.0
        for <linux-i2c@vger.kernel.org>; Fri, 15 Aug 2025 03:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755254678; x=1755859478; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9VXN7dyuqMDF593piqzOKDuFJ2+OEcBzrRSpDmpGS7k=;
        b=nyECjAGZCoVzy/0AtH4YgMEvaxuJO8Zc4U/+dRSM6fRvVrTO5mByLq3BECjG1/3jmD
         P8I/OtI5JjlQlvjz/gk6OzXP1wavt74YzBA+/gVlUrl+QnenkZpyWOB2Hj+yGckb0IJV
         MV8HpfbN3gRpIRUU4SnSxinVNq3kdnyJTrYOjlOZXHjPa5x/IL26oRKnAv7hRi6OSbg4
         DHRHftdfVRZIeg69irsGzY7x2E0LqS1aUQzVEa28o8WF34XgtdGSKp7SOs1QQ+EIyz42
         rzACdYyhOfM+G8XjvWd7eU/Vpl95SDoG9QnMhGPW/irzSg6vnYj/rpa4cucCPnePxwGi
         09uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755254678; x=1755859478;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9VXN7dyuqMDF593piqzOKDuFJ2+OEcBzrRSpDmpGS7k=;
        b=OqCnnXJGLB5d5uFgcPm8XKnhYAyCLvEnqnDgzgP+bB7fH4vbwiSqmxU+7Hs4sqtxGE
         1t96e2EDYuyRXNWjfTftvhAA2APjmVifWsruhq0Abw/0Gn3BTlZhLieEzpk87Xg0qx8E
         T3YB4FIXIbVX7QODNXLXCHPIKzgAro9Lq+vgoBCmlARXe8R7SVlHqBy8OSP7PO9SkozA
         H6upca7+zzuP2GHZ9TCGnLFamsfc9i8pnvY3D8lOzvg4R+bN2ZcPQ+I+U9xaIhDtSqlQ
         Sj9d5nT7apE+SjDmMcB87NecyBmQVMxBW5jALAX37D54UVtJK7Jx9OLg7sKjc6y3urfc
         eCug==
X-Gm-Message-State: AOJu0YxZiFZeKIeMiEW34nUHTdX4Xpp5B8YC+9k18+aaDQq/U+3JPpLl
	5t5VlLrVbHlptEd7pZFxRbbCXpQ/PLw0ugAIdFdhYMPCkLQQjAEzmXB1eXjb6Thy0Cg=
X-Gm-Gg: ASbGncuW2z12y1GmPzjQhoeG+E/VhSua/KeIynXEz6hhNJm+GKE8N8DEzxYaC2Sz1cy
	vvanCfeE4Qe5asPRcfIQjtFBXmpEmen0wrHSasHh8e7cgraeBzSXckTDsLhPj10pWZs3OBJvUeY
	LX67ZkdaWtHKKSeL+E9Jdipy1NAAilGfIH/7s4bOdt1Kkl+KmmQoCQfiJ908fnumDWWHGvrBHNi
	tPCxNwF5YFvrBdsg+EjU62ujL+GAtIleI6ofLXfyA25Wv8xWikNe1p5BK51WAXqrNdah3excW3y
	+Os8tTWCOQ+nT/7EP6t38kJZ6GUwKt8W7dVUS5CpNvzPHmf6EXnaYrX/g7S33K8Smj5t0c1iOZb
	ZNDDcHLCQPdrrlHYeCTI5P2aUft7l7tmHsj1k5rvbWL7YosbKfvqlG3sW59HlEfQ=
X-Google-Smtp-Source: AGHT+IG800cLWLqatWasBLVAd1JmHq64uktJOwC1nVkGq12rIf4uwmr3k1nR0sv0K30TYAXp61UV2Q==
X-Received: by 2002:a5d:5f8e:0:b0:3ba:cfe3:ad98 with SMTP id ffacd0b85a97d-3bb4a1f88ccmr1707195f8f.4.1755254678411;
        Fri, 15 Aug 2025 03:44:38 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c9b27sm1443907f8f.44.2025.08.15.03.44.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Aug 2025 03:44:37 -0700 (PDT)
Message-ID: <75df9709-5778-4a71-bb55-1151c6c657dd@linaro.org>
Date: Fri, 15 Aug 2025 11:44:35 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: i2c: qcom-cci: Document sa8775p
 compatible
To: Wenmeng Liu <quic_wenmliu@quicinc.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, vladimir.zapolskiy@linaro.org,
 todor.too@gmail.com
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20250815-rb8_camera-v2-0-6806242913ed@quicinc.com>
 <20250815-rb8_camera-v2-1-6806242913ed@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250815-rb8_camera-v2-1-6806242913ed@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/08/2025 08:07, Wenmeng Liu wrote:
> Add the sa8775p CCI device string compatible.
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
>   Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 73144473b9b24e574bfc6bd7d8908f2f3895e087..54441a638da2b7feb44741264810d7a0de319858 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -25,6 +25,7 @@ properties:
>   
>         - items:
>             - enum:
> +              - qcom,sa8775p-cci
>                 - qcom,sc7280-cci
>                 - qcom,sc8280xp-cci
>                 - qcom,sdm670-cci
> @@ -223,6 +224,7 @@ allOf:
>           compatible:
>             contains:
>               enum:
> +              - qcom,sa8775p-cci
>                 - qcom,sm8550-cci
>                 - qcom,sm8650-cci
>                 - qcom,x1e80100-cci
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

