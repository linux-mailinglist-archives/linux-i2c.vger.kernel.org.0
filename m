Return-Path: <linux-i2c+bounces-5893-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA1C963D40
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 09:37:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A15771C23F1B
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 07:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9E8A1898FD;
	Thu, 29 Aug 2024 07:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="swgDRYnK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D03514B094;
	Thu, 29 Aug 2024 07:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724917048; cv=none; b=BzcBoJqRsZQvDksZfCDrqW/7k+f6FlQ+GunDaz9L+BN3CM/1/acX8wlVp9Ixt71YFEObhC73G0dLz0bnURBwCeTplr+Gp+6oz1HjTYEgpK5mzF7OqJc3QP2g5pIz/SlkS9IBG0yMaQk0ZjLWpa4eckfL3a8KnPCxlophpb8IRx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724917048; c=relaxed/simple;
	bh=iRSnzmU9349cfA6uxyUkvmvKs5SVum6XAGlXKsNjOFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ITWOcSODHFxMdsO3PSHPKcnLqYbtWw/gr+N3QGgVrmpH8PGZd6mrpK1oztfqz28Rq+FGE9DAzK3UUE9nu+4bTWLTlODGUjrsv63iE98Qw+vLRATyUbzEgE3YIiC4FaD4z/LBTuqyduq1M0fMdSoe6H2v5vJZcoFEFcPiZ8vtWFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=swgDRYnK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E6F2C4CEC1;
	Thu, 29 Aug 2024 07:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724917048;
	bh=iRSnzmU9349cfA6uxyUkvmvKs5SVum6XAGlXKsNjOFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=swgDRYnKKhVxUtxO4YL5OxpTqJVDQn2dIqrspPfeC0m3BwUy58D6Qn1MTxs99ok1e
	 ogAe77zFpRqbC5jI8IGfm3b9x90RnKJjJt5Og2e1hn+En0QbPkraAtZV67PwuZtpOm
	 bfAHhpP542WgbLeNhyePwmOd+Cdxy5gXA6KvwEKUL5jkH1Vsou+6l9L3X54czDPnfk
	 mmegLw2tk0MMKdzQoH/TK6hxCisPYRYsVuGHk19obLTAqBLEMvOIFUdeiUy+qRVdyY
	 W6d2f8IdIDmPgHlMkxx72/ja0a+V76+b0JyRnsz4D9U3npGkdVdkUT4N9rbFkddzhT
	 WOBlM9S4fK3BA==
Date: Thu, 29 Aug 2024 09:37:23 +0200
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
Subject: Re: [PATCH 15/22] dt-bindings: mfd: qcom,tcsr: document support for
 SA8255p
Message-ID: <qfhot47b5eht6fi6mgtaixqcuesgwwolgnftajqw7vc4lxny74@kfgny353w5e7>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240828203721.2751904-16-quic_nkela@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240828203721.2751904-16-quic_nkela@quicinc.com>

On Wed, Aug 28, 2024 at 01:37:14PM -0700, Nikunj Kela wrote:
> Add compatible for tcsr representing support on SA8255p SoC.
> 
> Signed-off-by: Shazad Hussain <quic_shazhuss@quicinc.com>
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


