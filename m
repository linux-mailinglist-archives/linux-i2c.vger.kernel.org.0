Return-Path: <linux-i2c+bounces-1620-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 952648488BA
	for <lists+linux-i2c@lfdr.de>; Sat,  3 Feb 2024 21:39:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF9D61C228F2
	for <lists+linux-i2c@lfdr.de>; Sat,  3 Feb 2024 20:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BE90FBFC;
	Sat,  3 Feb 2024 20:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B8K/QY63"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FB0F9CD;
	Sat,  3 Feb 2024 20:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706992752; cv=none; b=SAaMWW+3MYHmaswWBXkr7XhQalcUmDzX9MfEtMNrqKDpCkKxNa5vdpGz5XTjO5DN5Wp7wP4ECEDTccVNRTR5fidJRlnEH865/d5H3rL3CoPoZMmK672kYrh9WtGE85pJchXP9ZFpPFGMErr9c9ylidMBDCY/ZjGSHBLfI7GvO6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706992752; c=relaxed/simple;
	bh=W2x6vHEgHoC62vKcf6jWEd5q3Ob11b/l3VfH6MEGI10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oraaYrzXkEKwKbsmr2tq0Oo7adZ+GEiZtlHWjb2DAFmKzyyTwG6fBE/hd5m6gXbAix3XP04kbcYe5vtaERdjaPPAhC4Xb5qnqLkmJDcOlqm7umFtmaI0bzNRC8hks3LW601GfgHTuZxJgbf0MCQwGvQsNot9+iBEDRaUJ91nS/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B8K/QY63; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D060C433F1;
	Sat,  3 Feb 2024 20:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706992751;
	bh=W2x6vHEgHoC62vKcf6jWEd5q3Ob11b/l3VfH6MEGI10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B8K/QY63RWjvVtVsc8AlMUpjxzJ6bd6jz0qExq2v3wE/5Xo6WobOo8fhRnbC3j1pe
	 FW9pD4ntEefjPp0ccWArvZ0T2aWFmmcw4MMmPflgwYY7n4pFNiPr81mB4ocN3sqfYg
	 +THWOFKRxWS6fAyZObZyI3Xv7YZH1pf6n9r+p/lSAeRfkDtivQB9XFAk0ninFBp/XR
	 rIahjAE6813EfWWBUxDQ+Ci8Zc7xzYRSwbZtJWwUBnDKV9WiOMj5raczrx6Ov61Mvw
	 +11prekXA0eUav+reFyiWoxK/B8bQ774VB13DpfvA3HEQJ8gKgPlGjU389jNm/w4+J
	 4QRWiQNKjp31Q==
Date: Sat, 3 Feb 2024 21:39:07 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	"open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] Input: bma150: remove I2C_CLASS_HWMON from drivers w/o
 detect and address_list
Message-ID: <Zb6ka_pmLcOP-jTa@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	"open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <011ac933-2a45-4a63-895d-d45bfcb8576e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wHFnVoFH/bXb2q2B"
Content-Disposition: inline
In-Reply-To: <011ac933-2a45-4a63-895d-d45bfcb8576e@gmail.com>


--wHFnVoFH/bXb2q2B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 27, 2024 at 04:18:57PM +0100, Heiner Kallweit wrote:
> Class-based I2C probing requires detect() and address_list to be
> set in the I2C client driver, see checks in i2c_detect().
> It's misleading to declare I2C_CLASS_HWMON support if this
> precondition isn't met.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--wHFnVoFH/bXb2q2B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmW+pGsACgkQFA3kzBSg
KbYnDw//Zl36JOXnwVBceAi16dBM4fPJ9kduSiuACQfk0W04IG+rDmfKrP++fCq5
hHJSe5TlATvrJqIob3SQMvJEELjEpteao0NBUmI/MKDwriFmDy/Hu95i0ZV83n/o
x0Bn8da/zVJifL5+KLRIlm3gzJrUU9hphygGZEt1Kl1c+cy0WHbXLhMrn5ODGqJo
3ZLrOnpMmKnPDpYBRM4eFrbqcwVRKgJODZ8mz2700x87IHySga391C9+EojVaXMG
xtdbQw6/dsf8yzoIKlmXfIhd8LBlmWWeoNjQ1f5ilyKdDj6aVhkMXW3thWhWEEmt
wzhdVcqq3rJUWp0/sj9qaTm8MIU/ZDNsNqW+bwXeU35WF7xOw8h3rdEcfV52FmbW
ELsfysCadAht/YO3hEK5ktIfVc61qBYDmmrLeEXPa6vcdzl7sS8fSiCKAYQj8Y5a
f4CiXKxq7fMkvvmJd/LdcDNtEmxK8hnqDhtIU81W5sT+kpwcJIjiLAP+0jK6FWqa
tMDQOf2xPBaxwSfsvVVq3YRqEgBmh/Nvikp9AS0kL8uZCb8ptX5Blb3WD/EUzL+2
iUy5hMzNzas0jkfF+gTvQNWTZqB9TGMIcU60ANGfTEGUDHbiMYDN529SQg1cCpNF
RiZJbnMVelWTTNOY6eLQvXcoSBXvvFyj1+lNxG4mG692fqBgbzQ=
=3aLW
-----END PGP SIGNATURE-----

--wHFnVoFH/bXb2q2B--

