Return-Path: <linux-i2c+bounces-11381-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75528AD7637
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 17:33:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD4657B166E
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 15:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB19D2C324F;
	Thu, 12 Jun 2025 15:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XBK70+8m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B8D2BF3DF;
	Thu, 12 Jun 2025 15:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749741801; cv=none; b=ubFsq8l3K9/SEBP/fqQvoC0QsSeKuX/nrLrT8XPTrNrxvfS0yJdt7XiwN6lMxMbKFICh9S17nx0przsl+U3wl8emRfCT7cGqmaYJBVJOIEQAXl+0nl4jqCDRBsf5yJePDPZdMidUT4wVhP+OsYgBkKV3nco5A4Zkex2VJvdhc2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749741801; c=relaxed/simple;
	bh=7+POKnao7dJbjl1goCWSf3SOuai5TxMCVJI0eCvMhl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pNkO2JWjTzeqHm438qpva+KTCIUGy1joYCwlHdBWwYQXKIKxhGru2FUdgaC9J9jmTJ1J5m/+Eb9oaLMjw7rb8KunAoQzG9JiVUztZA4Wjn1mrwtyOdQH/5pKjFr/DCfwHLyJjwunRdFBkE/KoNYrjmFerj5JpAtgn9HFm6FaqhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XBK70+8m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7476AC4CEEA;
	Thu, 12 Jun 2025 15:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749741801;
	bh=7+POKnao7dJbjl1goCWSf3SOuai5TxMCVJI0eCvMhl0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XBK70+8mAD6hUz34u1ynNTORuPkMNSYLirTEViOINENBZ5407zYk4HLRqeP17W/9B
	 r2T/RngfGRyjBXFassi3AwAo//t5JSlaSdlpTbSuktY5YqTigeFGAe14UPRecFFGrZ
	 h4ANsE8KM7zyJ+MYcjcoFhRZh1spF96TQOIJ6ll/bwZ63quYEUyuRF3RQZ0aFaWp5z
	 B7wzht3/RTptjwaOhYWbWSbdiH1a41WZVhZ3YqtuyUzJgiZa6Xf8DoATPYsjAnkWyw
	 GbRMD5Y3RQ3ktzKKHY9r4VFDpYLxoWpTAVt4wQDa4FF7eEXPjkrKK3xkJNquJNO65f
	 rwCl5GmA+SldA==
Date: Thu, 12 Jun 2025 16:23:13 +0100
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
Message-ID: <20250612152313.GP381401@google.com>
References: <20250604041418.1188792-1-tmyu0@nuvoton.com>
 <20250604041418.1188792-2-tmyu0@nuvoton.com>
 <20250612140041.GF381401@google.com>
 <CAOoeyxVvZiD18qbGd5oUnqLNETKw50fJBjJO3vR50kon_a5_kA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOoeyxVvZiD18qbGd5oUnqLNETKw50fJBjJO3vR50kon_a5_kA@mail.gmail.com>

On Thu, 12 Jun 2025, Ming Yu wrote:

> Dear Lee,
> 
> Thank you for reviewing,
> 
> Lee Jones <lee@kernel.org> 於 2025年6月12日 週四 下午10:00寫道：
> >
> ...
> > > +static const struct mfd_cell nct6694_devs[] = {
> > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 0),
> > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 1),
> > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 2),
> > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 3),
> > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 4),
> > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 5),
> > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 6),
> > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 7),
> > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 8),
> > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 9),
> > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 10),
> > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 11),
> > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 12),
> > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 13),
> > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 14),
> > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 15),
> > > +
> > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 0),
> > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 1),
> > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 2),
> > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 3),
> > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 4),
> > > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 5),
> >
> > Why have we gone back to this silly numbering scheme?
> >
> > What happened to using IDA in the child driver?
> >
> 
> In a previous version, I tried to maintain a static IDA in each
> sub-driver. However, I didn’t consider the case where multiple NCT6694
> devices are bound to the same driver — in that case, the IDs are not
> fixed and become unusable for my purpose.

Not sure I understand.

> I’ve since realized that using pdev->id avoids the need for cell->id,
> so I reverted to the earlier approach.
> 
> That said, do you think it would be a better solution to manage all
> the IDAs centrally within the driver? For example:
> in nct6694.c
> struct nct6694 {
>     struct device *dev;
> 
>     struct ida gpio_ida;
>     struct ida i2c_ida;
>     struct ida can_ida;
>     struct ida wdt_ida;
> };
> 
> static int nct6694_probe(struct platform_device *pdev)
> {
>     ida_init(&nct6694->gpio_ida);
>     ...
> }
> 
> in gpio-nct6694.c
> static int nct6694_gpio_probe(struct platform_device *pdev)
> {
>     id = ida_alloc(&nct6694->gpio_ida, GFP_KERNEL);
> }

No that would be way worse.

-- 
Lee Jones [李琼斯]

