Return-Path: <linux-i2c+bounces-5978-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2983E9675C4
	for <lists+linux-i2c@lfdr.de>; Sun,  1 Sep 2024 11:30:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5AC411C20CA3
	for <lists+linux-i2c@lfdr.de>; Sun,  1 Sep 2024 09:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 380CD14B084;
	Sun,  1 Sep 2024 09:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="MQAQkH3f"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AF51442F7
	for <linux-i2c@vger.kernel.org>; Sun,  1 Sep 2024 09:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725183021; cv=none; b=OilPg3vt0e+kOTXE2SxvfPn6uWeIxmPhzQLPtIooDd2iTHsctiIsE5XV779rkUqBZyvNryYR3AF8/sfG8BwdzG6C6KXvNlVXnQU7l/d25lq76UJ1oecRLfZqK57usJzSO36+I53H0OVzI1Xv22l+u9L9RsM60/M6xVn4oi6XT/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725183021; c=relaxed/simple;
	bh=r+TB8BcpnZIjlsX1oZx0Ik0xKz0sByNtqbh90INSPxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LN92eiDYs0Uxzyz/ScglecAWbdx3VH+yH8ETceYFhBx/EaBeTC8C/3UwaBUjUZ1N2xqfvujLegLQc/QEWySm+EELIzNDVE9ud15Nkqtk4vVPRQVBaXuBcQs9XJzQJ6K2+kN8y7tS7RyPXz8F2hEzfLD32In3YM3rh+i7XVdGbWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=MQAQkH3f; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=r+TB
	8BcpnZIjlsX1oZx0Ik0xKz0sByNtqbh90INSPxU=; b=MQAQkH3fc1zJk4T6L5gR
	SioCtrWagfO9Y762eb+L733zjtGdRN3RF8oonCsY87YLuOnwsR5JrldgvSZi1aAE
	Az2+8QqYGEiOzTc6bvnmgZQl7JcQyaIvzve70dcGj9iiv8j2DyIliroH0xzueMrD
	djja92tG1EHg+eq3Nu1j/MCNWNV2cwONECctLfnlh0cnzNO9OOfq5DwAZHyuKX74
	nu+bQBdLM3n6heAD864al+k20AdSyw8Aa8yNYXSMGJGI7ygOFO/qErIXkatXllOX
	ER+h9gmg4Za6WGaXstVskgHAwYTtbKlkvXDXNHkww7hzKt7bI0+Z9RByWP0Q/q63
	8g==
Received: (qmail 3764297 invoked from network); 1 Sep 2024 11:30:16 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Sep 2024 11:30:16 +0200
X-UD-Smtp-Session: l3s3148p1@UOHceAsh5LtegkeE
Date: Sun, 1 Sep 2024 11:30:16 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 0/4] i2c: Replace lists of special clients with
 flagging of such clients
Message-ID: <ZtQ0KMWUk9iAUCCl@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Wolfram Sang <wsa@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	linux-sound@vger.kernel.org
References: <3982b2a6-975e-40d2-bf02-2155e5c36c14@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gLxarFGjBp8f1UGO"
Content-Disposition: inline
In-Reply-To: <3982b2a6-975e-40d2-bf02-2155e5c36c14@gmail.com>


--gLxarFGjBp8f1UGO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 22, 2024 at 09:45:37PM +0200, Heiner Kallweit wrote:
> So far lists are used to track special clients, i.e. auto-detected and
> userspace-created clients. The same functionality can be achieved much
> simpler by flagging such clients.

This looks promising and I like the idea from a high-level perspective.
Need to dive into the details. However, I think this is 6.13 material. I
want to let it cook in linux-next for a full cycle.


--gLxarFGjBp8f1UGO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmbUNCgACgkQFA3kzBSg
Kbav6w/8DOVWcojXu8q93z6pWrKdVKiSG8L9VDJPSLEVvaDUafab7bFu1GPdw2kg
N3ga1J9DWPObd22kQs/2O//twLT8bnyapb3NO4GOqYzLAL0eYkCXQkQbdQve4pIe
Ffk3qi53t1DGs8rvPTF+QmmZKY8PdobW3TjPLXAm9/JO7A8XzRN8Q8z4H9Lm7rKa
DukB4eUTpfzFowFYcN9FvJELR5MSpW6bJuXX1/zBt/rbEhRe68mvG8DHfWqfRt2V
ypBfkQB82mDmycKYPqu78CYa/t+OMe+b7vleNuflHJUkFjtySQZo5xNzr5gt0Obi
edw0tlgg8RQL4dnEW5mPR/GO0tNnG7GY8N2BKSbNaI5NE/3Fuf7kNVWVd/JMp28a
wMJTp/AH3qJ1LuOdlLWlI4mVBOQZk77MJuQ8rC62TjElRs0eJ5bf95jMxPCgm/V4
ZnAr8LmZd8YNJL1u/iII8JBCeTKo7b0EjrbHp+WNW0WCS8N6GF4aNFGobqtBVvCr
/uX5Yfr6WKsRCKcUjf5rBuOCXQRUyTWecdss7X3HVYnNXCcxFBnFP7HJakQ45zQI
mLCUR0zs4uCeifgdTP+fUvcbbv9V8yWTWUnsQkeX6QDpnXlQEUwNtwdoe3s1ERxV
UEkM0mU5Tc9EwZqtWZbU/4dZNDEWGwvqVEl4ZJ13Su1XUG/bmms=
=vmEG
-----END PGP SIGNATURE-----

--gLxarFGjBp8f1UGO--

