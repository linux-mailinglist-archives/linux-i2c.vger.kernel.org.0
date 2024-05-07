Return-Path: <linux-i2c+bounces-3453-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 489328BDB8F
	for <lists+linux-i2c@lfdr.de>; Tue,  7 May 2024 08:35:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECA031F21BC0
	for <lists+linux-i2c@lfdr.de>; Tue,  7 May 2024 06:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A98FB73504;
	Tue,  7 May 2024 06:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lKXQ49cV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D698830;
	Tue,  7 May 2024 06:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715063707; cv=none; b=L1mRbKdZg182ZJmquyKUpoHgT6hjLEnGFXphhfVUJiY1xN6tsyiR5RjfaF8bUv+WgaTkFwJ/1dWTbG7CSQfUEoQbi4jazmpB8dPMtuf5hZQuCQEDRqWd17MtED9oMzzQMKKzBJy85QDmM51sFgNRqafxyJvCnuG8frFK4WyE43o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715063707; c=relaxed/simple;
	bh=Npl6n3qMCOWszNNP57mJKVD1PsB2Ftcv70QRdDy1gIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uj/5jTI5++hbBJCngXqkEfLVURpOYDG1iFlELjgjb2z8oEhCZ0aQXj9gQiDfbjfotC2hYpsRWrSmgcPTUfBoE/2DikYXgqoOB5kTVWMjgSl2KOIBmXrigXkOVO3UcT+W1vdULpRE+4vIBOx5OrJ6coY9U11uR3FJyTD+PwXtOCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lKXQ49cV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A26E4C2BBFC;
	Tue,  7 May 2024 06:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715063706;
	bh=Npl6n3qMCOWszNNP57mJKVD1PsB2Ftcv70QRdDy1gIY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lKXQ49cVZS+jZynUD9r6q775VrrxdMbPair1BTpd1cq/w8Wy4i2XWFpCG+MJRRkKu
	 sPp3dlE9k5tP7mzJ3aGH9UM3tJKCLm5ZCPTocFCmngo/Yu8nha0P6OkEkdAJuJjGFY
	 TCH9LoImqnAWLzmcFtqLprRpJ6v4uSxo1eP/GIDxsnztKlTUjwTsvBjWgH+7jhlHKs
	 uLhvrsTFQn/3WogIejgvT40sHRc2i8WeOgUuEM/dXYYFWm907pbD8kxJj3dDA0b3j2
	 yUCZy4S6LxSeVaT1qZXnVtLCWhQxrUGunhvkQBuyn2R1H9yzz2GhWyA9SVE5WFhKb0
	 iP+EOcO6FfK2w==
Message-ID: <c5711272-b302-430c-820f-81b475178e65@kernel.org>
Date: Tue, 7 May 2024 08:34:58 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 04/11] i2c: dt-bindings: configuration settings
To: Krishna Yarlagadda <kyarlagadda@nvidia.com>, linux-tegra@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net,
 andi.shyti@kernel.org, wsa+renesas@sang-engineering.com,
 ulf.hansson@linaro.org, adrian.hunter@intel.com, digetx@gmail.com,
 ldewangan@nvidia.com, mkumard@nvidia.com
References: <20240506225139.57647-1-kyarlagadda@nvidia.com>
 <20240506225139.57647-5-kyarlagadda@nvidia.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240506225139.57647-5-kyarlagadda@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/05/2024 00:51, Krishna Yarlagadda wrote:
> I2C interface timing registers are configured using config setting
> framework. Document available properties for Tegra I2C controllers.
> 
> Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
> ---
>  .../bindings/i2c/nvidia,tegra20-i2c.yaml      | 104 ++++++++++++++++++
>  1 file changed, 104 insertions(+)
> 

You called it RFC, so not ready for review, thus just few remarks.

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters


> diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
> index 424a4fc218b6..3b22e75e5aa0 100644
> --- a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
> @@ -119,6 +119,96 @@ properties:
>        - const: rx
>        - const: tx
>  
> +  config:
> +    description: Config settings for I2C devices enlisted with I2C controller.
> +      Config setting is the configuration based on chip/board/system
> +      characterization on interface/controller settings. This is needed for
> +      - making the controller internal configuration to better perform
> +      - making the interface to work proper by setting drive strength, slew
> +        rates etc
> +      - making the low power leakage.
> +      There are two types of recommended configuration settings
> +      - Controller register specific for internal operation of controller.
> +      - Pad control/Pinmux/pincontrol registers for interfacing.
> +      These configurations can further be categorized as static and dynamic.
> +      - Static config does not change until a controller is reset.
> +      - Dynamic config changes based on mode or condition, controller is
> +        operating in.
> +      I2C has configuration based on clock speed and has below modes.
> +      - common is set on all speeds and can be overridden by speed mode.
> +      - high is set when clock mode is high speed.
> +      - fastplus is set when clock mode is fast plus.
> +      - fast is set when clock mode is fast mode.
> +      - standard is set when clock mode is standard mode.
> +    $ref: /schemas/misc/nvidia,tegra-config-settings.yaml
> +    unevaluatedProperties: false
> +    properties:
> +      nvidia,i2c-clk-divisor-hs-mode:
> +        description: I2C clock divisor for HS mode.

So you decided to implement clocks in DT? No.

> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 0xffff

Anyway divisors, clock rates and everything is human-readable so in
decimal, not hex.

There are also several issues further, like using wrong units (time has
a unit), but since this is RFC, I will just NAK.

Best regards,
Krzysztof


