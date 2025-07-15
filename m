Return-Path: <linux-i2c+bounces-11949-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4C4B068E0
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Jul 2025 23:58:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7420D1AA763B
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Jul 2025 21:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A2152C032E;
	Tue, 15 Jul 2025 21:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hRKHUwWs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C991C54A9;
	Tue, 15 Jul 2025 21:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752616734; cv=none; b=JiAlQwqOlGkuoK3X2wvcJ5Vtj1eDeHei6Hypm2/eYrayxO1U9SeiquszW21f0a76n/zHqPwCZjWGx29viOtaEbhx5+mP6BuqKfhFrBn8pCGpn0rE27mcgS0bW8LQl3WI2S+hJ5GE4/Ky9J97pmA3U1cKad1yUY6X0ku73iRJZdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752616734; c=relaxed/simple;
	bh=Al5kTu9Lb20vAaMzt40O4A44pcAsNVuFu/MblkMyb8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=so1Sj6Mx7P2wjW5f6hj9TNR+fp4/vrDWjKl8qmFNkXVFBagSZ46hip6dkZ1MWZdUg1rSUlTbwXmAnQG7kK12mSlunvOCvjQTysPPrMiFKtXsRtdVV1W6lcpE4zVtNyycU2JXTYxplAz4ndhlVvGwZ3hPeDRy31TqWV7pFJdE+8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hRKHUwWs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0828BC4CEE3;
	Tue, 15 Jul 2025 21:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752616733;
	bh=Al5kTu9Lb20vAaMzt40O4A44pcAsNVuFu/MblkMyb8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hRKHUwWsDZfT1cr9LLqWHAGI8/kk6IWN2osmRUqW1jZPUziDpH6lBVTtVtRKZoBes
	 GoTfuSUHSJzfuwN9MrcleKx6N2DdNTtB43kXBuSFVRxLDJjWW8C90XeztmIJBnilBJ
	 ev1ZBgF4PU25HgyeuK4CwqRx57hZ9khwdOsX0DObxC/KEvrbvTasZsrbhTVW5FIWBd
	 w0Sx9E0kpK02iRA4D9h+74ut6KuaClygsi0kZ0+x0dscDAdBhp6YeotyFdf+tyYmeM
	 +jgo31hXtR5IiQzfnwR9xJL/uCP3TC1kJRRGfAYdtnMrxlFrU2i0l7/OfVOhgcA5Sv
	 VPysWZuFfb+7A==
Date: Tue, 15 Jul 2025 23:58:49 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Alex Guo <alexguo1023@gmail.com>, conor.dooley@microchip.com, 
	daire.mcnamara@microchip.com, linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: busses: Fix out-of-bounds bug in
 mchp_corei2c_smbus_xfer
Message-ID: <6r6vbagr23kf5qyfmnmy7hkdljvu73sgakalqmbmdodf5rf4e2@fld6reoqfz5p>
References: <20250615234919.525431-1-alexguo1023@gmail.com>
 <aGBMDFLH7aJGFyQ2@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGBMDFLH7aJGFyQ2@shikoro>

Hi Wolfram,

On Sat, Jun 28, 2025 at 10:09:48PM +0200, Wolfram Sang wrote:
> On Sun, Jun 15, 2025 at 07:49:19PM -0400, Alex Guo wrote:
> > The data->block[0] variable comes from user. Without proper check,
> > the variable may be very large to cause an out-of-bounds bug.
> 
> Okay, okay, instead of adding these limits to all these drivers, let me
> start adding SMBus3 support to the kernel which allows for bigger block
> sizes. I probably won't have time to export this to user space yet, but
> let's at least make sure the kernel, and thus the drivers, won't suffer
> from buffer overflows anymore.

in the meantime, what should i do with all these patches? They
are not wrong and I agree that we need to work on the i2c core.
Besides having something like this might help all those drivers
using i2c by removing the need for their own specific
i2c_read/write methods.

Some times ago I started working on this and I have it still
laying around in one of my branches. If you haven'd done much
progress, i can bring it to life.

Andi

