Return-Path: <linux-i2c+bounces-9666-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76205A4AD88
	for <lists+linux-i2c@lfdr.de>; Sat,  1 Mar 2025 20:39:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D37218960FE
	for <lists+linux-i2c@lfdr.de>; Sat,  1 Mar 2025 19:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E889F1E7C10;
	Sat,  1 Mar 2025 19:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AZDVPR2Q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A147C1E3DE5;
	Sat,  1 Mar 2025 19:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740857993; cv=none; b=YoBwtPTD0iZSVWP/loqb+1sxoylABl4DpzIPoZbHT8hAYl6DaFWbu0cBbx81HOtQufAqMMMCN0XJudjChsYxyE785ESpcmh1x1l/0e7LMH2zpTAYDumfPQ0gxC0CZgJVDD+tfagbuV9NVMvndWXLs4TPc4nILLT8fmpE/DLems0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740857993; c=relaxed/simple;
	bh=Plxrdng+t5WHAxLFl4s0242zR5Wpsk/81uDP9+OE+h8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j+9ExLbid4z2LQR1Uzo7Po//exQhIGDaEYf8IEXGeqITYsNyvHO7A+Nl6pucDp5IF2GhYC0qb8XVLMVQvwfE+1dc7PBLuhv+NxUZbQiE9ZzSGXQt378uEviw/Yxhua5hLalMZyEA0X2hIMPVEj/7pbvsPDqlQYvbh2RroNxHqtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AZDVPR2Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0DE4C4CEDD;
	Sat,  1 Mar 2025 19:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740857993;
	bh=Plxrdng+t5WHAxLFl4s0242zR5Wpsk/81uDP9+OE+h8=;
	h=Date:From:To:Cc:Subject:From;
	b=AZDVPR2QJrzZKC7FNOGr+DARl5GFQaA0+Tpgsy7rWIDrHE3MKx5eP8RmvbncP3nHv
	 5NZFW5Vf32O9MVPZCxknvTY9V1KxAdd9CIDzh22hgtbthDLz8qChDZ9BUfZJOYlk3P
	 YVY2E6XyxE5YSsVRLOyPNCIm+WoYYqI1g4RxG+Ts/X+Z/OEOnlaQs2Ve5gIdI9wkUi
	 77M1l9fM90KApM/pmID/KdM5uJqehN4n6EhYdIIlKexBQdPC/u3XiEt+GHiHvSuto2
	 Pz5qdorO3Qp1nGk8SC5SV0FdcLyCzgnrXe5BxNL+XmYcc4NEXUuaMJThN8EiT+3iiI
	 Ys9ZG6fPZbPmQ==
Date: Sat, 1 Mar 2025 20:39:44 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.14-rc5
Message-ID: <Z8NigAMM76-HMpin@ninjato>
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
	protocol="application/pgp-signature"; boundary="HSYRcmPAYZm2E65K"
Content-Disposition: inline


--HSYRcmPAYZm2E65K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit d082ecbc71e9e0bf49883ee4afd435a77a5101b6:

  Linux 6.14-rc4 (2025-02-23 12:32:57 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.14-rc5

for you to fetch changes up to 911c288f9e662458fad969ea64ed1a206ca7229f:

  Merge tag 'i2c-host-fixes-6.14-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current (2025-02-28 17:27:44 +0100)

----------------------------------------------------------------
i2c-for-6.14-rc5

All driver fixes this time:

- npcm fixes interrupt initialization sequence
- ls2x fixes frequency setting
- amd-asf re-enables interrupts properly at irq handler's exit

----------------------------------------------------------------
Binbin Zhou (1):
      i2c: ls2x: Fix frequency division register access

Shyam Sundar S K (1):
      i2c: amd-asf: Fix EOI register write to enable successive interrupts

Tyrone Ting (1):
      i2c: npcm: disable interrupt enable bit before devm_request_irq

Wolfram Sang (1):
      Merge tag 'i2c-host-fixes-6.14-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current


with much appreciated quality assurance from
----------------------------------------------------------------
Andy Shevchenko (1):
      (Rev.) i2c: ls2x: Fix frequency division register access

Tali Perry (1):
      (Rev.) i2c: npcm: disable interrupt enable bit before devm_request_irq

 drivers/i2c/busses/i2c-amd-asf-plat.c |  1 +
 drivers/i2c/busses/i2c-ls2x.c         | 16 ++++++++++++----
 drivers/i2c/busses/i2c-npcm7xx.c      |  7 +++++++
 3 files changed, 20 insertions(+), 4 deletions(-)

--HSYRcmPAYZm2E65K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfDYoAACgkQFA3kzBSg
Kba9Hg//c9q0n9w/RCXrXGkzXVs4h1cbOXLkmxsZNh7zOrnbHx6ex4aUlghc8EHj
7Urxrwxs1GUQMyfdFeR2VpEuRkHxcg5+RLDNzf3KwWQK6gYjIk45qxcj2LsSyFx+
tJLx26EkdVlnbh8vBM19OIMBknWrA25EAx9g9HlBDgCWZFFMD9K0W9RDFuIiD9zY
BUMSUZKzc7wuz0/H7camfZzQx96/Tc8tIPiMDKyn3L0bEF/2ZmmSxDtbX8uN1AAz
qPEmxOm72FXI5MAi0PoDhEk/26mEkKw0SPOmysdW9y8xfUqMCC6oHcpintzFBZ54
8fL1vZo3XFr6LwyWmPf6JDP/qyaadguyKJ84kM21ICcWwXF1VIByNJToOSZQGKmX
Ks0JEDLv/3CdldXwHoqGkHf8D1W7I5N0FHqxLfifT7DnDIWEH57eWCoVNMiooMj+
u1nCGQNOQrNOHa7Nn+nxMHT1iTl6d0kJm2ofV1JIR4YHEKSja2ADSAgF7QeCnOcu
DrE7jdQuHbH+ie8A2QYPoMA4gzgepHf6FL0O0AICVWpXInNysr34DNkVft+hrTCB
4oBaC0SThR0fyj2NhOmTZ3LTK0hggyURlp8QG++DyT88GFzkBE/p8hOBFrOdDzUl
RPDBHSjji4aRLZvM255dHzqJsmqQCmJ0PR0vaUbAnErjhQsGHNQ=
=HNBw
-----END PGP SIGNATURE-----

--HSYRcmPAYZm2E65K--

