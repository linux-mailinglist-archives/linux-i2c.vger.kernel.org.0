Return-Path: <linux-i2c+bounces-3981-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5BE903D67
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2024 15:32:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2E2A1F25FF2
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2024 13:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2C1717D378;
	Tue, 11 Jun 2024 13:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kl9sam2q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B39317D36B;
	Tue, 11 Jun 2024 13:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718112730; cv=none; b=axFzWEGu7GICJgLEONDskD53h7F6DKS/juc2FLlM1XpSkJfqGTlrkjmSV9Y5J0P3Or4GayaUDZacszS+OKmyZ4WH/G2wYUWzGe0TYtcfVTW/OZSlGNlS2cvJ4XkQNtQ3NhXK50AmKFrBO3S1CiWhg/mceXAsCeXQV3yGvN91y50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718112730; c=relaxed/simple;
	bh=auRaKNvx/voptdJZcs/+I0St7hUhKeq7sqbXPrw3k+k=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=uNeCPX68MUjPiigCM8Sel05AttFkM+J8RKTOe+mz8Ysr12ZsyW/OmnwVVAKgYnuuznU48kYQejNzJP4sGxLIknu2YATYchul1LUbo4R7f++tjxAvKAk9C1Ynl2Ab8SKGdnvH4R5WCOL6tD51dHYTt+RkCWPQBiH8DzhSfAzgj6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kl9sam2q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C01EBC3277B;
	Tue, 11 Jun 2024 13:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718112730;
	bh=auRaKNvx/voptdJZcs/+I0St7hUhKeq7sqbXPrw3k+k=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=kl9sam2q7uiL9cUx3MZrd3xsXoGNAWm4cbdIgnouxMWA1VPjQk40fod8xAdky4YW6
	 fP2y60Pqlt8sXeJPIhzRzU6jC0UT+hzDN1zwPDBjYzsQuFNA1c+bygoWZS2g0174RD
	 c9/JXHe+B2hBx8t9LIGLkJDQciINgo0m7HKxqCahFI/9d/lKgVDpP/9JawV8YsjMjd
	 pNtoHFESJX65H1RFPYKz8o/CX8Zr0JJDa/1bNuaigoHkMv11BMPB1dpDYToeefCl53
	 nPgSq4VePPPF5uGMJAbdhGrRnJaxwYLTM2mrZkDKiCcc5TpGOuiFLO27sSVdwJyr38
	 vDeHnitwe0jEw==
Date: Tue, 11 Jun 2024 07:32:08 -0600
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
Cc: Heiko Stuebner <heiko@sntech.de>, Andi Shyti <andi.shyti@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peter Rosin <peda@axentia.se>
In-Reply-To: <20240611-dev-mule-i2c-mux-v3-2-08d26a28e001@cherry.de>
References: <20240611-dev-mule-i2c-mux-v3-0-08d26a28e001@cherry.de>
 <20240611-dev-mule-i2c-mux-v3-2-08d26a28e001@cherry.de>
Message-Id: <171811272875.1782775.2673232019553624734.robh@kernel.org>
Subject: Re: [PATCH v3 2/7] dt-bindings: i2c: mux: mule: add dt-bindings
 for mule i2c multiplexer


On Tue, 11 Jun 2024 13:43:53 +0200, Farouk Bouabid wrote:
> Mule is an MCU that emulates a set of I2C devices which are reachable
> through an I2C-mux.
> 
> The emulated devices share a single I2C address with the mux itself
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240611-dev-mule-i2c-mux-v3-2-08d26a28e001@cherry.de

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


