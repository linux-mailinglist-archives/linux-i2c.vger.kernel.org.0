Return-Path: <linux-i2c+bounces-8219-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C329D9325
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Nov 2024 09:16:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9620B2474F
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Nov 2024 08:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FB16190674;
	Tue, 26 Nov 2024 08:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="V5oL0VAC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9578C13CF82;
	Tue, 26 Nov 2024 08:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732608978; cv=none; b=A/7N4lmu2UI7xeAsY4LDl6xtiqzXldegspqss3vZn8i+QcgAksIgrlpYUp87hHaJ/TKw4DqqZk/Tmgn98fHmHA0egn46ug7gXTyG0kFoFNpRShq2tmTtnQKfNpmCS6uvE6f6VNCl62zuPGZ9eP8cjqW59EtbZXBM/X7uDHPAc2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732608978; c=relaxed/simple;
	bh=QXwbDP4Z4sV1LF17o8Mw5cx1oKbkmRVQnzBwopM2RQI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R+LGYwEUQJ0r6BUJbZjWfmF92p8oGnbUTsh+MLy3du3ATMpyDobs4V2SGAtUfreElbQyk+9akBxisJwk0IBJUg8U1b9Z9TrGhfdUn9viOVnN9VgxicSYjBJdTglQY0jgatAyKKSD3zDu+YRrtusc7V9nv/1f7CuCvYTNlfWegMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=V5oL0VAC; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C8289FF803;
	Tue, 26 Nov 2024 08:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732608973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2d3daDS5xfPMdBBOnIgtu96H9R4pF59SAaCskcIasBg=;
	b=V5oL0VAC1Llc0icyBlnrJqeVjvkty1ByCA3DMPyxx8jJmFfcE2kpHeLghpbLCFNVN8XVkm
	9hL0yfhe/T+gwSpkSqgxI7G59RYDC4Vq53f+Gwa/iyZ6y8o5RF337AilAQYFiXZDYgi/m2
	ygRAfG/y6mvD+MuZD8TFakfVxM40PPW37y5RIk4IeqVt8g9gSR/q6fM3SeUxumPTRRWrwI
	fp33FiweZvLfgCr8PVYyZFZ03Q6eCX14pr2Fvm274PyqnXANga0aj6IAtxJOC0JQwXJCpr
	+yhmr11k8WkeOcBW/oLSBVWUIMJ3YjArfWormRi39L+aQQGcubvQExtx/XpcFQ==
Date: Tue, 26 Nov 2024 09:16:10 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Cosmin Tanislav <demonsingur@gmail.com>, Tomi
 Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Romain Gantois
 <romain.gantois@bootlin.com>
Subject: Re: [PATCH v2 2/3] i2c: atr: Allow unmapped addresses from nested
 ATRs
Message-ID: <20241126091610.05e2d7c7@booty>
In-Reply-To: <20241122-i2c-atr-fixes-v2-2-0acd325b6916@ideasonboard.com>
References: <20241122-i2c-atr-fixes-v2-0-0acd325b6916@ideasonboard.com>
	<20241122-i2c-atr-fixes-v2-2-0acd325b6916@ideasonboard.com>
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

On Fri, 22 Nov 2024 14:26:19 +0200
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:

> From: Cosmin Tanislav <demonsingur@gmail.com>
> 
> i2c-atr translates the i2c transactions and forwards them to its parent
> i2c bus. Any transaction to an i2c address that has not been mapped on
> the i2c-atr will be rejected with an error.
> 
> However, if the parent i2c bus is another i2c-atr, the parent i2c-atr
> gets a transaction to an i2c address that is not mapped in the parent
> i2c-atr, and thus fails.

Nested ATRs are "interesting", to say the least! :-)

I must say I don't understand the problem here. If this is the picture:

  adapter ---->     ATR1     ---->     ATR2     ----> leaf device
                    map:               map:              addr:
                 alias addr         alias addr           0x10
                 0x30  0x20         0x20  0x10

Then I'd expect this:

 1. the leaf device asks ATR2 for a transaction to 0x10
 2. 0x10 is in ATR2 map, ATR2 translates address 0x10 to 0x20
 3. ATR2 asks ATR1 for a transaction to 0x20
 4. 0x20 is in ATR1 map, ATR1 translates address 0x20 to 0x30
 5. ATR1 asks adapter for transaction on 0x30

So ATR1 is never asked for 0x10.

However I'm very likely missing something. Can you elaborate with a
practical example?

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

