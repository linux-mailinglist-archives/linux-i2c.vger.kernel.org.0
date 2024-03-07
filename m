Return-Path: <linux-i2c+bounces-2266-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3519A875ACC
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 00:02:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A77BDB226D7
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Mar 2024 23:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70A853D393;
	Thu,  7 Mar 2024 23:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D7dWJ8Jt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EDE2E648;
	Thu,  7 Mar 2024 23:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709852513; cv=none; b=LwSsYurjFtpZkI4eLydg8n22IaYUGBy5ukGJJtekSqgnTSuRGErmQjJrMqjL9jXGComtYWbD1j5QWkyS9XWZycOv7AexmHRjGUXYmy+U7AmkhoOrggfF2p1zkKvurBaCfhLkz544F8gBLkrAgzcPYontB6V0nBeMb0JUV07hzcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709852513; c=relaxed/simple;
	bh=0hqvHXQQQ1UnxgLlDX491LTxX6udHCE+N7qDRGzdko4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EBIwBXha7ayAbotjJDN0fLDaX/7EAf4ISyAkE+ORyLaooyIIYjUGUaZvVeaLdveNTmSkV+TzXsuFkedZ3wu5+32mkXduCk1EcN/aejqWXPgf3MUM5/MT+vEhSsiO9nUU0etJmukVEg+DFrOY4vs46PegqFCIchM5nWxmNLImC9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D7dWJ8Jt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3E3AC433C7;
	Thu,  7 Mar 2024 23:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709852512;
	bh=0hqvHXQQQ1UnxgLlDX491LTxX6udHCE+N7qDRGzdko4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D7dWJ8JtvJ8KR5QUwO7a2OgaqrnQlT6HofqesfVT8+srYHJdjV0MUl52OZ9iZ5Fka
	 ok+g+uVsnFzg1Xi3sqayWQoyBJkSlpl2ccxR7ag6rX13otSglmIchKZVxg5tiAPzYI
	 YLYnoEAAyzVxj3K9/wcaCJoW2Q+xDQjC+4IHns8Omv/vXc4J4WHCv0CNG8vLNwDAsw
	 2cHwO5hIUoEV6LeCn/S9Gbu2zT9j9TFZHH2Iys37xcc4zQRVAZLazhmRDuf6+/lX4y
	 zmVrw0Dg0tgGZA83h4yX6zBIgVl5So20xlV6T2VhLntm1J6e+iiTOOAiKlxRcmnAJe
	 cLofJKwgiozrw==
Date: Fri, 8 Mar 2024 00:01:48 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	Gregory Clement <gregory.clement@bootlin.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Subject: Re: [PATCH v3 03/11] i2c: nomadik: simplify IRQ masking logic
Message-ID: <422szb2dtgnq56xznfqsqtqs3dai2jipnntrp6yb2og353whs7@g4ia5ynnmqu6>
References: <20240306-mbly-i2c-v3-0-605f866aa4ec@bootlin.com>
 <20240306-mbly-i2c-v3-3-605f866aa4ec@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240306-mbly-i2c-v3-3-605f866aa4ec@bootlin.com>

Hi Theo,

On Wed, Mar 06, 2024 at 06:59:23PM +0100, Théo Lebrun wrote:
> IRQ_MASK and I2C_CLEAR_ALL_INTS both mask available interrupts. IRQ_MASK
> removes top options (bits 29-31). I2C_CLEAR_ALL_INTS removes reserved
> options including top bits. Keep the latter.
> 
> 31  29  27  25  23  21  19  17  15  13  11  09  07  05  03  01
>   30  28  26  24  22  20  18  16  14  12  10  08  06  04  02  00
> --- IRQ_MASK: --------------------------------------------------
>       1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
> 0 0 0
> --- I2C_CLEAR_ALL_INTS: ----------------------------------------
>       1     1 1       1 1 1 1 1                   1 1 1 1 1 1 1
> 0 0 0   0 0     0 0 0           0 0 0 0 0 0 0 0 0
> 
> Notice I2C_CLEAR_ALL_INTS is more restrictive than IRQ_MASK.
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>

You did answer my question in v2, thanks, Theo!

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Andi

