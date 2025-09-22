Return-Path: <linux-i2c+bounces-13097-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CFBB934A4
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 22:55:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6D6B19080C2
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 20:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 854412C21EA;
	Mon, 22 Sep 2025 20:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="W92NzEjg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from hall.aurel32.net (hall.aurel32.net [195.154.113.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C7527B34A;
	Mon, 22 Sep 2025 20:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.113.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758574552; cv=none; b=t21FxlSHp+dBr4JXcnFPyyfXju1zL+BJsVBKJNdQY+a1mDCn9EUWHlpwf9xgfcud9WY6miNHJFT8EB1goPy50SA1yYSieBkWYG4TR6s8V85wKY1BQIzQREOe1jI2nIRIllkw6D46vJLWFq0xXFvczNBRw5PfnHS2TsRoJUN6NRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758574552; c=relaxed/simple;
	bh=mTgFQg6dzMvuZBQYKUL5ugfwTPau97m8tBHkehv2j3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lp215yxMIlkUZUntpw+joGp6tU/ONI+wDHjYhr2+DVd/rlhRl+3E3rIf4O96TVdYo8iqhE7cUOlpi1M/3kSfABmdcP9mYF9kNyoEbyqGU/nbw/W5iT6xJPlL7b498AaLCpj8+4alcS5skPk3938qeXxa7Y5ONUFPteYBmhLpRWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=W92NzEjg; arc=none smtp.client-ip=195.154.113.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=cRFwK1pxi/SZ8dEX9JP4LGjTwxzF/2UPH05MAWDWiCM=; b=W92NzEjgy5lxNqfQw08KL+V9t6
	m0CT/hubY0h540cMF8PTPLCcb4GYisVHRJo1d2FOPObc/RofuOUHYNjrgslYCkjpgE5T6Ts5RZcBA
	pxG130bkqm85LG3NAvqP1PWU7WQxyyKDPOuLh1eliDwGXS3Q1hCnFuqQTH2Gf3ub7p1DAJ1przJ9Z
	ofpmlwh+5CYZHvi079Y6rXGwuA50nINfXAe/bd3HWlqMCxIzXfdF+x/JzZeswynlJq5RiiPaISjvV
	PWoszQ5xYuYbuGl1OFAS7FsWdaDPffKZ5bT86ER6Bevtsnc0jast+3EGCcR/KvWOxeQ4q14r/gw2L
	ilZZLoqQ==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1v0nZO-00AlR7-2f;
	Mon, 22 Sep 2025 22:55:34 +0200
Date: Mon, 22 Sep 2025 22:55:33 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 0/6] i2c: spacemit: fix and introduce pio
Message-ID: <aNG3xXKEYvhGfKjb@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com>
User-Agent: Mutt/2.2.13 (2024-03-09)

Hi,

On 2025-08-27 15:39, Troy Mitchell wrote:
> Previously, there were a few latent issues in the I2C driver.
> 
> These did not manifest under interrupt mode, but they were
> still present and could be triggered when running in PIO mode.
> 
> This series addresses those issues and adds support for PIO
> mode transfers.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Thanks for this series. Based on it and with the few fixes suggested in 
the individual patches, I have been able to write a small power reset 
driver for the P1 chip, supporting reset and shutdown. I'll post it on 
the list in the next days.

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

