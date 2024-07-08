Return-Path: <linux-i2c+bounces-4775-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C88C92AB7B
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 23:48:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 31C61B214D8
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 21:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55A4614F11C;
	Mon,  8 Jul 2024 21:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JaNN1c8O"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029DE14EC43;
	Mon,  8 Jul 2024 21:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720475297; cv=none; b=V9IeulTB/J3dvZ0dkBjjps9ueOMb/+VB/Lr4IeEqESzA9oCpbGsaRTwhnCCxY5e/Sfj+vAP+K8LbpcZCsQNxhsBT3qwKuUoLlp1TPJYW9tBRjVmOW/3xXrBWPv+07rHtQwtbXTpSz6Q5KBGEn/hxQjXGaHm53W0u67bHT7Rh3Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720475297; c=relaxed/simple;
	bh=58cUh743dQOrMkAUwZvw9ESyA3J+L2orhwmh8ALge1A=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=DLFLsrGq8dulnhVK4A/kNBKGQmnsAOLQQLxaiK8YicrCiofu4zzw4NAErwV7QybMtVByYHyFHvA67kmkIOsU7sAv3b5eEN9kftCaxouHCEJmI6lClqFrur95khEfXs353LEjdh45VbWc7pqVf3lIZLglQ6Wuzfq43Y2QAiBXwik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JaNN1c8O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38DE5C116B1;
	Mon,  8 Jul 2024 21:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720475296;
	bh=58cUh743dQOrMkAUwZvw9ESyA3J+L2orhwmh8ALge1A=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=JaNN1c8OyAPkwuzPpGIQ/dJzBrA9gLBtTF4untiSSorTgPz52kCpG4m1ivgICujV2
	 zM1bzIa0L1B5/vJO4UaGIN752t4mvj+bPijrEp71z1L899ue+oLozt3jVnLwu87ae6
	 crxn9bmpoZ/4V0nlKCCuSQaAvwihC5vuPzQqdbRSaSynIxcwdZmTV7KH7jpgrOEr8h
	 w+6JbSqIaELHULuaW6s5VK8qS51sCawyWsHQk7c9x8ukTHoL/wDIkpl2yaaeu0R+Sx
	 +jLDMOjWI9wpI80zGP/dOyAr/6/Bv4W2Kf9M5720JBH1WGJKYcUbUO5KzyP81ku4eU
	 PEvjHwpjPiOdw==
Date: Mon, 08 Jul 2024 15:48:15 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: George Stark <gnstark@salutedevices.com>
Cc: rafael@kernel.org, krzk+dt@kernel.org, hkallweit1@gmail.com, 
 b.galvani@gmail.com, lukasz.luba@arm.com, conor+dt@kernel.org, 
 rui.zhang@intel.com, broonie@kernel.org, devicetree@vger.kernel.org, 
 linux-pm@vger.kernel.org, neil.armstrong@linaro.org, 
 daniel.lezcano@linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, khilman@baylibre.com, 
 mmkurbanov@sberdevices.ru, linux-spi@vger.kernel.org, 
 martin.blumenstingl@googlemail.com, linux-i2c@vger.kernel.org, 
 jbrunet@baylibre.com, glaroque@baylibre.com, 
 linux-amlogic@lists.infradead.org, kernel@salutedevices.com
In-Reply-To: <20240708194808.1819185-2-gnstark@salutedevices.com>
References: <20240708194808.1819185-1-gnstark@salutedevices.com>
 <20240708194808.1819185-2-gnstark@salutedevices.com>
Message-Id: <172047529524.3973694.1825285851935530574.robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: spi: amlogic,a1-spifc: make
 power-domains required


On Mon, 08 Jul 2024 22:48:05 +0300, George Stark wrote:
> SPI Flash Controller has dedicated power domain so make the
> corresponding property required.
> 
> Signed-off-by: George Stark <gnstark@salutedevices.com>
> ---
>  Documentation/devicetree/bindings/spi/amlogic,a1-spifc.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/spi/amlogic,a1-spifc.example.dtb: spi@fd000400: Unevaluated properties are not allowed ('power-domains' was unexpected)
	from schema $id: http://devicetree.org/schemas/spi/amlogic,a1-spifc.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240708194808.1819185-2-gnstark@salutedevices.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


