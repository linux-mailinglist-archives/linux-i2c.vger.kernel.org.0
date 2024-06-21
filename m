Return-Path: <linux-i2c+bounces-4235-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B8A912C67
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 19:24:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02DB91C239FA
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 17:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 328931607B0;
	Fri, 21 Jun 2024 17:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="vshZ12n4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AAC15D1;
	Fri, 21 Jun 2024 17:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718990680; cv=none; b=B+V2wuoifhNIA/gAVrLqTQXMvW+hQWrZvjVHhM/9yQhI7AJTwesErzr2woD6wI96RN3mYFVLPfhAFZeM7epnrwfWtyRBdPljae49uLV7SCTF3gD5iEbhyxPUp0ADONmu4K1kdrLX55wHiDmwP1fFFALwIYPg77rMlLspdH6bUvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718990680; c=relaxed/simple;
	bh=BM3bDxKDGPmpPEKXjkEVhF9bTkX6yqKKTMfom9A1jjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RJ3uHFzzp9KQYru3eT1WBhmBcGjBCZTXThF2ClQIywPJguo613EZ5p3QYlY/MUWw/T70gW5c5+J1GhkyvslbsDgIwmnV8q/tOzoJDQKWmGF8tbJ1IMIpz+ObmjLzgUEeYM57RISIX7A2TbNchgrk+d5Z8SIB/lKiRQR34JA18HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=vshZ12n4; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 21E5B207FD;
	Fri, 21 Jun 2024 19:24:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1718990667;
	bh=Fl+iPeAvxTiHF6A13dl6jLHuoX82uG52hv+zvo4/1eA=; h=From:To:Subject;
	b=vshZ12n4/Ge4zRe7wHkrs8ulu3+HCMZnhuejxfioEELy3kOaKYhVd1E3OO1cuKVy/
	 +7EULopnvXbzKf7DLJT6ZHjxGYZlnXhYrZDNtJNsuC6z/G8mXoyUe4IcVSjIIuKEBl
	 Y3BgQtqc9VKaOjPxTLUq14HBlTkIT62iadTgxJ5cQE2j5VGmAxnXifsWbF4fFjbk4a
	 NLDuvaeVbNLHO2Pvjui8xu/2Uu4XzX6ovmVlXo3Usep0YdOGSc+yJfdT4iCLsvzZO7
	 M5MAHdZKK5yHyrN1hj0xgWrzGH+L+ixSAXWxY8go1SEJ7D3qXcZ4cSOWl23V+PSEiC
	 pQj+sI2coAChg==
Date: Fri, 21 Jun 2024 19:24:21 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, andi.shyti@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	jic23@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
	andriy.shevchenko@linux.intel.com, marcelo.schmitt@analog.com,
	gnstark@salutedevices.com, francesco.dolcini@toradex.com,
	wsa+renesas@sang-engineering.com, andrew@lunn.ch,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [RFC PATCH] i2c: imx: avoid rescheduling when waiting for bus
 not busy
Message-ID: <20240621172421.GA11258@francesco-nb>
References: <20240531142437.74831-1-eichest@gmail.com>
 <ZnWaxtfgmLk3SplP@eichest-laptop>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZnWaxtfgmLk3SplP@eichest-laptop>

Hello Stefan,

On Fri, Jun 21, 2024 at 05:22:46PM +0200, Stefan Eichenberger wrote:
> Hi Andi, Andrew, Wolfram, Oleksij,
> 
> After some internal discussion we still have some questions which are
> blocking us from solving the issue.
> 
> On Fri, May 31, 2024 at 04:24:37PM +0200, Stefan Eichenberger wrote:
> > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > 
> > On our i.MX8M Mini based module we have an ADS1015 I2C ADC connected to
> > the I2C bus. The ADS1015 I2C ADC will timeout after 25ms when the I2C
> > bus is idle. The imx i2c driver will call schedule when waiting for the
> > bus to become idle after switching to master mode. When the i2c
> > controller switches to master mode it pulls SCL and SDA low, if the
> > ADS1015 I2C ADC sees this for more than 25 ms without seeing SCL
> > clocking, it will timeout and ignore all signals until the next start
> > condition occurs (SCL and SDA low). This can occur when the system load
> > is high and schedule returns after more than 25 ms.
> > 
> > This rfc tries to solve the problem by using a udelay for the first 10
> > ms before calling schedule. This reduces the chance that we will
> > reschedule. However, it is still theoretically possible for the problem
> > to occur. To properly solve the problem, we would also need to disable
> > interrupts during the transfer.
> > 
> > After some internal discussion, we see three possible solutions:
> > 1. Use udelay as shown in this rfc and also disable the interrupts
> >    during the transfer. This would solve the problem but disable the
> >    interrupts. Also, we would have to re-enable the interrupts if the
> >    timeout is longer than 1ms (TBD).
> > 2. We use a retry mechanism in the ti-ads1015 driver. When we see a
> >    timeout, we try again.
> > 3. We use the suggested solution and accept that there is an edge case
> >    where the timeout can happen.
> > 
> > There may be a better way to do this, which is why this is an RFC.
> > 
> > Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > ---

...

> > On a multimaster bus system, the busy bus (I2C_I2SR[IBB]) must be
> > tested to determine whether the serial bus is free.
> We assume this means it is not necessary to test for IBB if we know we
> are in a single-master configuration.

To me this is a very interesting option. If we can confirm that this
busy-wait-loop is not required when we have a single master
configuration we can just solve the issue in a clean way.

And once the driver knows if it is multi-master mode or not we can also
get rid of the EAGAIN that does not make any sense with single-master.
There was an old discussion with some great contribution from Oleksij on
this topic.

Francesco


