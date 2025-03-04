Return-Path: <linux-i2c+bounces-9709-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 079D0A4D5E4
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Mar 2025 09:12:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 361151731CE
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Mar 2025 08:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C98911FAC53;
	Tue,  4 Mar 2025 08:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HL00MMGx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E721F9A90;
	Tue,  4 Mar 2025 08:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741075972; cv=none; b=MIXdVnDSepkZk67yknDyObg1ZBvrvSkfRpBzpvKhKJ/4CkLEc0Kul0Kj647zimxXYZMBt757CbwBTik/Wy/kFrOyeYSVK4ml3hQpg9GGW95IjcRC4WQQcG44Jbbb1Nui7iFla9gbMUg3ndNlVopU+/3ZrOmwzWOB04C1DvI2LvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741075972; c=relaxed/simple;
	bh=cuhqFGsdJQGjekoeKN4nz8WqVnRlZLdQxPmCLxoViRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IADEVxk824gimlmUaFmo4wWGKcp1Zrv2s48qalqiZ3mWrLqZ0HM2opRjZKbERifP+5ov1004nHHxLwxkF3L3ni8PIPSLN4hjbDkQ+2q1txRIVUyufG+HcPtxKXsXGWCLy4LQZIx9QaKQie10pGE5mw8qFwKn0aBDbjFejAd2xgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HL00MMGx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09D53C4CEE5;
	Tue,  4 Mar 2025 08:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741075971;
	bh=cuhqFGsdJQGjekoeKN4nz8WqVnRlZLdQxPmCLxoViRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HL00MMGxfPnUtY1SGMMXX7trzEHglIJP4q58nkO2NW852cF3O5wVa3GCa01mD+eQ8
	 QRhrE/LlGC+M+CrxKcK45ZL451JOENIfn5Gsto21jflMpkKmf9izR7RSVZxiIUau97
	 oGF0h992TTFuiakvPnVc6Y9cIRPktUGIIorcYfl/Ti9qiI0CgLxVbU7SZ/0RRtqI9x
	 foygEfLKOHm5PoaJbjNorbvVoOBs/GZPjfVAt3TRYRo9UD6SWYhI57YiBrit8kF6e+
	 CO4Vz+/zGdGtHH4vrT3vtEg/g9vHR9u7uEO+H/4gdSCf99fWqPLdbNzpClHDSqHXVp
	 hQoNalyIjH8mg==
Date: Tue, 4 Mar 2025 09:12:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	broonie@kernel.or, andersson@kernel.org, konradybcio@kernel.org, 
	johan+linaro@kernel.org, dianders@chromium.org, agross@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
	quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com
Subject: Re: [PATCH v3 3/9] dt-bindings: i2c: qcom,i2c-geni: document
 qcom,gsi-dma-allowed
Message-ID: <20250304-scrupulous-strong-narwhal-920bb4@krzk-bin>
References: <20250303124349.3474185-1-quic_vdadhani@quicinc.com>
 <20250303124349.3474185-4-quic_vdadhani@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250303124349.3474185-4-quic_vdadhani@quicinc.com>

On Mon, Mar 03, 2025 at 06:13:43PM +0530, Viken Dadhaniya wrote:
> Data transfer mode is fixed by TrustZone (TZ), which currently restricts
> developers from modifying the transfer mode from the APPS side.
> 
> Document the 'qcom,gsi-dma-allowed' property to select the data transfer
> mode to GPI DMA (Generic Packet Interface). If not set, FIFO mode
> (PIO/CPU DMA) will be selected by default.
> 
> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> ---
> v2 -> v3:
> 

To be clear: this cannot be merged via i2c because of hidden dependency.

In the future: please clearly explain the dependencies so maintainers
know what to do with this.

> - Drop the 'qcom,xfer-mode' property and add the 'qcom,gsi-dma-allowed' property.
> - Add a reference for the QUP peripheral shared YAML.
> - Update commit log.
> 
> v2 Link: https://lore.kernel.org/linux-arm-msm/20250124105309.295769-3-quic_vdadhani@quicinc.com/
> 
> v1 -> v2:
> 
> - Drop 'qcom,load-firmware' property and add 'firmware-name' property in
>   qup common driver.
> - Update commit log.
> 
> v1 Link: https://lore.kernel.org/linux-kernel/20241204150326.1470749-2-quic_vdadhani@quicinc.com/
> ---
> ---
>  Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> index 9f66a3bb1f80..8c2675c65455 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> @@ -60,6 +60,8 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> +  qcom,gsi-dma-allowed: true

Drop

Best regards,
Krzysztof


