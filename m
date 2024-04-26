Return-Path: <linux-i2c+bounces-3239-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDAA8B3F2D
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 20:22:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26A9F28309E
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 18:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 498C216DED4;
	Fri, 26 Apr 2024 18:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QHiF19UU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F291C45037;
	Fri, 26 Apr 2024 18:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714155765; cv=none; b=Cb6FHhxiWJbZWd/zfdQxMllyx/yFgiveTVOR+Ek9oO+EZ82eH6XX7NH9geOMMlc/EbznlKngCfyyXv2H4pvUi1CiHamNAMqov4et8LCrCnvQxMr8GZYe5VQ8QnO+cZDzBBDbNzU90msk+/KjYnu++F2ZmSI3E8oy33vS0MPgZxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714155765; c=relaxed/simple;
	bh=gpyVvefeP36zHUXRz/u3ksezvgy7WEBLfXm4HyXlxF4=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=JWya7Umnkm4CJnw5n5DdgjEG0wVquqW/x6pRq1cbff6eOuNHefxVCz3gQ/FQaALyA5Go9jBMu8Hrn/mzUHX4kf1tBVdQhlwvc9XUd4v5pvlmyaw2Pjh0Ro7i1/mjrI4oJDl2KTziT8+q4MwxAEgaxy8zezCAvw9exsMYmEKVnk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QHiF19UU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52D08C113CD;
	Fri, 26 Apr 2024 18:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714155764;
	bh=gpyVvefeP36zHUXRz/u3ksezvgy7WEBLfXm4HyXlxF4=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=QHiF19UUHS4HQggBpXjB9tUcLKKASvChWcO/TU9ERF03lEFOX55fjOkoKLunY02mh
	 KVaTfLrzfQHE2FZxc46/LFZd/Z7EudTt+BQyoROaaIM68jtOiIp2yhZ8H7kP6IlUbQ
	 IdXU89T0jhpxU1J99MeF/qym4SIwazsrlWAgzqZZiQcurclxDkJVZWgljgzVFvIs3v
	 nbL7qzdw9y5DFrGb4AZHtvWQ1inN3eibcPoD3yl62csWMDUfaSMW+ld2DaWZtyX/R6
	 B4Q33L3o2z/JFtuGWnqmTOl85SlbO2aEtKeODR7SBYFdHIPG8PEDc6StAFu2yu++D/
	 EFtpRtBmSvc3g==
Date: Fri, 26 Apr 2024 13:22:41 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Farouk Bouabid <farouk.bouabid@theobroma-systems.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-rockchip@lists.infradead.org, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, Peter Rosin <peda@axentia.se>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor+dt@kernel.org>
In-Reply-To: <20240426-dev-mule-i2c-mux-v1-2-045a482f6ffb@theobroma-systems.com>
References: <20240426-dev-mule-i2c-mux-v1-0-045a482f6ffb@theobroma-systems.com>
 <20240426-dev-mule-i2c-mux-v1-2-045a482f6ffb@theobroma-systems.com>
Message-Id: <171415576010.2476476.2469508869846775606.robh@kernel.org>
Subject: Re: [PATCH 2/7] dt-bindings: i2c: mux: mule: add dt-bindings for
 mule i2c multiplexer


On Fri, 26 Apr 2024 18:49:33 +0200, Farouk Bouabid wrote:
> This patch adds support for the Mule I2C multiplexer.
> 
> Mule is an mcu that emulates a set of i2c devices which are reacheable
> through an i2c-mux.
> 
> The emulated devices share a single i2c address with the mux itself where
> the requested register is what determines which logic is executed (mux or
> device).
> 
> Signed-off-by: Farouk Bouabid <farouk.bouabid@theobroma-systems.com>
> ---
>  .../devicetree/bindings/i2c/i2c-mux-mule.yaml      | 80 ++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/i2c-mux-mule.example.dtb: fan@18: '#cooling-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240426-dev-mule-i2c-mux-v1-2-045a482f6ffb@theobroma-systems.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


