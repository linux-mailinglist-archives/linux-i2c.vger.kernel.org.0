Return-Path: <linux-i2c+bounces-4781-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2116592AC83
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 01:19:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41E5B1C211F6
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 23:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DDA6152783;
	Mon,  8 Jul 2024 23:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mJ2oLztK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248CD15217A;
	Mon,  8 Jul 2024 23:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720480794; cv=none; b=HoX89+j42nRVC5t7nrZWU+mH8nAJK+ldBES3KCXiSK6P3ETPMjHsCwM19yeYuFM8+jR+pxTpEpS9VzrMi45q3W0PDHAo5xonq1bVC78xAxVOD0pTCwkk2K6z85/o9teM1KEHxCsSUR+zDN6vKnnj3NaE+UkC0Zk9/JMN+ZivPWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720480794; c=relaxed/simple;
	bh=HR+H74d963O3GQH99PkWyBB+T2lOvOhnMuPhiokLJGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bCdcjUwLIj6Zsf2AaFgn6C7TNkubs5MsjQamgYD5G1axJqaZjB6DOWb0Bp/DC0eyyypVsYt1AGWkS344yetj1o98tVWJFUWJGekGCUTV/2H8L/TjfPxLFCdLmOTMhs3uY4r0CxnyFPrL4IafW5iW+cIz9wANPURBC1bQSKxRihM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mJ2oLztK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09E28C116B1;
	Mon,  8 Jul 2024 23:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720480793;
	bh=HR+H74d963O3GQH99PkWyBB+T2lOvOhnMuPhiokLJGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mJ2oLztKPqrBrBRX5w6uOaDBWZOQUNeUzwrNGcxGmZwhTSjUWFNcPkLIXIsDlJanq
	 WwhkpIbDnvSG90IwwvjDc1sx7991cLANDyF08A51Kmmz54qS+dFonDr8Vhmrl9Cx0S
	 lxy3uupFMLCKUX/F6wKdS5Z0dTCyQ27XFuxwWrkzgODN0n/4OiJCq/GuWz9xCJqVJP
	 g7sIjGvcynfeOQWGcancUhAFq2VPedjHPd9R9qS4rTLVUbuwoRM9ex5zspwiZmgyqr
	 uuIOGjfXmjA1dEm/O1TtWXpgV0GxjV9wOdNiaOjLqIq4Ej/feSiUVA4hdenvRo9iyW
	 gc0xHyiPlWbow==
Date: Tue, 9 Jul 2024 01:19:49 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Dirk Behme <dirk.behme@de.bosch.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] i2c: rcar: bring hardware to known state when
 probing
Message-ID: <d6i3ojzbthieq52teugiuxdxjp2la6cjtsleq4esbfgup6cgqf@obfadtyrdpuh>
References: <20240707082848.5424-1-wsa+renesas@sang-engineering.com>
 <20240707082848.5424-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240707082848.5424-2-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Sun, Jul 07, 2024 at 10:28:46AM GMT, Wolfram Sang wrote:
> When probing, the hardware is not brought into a known state. This may
> be a problem when a hypervisor restarts Linux without resetting the
> hardware, leaving an old state running. Make sure the hardware gets
> initialized, especially interrupts should be cleared and disabled.
> 
> Reported-by: Dirk Behme <dirk.behme@de.bosch.com>
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Closes: https://lore.kernel.org/r/20240702045535.2000393-1-dirk.behme@de.bosch.com
> Fixes: 6ccbe607132b ("i2c: add Renesas R-Car I2C driver")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Should go to for-current.

merged in i2c/i2c-host-fixes.

Thanks,
Andi

