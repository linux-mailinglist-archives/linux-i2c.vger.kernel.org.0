Return-Path: <linux-i2c+bounces-2204-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE30B872C5A
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 02:49:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 71CD2B21A66
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 01:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A927E79F2;
	Wed,  6 Mar 2024 01:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WKrNTlde"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519286FBD;
	Wed,  6 Mar 2024 01:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709689789; cv=none; b=FPcXVVjqx0aV6FS8YJGIW6ogTIe8WwkZp+ZfdzVxJjTBB97GBjYEiC6Rl38CucdFtIbW66pKt0eR+WEMdUipZeyGW/dfai7Nku0nmt9yB+dXLIAYAIrKhFhRif/IwdvrSzkJXtrXJJ46e069cSqbdAlWmuTiMAbgFu7wOLpQ13I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709689789; c=relaxed/simple;
	bh=jIG8kaFgd86PMgfAwRM5UWO6P6Uef/gZbBNQgdMsbhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o7OhYhU5igdTpNG2rMgpSvYb0GNk4V6aGGpy8njzw5fY7AwONU3fMgd8Ith8wBBDhY2QII99+BCNec5pql1j1TjqS5sB3JKNRpeRXh2rI9vtqK6ciFgNc1LBNRiWulBxxlbq2xva3UG8QM+G4BTaM7K3OZGcBfI/n+7Bs2qtOnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WKrNTlde; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E460C433F1;
	Wed,  6 Mar 2024 01:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709689789;
	bh=jIG8kaFgd86PMgfAwRM5UWO6P6Uef/gZbBNQgdMsbhs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WKrNTldebp73acwkK9fCTgkAG9julv9sDswIv6u2BLN7R0Us1IDnU1p0oBPpC11vI
	 tevoKfKU0F42pTVSV4FXCWQZXzzijYMbcSUhJJjbZ+DyAimYWXQXQi/YIIIAgYFZdW
	 IkbtImJ9KUdvqchgn40ptfApTYp9M+FWC+vFv6ZjSRNwEYVBqvooQdvfScPsImZNyv
	 rQ/7l32deNaVy6i8IHNjtGuji26APMPrD92TqbsI3au3jVPpA6RxTzfeCc7/XGwdwu
	 qCg9tvPrPK9JkfzAJ65nlNY+jkW+93QbIuVHbf3g1MzsxHgR/GYm349ybUJhuuXJUO
	 r1qb7kMslNsKg==
Date: Wed, 6 Mar 2024 02:49:45 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	Gregory Clement <gregory.clement@bootlin.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 00/11] Add Mobileye EyeQ5 support to the Nomadik I2C
 controller & use hrtimers for timeouts
Message-ID: <bhiubxf3vuxfnz4rh75isgy5z5cexa6dnlw733box5ly3h7r5f@yqvzs75d3ykb>
References: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com>

Hi Theo,

> Théo Lebrun (11):
>       dt-bindings: i2c: nomadik: add mobileye,eyeq5-i2c bindings and example
>       dt-bindings: hwmon: lm75: use common hwmon schema
>       i2c: nomadik: rename private struct pointers from dev to priv
>       i2c: nomadik: simplify IRQ masking logic
>       i2c: nomadik: use bitops helpers
>       i2c: nomadik: support short xfer timeouts using waitqueue & hrtimer
>       i2c: nomadik: replace jiffies by ktime for FIFO flushing timeout
>       i2c: nomadik: fetch i2c-transfer-timeout-us property from devicetree
>       i2c: nomadik: support Mobileye EyeQ5 I2C controller
>       MIPS: mobileye: eyeq5: add 5 I2C controller nodes
>       MIPS: mobileye: eyeq5: add evaluation board I2C temp sensor

what's your plan for this series? If you extract into a separate
series the refactoring patches that are not dependent on the
bindings I could queue them up for the merge window.

Andi

