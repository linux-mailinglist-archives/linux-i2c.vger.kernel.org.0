Return-Path: <linux-i2c+bounces-14384-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E5ECA1955
	for <lists+linux-i2c@lfdr.de>; Wed, 03 Dec 2025 21:46:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EF472300253A
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Dec 2025 20:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B09C72C028D;
	Wed,  3 Dec 2025 20:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lxaT1ghx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623862BD5AF;
	Wed,  3 Dec 2025 20:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764794769; cv=none; b=Q/z2+cH3s8GmeYcs8aK75gX+4zRROu46DrZzPX6bBG0BtJTwvxdwYXjML3M0lz4PHL+9NkcM9/xcurjm86csXR97UF56TO8fccl60/XrEwuN2BfWawGmOh3/Z0urU+fv6UjcETP0PoXbrYvKIcrWmvn+SzJT3hvZ08/Xxd4mAcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764794769; c=relaxed/simple;
	bh=67TvZRH+k7C9k9ySFwvqEZOgGkKKvpNdfGsHbvBaEHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gualUWqSMNLT9WdkWR/5J9fhDd1vCEirsr+wM80NQC8Ow+0Vw95PH0pBKbqVkgfdUH4pIw3Q0gZ+VS8iBaTTdjWKcKupm2TTSekjM6qQiPRBF9KYA0nGipupJAuwXwogUuEh6YH7lCPmRrPwvywmYt+quFgPWoPV643EuZQbAAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lxaT1ghx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5166BC4CEF5;
	Wed,  3 Dec 2025 20:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764794766;
	bh=67TvZRH+k7C9k9ySFwvqEZOgGkKKvpNdfGsHbvBaEHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lxaT1ghx1Cs5MaoUEnTc4f9jhRSUKSJAF7UgE5hUAFZb9glFdog1YhNf26FFZ+ODM
	 2XpRCjnaC780TF64mA137Fo3sG22iUlTuerwvwhgTkDv91QVatU0nRpjSUjUG67QbK
	 AmpHO8lcQ56nVINOYt+Tw5V6mBisl3R18B7ogUVC6B00EGzrbk5LiErJufV0F83+MK
	 ttreOENNQlJWRrRzpZVF5TqeQtOPbqgKN8YY/gf4/Oer9jGwg7C7mVHLK1etikxxE3
	 cy1h2INC06cWpbrglUi/YfZOn+gzJ2P1QMmzbygjOGW7OoZ2Nbepn+Y/KzDTPdPOsb
	 hRAZk6IX3D0Og==
Date: Wed, 3 Dec 2025 21:46:02 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, Aurelien Jarno <aurelien@aurel32.net>, 
	Troy Mitchell <troymitchell988@gmail.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2] i2c: spacemit: fix detect issue
Message-ID: <rha5zun6qxzpbi5arzsjaywgzzardvsrjyibaw42yqpom6nx47@wmusvc7bqhl5>
References: <20251113-fix-k1-detect-failure-v2-1-b02a9a74f65a@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251113-fix-k1-detect-failure-v2-1-b02a9a74f65a@linux.spacemit.com>

Hi Troy,

On Thu, Nov 13, 2025 at 09:21:50PM +0800, Troy Mitchell wrote:
> This commit addresses two issues causing i2c detect to fail.
> 
> The identified issues are:
> 
> 1. Incorrect error handling for BED (Bus Error No ACK/NAK):
>    Before this commit, Both ALD (Arbitration Loss Detected) and
>    BED returned -EAGAIN.
> 2. Missing interrupt status clear after initialization in xfer():
>    On the K1 SoC, simply fixing the first issue changed the error
>    from -EAGAIN to -ETIMEOUT. Through tracing, it was determined that
>    this is likely due to MSD (Master Stop Detected) latency issues.
> 
>    That means the MSD bit in the ISR may still be set on the next transfer.
>    As a result, the controller won't work — we can see from the scope that
>    it doesn't issue any signal.
>    (This only occurs during rapid consecutive I2C transfers.
>    That explains why the issue only shows up with i2cdetect.)
> 
> With these two fixes, i2c device detection now functions correctly on the K1 SoC.
> 
> Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> Tested-by: Aurelien Jarno <aurelien@aurel32.net>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

merged to i2c/i2c-host.

Thanks,
Andi

