Return-Path: <linux-i2c+bounces-4309-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8669152D6
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 17:49:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C695282066
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 15:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 406AF19D07D;
	Mon, 24 Jun 2024 15:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JOTrLQVn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E8154276;
	Mon, 24 Jun 2024 15:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719244174; cv=none; b=c4yNBuCTD8VRAjhIYtg7zw0qrMMus6Ypjxzld9pZxiH0XaUnvWDCFYeDzOf++oFTh/HXcWwVgYez407z6LXeL5IOxxibWWWxct8hHLko60NzGYVn/QX+JQnlC0wDsjgDQjEsICheGk/Ywesf+EPbE3SBrHxArJjgfrORd2+td6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719244174; c=relaxed/simple;
	bh=a0UJSp2q0uve7X5kQB5gD7q6GeLF7iCBBBnuERdm2ag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gHsIFZ5X9Wjc83KLpIyDoW3I7GMCzo/LN7ZCypgC3Y6eZZK8bc28u/SEGKNSXW3uSLEP7GcnfIVD2uXWkOXbflzYbD8IBtLtPbPaRLtgFFXiVTfmxjdPo6l1hQY7BHJNY/6dShgD7/8LQTLI92DJwWxkn9AC2Qn+F6/rC9fdbkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JOTrLQVn; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4217d451f69so38392955e9.0;
        Mon, 24 Jun 2024 08:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719244169; x=1719848969; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9kgIYkCaEISawG3z3/PKDsfUfni6CT+YfmQGd+f5vk=;
        b=JOTrLQVnFw7k0SpgoGmuc1vH77sP0y7e35A9qfordX0HHTIGvcGtKJgHzO28CWrAO6
         VNFGh3Dvk7TtXMjXlR8Fbuk2OkKftRALHqg7WoGRsptUDeJd4wTBcCPrZ04EV8NwA4fS
         1sCKJblDU+dlvO4w9/XzjQ6SIJLhh1b4xFhBtVO8PhzMqLP8VX9fNr/rnlS39xs3cYGy
         cWCx56MAdM+dfpT1PNHmlnk07GVe6Lvedjcn0mq4BPVz4h8qwW0iDSovU735oJ7gVOtU
         zltrRPEGFlF0iNHzqEfXOl+fvIbINa5KaY+vFTa7hzk2DYVT0YmNlfTtDSZwfiwlD4Qe
         djLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719244169; x=1719848969;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9kgIYkCaEISawG3z3/PKDsfUfni6CT+YfmQGd+f5vk=;
        b=c0ZLKxtpytt+wX77YrK/ovrZBLBHYlv2cttptJBw69UFyItBlfkF69dUZOjKwNd4TX
         1v16NGsKxW2dya00U/Fxhw50nP/xeN5GKwRF5hex38NyXuIdcOsyfhvaTDMIAhNvh7YH
         6ha5h5NUBjejZLd3SYg4tIeLgodHevM7UFxmVcgMJE1nxgA2r1EbROoGlbqhXTV5GIuD
         86pfQ1wuWAIIfTYwQXFl6UqeZtT1JgeqtC7cg5eelM3yb6tgwUBQro7XkaRyrqMurvvT
         TuJLZK8LDs8xFAQp3FsSahehhwo3y8c49JClvZJfR0IjIUwF1RcGCat1v7leLA60qGeY
         kMuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmmiuvgM6dyDA3yEKT+PZ1H9UWQguSolWg7MvJ5kuC5rB9eU0RAlJkEK1ugO+GuUSDEWRbnL6CGWZEgtoxv6OzKR8zIhD8QVyAxzdENh6lp5oUByNaKcgzT0mTWfKYGGOmc3hPegq6+C2jeBXFqfSdXAujeaAwR/amWJOAIlXL4nRr
X-Gm-Message-State: AOJu0YwrgNQwWdNgJTSus4CnxoWZwVTrH8BNNs4ynC5lvDjNbhX9v9uX
	HAftVl4DXVdmwAdhOmNgZMBOktctT8QtiwcDzuqPDMHw1bocirtn
X-Google-Smtp-Source: AGHT+IF2O0vTFTR2Jv5inHaCYhFCJMD7FD4fHIJxFEqeF2HsybT87gdE0Y0w/WzRojs+ABU4W/YZag==
X-Received: by 2002:a05:600c:548b:b0:421:f04d:ebd2 with SMTP id 5b1f17b1804b1-4248cc349afmr33870795e9.22.1719244169043;
        Mon, 24 Jun 2024 08:49:29 -0700 (PDT)
Received: from eichest-laptop ([2a02:168:af72:0:b172:75e:e42d:1a1d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d0be80dsm177295645e9.19.2024.06.24.08.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 08:49:28 -0700 (PDT)
Date: Mon, 24 Jun 2024 17:49:26 +0200
From: Stefan Eichenberger <eichest@gmail.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>
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
Message-ID: <ZnmVhlTK4JmzXdyk@eichest-laptop>
References: <20240531142437.74831-1-eichest@gmail.com>
 <ZnWaxtfgmLk3SplP@eichest-laptop>
 <ZnZa7x3kaYrzFkiV@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZnZa7x3kaYrzFkiV@pengutronix.de>

Hi Oleksij,

On Sat, Jun 22, 2024 at 07:02:39AM +0200, Oleksij Rempel wrote:
> Hi Stefan,
> 
> On Fri, Jun 21, 2024 at 05:22:46PM +0200, Stefan Eichenberger wrote:
> > Hi Andi, Andrew, Wolfram, Oleksij,
> > 
> > After some internal discussion we still have some questions which are
> > blocking us from solving the issue.
> > 
> > On Fri, May 31, 2024 at 04:24:37PM +0200, Stefan Eichenberger wrote:
> > > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > > 
> > > On our i.MX8M Mini based module we have an ADS1015 I2C ADC connected to
> > > the I2C bus. The ADS1015 I2C ADC will timeout after 25ms when the I2C
> > > bus is idle. The imx i2c driver will call schedule when waiting for the
> > > bus to become idle after switching to master mode. When the i2c
> > > controller switches to master mode it pulls SCL and SDA low, if the
> > > ADS1015 I2C ADC sees this for more than 25 ms without seeing SCL
> > > clocking, it will timeout and ignore all signals until the next start
> > > condition occurs (SCL and SDA low). This can occur when the system load
> > > is high and schedule returns after more than 25 ms.
> > > 
> > > This rfc tries to solve the problem by using a udelay for the first 10
> > > ms before calling schedule. This reduces the chance that we will
> > > reschedule. However, it is still theoretically possible for the problem
> > > to occur. To properly solve the problem, we would also need to disable
> > > interrupts during the transfer.
> > > 
> > > After some internal discussion, we see three possible solutions:
> > > 1. Use udelay as shown in this rfc and also disable the interrupts
> > >    during the transfer. This would solve the problem but disable the
> > >    interrupts. Also, we would have to re-enable the interrupts if the
> > >    timeout is longer than 1ms (TBD).
> > > 2. We use a retry mechanism in the ti-ads1015 driver. When we see a
> > >    timeout, we try again.
> > > 3. We use the suggested solution and accept that there is an edge case
> > >    where the timeout can happen.
> > > 
> > > There may be a better way to do this, which is why this is an RFC.
> > > 
> > > Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > > ---
> > >  drivers/i2c/busses/i2c-imx.c | 14 +++++++++++---
> > >  1 file changed, 11 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> > > index 3842e527116b7..179f8367490a5 100644
> > > --- a/drivers/i2c/busses/i2c-imx.c
> > > +++ b/drivers/i2c/busses/i2c-imx.c
> > > @@ -503,10 +503,18 @@ static int i2c_imx_bus_busy(struct imx_i2c_struct *i2c_imx, int for_busy, bool a
> > >  				"<%s> I2C bus is busy\n", __func__);
> > >  			return -ETIMEDOUT;
> > >  		}
> > > -		if (atomic)
> > > +		if (atomic) {
> > >  			udelay(100);
> > > -		else
> > > -			schedule();
> > > +		} else {
> > > +			/*
> > > +			 * Avoid rescheduling in the first 10 ms to avoid
> > > +			 * timeouts for SMBus like devices
> > > +			 */
> > > +			if (time_before(jiffies, orig_jiffies + msecs_to_jiffies(10)))
> > > +				udelay(10);
> > > +			else
> > > +				schedule();
> > > +		}
> > >  	}
> > >  
> > >  	return 0;
> > > -- 
> > > 2.40.1
> > 
> > If we want to be sure that the ADS1015 I2C ADC will never timeout, we
> > would have to add a patch to disable preemption during transmission.
> > This would look like this:
> > 
> > @@ -1244,6 +1248,12 @@ static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
> >  	bool is_lastmsg = false;
> >  	struct imx_i2c_struct *i2c_imx = i2c_get_adapdata(adapter);
> >  
> > +	/* If we are in SMBus mode we need to do the transfer atomically */
> > +	if (i2c_imx->smbus_mode) {
> > +		preempt_disable();
> > +		atomic = true;
> > +	}
> > +
> >  	/* Start I2C transfer */
> >  	result = i2c_imx_start(i2c_imx, atomic);
> >  	if (result) {
> > @@ -1320,6 +1330,9 @@ static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
> >  	if (i2c_imx->slave)
> >  		i2c_imx_slave_init(i2c_imx);
> >  
> > +	if (i2c_imx->smbus_mode)
> > +		preempt_enable();
> > +
> >  	return (result < 0) ? result : num;
> >  }
> > 
> > However, we are aware that disabling preemption is not a good idea. So
> > we were discussing how this is normally handled with SMBus devices? Is
> > it just expected that SMBus devices will timeout in rare cases?
> > 
> > For our use case, the problem would be solved if we could get rid of the
> > schedule call and replace it with a udelay. It seems that the i.MX8M
> > Mini I2C controller needs a few ms to clear the IBB flag. In the
> > reference manual, they write:
> > > I2C bus busy bit. Indicates the status of the bus. NOTE: When I2C is
> > > enabled (I2C_I2CR[IEN] = 1), it continuously polls the bus data (SDA)
> > > and clock (SCL) signals to determine a Start or Stop condition. Bus is
> > > idle. If a Stop signal is detected, IBB is cleared. Bus is busy. When
> > > Start is detected, IBB is set.
> > Unfortunately, it is not clear how often they poll. In our tests the
> > issue disappeard when we used udelay instead of usleep or schedule for
> > the first 10 ms.
> 
> I'm not really happy with this variant. It can be acceptable in some
> use cases, but may have not pleasant side effects on other. Since this
> is still valid case, I would prefer to have a UAPI to enable polling
> mode as optional optimization with a warning that it may affect latency
> on other corner of the system.
> 
> > Since we know we don't have a multi-master configuration, another way
> > would be to not test for IBB and just start the transfer. We saw that
> > other drivers use the multi-master device tree property to determine if
> > multi-master is supported. Here another quote from the reference manual:
> > > On a multimaster bus system, the busy bus (I2C_I2SR[IBB]) must be
> > > tested to determine whether the serial bus is free.
> > We assume this means it is not necessary to test for IBB if we know we
> > are in a single-master configuration.
> 
> I interpret this part of documentation in the same way, so it will be
> great if you can implement this option.

Perfect thanks a lot for the feedback. I will try to implement this
option and run some tests to make sure it will not break anything.

Best regards,
Stefan

