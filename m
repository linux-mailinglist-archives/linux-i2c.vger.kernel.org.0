Return-Path: <linux-i2c+bounces-14798-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E54CE01A5
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Dec 2025 20:45:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B9C78300BA1B
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Dec 2025 19:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89347224AED;
	Sat, 27 Dec 2025 19:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hNzJQ0Qa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBFAA937;
	Sat, 27 Dec 2025 19:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766864751; cv=none; b=SegN3rdHIKgNZqqPiJxSnj9dyNcRcy5jc2tfFuC2VK7UJka5eW4Ho+YVoav23XW5RHzqAbfmtM1PfIPciRZmQons//6oTx3QH2ddU6H8rnOubq2Au4ggn7DraujKHYRskmPfVDngEkVDClgQeWzu6wSQRQS5p56Kl/ZpGNKdAuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766864751; c=relaxed/simple;
	bh=Ea8lehg7pSCOva7aGzicefxhTV6jmeEkIieXlVI6U8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bzTOkmHspHeaZVefSKwBdlxietR2UgF4BGtGJRllWqIZBrEYP3qqymMzwnMUgGFuu2vIs8VI2hm1KL+5STjtzWia2xn0DIkXvqqf2LEsu+lE8j7o5qDOhvNqXG2tWerGSZrN1gL5T315fpqL+ukrBi7lbICce1xp/kd+zpeIHGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hNzJQ0Qa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7127AC4CEF1;
	Sat, 27 Dec 2025 19:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766864749;
	bh=Ea8lehg7pSCOva7aGzicefxhTV6jmeEkIieXlVI6U8E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hNzJQ0QaaMrVwKbWnvxmwy4KFqO3D+o6/SqnTHQ/EQz2jqXZmuAlBkAcUhhMVvykI
	 mnfVlMYtx/kSgAqTGXoLPn7NvRfjejitJK2KZg1Cx4W7DdWzUE1jA6k8uuAKmbtPgp
	 G2gybjJqw6qp2hFsJV3CErUzALK/y6zfCn3MbE0K0Z1TLaRPYDZ8Kx7tvz2MesBtoc
	 BpOOnsFlfyuzegQBxKmz/n5atxzljqbe0VRxwYhAVWIZSuXPU+e3k7ti3OSq0KKLIY
	 XesljHbPoWoySGv1XMtWBmv29Iy9CXJe8R+i3AXwQ72UEmOmBdg/ByMkNIcAhHquRu
	 AkIR+hBiLOlMQ==
Date: Sat, 27 Dec 2025 20:45:31 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>, 
	Aurelien Jarno <aurelien@aurel32.net>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Troy Mitchell <troymitchell988@gmail.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v5 1/2] i2c: spacemit: replace i2c_xfer_msg()
Message-ID: <fnyar6fvzqr3dw33wv6abg3plmj5p2tr75a45zmyrb765fmrm2@gkw7mupx4wdw>
References: <20251226-k1-i2c-atomic-v5-0-023c798c5523@linux.spacemit.com>
 <20251226-k1-i2c-atomic-v5-1-023c798c5523@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251226-k1-i2c-atomic-v5-1-023c798c5523@linux.spacemit.com>

Hi Troy,

On Fri, Dec 26, 2025 at 11:31:10AM +0800, Troy Mitchell wrote:
> The upcoming PIO support requires a wait_pio_xfer() helper, which is
> invoked from xfer_msg().
> 
> Since wait_pio_xfer() depends on err_check(), move the definition of
> xfer_msg() after err_check() to avoid a forward declaration of
> err_check().

on the subject, this is clearly an i2c_xfer_msg move, not a
replace, right?

(if no v6 is coming, there is no need to resend for this, it can
be fixed before merging).

Andi

> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

