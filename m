Return-Path: <linux-i2c+bounces-334-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1117F1888
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 17:22:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD5891C21821
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 16:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AD0C10970;
	Mon, 20 Nov 2023 16:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nsEMhJ2L"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518111E502
	for <linux-i2c@vger.kernel.org>; Mon, 20 Nov 2023 16:22:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 682BDC433C7;
	Mon, 20 Nov 2023 16:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700497352;
	bh=wo6NE3x3fZnUgjOiXaaB7L0iQnLkmm2WM2aRkkTL/vg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nsEMhJ2LQ/U0o+CSgd3CLLiBEKlB9iXGA7RinYkv0I6rF+nJKEIo7jlPrj0rEe3ST
	 hV1IMWH8nClWwhV/k0fD3IBCg9XdPz9gAnpSynlrZDXnfSFeTvWfn6XpBbxhfnDWUE
	 5sFpsIzxcML4jobVeF4OJ++AR5wqRgufhk/KWW5/5LsZvniJIrRbOslcqgnuC4aBkL
	 iCS96XTx2KvbBbPorGkTgb8GwcC2UAQjsOi7DrE6OjPA3+x/QgBdCT43hcSfonfGGb
	 hx2WFAcSz8reUlAkCqBP95DWWrJh+PsASYVbS+BmSdYy+QIJclprKvMsks0aESqy5i
	 gTp0dSLjZSzbQ==
Date: Mon, 20 Nov 2023 17:22:29 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PULL REQUEST] i2c-for-6.7-rc2
Message-ID: <ZVuHxUZR3A1M8SE1@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Will Deacon <will@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
References: <ZVf/pqw5YcF7sldg@shikoro>
 <CAHk-=wi9a9u+1cAxxHw7KxXsfPvdWCbhatK7enFSjgwjrovCZA@mail.gmail.com>
 <20231120150515.GA32570@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nhEp5Di/H6AUF6Ik"
Content-Disposition: inline
In-Reply-To: <20231120150515.GA32570@willie-the-truck>


--nhEp5Di/H6AUF6Ik
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Will,

thanks a lot for this summary!

> and I think the high-level problem was something like:
>=20
> 1. CPU x writes some stuff to memory (I think one example was i2c_dw_xfer=
()
>    setting 'dev->msg_read_idx' to 0)
> 2. CPU x writes to an I/O register on this I2C controller which generates
>    an IRQ (end of i2c_dw_xfer_init())
> 3. CPU y takes the IRQ
> 4. CPU y reads 'dev->msg_read_idx' and doesn't see the write from (1)
>=20
> (i2c folks: please chime in if I got this wrong)

I admit that I didn't dive into this specific discussion. But we had
this kind of re-ordering problem in the past in i2c, so avoiding the
relaxed_* where possible came to be a good thing in my book. So, I
recommended removing it for all writes, not only the one causing
problems here. relaxed_* should only be used when really needed. So,
this is why I applied the patch, plus I trust the people giving their
tags after the in-depth discussion. But yeah, if somebody more
experienced with this driver could double-check against the potential
locking problem, this would be good.


--nhEp5Di/H6AUF6Ik
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmVbh8UACgkQFA3kzBSg
Kbak/A//S2jhodePmuM7u+4PQREH/Nmwbd3Casu+Q+QLWwr3jevovyNhWupdRsYE
wDROMNs30eq+iYYzUQVKE9Mk3y8Z3m8ntjNAbkhJmrajYVd522PQnO90HLwBEaWO
XaTAPyJ97uGf0yUEE9zg9U2oW8oqZh2soca2TLu26mTV0PMXFwkqEyqgBV4nf61n
p92RdjVcDgpqTOjmcuhFvmV8sJ1hlY2+q5f+wY09+ZaOVdmhrA9kYezCoDz+ZX4Q
MB+dUKzCC22lT9NzEDGyz5/TsVKwOa+MYSH3oHpjxb7ULk9UcC70QUnmJ76UwQZ8
9CS1uifcXhgkyu7VLahv55jjkP4cHAS3MnhTBewXsl1Rl1bOvvPhIUuPg/r00hBl
pyUVlxpQWZ12gmWurqqK9cQUGlg+UcKvUZ0+aS5EsuCUwLHhorv1Pehx7M46eRrh
Crkbqk1gZA15R2w1dp8DXQ+qYjK2WDRMMnU/sPa8Ad6SWiU18LhS+dqyLp4hsUuk
x8NSeMyugEqaZCJk+i8SmiGCzhPOx9kAp5Gfgjjb4bKjRWlTjuIKOD/32HFqS/rW
cYUlNmyicQRKsZGacYO+UV+64euw1p/QA+jiwrSkoD3+6apFLRfc9Q4uy9/Cn2r3
4jFeGVWw5PEukhIs8mYspuM91zzXnlesN/dgEGCtFdAbFfaz71Q=
=JTwO
-----END PGP SIGNATURE-----

--nhEp5Di/H6AUF6Ik--

