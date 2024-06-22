Return-Path: <linux-i2c+bounces-4237-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBE4913207
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 07:03:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B075B28432D
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 05:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C95761494BB;
	Sat, 22 Jun 2024 05:03:17 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD3D148FFB
	for <linux-i2c@vger.kernel.org>; Sat, 22 Jun 2024 05:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719032597; cv=none; b=uMyZYvAtBn8qjxvr/+OpY8PE07wh6sPu3VO3LuP3o9j1qJFCdpxCR9J+cJ5Z+jI62nN3l3QzJ/xBrxokRcYt3ZzV2u0y2a4DGGD0SFHXNhTMxT6XM2FDdxjKWbSbGbyrTgIQNyDEc3nCVeurYOW0G1B1nDKMpUpzyX8NAbh15tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719032597; c=relaxed/simple;
	bh=do5h1WKiNksOYkvQ6KlfAy35QQi1Wy/PYFAHpjHrsHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IZr8FFLc9GktzbbdKLuEfY9K64LNliL3SbhZtwxtsQ6mk14ovvssFIgXM8pXdk6jI/bWAFs2HuXXNOVlUzpiCalKyIailVqaIP93vb0EdArcxXYuWDxEUpD/L4tZqFYX7ZgmeTJgUxRz9he9VqHPFZ43qk5g2mpRT5rrPFuuJTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1sKste-0000m3-97; Sat, 22 Jun 2024 07:02:42 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ore@pengutronix.de>)
	id 1sKstb-0046OU-I3; Sat, 22 Jun 2024 07:02:39 +0200
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1sKstb-008EPD-1S;
	Sat, 22 Jun 2024 07:02:39 +0200
Date: Sat, 22 Jun 2024 07:02:39 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: kernel@pengutronix.de, andi.shyti@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com, jic23@kernel.org,
	lars@metafoo.de, nuno.sa@analog.com,
	andriy.shevchenko@linux.intel.com, marcelo.schmitt@analog.com,
	gnstark@salutedevices.com, francesco.dolcini@toradex.com,
	wsa+renesas@sang-engineering.com, andrew@lunn.ch,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [RFC PATCH] i2c: imx: avoid rescheduling when waiting for bus
 not busy
Message-ID: <ZnZa7x3kaYrzFkiV@pengutronix.de>
References: <20240531142437.74831-1-eichest@gmail.com>
 <ZnWaxtfgmLk3SplP@eichest-laptop>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZnWaxtfgmLk3SplP@eichest-laptop>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

Hi Stefan,

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
> >  drivers/i2c/busses/i2c-imx.c | 14 +++++++++++---
> >  1 file changed, 11 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> > index 3842e527116b7..179f8367490a5 100644
> > --- a/drivers/i2c/busses/i2c-imx.c
> > +++ b/drivers/i2c/busses/i2c-imx.c
> > @@ -503,10 +503,18 @@ static int i2c_imx_bus_busy(struct imx_i2c_struct *i2c_imx, int for_busy, bool a
> >  				"<%s> I2C bus is busy\n", __func__);
> >  			return -ETIMEDOUT;
> >  		}
> > -		if (atomic)
> > +		if (atomic) {
> >  			udelay(100);
> > -		else
> > -			schedule();
> > +		} else {
> > +			/*
> > +			 * Avoid rescheduling in the first 10 ms to avoid
> > +			 * timeouts for SMBus like devices
> > +			 */
> > +			if (time_before(jiffies, orig_jiffies + msecs_to_jiffies(10)))
> > +				udelay(10);
> > +			else
> > +				schedule();
> > +		}
> >  	}
> >  
> >  	return 0;
> > -- 
> > 2.40.1
> 
> If we want to be sure that the ADS1015 I2C ADC will never timeout, we
> would have to add a patch to disable preemption during transmission.
> This would look like this:
> 
> @@ -1244,6 +1248,12 @@ static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
>  	bool is_lastmsg = false;
>  	struct imx_i2c_struct *i2c_imx = i2c_get_adapdata(adapter);
>  
> +	/* If we are in SMBus mode we need to do the transfer atomically */
> +	if (i2c_imx->smbus_mode) {
> +		preempt_disable();
> +		atomic = true;
> +	}
> +
>  	/* Start I2C transfer */
>  	result = i2c_imx_start(i2c_imx, atomic);
>  	if (result) {
> @@ -1320,6 +1330,9 @@ static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
>  	if (i2c_imx->slave)
>  		i2c_imx_slave_init(i2c_imx);
>  
> +	if (i2c_imx->smbus_mode)
> +		preempt_enable();
> +
>  	return (result < 0) ? result : num;
>  }
> 
> However, we are aware that disabling preemption is not a good idea. So
> we were discussing how this is normally handled with SMBus devices? Is
> it just expected that SMBus devices will timeout in rare cases?
> 
> For our use case, the problem would be solved if we could get rid of the
> schedule call and replace it with a udelay. It seems that the i.MX8M
> Mini I2C controller needs a few ms to clear the IBB flag. In the
> reference manual, they write:
> > I2C bus busy bit. Indicates the status of the bus. NOTE: When I2C is
> > enabled (I2C_I2CR[IEN] = 1), it continuously polls the bus data (SDA)
> > and clock (SCL) signals to determine a Start or Stop condition. Bus is
> > idle. If a Stop signal is detected, IBB is cleared. Bus is busy. When
> > Start is detected, IBB is set.
> Unfortunately, it is not clear how often they poll. In our tests the
> issue disappeard when we used udelay instead of usleep or schedule for
> the first 10 ms.

I'm not really happy with this variant. It can be acceptable in some
use cases, but may have not pleasant side effects on other. Since this
is still valid case, I would prefer to have a UAPI to enable polling
mode as optional optimization with a warning that it may affect latency
on other corner of the system.

> Since we know we don't have a multi-master configuration, another way
> would be to not test for IBB and just start the transfer. We saw that
> other drivers use the multi-master device tree property to determine if
> multi-master is supported. Here another quote from the reference manual:
> > On a multimaster bus system, the busy bus (I2C_I2SR[IBB]) must be
> > tested to determine whether the serial bus is free.
> We assume this means it is not necessary to test for IBB if we know we
> are in a single-master configuration.

I interpret this part of documentation in the same way, so it will be
great if you can implement this option.

Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

