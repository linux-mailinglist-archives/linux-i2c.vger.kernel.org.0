Return-Path: <linux-i2c+bounces-5892-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D90A5963D31
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 09:37:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8383B1F25B3B
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 07:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FC371891AC;
	Thu, 29 Aug 2024 07:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dD1LiOHQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9368446D1;
	Thu, 29 Aug 2024 07:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724917019; cv=none; b=ksNxp0p0XBpFwmQhOGTaNEyASVmGRHab0RTknItl0uaAJCaFZwiiMuumttqZkpgvu90OO6SCKdzVrUkDdpVazss7/FjSE9nUOtX2sWKtXU4bs4n5kPPYRSKJ6OP9j1mLv3TpCiZ2ycr0rdP1EoHFmWdi2bOF0P6FR6IfeVhbpqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724917019; c=relaxed/simple;
	bh=VOH2tbPjus1K+75hQUURlDdBew1XrlSa96G/dSLpMow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UI1eMbxcXb3Cnb8AuqAguLshLqRr1ncvKPEJYNk0T6B2Cwy7Zbxe3Ot/TtG0dc0QWoVlIRVe8kbjdUjOxASbj1UXA/nG6oNwswsmM5oUC4H6hpSbAoCTcHxB3hx5w/ihwzJa+e2C6q+mkpb528pmvPL7J5p9FxeNg7skBobtlhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dD1LiOHQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC624C4CEC1;
	Thu, 29 Aug 2024 07:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724917018;
	bh=VOH2tbPjus1K+75hQUURlDdBew1XrlSa96G/dSLpMow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dD1LiOHQKYJ6888/AHJiuZt4q+YDLS8tlWv3rQvWYJx8GUybwuQaK0L93vtObjNL6
	 Exihm/meEN55jt4IbbMphTx5yW0U3HTyJJ32Pxy2QI6T0gUOlFzcwu3iEjwnOGC340
	 b5fVEiQDvnCDCkGL73Ti/NvI9w5WjRrN9c78fXXfcb232cJImJGb9ueVfPDpkYkfyj
	 XtEQhW7bVF53SttpSF+T0EC/GkP3JNk0fFFhWr/qS6KViQYCFkkk1qbN6LojkpVoEX
	 IG7E3Ch9wYjhG5pgY2+dU2vw8Vwdmi24GTp2ZyOvmX3HoMBjI5RGvPUEarU8wGkZM6
	 2/IWW77o49yig==
Date: Thu, 29 Aug 2024 09:36:54 +0200
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
Subject: Re: [PATCH 14/22] dt-bindings: arm-smmu: document the support on
 SA8255p
Message-ID: <ompfueg7civ5spjdumkhd7qgx4cnvjcftznf3z3q5duuxppt5d@fao7zx4oxfm3>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240828203721.2751904-15-quic_nkela@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240828203721.2751904-15-quic_nkela@quicinc.com>

On Wed, Aug 28, 2024 at 01:37:13PM -0700, Nikunj Kela wrote:
> Add compatible for smmu representing support on SA8255p.
> 
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Your subjects contain quite redundant/excessive information. In the same
time they lack information about device. 

1. s/document the support on/add/
2. s/SA8255p/SA8255p SMMU-or-whatever-device-it-is/

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


