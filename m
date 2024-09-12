Return-Path: <linux-i2c+bounces-6656-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6799C977287
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 22:02:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB0C71F21C8E
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 20:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F2E11C0DD9;
	Thu, 12 Sep 2024 20:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lanZPK0C"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254EA13DBBE;
	Thu, 12 Sep 2024 20:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726171365; cv=none; b=mBtMj2vB+R8doVrMNpZ5zsHExRJEC7R7LcGmguowpo9oCqKHEDoWGih74viGhqm/GK4OXTMVNUy/p2fcQOKstwQbWQLSwHojI5e10fJErI0bqZxqGK4JD246yBhudhFqvl/7Aykd9ZnJMB5NESXgy39gNxcLMMxgpxMw39YzuN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726171365; c=relaxed/simple;
	bh=72sCiwcLGNLodmSGvD+gbRkHtOWi0verapOuz0ioxV4=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=gepAHQS79YjViUCPYKXVZZwioCFGHZmZbhQ3+vpa5CspHjoeYqqGG4a4mD9AMcUk1T0/W0Um+yOdUxZc8Lq5V2GpIb8GrFRCx6N99ltBdeI2pEs5HXDCaMWglxcwWjBMyWUQ7INxYDuATUcnD/lMVhNzr6S0UdC2iWKcV5KI5Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lanZPK0C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8086BC4CEC3;
	Thu, 12 Sep 2024 20:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726171364;
	bh=72sCiwcLGNLodmSGvD+gbRkHtOWi0verapOuz0ioxV4=;
	h=Date:From:To:List-Id:Cc:In-Reply-To:References:Subject:From;
	b=lanZPK0CZSY6Z7NP9JdI9UYannUTXaM3wq1djEB+GI2uRdES/9XqLB+qY5++GszvM
	 drGIaFpfAzBUX0cI0GJtPYrKz48WchYtJt//o01sE2rTLRNacfYNheYA38Qw+cZ3Ho
	 VdXOY0gy0Jw1NrWEUtAvwLhIFWew78UhOe5HS7H7S1ygvLrLYpYS8BIT6KkQdBYkXZ
	 vCdCMxgFPyHUGqpEQ/lWZ6pbHesxqum0wQYHDtUKfcG0hIot4Z+Txn5ynn5QwhqGhS
	 kuYTmp+gSmrY5ywrbj4YxAWElgzxFOAWTpwe4BRNATyi7LFNVP0Shy9rISjIvBVG+Q
	 gK1z80D+lAiaw==
Date: Thu, 12 Sep 2024 15:02:43 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Arturs Artamonovs <arturs.artamonovs@analog.com>
Cc: Arturs Artamonovs <Arturs.Artamonovs@analog.com>, soc@kernel.org, 
 adsp-linux@analog.com, Olof Johansson <olof@lixom.net>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Greg Malysa <greg.malysa@timesys.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>, 
 linux-serial@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
 Thomas Gleixner <tglx@linutronix.de>, linux-gpio@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, 
 Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, 
 Utsav Agarwal <Utsav.Agarwal@analog.com>, Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20240912-test-v1-18-458fa57c8ccf@analog.com>
References: <20240912-test-v1-0-458fa57c8ccf@analog.com>
 <20240912-test-v1-18-458fa57c8ccf@analog.com>
Message-Id: <172617136354.581910.4890193401475528436.robh@kernel.org>
Subject: Re: [PATCH 18/21] dt-bindings: serial: adi,uart4: add adi,uart4
 driver documentation


On Thu, 12 Sep 2024 19:25:03 +0100, Arturs Artamonovs wrote:
> Add serial driver bindings.
> 
> Signed-off-by: Arturs Artamonovs <Arturs.Artamonovs@analog.com>
> Signed-off-by: Utsav Agarwal <Utsav.Agarwal@analog.com>
> Co-developed-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
> Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
> Co-developed-by: Greg Malysa <greg.malysa@timesys.com>
> Signed-off-by: Greg Malysa <greg.malysa@timesys.com>
> ---
>  .../devicetree/bindings/serial/adi,uart.yaml       | 85 ++++++++++++++++++++++
>  1 file changed, 85 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/serial/adi,uart.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/serial/adi,uart4.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/serial/adi,uart.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240912-test-v1-18-458fa57c8ccf@analog.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


