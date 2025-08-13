Return-Path: <linux-i2c+bounces-12273-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C94B24D53
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 17:28:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FE613A539D
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 15:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0835C22FE0F;
	Wed, 13 Aug 2025 15:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="ueO7nrZ2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FCD22DA1F;
	Wed, 13 Aug 2025 15:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755098602; cv=none; b=mpZdpn6guj/olDUO05KvPA3r7r5kGVAs/nJYggNUtc48Dh9P/1MTDRhi9BAAqDwKaj8N8xjD43/KUN2RdJM5saActr0EJVK5XQfcc5gwWVfv/l5aHZZsYv8gNz0kqCYSyvnqgyIdoVYHjaqi5NdehiTVZg7+pyBMf+uNwmgEEIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755098602; c=relaxed/simple;
	bh=1W/jBAvKti3QVwNodsrbkeO+Jug6BJyCRaos5hCVLKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QPmrPpjXG14KerhKTZcWk3PNDYusQNXZiev2vQtre70AH3a1jdJJ5J1iQj+GRSM1336l9+jY77nOOKIV9xRicHjQWbGvBIHDY5P0ZvrUcdvA0KGrlzvkdNR/U3zM65HJ3Ako3C8S9p/M1sRECjefCkoa6SWrZeQWRs985RU9zV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=ueO7nrZ2; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JBcqfJDDEAhoW2q4sP2fhRolkVFvahCE6bvX49j/3VE=; b=ueO7nrZ228+3Tvd9WzNQKL1z0D
	QzQ0zAtn5PQKi4jxkXd8wNQyy7s6D9P4MVsy92WbkTEy2tISUR4BPodvO9rLPM58DZiDSMxuSL192
	VIXIx0iAUFheAdZ5JRH2jlygHMd/W8/kqzebo7ziTsphlx+V6TGgU0IHlL8bvwkB3PI5uzM8wB6Ar
	HY9Rw+Z7i+Jj3qSB8lhBnhQlrYugLHzVC6y/pGOD1CIa3bI4C524tXX/zMPzPOb6l6Uzx9uWr4o0/
	HoBmm9Y7KTl1gAzUSNFgG7McMmQiVAG020uIdhyr1q2Voy/aNUnsvHDEQ4W05X8lAZ7h1n1szOUBa
	YkMvxD0w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46702)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1umDJk-0006vX-1U;
	Wed, 13 Aug 2025 16:23:08 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1umDJg-0005rb-1m;
	Wed, 13 Aug 2025 16:23:04 +0100
Date: Wed, 13 Aug 2025 16:23:04 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Gabor Juhos <j4g8y7@gmail.com>, Wolfram Sang <wsa@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Hanna Hawa <hhhawa@amazon.com>,
	Robert Marko <robert.marko@sartura.hr>,
	Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Imre Kaloz <kaloz@openwrt.org>, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/3] i2c: add init_recovery() callback
Message-ID: <aJyt2I1w6VYo1PPD@shell.armlinux.org.uk>
References: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
 <20250811-i2c-pxa-fix-i2c-communication-v2-1-ca42ea818dc9@gmail.com>
 <aJpP5eABTYnQRV82@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJpP5eABTYnQRV82@smile.fi.intel.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, Aug 11, 2025 at 11:17:41PM +0300, Andy Shevchenko wrote:
> On Mon, Aug 11, 2025 at 09:49:55PM +0200, Gabor Juhos wrote:
> > Add a new init_recovery() callback to struct 'i2c_bus_recovery_info'
> > and modify the i2c_init_recovery() function to call that if specified
> > instead of the generic i2c_gpio_init_recovery() function.
> > 
> > This allows controller drivers to skip calling the generic code by
> > implementing a dummy callback function, or alternatively to run a
> > fine tuned custom implementation.
> > 
> > This is needed for the 'i2c-pxa' driver in order to be able to fix
> > a long standing bug for which the fix will be implemented in a
> 
> > followup patch.
> 
> "...next change."
> 
> ...
> 
> The first traditional question is why the generic recovery is not working.

I opposed the conversion of my recovery code to generic recovery when
it was first mooted for this driver, and was over-ruled. Lo and behold,
as I predicted, generic recovery fails with i2c-pxa. I now don't
remember the details, but there has been a regression reported...

Given that I was over-ruled, I am not minded to go back and try and
find either the previous discussion (google can be exceedingly
difficult now to find such history) nor to try and work it out again
(I've other things, including meetings today.)

Nevertheless, all I now remember is that generic recovery breaks
i2c-pxa, whereas my recovery works.

If I had to guess, I suspect it's something to do with how careful I
was to ensure a glitchless transition between i2c mode and GPIO mode
on the pinmux, and the generic recovery probably isn't as careful, but
I could be wrong there.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

