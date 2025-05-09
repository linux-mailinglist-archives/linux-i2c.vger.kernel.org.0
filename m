Return-Path: <linux-i2c+bounces-10916-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 02963AB176A
	for <lists+linux-i2c@lfdr.de>; Fri,  9 May 2025 16:29:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83D271C45791
	for <lists+linux-i2c@lfdr.de>; Fri,  9 May 2025 14:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D306821A425;
	Fri,  9 May 2025 14:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CDeY3Ffu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8621E5B82;
	Fri,  9 May 2025 14:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746800907; cv=none; b=BAOb7n2X+B+v/1ZwSVORKAi5KFFCD21PUPm4nLEDXMaemSEkp0dYJ5F7j695LlraGbPM5P1Ww2ZHDuu0H8xixMGcI1v+4CeiJDgw/p5cLaxe2AGO/9Ytt1Za/JCK4/U0gYrVOFofv48Ixga+gHn3/9a2yYIPZJJD2JWi2v89idk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746800907; c=relaxed/simple;
	bh=fNRLig7bAYi1L1Kq7n0i/6zijpbMaAknetCXULDY9CM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ksJny0jhVHTzkHXk7Rw1W4Cvhii6VzjvjKABXNmp+eZkiWo5G5uSsYQLlieIRSQgUif+1QlOL9TUfHYwglTzS3e9UCFFOuYdHOj1o1/22P+Jjbs7JH8iBLe/eTRSWXZXE5R37t/eIPkS3MSmtpO/6kHKCYa4J5VXexFVDtzpCRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CDeY3Ffu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51886C4CEE4;
	Fri,  9 May 2025 14:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746800906;
	bh=fNRLig7bAYi1L1Kq7n0i/6zijpbMaAknetCXULDY9CM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CDeY3FfuWHHr5ejCUZjrZfxLJ19JvZe/RsVbusBSk3mJbCZBndZddB5O2dP/eV8HK
	 ik/fCKZlR7BGiQ8VI7eGCgcWeQOEahApJyI22knewmpxyfvWp3wlc9gq8Ak86xvDzp
	 pBbq/9/fR4Kky+db9ieJJltllj/DLGK2f2fHtldJI4g721+ez5je893Bp8YPKGaAfL
	 FOPT+WtvsI5JyP6T1rRcCX09RcQlvcfP80a5gCTNvqotCeJzW7gkrH+4tQR/I/m241
	 w3WWYeZcEBdUTPqwtf9w+4hHfkhMWt0JJiQiGKgkNxCuNbrtZaQgSajZFKkSkQxAfD
	 MJHjru/wqRDkw==
Date: Fri, 9 May 2025 15:28:19 +0100
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
Subject: Re: [PATCH v10 1/7] mfd: Add core driver for Nuvoton NCT6694
Message-ID: <20250509142819.GG2492385@google.com>
References: <20250423094058.1656204-1-tmyu0@nuvoton.com>
 <20250423094058.1656204-2-tmyu0@nuvoton.com>
 <20250501122214.GK1567507@google.com>
 <CAOoeyxVL2MV83CJaYCXMiw0b5YUzk728H4B9GY1q9h_P8D43fg@mail.gmail.com>
 <20250502080754.GD3865826@google.com>
 <CAOoeyxWpYmcg1_FBXYqDfMi28R5ZXp2Sk2PhUo=cL10Nn3iVEw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOoeyxWpYmcg1_FBXYqDfMi28R5ZXp2Sk2PhUo=cL10Nn3iVEw@mail.gmail.com>

On Fri, 02 May 2025, Ming Yu wrote:

> Lee Jones <lee@kernel.org> 於 2025年5月2日 週五 下午4:08寫道：
> >
> ...
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
> > > >
> > > > These are all identical.
> > > >
> > > > I thought you were going to use PLATFORM_DEVID_AUTO?  In fact, you are
> > > > already using PLATFORM_DEVID_AUTO since you are calling
> > > > mfd_add_hotplug_devices().  So you don't need this IDs.
> > > >
> > > > MFD_CELL_NAME() should do.
> > > >
> > >
> > > Yes, it uses PLATFORM_DEVID_AUTO, but in my implementation, the
> > > sub-devices use cell->id instead of platform_device->id, so it doesn't
> > > affect the current behavior.
> > > However, if you think there's a better approach or that this should be
> > > changed for consistency or correctness, I'm happy to update it, please
> > > let me know your recommendation.
> > >
> > > When using MFD_CELL_NAME(), the platform_device->id for the GPIO
> > > devices is assigned values from 1 to 16, and for the I2C devices from
> > > 1 to 6, but I need the ID offset to start from 0 instead.
> >
> > Oh no, don't do that.  mfd_cell isn't supposed to be used outside of MFD.
> >
> > Just use the platform_device id-- if you really need to start from 0.
> >
> > As an aside, I'm surprised numbering starts from 1.
> >
> 
> OK, I will use platform_device->id instead. However, I'm still unsure
> why the ID starts from1.
> 
> Additionally, I noticed that when calling mfd_add_devices()
> separately, the IDs are also assigned consecutively (e.g., GPIO: 1~16,
> I2C: 17~22, ...).
> 
> Do you have any recommendations on how I should implement this?

If you are to use this mechanism, you'd have to submit separate
mfd_add_devices() calls I guess.

However, this all seems a bit silly for simple, contextless (where
device 3 is identical to device 10, etc) enumeration.  Can you use IDA
instead?

-- 
Lee Jones [李琼斯]

