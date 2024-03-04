Return-Path: <linux-i2c+bounces-2128-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B416886FB11
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 08:46:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 527D51F2289B
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 07:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DB3514A93;
	Mon,  4 Mar 2024 07:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KDovF+qu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F339653A6
	for <linux-i2c@vger.kernel.org>; Mon,  4 Mar 2024 07:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709538366; cv=none; b=Pv8OykCoVzp7f/wChXFvRXrrNitgdrdMroobPDXAg70d/K5VWbuWQug7v0ylHoGgi50xVvezo8yMK8tiYl3vlZ8C2gJK5IiWZoiYsPwvjj6Z+dqOE1iyhijhWpQZGDtM1MiBX+sXf7jeZ3T/pHfofdpe1egps/xELum/ZzRTecw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709538366; c=relaxed/simple;
	bh=P+DHtjXbJGmaldU2eaYU2ZfTWCngqC8V5mGM5t4AL4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oOI0WWnzZvexVh9s1rP27c6CShV8SKecLrX16bLIjOhx0JvtsslZPnS7nUyTLz8MCaAhktLITQHJLpR98MAomqvW+Pgx890nF5MSP4K/X6LHucK80bT9OKztnGxjincEXeMTKCgdNaCgiUZTU2mqWrUcRk9DivIcikNaQTIWXvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KDovF+qu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEEF4C43390;
	Mon,  4 Mar 2024 07:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709538365;
	bh=P+DHtjXbJGmaldU2eaYU2ZfTWCngqC8V5mGM5t4AL4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KDovF+quem6qR0emCTw+kYBXMCPgfoE+G0zuwDpN3kwBF9ktJcUwDtueYUZfH7K26
	 R+A5tW9IR0Me8hTODajEx6H0iLFgKPWLcDA2ko+GRw4Ol/QCj7LIBX2de1DtT8AYhV
	 SnaYmTWa3szNyU5K+ZL4Zf5MoBxk1/QZmPTf8bcoD38yHGSV+COt3Crn24qBehJ3im
	 7TbCIL4SHpSbEj5Qr7/flL6O2P8jSq2biK+5jgNwndyGG4ftElMzE6xBGZrLwb7oZK
	 epnNwfQ4tp6mVrDsmb55hfg/nGVLwQM8QCHth5twuChfD+uaDsKDShf/NBxwAQCUlg
	 Pg+QlyxWz3rRw==
Date: Mon, 4 Mar 2024 08:46:02 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Jean Delvare <jdelvare@suse.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: smbus: Prepare i2c_register_spd for usage on
 muxed segments
Message-ID: <ZeV8Oi-j8L7ugyhR@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <d0b4aa2e-8b5d-4c27-8aab-164a089d95bd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="InYlFzGXk3uUnShi"
Content-Disposition: inline
In-Reply-To: <d0b4aa2e-8b5d-4c27-8aab-164a089d95bd@gmail.com>


--InYlFzGXk3uUnShi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Heiner,


> +		dev_info(&adap->dev, "%d/%d memory slots populated (from DMI)\n",
> +			 dimm_count, slot_count);

I am still in favor of removing this. I don't like the inconsistency of
the printout depending on the bus being muxed or not. We still have one
printout per device instantiated.

If you agree, I can remove this while applying. If not, then I'll apply
as is. No strong opinion here on my side.

Happy hacking,

   Wolfram


--InYlFzGXk3uUnShi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXlfDYACgkQFA3kzBSg
KbbEsw//RaMptByysNFkV9KkbbzMAtQ7S/ogqNJHqXjbbCDpqmCg5mzxq/pv6+j7
JRVyWb/iWmQJYwofmSmECTXgQbT6uj9q879dCW/a+YoPGgoX9SRrCL7Ue9yDF+je
U3JE/B4s6DqZCs22V+ao7/K/LwE2Y4gbXWD0j8xAczd1JekxtPjx91mOEnIjZNTR
OAlUU5mdllzhTLGYEJMfNSKfNpyN092WxXAe76Fn4504KNSDZ4qZDRojhL7HHnR7
3c/bZiZuKNU7OdTKP52550oFPngZ6Iz5ERpJqKiiI5yR/IjmWbJCJzfKAh/dWOOt
9aJesveV/Itd9VQZCAkIxwcI/s4S8GzDMRaDYuNA6LbLieVDj0Kjf6gyn8V3xdp1
NvyF5vyTd5nGrYQKjRJkQLP6cMVZvGFS64XWZJGdTXxQWa0yNeMCo2zC2ubMgOl5
HIZPbw6pfaL7ikHokbho9i3Lej8DyDWJKvExJjSm+7BQp6VkLwAlCxxP3uYMH4m3
TSae1sYlI719T3sry54yord8+lYLTfJaR9aJWLonD4w5FdNB8vwjJ+B0SxOEP9+D
5g6GJng7HG3WhXw8FPJ1Bdvy2vzT/t/0p1kyLyY5XkaR19HTppylEwy21bv7LLT9
3M5nBCZM51tk473er+1TxL093WEb9ay+EmEStpBlPPBU1kEQ6cY=
=2eSV
-----END PGP SIGNATURE-----

--InYlFzGXk3uUnShi--

