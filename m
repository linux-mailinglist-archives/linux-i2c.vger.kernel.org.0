Return-Path: <linux-i2c+bounces-5275-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0705494DC6D
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Aug 2024 13:18:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC7CE1F21CDA
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Aug 2024 11:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4565A15278E;
	Sat, 10 Aug 2024 11:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GZMAZs/o"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004621B810;
	Sat, 10 Aug 2024 11:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723288685; cv=none; b=kTTIoE+364Pl+W67drdCOTcmRzAQWABn5jSbjy/yDSqX7IDVRvDWGxXpFD00+h6osVMZTsGwcSFRofpC89Nb6B7hzJ37VI3zGWeFcD+enXv9Z3iXMKhLl4alQkL19r0BWd4IKTCFrSoc6OeCQSF+c9S6Vp7yFwW12q0/UKbPMHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723288685; c=relaxed/simple;
	bh=dBUPbdDGqDsX3bSVuvRws3j2ItrGNGnfm8wLIuuT2M4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l2/95ZPPdPtbv32JEsxoaTduPR1Viu26wIqCkl8J8m+crs9AtPiaNum2V20SiYQMK2WYS6mHO9lqQZMLN+sqGZVCRYP6x8OD1QBFkPizSQVWgvlEd87oWi53sb0JFbV35O8e+dJuS59BTNNU+489fhJkcH7soaFtnabc/tyA0Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GZMAZs/o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB11AC32781;
	Sat, 10 Aug 2024 11:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723288684;
	bh=dBUPbdDGqDsX3bSVuvRws3j2ItrGNGnfm8wLIuuT2M4=;
	h=Date:From:To:Cc:Subject:From;
	b=GZMAZs/oAitTdGmz233ivEIikyJSUy7fzw9Z/hbH9QdBYfnUitfGjBcewpAuEt36U
	 34eZWQ/6SEPwKy2epQcyguO3uvZifFRxwq2URDpmVM7fwPPq+HT/7oQPCUbRJmRQmv
	 xHDDQBqhofens7+4Yo5Kh2A0N0hYCGBWMd6M7gbQSfDX0UyRiklt8cs+vSILlGKdQs
	 DzzLnRa0r3owCSAr2H+6yAVuQQirf5sst1mK0/b5QV4ddlkQ1EpI1KVVzDW6VhTTVJ
	 tvZGikHDlYIBJVtTGFcJvCPOXUpuBQoZlMSj0zVB4PA42F/fGzVxhc8NF/UAxprXr3
	 d1Sbbp4vdroWg==
Date: Sat, 10 Aug 2024 13:18:01 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.11-rc3
Message-ID: <ZrdMaWTfpmCfKqeA@shikoro>
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
	protocol="application/pgp-signature"; boundary="+oB5Gc7SstWijNr7"
Content-Disposition: inline


--+oB5Gc7SstWijNr7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit de9c2c66ad8e787abec7c9d7eff4f8c3cdd28aed:

  Linux 6.11-rc2 (2024-08-04 13:50:53 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.11-rc3

for you to fetch changes up to 01a620d491592ead12eca039fe1c9e74908c35cf:

  Merge tag 'i2c-host-fixes-6.11-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current (2024-08-09 15:28:08 +0200)

----------------------------------------------------------------
i2c-for-6.11-rc3

SMBusAlert handling in the I2C core gets two fixes. One to avoid an
endless loop when scanning for handlers and one to make sure handlers
are always called even if HW has broken behaviour. The I2C header gets a
compilation fix is ACPI is enabled but I2C isn't. The testunit gets a
rename in the code to match the documentation.

Two fixes on the Qualcomm GENI I2C controller are cleaning up the
error exit patch in the runtime_resume() function. The first is
disabling the clock, the second disables the icc on the way out.

----------------------------------------------------------------
Gaosheng Cui (2):
      i2c: qcom-geni: Add missing clk_disable_unprepare in geni_i2c_runtime_resume
      i2c: qcom-geni: Add missing geni_icc_disable in geni_i2c_runtime_resume

Guenter Roeck (2):
      i2c: smbus: Improve handling of stuck alerts
      i2c: smbus: Send alert notifications to all devices if source not found

Richard Fitzgerald (1):
      i2c: Fix conditional for substituting empty ACPI functions

Wolfram Sang (2):
      i2c: testunit: match HostNotify test name with docs
      Merge tag 'i2c-host-fixes-6.11-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current


with much appreciated quality assurance from
----------------------------------------------------------------
Vladimir Zapolskiy (2):
      (Rev.) i2c: qcom-geni: Add missing geni_icc_disable in geni_i2c_runtime_resume
      (Rev.) i2c: qcom-geni: Add missing clk_disable_unprepare in geni_i2c_runtime_resume

Wolfram Sang (1):
      (Test) i2c: smbus: Improve handling of stuck alerts

 drivers/i2c/busses/i2c-qcom-geni.c |  5 ++-
 drivers/i2c/i2c-slave-testunit.c   |  4 +--
 drivers/i2c/i2c-smbus.c            | 64 +++++++++++++++++++++++++++++++++-----
 include/linux/i2c.h                |  2 +-
 4 files changed, 64 insertions(+), 11 deletions(-)

--+oB5Gc7SstWijNr7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAma3TGQACgkQFA3kzBSg
KbZ4Kw/9FcqLUEB0fCwAg2JvxRqEO1Eav/SwbswJxWe/qEC1qFY/OJ74zg6iNKye
4XGyERDS+nKBYCQWsfe3nCHH2AI9+q5+d0JGv3wJGAaIjisxZRxL+BTb9S3Qw7hI
xP6/iRBH6ZVFPpUyP/zTJoiFDSwjbxIeRVM1Bm33TAJTfnhFVqPCooOJOWIGuv0E
DeTADWGuEpLLhOFFb52c/5CPeSWr6yiHvsV3jaep69CKbO63L1GU4CeJBShKWJcl
vD+C1YJ7CqiATbtVyxc/Y5XXjPvX0J1hsmjhRcSHhsw4eOsACarP9Z7pJL7fXXCR
iT4iH3HVWOT5gTUYxwSZvabqgNGn0ullZNXEqSe/idg+hjazjBznSdnT4dDceUBS
qFDDMCW+RYlT5LYsnl04EFG+G44tnwTlyf02eTS+BSB1W0yuPJiVOeX+tE1/OQA6
3Nip1j0HULN6BmOjtJOc+SmEC0ZZrk/P1Ax5sfKSSqFqmIsynv5rThR24TFgH8Sb
mn/H4wVRXu2f9V6zE30uCllDcWvYfWYp/CgGDZbv7zgut9k2i5vkbSLLM372rwr1
n059RwKbk9Rp2u6bRDhAMw5i+W9RpCGZ/UA7xdwjV1x4sYuLXEI4DoXkvYmFi+co
ZM6bTHucu0nfHoQ/7XEUr/eH1vd09Ig/hpA2VoPnfzl43dMEp6w=
=zXid
-----END PGP SIGNATURE-----

--+oB5Gc7SstWijNr7--

