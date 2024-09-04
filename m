Return-Path: <linux-i2c+bounces-6112-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1800396B1F6
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 08:39:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A3FB1C20BF9
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 06:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B0F213DDAE;
	Wed,  4 Sep 2024 06:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SrR2+7+0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC963126C0A;
	Wed,  4 Sep 2024 06:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725431966; cv=none; b=PHk2NaPvr8e8IDESY0k5GtQiAam5sjYxBACzZoMUn7o5GP4eKYsm7QcyMFhVHQxseznEs7uRwm0GKia1ONWiDBVKQ4hlmrqgjPWScswSepcYdhhFqCQErCER1/+cIJmHNpJ01iZWnfsIAMDGiZvcenlqoauvkQ9dxhxkyyjLEaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725431966; c=relaxed/simple;
	bh=ZP9TvyABzJYjITastypfyV+ucNqY9wFIJmCo4iIBo08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u2zvvAGIQIZcgOO/Q4EnUKfT6uR/sZDLrH14xUR8r5VmazMg/L/D7rqUBW59r9MKzksLRczv3dQXoM4feQ5KjoVkmGGGywqfZookNblM2zpm9NZw5jfWTZPsUhV4Mqo9/O+KT9F6BcKcgaeC6nzNix/vK7aa9W1LMCXB49F0HQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SrR2+7+0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8A69C4CEC2;
	Wed,  4 Sep 2024 06:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725431965;
	bh=ZP9TvyABzJYjITastypfyV+ucNqY9wFIJmCo4iIBo08=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SrR2+7+0rykbsWMW0lNInPQBuHBk4WNB2VPN69MlZKODkrcKLeXi23ntBZ3Y/Z6AM
	 rgurIOM0+HHT/cpz1XV1CIzFSI27qUNTBmlgCu4oI2iAvBgWIFvDHYAwr5WtUW+vGo
	 pez/LT9D47f1fHGRizhg0ufavHLDoQFkxQ6uTCI9oKDSUt9VSel2UBZYfq8ShShYfO
	 I2mr+vwAotkryAKGJH5SVJ+Z6c7xD5CQcS61Iogtq29Ns4ZY0eyfEXwMBlg+1MX/lU
	 +X6qrg437wxBpWwiMDYwkjq0a3SD+RhqW9xXGPLR8rZNK/TY4d3o5q51rb2j/4eFFr
	 96Ugz5bHxhEqg==
Date: Wed, 4 Sep 2024 08:39:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nikunj Kela <quic_nkela@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org, 
	herbert@gondor.apana.org.au, davem@davemloft.net, sudeep.holla@arm.com, andi.shyti@kernel.org, 
	tglx@linutronix.de, will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, 
	jassisinghbrar@gmail.com, lee@kernel.org, linus.walleij@linaro.org, amitk@kernel.org, 
	thara.gopinath@gmail.com, broonie@kernel.org, cristian.marussi@arm.com, 
	rui.zhang@intel.com, lukasz.luba@arm.com, wim@linux-watchdog.org, linux@roeck-us.net, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-crypto@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, iommu@lists.linux.dev, 
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel@quicinc.com, quic_psodagud@quicinc.com
Subject: Re: [PATCH v2 19/21] dt-bindings: firmware: arm,scmi: allow multiple
 virtual instances
Message-ID: <yl4raseujkl4ccponowaonowjpmjiybv5yd56pds6ep2lj2kow@gxoaxqyt2ask>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-20-quic_nkela@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240903220240.2594102-20-quic_nkela@quicinc.com>

On Tue, Sep 03, 2024 at 03:02:38PM -0700, Nikunj Kela wrote:
> This change extends scmi node name so as to allow multiple virtual
> SCMI instances.
> 
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> ---
>  Documentation/devicetree/bindings/firmware/arm,scmi.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


