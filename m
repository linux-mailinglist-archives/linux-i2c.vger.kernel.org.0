Return-Path: <linux-i2c+bounces-5873-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95059963658
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 01:45:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF9951C2426B
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Aug 2024 23:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 990311AE848;
	Wed, 28 Aug 2024 23:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RZ334jj0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243B21AC8AC;
	Wed, 28 Aug 2024 23:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724888701; cv=none; b=h/Cu18/sUDAtJ+ezGRD8mKVGIYkcUhJPtakC4S7RJvtksIfUdR31gV5fYM22ESed5iC1KIcS7I44lpf9B+ZJKyTZWaqvsBq16YUCADB8DuDZ1p0xuNGCMEIJ/DQNF6bRMOZ79UZshCt+YLAmhvLxuFPclNusp6XsA6Orx0eZ9yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724888701; c=relaxed/simple;
	bh=/0/eXeks8zvDtAEd52bJboyHEaDy5nAxxgH+5MqENPQ=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=I6Q9LSzCuwRcXUZ7utlLT1sTkaFibIflr2yApEadTE5LCQIyrwxtNEjqcE/NhbJRVesnnG0NlhQWvGvfgCQvITEByKkau1Jh1JB8UFpa6mgH7YHsiVgzgs8Z1/UTgn3FUp/ChrdjwAPW/DbU/KXDh1rsV5U8v5bZh6Mc2hjjG4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RZ334jj0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60A51C4CEC0;
	Wed, 28 Aug 2024 23:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724888700;
	bh=/0/eXeks8zvDtAEd52bJboyHEaDy5nAxxgH+5MqENPQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=RZ334jj0iL9xi6y3u69zqCvpOBinulYmgcN49DFNBoTygYH8PdsRPtlbscBnh+s0L
	 YBbX0X705zKTkdIcPDMNduOzNLOtTifKNobePf7O8LQ0UF7RRlHfOwYwfbo9ziYfp4
	 RfSi+OMo22hXaZvsAee3Gs9e+KDiJI7NTLvg/QjUGhHqq73aeeXWpiTjZSNvM4I48u
	 XMPAIRr2sPA0tRQOosCuFlrHXrECAwz65Pd6+2RMY8FAcqJS7zow0xp+ooP0/ssqan
	 RkJBVAiqpgZN+h1XlIUb2PYPNpFOtUy3kvnAVc4khzL/RDwjDFTmFMSBtNc/TQLJu0
	 f+0lGK/ZPyVAw==
Date: Wed, 28 Aug 2024 18:44:59 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nikunj Kela <quic_nkela@quicinc.com>
Cc: konradybcio@kernel.org, herbert@gondor.apana.org.au, 
 cristian.marussi@arm.com, rui.zhang@intel.com, robimarko@gmail.com, 
 andi.shyti@kernel.org, amitk@kernel.org, wim@linux-watchdog.org, 
 iommu@lists.linux.dev, thara.gopinath@gmail.com, jassisinghbrar@gmail.com, 
 linux-serial@vger.kernel.org, arm-scmi@vger.kernel.org, vkoul@kernel.org, 
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 sudeep.holla@arm.com, broonie@kernel.org, joro@8bytes.org, 
 linux@roeck-us.net, viresh.kumar@linaro.org, krzk+dt@kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org, 
 conor+dt@kernel.org, lee@kernel.org, davem@davemloft.net, 
 linux-i2c@vger.kernel.org, quic_gurus@quicinc.com, quic_rjendra@quicinc.com, 
 linus.walleij@linaro.org, agross@kernel.org, bartosz.golaszewski@linaro.org, 
 rafael@kernel.org, robin.murphy@arm.com, quic_psodagud@quicinc.com, 
 linux-gpio@vger.kernel.org, andersson@kernel.org, will@kernel.org, 
 linux-pm@vger.kernel.org, Praveen Talari <quic_ptalari@quicinc.com>, 
 quic_tsoni@quicinc.com, tglx@linutronix.de, linux-crypto@vger.kernel.org, 
 kernel@quicinc.com, lukasz.luba@arm.com, quic_shazhuss@quicinc.com
In-Reply-To: <20240828203721.2751904-17-quic_nkela@quicinc.com>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240828203721.2751904-17-quic_nkela@quicinc.com>
Message-Id: <172488869750.1836577.14830231532115665875.robh@kernel.org>
Subject: Re: [PATCH 16/22] dt-bindings: qcom: geni-se: document support for
 SA8255P


On Wed, 28 Aug 2024 13:37:15 -0700, Nikunj Kela wrote:
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

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.example.dtb: geniqup@9c0000: i2c@984000:compatible:0: 'qcom,sa8255p-geni-i2c' is not one of ['qcom,geni-i2c', 'qcom,geni-i2c-master-hub']
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.example.dtb: geniqup@9c0000: i2c@984000: 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.example.dtb: geniqup@9c0000: i2c@984000: 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.example.dtb: geniqup@9c0000: i2c@984000: Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.example.dtb: geniqup@9c0000: serial@990000:compatible:0: 'qcom,sa8255p-geni-uart' is not one of ['qcom,geni-uart', 'qcom,geni-debug-uart']
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.example.dtb: geniqup@9c0000: serial@990000:power-domains: [[4294967295, 4], [4294967295, 4]] is too long
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.example.dtb: geniqup@9c0000: serial@990000: 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.example.dtb: geniqup@9c0000: serial@990000: 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.example.dtb: geniqup@9c0000: serial@990000: Unevaluated properties are not allowed ('compatible', 'power-domain-names', 'power-domains' were unexpected)
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml#
Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.example.dtb: /example-1/soc/geniqup@9c0000/i2c@984000: failed to match any schema with compatible: ['qcom,sa8255p-geni-i2c']
Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.example.dtb: /example-1/soc/geniqup@9c0000/serial@990000: failed to match any schema with compatible: ['qcom,sa8255p-geni-uart']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240828203721.2751904-17-quic_nkela@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


