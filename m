Return-Path: <linux-i2c+bounces-5887-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BA1963CE7
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 09:28:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 464691C240A8
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 07:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 718B318801B;
	Thu, 29 Aug 2024 07:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mPmS4JIz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055B814A614;
	Thu, 29 Aug 2024 07:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724916510; cv=none; b=N4w8WV/nhWHEbaUaryn5hDkPIf1rNwLPEuoFUYWtt1fVtkwWwiENGWcQdJEkpaWGWqdGEL1MyzaP7fIW9ecC/mku+Dm3Di/Ysw7pQdgmuH3VEGxAgVxHDd547/crn4Oxoww+xCT2CINTG1MPz69eMNGxMF2BNpmAaJQ2tnPVGMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724916510; c=relaxed/simple;
	bh=FCi+f7m8HKaJXiHMHnZc/BcHyF0qY3gN69otvTk0tyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OKT5hlxMkCi7zl03LRCJoTVd/ZtgQApHN9Mz+0uv0M8uyQn7js1hS60Qq1pdGjlJf0d9DXB32J9vREKrspNCgSDSPDQ8SWLoOK4UKDD0NJ/WyR1IGaUiLtQs9ycwHd/AgwjWbT+I387lp4JMLBLPv+XbFgOSby3kzQu42KbcVuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mPmS4JIz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 973D9C4CEC2;
	Thu, 29 Aug 2024 07:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724916509;
	bh=FCi+f7m8HKaJXiHMHnZc/BcHyF0qY3gN69otvTk0tyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mPmS4JIzZmy86NH8RHLrHJOjBOfDIRRhwCqNXRyY42LuTs+lY9Bip3INhSPKtIdXk
	 VFL9ewhBy4XRdTglAL4o6ESZxzKLnmy/iC0nNOcBtEVdUIRAI+YCDpcx3w+uu8NLDV
	 iVlYb8LnoKKliK93dHaHIiz/rI70km6dzkMxQ/z24VqXarrEiC5kXtNL3z8DFNlR9l
	 KXZ0MtXVTw99Hz24SbhejKLxaBbcZuLjf8+DqxWQPzBv0rlSgAXlb/kdP4KpVmOalY
	 068Uq/pj9C+sLB09sx0O+ZmXDHLhHIc/JgOmAH/MtTYYJ+iUTWWAjCzR21LNJJZT6s
	 BBvmFQ3leWmWg==
Date: Thu, 29 Aug 2024 09:28:25 +0200
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
Subject: Re: [PATCH 09/22] dt-bindings: soc: qcom: aoss-qmp: document support
 for SA8255p
Message-ID: <cw227sg7eevqwm4ggmpd6ilryov5kmx7vztmlwjkzojiydxicp@b3ytl24k6kdb>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240828203721.2751904-10-quic_nkela@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240828203721.2751904-10-quic_nkela@quicinc.com>

On Wed, Aug 28, 2024 at 01:37:08PM -0700, Nikunj Kela wrote:
> Add compatible for AOSS QMP representing support on SA8255p.
> 
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


