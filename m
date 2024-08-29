Return-Path: <linux-i2c+bounces-5878-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CCC963B6A
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 08:26:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E5A01F24FFE
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 06:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9B3B15AD9B;
	Thu, 29 Aug 2024 06:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aKxNSZcQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D781547D5;
	Thu, 29 Aug 2024 06:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724912793; cv=none; b=JfRcTEqbmp5ZX8jRFnKXSqXL/t6tYljPWilCgIGSIrbE6KWdtYOV5qOkBZLfwAj93fdVkvSZ/srJANuOSgnlXqzaaHs9NGdqg6m7o/qBQvV/jvJx+i2a/mhpAA3+teAyZeqfX2RcBCe2yQyX3dg/P6A9WDLXWAJJIZNa0XepAlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724912793; c=relaxed/simple;
	bh=X4b6JtUdMPQPMlJuLtBV2fk2oDdhcuWi2ciJPzgEQoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lFazORoBNWic18n0BjRbX3WsaoANasJujJcREGqE8Te1T9ypRHvm6cSeh52y5gF1mCeiNLPmHkp2YjPm5qgGHiOzfDGDok/vLkyFGNDaUrA7Puu+/rsM773Kcsk8Lh+1zGh5Cm/fMb3+Lk1VNHdDDhf55xB6tShiC/nrhVFXzFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aKxNSZcQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C979C4CEC1;
	Thu, 29 Aug 2024 06:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724912792;
	bh=X4b6JtUdMPQPMlJuLtBV2fk2oDdhcuWi2ciJPzgEQoQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aKxNSZcQtz4XSTWsLnqiPA98RPB5kQFA2Hv5lN4xJaOuvFqNTxIQ2jJFxb3VYaxoi
	 GCN3KXW/d+E4uwicF3CuXFClgQAZfUM1zl49oMKnNZN12b93HK6MZrSv/LLLj78qE0
	 ma+XslCKbnrgCdobzb2t9hGoLKa8KCi+CQiUF9ZaFFBeC0xgZDjxat/WGQAQ3llZdX
	 EAiJkgwHLrIkDdheXjQKHqiRtL8ooZjnvoIRRg8UeHBjoAbxGQngtfwQQP1ZoEfqhS
	 DLFXO/uqV98hlS1GAj7FD4h0qJ5k6f+pLmV7/cBoFLbiz5VtSdjhvAQWycA0Qi3Z0p
	 Jb2AyHgmw60yA==
Date: Thu, 29 Aug 2024 08:26:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nikunj Kela <quic_nkela@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org, 
	herbert@gondor.apana.org.au, davem@davemloft.net, sudeep.holla@arm.com, andi.shyti@kernel.org, 
	tglx@linutronix.de, will@kernel.org, joro@8bytes.org, jassisinghbrar@gmail.com, 
	lee@kernel.org, linus.walleij@linaro.org, amitk@kernel.org, 
	thara.gopinath@gmail.com, broonie@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net, 
	robin.murphy@arm.com, cristian.marussi@arm.com, rui.zhang@intel.com, 
	lukasz.luba@arm.com, vkoul@kernel.org, quic_gurus@quicinc.com, agross@kernel.org, 
	bartosz.golaszewski@linaro.org, quic_rjendra@quicinc.com, robimarko@gmail.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-crypto@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, iommu@lists.linux.dev, 
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel@quicinc.com, quic_psodagud@quicinc.com, 
	quic_tsoni@quicinc.com, quic_shazhuss@quicinc.com
Subject: Re: [PATCH 01/22] dt-bindings: arm: qcom: add the SoC ID for SA8255P
Message-ID: <vmz2tefrlti7y5boe3bx322skdndmpdqnr4tketl3ws6sibhgq@rnamodrsf5im>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240828203721.2751904-2-quic_nkela@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240828203721.2751904-2-quic_nkela@quicinc.com>

On Wed, Aug 28, 2024 at 01:37:00PM -0700, Nikunj Kela wrote:
> Add the SoC ID entry for SA8255P.
> 
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> ---
>  include/dt-bindings/arm/qcom,ids.h | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


