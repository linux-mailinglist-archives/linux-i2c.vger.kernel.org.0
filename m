Return-Path: <linux-i2c+bounces-10834-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E25E3AAD406
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 05:22:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E713F1C00C7C
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 03:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54D341B422A;
	Wed,  7 May 2025 03:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="bCR+8fc3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C4B1A255C;
	Wed,  7 May 2025 03:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746588136; cv=none; b=gO7jc+l1RwXVghpU+dX6INikaabDJ7184dZ7Sao+1lDrFSmgqgeqyFqEl+BYm7FKjlY/2wnIEYAAv4zfbjRikXupLz1/u8hv6iUgO59uqouiSmXqzx3AuX0r7ncLY36LgkTwObxFPp3vx5/RY5TdbfiZjoFSrUojoputF9HYMsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746588136; c=relaxed/simple;
	bh=WxnIZWGjyW8z4p9AhSnJJsn8ZjAdBNM5VL2W6LDw1c0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mdKqWcRbCMpbde/Bjvt6LVgttvfsIxyVjrLN0OMw87QAA5WsAw0TGzVQhbqDTu50MvUZTF4iCnp72M3WLFgVBTRtoPK4PgHCLvtqxCI9kdVFWuQe6mkFqq/QWDky231NRfSgrShd1iRtnvtgygohXmDSDvE7Hb2U+67mGXvwm8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=bCR+8fc3; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1746588132;
	bh=WxnIZWGjyW8z4p9AhSnJJsn8ZjAdBNM5VL2W6LDw1c0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=bCR+8fc3LtDcSawxO4X6KapprEaFUHlDopKZmFaplYY0hg9qY2ZHxxAV725dw6TZI
	 vMDQ4I5qCYW6aZB4ClA6mBPGWTAzsDb1q1Thuz7JM2NEN/d3IuDPcTQLqgOX/JwN49
	 KHoX9w693tqIC2Wx8pBJhr+8PskzFyOU7AHb//tDxrGce2vfyWslb8hUjjTgbuA7VR
	 Q5OEngX/ctCaryV+qVyYxXLfGBO3HzAYro10sfoquGFdPUUuZPvdQI5ai05jbgyxJM
	 fT8bxI8lm3R4gU+9Se9xj6dc4oLjeMt/vfVhuQ2ToHwniIaYo/sUJ108EIsmeyRJEA
	 xje1L/94ngvGg==
Received: from [192.168.68.112] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 324D864473;
	Wed,  7 May 2025 11:22:10 +0800 (AWST)
Message-ID: <5acf9c0afc764931f3e9e70c4085beeb95b9652d.camel@codeconstruct.com.au>
Subject: Re: [PATCH] dt-bindings: interrupt-controller: Convert
 aspeed,ast2400-i2c-ic to DT schema
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "Rob Herring (Arm)" <robh@kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>,  Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Ryan Chen
 <ryan_chen@aspeedtech.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org
Date: Wed, 07 May 2025 12:52:09 +0930
In-Reply-To: <20250505144605.1287121-1-robh@kernel.org>
References: <20250505144605.1287121-1-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-05-05 at 09:46 -0500, Rob Herring (Arm) wrote:
> Convert the Aspeed I2C interrupt controller binding to schema format.
>=20
> Drop the "#address-cells" and "#size-cells" as they are unused and
> incorrect anyways.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

