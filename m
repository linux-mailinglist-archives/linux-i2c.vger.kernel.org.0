Return-Path: <linux-i2c+bounces-7263-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F34994315
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 10:59:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6032D28AE5D
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 08:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A47811D9586;
	Tue,  8 Oct 2024 08:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="L68B8H2/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69561D90C5
	for <linux-i2c@vger.kernel.org>; Tue,  8 Oct 2024 08:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728377440; cv=none; b=Bl9XHAuPWCuw5hIo2HSsELy7jJHrmvAT071utZzNKOn1raEUwGeDEdvuhRMFfZuxBbgn2YwkRwCN0wmOnoKP6mlR1b7+Rs9ZglMQkf7Xg3//X3a+FWRWKXta2VnwgbOO4swB1GQj13TqHOuR8JbWlSK9gjhhClEhjaN4tmWGkGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728377440; c=relaxed/simple;
	bh=lrT6fMr2/ppfIZSRniekC0FkJMBfc7PsCQMi0ZATjA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cPKkD+RfNXbDdKazK4nB/FTjQiTJb50ltsxizmQld1vZm6ixgLpg78OFTTuow+n8UEzXDfY4qloXC3evPkEmItlGPn/tsFQmaQzhtduHzrMwYbH9JIyb8EEJd+E2Zr4CM8/Yn5k3DDfLIBMx5aF/eQ4PcrYDbfvcui6mVGnqsuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=L68B8H2/; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=3EuM
	wGrVMu3HWXwYDJiu3Kf3fd057R4IjjU26QdnaFo=; b=L68B8H2/80PpltdiY4Mb
	ajlPth/Sl1QGCJ/VIo71UrdPGCOjP1ulGCBcuxhWDkgXSZcm38J8pAP6/RxuLCX1
	s1/ae0Xltk2Ijg1y5+nfIdjIE+QWAi9ZxqjsZmaWz+E/icsDALnTkKrH2JopJT6d
	zNP2HniTNAUzjTdKI+Ik+coXJrpfG+9QLALhcST2AeLdpUgTZIWnMWyWYLEG6McE
	quhuwp3Hne5Yq9VFUsUaDxOM2Jfb6o/WnVDM6ijVivIermQNlyxtFP6P1YqBPnz2
	LKYjmcneNEa+I5u9RUz8ccKOanTC/N4qzn8jRMJXDpKf34b0Y+rC/IIzrDwfwiki
	BA==
Received: (qmail 407310 invoked from network); 8 Oct 2024 10:50:35 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Oct 2024 10:50:35 +0200
X-UD-Smtp-Session: l3s3148p1@n84JO/MjFghtKPHJ
Date: Tue, 8 Oct 2024 10:50:34 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 2/4] i2c: Replace list-based mechanism for handling
 auto-detected clients
Message-ID: <ZwTyWgNtr17bUjus@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Wolfram Sang <wsa@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	linux-sound@vger.kernel.org
References: <3982b2a6-975e-40d2-bf02-2155e5c36c14@gmail.com>
 <d52c2722-5f2e-4224-a8b3-7c9d0cb431d0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nnV87Hoe0G0aHPS6"
Content-Disposition: inline
In-Reply-To: <d52c2722-5f2e-4224-a8b3-7c9d0cb431d0@gmail.com>


--nnV87Hoe0G0aHPS6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> @@ -1723,11 +1700,6 @@ void i2c_del_adapter(struct i2c_adapter *adap)
>  	}
> =20
>  	i2c_acpi_remove_space_handler(adap);
> -	/* Tell drivers about this removal */
> -	mutex_lock(&core_lock);
> -	bus_for_each_drv(&i2c_bus_type, NULL, adap,
> -			       __process_removed_adapter);
> -	mutex_unlock(&core_lock);

Isn't here some replacement needed to delete clients when the adapter
goes away? AFAICS they get only removed when their driver goes away.


--nnV87Hoe0G0aHPS6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmcE8loACgkQFA3kzBSg
KbYyYw//WXRzp3f0BBV/VNpDWUbadDzfL+2MC95YJ+V/R1SOF9ZtiF3Xnyq6MyuH
maR5nnS4vVdcAv4PrBqz1wR/eOhdDLiA0FZZ6Sub5xIj5Im+EZESWA7ZSB4y4Bgc
cuJShTdwS7KXe3OrUqZ/ePF/ltXnIRnUMKm1V9SHGo8oGOr5vAIAmq+FuWvg7uXe
FiRTq2a8derFJqHMEJt5BnAkB06lrmkHDFCrOw6rlN9PwTPoe7cu+Dk1ajVCTs4v
Jyv0fz/VcvQF6r6ps4xdiNLqxehr4jM5kvmPnLnW8zqaX0AKU6aD6eAqwH/QP74y
IuE7dhQ8GE2Av+sCBGF3pSct8vgGA0wk8rQ+ixGH7f5QZaoFHo3/UDsVit1pfhVl
mS8AiBiCVWnFfH5XrGCSG3GBB3weLBddPEvjbLuWz86NAxP8+qBfqOwIcqUwm9DG
rZjtjcKkeE9FiEYHCEvo80SpSZkO8ezwAIjgAfgFP9M4EY0yP1onuwKEkcFzFnPv
G1Dso6yMCDdrz5uSvm8YiZpdOmHHCaRbDxpxXiUeRtf6tNRoGKp/nZgsw8Lyvhy9
zpiUi/CR5K6GZtHBueFhUg+MfilVQHydhf1wSXXdjCr/CN6mRocCS7zn1HoT30qG
XKNWl3njaVjHNidf1pFoxpd8xQfrI7EvmBAG5tmXzz7/leo7ZOo=
=6mvI
-----END PGP SIGNATURE-----

--nnV87Hoe0G0aHPS6--

