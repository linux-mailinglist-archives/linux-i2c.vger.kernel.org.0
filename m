Return-Path: <linux-i2c+bounces-12442-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9651BB37EE4
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Aug 2025 11:34:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52E8A460A91
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Aug 2025 09:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46B9034166B;
	Wed, 27 Aug 2025 09:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="HtLJXVpG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA1D3375C7;
	Wed, 27 Aug 2025 09:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756287271; cv=none; b=g47SudZAu7h9rreuHQucL7KrqZwkSf0e9zBlrJjrExzcDE7tP6M3qNYc86hBUb+DYytjUGuW9jzY+r+BQleyjHIOSZO/GvsBBXHMJtE8oS8E+Pt7gFEw8X/zgevTcmgJpzPUtMRc3NBEXV1HDVvB6c12Swd5okSXDVcbknlD1Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756287271; c=relaxed/simple;
	bh=j1EBngqqvJ1zJhvz8o6ntw0CQbu9SAuvFckH3ww39WI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sMBFqx9TtPbf+YRb8vgNjk+fhmKdQa5KxHVtfr1YzdXtl70budZf+Ehw1vXwTR3B3ORE7gd1R14gzJmeB7X4MJ/fJ4Roy4C28xVpGNAe/YNlbLYh66aBDx6osMG6h5oQ0+e8NbFDfjtjzsGYg9lXRDaV996kPmDnRQs9DqXcmW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=HtLJXVpG; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1756287130;
	bh=6eeMVxwkfOT98px7m/TPeZ9Mrao8kB0xahBdzHlt5JQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=HtLJXVpG4TrcZO9ggBhvYTCVTvCxJ6AjCNqaUTFN+wSBSI358rUSfVNxdEtzaKTyW
	 e2tOQ3Thfxx+VaonXUS9TlihICGwhVPosJ12HaYsj+qa6gKx6XJv13NjH5iOzAiKB+
	 AWjLHc57wTlLeq0vZFeyF2wSAVReSBJ49oAORpGI=
X-QQ-mid: esmtpgz11t1756287123te9b25669
X-QQ-Originating-IP: YulJEb3+/X1m8HZW1gm5HQdoovwYx9pwQ5ltU3NREuQ=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 27 Aug 2025 17:32:02 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4606825760503529289
EX-QQ-RecipientCnt: 9
Date: Wed, 27 Aug 2025 17:32:02 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH 3/6] i2c: spacemit: disable SDA glitch fix to avoid
 restart delay
Message-ID: <DCC64908985C6746+aK7QkmNHa_QMRfgh@LT-Guozexi>
References: <20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com>
 <20250827-k1-i2c-atomic-v1-3-e59bea02d680@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827-k1-i2c-atomic-v1-3-e59bea02d680@linux.spacemit.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: OSUW9vQLVhiZfERrVpjaLNcVCB83QdYWKIeN0TNgaFnjhSMj2TXYNb+x
	rWZRWnVpQfJaQLaOJXtIvkRbyLto8AaOX6NeRh4NaVxe5wI6Ff87s+oWMgGjUOBZDMD+x4u
	QpUhtqYzpSs4jVDse4ubDru+9seIlXoY2rSYoxHvo/MNeZVZ8GPiQEkzZBLKu7wdsXShx+d
	rJroyuQ5jJ6nv5tBflFAvSLAGuZ9nAp9c/gHAe+3lUtEu3suCBbD3MEc1HfYdm4uGKvrlfi
	IBh+U9B7cVhD20rlNlx9MuNHv6ZUEhE19Fzm5GwPsWoT3HyQop6x3eh2ct/nMr+mLoNoJpW
	2nhGCFmlyV7IjEEzCzUgVIIdh8SqQlzpx/OawT+flYX+5TLMHi0j6dY/MFGdlbckXQaXqIN
	8xeGow/PzLC/OW1NlYP5FA7vsvF52QDCaEuYePwgXGM/tzhJwRz0ILYeooFW9F4NvLHyTa4
	wZLQRW2l0ja8tmUt2ymXSGLBsDCadp7EZB0uIFV5jDZWW1Y09BvJDdW+f2+KN+7VpudNDDy
	8a43vdK89tq0HH3QvXXZnyFaxA1drfYbvNfuGO/Hn8l4aG6fGtPFWaa3gGmuIEkWyxNHkGF
	o/uwO+vm5UspXY13MWSZm+ndk2Vu4OSEs2TMfr2g7yGEadQ/IAg4GY6pR9o+o8AZyh5+IOH
	VG5dYxoRpg6f83HxD1vbOkUAUtVVFOY+308V9QWtdro5JPNkhGQlfjSRoIdYm6Er0+OUwMg
	s4yg5OzNJfJZKc04FLkpbvbbYvDl0v42STC/x7RDwv7LUUWsfI6B5czaPW6tJVuLD0k1rkv
	tAxZ7gki6NwS8V3GYMSEmyPbPwpuVsMVwCWf4HQTpx9hRZ5eUr3oJzVTvayTVbUcYGUE4m2
	KVYtWWPqszjTE9UYzj/wGHHRJZnE/iNYtLhv4HmWWl8krUq6mBehs23VQ3o4eDOFqKHPiAT
	zZ71pk4OqABtijsROLYdeyVIuT/ShYYvCul70TS7VIoQXYZX5MrIzsGTE8wvoidY0BOSWqs
	wasneLhp9ZhTMDkwOkTx6Dy1Np+Xoq/W2W9VHdjAyKxV4LBldT5b6PrKQ0Ae5tEe7tPuOuX
	A==
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0

On Wed, Aug 27, 2025 at 03:39:10PM +0800, Troy Mitchell wrote:
> The K1 I2C controller has an SDA glitch fix that introduces a small
> delay on restart signals. While this feature can suppress glitches
> on SDA when SCL = 0, it also delays the restart signal, which may
> cause unexpected behavior in some transfers.
> 
> The glitch itself does not affect normal I2C operation, because
> the I2C specification allows SDA to change while SCL is low.
> 
> To ensure correct transmission for every message, we disable the
> SDA glitch fix by setting the RCR.SDA_GLITCH_NOFIX bit during
> initialization.
> 
> This guarantees that restarts are issued promptly without
> unintended delays.
These are the restart waveforms before [1] and after [2] disabling the fix.

Link:
https://psce.pw/839rzq [1]
https://psce.pw/839s4q [2]

---
And I'll put above information into the commit message in the next version.

                 - Troy
> 
> Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  drivers/i2c/busses/i2c-k1.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index d342752030d077953adf84a2886211de96e843c4..c1656b78f1681729ccc2ebca6e290259d14889d9 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -14,6 +14,7 @@
>  #define SPACEMIT_ICR		 0x0		/* Control register */
>  #define SPACEMIT_ISR		 0x4		/* Status register */
>  #define SPACEMIT_IDBR		 0xc		/* Data buffer register */
> +#define SPACEMIT_IRCR		 0x18		/* Reset cycle counter */
>  #define SPACEMIT_IBMR		 0x1c		/* Bus monitor register */
>  
>  /* SPACEMIT_ICR register fields */
> @@ -76,6 +77,8 @@
>  					SPACEMIT_SR_GCAD | SPACEMIT_SR_IRF | SPACEMIT_SR_ITE | \
>  					SPACEMIT_SR_ALD)
>  
> +#define SPACEMIT_RCR_SDA_GLITCH_NOFIX		BIT(7)		/* bypass the SDA glitch fix */
> +
>  /* SPACEMIT_IBMR register fields */
>  #define SPACEMIT_BMR_SDA         BIT(0)		/* SDA line level */
>  #define SPACEMIT_BMR_SCL         BIT(1)		/* SCL line level */
> @@ -237,6 +240,14 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
>  	val |= SPACEMIT_CR_MSDE | SPACEMIT_CR_MSDIE;
>  
>  	writel(val, i2c->base + SPACEMIT_ICR);
> +
> +	/*
> +	 * The glitch fix in the K1 I2C controller introduces a delay
> +	 * on restart signals, so we disable the fix here.
> +	 */
> +	val = readl(i2c->base + SPACEMIT_IRCR);
> +	val |= SPACEMIT_RCR_SDA_GLITCH_NOFIX;
> +	writel(val, i2c->base + SPACEMIT_IRCR);
>  }
>  
>  static inline void
> 
> -- 
> 2.50.1
> 

