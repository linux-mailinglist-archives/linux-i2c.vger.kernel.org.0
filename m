Return-Path: <linux-i2c+bounces-7084-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E8C989966
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Sep 2024 05:21:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D740B220E0
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Sep 2024 03:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA8753D96D;
	Mon, 30 Sep 2024 03:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SubN16GC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677BF39FF3;
	Mon, 30 Sep 2024 03:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727666450; cv=none; b=gYWbh7FhpLWZ5lsZCGqWKdl0/POitm5VMmP6/pjsDm8mldRRcT0Wwhyj22b2b8nOrPzmdiqiqFLA8yGnc1nfknAicd1IDyKToL/plaBXfbVQwSoFKvFEMFpREvfsvEB+xpdlA081P3qd3wMKNboccD8zcFiIUIin05rcFpC/V0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727666450; c=relaxed/simple;
	bh=pu+tBzgdU6YbOS8CSmAkmouW3UeVIsJa5ewszORsm80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i63eL4VkwiHIOwDGOgjdqw9FaRdnkpqOuKCQIHs98CRPYzX0OgAS6thOW/dDtdpDaXyfYunSJtrbpP2iUOPvnSbI1Y2F5YSAAvy8rxh68c2ajMYZ4fyiYzVhYRoDPJNKy0hR8UA9EykTPihwzcSIo8NVvjKqbHHdDGOxyEA/0j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SubN16GC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DAE3C4CEC5;
	Mon, 30 Sep 2024 03:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727666450;
	bh=pu+tBzgdU6YbOS8CSmAkmouW3UeVIsJa5ewszORsm80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SubN16GCl3Xwlpein6ssWhDm31R8tuOZVk//vK+VoZrbPn5lx32C7mlarcZ4GPsqX
	 royB/EsgDk7RsMEqahQ1SJlbghTLTBPSuKkC0V3CLur/znKlhAcZztAWBnAzsCdFFx
	 5ZsQZpUvKu6ItQMbgye9ckr00zx+5GcsZPI/Ae+cBPhPJP9JgbUVg/BbxxwJpJX/KH
	 /iUKgPSEEXvWnrVNowzj9XWULfTdaCCYbgeTz3C2SGnj5NFzEhsBTU/rPiuxovTmwg
	 j9Oycyt3r43dqBpiOd4gIwSQIJvEYbeTaoabxbGi/7ifzZeOAhF8QwC/je48y0hZCr
	 qqt41YYkKvuvA==
Date: Sun, 29 Sep 2024 22:20:46 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: konrad.dybcio@linaro.org, andi.shyti@kernel.org, 
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, conor+dt@kernel.org, agross@kernel.org, 
	devicetree@vger.kernel.org, vkoul@kernel.org, linux@treblig.org, dan.carpenter@linaro.org, 
	Frank.Li@nxp.com, konradybcio@kernel.org, bryan.odonoghue@linaro.org, 
	krzk+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindindgs: i2c: qcom,i2c-geni: Document shared
 flag
Message-ID: <anfqjd5rcslplfqannqqli2k2gnq2p4qsnkyrfgmavdpll7p42@c7o4tdouiav4>
References: <20240927063108.2773304-1-quic_msavaliy@quicinc.com>
 <20240927063108.2773304-2-quic_msavaliy@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927063108.2773304-2-quic_msavaliy@quicinc.com>

On Fri, Sep 27, 2024 at 12:01:05PM GMT, Mukesh Kumar Savaliya wrote:
> Adds qcom,shared-se flag usage. Use this when particular I2C serial
> controller needs to be shared between two subsystems.
> 

https://docs.kernel.org/process/submitting-patches.html#describe-your-changes

> SE = Serial Engine, meant for I2C controller here.
> TRE = Transfer Ring Element, refers to Queued Descriptor.
> SS = Subsystems (APPS processor, Modem, TZ, ADSP etc).

Expressing yourself in terms of abbreviations just makes the text harder
to read. The dictionary is nice, but I don't see that it adds value to
introduce these abbreviations with the reader.

> 
> Example :
> Two clients from different SS can share an I2C SE for same slave device
> OR their owned slave devices.
> Assume I2C Slave EEPROM device connected with I2C controller.
> Each client from ADSP SS and APPS Linux SS can perform i2c transactions.
> This gets serialized by lock TRE + DMA Transfers + Unlock TRE at HW level.
> 

Don't describe your problem using a bullet-point list. You should be
able to express it in a flowing English sentence/paragraph.

> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> ---
>  Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> index 9f66a3bb1f80..3b9b20a0edff 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> @@ -60,6 +60,10 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> +  qcom,shared-se:
> +    description: True if I2C needs to be shared between two or more subsystems(SS).

I see no value in establishing the "SS" abbreviation here, what would be
useful is to write this sentence such that it establishes the "SE"
abbreviation (to avoid having to expand the property).

On the other hand, it's a boolean property in a serial-engine node, so
I don't know if it's worth repeating "se" here. "qcom,is-shared" sounds
like a better boolean in a se-node.

Regards,
Bjorn

> +    type: boolean
> +
>    reg:
>      maxItems: 1
>  
> -- 
> 2.25.1
> 

