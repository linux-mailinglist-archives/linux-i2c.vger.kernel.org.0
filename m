Return-Path: <linux-i2c+bounces-5935-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B0F964E3D
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 20:52:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E9A8281EE0
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 18:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D577D1B86CB;
	Thu, 29 Aug 2024 18:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b3KbXqaC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58ABC1494B2;
	Thu, 29 Aug 2024 18:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724957562; cv=none; b=LZbe/Y7zrWHxddgquZIl8rZZPIqRSuMO392eH1F5SrCPTcemQLLOG9nFB7FVOYKcZ+67asMoUJodlgp8Lvmxw/n0A2XAAuowX6+Ijii2h0QK6QLoRFStoTeZEJl13CipZWbApXt9neQfaweasddOSAB0QHpBRtSkeToJRt02udU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724957562; c=relaxed/simple;
	bh=sji9qUHLrqHNW9BPEl5XCsnv+ETqRB6bWthNHqjS8ks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DFdCyrQ4Bf3euJjXvXuE/CyouwzgK3syY0widik7Q/ebjy3tUUUJ9nChWgA1+YJ/1m6igJVs7of7OuMFJ2XMcGqsCWt3AVitRR1050JmaUq+Wwb0ya+QfBcW3SgjIHBCs8JJ9tNr+jXDbil2jQdVcFP9v4HJEXeGKz8kIBZPJ7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b3KbXqaC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9460BC4CEC1;
	Thu, 29 Aug 2024 18:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724957561;
	bh=sji9qUHLrqHNW9BPEl5XCsnv+ETqRB6bWthNHqjS8ks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b3KbXqaCwxgQIesaGWz0wsMeMBDUv0yytXgal8R6jeuHVlZqaBLT7/9XFox2ERjcO
	 9NVN1CkLl68ZV88Z4sPzema+0lLKi1WA0TmWgzLPOTzGmjZUBvGNn/SWT4SddOhTM/
	 M9sBWFbm8vqMVWXfc2IyB/nXdMXuukiAfzykL9RE+2IEQYu4Sl60FNcfnXl3jHkDw5
	 Ocg2HPMWl1idVHFtmWIgFAmHBkn1nmp6dIMj3hy7bcQmvFQjkKk/DDY3fMlWOhTpma
	 a7pVUtKxtUJPC5laEA4kBh0oL8DdIeF14K4KeeysXWVQTM83Rs8F9Nm1lC9kZ64g5Y
	 ae33sp3w6Xy9g==
Date: Thu, 29 Aug 2024 13:52:40 -0500
From: Rob Herring <robh@kernel.org>
To: Nikunj Kela <quic_nkela@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	sudeep.holla@arm.com, andi.shyti@kernel.org, tglx@linutronix.de,
	will@kernel.org, joro@8bytes.org, jassisinghbrar@gmail.com,
	lee@kernel.org, linus.walleij@linaro.org, amitk@kernel.org,
	thara.gopinath@gmail.com, broonie@kernel.org,
	wim@linux-watchdog.org, linux@roeck-us.net, robin.murphy@arm.com,
	cristian.marussi@arm.com, rui.zhang@intel.com, lukasz.luba@arm.com,
	vkoul@kernel.org, quic_gurus@quicinc.com, agross@kernel.org,
	bartosz.golaszewski@linaro.org, quic_rjendra@quicinc.com,
	robimarko@gmail.com, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-crypto@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org, iommu@lists.linux.dev,
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-watchdog@vger.kernel.org,
	kernel@quicinc.com, quic_psodagud@quicinc.com,
	quic_tsoni@quicinc.com, quic_shazhuss@quicinc.com
Subject: Re: [PATCH 21/22] ARM: dt: GIC: add extended SPI specifier
Message-ID: <20240829185240.GA914553-robh@kernel.org>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240828203721.2751904-22-quic_nkela@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240828203721.2751904-22-quic_nkela@quicinc.com>

On Wed, Aug 28, 2024 at 01:37:20PM -0700, Nikunj Kela wrote:
> Add interrupt specifier for extended SPI interrupts.

What's an "extended SPI"? Is this a GIC spec thing? If so, what version?

> 
> Qualcomm SA8255p platform uses extended SPI for SCMI 'a2p' doorbells.
> 
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> ---
>  include/dt-bindings/interrupt-controller/arm-gic.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/dt-bindings/interrupt-controller/arm-gic.h b/include/dt-bindings/interrupt-controller/arm-gic.h
> index 35b6f69b7db6..9c06248446b7 100644
> --- a/include/dt-bindings/interrupt-controller/arm-gic.h
> +++ b/include/dt-bindings/interrupt-controller/arm-gic.h
> @@ -12,6 +12,7 @@
>  
>  #define GIC_SPI 0
>  #define GIC_PPI 1
> +#define GIC_ESPI 2
>  
>  /*
>   * Interrupt specifier cell 2.
> -- 
> 2.34.1
> 

