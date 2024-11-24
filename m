Return-Path: <linux-i2c+bounces-8172-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D84389D7579
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Nov 2024 16:48:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AED3286932
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Nov 2024 15:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59DDC42AA6;
	Sun, 24 Nov 2024 15:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="YUuHn+6F"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FDEA954
	for <linux-i2c@vger.kernel.org>; Sun, 24 Nov 2024 15:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732463291; cv=none; b=enSnKHpc0x1a8yL+cEGmXO7AEoY5O4+mFC4vL0rj4BbRj+BKWAAQLN+PS1k3hCVGJdat6bLR0Ylu94ppOtGCC7kEFQtFCJqFgjWrXhp6ZIxUApyAhvqSWs2DLxftCCaw9DTjWI/LniqI9U1NGfSHN5k9On/zt1MZMrBWJ4huLhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732463291; c=relaxed/simple;
	bh=WoFBI2ToOQXM18m7nwByx6gUqArVMwR9rHho2Ig1tFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ty2HSeAsaUNvEbpu3+Akf0Dur6yfzl2+t5xxv3AMK289UrXjGMe4H74ZHfupNZ0v0k7YlQb1ndO9mceaJ3p6GVaqQkSMMgMcG6mQX27C/2HYP3dFcA31qi6vIOaPVO/KbN0Uqo1FyExg6n9BoBH5oMJjUw9JsuhPgA2TuexdTjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=YUuHn+6F; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=sbtF
	E1waGuD11+ugS/3CU0fMlhVVs+uUSBlR7CO+Y9Y=; b=YUuHn+6FJxzuYhkGX7Cs
	L/cD1wsmQ2paL0oTh6Z44pbyxRq4nEpdQYSDxTIg8Z8Uphl8IdYNxM6ZIuCP7i+4
	nyengqxooHb4SsLliz6XxwTLXflhNGg7oixGIzXP7WtwsDfGxD4Z/i/IwF+hCB/a
	QqvxhPoPnIpEPKXJqVW+gaRk3iJEtqnDjlp9By94+i9DN22ULhreWZ84ifi3a6HW
	vo4GQwOmvhSAZytcGyL14o4gOozpbam+sTp+WdSluLL3/1j+G9jXAqwY5yC1a326
	trMMjj8xDkc7ihwWUUW2eXqsE9IhF8HMzwSmIMGkOMf+hdqLgiHz8Qw3MCTbXL6R
	2Q==
Received: (qmail 2191022 invoked from network); 24 Nov 2024 16:48:07 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Nov 2024 16:48:07 +0100
X-UD-Smtp-Session: l3s3148p1@B7jNiqon9uhehhYY
Date: Sun, 24 Nov 2024 16:48:06 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 0/4] i2c: Replace lists of special clients with
 flagging of such clients
Message-ID: <Z0NKtrqtJA-vo17k@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Wolfram Sang <wsa@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	linux-sound@vger.kernel.org
References: <97970201-24fd-473d-b20a-d21d2cd468f3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lqMR+TZvDAePcz1I"
Content-Disposition: inline
In-Reply-To: <97970201-24fd-473d-b20a-d21d2cd468f3@gmail.com>


--lqMR+TZvDAePcz1I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Heiner,

On Fri, Nov 01, 2024 at 11:05:53PM +0100, Heiner Kallweit wrote:

> So far lists are used to track special clients, i.e. auto-detected and
> userspace-created clients. The same functionality can be achieved much
> simpler by flagging such clients.

Sorry for not having the time to review it in time for 6.13. As we found
with the last version, this really needs in-depth thinking. We will try
again for 6.14.

Thanks and happy hacking,

   Wolfram


--lqMR+TZvDAePcz1I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdDSrYACgkQFA3kzBSg
KbZ4xw//ZJZSf3S+3WClB8PBHVZjPh0Gio4kYGJHKtPJ9JzOOcXu3BlpxfPvbIUQ
QY+olR1EqAtHGYqv8Xg4fcgVRsSUwyWpJNuP9x0dc3H4tvFcDW5nktV7WCz8k7BI
3X9+cSWlKS7b+TxP5YwCZjCbi2qdqoKqgQZhWBGUWtrVckIak6CTM7De/szLY50T
zTjWqjOyiJRYxf0SV1ae1VFrv7Njm5QMkuuGhJtG/zTPS7Q0NQd2rmJycJ3/UVxo
oVNEh0p9m2+RYt1o5Av00khkd/p+XaAjI/cREPJZRaRc3uS1GP4VZdWKk/EBa1Bi
Gy6NwLVBIN4QxhNHKU9lBzEvEwJyZZ8H9AaBcSim2KA1UpKdM5phX8OPuT0RApDi
3Bo28HyrplLWl0jpP6UqdmkKjvwfkOZMFE57hIa7EZaWfk/o1QzDdxWrSZ6S/nmX
GZhK06CfhG8PCw4VeAjOkJwbMLzBPCSiwtahTLvz1qmUiKv74qOyUBExOWS8//gR
Lwzn8sPme3kKgAm2JfLTQOaqNid7L+VkYaGBDmRGyxuNIbXK5vm3A/G6J6q37Gbx
zURY0rLvB/hGuf1V4y6WMwiAi1YljQ+hfskh/MtmLHccoasw3fuwUV4YpXpTw1wI
NsD16moUNTN2rZ3uwRqh8FE5oMoDpNr4EcUluG21PVG8d1Vf3+A=
=qotN
-----END PGP SIGNATURE-----

--lqMR+TZvDAePcz1I--

