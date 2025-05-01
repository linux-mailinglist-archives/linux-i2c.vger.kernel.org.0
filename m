Return-Path: <linux-i2c+bounces-10726-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A44ADAA6539
	for <lists+linux-i2c@lfdr.de>; Thu,  1 May 2025 23:19:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E3639A5160
	for <lists+linux-i2c@lfdr.de>; Thu,  1 May 2025 21:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEE0E257450;
	Thu,  1 May 2025 21:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ipumflO7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E137083A;
	Thu,  1 May 2025 21:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746134356; cv=none; b=klXFz5Ka43B8Lp5R/DNl/WjOkE88EqjBs0tuKV6+Ek37dwUrQ2kxc27MMBNPv6fbOVgLYdImB0q52GmERH0iVoo0n7B+bT8m/iFqiKl2wizx1fMBff1qBniqmufhFl7+A6B7pmGcWtS0bzNzNwkRg8OctlM6hBkJzA1PJp1tGkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746134356; c=relaxed/simple;
	bh=lE1aBp1W4TJq3953T5rI1DINDCR5UYnWgIEYEHh9xcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FPgL6+a4r081xcrLzYgPgcwYjSmbHxqoAVkMT7oMHElMRwbQYJr+TnqzeXtZzf/M4FT4P6Aw0WjYCDGvR4aIfKhVZIbd80r52IgWOxKkEd/lNJBeDpNXtmzoXKVLthMWme/UvwRg2B91ha9UxiLVopqH2XioHA9XWxMMdL/GUy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ipumflO7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66F56C4CEE3;
	Thu,  1 May 2025 21:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746134354;
	bh=lE1aBp1W4TJq3953T5rI1DINDCR5UYnWgIEYEHh9xcs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ipumflO77LviN8jw3R6q0J3JmFBFRNOXNIOKVWRJIgFKfMtVmDtb8aOldeeNA6uEz
	 q0bHpgOLNjloVnUr5YJ0d+ExmDaWcXNAZRhkt4iqv8IUMt00FL+k/S0WXrLTOmGDXn
	 OIbOly23SEbkC+UbspGIv2DJfFOpcumLneZGPsu4rRKgQR6QjdLSJL0WOsoDUFml5O
	 h04K4NQG/aTUmrbVbyCa9ycr0gF2BBlwhggIqxuUiMDoz2iI/1y25tkLjupiaaG/2k
	 x+RZgYvGeRmzxElmscNp7fuUh99cQKQRIiDSsJplf/0n5Y6kLND4xHPEqg4iakh8FE
	 qZYTMBDZhZ0iQ==
Date: Thu, 1 May 2025 23:19:09 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Andy Shevchenko <andy@kernel.org>, linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v10] i2c: riic: Implement bus recovery
Message-ID: <24rt2nozt3gk26vctj6zx2rgvoteus7lpzboysifbndhmcjzwn@6szzps23svdw>
References: <20250501204003.141134-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501204003.141134-1-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Lad,

On Thu, May 01, 2025 at 09:40:03PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Implement I2C bus recovery support for the RIIC controller by making use
> of software-controlled SCL and SDA line manipulation. The controller allows
> forcing SCL and SDA levels through control bits, which enables generation
> of manual clock pulses and a stop condition to free a stuck bus.
> 
> This implementation wires up the bus recovery mechanism using
> i2c_generic_scl_recovery and provides get/set operations for SCL and SDA.
> 
> This allows the RIIC driver to recover from bus hang scenarios where SDA
> is held low by a slave.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

I'm happy to see this patch in. Thanks Wolfram for your tests and
reviews.

Merged to i2c/i2c-host.

Thanks,
Andi

