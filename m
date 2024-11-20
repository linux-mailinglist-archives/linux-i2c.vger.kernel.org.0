Return-Path: <linux-i2c+bounces-8085-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDC09D3A6C
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2024 13:15:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9449AB2C6BD
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2024 11:55:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 814D01A704B;
	Wed, 20 Nov 2024 11:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BCd0kegS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FD81A3BC8
	for <linux-i2c@vger.kernel.org>; Wed, 20 Nov 2024 11:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732103604; cv=none; b=H3eWbwaHrdOl47RuWyEk1X98I8/HuK1+wwuFOlBAvq6M2AY75FonKV39krkKjOB9eer69WXmTfCCcP2hHiETJmu0sgHr695LA0LGjP6aWcVSJ24yIHFqiKTr/llLuAcTUvHuz6ygrDst+kdi1qY41ybgZ1Nex6iW78qaE8BgFio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732103604; c=relaxed/simple;
	bh=+MxPqx3dXMtmTTkh/KdDxAQTgcrpLDPNHcD87nDZzSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H3EW7ZicuLJzpJ0w3D86NTU/llZjmW2Bff/FpN8ZUPoghynBs7+zEiTALDzItMFTRU/iXYQG/G0jVuv4JvKhA8yLEXUXbnAc9vvAb1i4Phs6KJjQgWwweoxoM2+opXJ+JX/mxeZfwnJDfSgHm45f+7B1zqxEY7MvIx5NJiD3Exg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BCd0kegS; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb5740a03bso66612641fa.1
        for <linux-i2c@vger.kernel.org>; Wed, 20 Nov 2024 03:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732103601; x=1732708401; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=USA1W1qx9HFfEjKLttxC4EE5U+gk9ptHIMuBPa1JZ40=;
        b=BCd0kegS9thjEObRwXFyOwsxrqNu2RKpzBm6g286lpAzZhQLTgBLfMhvgKLQmOwN+9
         +RvvyMuvyeLf5k8lDKe0dHAxhbkYp5oNYxaOOXMMgwT328QLwn8LE6lwRIENKvEe4BQI
         pvrjiGE7KdAyWy4iRs9xii+ksKA6r6oeZCiFU+0bkMpbrkkogdmOf2HwYUJ/3Gytpn/7
         XqxDSmOHOluZbPbML614dxK7xpI9InKc8DNkk0FybjJDjNwg9w4pmtsOoaH4sXFfnk93
         /DUEuu2I9ksPUKIHfKP0Mnyk4/1sD/NPuM3v+fwAreu8SzC/7JFA4C+l0N6wzdveCy+4
         v9sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732103601; x=1732708401;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=USA1W1qx9HFfEjKLttxC4EE5U+gk9ptHIMuBPa1JZ40=;
        b=U7jiL8tIt5URMu0S81RNL2IqnRR1B3z2LRxEW4Sed4T/WlQLJ44QX9ovJz2ci2O206
         i0nVMnitN5QWwpB80gep8yiy9RpSwAeu3UCOQZx1ds5W93mN4UnVyT7vkiNdjEJJNn2x
         Uxev9+Ila1tIUPIyhYqaehJ1Mf2dzqghpOvEkFC/WZHkXZK8JKs/9tpob06bl5mfyJQ3
         O+dpy9KF3dQtw80/qX3FkE3gHPQPJ0jtjRMQr4wgbmCf/cG4dLZyjatN2bNe5ch6FRLn
         0BuzX76+wE7SNWyHFFxpltWFxl5i6+G63Erdwvpx5gF30D7FRkruEatLH6B8nWSed5l9
         tpUg==
X-Forwarded-Encrypted: i=1; AJvYcCW+LeHo0t5GmKnaMmKkLKb8fdC1FvJgSL+M2igFvbqt6JbveUVLY6yuuCSnrXnaSnWhbHPVS4QRw7A=@vger.kernel.org
X-Gm-Message-State: AOJu0YywJ1ETvfkxMXX2cqdE5sQVXXWbvdlJkkL7xDg98zMeNK1kiP+p
	HRhlsmlZ/siunR3tAhefAagyYXbVm7xcReivMF/kYAmMH85FSrKSsrlARzcGi1c=
X-Google-Smtp-Source: AGHT+IFU8N7uQdXevfHD8jFBl1FBII5BkIFR59rGddbGn3KESnHWjFoPDuxOKOct3CyafHsEQL2nsg==
X-Received: by 2002:a05:651c:88c:b0:2ef:20ae:d113 with SMTP id 38308e7fff4ca-2ff8dd32ac6mr14418721fa.40.1732103600720;
        Wed, 20 Nov 2024 03:53:20 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff69851184sm14554601fa.15.2024.11.20.03.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 03:53:19 -0800 (PST)
Date: Wed, 20 Nov 2024 13:53:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 3/6] dt-bindings: clock: qcom: Add second power-domain to
 CAMCC
Message-ID: <pl7og7jrwbkmfmphlvlzhov3kk2edsn2umxq4mt6dyadwb42h7@vg3zjmogwzf3>
References: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-0-54075d75f654@linaro.org>
 <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-3-54075d75f654@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-3-54075d75f654@linaro.org>

On Tue, Nov 19, 2024 at 01:10:32PM +0000, Bryan O'Donoghue wrote:
> The x1e80100 has two power-domains for the CAMCC not one.
> 
> Capture this as:
> minItems:1
> maxItems:2
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> index 0766f66c7dc4f6b81afa01f156c490f4f742fcee..afb7e37118b691658fc5cc71e97b110dcee7f22a 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> @@ -39,9 +39,10 @@ properties:
>        - description: Sleep clock source
>  
>    power-domains:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
>      description:
> -      A phandle and PM domain specifier for the MMCX power domain.
> +      A phandle and PM domain specifier for the MMCX or MCX power domains.

Should there be an if, selecting which platforms need 1 domain and which
need both?

>  
>    required-opps:
>      maxItems: 1
> 
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry

