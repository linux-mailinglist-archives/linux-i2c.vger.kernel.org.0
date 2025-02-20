Return-Path: <linux-i2c+bounces-9509-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB170A3D94A
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Feb 2025 12:59:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A04861787DF
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Feb 2025 11:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AB181F463D;
	Thu, 20 Feb 2025 11:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OYQk5/m+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBC41EE01B;
	Thu, 20 Feb 2025 11:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740052682; cv=none; b=i2ZDmavDD3t8jwjx22CPe2gdSkTd/alEvSggKcBZivPLsWKWv+64XrsV82pXqHZrgCf4FQB2tw1XIOJncK7BWmQnepcn7B9WYFp/Z3XBLNAIrN6PP65oJJvHUo3/GUP1uIQHtk/W712CPdhHlI6xbvZNsYiOBz2CjuHpeKzDglU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740052682; c=relaxed/simple;
	bh=xzdjmc6Zu7NGxG3snHemKuaqt3sbJFF8/MyJnhH7hL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nRQubtmU0XPhZZX5GJfVCWxSwSSHpX9aI8TkiBn63JKTVeYSdgs/i6Ktd1H1rpXlAFYRAGfPO4euXuPROP8bM2rlxqI7kID0KsINA52mrN95Rm6EdlZH+8jdWuG6vLbzgjoP0mr7Me12D83gpuzKzGTVTKLayfgXUPBtQ+TCKrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OYQk5/m+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7F35C4CED1;
	Thu, 20 Feb 2025 11:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1740052682;
	bh=xzdjmc6Zu7NGxG3snHemKuaqt3sbJFF8/MyJnhH7hL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OYQk5/m+q4+SX590M3C8ExzIey4Gr8o6swzJLstXWEQUMeivRgxVwSLp/EvD6m1js
	 ULAgM57l3W3+XGNQBYT2romFBcBrzjYmpy8isN9oaMoHhLPuw1QqxBHaqjqJU8+dv6
	 H0ItEiDmasjRtbE4N7J2sLPxZfAXq12HWax7/LSQ=
Date: Thu, 20 Feb 2025 12:57:59 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
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
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v7 9/9] misc: add FPC202 dual port controller driver
Message-ID: <2025022038-hangnail-rehab-c145@gregkh>
References: <20250204-fpc202-v7-0-78b4b8a35cf1@bootlin.com>
 <20250204-fpc202-v7-9-78b4b8a35cf1@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-fpc202-v7-9-78b4b8a35cf1@bootlin.com>

On Tue, Feb 04, 2025 at 10:29:20AM +0100, Romain Gantois wrote:
> The TI FPC202 dual port controller serves as a low-speed signal aggregator
> for common port types such as SFP, QSFP, Mini-SAS HD, and others.
> 
> It aggregates GPIO and I2C signals across two downstream ports, acting as
> both a GPIO controller and an I2C address translator for up to two logical
> devices per port.
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
> ---
>  MAINTAINERS              |   1 +
>  drivers/misc/Kconfig     |  11 ++
>  drivers/misc/Makefile    |   1 +
>  drivers/misc/ti_fpc202.c | 438 +++++++++++++++++++++++++++++++++++++++++++++++

as this is a i2c_driver, why isn't it in drivers/i2c/ somewhere?  Why
misc?

thanks,

greg k-h

