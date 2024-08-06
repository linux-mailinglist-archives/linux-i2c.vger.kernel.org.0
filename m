Return-Path: <linux-i2c+bounces-5177-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F046A949BC8
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2024 01:05:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 991001F22BC2
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Aug 2024 23:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64A8317556C;
	Tue,  6 Aug 2024 23:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JMFqieiy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C808171E5F
	for <linux-i2c@vger.kernel.org>; Tue,  6 Aug 2024 23:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722985499; cv=none; b=aSFHYc23S0KNCGC6ZG3P15L0KtcPoW3KNzqA3bRzr/+lucvVx/b66+nKWEOyK3xYF3Ge2UzZDy2C6+6Sn0H61Ey0epfiMWW6keVvdnCB5eGb7mlK1kJofL6hgK7W0gEKmGk5NKYwbcRcuvAnSGA391UtQYC4oPNAJ598Rs4spOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722985499; c=relaxed/simple;
	bh=eCHRZfbVih8dU7pR6xWQRl/juLSmaH8RtChWF+l8FCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fr1QTKXkguRZpT7S2DxGSp4p3PK91xgEZ7ssBKZMKrzWc5Y+1VL/Ay8e/CsAcmFhXqr6VD8fQ0rNEzA8CWvDk8l+EMGddxQuIps3kxL1fPGqY3LNBOMDBcVmNbayxhTjsjAOvVAXx2lKWQczhXOV7sVdZNihLebj1JflubAWJW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JMFqieiy; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42808071810so7868605e9.1
        for <linux-i2c@vger.kernel.org>; Tue, 06 Aug 2024 16:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722985496; x=1723590296; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pVTzUvpo2J//Q7IWbA8OuCEthqk1HNLB6DJMBCparG0=;
        b=JMFqieiyZFZzLwuzGVnC6yuLWbsRouzjw87bCX2G4cDkTMiWOdm/HQ0VshXxe424sO
         EPkTuV7lkzRi0QzH0xFe69BcQJDRJSXKjjXPt4kS2oWCT3mz4DX4MyriF9KxLFxra87G
         3Syhbpxb3RYkLPBh8hew3BBtS6ho8ex/b5UKrQaf4WjdMtUxAe0Pn2p1qdqUoA6rssvt
         7FZGHcpcHQ8UavxwYSywuMNhp3T6t9ICg0uOQT52EV+06ZdBSoY+/oqtzL0AQz6vrRwS
         WGHnvIxAJn/TsLbajf4J+DvgOZgIEml+gAfSm9WXXGxxmHAgISzyXVUcuUhHNTKPRhmp
         AAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722985496; x=1723590296;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pVTzUvpo2J//Q7IWbA8OuCEthqk1HNLB6DJMBCparG0=;
        b=a7dQkyDAdD0mxKlkgXtILVcupjODWNBV/M+Q1/xi+pWcx06XITxrEbnqQ/NymYTRca
         SsSjFT3vKMFJF8r+W0jqCIiZf+HAEGsDJXd1tQNB3N7Zl1KHzOBpVuE7NTxlfXZ7ZL3q
         5UNfhZXRqrWA/HRQs2sQcfXbsRv8m8mo2L43eDzN8bJT1YOqlo4d6ctI78FRC8H4ecmm
         XuK07W6KrtTRsn4RaGO+CPcZESnATBN/428d5U5C9nO+TbTac7CB87v7j3gMXn4ubNic
         petMhC/uKCorHxV5uV3/dpgUDIg4fqXV9+25RXv7qYBxP2hj7YcVp6dIeFguzJXxWppk
         i+fQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGpbW4qCqRj+Z6UiJ03P8cKptuEY2xJNRDskHGMDPaGT3VFTbalMwPQTt5zq0aCxW9gg7Hj6eQ6uEjJQd7wUK3hq108pyW0huU
X-Gm-Message-State: AOJu0YxZqlVJwdBhnxSSIJYiiyJGvTSmubFY8vZc8Ummr6KcpyDtr65p
	vbRYZxSk6aBSwpFAt5n4kzYOyyEGcfT7FCs17T9D5LZ+asEQD0BClW3A65lSUAY=
X-Google-Smtp-Source: AGHT+IG9YNHqbFX5l53AQ9wQth8ckoaQl2Thoi3GWV3148tXmmgL0gEm989pTRxvAg0gBDDK8748SQ==
X-Received: by 2002:a05:600c:1ca9:b0:426:6f81:d235 with SMTP id 5b1f17b1804b1-428e6b037f1mr120214305e9.15.1722985495634;
        Tue, 06 Aug 2024 16:04:55 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd059801sm14212373f8f.83.2024.08.06.16.04.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 16:04:55 -0700 (PDT)
Message-ID: <e27f0610-820c-4a65-a119-a5bb4fd5cef0@linaro.org>
Date: Wed, 7 Aug 2024 00:04:54 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sdm670: add camss and cci
To: Richard Acayan <mailingradian@gmail.com>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20240806224219.71623-7-mailingradian@gmail.com>
 <20240806224219.71623-11-mailingradian@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240806224219.71623-11-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/08/2024 23:42, Richard Acayan wrote:
> Add the camera subsystem and CCI used to interface with cameras on the
> Snapdragon 670.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>

> +
> +		camcc: clock-controller@ad00000 {
> +			compatible = "qcom,sdm845-camcc";
> +			reg = <0 0x0ad00000 0 0x10000>;
> +			clocks = <&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "bi_tcxo";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +

You're adding camcc here too which is inconsistent with the commit log.

Personally I'm a fan, perhaps the only fan, of very granular patches and 
I'd break this up - at a minimum into

1. Adding CAMCC
2. Adding CCI and CAMSS

---
bod


