Return-Path: <linux-i2c+bounces-8299-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6927A9E084F
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Dec 2024 17:21:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EAA22866D9
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Dec 2024 16:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EB93188583;
	Mon,  2 Dec 2024 16:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RGLLq2CG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF954204D;
	Mon,  2 Dec 2024 16:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733156513; cv=none; b=Sv5po+pT/k3SIWx3Hg/GT+9w3csgr+NznmeOQ/F6rtQNqc1JtQoyJwj7+yMGI/3eDlg/0v8y1Pk3lJ4nZv5Gy9ppH3iCOMH8J1YQTyXd2Jw0V2digUB+Vd+JfVVVI4spA8Q2jGxaktdqv2HtatfBied5nE3AYOrxI8UWzEDqhT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733156513; c=relaxed/simple;
	bh=FuuewJd0xgy6SswgETCkr24Q/CXWixc+DK17YLD4yHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mFdqJ0XAUb2X3xdqCwQv1cI71F0bZ6EwpweGT3v2QYITUdI23nmtIoTpkue5LChXlfp0BLRmFVwNCHYQylliDr1OvpAuEWzP733BEhDL95YeJqyYPeMAd0M60wtGIpd5rqT/o7D5AzLSSVe+J0QhflHQgN61TpIySN4hcnnWk1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RGLLq2CG; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6B1202000B;
	Mon,  2 Dec 2024 16:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733156503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DWuQP6dS8+NmZBcntvso++MRt6a15SWWGT2AIb959RI=;
	b=RGLLq2CGoEjcqd+gKN/ktqXtcE8p1p5n8+b28cqBMhsW/NEVNEAkFoELeO4IgCvXkdkr2/
	hlaVtg7P3s9OTtE89/4hRw300qW6UZg60Oj62JgNOuSOVtlNcU6AR0dx5XJ3c1yQG7ARRC
	f6X5XPp2QrpCXVpFT8/MLk2h1WjSnsY+jR7+jI5FEIXx+TUXf37c+r/Zf1QEQbEW0StumV
	w44ypUVkND2+h0asZXYHzSUfBZo1trPLPih2D7tRe1o2LqCXClu2+XTssFxA3aWaNQe08l
	zZ2xqytw1NsJBTWpM/CPqxjgJ2SghL+v8Zwilmme+h+r7BELz9It2SxONPvDPg==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Cosmin Tanislav <demonsingur@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH v2 1/3] i2c: atr: Fix client detach
Date: Mon, 02 Dec 2024 17:21:42 +0100
Message-ID: <12772983.O9o76ZdvQC@fw-rgant>
In-Reply-To: <20241122-i2c-atr-fixes-v2-1-0acd325b6916@ideasonboard.com>
References:
 <20241122-i2c-atr-fixes-v2-0-0acd325b6916@ideasonboard.com>
 <20241122-i2c-atr-fixes-v2-1-0acd325b6916@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-GND-Sasl: romain.gantois@bootlin.com

On vendredi 22 novembre 2024 13:26:18 heure normale d=E2=80=99Europe centra=
le Tomi=20
Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>=20
> i2c-atr catches the BUS_NOTIFY_DEL_DEVICE event on the bus and removes
> the translation by calling i2c_atr_detach_client().
>=20
> However, BUS_NOTIFY_DEL_DEVICE happens when the device is about to be
> removed from this bus, i.e. before removal, and thus before calling
> .remove() on the driver. If the driver happens to do any i2c
> transactions in its remove(), they will fail.
>=20
> Fix this by catching BUS_NOTIFY_REMOVED_DEVICE instead, thus removing
> the translation only after the device is actually removed.
>=20
> Fixes: a076a860acae ("media: i2c: add I2C Address Translator (ATR) suppor=
t")
> Cc: stable@vger.kernel.org
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/i2c/i2c-atr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
> index f21475ae5921..0d54d0b5e327 100644
> --- a/drivers/i2c/i2c-atr.c
> +++ b/drivers/i2c/i2c-atr.c
> @@ -412,7 +412,7 @@ static int i2c_atr_bus_notifier_call(struct
> notifier_block *nb, dev_name(dev), ret);
>  		break;
>=20
> -	case BUS_NOTIFY_DEL_DEVICE:
> +	case BUS_NOTIFY_REMOVED_DEVICE:
>  		i2c_atr_detach_client(client->adapter, client);
>  		break;

LGTM, tested on a TI FPC202 ATR.

Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>
Tested-by: Romain Gantois <romain.gantois@bootlin.com>

=2D-=20
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




