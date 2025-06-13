Return-Path: <linux-i2c+bounces-11430-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E919AD8CE6
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 15:11:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02F833A4C32
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 13:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DD961487F6;
	Fri, 13 Jun 2025 13:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p9CRFwTF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE4E7263F;
	Fri, 13 Jun 2025 13:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749820301; cv=none; b=KQOEW/xi6bqXvmfy+NNm9/oWteAPY1a8QMF6ady9NkvcXXGnlvmt2yChh5z8KuloKDU0TWcUkjNZ0YuFvPoYyUji+tyrG8rxx+H50EceT0WEIUJ1gjM0h4q7QTKHBMPPALKLdKuymr85JpnBt7dQhYbB0sfanjNi1Rd2/GsXpis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749820301; c=relaxed/simple;
	bh=RbLt8//FrHv3yzSlHkAnJ39jGaCI5d6TuBafqw1Iais=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ixhMjx6T0gge8SoUCrzD7+Wz00Nm2hPfvfHh2XHdqUcNDG8/vrppw/ZLfMDdUx7ZhBvKeFGsRj8V4qCm0cP0nsnI8kCyyssvmjzYqjYwCM1OHJX7VZo5VHTkdSKnayJSGSQMeQ1Trw1Kph8FgW/UUpGxPqTW9P/XaOCE8MBC/PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p9CRFwTF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39038C4CEE3;
	Fri, 13 Jun 2025 13:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749820300;
	bh=RbLt8//FrHv3yzSlHkAnJ39jGaCI5d6TuBafqw1Iais=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p9CRFwTFQB6b2MRLIiu64qe3eBQOQuybf4O9R2ndSQD5+AQW0G9ttxIY4zPnD8CIR
	 PEgjQ6UJ9A02nWnYEZ4hdjuxmmKz6W9EADdVr1GVQ9lQW4/UCuMqUoNBuQ/te93Ads
	 cupoMj4pmBj6bu8exL7TUN4N6fe3dwCeRUtCkKcrAaTyCPyrwDvvZGOM/cWMKITupY
	 WkCpdeJQcDK/SPlMYkK5Q+JsHKtoHx/lUn4cW8iI9i1NkACjO9b4KBYGoCGY0bLYUd
	 /EVAoP7PxxLSUHNVxHonbuFweNJhlAClNBBdHHSNUjgrkmZ3M5/m9a2Kqx1y+Katy8
	 TgWiR9/xkyNpg==
Date: Fri, 13 Jun 2025 14:11:33 +0100
From: Lee Jones <lee@kernel.org>
To: Ming Yu <a0282524688@gmail.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, andi.shyti@kernel.org,
	mkl@pengutronix.de, mailhol.vincent@wanadoo.fr,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org,
	linux@roeck-us.net, jdelvare@suse.com,
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-can@vger.kernel.org, netdev@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org,
	Ming Yu <tmyu0@nuvoton.com>
Subject: Re: [PATCH v12 1/7] mfd: Add core driver for Nuvoton NCT6694
Message-ID: <20250613131133.GR381401@google.com>
References: <20250604041418.1188792-1-tmyu0@nuvoton.com>
 <20250604041418.1188792-2-tmyu0@nuvoton.com>
 <20250612140041.GF381401@google.com>
 <CAOoeyxVvZiD18qbGd5oUnqLNETKw50fJBjJO3vR50kon_a5_kA@mail.gmail.com>
 <20250612152313.GP381401@google.com>
 <CAOoeyxV-E_HQOBu0Pzfy0b0yJ2qbrW_C8pATCTWE4+PXqvHL6g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOoeyxV-E_HQOBu0Pzfy0b0yJ2qbrW_C8pATCTWE4+PXqvHL6g@mail.gmail.com>

On Fri, 13 Jun 2025, Ming Yu wrote:

> Lee Jones <lee@kernel.org> 於 2025年6月12日 週四 下午11:23寫道：
> >
> > On Thu, 12 Jun 2025, Ming Yu wrote:
> >
> > > Dear Lee,
> > >
> > > Thank you for reviewing,
> > >
> > > Lee Jones <lee@kernel.org> 於 2025年6月12日 週四 下午10:00寫道：
> > > >
> > > ...
> > > > > +static const struct mfd_cell nct6694_devs[] = {
> > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 0),
> > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 1),
> > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 2),
> > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 3),
> > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 4),
> > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 5),
> > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 6),
> > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 7),
> > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 8),
> > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 9),
> > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 10),
> > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 11),
> > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 12),
> > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 13),
> > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 14),
> > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 15),
> > > > > +
> > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 0),
> > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 1),
> > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 2),
> > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 3),
> > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 4),
> > > > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 5),
> > > >
> > > > Why have we gone back to this silly numbering scheme?
> > > >
> > > > What happened to using IDA in the child driver?
> > > >
> > >
> > > In a previous version, I tried to maintain a static IDA in each
> > > sub-driver. However, I didn’t consider the case where multiple NCT6694
> > > devices are bound to the same driver — in that case, the IDs are not
> > > fixed and become unusable for my purpose.
> >
> > Not sure I understand.
> >
> 
> As far as I know, if I maintain the IDA in the sub-drivers and use
> multiple MFD_CELL_NAME("nct6694-gpio") entries in the MFD, the first
> NCT6694 device bound to the GPIO driver will receive IDs 0~15.
> However, when a second NCT6694 device is connected to the system, it
> will receive IDs 16~31.
> Because of this behavior, I switched back to using platform_device->id.

Each of the devices will probe once.

The first one will be given 0, the second will be given 1, etc.

Why would you give multiple IDs to a single device bound to a driver?

-- 
Lee Jones [李琼斯]

