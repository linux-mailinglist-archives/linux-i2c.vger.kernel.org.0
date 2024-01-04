Return-Path: <linux-i2c+bounces-1119-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D361824586
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jan 2024 16:56:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FF071C2109B
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jan 2024 15:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAB9824A02;
	Thu,  4 Jan 2024 15:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VYm7NWQH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8FD249F9;
	Thu,  4 Jan 2024 15:56:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47D65C433C7;
	Thu,  4 Jan 2024 15:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1704383791;
	bh=tQ2xGVztCOGERqBGQC3sZSgIZHy0WBG63Eyy/oqqK5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VYm7NWQHeSJTLlYxDfvefYiyhsrSrrguHmZ7Ex8ulp4rxKmhF0DqPijDwGz81qVQf
	 f4iW4/kO00i1xHwbs0tPV8RT7yeOPPkWN9UJ+9M0yt7iJJs1oW4n8vu5cbQI4tm9Yr
	 GxAvQ1cKZrq6lxpI8yeyo7iYMlrK4/ogZ3EEnzeM=
Date: Thu, 4 Jan 2024 16:56:24 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: peter.griffin@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
	sboyd@kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org,
	alim.akhtar@samsung.com, jirislaby@kernel.org,
	s.nawrocki@samsung.com, tomasz.figa@gmail.com,
	cw00.choi@samsung.com, arnd@arndb.de, semen.protsenko@linaro.org,
	andre.draszik@linaro.org, saravanak@google.com,
	willmcvicker@google.com, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
	kernel-team@android.com
Subject: Re: [PATCH v2 04/12] tty: serial: samsung: prepare for different IO
 types
Message-ID: <2024010450-heritage-variety-d72d@gregkh>
References: <20231228125805.661725-1-tudor.ambarus@linaro.org>
 <20231228125805.661725-5-tudor.ambarus@linaro.org>
 <2024010432-taco-moneyless-53e2@gregkh>
 <a3a9df6a-4270-4076-9e9b-ce2fc7284d54@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3a9df6a-4270-4076-9e9b-ce2fc7284d54@linaro.org>

On Thu, Jan 04, 2024 at 03:41:28PM +0000, Tudor Ambarus wrote:
> 
> 
> On 1/4/24 15:32, Greg KH wrote:
> > On Thu, Dec 28, 2023 at 12:57:57PM +0000, Tudor Ambarus wrote:
> >> GS101's Connectivity Peripheral blocks (peric0/1 blocks) which
> >> include the I3C and USI (I2C, SPI, UART) only allow 32-bit
> >> register accesses. If using 8-bit register accesses, a SError
> >> Interrupt is raised causing the system unusable.
> >>
> >> Instead of specifying the reg-io-width = 4 everywhere, for each node,
> >> the requirement should be deduced from the compatible.
> >>
> >> Prepare the samsung tty driver to allow IO types different than
> >> UPIO_MEM. ``struct uart_port::iotype`` is an unsigned char where all
> >> its 8 bits are exposed to uapi. We can't make NULL checks on it to
> >> verify if it's set, thus always set it from the driver's data.
> >>
> >> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> >> ---
> >> v2: new patch
> >>
> >>  drivers/tty/serial/samsung_tty.c | 9 ++++++++-
> >>  1 file changed, 8 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
> >> index 66bd6c090ace..97ce4b2424af 100644
> >> --- a/drivers/tty/serial/samsung_tty.c
> >> +++ b/drivers/tty/serial/samsung_tty.c
> >> @@ -72,6 +72,7 @@ struct s3c24xx_uart_info {
> >>  	const char		*name;
> >>  	enum s3c24xx_port_type	type;
> >>  	unsigned int		port_type;
> >> +	unsigned char		iotype;
> >>  	unsigned int		fifosize;
> >>  	unsigned long		rx_fifomask;
> >>  	unsigned long		rx_fifoshift;
> > 
> > Is there a reason you are trying to add unused memory spaces to this
> > structure for no valid reason?  I don't think you could have picked a
> > more incorrect place in there to add this :)
> > 
> > Please fix.
> > 
> 
> Will put it after "const char *name".

If you do, spend some time with the tool, pahole, and see if that's
really the best place for it or not.  Might be, might not be, but you
should verify it please.

thanks,

greg k-h

