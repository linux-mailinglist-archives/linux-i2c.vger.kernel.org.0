Return-Path: <linux-i2c+bounces-2303-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F388F876D59
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 23:54:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A923E1F2261E
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 22:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9B35376F6;
	Fri,  8 Mar 2024 22:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cNs7LkTJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC7A36139;
	Fri,  8 Mar 2024 22:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709938459; cv=none; b=k/wrSk3Sc+P6Q/VIwzKfLKo5BCyY4byU3HuPIsIg1kT6AXlVZ4/PXZMvaiExwAgqcTM9QV8FieReMJadthKgUcqFhGbsdYRrcRXV4Tw39yFjijcVqCaiefdN6SOAtqBVHEmtyehvRpKHkKvguS4JADGMHd0CerG1HvTRgqJw/Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709938459; c=relaxed/simple;
	bh=Vkly+QNlmDqUblUCvbWVxQbK01ihl2TM0nwd62VhE8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DZLndFzVUbs9q+UNh4jX/BBx3TGciRUqWxorje0G/TXnLjbAYsRO0Y0/BADAE7f9zzAMS2Tw1fZi3PzX53k9tCdIZbpTB8TLqT8ICItOWaghV8L/GBxkYblWLWgcwHQGk/YbuifGuyK3F5fOrMTHhHXP5fs8wkXxwIk51727DD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cNs7LkTJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CFCDC433C7;
	Fri,  8 Mar 2024 22:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709938459;
	bh=Vkly+QNlmDqUblUCvbWVxQbK01ihl2TM0nwd62VhE8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cNs7LkTJGQyWeQymH9AOr9F5jSqrTMIZVIeP0qR7RHyYnDCjgMRbboFrz/D0oeoIG
	 b6RTgQ5QkqaXgnn7bUFd+EG30b2Seo+OVreYVKqUGJFV96GcgDLEb0lsfWP17pDjUa
	 nMyyXXWgO7fpf2VQQQida/YiCRCAkET7owp+46mnt5zCDs8rlPbkvpnHskM0tr1T19
	 KBHlorv9FYzI1S6eypgZe14YBCjwdVbCuaSWEx99VL9dbw4mr4OTvlLpxZL9NPF1om
	 IlmhvFkJ7vvyx8YJKslKx//ZVEole8AEh5qysdO5neHo1VJBep+eDeVG9RJ2w4VCK1
	 cYXKEL6B7nwfQ==
Date: Fri, 8 Mar 2024 23:54:15 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	Gregory Clement <gregory.clement@bootlin.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Subject: Re: [PATCH v3 08/11] i2c: nomadik: support Mobileye EyeQ5 I2C
 controller
Message-ID: <yyyhx62wcvro2zrkxmj6g3esg32zh62f4spox7txv4ghc74ewo@lzduga5d4wzi>
References: <20240306-mbly-i2c-v3-0-605f866aa4ec@bootlin.com>
 <20240306-mbly-i2c-v3-8-605f866aa4ec@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240306-mbly-i2c-v3-8-605f866aa4ec@bootlin.com>

Hi Theo,

> +static inline void nmk_i2c_writeb(const struct nmk_i2c_dev *priv, u32 val,
> +				unsigned long reg)

If you don't mind, I fixed this checkpatch warning while
applying:

CHECK: Alignment should match open parenthesis
#103: FILE: drivers/i2c/busses/i2c-nomadik.c:247:
+static inline void nmk_i2c_writeb(const struct nmk_i2c_dev *priv, u32 val,
+                               unsigned long reg)

Andi

