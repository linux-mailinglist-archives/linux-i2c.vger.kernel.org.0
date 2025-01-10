Return-Path: <linux-i2c+bounces-9026-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1042A09678
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Jan 2025 16:55:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8613A188D568
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Jan 2025 15:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79D4D211A0E;
	Fri, 10 Jan 2025 15:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rzqzquzW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E91E2066E5;
	Fri, 10 Jan 2025 15:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736524511; cv=none; b=Kq+g5ysx+CSzJrktOUOZtJmj3su9PYbEXLg8YTcYu4kAiEoZVgsmsi49AI5TNw4X4wRUe3LnWGyGNqOHnb5xxjNB9gdn7+mDxDB8Uo0BGmf+AOfygo6NKogRomaPhDQ9kTKND713Sofj++igv8jbTxpagkZHdggZAu4koTQ36d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736524511; c=relaxed/simple;
	bh=cxgcodb4e90kVHAVko7y1SryV6fkeHPZnSx7+lvHgP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t6VR0Zm7Ah7MJmI63HfpvEqPwTPUs1qRw8ickcEJPeD8h1+HhM4Z8gl1pRYq+0II1eKLCYYmiqcbaUFS1pKkx/ACfbz1X9IKgriUg3LCLCRphW84uabbCCBo7nobehDrnM3HsTsuhMlgHp5l2ZXzX0D7td+axkk7IAjrren90rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rzqzquzW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80550C4CED6;
	Fri, 10 Jan 2025 15:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736524510;
	bh=cxgcodb4e90kVHAVko7y1SryV6fkeHPZnSx7+lvHgP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rzqzquzW+pNKRP63ZemLaP2e9gNDP1Pxr/iZA61ubBMy4uKlaxAsruJG7mE2kTAAa
	 w1da8n0LOysp//L6hr6V0DG/nD6t1HvfUKBZQkcpDh/1bCXqyiIzH3YkK3FR40MUiO
	 se0M8IuZQxHc22LDGjanDNmNY6d7V+ml4lkAbbbx9Md4OIBlfbvH2tz2SYkw03TneI
	 Fv1fivoGdFuupJJYB7tkwQcpxXoeYN+nRjG2yUKV/mGZryF02/pw4Nf74X+SdMNqYq
	 qWHqSBIsNUbIrXO5Y2rQOCILRbYa+uhSt45IlJU/bH9riDozgsxubwafmRLv/1/ztB
	 gy0ghgaIhQ2GQ==
Date: Fri, 10 Jan 2025 09:55:09 -0600
From: Rob Herring <robh@kernel.org>
To: Kartik Rajput <kkartik@nvidia.com>
Cc: akhilrajeev@nvidia.com, andi.shyti@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
	ldewangan@nvidia.com, digetx@gmail.com, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: i2c: nvidia,tegra20-i2c: Document
 Tegra264 I2C
Message-ID: <20250110155509.GA2935916-robh@kernel.org>
References: <20250108110620.86900-1-kkartik@nvidia.com>
 <20250108110620.86900-3-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108110620.86900-3-kkartik@nvidia.com>

On Wed, Jan 08, 2025 at 04:36:17PM +0530, Kartik Rajput wrote:
> Tegra264 has 17 generic I2C controllers, two of which are in always-on
> partition of the SoC. In addition to the features supported by Tegra194
> it also supports a MUTEX register to allow sharing the same I2C instance
> across multiple firmware.
> 
> Document compatible string "nvidia,tegra264-i2c" for Tegra264 I2C.
> 
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> ---
>  .../devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml         | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
> index b57ae6963e62..2a016359328e 100644
> --- a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
> @@ -80,6 +80,12 @@ properties:
>            support for 64 KiB transactions whereas earlier chips supported no
>            more than 4 KiB per transactions.
>          const: nvidia,tegra194-i2c
> +      - description: |

Don't need '|' if no formatting.

> +          Tegra264 has 17 generic I2C controllers, two of which are in the AON
> +          (always-on) partition of the SoC. In addition to the features from
> +          T194, a MUTEX register is added to support use of the same I2C
> +          instance across multiple firmware.
> +        const: nvidia,tegra264-i2c
>  
>    reg:
>      maxItems: 1
> -- 
> 2.43.0
> 

