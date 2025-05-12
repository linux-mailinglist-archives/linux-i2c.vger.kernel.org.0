Return-Path: <linux-i2c+bounces-10945-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27895AB47DB
	for <lists+linux-i2c@lfdr.de>; Tue, 13 May 2025 01:21:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9664A7B1EB0
	for <lists+linux-i2c@lfdr.de>; Mon, 12 May 2025 23:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 407FE26739E;
	Mon, 12 May 2025 23:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ceDZAcOK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E965925A633;
	Mon, 12 May 2025 23:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747092059; cv=none; b=OSbsIvZMbZ40b3x+2xtCQvuTHPbSY3+4KLNdKNqCaMIa0XqJVanxvORWDIaL8t6jSuWHrbT1v73bNCL8qw2H9sS6l1SYT+wwxoF+2NdXXOxXdRqd7MjaRNEQ4uhq5XLobM6E69i/0imjJ/I7T01x5AxgTTkwl+cgruon/YzqaUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747092059; c=relaxed/simple;
	bh=72Gw75hLLReEVg4P1Uy5kzFmeadOnBEzQln3lvoXjCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XjkaeSx5vYkYb3K9+9mY9aDyyy4Ra6uWQ9c7E1w270eEjCWIQBTn2T4H4kANEJVJ8PdHyFp6Iy0QHaVHpFlzr09CtJwMsAHvaztc71hChwnsbwLfOtKRxpH7AdmK4CZvwGPAsXgyrDrUacE3GSFOLYMmQUMiMKgpGUojJ8/LsTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ceDZAcOK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5E6BC4CEE7;
	Mon, 12 May 2025 23:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747092058;
	bh=72Gw75hLLReEVg4P1Uy5kzFmeadOnBEzQln3lvoXjCU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ceDZAcOK3UByprrPu9caFvlFb1I6Toyf5eXaV5aZjaZtULt0KbQpcVt902Vud4Sj2
	 m+zgvK6TUc3aAWvEQJl+mCZwL2Dcd1tVtKk5R01TIk6bYGRSU3PORMpLmvFd9QCgtr
	 EBLBOtw0+QNk5YIbwYhivizHhlLP33W72DhiE3qxnOfSs/JI74YhjE7GIJ6CAOzIRt
	 R6M+FS8WTbXzpB5tUEbCMLnsdqXlv2sRm0DM8mdFh3wndHcoFNIWLK9qGjq7ixPUuA
	 MB7ycY3ZyUEcT2XdxeJ2RfTd/SaCYc8SngEkiuA/CNt54FP1F1BwGhGQyeaMRFzwzI
	 YN+nvZogpM4Wg==
Date: Tue, 13 May 2025 01:20:54 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	thierry.reding@gmail.com, jonathanh@nvidia.com, ldewangan@nvidia.com, digetx@gmail.com, 
	p.zabel@pengutronix.de, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: i2c: Specify reset as optional
Message-ID: <vua7cq4nu5piz67as7asrfklimflpj2hznnd6oadcy36bglunt@ljhzegmt2jry>
References: <20250506095936.10687-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506095936.10687-1-akhilrajeev@nvidia.com>

Hi Akhil,

I am assuming you are going to send a v2 for patches 1 to 3 with
the proposed changes?

Andi

On Tue, May 06, 2025 at 03:29:33PM +0530, Akhil R wrote:
> Specify reset as optional in the description for controllers that has an
> internal software reset available
> 
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
> index b57ae6963e62..19aefc022c8b 100644
> --- a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
> @@ -97,7 +97,9 @@ properties:
>  
>    resets:
>      items:
> -      - description: module reset
> +      - description: |
> +          Module reset. This property is optional for controllers in Tegra194 and later
> +          chips where an internal software reset is available as an alternative.
>  
>    reset-names:
>      items:
> -- 
> 2.43.2
> 

