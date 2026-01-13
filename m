Return-Path: <linux-i2c+bounces-15108-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2494ED1972D
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 15:28:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DEE373051C6A
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 14:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE57D2857CF;
	Tue, 13 Jan 2026 14:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="pMDe0NOb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2872836A0;
	Tue, 13 Jan 2026 14:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768314070; cv=none; b=ft1EwJkeylKp7UPPEUGzeAEzwBM5poEN6Oym3l7Bkc5oBoVsZP88pTot2ZfvEa3HVt9eiFQXKnhYIM9kBtNGUeD96v9JWeZfyUeFxuJ0JiUvgPuQzKeMf5gTg/JGVSOe/miT23CXmTBU6eChGRq2o5YKl8wxOAvnM8h1loUVFSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768314070; c=relaxed/simple;
	bh=G0l9qMuIDirnPDxR6EYbfRr9JdeQONowvT9XD0daV3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SUB8sOEwq8YzF0UI22Zl/3f878IqG0CzTe4VE00t9atu96YDc6uHK3HygKO6zhbZGFrXS7nem1HCHJ9TcgwQciNWcZuq12XA8GbEdEd97KwYFHZ1AIogvIoF4Qw3I+TBK29gdUoWUrCH8jw0vbvqKFigC4HkMduDSdR+JPImNyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=pMDe0NOb; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=jAPTBZR9KYlsrrKP+nxtzo7/fS4b9b4fyYtkSP9DoU8=; b=pMDe0NObaWM/jOhwzOe6bxxqhS
	+bMxfEWXVP3QHQ6bdWT/pFdNiZBGqteDl5vMVyuLx+B3F97ptwRoZThazYekifB5uhX+x7VFWqMqi
	pfKvVA0skLNRp4dkokeToYIdxuBAy/JXoukmcSMcyb7S8vLpbVB1esm9fUie6o9T7afQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vffGY-002dmN-CN; Tue, 13 Jan 2026 15:21:02 +0100
Date: Tue, 13 Jan 2026 15:21:02 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
	Peter Korsgaard <peter@korsgaard.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Subject: Re: [PATCH v2 1/2] i2c: ocores: increase poll timeout to total
 transfer timeout
Message-ID: <f428f437-80ec-4587-9f6a-7508a8153e79@lunn.ch>
References: <51a72ceca0154d7be85c3cc67722e7dd0b364a2e.1760000254.git.matthias.schiffer@ew.tq-group.com>
 <aWZCT0JQfvX1LAMC@ninjato>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWZCT0JQfvX1LAMC@ninjato>

On Tue, Jan 13, 2026 at 02:02:07PM +0100, Wolfram Sang wrote:
> 
> > The behavior in the regular case is unchanged, spinning for up to 1ms,
> > but the open-coded poll loop is replaced with read_poll_timeout_atomic()
> > as suggested by Andrew Lunn.
> 
> Hmm, spinning 1ms is still a lot. Can't we just use read_poll_timeout()
> for the whole timeout? I can't see that it will cause a regression. But
> please correct me if I am wrong.

I've forgotten the context, but

/**
 * ocores_poll_wait() - Wait until is possible to process some data
 * @i2c: ocores I2C device instance
 *
 * Used when the device is in polling mode (interrupts disabled).

If interrupts are disabled, you cannot use read_poll_timeout().  You
have to use read_poll_timeout_atomic(). And that spins anyway.

     Andrew

