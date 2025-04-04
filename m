Return-Path: <linux-i2c+bounces-10101-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 83767A7BF08
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Apr 2025 16:22:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6900417B103
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Apr 2025 14:21:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAFC01F3BAF;
	Fri,  4 Apr 2025 14:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZI2ZReU1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2231EF088;
	Fri,  4 Apr 2025 14:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743776483; cv=none; b=lpO5C2tIHro7jQ03W+WvUTkTcDiMSXxTrrCOW6/p8ZNNTXV0UB7vsPCvTlg80+e+B1asNalx2Pe86PFVpD6Fl543e0OMsRZY2o4ZxWor+qxKH8LM0Zjls6ICGq56qbg+9+S5SCt5qZeVRhGJAepoUK+2/3/zyLsNVHZo/XzzmYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743776483; c=relaxed/simple;
	bh=jWDI/Zr0/C5m752YjHWoRmTDwZdbUMKMz0DGgxY/xNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IrTQXu+dsNcUxHMuYna4jRB1v/hJMn2iOaGFtlNl4wMXCzzCZsigIrJkB9ViOzYp71Eh0bPP1n6LxZ83a/+HFd2C1W+JvMtzyixUQZhT0H8MH30PDqQqUBMSoqdqzWTMSw2N/VU+LbKqtBiFRG+vz9UuMlnXTdKspsxMMMCMnfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZI2ZReU1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FE8BC4CEDD;
	Fri,  4 Apr 2025 14:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743776482;
	bh=jWDI/Zr0/C5m752YjHWoRmTDwZdbUMKMz0DGgxY/xNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZI2ZReU12jWJWtPcM6Zm1LelBbJ0IuB+ZYdQ7zGoAY01nrTX6icYXg4hfo2ZyPR/+
	 TFb1QP2U3vi83K2SB7wMXVlsv1EbaDFkYO93Mc5MRJBLjVRpEt6wyuftu1pys508Q1
	 Gx+P7JYHB1gAJu9Yv6ilupRA2fljBJJ49WLHLNCGYF7+54yAeGb/jDky7C4mmN/q69
	 Mq2bCatP/Tk8s7PcP4ffGxHflKt1rfBNzO0xml2yN6JtsStcODOsuXkLf1VuzpZqYr
	 q/yjX+XsM/G5Vkse2Syb9zEvHs9AkAKqmAi/+ehVlpC9sBls8pyb0+4Ujf7OXU3HaU
	 7bTLp2ns2VbTg==
Date: Fri, 4 Apr 2025 15:21:15 +0100
From: Lee Jones <lee@kernel.org>
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, linus.walleij@linaro.org, brgl@bgdev.pl,
	andi.shyti@kernel.org, mkl@pengutronix.de,
	mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, wim@linux-watchdog.org, linux@roeck-us.net,
	jdelvare@suse.com, alexandre.belloni@bootlin.com,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
	netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v8 1/7] mfd: Add core driver for Nuvoton NCT6694
Message-ID: <20250404142115.GC278642@google.com>
References: <20250225081644.3524915-1-a0282524688@gmail.com>
 <20250225081644.3524915-2-a0282524688@gmail.com>
 <20250307011542.GE8350@google.com>
 <CAOoeyxUgiTqtSksfHopEDhZHwNkUq9+d-ojo8ma3PX2dosuwyQ@mail.gmail.com>
 <20250320145042.GS3890718@google.com>
 <CAOoeyxXZmrzBSNRdRx9vK84m5Z5y8T_A+wY98vVrPUZ7f4w4iw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOoeyxXZmrzBSNRdRx9vK84m5Z5y8T_A+wY98vVrPUZ7f4w4iw@mail.gmail.com>

On Wed, 26 Mar 2025, Ming Yu wrote:

> Lee Jones <lee@kernel.org> 於 2025年3月20日 週四 下午10:50寫道：
> >
> ...
> > > > > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x1),
> > > >
> > > > IDs are usually given in base-10.
> > > >
> > >
> > > Fix it in v9.
> > >
> > > > Why are you manually adding the device IDs?
> > > >
> > > > PLATFORM_DEVID_AUTO doesn't work for you?
> > > >
> > >
> > > I need to manage these IDs to ensure that child devices can be
> > > properly utilized within their respective modules.
> >
> > How?  Please explain.
> >
> > This numbering looks sequential and arbitrary.
> >
> > What does PLATFORM_DEVID_AUTO do differently such that it is not useful?
> >
> 
> As far as I know, PLATFORM_DEVID_AUTO assigns dynamic IDs to devices,
> but I need fixed IDs.
> For example, the GPIO driver relies on these IDs to determine the
> group, allowing the firmware to identify which GPIO group to operate
> on through the API.

PLATFORM_DEVID_AUTO will allocate IDs 0 through 16, the same as you've
done here.  These lines do not have any differentiating attributes, so
either way we are not allocating specific IDs to specific pieces of the
H/W.  I still do not understand why you need to allocate them manually.

> > > > > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x2),
> > > > > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x3),
> > > > > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x4),
> > > > > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x5),
> > > > > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x6),
> > > > > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x7),
> > > > > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x8),
> > > > > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x9),
> > > > > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0xA),
> > > > > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0xB),
> > > > > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0xC),
> > > > > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0xD),
> > > > > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0xE),
> > > > > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0xF),
> 
> 
> Thanks,
> Ming

-- 
Lee Jones [李琼斯]

