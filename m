Return-Path: <linux-i2c+bounces-14661-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFB8CD3C50
	for <lists+linux-i2c@lfdr.de>; Sun, 21 Dec 2025 07:49:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4CA83009A92
	for <lists+linux-i2c@lfdr.de>; Sun, 21 Dec 2025 06:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D03D520C001;
	Sun, 21 Dec 2025 06:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Tq0YdIz8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DBE199920
	for <linux-i2c@vger.kernel.org>; Sun, 21 Dec 2025 06:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766299789; cv=none; b=rYWUytFXhifpdUqIWMucPpEhFv8uyVTeRjA8FQjesLUqMHPjRxOudWUg/qLtt8lA5pD6gMjxMpOu+OoWWjXe1pEHCQeJSmSqoXg2vPxoUnEOlekOEzipBH60azjvlepMg2AviC10N5XfPB3Ub9DSyTQto8B/Wx8X4HxQFowYEIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766299789; c=relaxed/simple;
	bh=kdtMDGTtXlOnrj/OE3IgCirCsVrAqRtTbEemgK7B9iY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jRdn8v7EIZs9qWxxTROaFMEZcPYr+/pKHwy/9SUyxnDd2YQ1cfUlGA5y5CoHS9yDz+fxM+alwRzn3mtuB7zg4vk8xpCHaVbACdAs6obE8D6K/IqSWa0KkLSqJE4ooYK2XQVDeQcXxHcSIJOCiOrg8r/ldpNYqJl3bRy+ZaXeyw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Tq0YdIz8; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=kdtM
	DGTtXlOnrj/OE3IgCirCsVrAqRtTbEemgK7B9iY=; b=Tq0YdIz8r8strkx7uWgh
	ifB2iuMmB/aViMKUwNQRkoTxDwjRNlEbvbwYU1m+vO3GNH6FfzW+tvduYSEf3lCN
	6nEXRm9AU6mlBJACjUSmD6CETWL28wAx1hfTi2YDUJW7qUVzujaE+5zDDlNonYCh
	hdowP1gaiGd7oZKzjI/klAGwDKgVvbIST7GhYUuhgtQlnFhGS07uLO25/Oltz29R
	o/3F/JHYggiMO/fKzl3mAeFrfailLWLxzY0uNnZtSQcYJOBAAYNMO8705y9bBr+e
	lNj6teNY9fXRXQi3s5/O7vhzaVs+K7ick50K0Zo3z5hRzi7GnBjW97/KjVtI3OEU
	qQ==
Received: (qmail 3350113 invoked from network); 21 Dec 2025 07:49:43 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Dec 2025 07:49:43 +0100
X-UD-Smtp-Session: l3s3148p1@BZght3BGFswujntl
Date: Sun, 21 Dec 2025 07:49:42 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] i2c-host-fixes for 6.19-rc2
Message-ID: <aUeYhmXkXApDRdnq@shikoro>
References: <gt6mkoewiqqsxe47nmkmdgpcbifrrqwn3wn6nozpv53e6es2rc@uob4fbb3vyox>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UJPfzvMW1xKSYcHb"
Content-Disposition: inline
In-Reply-To: <gt6mkoewiqqsxe47nmkmdgpcbifrrqwn3wn6nozpv53e6es2rc@uob4fbb3vyox>


--UJPfzvMW1xKSYcHb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 20, 2025 at 09:38:16AM +0100, Andi Shyti wrote:
> Hi Wolfram,
>=20
> as agreed here's the pull request from the commits remaining from
> the last merge window.
>=20
> Thank you and I wish you a great weekend.

Thank you, pulled!


--UJPfzvMW1xKSYcHb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmlHmHUACgkQFA3kzBSg
Kba1GA/4nrv0puDypCIAdoLUKQc3C52kYUp8EUxewNWE61qOk+J3WOnrOLAn5Rs4
XcNf8Wu1YTneIcdhwQ2WbiOH26evZ7IQWU2/ACoa5GbodFpsDmAlKj3YmhTiCkHj
LoYOmjxj3wDPY2cOwQIdqHgoOxeyHWj3uPgBYyZeBavwey8BBnXEnGAu3tI+V4ew
32tkGh7IIFMAx1NxVVTXU1WHV4XT0PWgg4QtSIfJhnXpgqx5rm2fuVszcRA+Ev3o
F79ZL2oFqVxR7vwbTiLUDEeEhmOIL8ERjhegBMCmvLJwIk5mxuEL8R3PcJmxokg/
7tK4+qzmY1ji7CY+HF7ZiRNlB4LyNpsh+h9nmsgxk91i/49bj0g8RPsBu2qWkq9V
0ie69eR3BZjEiVx5uNNRwri4YMzwWZVKsb0VuYGhvKihj/A+KkJV6JgshWQJLmBv
lDAt8YFdNCPlNOB0rXXUvQUxNCI6pbbD6yZtnG5QuEI1o8kZU90gCx52YLBXV0py
oqa2VLiUT5jTyv20mfQpLteS8IiJTXa5tBx9SApaUgI9bEQ01LFZEW7gEauSPFRA
qNCq/SYgaV4+LlvtCzUZ82Qn+yNIjYybUFh36kpSZDb+nPnibhFFM9UB+EZX/4AY
xxSgWQiEVZCmjYSO+psLe8f0pAqE/JDF00Rv7jE0Hx2QU/jbOQ==
=DADw
-----END PGP SIGNATURE-----

--UJPfzvMW1xKSYcHb--

