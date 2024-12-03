Return-Path: <linux-i2c+bounces-8309-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B36FD9E17E8
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Dec 2024 10:39:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78D53281041
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Dec 2024 09:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76C481DF272;
	Tue,  3 Dec 2024 09:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kKZ19qM6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80570181B8F;
	Tue,  3 Dec 2024 09:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733218779; cv=none; b=I154X9iIHTZrewRjRwW9/wXh53ATXqVBAR27HAJJIypr6YA1iaiP2HGLaFffAsGiY6u0mRcVRALiyHSJJyl9Ew+9qLaZq04ntngrA+Kg1NI4VKK9DwBDzzYRNNc69Sv+wUFUeMj37i9N7FlIGt0hIekkfAAsRK86Nvdyn4dvnpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733218779; c=relaxed/simple;
	bh=OnRvcO9ff5GeDassvmP1g8WmIJjTqDGNnMD3/SIR0aM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tyst08vOGnE91HoqF7nop6jcxUNrS/cP1mkSlYK6BAHzpZC1m+/qZVpCmXTRBEweFpngpUgPjiYh8NbJsMVRJO2ztWwCNKw1PzSBHF+Wz9T6x2uCIUXSuyB+8u2VXlSlX6k1C84V3k8LZ4cBELMP1Q9w1dBJGGnpDxotWA//+KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kKZ19qM6; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 79C2BC0007;
	Tue,  3 Dec 2024 09:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733218774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v6zNT53T8ioxvldB3XPoiSk/CN07S+/FHZ5EB5jmDQo=;
	b=kKZ19qM6wVfiFSOLJbEfceZEnoTZipZnYd5ErrkqxCG0c2zp/yF993MZr2OFZKVUpiM0q9
	nr1RfMnpryAfh9nZ/DA4JmiNL/rDcowKiKxzx/cu4LZ1lPrf0PgKiEv57MuUXNPInLxYer
	cmOoSccBYLoFlTvOpaE/4T0nLH1qNM+nR4w+UCHbCalB0Kf2DWulFjnhFnZdiyfWxK45r5
	3648YkooaJMMlpXX9oSq+bxc9jTJU6h5AsTBGFDDaOsqdbbpKti9JlD3lBHbAdyc6J7PRE
	YSa5cfqL5XMm4Fce1PYyZUB7DiH5FfHioX6cIB9wTemR0PrfkBAa75wlb36mNA==
Date: Tue, 3 Dec 2024 10:39:32 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Cosmin Tanislav <demonsingur@gmail.com>, Tomi
 Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Romain Gantois
 <romain.gantois@bootlin.com>, Matti Vaittinen
 <Matti.Vaittinen@fi.rohmeurope.com>
Subject: Re: [PATCH v2 2/3] i2c: atr: Allow unmapped addresses from nested
 ATRs
Message-ID: <20241203103932.3cd412bc@booty>
In-Reply-To: <9bae963f-037a-46e1-abf6-f2ec464c4cf8@ideasonboard.com>
References: <20241122-i2c-atr-fixes-v2-0-0acd325b6916@ideasonboard.com>
	<20241122-i2c-atr-fixes-v2-2-0acd325b6916@ideasonboard.com>
	<20241126091610.05e2d7c7@booty>
	<b954c7b7-1094-48f9-afd9-00e386cd2443@ideasonboard.com>
	<20241127131931.19af84c2@booty>
	<30732dbb-21e6-4075-84b1-544fc6e6abce@ideasonboard.com>
	<20241129125340.0e2c57d9@booty>
	<9bae963f-037a-46e1-abf6-f2ec464c4cf8@ideasonboard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com

Hello Tomi,

On Fri, 29 Nov 2024 15:31:45 +0200
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:

> On 29/11/2024 13:53, Luca Ceresoli wrote:
> 
> >> So strictly speaking it's not an ATR, but this achieves the same.  
> > 
> > Thanks for the extensive and very useful explanation. I had completely
> > missed the GMSL serder and their different I2C handling, apologies.
> > 
> > So, the "parent ATR" is the GMSL deser, which is not an ATR but
> > implementing it using i2c-atr makes the implementation cleaner. That
> > makes sense.  
> 
> Right.
> 
> But, honestly, I can't make my mind if I like the use of ATR here or not =).

Hehe, indeed, hardware designers use a lot of fantasy in stretching the
I2C standard to its limits, perhaps more than actually needed.

> So it's not an ATR, but I'm not quite sure what it is. It's not just 
> that we need to change the addresses of the serializers, we need to do 
> that in particular way, enabling one port at a time to do the change.
> 
> If we forget about the init time hurdles, and consider the situation 
> after the serializers are been set up and all ports have been enabled, 
> we have:
> 
> There's the main i2c bus, on which we have the deserializer. The 
> deserializer acts as a i2c repeater (for any transaction that's not 
> directed to the deser), sending the messages to all serializers. The 
> serializers catch transactions directed at the ser, and everything else 
> goes through ATR and to the remote bus.
> 
> Do we have something that represents such a "i2c repeater"? I guess we 
> could just have an i2c bus, created by the deser, and all the sers would 
> be on that bus. So we'd somehow do the initial address change first, 
> then set up the i2c bus, and the serializer i2c clients would be added 
> to that bus.

So you think about another thing, like i2c-repeater, in addition to
i2c-mux and i2c-atr?

Well, I think it would make sense, as it would generalize a feature
that might be used by other chips. However at the moment we do have a
working driver for the GMSL deser, and so I don't see the benefit of
extracting the i2c-repeater functionality to a separate file, unless
there are drivers for other chips being implemented: this would motivate
extracting common features to a shared file. IOW, I'd not generalize
something with a single user.

[Interesting side note: the i2c-atr has been implemented with a single
user, violating the above principle O:-) but I think that was due to the
similarity with i2c-mux or something like that. Out of luck, another
ATR user appeared after some time.]

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

