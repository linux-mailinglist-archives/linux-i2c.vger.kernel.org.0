Return-Path: <linux-i2c+bounces-2183-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B860870BC5
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 21:46:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D690A1F22B53
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 20:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59498DDCB;
	Mon,  4 Mar 2024 20:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oJF45FEY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19174947F
	for <linux-i2c@vger.kernel.org>; Mon,  4 Mar 2024 20:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709585188; cv=none; b=Wv8aekqbSKUZf2sHFs2F9WlJURUvoL/qe/SJ8REX1uWLub6SgfNYpo2GNG6hjfWG3v2sZBWIjd95pvcGxaJNDmtyY7/BCv2L8WG5N19QWdiBcTqxQpfBza+jvMqHc6am6S6d/j93rMLTjQkFB7XKbG02/2FWbBxrwLpZQTj+Amc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709585188; c=relaxed/simple;
	bh=ZNCOh/DI0lloRC+SxpLxBYg7CBcmBitdWw0SbJRQ3Q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZI1220coSZ0Bz/wxGAgKDDedWhoQEaBcnfIlEpTAklM3uOABSdG8TS/AXJLedvInIeNSCYONi4C51NU21CjJn3cxizinBQV44dNj/50NFDM2UzEzJi4CP2zU/ox1QpIUPI6VFfAbMLmdEytZdNym/FbCD7F7YsTOWCPNMDAh7Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oJF45FEY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CA16C433C7;
	Mon,  4 Mar 2024 20:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709585187;
	bh=ZNCOh/DI0lloRC+SxpLxBYg7CBcmBitdWw0SbJRQ3Q8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oJF45FEYknragQDC6zww3dnIOJi8efz6yVjrrBCFMWev05TPMYxr+DcXAiWWIfoIH
	 vx1T3qivVRrcQmYrZR64atAC3g2tmrfwC/EQbWaCubVt7Pcv1WApzwKSgzEcyd3wuG
	 yuF1bW6lAtznIeRHKt16Xg2Igf8CGJI43FzK1dJl2UsJv1MKms1es2+NoipUFG8VgL
	 SOWnbRyQn0CWg/bo4tk1XLU1mq5dSWu/CQddv5HOD/vZzrR0bcG6mbCqV1ojONo1Nq
	 WqINbqna3718/Xk9OhPRloJHrLAECJ+dLW06PbINDkUj2/L2t0BGx/snVNG0yW4FbX
	 gcpq/+lujChIg==
Date: Mon, 4 Mar 2024 21:46:23 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Jean Delvare <jdelvare@suse.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: smbus: Prepare i2c_register_spd for usage on
 muxed segments
Message-ID: <ZeYzH0OwRcxFmDhS@ninjato>
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
	protocol="application/pgp-signature"; boundary="KMxOU2pKqVE3K0Bl"
Content-Disposition: inline
In-Reply-To: <d0b4aa2e-8b5d-4c27-8aab-164a089d95bd@gmail.com>


--KMxOU2pKqVE3K0Bl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 02, 2024 at 09:39:13PM +0100, Heiner Kallweit wrote:
> If this is an adapter on a muxed bus segment, assume that each segment
> is connected to a subset of the (> 8) overall memory slots. In this
> case let's probe the maximum of 8 slots, however stop if the number
> of overall populated slots is reached.
>=20
> If we're not on a muxed segment and the total number of slots is > 8,
> then warn because then not all SPD eeproms can be addressed.
> Presumably the bus is muxed, but the mux config is missing.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Removed the printout and applied to for-next, thanks!


--KMxOU2pKqVE3K0Bl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXmMxsACgkQFA3kzBSg
KbaiIxAAgwoL5SlqXnqq3ma5Rxn2DbQuofBHFPgrH1ynQThN6ZvQKrk2MMWs0acY
+nTOlo7x3Cb5py2webWLISw3JzqmKxBrZps8Q8tk/FXScIxQVLrjSWywl8Goz1MU
LvFg9KVlt9/LaAPDzfKiLL3KBKg2pKDl2pZf+n8WeoZwDYLqDkadeRiA6+XafljQ
NFAYfU+cListEATGFD08InWqNy3Kj3MWjYsiqspnmrqwrHYZePOm/YDrO2oF6yZu
1vJfTdawFo1KpE/tfOpIYAN+jxqK546zA35QGmbc91tum2oY8v3D+1q55SuXcUEn
1ta4JcfuRBuZhJIIGnYcXK+0Hal9ZOSqOE1R7hNfKvIjbkP/rEJ5kkVnc9xVl39l
VrS+8phlWik57BAO2nC3iJ+MkpIP4M89+4QiXO60/pwFtqdYvVPDKN56A8Y9zOP6
Se1ats71YUpEO+JNJ4Vs6BdYwXmROmaROk0FPNoDUMDDm6AnAztvG4aOR52bbL4m
rA3f4glUf6xNxuXOAQOjxdjaYczAFNmCYqryRUAe5lyTeuuQhhtLQHeYpkfVNOaa
nU9bPGPZ++yZFfbHQAUBBXhPPTkXrKhqHQcU6aMlNnjtFviCDM1CMiqFM366vBFd
QFUaQEPK/huxBtOrs7o7AxRhforvppOfdIfkyPM06Kp2+Co5Tfs=
=kLHO
-----END PGP SIGNATURE-----

--KMxOU2pKqVE3K0Bl--

