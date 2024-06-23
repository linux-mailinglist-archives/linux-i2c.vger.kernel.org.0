Return-Path: <linux-i2c+bounces-4277-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC9B9138E4
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Jun 2024 10:06:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 42D56B213FC
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Jun 2024 08:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F99D54903;
	Sun, 23 Jun 2024 08:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tr5j8XDo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE541175AD;
	Sun, 23 Jun 2024 08:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719129986; cv=none; b=Hr3gT793oNmhPx8tyC7N+Lv5rtmXU9wNATW8B9nKsmwtLrgndNODs/whN9c3yE3VI1QbXwml0SV8DveIN7tGob11xlNw0J5KvD2ILMcRxJ0dawfvFTAZaTCljafJkCwDDuXIKwfO7JLcO7ifi7XUD/eYQjXrTSgtdI33RzH7BIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719129986; c=relaxed/simple;
	bh=UOYqyx8Z7pHMjU/0127+Y6My6nfe2PgdCm0DtuH/jjg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dQqxGVrV5FwmB/skD9iMKeN+Gb5Ipp8OhpM6TdHJYH9FmlQHeS7E2uw80A8xIP86+X3d0hjn/qNH5SE3xsnyMc0L3T+stJ446X6I/GM0f4i3Oory6GzFoxp3GRLyXu3I2Um72AdFV6BUFtp1p+9aKn+rOVYXFVzXV85XvF1TExk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tr5j8XDo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9E0BC2BD10;
	Sun, 23 Jun 2024 08:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719129986;
	bh=UOYqyx8Z7pHMjU/0127+Y6My6nfe2PgdCm0DtuH/jjg=;
	h=Date:From:To:Cc:Subject:From;
	b=tr5j8XDohxOG5RXvP6Caeff5Yt3CHlSXjcnea0kieSlkNElyxe7gLZjR7RXdEdZWr
	 tsLPOdME0pvN/jWgUHo5/RoV/n0b1jOHAQR7tD1xgzlM16BX+/1ePHcwM9/i47Nz9I
	 FNsLsbeeO3wc13Fptob+FrftGsXaAD+N2W7MDkB3wEQeZzz/n+f8jTk8G/3aPsweOc
	 YS0OK7LgtxHmgI0Aol/PviVwxd2VjLaMjiHjZC3DxiF55eiZ1vxbMsjbo/o0PMM0yf
	 +pZStQnIuRajMqI7IdMO/qF9zR4nKz4/nwX9oforgDgSWIMPFJcGYbNbrIKJkQIr5J
	 FCfn8c9ohOOvw==
Date: Sun, 23 Jun 2024 10:06:22 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.10-rc5
Message-ID: <ZnfXfkZfI5iNZqBW@shikoro>
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
	protocol="application/pgp-signature"; boundary="CcDWrlTMmm+xypyo"
Content-Disposition: inline


--CcDWrlTMmm+xypyo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

the doc updates not only fix outdated information but also set the base
for new terminology which we want to apply soon to avoid dependencies.

Please pull.

   Wolfram


The following changes since commit 6ba59ff4227927d3a8530fc2973b80e94b54d58f:

  Linux 6.10-rc4 (2024-06-16 13:40:16 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.10-rc5

for you to fetch changes up to 2c50f892caadc94ff216d42accd8222e172b5144:

  Merge tag 'i2c-host-fixes-6.10-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current (2024-06-23 02:13:27 +0200)

----------------------------------------------------------------
The core gains placeholders for recently added functions when CONFIG_I2C
is not defined as well documentation fixes to start using inclusive
terminology. The drivers get paths in DT bindings fixed as well as
proper interrupt handling for the ocores driver.

----------------------------------------------------------------
Grygorii Tertychnyi (1):
      i2c: ocores: set IACK bit after core is enabled

Krzysztof Kozlowski (2):
      dt-bindings: i2c: atmel,at91sam: correct path to i2c-controller schema
      dt-bindings: i2c: google,cros-ec-i2c-tunnel: correct path to i2c-controller schema

Sakari Ailus (1):
      i2c: Add nop fwnode operations

Wolfram Sang (7):
      docs: i2c: summary: start sentences consistently.
      docs: i2c: summary: update I2C specification link
      docs: i2c: summary: update speed mode description
      docs: i2c: summary: document use of inclusive language
      docs: i2c: summary: document 'local' and 'remote' targets
      docs: i2c: summary: be clearer with 'controller/target' and 'adapter/client' pairs
      Merge tag 'i2c-host-fixes-6.10-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current


with much appreciated quality assurance from
----------------------------------------------------------------
Conor Dooley (2):
      (Rev.) dt-bindings: i2c: google,cros-ec-i2c-tunnel: correct path to i2c-controller schema
      (Rev.) dt-bindings: i2c: atmel,at91sam: correct path to i2c-controller schema

Easwar Hariharan (6):
      (Rev.) docs: i2c: summary: be clearer with 'controller/target' and 'adapter/client' pairs
      (Rev.) docs: i2c: summary: document 'local' and 'remote' targets
      (Rev.) docs: i2c: summary: document use of inclusive language
      (Rev.) docs: i2c: summary: update speed mode description
      (Rev.) docs: i2c: summary: update I2C specification link
      (Rev.) docs: i2c: summary: start sentences consistently.

 .../devicetree/bindings/i2c/atmel,at91sam-i2c.yaml |  2 +-
 .../bindings/i2c/google,cros-ec-i2c-tunnel.yaml    |  2 +-
 Documentation/i2c/i2c_bus.svg                      | 15 ++--
 Documentation/i2c/summary.rst                      | 79 ++++++++++++++--------
 drivers/i2c/busses/i2c-ocores.c                    |  2 +-
 include/linux/i2c.h                                | 24 ++++++-
 6 files changed, 83 insertions(+), 41 deletions(-)

--CcDWrlTMmm+xypyo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZ3134ACgkQFA3kzBSg
KbYPbw/9Ey6o45ZFS8G8SFCEn3CUSst8se3v1UE/Cn5mw2gAehELOqLn/f98AFAS
2j05gkoD28TEglszRCIaWBSISSW2XM1xVDQ6I0szmSBJyJ/43ajy536wc4gVAENo
BWGT8SxYCp6BM/x//hEx+sw3Ok1FKOTPb/pOZvcawXmmVXQbEA4fMPzHdRKSvFy4
abY5UMwYT8z34BqfBzWWq/oOgvZTRvgeFpzvJGDlAHaEs7LOeqeWF0LwoRiHQ3Q+
Mx03zbyy+r4fFKAY8UWUXWxVM/aBRVxhMp3CLfyRmq7tt7R4aru/v0P0GTawLtUU
FFKBEDkjiBaXISMsoCORhX/3rkvqVJItGuX2m8jHIUpHwvSPn4zjjTB0yRcn84yE
5MA0dQ8vngoP344EcBvN9zvAuTs0yzuv8mb7cVqSr4vf9ynkIwWEHkrI0M6U/Jti
WD3/WXGPwv24xAkyNQKlmcM5EH19VZwKhwr3oTyUuh6t4af6PeTCUwM/614vAbaU
hKs3GZ+DyhPCHXX75dqWvjkA/yv/ay2E/MhnWDWMICU15tKN78CizXbEUM1vaieR
tB3BY359gdMBCxPnU1OVDkXj2MdQN4bPPNSSbTuHl4x/5dBZZHdDx84VNSKzEhf1
tmn8Qwob2VolyPH+qvZNTWrDzJpP8AJfkKGWz6HTVGW35JEgG8w=
=umm3
-----END PGP SIGNATURE-----

--CcDWrlTMmm+xypyo--

