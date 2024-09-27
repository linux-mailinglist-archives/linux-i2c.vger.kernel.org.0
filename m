Return-Path: <linux-i2c+bounces-7050-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D50B988146
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 11:25:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 738941C21A70
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 09:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52DF61BA89D;
	Fri, 27 Sep 2024 09:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oMUAkxCS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3F616D9B8;
	Fri, 27 Sep 2024 09:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727429092; cv=none; b=IqXhLaehsUajQlpFMEQOoRJ9E5JCqR8QuT1x6JEeGHUzxakXdzXuoA+lUI7OIMRbn4hkRikkudIoNZRj1hywF7oMjtz6nn9fIPcLp5cdroTPwljG84XK+N0vPqteFf2CpNoU4qZph664TSW+7ZwCkkf0Xa+RVCh4F40Ac0JFAIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727429092; c=relaxed/simple;
	bh=prAV8NCYOXfLCw33iIj+Y+TwoCH1xT9xCcNBQqqbOkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lHD7vVQooNA+dqYIm9KgdszjLmLncj9tjHU5KfG2UqobjEmKyHm0NHsMB/uiHLqFOxgAQPjq4sr5DgyfO/2hbzb2rhStfEeNCKjfYGn0KBD0YD+iFYomjdeSPL+G7ZnPamHHemewPz2PGlPPCzoPHw5kQKNt59lWOoHBh9XmX/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oMUAkxCS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCBE2C4CEC4;
	Fri, 27 Sep 2024 09:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727429091;
	bh=prAV8NCYOXfLCw33iIj+Y+TwoCH1xT9xCcNBQqqbOkc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oMUAkxCSLaU9i4prSJ7nT57Jkiga3+cl+WYzt/9EmzVRfFWc2aE/UT5XJ5ngNGcKp
	 1YX7SyjNVQjn89/i6aX/nBi8tBWDkEMVtuCT6OIQlm26DiszXybLfImFi6l8a0M3C0
	 BaPEHOg6UK2vLtbfGXeOTvPiVx+4GrRE1Iqia02nDfyx3fPUkSnmiHkau3q5YH+xr0
	 7USfHSngAvUNm+IVnyYaYNNvG+HxNXLCdo6TnYYqi9vAlSqcxeEjfaCAt4rtvHkRKC
	 W+0bitPV2wB66aVbctVsn2vY+9AR2QEttgTvaNH3IjA0yjs7x9LK7qGCjl9ccUmnHe
	 Odxn+Yex3Pc2g==
Date: Fri, 27 Sep 2024 11:24:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org, 
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, conor+dt@kernel.org, agross@kernel.org, 
	devicetree@vger.kernel.org, vkoul@kernel.org, linux@treblig.org, dan.carpenter@linaro.org, 
	Frank.Li@nxp.com, konradybcio@kernel.org, bryan.odonoghue@linaro.org, 
	krzk+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindindgs: i2c: qcom,i2c-geni: Document shared
 flag
Message-ID: <we3wmw6e25y6e4443ndrduurwvkkpvuw7ozrizuys6pwxppwfy@2uq7uda4evhd>
References: <20240927063108.2773304-1-quic_msavaliy@quicinc.com>
 <20240927063108.2773304-2-quic_msavaliy@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240927063108.2773304-2-quic_msavaliy@quicinc.com>

On Fri, Sep 27, 2024 at 12:01:05PM +0530, Mukesh Kumar Savaliya wrote:
> Adds qcom,shared-se flag usage. Use this when particular I2C serial
> controller needs to be shared between two subsystems.
> 
> SE = Serial Engine, meant for I2C controller here.
> TRE = Transfer Ring Element, refers to Queued Descriptor.
> SS = Subsystems (APPS processor, Modem, TZ, ADSP etc).
> 
> Example :
> Two clients from different SS can share an I2C SE for same slave device
> OR their owned slave devices.
> Assume I2C Slave EEPROM device connected with I2C controller.
> Each client from ADSP SS and APPS Linux SS can perform i2c transactions.
> This gets serialized by lock TRE + DMA Transfers + Unlock TRE at HW level.
> 
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

The "SS" and subsystem should be explained in the binding. Please do not
use some qcom-specific abbreviations here, but explain exactly, e.g.
processors like application processor and DSP.

"se" is also not explained in the binding - please open it and look for
such explanation.

This all should be rephrased to make it clear... We talked about this
and I do not see much of improvements except commit msg, so we are
making circles. I don't know, get someone internally to help you in
upstreaming this.

Is sharing of IP blocks going to be also for other devices? If yes, then
this should be one property for all Qualcomm devices. If not, then be
sure that this is the case because I will bring it up if you come with
one more solution for something else.

Best regards,
Krzysztof


