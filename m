Return-Path: <linux-i2c+bounces-15188-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C040D24E7E
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 15:20:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BBFA230164EF
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 14:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD14C39C64A;
	Thu, 15 Jan 2026 14:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZjIQZKIf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08E624DFF3;
	Thu, 15 Jan 2026 14:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768486825; cv=none; b=s7mcg46BloaJoAdDAxjbCznPN7bKqq/VLSiRx5sdGelKJF7/VlNXCnjOBG63CJWSFCfiNP3us0+uXL0ybwqb14Qq2frlngwZyMmiofpmQFz/OCzh6il6mxN6gKSMRBK0+7jAyKfXhiqZtz5Vl5g8OyTijKIVARJV8uq92iE019E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768486825; c=relaxed/simple;
	bh=bBvZmsX0wAehXmXp8vsbL52cWSEybjGheyGdcVDaPZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LSsPASIdhlkuUOQ9So0F9oUKq4ask5bhw/hfLv2FY329XPCaDiUt2JwOyXvleOM+DenXrX1x81yxa2EsyreIdLkYU1YKt5pWCVcQhMzm8LwtKUrxebjdnY0L25kIE2iCunY5o1TMqjBbuh+aQ9os4/byBWOOlGTdd3qZsnejlvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZjIQZKIf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0B02C116D0;
	Thu, 15 Jan 2026 14:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768486825;
	bh=bBvZmsX0wAehXmXp8vsbL52cWSEybjGheyGdcVDaPZ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZjIQZKIf39w2H5NMIoJbgakDo0fUa3tcX6YDSZfbtGg7GABS+EgMqkKr8ucnc3xse
	 2VAN8nQ50b4q70oARSEd3VqsHWJ3TDGdiNp0IgimNoW10s+xN/Z5f8Pj/Y35EJIyq2
	 X2f30GJUn4WBbXBEYtel2NTS4zjJxj/rOm5M+YbJPWZsrzuNSnEPK9qJC3aXOJYyq2
	 9csGzZAkNALYvxDKCT8EFmB2mfnEK0zjdEJpXraLOsAV6A9C9JyHBtXQkOMIVaqTmE
	 F3NV4ksGjX3uGlkZJ7fPxK3VOmyT2k4+olwjb3Rt3I72hIycVeIviXfHA/qaRjMo8L
	 JIOxKq/PBOWPQ==
Date: Thu, 15 Jan 2026 15:20:21 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Francesco Lavra <flavra@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: Add FTDI FT4222H USB I2C adapter
Message-ID: <aWjodd1Vm_pDIvif@zenone.zhora.eu>
References: <20260106170807.3964886-1-flavra@baylibre.com>
 <aV5aM4OgIeJtsxlb@zenone.zhora.eu>
 <a503fea8fdf4156526d473ee2208b42b896b50c1.camel@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a503fea8fdf4156526d473ee2208b42b896b50c1.camel@baylibre.com>

> On Wed, 2026-01-07 at 14:38 +0100, Andi Shyti wrote:
> > Hi Francesco,
> > 
> > I did just a quick initial review.
> 
> ...
> 
> > > +static int ft4222_i2c_get_status(struct ft4222_i2c *ftdi)
> > > +{
> > > +       u8 status;
> > > +       int retry;
> > > +       const int max_retries = 512;
> > 
> > why 512?
> 
> These retries are needed mostly when retrieving the status after doing a
> write with the I2C bus operating at a low speed.
> Doing various tests at 100 kHz, I saw that after a maximum-sized (512-byte)
> write, up to 11 retries are needed before the chip clears its CTRL_BUSY
> flag. But under certain conditions we may need more retries, for example if
> I disconnect the SCL line and then try to do a write, I see that up to 64
> retries are needed.
> So I guess 512 max_retries is too much, but we need a value > 64. Does 128
> sound OK to you? Perhaps I can add a comment with the above observations.

All constants need to have a comment or defined or both. A good
comment would definitely help. As for the number of retries it
looks a bit too much to me, but you definitely know better.

> > > +       for (retry = 0; retry < max_retries; retry++) {
> > > +               int ret = ft4222_cmd_get(ftdi, 0xf5b4, &status);
> > > +
> > > +               if (ret < 0)
> > > +                       return ret;
> > > +               if (!(status & FT4222_I2C_CTRL_BUSY))
> > > +                       break;
> > > +       }
> > > +       dev_dbg(&ftdi->adapter.dev, "status 0x%02x (%d retries)",
> > > status,
> > > +               retry);
> > 
> > whould this debug message be printed after the check below?
> 
> Not sure I understood your question. Are you suggesting to move the
> dev_dbg() call after the check below? I put it before the check so that I
> get a debug message even if the maximum number of retries has been reached.

It looks to me more like a spam message or a spurious printout
after a debugging session, rather than an informative message.

I'd remove it, but if you think that's really useful, then you
can keep it.

> > > +       if (retry == max_retries) {
> > > +               ft4222_i2c_reset(ftdi);
> > > +               return -ETIMEDOUT;
> > > +       }
> > > +       if (!(status & FT4222_I2C_ERROR))
> > > +               return 0;
> > > +       if (status & FT4222_I2C_ADDR_NACK)
> > > +               return -ENXIO;
> > > +       else if (status & FT4222_I2C_DATA_NACK)
> > > +               return -EIO;
> > > +       else
> > > +               return -EBUSY;
> > > +}
> 
> ...
> 
> > > +static int ft4222_i2c_probe(struct usb_interface *interface,
> > > +                           const struct usb_device_id *id)
> > > +{
> > > +       enum ft4222_conf_mode conf_mode;
> > > +       int ret = ft4222_get_conf(interface, &conf_mode);
> > > +       int intf = interface->cur_altsetting->desc.bInterfaceNumber;
> > > +
> > > +       if (ret)
> > > +               return ret;
> > > +       if (((conf_mode == ft4222_conf0) || (conf_mode ==
> > > ft4222_conf3)) &&
> > 
> > what about conf12?
> 
> As mentioned in the commit message, the I2C functionality is available only
> when the chip is configured in mode 0 or 3. In modes 1 and 2, the chip
> implements other functionalities, e.g. SPI.
> I will add a comment in this function.

What prevents us from removing conf12 at all?

Andi

