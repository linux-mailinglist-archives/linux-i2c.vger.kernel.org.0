Return-Path: <linux-i2c+bounces-5882-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20015963B9C
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 08:29:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52DB71C24082
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 06:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6876615C136;
	Thu, 29 Aug 2024 06:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PlcZJT4F"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8CA14A614;
	Thu, 29 Aug 2024 06:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724912949; cv=none; b=YDN/DgoQQK2RK7sGW4AFYiNRNi7IwUvtm13druKhCfJ7r9rBoacom3ghrUu4AohDHHz3lGhsGmBZU0AQEfrs4hL66io98rGRXiMcsx+0pOATXW4Ny6917hjkAZNdtDNnoDXg9fo0NuP6+zuhsWZcRDBQ88QM49tnvQBrIj5M4AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724912949; c=relaxed/simple;
	bh=vwvB0eQ2mbK4jMIDGT/ystLfn4DYmeXJlIDSgtLMP3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hBUYElRCFyl9QYOktKcPHpsIY0V84O4eejJ3kN23QMqC/pEwe+63PxEPSDuyzVNSRZkRWgAkNoNH4YJF3jiSAFFsv4xaHeBZWW4s/Atiqgg9kD8b4DngM8dTL385IXqwlLVP44EbFmDQk813u260upMH1Trd3vOOl+Jws1NaL8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PlcZJT4F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0CCEC4CEC1;
	Thu, 29 Aug 2024 06:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724912948;
	bh=vwvB0eQ2mbK4jMIDGT/ystLfn4DYmeXJlIDSgtLMP3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PlcZJT4F7bOOHQ7Mc250hHoRQQr5vhlp/lDBjzOUEwCnxmMNVGH9E4IQd2Ca0yuyp
	 Ecff7i/zOOIFRuOcG9XLJEErO/1/YmGbRJdiv6lFlxp4wGMYrr9crnIHMHlwJLHXQy
	 TlG4Wq5+mJJGKAx/XLYlo3MIufM41WiIhUQ4dBB5k1AiqGyEVKY4KTSFqZNtCfXMBr
	 3BwvHVsLXPeowjSn6ZwhzFhMmc4cxHtgWWWtVp7vFYAFAUVYAhO0tuRcccZNZ1LUQP
	 o6gifrJ0dsbvOIEYJLCzoZpKj7RYmcdUI3PgFZAn9ZM+0wKw/zvGDPuw7mB92fjI19
	 iGFkPOAd5Ienw==
Date: Thu, 29 Aug 2024 08:29:05 +0200
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
Subject: Re: [PATCH 05/22] dt-bindings: mailbox: qcom-ipcc: document the
 support for SA8255p
Message-ID: <elwiasgdiqb5cvo5jy6dtevrmt4lleallq2maqlugy643q4kok@zk34niqejyi5>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240828203721.2751904-6-quic_nkela@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240828203721.2751904-6-quic_nkela@quicinc.com>

On Wed, Aug 28, 2024 at 01:37:04PM -0700, Nikunj Kela wrote:
> Add a compatible for the ipcc on SA8255p platforms.
> 
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> ---
>  Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


