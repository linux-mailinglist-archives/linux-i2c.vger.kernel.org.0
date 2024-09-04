Return-Path: <linux-i2c+bounces-6094-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4BF96AE17
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 03:50:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76F4E1F25B39
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 01:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9BAD10A12;
	Wed,  4 Sep 2024 01:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jsadccl/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D6A3211;
	Wed,  4 Sep 2024 01:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725414608; cv=none; b=P/ngmW3zT49Xqd2PnAeBwkh+ve5BVICmDE1NTYJJdge74KefuwVaHAus5pnukVrZSS2SSLiCWPVFgajGbLhQmUgfgv7Maiu2IiHL7mIEzJCKeaKEm22D8AYgHVw20feYYaYE8TzUddHTEotVZfuAFLz1TJFNODzCZo2g5GsHyL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725414608; c=relaxed/simple;
	bh=4AQxlfwksI8M0lXuPBfgDWfUUeO7Xwm6/Q69FGEDaqE=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=Bf07VAvSoWJ+nAeiW8MfCQS4ADKdpvknOTWLeIM8dFcLjGGXZAONCiXaRg7qZNZ2BiKBX2f3e3TFVIpfhMebThfTvG/O8+fTMhxTGCR3iI+i/Qg1FonPxKcOSLwCsAI0s53+Zpasrty0f5gmxRpP7ePt9KgKuoto+FQ0/NAIxqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jsadccl/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 853F8C4CEC4;
	Wed,  4 Sep 2024 01:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725414607;
	bh=4AQxlfwksI8M0lXuPBfgDWfUUeO7Xwm6/Q69FGEDaqE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=jsadccl/9E+PbXaq+qBmbPd7/PjPSWuCGCCzZgXrCdzxotTCt+t4Jh4/bmoJd9CVw
	 H8TFVkWCnT6PO3N5msofWRplIEzvDa/Eg5k4rOBS65A+0zhdG8IyexgNbEl8PJPjw+
	 IPqvsG8xcWU4KoDxTm0aKsnESTEtPBfW/2JJhC2yZ7oNtXlbcdYda/gKsGnl9kjiks
	 zYIezEibBc9qTHTav6i6r2l9PCUv9D8lgvmxWdNEEHSR/qOB+sf1qlb4hUUhVYAkeY
	 sRh9O478wwJmKVRY2p7fE4R/AvzwSGarhGRI5N4ZYyVZuwxFz3ZGhNiy/K7VPANfL9
	 HopuyFoAQZ++g==
Date: Tue, 03 Sep 2024 20:50:06 -0500
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
Cc: devicetree@vger.kernel.org, cristian.marussi@arm.com, 
 rui.zhang@intel.com, linux-spi@vger.kernel.org, lee@kernel.org, 
 krzk+dt@kernel.org, will@kernel.org, linux-arm-msm@vger.kernel.org, 
 linus.walleij@linaro.org, joro@8bytes.org, linux-kernel@vger.kernel.org, 
 robin.murphy@arm.com, quic_psodagud@quicinc.com, conor+dt@kernel.org, 
 kernel@quicinc.com, sudeep.holla@arm.com, linux-serial@vger.kernel.org, 
 linux-i2c@vger.kernel.org, herbert@gondor.apana.org.au, 
 konradybcio@kernel.org, jassisinghbrar@gmail.com, 
 linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org, andersson@kernel.org, 
 lukasz.luba@arm.com, iommu@lists.linux.dev, linux-watchdog@vger.kernel.org, 
 broonie@kernel.org, rafael@kernel.org, davem@davemloft.net, 
 arm-scmi@vger.kernel.org, thara.gopinath@gmail.com, viresh.kumar@linaro.org, 
 linux@roeck-us.net, amitk@kernel.org, wim@linux-watchdog.org, 
 andi.shyti@kernel.org, linux-arm-kernel@lists.infradead.org, 
 tglx@linutronix.de, linux-crypto@vger.kernel.org
In-Reply-To: <20240903220240.2594102-14-quic_nkela@quicinc.com>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-14-quic_nkela@quicinc.com>
Message-Id: <172541460656.3237041.12121704663662726692.robh@kernel.org>
Subject: Re: [PATCH v2 13/21] dt-bindings: pinctrl: Add SA8255p TLMM


On Tue, 03 Sep 2024 15:02:32 -0700, Nikunj Kela wrote:
> Add compatible for TLMM block representing support on SA8255p.
> 
> SA8255p uses the same TLMM block as SA8775p however the ownership
> of pins are split between Firmware VM and Linux VM on SA8255p. For
> example, pins used by UART are owned and configured by Firmware VM
> while pins used by ethernet are owned and configured by Linux VM.
> Therefore, adding a sa8255p specific compatible to mark the difference.
> 
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> ---
>  .../devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml    | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml:22:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml:23:11: [warning] wrong indentation: expected 12 but found 10 (indentation)
./Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml:26:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240903220240.2594102-14-quic_nkela@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


