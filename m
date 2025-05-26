Return-Path: <linux-i2c+bounces-11140-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A16DAC395E
	for <lists+linux-i2c@lfdr.de>; Mon, 26 May 2025 07:41:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23A87171845
	for <lists+linux-i2c@lfdr.de>; Mon, 26 May 2025 05:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC73A1C5F09;
	Mon, 26 May 2025 05:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cFmVplLZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59090282F5;
	Mon, 26 May 2025 05:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748238060; cv=none; b=aBF9xM1jAP0iNHezkf22DKrOAziKjBa+k+XT6rIkXdW+Dr+gDaXXETPKq3bkpDEhMSyXolBzztKxWJ4sYsD8i5P+nndBf2OBnMn3E0WRFm2SBykNq2pxr88bP1d/PuveaWb3nKp3pKzSux8ciJD/g0IGGBFTI+jPWOX38taJT+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748238060; c=relaxed/simple;
	bh=XRqjBzDwgvw1xP62Qq+XZ1FkytUcGBM5prprQQPTZFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=q9P78Ltl1IpdK0fkpX6kpHVIuiPKNvjItf/33+m9vbZbuUM9leAFDKs6Lo47URbHv5fTS+RjMSIwCq+selywU7RB3cVwz8aai851gozFPGQfL/G9TisPLUbGRB2t1tz/YYMMamEkYQW4DdT+OB9VWCCvCOiXvlfR43lpQrHDKic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cFmVplLZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9EA6C4CEE7;
	Mon, 26 May 2025 05:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748238059;
	bh=XRqjBzDwgvw1xP62Qq+XZ1FkytUcGBM5prprQQPTZFY=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=cFmVplLZxAboZR4UYVMChIsRFViFCY3046HF2Xrmu+HfB+6+OOBh60eQ8hFWiit4s
	 +ABXAYoP8DLLPCAk4jI4qC8offdiCsflbCh821YeAtQypEyzv8hsuOqwu0GR1mBykj
	 R9Gkv3TigUwjqSECQ7VQppDvF39zbWD2SO9jurYSuUl6D196/1igG3cB0lg3gA2FhY
	 WLlo8FI6pNI9anlqwpLUrwkbovMCvBT/gvIhZ+SmgOoCxaE5XO9rji7ekASMFffiWP
	 bl6hJcbhcioZIv00vrayHVkmKnwjqHECZLBc76fdUfL5VUsnJYAGarQxAR2Z2npETT
	 W7RMqHAMNNZHw==
Message-ID: <44b5d5f1-f45e-4d81-809f-707bd756257d@kernel.org>
Date: Mon, 26 May 2025 07:40:55 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: i2c: nvidia,tegra20-i2c: Specify the
 required properties
To: Akhil R <akhilrajeev@nvidia.com>, andi.shyti@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, thierry.reding@gmail.com,
 jonathanh@nvidia.com, ldewangan@nvidia.com, digetx@gmail.com,
 p.zabel@pengutronix.de, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250526052553.42766-1-akhilrajeev@nvidia.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250526052553.42766-1-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/05/2025 07:25, Akhil R wrote:
> Specify the properties which are essential for the Tegra I2C driver to
> function correctly. Though all the existing DT nodes have these
> properties already, it was not mandated by the DT bindings.

I was rather expecting to see explanation why these were missing.

Fixes: f10a9b722f80 ("dt-bindings: i2c: tegra: Convert to json-schema")


> 
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
> v2->v3:
>   * Updated commit description on the details and fixed indentation
>     issue.
> v1->v2:
>   * Added all required properties
> 
>  .../bindings/i2c/nvidia,tegra20-i2c.yaml      | 23 ++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
> index b57ae6963e62..c1d38e6ff7d7 100644
> --- a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
> @@ -97,7 +97,9 @@ properties:
>  
>    resets:
>      items:
> -      - description: module reset
> +      - description: |

Do not need '|' unless you need to preserve formatting.


> +          Module reset. This property is optional for controllers in Tegra194 and later

Your binding says Tegra210 requires it, but 210 feels like something
later than 194. Maybe that's obvious for people knowing that device?

Anyway, please wrap at 80 (see kernel coding style).

> +          chips where an internal software reset is available as an alternative.
>  
>    reset-names:
>      items:
> @@ -116,6 +118,13 @@ properties:
>        - const: rx
>        - const: tx
>  
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names

dmas, dma-names, power-domains, see TXT binding... or extend commit
description why this should be different comparing to original binding.

Best regards,
Krzysztof

