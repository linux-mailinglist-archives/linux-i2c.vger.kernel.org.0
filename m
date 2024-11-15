Return-Path: <linux-i2c+bounces-8006-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0A79CF2F6
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Nov 2024 18:32:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B96991F2226C
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Nov 2024 17:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4217B1D63C0;
	Fri, 15 Nov 2024 17:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kac7kQLZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DF615573A;
	Fri, 15 Nov 2024 17:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731691920; cv=none; b=rAcQNh8RIVtZ76iRtPm/VZaUVyZHhlJRok+AjJg/OZKoHpLVwCEqQ1jTEpkfQL9JM5axWO9qp7SavAxD22ZLRXN/VwrfB14QwiDjEmB3DnJh+8eYjv9PL/lJzQYM+M7KM14NNw0gJ1DvDUH4z7R34n4L9FWj0NoamkXJEjMQA+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731691920; c=relaxed/simple;
	bh=ByzyFL3jHBewomqNCtrQfFmYzlwTibEpwsTpO0RE8jo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tDli5/UN2cfDvlPwPsSg/t9oPa1SjDFxuj1hFCQGo/nmmZAjOEbQ6elsw451MAzI60SQNjJXYGEOHVmVuhQLovlnzZ1VwiDOFsIF3WFyfQ2sVBQJAEMvEDRgt9WnXbsTGvuL6ijJJAI71/2AVytfbFMVDPR9yZCQr+Cuu4eJnyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kac7kQLZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 233D5C4CECF;
	Fri, 15 Nov 2024 17:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731691918;
	bh=ByzyFL3jHBewomqNCtrQfFmYzlwTibEpwsTpO0RE8jo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kac7kQLZx6tmvyWAIEbTAlQzl59DR9Qou9YktDrEWS1LyQzDGztyBHivLBTpIjY35
	 P841wfiKpvutW1mpe9dVdRfh9kZh3O70heccc9YSzFzEnBMM7f/0YdyI/aeeeUXRg9
	 DThZ1XF1C+o1Xr80FDRwZTjuElqjS9JniABgw5xt0pxYx3oMLKeUUdZh05/cwCf5dY
	 JW1XTpnoXlleMoSUXR2oLI29sxpsPg54FBrkQFO9lUq/S2+kPWt3RNQVR9StMj0Qhn
	 y7L8Gx94CxjPMDhIiKWnoMPuITR6elk2/W0iXY/FncBZoBYJ7EhIyMc/40Ugj+0ECc
	 Hx+D6MSKBFFQw==
Date: Fri, 15 Nov 2024 11:31:56 -0600
From: Rob Herring <robh@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	conor+dt@kernel.org, agross@kernel.org, devicetree@vger.kernel.org,
	vkoul@kernel.org, linux@treblig.org, dan.carpenter@linaro.org,
	Frank.Li@nxp.com, konradybcio@kernel.org,
	bryan.odonoghue@linaro.org, krzk+dt@kernel.org,
	quic_vdadhani@quicinc.com
Subject: Re: [PATCH v4 1/4] dt-bindindgs: i2c: qcom,i2c-geni: Document shared
 flag
Message-ID: <20241115173156.GA3432253-robh@kernel.org>
References: <20241113161413.3821858-1-quic_msavaliy@quicinc.com>
 <20241113161413.3821858-2-quic_msavaliy@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241113161413.3821858-2-quic_msavaliy@quicinc.com>

On Wed, Nov 13, 2024 at 09:44:10PM +0530, Mukesh Kumar Savaliya wrote:
> Adds qcom,is-shared flag usage. Use this flag when I2C serial controller

Doesn't match the property name.

> needs to be shared in multiprocessor system(APPS,Modem,ADSP) environment.
> 
> Two clients from different processors can share an I2C controller for same
> slave device OR their owned slave devices. Assume I2C Slave EEPROM device
> connected with I2C controller. Each client from ADSP SS and APPS Linux SS
> can perform i2c transactions.
> 
> Transfer gets serialized by Lock TRE + DMA xfer + Unlock TRE at HW level.
> 
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> ---
>  Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> index 9f66a3bb1f80..fe36938712f7 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> @@ -60,6 +60,10 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> +  qcom,shared-se:

What is 'se'? Is that defined somewhere?

> +    description: True if I2C controller is shared between two or more system processors.
> +    type: boolean
> +
>    reg:
>      maxItems: 1
>  
> -- 
> 2.25.1
> 

