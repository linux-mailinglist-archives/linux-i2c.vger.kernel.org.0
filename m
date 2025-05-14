Return-Path: <linux-i2c+bounces-10978-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B60FAB626D
	for <lists+linux-i2c@lfdr.de>; Wed, 14 May 2025 07:37:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAEF31B433AD
	for <lists+linux-i2c@lfdr.de>; Wed, 14 May 2025 05:38:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B53651F0E50;
	Wed, 14 May 2025 05:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CuMxDGNy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1032E1DDC28
	for <linux-i2c@vger.kernel.org>; Wed, 14 May 2025 05:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747201064; cv=none; b=R+pWILsYn06yBv9LoUgTs8hRxok9kMQUTzD4HYdfuantiE/H9hVTYI/LX8/m/ucu6Ev3UMbeV5+Mq9SbjoQh27dVeZU3Cj+Zhuvd4ORjXbStl5IStrsG9lAq/F85HDN8gmBDUe0fCHOmJgCQ4sVeCTLJ4agRjWngWIyFwQ9FtmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747201064; c=relaxed/simple;
	bh=EEby7excLqyRAZlBVU18cvMGi7EHO5NAyeDfYhB2ybw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TQtpu3PXksBBHSIv1UbQY1v5hFhFTqlmGRZk3iVANKaWpDb7xRawcij9mYBt68zu0GdknI27jECzanzrvsXz1eJ5AwDDZx5yU9noQgcvd67YNWrNOzKvnnY1EQmV/Csy7j4VAiCHkZYJsSPiYgTnQrx9lRuJhmrvqhVleX6gSSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CuMxDGNy; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-441d1ed82dbso67756005e9.0
        for <linux-i2c@vger.kernel.org>; Tue, 13 May 2025 22:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747201060; x=1747805860; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X6RATe/WUl9l8PIeAPNH/uJUaYuQaKoomiYz3L5vu+w=;
        b=CuMxDGNyOaableO3MXJOxrrrJVQvwgg9JCk+sCsQAIPh+jQ5dqEogf9dxDyMUifnxb
         6rM5Q5nXm+fTe3W3ys4VsyP+vn/AVkh0mkq/H5gNnQsC9jCNvZxEFY4paOwfuE1UTiwo
         lNd2xxvtytoxPMdANZO50SxIjuy9K51pIx32/bnZsEPCkG03eHxknvXgSCwRUxglqPgA
         tE7JH+rhHCRRzl6v4yGCMPVNCcXsHD08iXjxv0Tk9OfQiLJn669tV/o7oPEMAxvOpiG4
         GNoMZdTqn1/Lj8MBVoWte1k96DRWN0RVtqpnqKMO9zJDKNRIhtWOdGACAZv4Xta2yJO/
         z8Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747201060; x=1747805860;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X6RATe/WUl9l8PIeAPNH/uJUaYuQaKoomiYz3L5vu+w=;
        b=n1DyJSxOn+ERogpMepTIC7mq0+mTIvHGkTmEfNxsfjKokdeHh06i0SzbrlGc8hH/vH
         oXU+59QcL5TiSR8JQJ1E9a67fVWLSetU+sQr4gUrJbrr1o/mmG7GKe5D3c8cvlNofmH/
         xu1LDil1GQw4MVzgUZOTzqmbm6SVT2njm5ersAwmr/t2n/VeQLg97Nh4xL6NR/SVxNbn
         hOb1Cx+ZUuKdIr6Fr7gWI4LCKtkHvo+hTRJZtywgynvR6PXAfVi2/Ka1kigXzqB6zgl+
         2RTdMCPUqM0lf6YZnpuz5AX+p//kCjUHacn++QiV0+pqakVXU0BL3MuIPsXxn2QmZlLx
         J37w==
X-Forwarded-Encrypted: i=1; AJvYcCXd8nz4y3OkC+GRa6t8Q4NCJ9n2oLzYmKXBVZKmWY398oI3/pC6BoSBI2bKFd+LEj1cXjN2G4R/vVw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzApP9LYe13qJReWH+NPv3AutbJWCN+niJIKAjszjF42alOZ9sX
	wX0Phg0V6Kw7K2B2sp/Ie15sVafGQJxeVJvQ3UVXakwCCMkC0/Zzwk7hAaHRIIg=
X-Gm-Gg: ASbGncsEtWtD0IgLdcZy+OAn698AozgNvn3IHe+Gp0zwf7XAVjDKXntGjT066o9zBxs
	AjDVzaksxm0GR/h+QDyW2LOp9IIhK0unQEG/8vOYi2tclL3TlSr7u/AfQYqOsXVm6y9gFR0pqbI
	idDqtsQcA6CLMkLJMs/qp4f/BS+CP+GM+/JSNT8E6miwSpHxe+RDyjrmsc+NLvyazEjOlpTWEWm
	jsyttgaALr7Qx25afApO1/GdsIyVFgYKrPd5j32LrPykriZcqxADcPzju7vua+e7lLv/m2zPeB6
	P+kEape1MPbAt99zOYjuRMD1c1uOs7Z9DBbzfNZuiU0vk89vute0XY41yx25DgIo+EVYmKRgV6l
	HDlio3KvdE0JX
X-Google-Smtp-Source: AGHT+IEH0gDtxUZnOie3UkdF+NX8VbUWlkkfab4c2RI1xS/aCqZplXS1DjQKIykuoWCzSS/8AUXEAw==
X-Received: by 2002:a05:600c:c0b:b0:43c:f64c:44a4 with SMTP id 5b1f17b1804b1-442f20e1ac8mr15280155e9.8.1747201060355;
        Tue, 13 May 2025 22:37:40 -0700 (PDT)
Received: from [10.61.1.70] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ebda7d2csm28574955e9.3.2025.05.13.22.37.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 22:37:39 -0700 (PDT)
Message-ID: <e1c4cb6b-2445-47ab-a908-af3e4833385d@linaro.org>
Date: Wed, 14 May 2025 06:37:38 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sa8775p: Add CCI definitions
To: Wenmeng Liu <quic_wenmliu@quicinc.com>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vikram Sharma <quic_vikramsa@quicinc.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Andi Shyti <andi.shyti@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org
References: <20250514-rb8_camera-v1-0-bf4a39e304e9@quicinc.com>
 <20250514-rb8_camera-v1-3-bf4a39e304e9@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250514-rb8_camera-v1-3-bf4a39e304e9@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/05/2025 03:40, Wenmeng Liu wrote:
> Qualcomm SA8775P SoC contains 4 Camera Control Interface controllers.
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/sa8775p.dtsi | 268 ++++++++++++++++++++++++++++++++++
>   1 file changed, 268 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 9a8f60db87b1afdf16cf55eb2e95f83eb45803a5..a867694b15b307344b72041e972bae6e7543a98f 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -3941,6 +3941,162 @@ videocc: clock-controller@abf0000 {
>   			#power-domain-cells = <1>;
>   		};
>   
> +		cci0: cci@ac13000 {
> +			compatible = "qcom,sa8775p-cci", "qcom,msm8996-cci";
> +			#address-cells = <1>;
> +			#size-cells = <0>;

The ordering here is not consistent with upstream. Please stick to that 
for your examples:

arch/arm64/boot/dts/qcom/sc8280xp.dtsi
Documentation/devicetree/bindings/dts-coding-style.rst

---
bod

