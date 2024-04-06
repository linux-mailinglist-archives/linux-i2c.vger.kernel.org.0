Return-Path: <linux-i2c+bounces-2798-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AA389AA3B
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Apr 2024 11:54:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16BCD1C20DE0
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Apr 2024 09:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3224022EED;
	Sat,  6 Apr 2024 09:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gTlxPVzi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22811EB3F;
	Sat,  6 Apr 2024 09:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712397280; cv=none; b=kDEVUsrAQM8b7m3d39pM9YPAd3VZn7ZnbGF3l21IJpfadicHTqtTbSdbuUbzPSczMgDGW9nRRXCT+ZLI+KoBIxAHXOlgK21MCXcSt8yHUp1x41GvVLBOYtkZYAWmsS/xNqw9+34fYdZqjFM8lytgu+zHVzgqmVAzoLxEIjGuSi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712397280; c=relaxed/simple;
	bh=CtiTRJU16cbEHxhAXjKhFe3P15kf9+LcvQjsVXNhgkk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B2nVuSDZRPmgTMGZa+K/k1eIYY7CW372KQTF6bQYV7tIhD9RU36HkS/mt3VSkMxE/5iZUJm8VK93PS5xUTZdJSSN9uqdK50fOal9q3oNpfU4r6xepp+Vz6ScDjSeAkvH4KCtWoswgdv6v0YlEOZXSMq5U14bJniBEmLhXUtHC7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gTlxPVzi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3702C433C7;
	Sat,  6 Apr 2024 09:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712397279;
	bh=CtiTRJU16cbEHxhAXjKhFe3P15kf9+LcvQjsVXNhgkk=;
	h=Date:From:To:Cc:Subject:From;
	b=gTlxPVzi5QBcM4Z8pD3uXjMGSfPBK46cGG/Uqh1ZdPTeZoVWf8T21rmcje7vi71qD
	 qckoRf9jDGJAptFDFUyhJPuvsS09+PgkN8ZLqf5fLFCy7ue2fpqBQ4AZRftt7VuYz4
	 IzC7ara/MWndIzF5GSfDKIPre0j2fHNBflQqo2ii7+6uz9VCxIYTCGu4gq3z8GW1dl
	 gtxolD/GYTc+vUBo1xCkhGuN2Ti+SbTvdnHrreiatAN7Vk/3YMud4nUwN9z2VtT6ZW
	 x21yvj6Qcoyx8taIH5sQaIKOSmSpUu4kHFuq5uiZSMYaBarmaniiyJM9tuke5d33qE
	 3X3HjlaKGbIgQ==
Date: Sat, 6 Apr 2024 11:54:35 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.9-rc3
Message-ID: <ZhEb2zk8J-YCCgaZ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nsxrkpuRpGe1hJWV"
Content-Disposition: inline


--nsxrkpuRpGe1hJWV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 39cd87c4eb2b893354f3b850f916353f2658ae6f:

  Linux 6.9-rc2 (2024-03-31 14:32:39 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.9-rc3

for you to fetch changes up to 5ceeabb0eb2e1982d25c384048735b9da66911f9:

  Merge tag 'i2c-host-fixes-6.9-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current (2024-04-06 11:29:15 +0200)

----------------------------------------------------------------
Passing through a host driver build fix

----------------------------------------------------------------
Arnd Bergmann (1):
      i2c: pxa: hide unused icr_bits[] variable

Wolfram Sang (1):
      Merge tag 'i2c-host-fixes-6.9-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current

 drivers/i2c/busses/i2c-pxa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--nsxrkpuRpGe1hJWV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYRG9sACgkQFA3kzBSg
KbZEvg//UOZkvQqcJbv8ZzmDQZzKQxCWy2N0zlW3NWvaRW0DYTikAVeSS+u8aVkB
qJY578dxYc3873bqN7ZoMKAxDxCesv5t8VVDcCSRhoIsNzNY0QjKHy5UaMO9aQdo
VZwICkTj+swXO9uvxNv82Tnp6w9wKenmL39Ussrt4VBlpRsEN/uJA0f0T3mEab5g
NuxqqNTzXejneLzsAcHjgz7jXqsIh/mpf1cFxuqFahNZvJx824w1Dly30KMnNqsb
dQYwZ68zHptbxQFGxfu++t2428sw9+xi2RVuQI9ropHQRCO44SKRWe1Zqg8YeSk3
zd5WQ/U9E14dWNAhHd22MlHBtRbBCwYQN1BEqNz7d/yCNcmPqmFcDu6YgWD8zQML
pvizkWyPF26DFzQDRgtr427jJgd1KwyT1PkscqxP9LF+/uxRtil1RJodAM+g6keL
Qpcha5GzZAgo8qqSE1NBooogvVFDWA8j89HHkRXIaOoLcPAiYwsvu5rXVkuwHsah
EHb8Sxb2zN6cIaBAmg2j08OXfvTHsGL4qlaevjQSpzBEgBcITthQptkqAuK+v9F/
xKkxM7HHASRiWVTJsDq+y9K7Wzcjyl0trpU91LULyF5TSB9Cio8RCfbwJjArgNVo
5zK7KagaPcu2MjlIrqEuxZW0MKZdrL8bi0EV9ju0hgCXSXAjOEk=
=vGGV
-----END PGP SIGNATURE-----

--nsxrkpuRpGe1hJWV--

