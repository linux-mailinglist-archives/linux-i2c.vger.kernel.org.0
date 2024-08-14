Return-Path: <linux-i2c+bounces-5404-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 137E9952219
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 20:35:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3884C1C22194
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 18:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E5AA1BD501;
	Wed, 14 Aug 2024 18:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="mY+iZ7XR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83341BBBC5
	for <linux-i2c@vger.kernel.org>; Wed, 14 Aug 2024 18:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723660514; cv=none; b=fMc2ZxiD8B5nVhVQuCHp6y+zaxTUVRJJPOKG5RKtxDQ0hqMJyj359htY4tkaSWnlZBWHlCSWsW1SorVAxRrspN4cd7tKLiVkgU4zkoSYq6KJci+u6m+QqUoYKDHcHO9+OuPWDrRQPBIKOxWi38i7Tmbyjt8hmGkUmxRMYP8KoFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723660514; c=relaxed/simple;
	bh=MUsVmkMbnC8qkdjvgMcqptcSAWBcxioygXWViQZ4r5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n4qTapXHCKBSLz1pthPPkpvxpejkag8is2efkeEod9xm+RBWle9BPuTCKMq/0unTVV87Rdpm1cusRSRigslutA199UqjQ+yteqdskz2qwKO3j+BacauJn5P+06DdL9XM0PwVv5hbso3muw6r0HoNxJw6f20DOhkXiyIgrikPLTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=mY+iZ7XR; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=bUOL
	5SzurYGlyHVzvKS7IFjUtAlWTpd1foUKZXDOomM=; b=mY+iZ7XRbWLEQh4YrheK
	vT/Gb2dUo9VHFitFybfHwp5bRiWyeBznvq3uDycaEanT4DdxoOlw8igc/6IWhw6S
	m6Do65pa6loJYsLEgilDGwoHrQNd74UxPwmBQYBzr7lLOutZ3WZyhePiNWvBduco
	91HYyQvRDBAfw30gQB56BVpQkT1ZxLAK0U8hs59xOJIgjuLmWVOjcfnmTtZblRyr
	rCVRShPt9u0lx8klwZHe60dDFTWV8FzB+Fj8BZ6a0zneqfYqpgK/INN1NBKupEO4
	1KRuulmTzDfWP4+oWV15QbmBdBlsPqfJxIWcckgpPMSSbFltdSCxfMdBWsWqjjvM
	Ug==
Received: (qmail 2068152 invoked from network); 14 Aug 2024 20:35:09 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Aug 2024 20:35:09 +0200
X-UD-Smtp-Session: l3s3148p1@leVf/KgfguYgAQnoAHipAGJRnFk/ZdC8
Date: Wed, 14 Aug 2024 20:35:09 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>, Wolfram Sang <wsa@kernel.org>,
	eric.piel@tremplin-utc.net, Marius Hoch <mail@mariushoch.de>,
	Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v8 2/6] i2c: i801: Use a different adapter-name for IDF
 adapters
Message-ID: <Zrz43Qb62EB6o39e@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>, Wolfram Sang <wsa@kernel.org>,
	eric.piel@tremplin-utc.net, Marius Hoch <mail@mariushoch.de>,
	Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org
References: <20240812203952.42804-1-hdegoede@redhat.com>
 <20240812203952.42804-3-hdegoede@redhat.com>
 <c35b6mawhhbhjioan6hvrlthtcoc6dqivwihhwz5ftvv6jcohs@ovctm27nnd2n>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VMPTsIVp3oNgsXcF"
Content-Disposition: inline
In-Reply-To: <c35b6mawhhbhjioan6hvrlthtcoc6dqivwihhwz5ftvv6jcohs@ovctm27nnd2n>


--VMPTsIVp3oNgsXcF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andi, Hans, all,

> > +	/*
> > +	 * adapter.name is used by platform code to find the main I801 adapter
> > +	 * to instantiante i2c_clients, do not change.
> > +	 */
> >  	snprintf(priv->adapter.name, sizeof(priv->adapter.name),
> > -		"SMBus I801 adapter at %04lx", priv->smba);
> > +		 "SMBus %s adapter at %04lx",
> > +		 (priv->features & FEATURE_IDF) ? "I801 IDF" : "I801",
> > +		 priv->smba);
> > +
>=20
> do you have any comment here?

I have been scratching my head about this patch for a while. I still
think that it is quite fragile to base features on this naming. The
comment above helps, but I still have a bad feeling about it.

I noticed now that the i801 driver does not use the algo_data field so
far. Has it been considered to put a flag there?

Happy hacking,

   Wolfram


--VMPTsIVp3oNgsXcF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAma8+NkACgkQFA3kzBSg
KbZ4Pg//Xnf1aRMQc8/vPwXCuJSs016oyTQDyYYmSrjLkG5qQ9S6bnN5Is9QYBD1
zd739TPAOUFVb0oUEK1p4lumcsQn+sqylFJEc9VWO7IOKns5z1zGK9NmslW6qV4b
hc5hBFBumZaruLHpuI5tkDtENumlftXw2fTFCyMmK79xPaQaVbGcURejDCeDV0Qv
uWnXSH768LF1X42CRm6lorY6zX0CBusbR599NJtnpvs6gva2Rvko4gH8AHiDp48o
i4eKFq9L0dUD30HqKZmxwz1RT64l4CzKeM+cMs6DtpYGjNh0Ce8vKizuvyVx5Frv
etFP2hZV8HOJX3iQAV+/K8QCGpzSInFiN0s2uTjfVm7tE4g2mOI+SSIlHGhpaKdF
CIC4tqjBozHbIMQ8OeYkRku2JYbIXbQRzZAy8NOXPIG3yoa6IXe4YvgotFTXI3kn
LlnaEJmJERBUBo2Zp12OGE0LUeyi+tuKerlEulgXqaz0OlQsst6u5hR4CuGJ/2yq
JLxn5fo9fTvjN+hglmBpgxws45kUMr58lp4kYnZHxyBrd2mu0dzWOZCbdTXKUH+C
RffTiei1NNONUjUdgxfZjIJBjssp43pY5BC1jVPid+789y5mugx1a6UQa3yAJF68
qgP5gk2ufYKK3flhteX+E46pPWyv7UzZtG4m4FAKk5hJD2QYd+g=
=qh1w
-----END PGP SIGNATURE-----

--VMPTsIVp3oNgsXcF--

