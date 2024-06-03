Return-Path: <linux-i2c+bounces-3755-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BACC8D86BD
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jun 2024 17:58:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88B37B22575
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jun 2024 15:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9253132134;
	Mon,  3 Jun 2024 15:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MSgW5vz4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C91D1E525;
	Mon,  3 Jun 2024 15:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717430293; cv=none; b=r+z9YiUCcuujGEBlD5rLovNy1hdBhgC0Zx4k/yiNXC2RZQh/l4LYdyKIS/6UFKZsId12390Dq2UVOYeTDq4mvTl4a2z0V21H4KhLO6Trc64lKBwyAt1hk0YSFFL4APmajUaUYoTlZqoDCzFGGKfZwDFdXLTNyWxaDOc9JfNFljI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717430293; c=relaxed/simple;
	bh=IA7qcp/mduOHBaxfNuh++wQYHXKJfT/U3Y8Cbb5DK54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n5hjhlLfXzsZ+3xc0gCwk/3bnJPfGq0n2lOEEF8jL1E1dI+DNf5L/BcZrHipjEEX7Awxc0LwR50jTQFsrvRWKGqNIhmrtSWG+byMtPlI+GGKAxEkPsaH31JwGkSBcn6Flqsu6b3z63zphbNbsQ6/Bnpag25V+xE6FaM5ff723w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MSgW5vz4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCF51C4AF07;
	Mon,  3 Jun 2024 15:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717430293;
	bh=IA7qcp/mduOHBaxfNuh++wQYHXKJfT/U3Y8Cbb5DK54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MSgW5vz4CMZdVkzWlBdyDLFc24nRE8R8v9sVC1iBaXYcdz7xdY2B9clgbDmWAH+8L
	 33bihTYiFUyjvEkazch54+E8fzmghkWfVp4INepjjhMFVGxREIB0Gp2zW11XNBaWso
	 piTLP8p5iHrQKsDtLbkYn8G7JL2p/6hkNLeu0cwOUJLZeQXk5BwXvt5EfadMAmo4pc
	 zLiMjEy3k3QFomL52y9YBpOThtSeG1JTLTVqNt0AHWKJBgqHKSapAtMyxjcgH9xOEP
	 1OVsnXFVvpAqutW9rrUDtOc0UWE0Qz/tgSc7JrmhRXkcH4yrXYpzmxNPHe1I5dM1/c
	 4cPO1KJMV9NVA==
Date: Mon, 3 Jun 2024 10:58:10 -0500
From: Rob Herring <robh@kernel.org>
To: Peter Rosin <peda@axentia.se>
Cc: Bastien Curutchet <bastien.curutchet@bootlin.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Korsgaard <peter.korsgaard@barco.com>,
	Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Christopher Cordahi <christophercordahi@nanometrics.ca>
Subject: Re: [PATCH v2 1/3] dt-bindings: i2c: gpio: Add 'transition-delay-us'
 property
Message-ID: <20240603155810.GA509311-robh@kernel.org>
References: <20240529091739.10808-1-bastien.curutchet@bootlin.com>
 <20240529091739.10808-2-bastien.curutchet@bootlin.com>
 <718d86a7-d70a-c38a-089d-5276bcc6e88b@axentia.se>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <718d86a7-d70a-c38a-089d-5276bcc6e88b@axentia.se>

On Wed, May 29, 2024 at 02:13:37PM +0200, Peter Rosin wrote:
> Hi!
> 
> 2024-05-29 at 11:17, Bastien Curutchet wrote:
> > I2C MUXes described by the i2c-gpio-mux sometimes need a significant
> > amount of time to switch from a bus to another. When a new bus is
> > selected, the first I2C transfer can fail if it occurs too early. There
> > is no way to describe this transition delay that has to be waited before
> > starting the first I2C transfer.
> > 
> > Add a 'transition-delay-us' property that indicates the delay to be
> > respected before doing the first i2c transfer.
> 
> The io-channel-mux has a property with very similar intent named
> settle-time-us [1]. I think we should use the same name here.
> 
> [1] Documentation/devicetree/bindings/iio/multiplexer/io-channel-mux.yaml

Agreed. I knew we had something and went looking... I only checked the 
base mux and i2c mux bindings.

Rob

