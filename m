Return-Path: <linux-i2c+bounces-5885-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC7A963CCE
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 09:27:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 47931B23B06
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 07:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9E7F176AB4;
	Thu, 29 Aug 2024 07:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nZwhlX6H"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587624C70;
	Thu, 29 Aug 2024 07:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724916428; cv=none; b=UChOJmpX0dMhr/1NmnJkyIqMIujsDUFU0AaNn+o8xATeAoR6p38/63qkeF1iyQ91R3V7y2E6P6JnqPFsOqFTNeMlWVizuKBUcPCgeAW7wE8EUPj+svP9cKqQaVUctHlK1fTLpHNJ3PuwZBq9OY8jm30/mIcwxvThEqDTSKYN4P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724916428; c=relaxed/simple;
	bh=kas2UfbBo6mybKuK9Q1mWni5hpqkBy1F7/8Lcd0a+bY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LO0oNMouYfe99zeO2yhMFT3mR7XuRpz+8jRdoFsUUQ0uqZkOuLBJT3pCpkepjQqt2wpNeculKtM7DVXx/uYBfInXZbYI8sK9ek4cCyN7Rt6uPY5LMtuU5De/GBEufxTC6P3TGu+eq47s7w54Gs+viiwpDHVhGIcCBSIQBJDO2GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nZwhlX6H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50D77C4CEC1;
	Thu, 29 Aug 2024 07:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724916427;
	bh=kas2UfbBo6mybKuK9Q1mWni5hpqkBy1F7/8Lcd0a+bY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nZwhlX6HTAgGQfPoz8ymTGoYIGctq3+Qy2B5yNlOZ3/6CveK0pPb6V23mV3XlwcDz
	 JUR4M2xD4xWYYheksAJHFOh9Mdr1lGbVWQeoh+T2XtIRa30doUstAX6TqSZGuv27Cg
	 BZVuG9qnrmDCwnqkihjN8LFCAWqQT71cdXGrjgkGQfr8qqlFYrH9077UipLHNlRcD6
	 r5z+PdoLleVM/tewojyzxPwHO8+YSEF+t8Kcl4JdQKb+QfocisuJU5KWqwkIl8GSlq
	 uoKKTKCTf3EkIk32ve8XdiZ8V0az8toDSsng1u9kobI2sfP4i7mKoB7FYmLVvlSC7m
	 Y/xt2YFkua/fw==
Date: Thu, 29 Aug 2024 09:27:04 +0200
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
Subject: Re: [PATCH 07/22] dt-bindings: crypto: qcom,prng: document support
 for SA8255p
Message-ID: <wpbylhiax3dzdgbvtn54i3ibntpmztulmeu3i7bo526ckcu32o@jwewcuusb2nb>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240828203721.2751904-8-quic_nkela@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240828203721.2751904-8-quic_nkela@quicinc.com>

On Wed, Aug 28, 2024 at 01:37:06PM -0700, Nikunj Kela wrote:
> Document SA8255p compatible for the True Random Number Generator.
> 
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> ---
>  Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


