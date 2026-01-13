Return-Path: <linux-i2c+bounces-15119-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36366D19F78
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 16:42:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A844D3009D4A
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 15:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D60A3939DB;
	Tue, 13 Jan 2026 15:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="l270UgR4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C633392B64
	for <linux-i2c@vger.kernel.org>; Tue, 13 Jan 2026 15:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768318957; cv=none; b=j7rro3/SN2/GMAigsOyLYhQA2QmT8XCMSSax8oLJecXNzs0eAHv9rGRP6faMnBIx2U2h91lHyDZDLjTN+CLtSixL7Op/1QLiuZRLRKhDOkDVVd5WyAd16doIybAHF6k6zW+8SfefRqZYCHXxd7f2KA3g5dncKO+r8zYXvUVpB9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768318957; c=relaxed/simple;
	bh=kZME6TVcyc5MKD4PxtpeEIttzcxqOmMOmAZuijMrKZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sJMQ4hbO0hPge1/7GvjsmP4WHZH9oiyPcsk5gzW0Iqv7AjRBa9U1w5fVh6rUWrU3VRHSHGepxi2b99FS/GDObZ11FJiR53vLtXn6EZIm9edMar7VszPMZT5oUW6iAzfPNZQmfxyzHNE6PNyppZy3O10PKkHCu0/rQVx4jbu/rec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=l270UgR4; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=zzhN
	UP6J7DC5wKuiGhDtVI/KMQYNM3TCzTW/AiJKOf4=; b=l270UgR4Kl/205lvKL6E
	CVFteckWGB9zbl9P0uqapt0m/rc1cRxvB35XyLaJRJOImDnYWyA/8ikzImDuvypz
	9xetPERd7BvtR2g6TujT3N6dqFGdQC1ZvbvYKPA374KB10muJL/7cWDjFS7xb8Xx
	Jnwn5+Zp8TLCLPQ5m/Z6ATiOuJ1XSNeW1BUQjfv28ApW37Yg2+YYjQux395B8bAa
	sKiMXQbaE36iFD+1ACi+SnT+N4L8y0wa83o3120yeC1Wj4BD9brwNFnapqb6un3A
	Y5DYQvMnZNZ6QjNbrPgBj7n/Z1E16rLKZDR5jeJHdAKv9fB5pRVic6lwirCjzjbz
	9w==
Received: (qmail 1758041 invoked from network); 13 Jan 2026 16:42:34 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jan 2026 16:42:34 +0100
X-UD-Smtp-Session: l3s3148p1@ChYY10ZIJJgujnvx
Date: Tue, 13 Jan 2026 16:42:33 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: andi.shyti@kernel.org, digetx@gmail.com, jonathanh@nvidia.com,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, thierry.reding@gmail.com,
	wsa@kernel.org, kkartik@nvidia.com, ldewangan@nvidia.com,
	smangipudi@nvidia.com
Subject: Re: [PATCH v13 5/6] i2c: tegra: Add support for SW mutex register
Message-ID: <aWZn6boSNd0Z4F1b@ninjato>
References: <20251118140620.549-1-akhilrajeev@nvidia.com>
 <20251118140620.549-6-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="L5apaTHmxp8dOH0S"
Content-Disposition: inline
In-Reply-To: <20251118140620.549-6-akhilrajeev@nvidia.com>


--L5apaTHmxp8dOH0S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 07:36:19PM +0530, Akhil R wrote:
> From: Kartik Rajput <kkartik@nvidia.com>
>=20
> Add support for SW mutex register introduced in Tegra264 to provide
> an option to share the interface between multiple firmwares and/or
> VMs. This involves following steps:
>=20
>  - A firmware/OS writes its unique ID to the mutex REQUEST field.
>  - Ownership is established when reading the GRANT field returns the
>    same ID.
>  - If GRANT shows a different non-zero ID, the firmware/OS retries
>    until timeout.
>  - After completing access, it releases the mutex by writing 0.
>=20
> However, the hardware does not ensure any protection based on the
> values. The driver/firmware should honor the peer who already holds
> the mutex.
>=20
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>

Applied to for-next, thanks!


--L5apaTHmxp8dOH0S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmlmZ+kACgkQFA3kzBSg
KbYe7w//XwqNipvTUkD8Xl+z8iCUKIZVXALYdi8+JrslD+f3IWJIzQgTe2lXgAqY
bRvFZQGAXvBprIw0fdVq+mLrdSItMoTFGsaAGSIpXm0+AaAccermyWf4xh441RHI
EaSawG95PT2vkEh1to5Yd9VuU5QcRrEKzNdE8XSHlzThxJzeD6xbq+kSA9bmxyXB
vnX0rmC/9f4QTJVHs53y2yRhv6N7/vCrJJbW+7j13KisB5nHAg5+IVowk+U6Ahg4
t5yawN6WrKAKP7PsfYZJK/HISbwD/o7J+8GFZ5zovJx+yHtoiBr/QnLTRsGbvW41
CWOJ/PuoVdI+ZCoX5B0ne/LHkpTjpAidThY3Vwo4t9n6FPdtbghPi5yhk3VpBPSY
m+WFPogPxrpev23x2qxOyUSuT5Nc1EOcJTDD2kGiT8QVS2tMIebXwChtQm1xUcvB
Ox0k7Zf3k0lXx0nFj2AEwdW8OlaP0loEwUZcwgsiUt87RnJcQR80SUtLjzmjseX6
brzAlauaa71E/BUsGpwQW1iZacMYq8fbkn6DFmsQZCMJeqzDoQgrJ+kJN7bS+mcT
lqV/e58/p/Q/Rv7bRIMIzpBYoyrpELwyyz6d2uhcAOXstWM+lBfozq3uWFao+lBp
O8qHWqbAzCOxTJAgV/v1JhtNsMt48W6pkv6IDf49pFolB05CxIs=
=x5Gb
-----END PGP SIGNATURE-----

--L5apaTHmxp8dOH0S--

