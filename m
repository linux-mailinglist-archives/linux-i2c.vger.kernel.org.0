Return-Path: <linux-i2c+bounces-12042-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 69154B12C8B
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Jul 2025 23:08:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E30793AF184
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Jul 2025 21:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FA3624503C;
	Sat, 26 Jul 2025 21:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ql6dr1qW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE301B3923;
	Sat, 26 Jul 2025 21:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753564114; cv=none; b=uKN9dXTLeG2MZAkFYez7bAilwWkvdTQQBnENp6zbVHfrAvy9skTvIcx5y+ttlNYyzV/lbfL8iBifVhPVTFsbyN/kVYXJlq6GTFzFz5sMDy9BVF593fiSroNMiKFYtjiFwcn+LvHItKaVwk0vMIByTzhFjzBy7G9K8IjrrwQiU2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753564114; c=relaxed/simple;
	bh=sXoqk2Ue4pnszhxzk78WMf6TMmcTZIz7ECp3SfqwYlA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qoIg9BWBZ9xrxCRvVOQHdKEUu5RP8EQcd2MvR8bifXZRSLbYbjI9XEMXrV/tMuOl4q5uxUnHiZzafguxSaeGy/ezduWbcWJi/AWR24a8FIxQWJ3gGnPklIgaHyTcBogj/D4xg8SQgeHbhzXsYIh9VtwexnmLM5yCD+WvLoQohyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ql6dr1qW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1171FC4CEED;
	Sat, 26 Jul 2025 21:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753564113;
	bh=sXoqk2Ue4pnszhxzk78WMf6TMmcTZIz7ECp3SfqwYlA=;
	h=Date:From:To:Cc:Subject:From;
	b=Ql6dr1qWjHTtRA0EOzdhutTX3UzNBL7NPCXr1JuDVb4NEmGxqzcUgIlzJACind6OR
	 cLFMU/uTZRHBvEMYJsOctYKYlD5PQICdNG7AnfNhpvYGO9wUXtL8wsngZwmHM4/LrC
	 wjmwcy7Dw4Qi1CqH4j3VGjnP3I+PoeNG+cBbgt1xuji+VFOo5WajLWJpOU4BsU9Q/A
	 FmEw2Tg+YF8DExrlV2X2dDZSev9Q1AMN6n5QOSsZ1+fVbiiEXq3n3J6mCfty6by2VX
	 vXOd+bUFFQxniKWMKEYto8EdtVNqIsF1CNcDw/pKs4+bjeBdr15lYFPR+14qrmcSsa
	 B49y/97TzqAig==
Date: Sat, 26 Jul 2025 23:08:29 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.16-rc8
Message-ID: <aIVDzXNdRsJ6xfK0@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="znyMYrU0vLQWM3R6"
Content-Disposition: inline


--znyMYrU0vLQWM3R6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 89be9a83ccf1f88522317ce02f854f30d6115c41:

  Linux 6.16-rc7 (2025-07-20 15:18:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.16-rc8

for you to fetch changes up to 31f08841dd5d479458ee98bdc91d63910ee19861:

  Merge tag 'i2c-host-fixes-6.16-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current (2025-07-26 00:59:39 +0200)

----------------------------------------------------------------
i2c-for-6.16-rc8

qup: avoid potential hang when waiting for bus idle
tegra: improve ACPI reset error handling
virtio: use interruptible wait to prevent hang during transfer

----------------------------------------------------------------
Akhil R (1):
      i2c: tegra: Fix reset error handling with ACPI

Viresh Kumar (1):
      i2c: virtio: Avoid hang by using interruptible completion wait

Wolfram Sang (1):
      Merge tag 'i2c-host-fixes-6.16-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current

Yang Xiwen (1):
      i2c: qup: jump out of the loop in case of timeout


with much appreciated quality assurance from
----------------------------------------------------------------
Andy Shevchenko (1):
      (Rev.) i2c: tegra: Fix reset error handling with ACPI

 drivers/i2c/busses/i2c-qup.c    |  4 +++-
 drivers/i2c/busses/i2c-tegra.c  | 24 +-----------------------
 drivers/i2c/busses/i2c-virtio.c | 15 ++++++++-------
 3 files changed, 12 insertions(+), 31 deletions(-)

--znyMYrU0vLQWM3R6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmiFQ80ACgkQFA3kzBSg
KbZslA//Xj7pYpVEPA5LxuwH0URy/PwLJf9N87zAcRo93V56ahH4IMUC7cjTpdYY
4AWzYMpInXhcL35bg+De2diMcLlFgHXgIf6cWI9v4OH9PMr5NKWoQlSoEJSRk4eF
48Hb5TADj5F5BVRtjE2m84/7fEe8CsfZkcHJ6TssfR9znsmrkVHVs2SYvS2enwzb
s9iGY0bZ4uDAHsMRO5QnYC9gOyo1eQWLuzL4Dif/7ZmrNObytUs0xejKAkLn06Xz
bHXXWPDYIeczSN9ibnLuVUEyNziXXD553dSOhq7OvQsy4xJUWEDpHTsHzNx2WeiU
YVvz5Ebn9I3JctO2VNsTTzpXbG1pe8qSZfPeDuChb3+35gS0sJwvbFwxDWjMAcX6
wtITUyo1sEE1c0YoeactvZfha3k3cqUPx8ghQ8P5yFNtcYHhMjhkivoKXNY90Tfd
rlfTzaXSjeNRQ0JWvHG9Q6JEgZoG5sqWIlSqF3cbUPqCbJGtnkeTD93cps0huwNw
2RRJmD1IDVGygRwTxK9JCB8froTum6AYEkjVLgqKcPu0DlujzBYqYyycet11SSVK
OI32paNzCGQUIA0BrFDqbFfYIxScBrDNDY7odEpLAt8zG4KovNiD5tM/LlLbiNt6
sAB7TmHLcV3EPF2WFXYKwicOfk+nt0qYFzxJo9OurL4zVo+iCeg=
=IZUP
-----END PGP SIGNATURE-----

--znyMYrU0vLQWM3R6--

