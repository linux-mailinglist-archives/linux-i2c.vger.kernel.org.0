Return-Path: <linux-i2c+bounces-14972-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6656D0007E
	for <lists+linux-i2c@lfdr.de>; Wed, 07 Jan 2026 21:40:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4686B301410D
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jan 2026 20:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67147331A42;
	Wed,  7 Jan 2026 14:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pTDozbiw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184E4302140;
	Wed,  7 Jan 2026 14:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767795769; cv=none; b=aj44Vws3rl58wtKn1a0Zxu8Rs32/FGYK0rXGsHW/gU9k97RycxuOgzP1UAYIhHcDraG7Er5h9wIOTS8sovb9PqD99t5uWCH9qBHCw3gBrbq26VtQCDMX8p5K2htfJSHPAGK7qpsaqX4FqBQjMtvnnOX3+oRX/e0QMUq3CId2nwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767795769; c=relaxed/simple;
	bh=scgw9KKnio2Dqs8aqrCWQDiazUPc1M9tuCchtwuPKxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QO2k4TAESDRsZk7/V/pHEWvtSScQAmSG6OsErPoJIMUx+DTmso2OdMCEQk9d1V0DoT8e2SAuS7mAq7MDEUQ1Obr/IPXhpzf5qF750FZnaCr4UtKm8jtDnSrGDLOg+n2p6y27pauaIsJhRPUF6J7bN4FsDeseTNhgJE1vUHVjPzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pTDozbiw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C64A7C4CEF1;
	Wed,  7 Jan 2026 14:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767795768;
	bh=scgw9KKnio2Dqs8aqrCWQDiazUPc1M9tuCchtwuPKxs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pTDozbiwWTn7JBodqf5Xn1bOOBqTgf9JVgn9Kk9V7hPzYdOGqq0RHoDAajhvDp9+B
	 8Ow0s0jjZjCJXQrIe6AssJli3QubWUYGjFWdqRIsmcFlLAqF2r1afxJ8LzuG/OPvvF
	 NX0UeVyvZMxCILEr363geXmmM9wHD5CFhFfk8TOHmhagoMpB/H9vSIUPhVbq7RkBge
	 7BzgQ+Xofx1bn8Hhj5MzSZnHYJzHwKWTl6ISsaKVNttcAWGAQQKpQf+fOpEv4T9Gpf
	 lFm8rIQih68D5ja0l0rilgVr3nlNL2mth2jq7BYbNQCKKqilQIVqNGcsYv7lBocMm6
	 ffbUxBm3LxIfg==
Date: Wed, 7 Jan 2026 15:22:42 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Encrow Thorne <jyc0019@gmail.com>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, dlan@gentoo.org, guodong@riscstar.com, krzk+dt@kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	p.zabel@pengutronix.de, palmer@dabbelt.com, pjw@kernel.org, robh@kernel.org, 
	spacemit@lists.linux.dev, troy.mitchell@linux.spacemit.com, troymitchell988@gmail.com
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: add reset property
Message-ID: <aV5r8k4VKnXX_9Sw@zenone.zhora.eu>
References: <20251230-i2c-reset-v3-0-7500eb93b06e@gmail.com>
 <20251230150653.42097-1-jyc0019@gmail.com>
 <20251230150653.42097-3-jyc0019@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230150653.42097-3-jyc0019@gmail.com>

Hi Encrow,

On Tue, Dec 30, 2025 at 11:06:53PM +0800, Encrow Thorne wrote:
> Add resets property to K1 I2C node.
> ---
>  arch/riscv/boot/dts/spacemit/k1.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)

how is this patch formatted?

Andi

