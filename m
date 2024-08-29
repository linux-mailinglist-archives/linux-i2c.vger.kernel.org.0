Return-Path: <linux-i2c+bounces-5880-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDA3963B7F
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 08:27:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C37D1C226F5
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 06:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0127315C12F;
	Thu, 29 Aug 2024 06:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l7TiLvWY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6FF149011;
	Thu, 29 Aug 2024 06:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724912822; cv=none; b=E7/J275hv8I8dvNFZUYyIRNjRhlLi8r/rDVqtvtD4CwREL6oOQxK7F5419qTIPsOeKM5ODq2z76x7YtvfMXl1aInGd0tBC++elniVl2BSCLk1YUyW+fCWzMZRUCk+S1upfICxzSjK3+ziAy43KufflARr278sjX7hnfB8DGPDwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724912822; c=relaxed/simple;
	bh=LfMDqTYrMRzWFQuCi212tKc8pWfKm73B+o52D2AYjGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B13WwnpRTy23NwL+CjVtokitBsqo6RowgIt6HSjMHG5Xbw3B8yGXLH7R0MVKTX4uob9K3EaY+OkGQUxKdO6VZPvqKjByT0OLgWhoyJG4mlzIwsFmgX0pmbwLGhgCxgGU+F2mS5q6JDh6932tR6Urjz1VsriNrMxxp9KeRJY2f1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l7TiLvWY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44875C4CEC2;
	Thu, 29 Aug 2024 06:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724912822;
	bh=LfMDqTYrMRzWFQuCi212tKc8pWfKm73B+o52D2AYjGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l7TiLvWYLd78QE1/+HMOx7kgDsy5rrfYKFeOPJMxyG8m+uxlRlaXxdh3608rb+h6f
	 OoeSRhZVW256ytU7Kt83/asOVyMB53Ek3BN70FvMTPhdA+zpsJ2XRU06/f48+Na/Bt
	 4GrYhVyjswCBPQMklv/dSnDt3bJZfwwc+B6KoJmRR+SktQV1s0sTKe/d8lR5AeGYxr
	 xO1X9rD5uoeMCVWRbPgmnWRfeEXcbPt/ChRhZOx935LMlULwqcX2FnpFL6UAbfL9yI
	 00rrn0PJDZeKuATY7Jk4ufUmLoXJ058L3Mf7L1izzK5+zXn11uNoUU4hH4nclHM9SA
	 U5a5jyZhbd7pg==
Date: Thu, 29 Aug 2024 08:26:58 +0200
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
Subject: Re: [PATCH 03/22] dt-bindings: arm: qcom: add SA8255p Ride board
Message-ID: <xwd2xhe5aupumyt2nnwdxybls4okghlzmqkx3z2ah7wir45z7k@dkaqepbl5ows>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240828203721.2751904-4-quic_nkela@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240828203721.2751904-4-quic_nkela@quicinc.com>

On Wed, Aug 28, 2024 at 01:37:02PM -0700, Nikunj Kela wrote:
> Document the SA8255p SoC and its reference board: sa8255p-ride.
> 
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


