Return-Path: <linux-i2c+bounces-5879-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B7F963B75
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 08:27:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F27D71F250A8
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 06:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 373CC16130B;
	Thu, 29 Aug 2024 06:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mHBHUkqw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0E9149011;
	Thu, 29 Aug 2024 06:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724912804; cv=none; b=dWzOAzW83V20uXEcMbj8RHBysgqFaF8E5lTIRSu23Z+V4iLFis1SUO8j/ctGq5GqYNb1YsqX88CX6Hz7e9hM65HmoTYV99yvCVff66twi0oZjt5cAHL8RZ2apxW4XACsNxJQ7b8lcdgTvq6ZfQRR9yk5H2eHMAgIAwNB/3ZjWnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724912804; c=relaxed/simple;
	bh=xCvuFCxhoJ9OF21RGI0+zX8Di/pa3PvCKezEAzudvro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mu1P+Pjsz6zYUXKzTx6YvU9BpYA7TSDutBnyNRX3bLOd1ACv8beiybzid1b6nXdA25R1hAlKmWNpvPADf8t6oFQQf4MkgUFyf9iEF+N4B2/qSJxDZ7jep2dFR3y22416tDblYi6M1OEtIfT4H8klFLWFa9/w4EqW8RdrgQQIBVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mHBHUkqw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D48DC4CEC1;
	Thu, 29 Aug 2024 06:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724912803;
	bh=xCvuFCxhoJ9OF21RGI0+zX8Di/pa3PvCKezEAzudvro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mHBHUkqwMJ2Y5w2MO+6vndhBtnRFBmXhVqdnvEZ6Ku1dzK06/8ksRJuPFi7RkSAvg
	 9pI5sJkj84P3wcoUXy4SkhdX2T3nqXd6W9hMiT6jcZNATgSuMDeVp0YR1gd2brtJuY
	 Ek2GQrvZ+FWhMhWZdd5klI2oX3NlfRjk9aiqWiURKM2sqVmF1HbRf4yN7iDYEeOZT/
	 NP+IhizRz7SD11rqDCEwxpgUvP1SYARscHeZjF9x+iFo4RwRpu7uhgSOvTfYmm0IfH
	 B1RjSa+6HTTbDN0F5F0kDuraQHkwSfGIvNK05fiYPBEUViYqAYcvT732mwDgHoQAUf
	 jvs1dm7dtpTlg==
Date: Thu, 29 Aug 2024 08:26:39 +0200
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
Subject: Re: [PATCH 02/22] soc: qcom: socinfo: add support for SA8255P
Message-ID: <nnw35c2hdkhweardmqtfjdrvmxextuj7w6bmn2v6gkmqg5fhtt@iwkl4mphzkul>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240828203721.2751904-3-quic_nkela@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240828203721.2751904-3-quic_nkela@quicinc.com>

On Wed, Aug 28, 2024 at 01:37:01PM -0700, Nikunj Kela wrote:
> Add SocInfo support for SA8255P.
> 
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> ---
>  drivers/soc/qcom/socinfo.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


