Return-Path: <linux-i2c+bounces-5881-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 602B5963B8D
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 08:29:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBF7E1F21867
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 06:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2ACD15ECC8;
	Thu, 29 Aug 2024 06:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JYJ1MYc0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F2A14F130;
	Thu, 29 Aug 2024 06:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724912920; cv=none; b=IcR+QGGLCGHRMeP9T36FaLZpo1+7co0Ol9Zaq7Dh++LYymZgSuaYFztQFpH2xTPDIiEGgdXZ79T5aPDpkczCiN+i5d5xmkzUpGVpIk3O/FVkgKkLyxKKroFlwHytSomp4NgDV0KXuj/MU2LpyAL9oU4tEKfC3c19RafT6rT4mFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724912920; c=relaxed/simple;
	bh=54KP2b1xDA4wtQjCjQUVdKqmp8hEECRNDNsQhoEzaIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qsHRX2n5Jo9Dd/fY+OaORO2L7LgF/XJz9cYQpwn9chdOAmxw4zyve55Eazv8J5lidWGuDL25QV9eurrT+DDSgUx8Mji/TcfXlv/wB4ByXkM16U0OC5AROwq5d5GOzdqztf+Ns4t+ybEOMkf3fhrtxmQT7RrqDFFayGhZmCovtg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JYJ1MYc0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F1A6C4CEC1;
	Thu, 29 Aug 2024 06:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724912919;
	bh=54KP2b1xDA4wtQjCjQUVdKqmp8hEECRNDNsQhoEzaIg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JYJ1MYc0sBjY596GiqUr9H2WBjOFdoRIxSFEcphsRnfj37sRnXsccUjh084rTvh7t
	 GR5h44E+vhYdqqPZt6tssHYMWA4AIbBsicGeLhfVx65+8U42NcB+3K3dTljD8/gjOE
	 ULTbv76mim9vPBC4kqnobpU2EuE6ae54Ic3RhZwyOyo/N1RECstpN10ltdHI2j2Tii
	 oWDZw4NhWCKURPFNOgnnUSo8zzOZB3DLIneRcrjV+SCcIZqLG18PBM44pE9vMSXS5U
	 blOxv57xx/a2/N0Kf5oBeCWY6enxx7XB9JqKJIpZAPtFHOefxc8vVvLd3pJ8mZR16Z
	 zqucLA3318PTQ==
Date: Thu, 29 Aug 2024 08:28:35 +0200
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
Subject: Re: [PATCH 04/22] dt-bindings: firmware: qcom,scm: document support
 for SA8255p
Message-ID: <7ya5xi47oqkibqqwndcapermnuq32qmrd6dqttpcd6yps3axr3@u4hwvydgdfgs>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240828203721.2751904-5-quic_nkela@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240828203721.2751904-5-quic_nkela@quicinc.com>

On Wed, Aug 28, 2024 at 01:37:03PM -0700, Nikunj Kela wrote:
> Add a compatible for the SA8255p platform's Secure Channel Manager
> firmware interface.
> 
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> ---
>  Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


