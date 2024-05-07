Return-Path: <linux-i2c+bounces-3455-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE64D8BDBA1
	for <lists+linux-i2c@lfdr.de>; Tue,  7 May 2024 08:37:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DE221C20E17
	for <lists+linux-i2c@lfdr.de>; Tue,  7 May 2024 06:37:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE46678C8B;
	Tue,  7 May 2024 06:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DdTY2SBZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691132EB08;
	Tue,  7 May 2024 06:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715063859; cv=none; b=CP/xAHG1aG4sKypD423ECaZt82L0o+pWtMsodPjZRLZUZyIl2t+9iHOjpAnMvbsZFboZrg98HcG88JNLJQBErpSCN4xRi19E85uetwKEl+ZHt9bYFxCotvjPlKOAPFc2XreeX4u+Y7wkLv0g41xMp8YRmypf39nSDknABTXMUi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715063859; c=relaxed/simple;
	bh=So5cWA9X/plmkFRBimltC9aU3la3EuxEVdH1kzJTYmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rZSwyF+zS3R19osSsY0dQVeD2dVrXJR71l64ICAExBpOFhy0uwtP2942k/51gEMhKf7vgK1rkF44fg1bR0uyYEllWTXCSexRTQ3pez43p7KvgAcASZqw0/1ZcIot/vu6VPr+ADGnZwJVX9My0Ol/QgwRSZCNjjd2oOZu9t434VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DdTY2SBZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C91D5C4AF63;
	Tue,  7 May 2024 06:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715063858;
	bh=So5cWA9X/plmkFRBimltC9aU3la3EuxEVdH1kzJTYmE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DdTY2SBZ5TwZQSl3KEq39YQvqzELf14NOBJg+qVN3UILiefALRvquwFcp1oePXPVI
	 XRZN8WUR3lUl87s0KT/rfwVzAxq9iSQJu67hfYTmjMprz3n+DZakLzXMsIEhEUuqD5
	 bWcexrvgfMLz0HWvep7i93EUsLDHKt0Z3W3bzy3mGKH2pM+1fRMXR8TbFMzL4mAxno
	 6B0lNUnQr70OisPBstXNqklz+3oCI9J/7WzYrbWpdzP4d6WoSw8E1nB9y3BX4p4NtL
	 2hvjunY3VFlp7VzwPGBu4vZRJbimIkM8/tHWeE5jqOEsvzgAoS4nUs6CPY9NU7XE4M
	 ecaWtAvsGgWYQ==
Message-ID: <321b9a79-e4d1-4cdc-80ba-c226a6b2cdb4@kernel.org>
Date: Tue, 7 May 2024 08:37:30 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 09/11] sdhci: dt-bindings: configuration settings
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
 <20240506225139.57647-10-kyarlagadda@nvidia.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240506225139.57647-10-kyarlagadda@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/05/2024 00:51, Krishna Yarlagadda wrote:
> SDHCI vendor tuning registers are configured using config setting
> framework. Document available config for Tegra SDHCI controllers.
> 
> Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
> ---
>  .../bindings/mmc/nvidia,tegra20-sdhci.yaml    | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml b/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml
> index 72987f0326a1..002bc1ffc156 100644
> --- a/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml
> @@ -177,6 +177,37 @@ properties:
>        operates at a 1.8 V fixed I/O voltage.
>      $ref: /schemas/types.yaml#/definitions/flag
>  
> +  config:

No. This node does not re


> +    description: Config settings for SDHCI devices.
> +      Config setting is the configuration based on chip/board/system
> +      characterization on interface/controller settings. This is needed for
> +      - making the controller internal configuration to better perform
> +      - making the interface to work proper by setting drive strength, slew
> +        rates etc
> +      - making the low power leakage.
> +      SDHCI has configuration based on device speed modes.
> +      - common is set on all speeds and can be overridden by speed mode.
> +      - List of speed modes and their config name
> +        "default", /* MMC_TIMING_LEGACY */
> +        "sd-mmc-highspeed", /* MMC_TIMING_MMC_HS */
> +        "sd-mmc-highspeed", /* MMC_TIMING_SD_HS */
> +        "uhs-sdr12", /* MMC_TIMING_UHS_SDR12 */
> +        "uhs-sdr25", /* MMC_TIMING_UHS_SDR25 */
> +        "uhs-sdr50", /* MMC_TIMING_UHS_SDR50 */
> +        "uhs-sdr104", /* MMC_TIMING_UHS_SDR104 */
> +        "uhs-ddr52", /* MMC_TIMING_UHS_DDR50 */
> +        "uhs-ddr52", /* MMC_TIMING_MMC_DDR52 */
> +        "mmc-hs200", /* MMC_TIMING_MMC_HS200 */
> +        "mmc-hs400", /* MMC_TIMING_MMC_HS400 */
> +    type: object
> +    unevaluatedProperties: true

NAK.

> +    properties:
> +      nvidia,num-tuning-iter:
> +        description: Specify DQS trim value for HS400 timing.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 0xffff

"iterations" is decimal value. How it can be 0? 0 tries to time?


Best regards,
Krzysztof


