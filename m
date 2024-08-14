Return-Path: <linux-i2c+bounces-5385-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3276C951C77
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 16:01:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C138CB26FCB
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 14:01:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D5481B3754;
	Wed, 14 Aug 2024 14:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="PApIccj3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BC11B3739
	for <linux-i2c@vger.kernel.org>; Wed, 14 Aug 2024 14:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723644033; cv=none; b=FE1YBExaxEEH5KGGYUcSxrBZMeG2T29/caT8qcWpsVr91WZ1lqO5t7jD/+lCypECfJKKsjHr90s/HTEaQGnHnFosVcrm5RlwU6DJLnr4ikNp524Z+y3Auya+UydTKn8oTHBlwTKHLGWeYmuF0h6rwk9pKPK0tPQZ48kEfZsE18k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723644033; c=relaxed/simple;
	bh=tHn19Ni1LLbpXwJbilTrZJhHpHLAG9javyo89zYAfVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cflUYjBYm/t6JsZdRUDCvJuiAqFkn7bofzkveQYHen6RIlgmWN5asDi9qeJFXkJ/KiE/T05fDWGfjQXDVHedvkurcDLjxa5eEIJK3s+e0jM1PYHr7T6tViLjYKaVUHlWjDO1xSkxBs7gCq5gvKPRLabEHZXbCNWFPLX1Q+K+AjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=PApIccj3; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=tHn1
	9Ni1LLbpXwJbilTrZJhHpHLAG9javyo89zYAfVE=; b=PApIccj3MofW7UjEhQgK
	1VcDjYSiIKKDOsrMuH7UUKHw7MMIXVBlxbmrPEa8GoU3ifMVWZ0OWCcb52I46woF
	zBW9w6HHvD8LXvnBVd9+3+QNMfNYyA5w+f0Tpy99ytOZKCPZP2QRWyhx+FfTd+JT
	nvIbfcVoQbx3FYIFd2RKaA5bWXfxd4Ec4Af7j1WsZ2qhOSRQ7nsdo6W01mOah6NR
	qtdBNJ3QVVlx2dkNXaEWVcqywD00/frO1aJt0HOyCfGS22WooOGvjDuEYrphaICo
	9MEjCVHl5RxSH5XL+LSkremNygmZiBG7eMUHSyAcmvX7x+HpQ/I52Dv80UB1yIJO
	ng==
Received: (qmail 2005605 invoked from network); 14 Aug 2024 16:00:25 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Aug 2024 16:00:25 +0200
X-UD-Smtp-Session: l3s3148p1@HA/aJaUf5oxehhrc
Date: Wed, 14 Aug 2024 16:00:24 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>, tiwai@suse.com,
	linux-sound@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] i2c: Use IS_REACHABLE() for substituting empty ACPI
 functions
Message-ID: <Zry4eIOLOTwaYdaC@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Takashi Iwai <tiwai@suse.de>,
	Richard Fitzgerald <rf@opensource.cirrus.com>, tiwai@suse.com,
	linux-sound@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
	kernel test robot <lkp@intel.com>
References: <20240814121649.261693-1-rf@opensource.cirrus.com>
 <87mslfjk3n.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CnJw5lxH+cnRnBwX"
Content-Disposition: inline
In-Reply-To: <87mslfjk3n.wl-tiwai@suse.de>


--CnJw5lxH+cnRnBwX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> > Fixes: f17c06c6608a ("i2c: Fix conditional for substituting empty ACPI =
functions")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202408141333.gYnaitcV-lkp=
@intel.com/
>=20
> I suppose Wolfram will take this?
>=20
> Reviewed-by: Takashi Iwai <tiwai@suse.de>

Yes, for rc4. I wonder why buildbot did not spot it for the branch I
submitted to rc3. Things happen, I guess...


--CnJw5lxH+cnRnBwX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAma8uHUACgkQFA3kzBSg
KbYcgQ/+Mf+9Ktg9qabb78lFK/mpsf36EHCsUIjOp2HPOoNGH2WTlHYUSWpfTKEu
nEbH/lI6l7BTJlv18f2L2u1FhMVYGXIl7O0Zu9/8hNYhhNY6PIRQX9Tdg1EfM+ye
1KNcCF/0EkXt5/lnycU7XsrpDFy1iwBIk3XbNddYtbD94qyhRKGQl0VeoGlDV2EV
OKIeWjgcvyhcFRdkKJs/xThwXIk0ltu2vZVbzqT9pweKgfKTXYPbMFW6VmPllBYC
wZPYSVkh/kSCsF/3fNbxkly+KMQBsdLhIU6VmFN5yu83FCptr5nMY6pMX9JhLA+m
VwMvhs9ez3dIP3OVbieF5+TNBNYYzED22M4H4A/wN48Rwf9NDFXgzUvEs8Moooi+
XwygktX0epZwGKVq9oC2wuwMSUvq47/Vf2f9kAhvX3XIwM16LgFKYy01gN1gySd1
IZaEJH7A0VoRcPa8lobnzSXz3JJAknlrR+J7mu1SolT+J93Lw4FqkrFRnL3a8xKC
9UblXfqL2Q5hGbuu3u/x24HzBKxXnSO9dk4CzntYT69PmhWjRDhHsPufurbIHbOy
bGOWY8mfB7gukp1I9esbRAfTzwAPp+PiL+7Vp2Ojq6aEUCb1mvKNKWF4W5WIUsAW
C0o+MWWRp+5/tlUKrEGsRrcOJSB5FKWQL2nTSMJrMANS51SoHnI=
=c88m
-----END PGP SIGNATURE-----

--CnJw5lxH+cnRnBwX--

