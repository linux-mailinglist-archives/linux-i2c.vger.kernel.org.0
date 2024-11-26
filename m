Return-Path: <linux-i2c+bounces-8218-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 941609D9321
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Nov 2024 09:14:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3F1F166356
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Nov 2024 08:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73EB1199935;
	Tue, 26 Nov 2024 08:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OtIO9b/X"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E23195FEF;
	Tue, 26 Nov 2024 08:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732608888; cv=none; b=JAQhoht/3Pb0IkUD/Nqu2xZf7nx7DG+J8IGoHconFO+znWD5Hu2U28IHwuruSwfBKa8lHhezzidgp31Qp579cw8y1gp4Cq3xKefBnr0QuNE4u3rYjLdnIxzyxNjU6pw9SDBtRiPaup3Fqwa5MTyWRwJNH56zmRJzaUAXMjfmsow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732608888; c=relaxed/simple;
	bh=d+W6oEGagjOlO132h9isVYkwbKYe0dZdo5HJ4iTtJck=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sZXVv/+pcTd1mCT9ytdt1Foh2rEIxRwvZymUZ0scuD0T26e2QqYpSeEKjL2h6ImyKLXuxnBqLGLmAolDLhS6I8PZYREsrazUO48GiqnrVnmmLtXj9nPm+LlTPq3xBf40TAsupkxKX7WnQbyoCbAKneh4EPDlcvEtCbiQnhbAbas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OtIO9b/X; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E87AC1BF20A;
	Tue, 26 Nov 2024 08:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732608884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0KBdHG/CxCQsHvXhWUwBJsOdE18Osim3Vs/pu+kM5KU=;
	b=OtIO9b/XZVXjD5ehh7AoyyWv2sIsym4Wm1f/gwSOKlmvGH6b0L3KkRQ8KZCXWdyIFghxcB
	vlXzSRqhabwdNAtB/O2ZcNxLHtAebeiaVOKqz5vVkuPEt77Ez/PCbFGk41LROBe2BVze16
	KEwOP6FwgV7VEmJCCgh48EJNajkMlxDDp5+g6N9NtUZa6NaPkb7oHc+OEc122h72j4lqVy
	jE47tofmSXgZ/3udtipnakOl5JpSGswy3DNmjfALjhNIl1THc9+wI1LuE3o7GR4r0y4UWP
	q4x0fFY/+Tr16ZSuVG05KgFG3VlRHpHwOdKfYJS63tfCsW9HpXWA4GRHhPnGkA==
Date: Tue, 26 Nov 2024 09:14:41 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Cosmin Tanislav <demonsingur@gmail.com>, Tomi
 Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 stable@vger.kernel.org, Romain Gantois <romain.gantois@bootlin.com>
Subject: Re: [PATCH v2 1/3] i2c: atr: Fix client detach
Message-ID: <20241126091441.345d4493@booty>
In-Reply-To: <20241122-i2c-atr-fixes-v2-1-0acd325b6916@ideasonboard.com>
References: <20241122-i2c-atr-fixes-v2-0-0acd325b6916@ideasonboard.com>
	<20241122-i2c-atr-fixes-v2-1-0acd325b6916@ideasonboard.com>
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

+Cc: Romain who is doing a different kind of sorcery on i2c-atr.c, so
he is aware of this series.

On Fri, 22 Nov 2024 14:26:18 +0200
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:

> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> i2c-atr catches the BUS_NOTIFY_DEL_DEVICE event on the bus and removes
> the translation by calling i2c_atr_detach_client().
> 
> However, BUS_NOTIFY_DEL_DEVICE happens when the device is about to be
> removed from this bus, i.e. before removal, and thus before calling
> .remove() on the driver. If the driver happens to do any i2c
> transactions in its remove(), they will fail.
> 
> Fix this by catching BUS_NOTIFY_REMOVED_DEVICE instead, thus removing
> the translation only after the device is actually removed.
> 
> Fixes: a076a860acae ("media: i2c: add I2C Address Translator (ATR) support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Looks good:
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

