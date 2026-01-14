Return-Path: <linux-i2c+bounces-15169-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D74DCD21B26
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 00:05:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1C92B302E3C0
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 23:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FF303570D6;
	Wed, 14 Jan 2026 23:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ItelGoID"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D522DECD2;
	Wed, 14 Jan 2026 23:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768431899; cv=none; b=dMan2haFgRyMgeqhjI1DjXa3ChuPGSqbYXN1ZSvOLoun32aWWzpuQEYxOOZcmYuOGr6fqeLa1KyYBP5imb8L4x4VEKQJvn3GdcW8/wm+n2q2W5LHHxQu+eivbPxHWHSlSyKGF9dD+b8hRGpxKv9ppCvrVHgvl1WgWab+Ks6KWH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768431899; c=relaxed/simple;
	bh=5Kn6ZXpXDdtEnOpfSUDcw9fvtuyMFn4uC94zbV1j7ZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WgUi0EisgzKFK0HT4RUcl9asOeWRBNSG9aTCkTumfNCc539C4ae6qrtu9/Rl+Y8rwSr1jc4UmP98l/Bvi1gwiM/6P5XAiC/3wAQRBKPtDCsvPZNl8V60MXdDTcol+MnegylTX3A0ay+b/IwNv8BCFWtbpG9tHDU5E/MfLWACTtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ItelGoID; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25451C4CEF7;
	Wed, 14 Jan 2026 23:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768431898;
	bh=5Kn6ZXpXDdtEnOpfSUDcw9fvtuyMFn4uC94zbV1j7ZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ItelGoIDscLo+hcxoNqsKmcbn8bg70Fh4uZqb3Dd3Ivwy+N4Uz7Te9uug1K0ffi/A
	 lFWJOjvx/Kx8FETWVXw9vLdfUO0OS38ofKRaVbaMV6QSBy6hmODEcEosI3/WYagDuo
	 XyV6e15Ng7eXub6Pr42U75YwN/rI/Cs29tUX8RgFlfMKOH3N/pmBVJzuamfqIiqh6H
	 NuzAhN5u42Kq/pjdVuj3UINQ2hJpe4cEmZvcEAZfs9DXZbJ6qZn30NCrTv2p8hIA8d
	 INzXNNRPLOgxyQ5UMeGaourFoqzPr64Iso5d2X9rbPZBe7o7dJO5Hu1CdHzxqm8P8m
	 MxNNOLI0SvZsg==
Date: Thu, 15 Jan 2026 00:04:53 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Subject: Re: [PATCH v5 3/3] i2c: spacemit: drop warning when clock-frequency
 property is absent
Message-ID: <aWggz23QaXtQbK7g@zenone.zhora.eu>
References: <20251226-k1-i2c-ilcr-v5-0-b5807b7dd0e6@linux.spacemit.com>
 <20251226-k1-i2c-ilcr-v5-3-b5807b7dd0e6@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251226-k1-i2c-ilcr-v5-3-b5807b7dd0e6@linux.spacemit.com>

Hi Troy,

On Fri, Dec 26, 2025 at 04:32:01PM +0800, Troy Mitchell wrote:
> The clock-frequency property is optional according to the DT binding.
> Do not emit a warning when the property is missing and fall back to the
> default frequency instead.
> 
> Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")

besides Alex' suggestion, please, remove Fixes here. This is not
worth being treated as a fix. What you are doing here is just
remove a warning.

Thanks,
Andi

