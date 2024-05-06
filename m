Return-Path: <linux-i2c+bounces-3437-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B20418BD62B
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 22:26:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DFF4282E2F
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 20:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97FA715B10E;
	Mon,  6 May 2024 20:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gdj/Wm9Q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D22515B102;
	Mon,  6 May 2024 20:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715027189; cv=none; b=QyWlPY8+BwPtf72BKfqwC4hmEMU2XHqwhCL0hlJuaofHJApWixTqfXYj8WAD595rgH22SKAHUgg+PBM24O0Wm8j9eYnahQD3pUiJgsFLxjTXXASwrXXXMFqwGlk8Y5zVVl1jBe9bBIc9Z9sHGGP7eulno80eu21qzOtr1Y9qNhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715027189; c=relaxed/simple;
	bh=iPhiz4umi131UrJgZazOVWc0VpO7pipi62CDJOV7Yw8=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=OFinowWTUeY2hZ7VZGOUG2E1JrBx+FZ5bGnCSJYloGBhnC2vU9y0eDTvzB/WhgwGsJtgRDx3B2nLE2dkBXecnxH8tUizd6WcQxQ5mUIwaeAnhlSNnCaSSeY4zQi7z3aWRu4Oqbq2zZTk8C70Ar8oc6uUPZJYDSZswQIY6V2zpTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gdj/Wm9Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 283A0C3277B;
	Mon,  6 May 2024 20:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715027188;
	bh=iPhiz4umi131UrJgZazOVWc0VpO7pipi62CDJOV7Yw8=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Gdj/Wm9QSyDgIvZiTnoVOcOHQ9lleZ85g29zVSHjM5G4ljViI+X+FR6lufsyFFMTV
	 bN1DONDwwVGV16KbCCOtZ5rSJEljzFsnhVnhxGr7K+sJLzFMs0OEO3ZyPGwTAHCbfZ
	 tj/TTcTOin3mlG0Si64jz1yzDkZmOVSn3Rr1id6+q7ywRm7+Z60+/qS6ra5LqT+Sjg
	 rMWXIC1UWKpYhRsGLOA1dQ4M64+3c8/wbG4HiU3rBx3x3wx5XUZXdglE1CJLQYGDRv
	 UuyWXeNEgOPz/Umw8AXqe/lDfoOx/cFDtA2Ft4vRcDndY41v3/oDo1GXkJqW8ag4OM
	 IgStE22x8bUVg==
Date: Mon, 06 May 2024 15:26:24 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Farouk Bouabid <farouk.bouabid@cherry.de>
Cc: devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Heiko Stuebner <heiko@sntech.de>, Andi Shyti <andi.shyti@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
 Peter Rosin <peda@axentia.se>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To: <20240506-dev-mule-i2c-mux-v2-2-a91c954f65d7@cherry.de>
References: <20240506-dev-mule-i2c-mux-v2-0-a91c954f65d7@cherry.de>
 <20240506-dev-mule-i2c-mux-v2-2-a91c954f65d7@cherry.de>
Message-Id: <171502718333.3555.5534178605435468851.robh@kernel.org>
Subject: Re: [PATCH v2 2/7] dt-bindings: i2c: mux: mule: add dt-bindings
 for mule i2c multiplexer


On Mon, 06 May 2024 13:37:53 +0200, Farouk Bouabid wrote:
> Mule is an MCU that emulates a set of i2c devices which are reachable
> through an i2c-mux.
> 
> The emulated devices share a single i2c address with the mux core itself
> where the requested register is what determines which logic is executed
> (mux logic or device logic).
> 
> Add support for the Mule I2C multiplexer bindings.
> 
> Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
> ---
>  .../devicetree/bindings/i2c/tsd,mule-i2c-mux.yaml  | 80 ++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/tsd,mule-i2c-mux.example.dtb: fan@18: '#cooling-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240506-dev-mule-i2c-mux-v2-2-a91c954f65d7@cherry.de

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


