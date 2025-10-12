Return-Path: <linux-i2c+bounces-13454-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A76BD0A0F
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Oct 2025 20:45:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A87EC3AA531
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Oct 2025 18:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D50628726A;
	Sun, 12 Oct 2025 18:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FmaE5Xb0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491011C5D59;
	Sun, 12 Oct 2025 18:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760294735; cv=none; b=WE2IZX7TR9jtOkoEwNxmstfiBH0snb7AovvPoIrp8bCln7hjoT8J05RXj1eiB1KBj+ayElpT6cLNlqVonnsGwpz6GGs3lUxy3gQuQkCajwVlYPK0i7/5QpLQhQZTidG/bNo6IVy3DwI+S0l3ZzGwCIxGpYsQrsu4qEuGhdb1ilc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760294735; c=relaxed/simple;
	bh=B4eXxmYnDWmtMin5Q/RChD69gPK+UfsPc4ZA1HjS348=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gZaw8pVH4mm2Y+/qb3KAbhYP4YhStHFFFJ5YeQup1A65b3EO3WZMw0Y7kfDw9wqgfX6TwrOi2fMjyVJaDmBPk1jhO6D8YM/4Z1LVhHX0l0Zz8r6Bhe7+ScVlup9X3gPtNpZSVq6s9cp4s56jhGSm6hpI9BOqONUjWUAWjcsugPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FmaE5Xb0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18561C4CEE7;
	Sun, 12 Oct 2025 18:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760294734;
	bh=B4eXxmYnDWmtMin5Q/RChD69gPK+UfsPc4ZA1HjS348=;
	h=Date:From:To:Cc:Subject:From;
	b=FmaE5Xb0KbgFecfDqv/02JaL/BqvGb5CnF2rPPYBdZfkJefIAL8i6YGDts0HdEAnC
	 hq1dQfPe410hYInFcDaNve4Y1M8R1XHTkvB1WhHlvuT7+fy+1UxXKZrJl6noGkryr3
	 6/IOt8w5AV8v8ksKZvNWcKlN8VaCxTlX+zQbGxg/CD/Ik3Jss+kT2bNUmupkaoXffX
	 yHmP+avlSQvsyz5tVnPnlfpLSI2R1DGRJvkgV78fdomdjhIPHzNlMcS02iPstkUCjg
	 Unv5Cq8jriYQ2cAJ2QuZMoI/lHE/GRiYwF6x00atzE6ZmdXtlsvKRiMH36p7bLZAnd
	 DvhFsxEH0kOAA==
Date: Sun, 12 Oct 2025 20:45:31 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.18-rc1-hotfix
Message-ID: <aOv3S1lkcqj1BncF@ninjato>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lBo/YgF45IPmDLH1"
Content-Disposition: inline


--lBo/YgF45IPmDLH1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 98906f9d850e4882004749eccb8920649dc98456:

  Merge tag 'rtc-6.18' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux (2025-10-11 11:56:47 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.18-rc1-hotfix

for you to fetch changes up to a8482d2c9071d75c920eba0db36428898250ea57:

  Revert "i2c: boardinfo: Annotate code used in init phase only" (2025-10-11 23:57:33 +0200)

----------------------------------------------------------------
i2c-for-6.18-rc1-hotfix

One revert because of a regression in the I2C core which has sadly not
showed up during its time in -next.

----------------------------------------------------------------
Wolfram Sang (1):
      Revert "i2c: boardinfo: Annotate code used in init phase only"

 drivers/i2c/i2c-boardinfo.c | 4 ++--
 include/linux/i2c.h         | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

--lBo/YgF45IPmDLH1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjr90sACgkQFA3kzBSg
KbZQOBAAippMWPcsPt6nMj8OfGs49/CLCrTBn/3TVJXWvkRGIAowA8nPVpkOc73z
BxBYXdVSG8D252p/9SRShx2dsiHHGZGQ+zTaE8eVXG6BiqWcSngt4c8N+z7yqf7v
HPzz9i8lJ1aLm5BT2B076RWHykK3sVUkezchtm/mjP912mpuTm3/qMzCJeTx0kB9
i0jR+UvK0gwdhP1CPD+UnTZ3gN1Yti9p1CjL35H1w8K7J5oZJ8NW3xxsG/qFJ+87
HlH4RKGH/R9nDkBErrJmR+KZwhtADXEtFnXhEuKEzNiiIb7Np4lgO0XtUtmVQoFJ
eC/8xXl/NKlLW3QIzLbqmiaBcWqLjmKBGZtGEYTI68V1K+69z56J2sWuP33tyZ/J
eNm/LGJx0VYp692QI76pskNb4odCHKGO2jWjidIfXafOQjpwAEzT4OIinS5PWg5V
WiMRISU7CFs9lq688mrj9xyyxSkUHV36vAjtTkPejr7Lg7m08SKUNhpKyyX5z2sO
sn3CaTBs1Nci81fDwX4XyggQXniiVwhPWKXcnwpbqxCZFGuiELcKKv7yWmTfjYYj
tazeGZfxzXELgObyNaViQSk+nsT1jmDJOWgrKXrCD+mmKX3JquOJ+Vpl3UJJV7uD
ANl+ibes7ZGr1pF1Ti3iwoRcm8T8SZSos/XiDPBllOVfsgQOLSY=
=X+3J
-----END PGP SIGNATURE-----

--lBo/YgF45IPmDLH1--

