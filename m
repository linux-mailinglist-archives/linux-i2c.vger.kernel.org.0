Return-Path: <linux-i2c+bounces-5896-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAC6963D6D
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 09:44:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD9A61C219A4
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 07:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34A57189F2B;
	Thu, 29 Aug 2024 07:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DVzbV52p"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA27815A865;
	Thu, 29 Aug 2024 07:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724917467; cv=none; b=g3/9tmQHVgD3BWeR4aXCgehHCis7M2R10ITBXqkyfd42jPmZF5az4owUuxFG407ZFfwXsbRTFHng312bVw+sa04V7rE1x56XwnvLSsLu4xx5MdurW8h5XqlXjOkGUHsHGKV+HosrAxgLPjDKenNdGIPjMpCn8jqlf95sjfRoEpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724917467; c=relaxed/simple;
	bh=nXlq1CKDaumL+Elf8NmWrnEWqiXru39x1YGX2ZVu3SQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nVZZFYbtBGKhkyaJfz6cWjPN7Q1vJCl6ikG7Yczx9F3zQA30/OxfOB3kmAqWpkzMbuow6nkGMhaf2hVM8DlSaID5V2KJMqm6hlg27fSk24YhvNUkEwxJU9jnEJQ4zaQIzkDtBV6w5bsf40dIxTmcQ5KhL9WiNDj9tTLeMXbBT+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DVzbV52p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9359DC4CEC1;
	Thu, 29 Aug 2024 07:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724917466;
	bh=nXlq1CKDaumL+Elf8NmWrnEWqiXru39x1YGX2ZVu3SQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DVzbV52peAJhicGjf3iqPEIx8QU0oWnu7Gyxp6BUQhonFAy9h6jChDYk/dcjzeCuD
	 l2Kcxobp1GTk7oTD7CaHLgsDs2MGrhdAvbrqfXp1Jhs20eo2pl2Lfk9QCjCZb0N0FH
	 ngwZW2pf0+A+CHnnHF2eZFQMeCssoh1ELEDYBLUSdbwaHYCcFZge6D909+5/qCygNc
	 GIOg0GVPqPCBN9pYuoKp+dNEJgzAJ5gfbXiQYEsZUj2bECgxXm2fvEh1j+JdFifS5R
	 g+g37Osdk8Uxp4RzaZkIuCpRTVNeBzG/QfQ+5ZtX5a+IKVd2T/Sf78UazGLEQQGXD+
	 4RNd0C5NT2caw==
Date: Thu, 29 Aug 2024 09:44:23 +0200
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
Subject: Re: [PATCH 19/22] dt-bindings: i2c: document support for SA8255p
Message-ID: <i2ze6a6c7r5sfj56zrcn6ybr3juvd26sjdum4el6doqmpk7veb@pjj7jz45vf7s>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240828203721.2751904-20-quic_nkela@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240828203721.2751904-20-quic_nkela@quicinc.com>

On Wed, Aug 28, 2024 at 01:37:18PM -0700, Nikunj Kela wrote:
> Add compatible representing i2c support on SA8255p.
> 
> Clocks and interconnects are being configured in Firmware VM
> on SA8255p, therefore making them optional.
> 
> CC: Praveen Talari <quic_ptalari@quicinc.com>
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> ---
>  .../bindings/i2c/qcom,i2c-geni-qcom.yaml      | 56 ++++++++++++-------
>  1 file changed, 36 insertions(+), 20 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> index 9f66a3bb1f80..88f513fc5b08 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> @@ -15,14 +15,13 @@ properties:
>      enum:
>        - qcom,geni-i2c
>        - qcom,geni-i2c-master-hub
> +      - qcom,sa8255p-geni-i2c

Same as in other patches, this does not make sense. What is the point of
generic compatibles?


>  
>    clocks:
> -    minItems: 1
> -    maxItems: 2

Nope.

> +    description: phandles for the clock providers

Useless description. This cannot be anything else than phandles for the
clock providers.

Best regards,
Krzysztof


