Return-Path: <linux-i2c+bounces-5897-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFD6963D7B
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 09:45:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 929231F231AF
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 07:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB98F189BBA;
	Thu, 29 Aug 2024 07:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eBTAm3X+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534D31494A8;
	Thu, 29 Aug 2024 07:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724917543; cv=none; b=eEVS4L+EL4Uv5NuyhslhUl8aaLVG6HLJcUcJe5m7tOaUBZvLo1j6d+idtn7xLkpF5Bc1tlCzPJdoSouKQPmIO7zyFZThlxz5YiOD/brf/yhYM55mmrLbCl1k/tlVAosYpzWCLvFWwoptSqibaGqZc1pRomKzb2Apc1WhTtvqixk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724917543; c=relaxed/simple;
	bh=t2pBKlRiTMiOn/r8axKPW5Aqs9fi+ZgunPNBqEtBxRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U+QlZsNTL/79TX3ANwxrsh/B6Dh6z7qFSJRiFMNdi24mjUyNC3gJ5I0/IKHz4FNVNn1g4zol2bVPqpuP/X2T6HJP3ULf27NilVr0VCg3zu/iTftBEGEXb73jRvS0kD1p+rTI5MU2WIJhSJvgkyxMBnxk6/SyIodTpN/f0OXwakI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eBTAm3X+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B972FC4CEC1;
	Thu, 29 Aug 2024 07:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724917542;
	bh=t2pBKlRiTMiOn/r8axKPW5Aqs9fi+ZgunPNBqEtBxRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eBTAm3X+wRwXIefQ5NCrSQ0W1fY37u9aIAsH1WepvhQAIVaS/0+LPKtUbnabvIOTS
	 a7qz/rCdbvy2+o8D9EHCkS6NLnxgKQrx/FUyf0geFvZEDOcsXxxbtBVQmES/gLv0m/
	 603xS1XELJ2De+Gg0379gD33Ns/QbrCxy719lRXIhW8qWZy5NA+pHJX07DdG7jijVb
	 uFf23mGSP+GvYEsqmF89VJ76B+in9dsH9p+l0++rAfdEN8+rnMgtjnes/VU9boiVMa
	 DXgT+VVfQs6UU5b85ALD7hqRfqMhxm5inIqS5Oze1afBciOPygNAXwlUFzlNsawCk0
	 e8oityt+QFgTQ==
Date: Thu, 29 Aug 2024 09:45:38 +0200
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
Subject: Re: [PATCH 20/22] dt-bindings: firmware: arm,scmi: allow multiple
 virtual instances
Message-ID: <sckognvfqfmkguimm3c2orolww6f5pigek46lb5o4w6kmx5rjs@xfaha3hxtsj5>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240828203721.2751904-21-quic_nkela@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240828203721.2751904-21-quic_nkela@quicinc.com>

On Wed, Aug 28, 2024 at 01:37:19PM -0700, Nikunj Kela wrote:
> This change extends scmi node name so as to allow multiple virtual
> SCMI instances.
> 
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> ---
>  Documentation/devicetree/bindings/firmware/arm,scmi.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> index 211f5254adf2..a168be6dd30c 100644
> --- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> +++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> @@ -24,7 +24,7 @@ description: |
>  
>  properties:
>    $nodename:
> -    const: scmi
> +    pattern: '^scmi\.*'


^scmi(-[0-9]+)?$

Best regards,
Krzysztof


