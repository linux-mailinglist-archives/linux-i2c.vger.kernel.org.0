Return-Path: <linux-i2c+bounces-2073-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BE986D31A
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Feb 2024 20:27:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F729B21EA4
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Feb 2024 19:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DCF413D2ED;
	Thu, 29 Feb 2024 19:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FCJCcUTx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412BD13C9DA;
	Thu, 29 Feb 2024 19:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709234813; cv=none; b=ldhYWT8piT4+78lnoKG3YkvP6DiXj48aHWaY0Lq/tCnhYYiUV2hIH3fnfQ/tnwf1RYpM45JvE0mjovJ24Y2jYhz6pX1iirVrNSRQ1o09kZXCmitiM4NuVEVIAGCo8n4SgG0nAZG3URfdnaSBqzL9joHK3m7flwF0D5JblX6PRZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709234813; c=relaxed/simple;
	bh=dQBzFjbiyMY2YfsnEMAA2D18qSH0i0EESuIQfSa8Bos=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=E6QwpIJRUaoTiLsRD/yqBMuikz5IlQB5dI7U6mijoyNAEuG9mW3o/VGq3fuql5S4Fasu0vAnpO+Tz/KhvXvHiYTviBljolVoDm1f7qqqDeY9JMh8nqrq+wacO7BLUbJojns4YXRgtjMjpOVgpUTEeCoaxUKnQ7eX/2W74Qmw8Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FCJCcUTx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98BF4C433C7;
	Thu, 29 Feb 2024 19:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709234811;
	bh=dQBzFjbiyMY2YfsnEMAA2D18qSH0i0EESuIQfSa8Bos=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=FCJCcUTxHFiF2vBsMkiF1XIA1kLFEDBldowvgltYlnfplQRI/KrH4bGhod7q8aORO
	 X/rrkYKtLDRDqNe7CwJqfIDMvsvtokaX3/OMpZCpJbRLU6zt02ytjlgWDzanOIECbZ
	 EFtefDCRg9utWb8at5XYYiS7w6AriGL0fvWY/Q/fFVtTHgv2EKvGkH8tqNhsuSbX8W
	 JeR8DdXDm0FEFx2we4NsYQPhrm0f9mpolPAkZsD+6OENZ8Ql+rFRoDzy8zSRj0dr4s
	 AbSkFaJK1IJzmM2DiL5bQjj2D9Ni97TeO6S7iF5TJPCaCcWRHPBucoHW7YR01yFWYH
	 nzw3iZP6CrtRg==
Date: Thu, 29 Feb 2024 13:26:50 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Cc: Gregory Clement <gregory.clement@bootlin.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, 
 linux-i2c@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 devicetree@vger.kernel.org, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Guenter Roeck <linux@roeck-us.net>, Andi Shyti <andi.shyti@kernel.org>
In-Reply-To: <20240229-mbly-i2c-v2-2-b32ed18c098c@bootlin.com>
References: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com>
 <20240229-mbly-i2c-v2-2-b32ed18c098c@bootlin.com>
Message-Id: <170923480718.105821.4890305771845201981.robh@kernel.org>
Subject: Re: [PATCH v2 02/11] dt-bindings: hwmon: lm75: use common hwmon
 schema


On Thu, 29 Feb 2024 19:10:50 +0100, Théo Lebrun wrote:
> Reference common hwmon schema which has the generic "label" property,
> parsed by Linux hwmon subsystem.
> 
> To: Jean Delvare <jdelvare@suse.com>
> To: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-hwmon@vger.kernel.org
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  Documentation/devicetree/bindings/hwmon/lm75.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/lm75.yaml:
Error in referenced schema matching $id: http://devicetree.org/schemas/hwmon/hwmon-common.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/lm75.example.dtb: sensor@48: False schema does not allow {'compatible': ['st,stlm75'], 'reg': [[72]], 'vs-supply': [[4294967295]], '$nodename': ['sensor@48']}
	from schema $id: http://devicetree.org/schemas/hwmon/lm75.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/lm75.example.dtb: temperature-sensor@48: False schema does not allow {'compatible': ['ams,as6200'], 'reg': [[72]], 'vs-supply': [[4294967295]], 'interrupts': [[17, 3]], '$nodename': ['temperature-sensor@48']}
	from schema $id: http://devicetree.org/schemas/hwmon/lm75.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240229-mbly-i2c-v2-2-b32ed18c098c@bootlin.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


