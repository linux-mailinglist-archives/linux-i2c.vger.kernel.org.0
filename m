Return-Path: <linux-i2c+bounces-5874-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC4C963664
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 01:46:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BABC51F261A4
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Aug 2024 23:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40FC61AC89C;
	Wed, 28 Aug 2024 23:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lZCX/3jN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BF01AED32;
	Wed, 28 Aug 2024 23:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724888704; cv=none; b=RR1XjOcdNRH3MAyRhRBvln0HHyJWLyRLDB/4effVWAwdhATv5OifABDRWaiJsJm9Wv7Bnr4G01OqNUGsSjcOF57JuV1E0yKEOVX68PN32/kQjPy9XOZZttVtCOQqiX+LzZOqycQQ1Dt8QkbAm6TAmiLrnfzgoOzKlu6vSeDHgL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724888704; c=relaxed/simple;
	bh=p+NVSC09VElp6IeeUTBDhei3VSVsi3AmSB9mTtYrU4g=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=ZHBGqrIkhCp5qEsWRsyMk0qFi1p3vHwD8/gUiE5P++lWf5kBePkHQwOqMw9h/K2tHHkZdUvK0Z5N3UInQAUW2fnDuxIqi7XG5uctlFfyCaRCR3eRjMA9KIu3XFIZLBIunxkZeNUHVNV1/2hyv7oCqYaTtUdvTiNlS4nt3P56+jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lZCX/3jN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 134ECC4CEDD;
	Wed, 28 Aug 2024 23:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724888702;
	bh=p+NVSC09VElp6IeeUTBDhei3VSVsi3AmSB9mTtYrU4g=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=lZCX/3jNphfc+xRxC8wxOc/dFdbYIGXQo9D6nvd6RaoiqEPw89g8pPboK3s7OJlvy
	 0JWsz/BlF3jt8da0L0KTWRXOd1EYDwVqtWwONxI4sMmZISoOatLxPIy9ueUoSu7Tq4
	 KodvT5t9xXs7aBMtHksOEvZp9EwACYNHIRdQ+PNznFS/kJ65I6PH3zNukMBQO0ApWC
	 gxWdWc4Mj3lqDAO/TUxLsMoQn8VeT0l1Bs5W7XEPWhiLv0xmzg/Juj/gOBf6jgWBSr
	 Upu9bj4PQkjm0eJIdW6qXJ9T/S+zkiqsmqoLdK/b7c2cGKWGLbRHcU9oYCYe2XMlvc
	 TITiwCyD6ujbA==
Date: Wed, 28 Aug 2024 18:45:00 -0500
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
Cc: herbert@gondor.apana.org.au, linux-arm-msm@vger.kernel.org, 
 linux-serial@vger.kernel.org, Praveen Talari <quic_ptalari@quicinc.com>, 
 iommu@lists.linux.dev, wim@linux-watchdog.org, 
 bartosz.golaszewski@linaro.org, konradybcio@kernel.org, 
 andi.shyti@kernel.org, joro@8bytes.org, vkoul@kernel.org, agross@kernel.org, 
 linus.walleij@linaro.org, thara.gopinath@gmail.com, 
 linux-pm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, linux-spi@vger.kernel.org, 
 conor+dt@kernel.org, quic_rjendra@quicinc.com, linux@roeck-us.net, 
 quic_gurus@quicinc.com, rafael@kernel.org, 
 linux-arm-kernel@lists.infradead.org, quic_psodagud@quicinc.com, 
 quic_tsoni@quicinc.com, quic_shazhuss@quicinc.com, lukasz.luba@arm.com, 
 viresh.kumar@linaro.org, linux-kernel@vger.kernel.org, 
 linux-crypto@vger.kernel.org, cristian.marussi@arm.com, 
 sudeep.holla@arm.com, jassisinghbrar@gmail.com, will@kernel.org, 
 robimarko@gmail.com, kernel@quicinc.com, amitk@kernel.org, 
 broonie@kernel.org, rui.zhang@intel.com, linux-i2c@vger.kernel.org, 
 lee@kernel.org, krzk+dt@kernel.org, davem@davemloft.net, 
 robin.murphy@arm.com, andersson@kernel.org, arm-scmi@vger.kernel.org, 
 tglx@linutronix.de, devicetree@vger.kernel.org
In-Reply-To: <20240828203721.2751904-19-quic_nkela@quicinc.com>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240828203721.2751904-19-quic_nkela@quicinc.com>
Message-Id: <172488869914.1836625.1695909794254781782.robh@kernel.org>
Subject: Re: [PATCH 18/22] dt-bindings: spi: document support for SA8255p


On Wed, 28 Aug 2024 13:37:17 -0700, Nikunj Kela wrote:
> Add compatible representing spi support on SA8255p.
> 
> Clocks and interconnects are being configured in firmware VM
> on SA8255p platform, therefore making them optional.
> 
> CC: Praveen Talari <quic_ptalari@quicinc.com>
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> ---
>  .../bindings/spi/qcom,spi-geni-qcom.yaml      | 64 +++++++++++++++----
>  1 file changed, 53 insertions(+), 11 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml:90:11: [error] string value is redundantly quoted with any quotes (quoted-strings)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240828203721.2751904-19-quic_nkela@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


