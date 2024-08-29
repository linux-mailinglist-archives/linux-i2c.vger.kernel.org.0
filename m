Return-Path: <linux-i2c+bounces-5895-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76885963D60
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 09:42:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 217321F25CBD
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 07:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F104F1898E7;
	Thu, 29 Aug 2024 07:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PulgRyl8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A505446D1;
	Thu, 29 Aug 2024 07:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724917345; cv=none; b=jqx5iohvfKQDLO8Gd4GTuVugnpUpgy+Yt41XFNeMYY4tVAFB8SLsDsyF3bQKMlnb8l3ntTxTcDolyEtN1AAdIxVoX13NoyAT4ZUgzsxFaSxs4YhjajfeerYYMtpwNN9iojAQB3px1liBnyvAoPQS6qVkf0TKKgP1R6eLYPJPHlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724917345; c=relaxed/simple;
	bh=4k+VK+qgrfDb0w2w3idoWENP2DDhAdzceWSklRwf7P4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JDylu2zKVFUBq9dpFvS+FdUxmVqLWBf2bw94NdWXejXKvHH6bpLBBlFWK07PUBre850oHsvFcZKsmLZwQIj/VrfP8eTBwiHx1BfAWUMefbJ+N9zk/EFwQiKF+qx1nWVUEuR1IlzDEYVjlh20PVJRS+XEzgwZZzxJkOhh9/9XuKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PulgRyl8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A30CC4CEC2;
	Thu, 29 Aug 2024 07:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724917345;
	bh=4k+VK+qgrfDb0w2w3idoWENP2DDhAdzceWSklRwf7P4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PulgRyl8Y+sxoCWYkexlheA8poT3bxnfJoMKL9msUWpRA9uqFLa/5HFze+VURmMFY
	 GKaa47xG9JySl7iGi8PPnjKKojm3CuOwRMwhITCuQZCx/lOptSgx+zEaJ2BcnjuNBl
	 pyCFIHW8v0EXC1Snw4G5j8SVwePQeVL0dltIPTyweRsG8B5UF5hzN02lcD8kLs2nSW
	 AGDsE8N3UL6TZw87YhXJ8xpWtG7a2SxUpEqsRg5mm3vJ03CX7xOOptX+75s8SzwIAV
	 4fK2uj2Y97urlq/n4rioOxT7FpBdnFekzoLxOk7d6uTqC0iDrNDZl5aooPOMaJTx/O
	 n0fMk0u384GFA==
Date: Thu, 29 Aug 2024 09:42:21 +0200
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
	quic_tsoni@quicinc.com, quic_shazhuss@quicinc.com, 
	Praveen Talari <quic_ptalari@quicinc.com>
Subject: Re: [PATCH 16/22] dt-bindings: qcom: geni-se: document support for
 SA8255P
Message-ID: <zzznoxebkrksnpzmk55cff3wz5lhb7dd3qzcvtzkjjv2usmvbr@ebmlirkmahoj>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240828203721.2751904-17-quic_nkela@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240828203721.2751904-17-quic_nkela@quicinc.com>

On Wed, Aug 28, 2024 at 01:37:15PM -0700, Nikunj Kela wrote:
> Add "qcom,sa8255p-geni-se-qup" compatible for representing QUP on
> SA8255p.
> 
> Clocks are being managed by the firmware VM and not required on
> SA8255p Linux VM hence removing it from required list.
> 
> CC: Praveen Talari <quic_ptalari@quicinc.com>
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> ---
>  .../bindings/soc/qcom/qcom,geni-se.yaml       | 47 +++++++++++++++++--
>  1 file changed, 43 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
> index 7b031ef09669..40e3a3e045da 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
> @@ -22,17 +22,16 @@ properties:
>      enum:
>        - qcom,geni-se-qup
>        - qcom,geni-se-i2c-master-hub
> +      - qcom,sa8255p-geni-se-qup

Same problems. If you decide to use generic compatibles, it means it
covers all devices. Otherwise it does not make any sense.

>  
>    reg:
>      description: QUP wrapper common register address and length.
>      maxItems: 1
>  
>    clock-names:
> -    minItems: 1

Huh?

Best regards,
Krzysztof


