Return-Path: <linux-i2c+bounces-11114-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95511AC0985
	for <lists+linux-i2c@lfdr.de>; Thu, 22 May 2025 12:12:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5B041B61AF5
	for <lists+linux-i2c@lfdr.de>; Thu, 22 May 2025 10:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B15E828853B;
	Thu, 22 May 2025 10:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="G4Jk7NuK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CB818027
	for <linux-i2c@vger.kernel.org>; Thu, 22 May 2025 10:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747908731; cv=none; b=mjWVysRkzdcrn2h7UJTvkIfDE6NnXqCHtIX5hkcEQ3plveMb1H76c+bqyLT0xwxksTyl0LQsoYpMW8CLskuO8Bm2jlBL1Nyk1AYYfcrq14thmVv9AOPwkVC4DVG22oPUofhbbJF8LE8WhIyqkkNa5uFTxFhkdv6FZ3ORB8/E19Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747908731; c=relaxed/simple;
	bh=bnSUdK2lXeMpPqOWyA/0Y9zVP+s/O/C4wk6c9eUhpjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fJ2x6sHts4z8BzYZ91y13PB9yFcOyp5U6D7hEV0w6M7/78DCM5zZbUc598458D3g3CYj+eYI8m3rGsAtfeBx1oEslyjVrXUlZjHqWTafkOff6kGPCvmQ0nS2Ei0Z6K9Frf4DdVthIItwE5NDoQS+dCx8uS+sdtJx4aC2k7CXvHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=G4Jk7NuK; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=bnSU
	dK2lXeMpPqOWyA/0Y9zVP+s/O/C4wk6c9eUhpjQ=; b=G4Jk7NuKQ0AnU6XlrFiu
	SIq9EHWBg1rcbsyFLZQ9pJZsQDUGcxgSQGiBxdRixyO63NaHpc1UnXhYZ8lfwhrT
	z8qhetzzPFiGCkSiyS3fse5KpDYBqGwVuoCee2epSqAEvRh3UQZpfQZsMJhwxEIY
	lOQbmsV8Qddk/AneqHkTYzkGo6b1CQqZaxERII4R+41ojJWJdtZ7Y1Du+0CbjciH
	lVHVFZTABDTqmrYa5KNxcRt45uEuIMKlLi+2OYXcDa/OVTyDNWWa8Ua0n8LekMI4
	mWEssIBGfuWvtFKsbbwxCctWQUpbB9LEUlPt+9S9HsDN7MCKAhGkuIPC8q6jFkH4
	Pg==
Received: (qmail 3610525 invoked from network); 22 May 2025 12:11:57 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 May 2025 12:11:57 +0200
X-UD-Smtp-Session: l3s3148p1@CPAptrY1joIgAwDPXwj7ADHm2wGe7qss
Date: Thu, 22 May 2025 12:11:56 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Cosmin Tanislav <demonsingur@gmail.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH v5 1/9] i2c: atr: Fix lockdep for nested ATRs
Message-ID: <aC74bCOXhPl5F5fX@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
References: <20250507121917.2364416-1-demonsingur@gmail.com>
 <20250507121917.2364416-2-demonsingur@gmail.com>
 <aC7o_obqzBlhW0tE@shikoro>
 <20250522120713.7feafa47@booty>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="62XMAXwLz+/kICRi"
Content-Disposition: inline
In-Reply-To: <20250522120713.7feafa47@booty>


--62XMAXwLz+/kICRi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 12:07:13PM +0200, Luca Ceresoli wrote:
> On Thu, 22 May 2025 11:06:06 +0200
> Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:
>=20
> > On Wed, May 07, 2025 at 03:19:07PM +0300, Cosmin Tanislav wrote:
> > > From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > >=20
> > > When we have an ATR, and another ATR as a subdevice of the first ATR,
> > > we get lockdep warnings for the i2c_atr.lock and
> > > i2c_atr_chan.orig_addrs_lock. This is because lockdep uses a static k=
ey
> > > for the locks, and doesn't see the locks of the separate ATR instances
> > > as separate.
> > >=20
> > > Fix this by generating a dynamic lock key per lock instance.
> > >=20
> > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.co=
m>
> > > Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com> =20
> >=20
> > Your SoB is missing. I will add it for you if you confirm here.
>=20
> Mine? I didn't think it would be needed based on:

Ah, I was talking to Cosmin. Sorry if that wasn't clear.


--62XMAXwLz+/kICRi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgu+GkACgkQFA3kzBSg
Kba4CQ//c4plwCDlYO4chjk+dVfOF4RHFjNv1l6doF4ENZHW8bfFbWPzqd7L28OY
bXXJcK7obRJ6ynzVhEWYnzfDPsRs9UKqm2VTxVnKpAtpFvrezM3YiXDxg/lBy2W+
cpWG2wYkTcOL4safx6I+u2eWnsEFAzQgxCcx9j3vBN6mt6oJNZa1Iu9pwpLxs2Fw
CsIo7RT8tzyOC5lZlogKUxo5K7VieJ+WkrdI+0eJnHkhy/M/A67q1SJypd0+Fk4p
LZL6Wncw32htW1WVnWiOx8O9JGAEJSbuEQx93Nf6Hrm2MY8Q10+pCgBD8Ph0pMtJ
M6P5Zr0IdXhxquLu0pDVBW+is4xsjjL+l5kl+dlbf7OhMoVFSszTRkF5pE3w9uDq
kwtu5gN6HEmL3YmBq6jmR7sfBWCpPDzM/LKrKuEb3UKW0zd8JUcvZmJrfHrWjKTs
lODhQhe0CB5qeRDMcDN0p7GO9CB6UAXLiPl4ckLpoQMHiLHYqaRk1m59fo8vQnqR
nD9zf6koWo/WcmBmMyTteeLKWakRR/nf0MGKqQvpX6pX7IHnuHJh6tb9u2Gd2soW
nUpqi/tLvna82HlAMu5ssg8dyDaMdRJxAbkukiO2RYn53RgRuJLblVjy5ZzJ7Mht
X2j8C4k30j5aENnLJhVO6uvdecGV/aRbfNxsAlONmDP8sKapsF0=
=tKQD
-----END PGP SIGNATURE-----

--62XMAXwLz+/kICRi--

