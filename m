Return-Path: <linux-i2c+bounces-5890-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D13963D13
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 09:33:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 728E5B21D87
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 07:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB41C18801C;
	Thu, 29 Aug 2024 07:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z9AGkU7A"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC691F61C;
	Thu, 29 Aug 2024 07:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724916766; cv=none; b=t2H+3R9lbl9uGeMU5esvtkxzf+oXBhRPyf2sTQBr3V6x/5XwHSMqJimL1Dyo7N67E8W8Z8RCioThU3OQB6Hh13mvFHbKpn04K07x8d5cBhfIKqt5Skm4Dx1NYuIcuZ3SkwMUnRzlgn36FnEgzMZhCQyL7yjeum/iFoXQCiqe8L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724916766; c=relaxed/simple;
	bh=vkHpaH3qkj1O31RDXYjVb/zPpSlyirw3U9QEyKPqHYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tTq7nQFzn3tXVRkwQKD9GS3eH+gU/5B7xUGeq1LbkvmFc1KTMWZLzfbQmQifk7BuVZNFJM1kzKebgu2QCNvAX6mEFPhZyjyHa1Vef0AOQlkv3tTi70prF9e0fhGfwfnbnxUYPyFvXvUGkYhF2sqipWQHRoFdj5KlxOc4aAQ0MmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z9AGkU7A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64132C4CEC1;
	Thu, 29 Aug 2024 07:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724916766;
	bh=vkHpaH3qkj1O31RDXYjVb/zPpSlyirw3U9QEyKPqHYQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z9AGkU7Av/TpSDoEMcImQRUPaw7R1+WCnmeEJyShT7jhup3Jynfb+IvWt7/GgdXQy
	 oB6kDqBrGGWfLnuGYmQ122LmhotrPsa7NEyqUU2L4Et6qhnEKV3Q8yc31+RupuJbPW
	 niKBLjG5xb39WsL6qQz3uQoeyjxuy+XHtE17nca0b9OHmDCA4yAaf8LyWqApQlhT09
	 L2xwWgSkQ3Xx++VUJhdZxBCFCd0BRUnJQqg800SxjNrpXAvdzIz/5WoimzMSkWPIVA
	 UWqLCp/i6ghSZDz0now/bbjZwAhaJUi//FpUtSBJyzUfr6nWM/Hak814xlUqvriJAd
	 IHt790E3I/99A==
Date: Thu, 29 Aug 2024 09:32:42 +0200
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
Subject: Re: [PATCH 12/22] dt-bindings: cpufreq: qcom-hw: document support
 for SA8255p
Message-ID: <ym3udlhcoluzccwm6fwxd3kd3m6g7nsxd5trxodgyrl5wv66xy@l2eshk2unj35>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240828203721.2751904-13-quic_nkela@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240828203721.2751904-13-quic_nkela@quicinc.com>

On Wed, Aug 28, 2024 at 01:37:11PM -0700, Nikunj Kela wrote:
> Add compatible for the cpufreq engine representing support on SA8255p.
> 
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> ---
>  Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 1 +
>  1 file changed, 1 insertion(+)
>

You need to update allOf:if:then section.

Best regards,
Krzysztof


