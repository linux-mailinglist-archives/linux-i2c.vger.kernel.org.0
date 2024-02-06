Return-Path: <linux-i2c+bounces-1655-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F6C84BE53
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Feb 2024 20:52:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04A842876A1
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Feb 2024 19:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C2DF1B270;
	Tue,  6 Feb 2024 19:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kz7SoHQc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0E71AAD3;
	Tue,  6 Feb 2024 19:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707249131; cv=none; b=mfnjZJjrCrCnVoVpjoFcNjCuS1rZbEj0D0mRtbgmTyIOFf/ILqjkyvsNFCcuW5UPa0L0OKr+agkt85UtDRPG66bBa+GjQkvCfEtHA8VD3FetPUNLr8NRie8BPeMMe1GY+owJrTtJEDrf6SXFjOu9WjSzqQchtHbiKl9iQALcPVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707249131; c=relaxed/simple;
	bh=fZx4pRcUc3za8T9n9tUmT3V2JcZVmsY/cAiohlWM/TI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rh2IHYr+37M+it6Ojj0qdymMZzx4SXkpukD3W0DiFe00aVGsj/zIf3BAIlfl+4EwR4MbKU5vP31wj7dz2bm4KEw7TOZELX0JCIU90W2psnXsjckGQ82KK0KbeIqV4cVS7YIdL611obFg2XAovmPhwSs7kexuZ5fJZBbMOKYq7dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kz7SoHQc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAFA8C433C7;
	Tue,  6 Feb 2024 19:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707249130;
	bh=fZx4pRcUc3za8T9n9tUmT3V2JcZVmsY/cAiohlWM/TI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kz7SoHQcZnrQNGofmOvgUq1NYXOKfi78ER9R7f1WE7u6k4TGOgErJiuHTjTMHtkU7
	 b0C5oOFjSIJyrUYNmL1vsAbCQg3in+MfyxWbWDKULEl5XPQA8FZuc14SJtuVUAXRct
	 19BbB8vq2Z4PnJOBUbmAkW/657abiTLSsVl3sc4JPJ475XPYjFxxdT8zoSvm6FlFHR
	 30zWR2Hy8HGTUto8eIH7I75P3KyZfPgI7L0eqNPe4qV5erhqMMBvvWEvyLaGXC9GSH
	 79YUXyWfieoPmuNt/Rwbx6029yURZl3XV+iJv7P3Y6XkoMQPaEDgcv+EFwajv19GwJ
	 5zS1nyNj+E4+A==
Date: Tue, 6 Feb 2024 20:52:06 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Rand Deeb <rand.sec96@gmail.com>
Cc: Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	deeb.rand@confident.ru, lvc-project@linuxtesting.org,
	voskresenski.stanislav@confident.ru
Subject: Re: [PATCH] i2c: Remove redundant comparison in npcm_i2c_reg_slave
Message-ID: <ZcKN5isE0B6q88Fa@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Rand Deeb <rand.sec96@gmail.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	deeb.rand@confident.ru, lvc-project@linuxtesting.org,
	voskresenski.stanislav@confident.ru
References: <20240206194201.10054-1-rand.sec96@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/c+/7Pm9wtwRPq0h"
Content-Disposition: inline
In-Reply-To: <20240206194201.10054-1-rand.sec96@gmail.com>


--/c+/7Pm9wtwRPq0h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 06, 2024 at 10:42:01PM +0300, Rand Deeb wrote:
> In the npcm_i2c_reg_slave() function, there was a redundant
> comparison that checked if 'bus->slave' was null immediately after
> assigning it the 'client' value. There were concerns about a
> potential null dereference because of `client->adapter`, but
> according to Wolfram Sang, "we trusted ourselves here" Therefore,
> this comparison is unnecessary.
>=20
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>=20
> Signed-off-by: Rand Deeb <rand.sec96@gmail.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--/c+/7Pm9wtwRPq0h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXCjeIACgkQFA3kzBSg
Kba5Ow//TTSg9C/r5uHjS757qdLJr5CtKt2ZGXCoiBz/JxVUr5V6F2diEjjqizrC
p0ixL2q1MDpvF4ZUAgwnI+Ht+e71py3Sto8MlfPRWBchfP/ugE9ehK+RWyOho43x
xNlwQqtSOqQG7NtpfOtNSnYHNSYpeD4/giZToeL2mV5d2cXidxYLP1rinoYni4ec
ECqS1eLZV+8pxdkd5X3Im7ahFfPb1hkrWr3yajswDxLdIo8ImEuUiVUMoau5cYNp
4ukBDe76MAweDpwMg4EyIoax2AYRl2ULub227IH5usbOZ1gTIZvH3DeLd5CMrhFx
kvqElCljKdAWfIxytJvTmThl4rMmdxo0/Sa1k9Jv3Rzhu9V6tTdm+WrG7pst5Fjc
9wlwgfUsbMCMMGc3QAlP7WfG9g4w4MwUCZZ9DI2gdHQTz9//y41fvAz2TAXz2MBK
ka7UHwGziX1bhomFJO4jin5mKlPceC0TvEefn2zh0pMTSL7puN3S4yYp45x9cKkQ
cl7iRX2+Na582dlJJWq3YZRBFTzGgTup0vrKPZ+lOG0esgJjOQ73oJoq8YC9qlD9
8gCbxtYMqWvzM3vdyRpL/z0YqDjgfd/3IDgchMP3IhX2w5b3aAahj2Cnr8SdQrfV
vM64XBVkntSTZpWDWGAaYPbB4eeLtLhz7RTexwSAMPJxMn65uNw=
=Z6/z
-----END PGP SIGNATURE-----

--/c+/7Pm9wtwRPq0h--

