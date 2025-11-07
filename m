Return-Path: <linux-i2c+bounces-14010-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D8FC3E21E
	for <lists+linux-i2c@lfdr.de>; Fri, 07 Nov 2025 02:30:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 286A14E6DD7
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Nov 2025 01:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF37229B8E0;
	Fri,  7 Nov 2025 01:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="YzkxDR/V"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59492E9ECE;
	Fri,  7 Nov 2025 01:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762479017; cv=none; b=VWKb/mNb5B6AJi1ZpdEXl0SfU5y3ioXTsf1HQgc8TDrA8IKbyWYLx81BkyRs63XMYuTrFr3NEpKnujVm5LmKQk0ApvegBZPtIZOmGeARajA2JhsXJVxPa1l9o+3GL9ebdXkig2+Hvb0y3vX5HYgtO/tlpZlZeLoEENobQb+I9j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762479017; c=relaxed/simple;
	bh=aogQJJfyjDXHY3kQzCAsj7IX0vVUjUq6HzwCBdUdhaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eg2WPsA1yCLqGe4USIxEdDGEiq0Wo2AxO80gpPucw2PE3mAAsBnldSeTob0okzdM24Wh0LpSnqxkjVsMpMdlPLmbmN5c6Un/Nzt0l5Jc3XGNdo56EZoNfEqDB7H/WHql5cqhDvbMbUwud4IhTZFRV96mW4C9l5JL41NEohTvSqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=YzkxDR/V; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1762479002;
	bh=35L+rrx9K1LdyqVcy5E43gyFYLFh2mo/NaELv+Hva9Y=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=YzkxDR/Vbl4FI0I933v84cPW3l30HkqrZiY3l9usp+KFBTKTGUBWZUokznkKQW87q
	 xp/cYcqboOQRUj21f085UwIdSTYOmjXtIP6zMNJkZgZA6d8+YmJOfv8npgtlt1hfD0
	 EH6KhUl4Eql9SIvUdDAk83uscGTzZqViV7nCDCN4=
X-QQ-mid: esmtpsz18t1762478998t36cfe8cb
X-QQ-Originating-IP: XYy2puoEOwMWms+dhGae90A2kQraig8IBA6V6nniF3E=
Received: from = ( [183.48.246.190])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 07 Nov 2025 09:29:56 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13916769930896062852
EX-QQ-RecipientCnt: 14
Date: Fri, 7 Nov 2025 09:29:56 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-i2c@vger.kernel.org,
	linux-rtc@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: (subset) [PATCH v2 1/4] mfd: simple-mfd-i2c: remove select I2C_K1
Message-ID: <71DB25E553BE0B04+aQ1LlKzeR-FkZA83@kernel.org>
References: <20251027-p1-kconfig-fix-v2-1-49688f30bae8@linux.spacemit.com>
 <176244506110.1925720.10807118665958896958.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <176244506110.1925720.10807118665958896958.b4-ty@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Nwz8Cs33/LprE0VPwvJ0w0lsXff3KaW0gOSYF6lYac9qw9KDBBL41uU+
	Q9Sqd8ET3hzZuOV7LqcYIBjU/eDsdBWb9V0sF8iL0xHua3JHD0hosJ1BRfYTt7M1mX1pvD4
	GJBKXmegDaXt/TjoZbTW7Jupg15sgjnYRmaB4oXgABa+G52kX/WKmI8t+5P2l6uD6u0dPNf
	TwV/8JJFYj45dZRFD6PRkCwgBcrqCMTIowUPC1vcfKK1p/jmS3YmWjlJMWJWD+LTJc2Gg1n
	y6sMzoQVIuzxgwTKwPbCk/tV6Y2kjUaQZ5WCVQtzhxtSuVy0bKkUqcH0J3LDkzqzvtFZedL
	pNq/JBOMlrcXKLHX6oN6gxN6lkMtMJ4pYJxLbk76cHkdEnDnWV9rHr7gh972jRlMSwXRzmm
	rymsMfG62Uh/2zHLf+h3EuTqFoUoBpSWBVOS5PxM8ECCbE4C26EGsLwm8i/n/tB/v4Ix7og
	yh+o8F7Xmbut8QTtI2FZLI9yOHAttj7y9dVhVW001aW4cDL/4OA08sCL0AFr28o4Zgi7PiA
	j+HkECMHmAa39DJJFoRkro/TfRboJOMmYvv9rYXJ9XlKQYlNvya+z3YHtkxDjxdp+4+GTS7
	RYQXi0alcZW1JK65AjJJ9SIbKCxR5a6iystl5thBED+tM38mvxS5PhV5KtwAYqb/kdjOSFE
	njk7d9eQ0IXhAqk3zPYa7GZOuai3C7rfbU8xMbv5MrwWKeOtAzgXDvae4t0qKM3P79Rl1I/
	mcUFqmEqTIzj/S8n797UsG0JTlagTB+uouQN2o4AAoPcv4GgMXD+UDJVBJtDY1tXTjsLCSg
	FF734xQOhnfvI4vkbx7LmKe+X4GryWAd6wFBp50ZBEofP66z1yUhsE/XL7obpR5Q4i46kaN
	JME9VyjrvLXYhyhTXjzXx+hPs4G1RO9wYlgWTfPTfGcvJYs/4VvpjiOMOJ1W0JroZGugLXB
	uI2vXo2z9lze9FAlJF7dBX6mVr3Ygbwxlpolw6VOdjLU8+LKsqXVxHeyS59BLa1gDbLy4UA
	5+M+F63tZh35KhNN1E+gOhDhxwAfgOuDmrTqONKTUB2FvxwIiZ1KNtCDI/LhLedZlgA8/yO
	Ccr2n1ZLvE0
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

On Thu, Nov 06, 2025 at 04:04:21PM +0000, Lee Jones wrote:
> On Mon, 27 Oct 2025 13:48:05 +0800, Troy Mitchell wrote:
> > select will force a symbol to a specific value without considering
> > its dependencies. As a result, the i2c-k1 driver will fail to build
> > when OF or COMMON_CLK are disabled.
> > 
> > The reason for removing I2C_K1 instead of adding a depends on condition
> > is to keep the possibility for other SoCs to use this PMIC.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/4] mfd: simple-mfd-i2c: remove select I2C_K1
>       commit: ecf6bc474ae97c404e2125b413eb0ef3627b03c5
Hi Lee,

I think you didn't notice this reply [1]
(Maybe because he was replying to the cover letter).

As Aurelien mentioned, the current shutdown/reboot (and possibly the regulator
as well) intends to use the `default MFD_SPACEMIT_P1`.
So if there’s no `default m if ARCH_SPACEMIT`,
the default value in subdevices may not make much sense.

But don’t worry — to make things easier for you, I’ll send an additional
patch based on your branch (in this series).

How does that sound?

Link: https://lore.kernel.org/all/aP9IVckJT-k2_O4K@aurel32.net/ [1]
> 
> --
> Lee Jones [李琼斯]
> 
> 

