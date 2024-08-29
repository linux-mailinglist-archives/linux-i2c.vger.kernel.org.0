Return-Path: <linux-i2c+bounces-5883-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C03F963BA8
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 08:30:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 094E3283A50
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 06:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9518216C845;
	Thu, 29 Aug 2024 06:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uGxEJxvy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178481537C6;
	Thu, 29 Aug 2024 06:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724912979; cv=none; b=CiPJZ6TfCPayefnmAACJqNg+fBTpxxjMdki7z22fEUuQRax9huuKcKVE9uOw8ZMhLdAEIhQiZlRsfFy7A2syzCVIDQEcdXTL1k1caTPNS5KVwkSyfZREWH9bQX09BLaA/BcDTt5nkRbcsp0wlpcTOsWdwlyQrjWzh3cuHREy2AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724912979; c=relaxed/simple;
	bh=QEGwTfeOKNBCYnuOm5Ciwg1Sy9P5G14jXqTaVuhe3gU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WNEsmytygkhtNiRWEE5RcN3wiSbSkElAY2g1cy7T7cQLTKVit2fMRqzv+BLLz4bbocktDnr1oK0a569TtkDWoDoPW4relCx9u+MOIBRzU0nqMWh4qTcXJFYPdc2ZH5NanhlRrZRlaecojyCQ4VdDVMILVs5dHMxSF9UqnX+Di2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uGxEJxvy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6BC2C4CEC1;
	Thu, 29 Aug 2024 06:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724912978;
	bh=QEGwTfeOKNBCYnuOm5Ciwg1Sy9P5G14jXqTaVuhe3gU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uGxEJxvykyMWhhAzRWoO2/0Z+Q/9sGqCqt4Q+TyAFYn4ejx5yCaQ02gxiQedHd0n4
	 NHT8ebtlZ1nW4qwZ0W6arGqWIvaQeVDkgka0mU0l7AzynJodW+hESSbmNtcN7ziy+j
	 ExziRk5SI4vzfAXYt8wxxS+LndWa5Dw6UfPahCoOjhkamSMKaI53OIDxN9vMxwmT8j
	 vkqWPU4z1ZP0ppat0+HKYNlom+ulC8OrmdvJ7++IYDEe6CCXPhCo5/oDrFVxNgodKQ
	 N+uTD3/mrGv9Meb8KIGrK7/x1VIaZ3cbNINmICQeqcR9V0utEyuODkesyHYto5JNzE
	 EOSTBQgwJHH9w==
Date: Thu, 29 Aug 2024 08:29:35 +0200
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
Subject: Re: [PATCH 06/22] dt-bindings: watchdog: qcom-wdt: document support
 on SA8255p
Message-ID: <2gn3ecfih4ir64sf7fmdulkvfksslvn2agkyfmyr3egxxwhzjx@wgezzaqcwozr>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240828203721.2751904-7-quic_nkela@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240828203721.2751904-7-quic_nkela@quicinc.com>

On Wed, Aug 28, 2024 at 01:37:05PM -0700, Nikunj Kela wrote:
> Add a compatible for the SA8255p platform's KPSS watchdog.
> 
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> ---
>  Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


