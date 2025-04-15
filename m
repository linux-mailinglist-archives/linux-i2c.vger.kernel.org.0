Return-Path: <linux-i2c+bounces-10349-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E73AA8A086
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 16:04:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0A2E3AA73A
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 14:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A2321DB34C;
	Tue, 15 Apr 2025 14:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tUUy21ee"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00014192580;
	Tue, 15 Apr 2025 14:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744725827; cv=none; b=UdthBvCglybcji9DXSA2zRKdAGFIPvwfQvNWzq/m33385fbp62Fl8+/myzeykBlIOxasCUl6Isr9brZpV9IXJa1JlF9ZDX2/rMIxqDRWrFxlAyrWJLUkzpxD4toIJ3BFUigy2vfIG0KZYSlSk1KPhIZ0rXpNh1ASbdWwLU1lnKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744725827; c=relaxed/simple;
	bh=S112oq2NxTmuqo0fbe4aMbRp949zRHjazHP3fHOyGv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hVZUF5dQFWkF+3bP0f47gJvoM/CWwCQt53+zDPoihsEnaaYs4EjdWISXApb4ZMPZE+Q5fGWTelzCAezceK8zIj+KfUbTXYOEdlHysUFbsiblM2OVZFJWxji4z+YvY0Bmp8e7PX9guJZw9LZEUx7DuMq7r4yTK5c1Kkracpk5m4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tUUy21ee; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEE6BC4CEDD;
	Tue, 15 Apr 2025 14:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744725826;
	bh=S112oq2NxTmuqo0fbe4aMbRp949zRHjazHP3fHOyGv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tUUy21eeoflX0u2Qg0fq5+1WtfjmcUe9Ybl/C7ZHoRcOW6gDCi/U5DefEFhwmPS3B
	 sPuNclh966ryUU5N0EsypIEMGSh7X2GDghy680F9cSR3opY1xNB1oVc0ug8RrjpSc4
	 FNMS1136XoIGnylshKgqZnwhPBPs64VzSx6BThJU=
Date: Tue, 15 Apr 2025 16:03:43 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Romain Gantois <romain.gantois@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Cosmin Tanislav <demonsingur@gmail.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org, linux-gpio@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v9 0/9] misc: Support TI FPC202 dual-port controller
Message-ID: <2025041525-smoking-among-4b51@gregkh>
References: <20250306-fpc202-v9-0-2779af6780f6@bootlin.com>
 <avat6oilygpkcngtpuyentyvjqifav4f3zzvrtnsdybfl6uqja@i2surd4ywu73>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avat6oilygpkcngtpuyentyvjqifav4f3zzvrtnsdybfl6uqja@i2surd4ywu73>

On Thu, Mar 20, 2025 at 12:46:53AM +0100, Andi Shyti wrote:
> Hi,
> 
> > Romain Gantois (9):
> >       dt-bindings: misc: Describe TI FPC202 dual port controller
> >       media: i2c: ds90ub960: Replace aliased clients list with address list
> >       media: i2c: ds90ub960: Protect alias_use_mask with a mutex
> >       i2c: use client addresses directly in ATR interface
> >       i2c: move ATR alias pool to a separate struct
> >       i2c: rename field 'alias_list' of struct i2c_atr_chan to 'alias_pairs'
> >       i2c: support per-channel ATR alias pools
> >       i2c: Support dynamic address translation
> >       misc: add FPC202 dual port controller driver
> > 
> >  .../devicetree/bindings/misc/ti,fpc202.yaml        |  94 ++++
> >  MAINTAINERS                                        |   7 +
> >  drivers/i2c/i2c-atr.c                              | 483 ++++++++++++++-------
> >  drivers/media/i2c/ds90ub913.c                      |   9 +-
> >  drivers/media/i2c/ds90ub953.c                      |   9 +-
> >  drivers/media/i2c/ds90ub960.c                      |  49 ++-
> >  drivers/misc/Kconfig                               |  12 +
> >  drivers/misc/Makefile                              |   1 +
> >  drivers/misc/ti_fpc202.c                           | 438 +++++++++++++++++++
> >  include/linux/i2c-atr.h                            |  54 ++-
> >  10 files changed, 965 insertions(+), 191 deletions(-)
> 
> how are we going to take this? I think we are at the last bits of
> reviews and it's time to plan merging this series.
> 
> Do we need to wait for media and then take i2c? Or shall wee take
> everything via i2c.
> 
> I had a look at the whole series and looks quite all right to me.

I recommend just taking it all through i2c, thanks.

greg k-h

