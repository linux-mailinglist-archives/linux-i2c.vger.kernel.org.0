Return-Path: <linux-i2c+bounces-4496-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A3091CC3B
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Jun 2024 13:07:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBA0F283923
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Jun 2024 11:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 993F14F602;
	Sat, 29 Jun 2024 11:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lFxBooZz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9643F9F9
	for <linux-i2c@vger.kernel.org>; Sat, 29 Jun 2024 11:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719659254; cv=none; b=PU6CqRTkY/2vAdgCjUrNA8Z5CoHuuBqGO6M3YcGhW3UW7MQrVs2ue07c33OW+5oDqjHnGeUWaTSrotYtX5AY//D5OgVwPmHMlqShZC5r8QXXt6GIEny3tbm37xmyH8XUxlYCaEjjHA0ySfGlXfpJGR4TFr5npvvqBrLs3H0ZZyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719659254; c=relaxed/simple;
	bh=A27AZyvz2A7Q9roo7P9DdKR5Zk9tltXk4k5EOFMW2PE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aP27rVz2VNrJnIlYpoJ53Cj674PGTBEChnNMCol217yQeVou9lZ9Ta/yAVDoImAIU8UV8nbn2Vi656Mkf6rilfp/vsIHWkPYRsUMTBj5yWD35WPWuu1/baKUwpMzN7/sGCXmbO3Usf0cL9bWk1BRpPtpmwzwt0S+OeBRZCuRcws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lFxBooZz; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-36532d177a0so857613f8f.2
        for <linux-i2c@vger.kernel.org>; Sat, 29 Jun 2024 04:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719659250; x=1720264050; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oeVOD5CA0cinTFO1deV1ecLyqh6tETXTXZTto3YUbA0=;
        b=lFxBooZzp7TuRROQ2m3yEzXTLbffcnO3Yilqph9wnTL5E5b+ytlSdn/H63eAoyzpIq
         6t48CUSaArjELxX3fnsHymiyNuJDKnozisXuU7HoyL6es14C49jC70s4LJgJC/l95Nsd
         vEy+BmJwIw107Aym36MrVO2NFJ3Eynw621ehigotsjTIZQ9kKYUeWCSZbw7Jeh/cxHaK
         9lH0Osntyhr1tZWrEjsefdQAy+JuldO1Wc8ySECIUIJGbsDmc2m2UJzPJUfWoUpSbkS4
         cVBDG6aZMVZHm/QQKoaKzZbaDB8yIR4AjYEkEcHeqs9LyKicoQGg/ClNXts4PaSz8arR
         Zgwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719659250; x=1720264050;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oeVOD5CA0cinTFO1deV1ecLyqh6tETXTXZTto3YUbA0=;
        b=RgUSROeHEkK1UUwUD+NeD8l51Bgu6VVzOaYNYuaRMHTpRD6RHWEuJuJIFAW4sTJ3lP
         K/sHhHb+GogDJAOPfJzT5Cgs9fTqyHqPiL52eUB1dIhZ4SQs9UxehDsCEB9urD4IidAO
         3wxLjsOMfihBADMdicyoyiL+/q02ANe2K99ImY1tyIDDwsvaLh/KT7bw13JENEtRtGfG
         bL/uGrUbxTAJzvZJpFew7XImFoR5UYf6eNynKgMjyocUf9cBHhR9K+CKjXHGnRyZME+y
         W61G5UdZXd64YT/dErjoGlhBUN0jeemHLwY+dtv1c0gyfqx9VshLXU7u7+3llnWxm6m8
         ReMA==
X-Forwarded-Encrypted: i=1; AJvYcCXQnj+huNbWLcEUtNM/Vjrf1U0Ea6/PuHuwg2T+5kLYlwlA1cYC6vxrk/L4Yaol1g+9C4ofY6+zMeMkRjzQ8s3/++3d/zMy1wQW
X-Gm-Message-State: AOJu0YyX7pvyF+p44kaR8LeYRdWM871/SHEmd5Bj1RZCMWkI6oZw5G53
	MOMzeIDvYxPsquz3AeHxe2EZ+PjxrF/E+2cTx1btxosjeFG546Bp8ogDLv5lzkA=
X-Google-Smtp-Source: AGHT+IFp0LPwn95vvUy4qg44MiPqjUSQeFK9TzL595b4Lm8//Szl2OQ26nmO4n4sJUTNlSJn3a1JJg==
X-Received: by 2002:a5d:4eca:0:b0:367:1e6:4ab1 with SMTP id ffacd0b85a97d-367756bb503mr390586f8f.33.1719659249815;
        Sat, 29 Jun 2024 04:07:29 -0700 (PDT)
Received: from [192.168.0.38] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0cd71esm4641757f8f.21.2024.06.29.04.07.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jun 2024 04:07:29 -0700 (PDT)
Message-ID: <620d1bb9-99a4-43b2-8750-8f0f3e490bb7@linaro.org>
Date: Sat, 29 Jun 2024 12:07:27 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] arm64: dts: qcom: sc7280: Add IMX577 camera sensor
To: Vikram Sharma <quic_vikramsa@quicinc.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kapatrala Syed <akapatra@quicinc.com>,
 Hariram Purushothaman <hariramp@quicinc.com>,
 cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, Hariram Purushothaman
 <quic_hariramp@quicinc.com>, Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
References: <20240629-camss_first_post_linux_next-v1-0-bc798edabc3a@quicinc.com>
 <20240629-camss_first_post_linux_next-v1-3-bc798edabc3a@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240629-camss_first_post_linux_next-v1-3-bc798edabc3a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/06/2024 19:32, Vikram Sharma wrote:
> Add support for IMX577 camera sensor for SC7280 SoC.
> 
> Signed-off-by: Hariram Purushothaman <quic_hariramp@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/sc7280.dtsi | 33 +++++++++++++++++++++++++++++++++
>   1 file changed, 33 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 9ac251fec262..1c99ee09a11a 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -5167,6 +5167,39 @@ cci3_sleep: cci3-sleep-state {
>   				bias-pull-down;
>   			};
>   
> +			cam2_default: cam2-default {
> +				rst {
> +					pins = "gpio78"; /*cam3*/

I don't think the /* cam3 */ adds much here TBH.

> +					function = "gpio";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +
> +				mclk {
> +					pins = "gpio67"; /*cam3*/
> +					function = "cam_mclk";
> +					drive-strength = <2>; /*RB5 was 16 and i changed to 2 here*/

You can drop that comment too, actually more saliently, what are you 
changing from 16 to 2 since its being mentioned ?

---
bod

