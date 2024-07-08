Return-Path: <linux-i2c+bounces-4766-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3380F92A824
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 19:17:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 629211C211A0
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 17:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A87621474A3;
	Mon,  8 Jul 2024 17:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YSVYJBJQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE9BAD55;
	Mon,  8 Jul 2024 17:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720459067; cv=none; b=s8MkHOsN7rWKndcr96FRkUVs6O0cfxIjznZiskAMyRIXtWHh/g11cGGnmr5bBKPZ652SiS79WXWr75FAa0YMPYoW95aKwySci2hABEvwfipO+qFuhejENgO7aHyKX/M0yYniOgdtsbbW79L/y4vcFhQiFGOKOZJkvtsiKTtPBcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720459067; c=relaxed/simple;
	bh=ZUZObWhSbMSxsYVODKwPis9fWvoPX61U5GmyBYrA5Do=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=kXGZmPxkMnSE58fTBMC3LjKsZOS2uPxhQqq5IIMu2V8cgOYEl7SPV+WB2iZ/0V9Ge15iN8KLvOBmCXc8Vt3p1YZe4aKZbMU3WmHuc9FS/d9jiQ/TuOxaoieDX2q9e3TXkzpE7BZJ66Hij++PAZCZNFgVDg4BNNuPa5dM2uyiJPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YSVYJBJQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1076C116B1;
	Mon,  8 Jul 2024 17:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720459066;
	bh=ZUZObWhSbMSxsYVODKwPis9fWvoPX61U5GmyBYrA5Do=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=YSVYJBJQyryGmTGrjhJ6DPlK1HX9PujCxuyVTwz8FTMFuigd8FfK/km4TVmQNoAtw
	 4xiTYi+FWekUIPrbz2uUvQzdkqoi8eq0XDyLb913qvE85f5QzWUsVE/Vgnus0UnQFp
	 7UqCj8q2kG3etfZTY0uZJ0ONXDPBtitTjbtZIV7fsArracR0c2J52+qaCsgcdtYR3I
	 o0K4W9EvdrHeGcaLYCDoYCHpzrH+GtwT8mtNNqmptzyMZExpuQGxWFclH5TIVlggF2
	 eI8aBEuuvfp+ZkzroBGoYy3Nhi1qDo9AV45bU35BMhkP8KcE1oQmvYSBDG6fo3H+qs
	 qEfVrKJJA/1gQ==
Date: Mon, 08 Jul 2024 11:17:45 -0600
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
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, 
 Quentin Schulz <quentin.schulz@cherry.de>, Peter Rosin <peda@axentia.se>, 
 Guenter Roeck <linux@roeck-us.net>, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240708-dev-mule-i2c-mux-v5-3-71446d3f0b8d@cherry.de>
References: <20240708-dev-mule-i2c-mux-v5-0-71446d3f0b8d@cherry.de>
 <20240708-dev-mule-i2c-mux-v5-3-71446d3f0b8d@cherry.de>
Message-Id: <172045906545.3469012.7420722768425918930.robh@kernel.org>
Subject: Re: [PATCH v5 3/8] dt-bindings: i2c: add support for tsd,mule


On Mon, 08 Jul 2024 18:12:14 +0200, Farouk Bouabid wrote:
> Theobroma Systems Mule is an MCU that emulates a set of I2C devices,
> among which is an amc6821 and other devices that are reachable through
> an I2C-mux. The devices on the mux can be selected by writing the
> appropriate device number to an I2C config register (amc6821: reg 0xff)
> 
> Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
> ---
>  .../devicetree/bindings/i2c/tsd,mule.yaml          | 63 ++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/i2c/tsd,mule.example.dtb: /example-0/i2c/fan@18/i2c-mux: failed to match any schema with compatible: ['tsd,mule-i2c-mux']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240708-dev-mule-i2c-mux-v5-3-71446d3f0b8d@cherry.de

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


