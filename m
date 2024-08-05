Return-Path: <linux-i2c+bounces-5151-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19905948271
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Aug 2024 21:40:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9F0E3B20CF4
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Aug 2024 19:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B2E016C680;
	Mon,  5 Aug 2024 19:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r/FsDV4V"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E107B16B3B8;
	Mon,  5 Aug 2024 19:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722886811; cv=none; b=RRMU+a9bg3Z70nkmJDTGPPlUYutZ4VN5aw7mq4jyWz8nRSw3GQdHFxTbjrx/NPYTSifT/HxHNFQ2SKHCJf3/0Sq5EL3QKf0sKVzcLBbDoTyWWBhPOyHNUuqycdkM3L2DeMKN/U5kBRRhYKMruAIoTqee64ha1oKn+sQcTnIg7e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722886811; c=relaxed/simple;
	bh=nsjCGH343izgOMkxJYAFGHUyQp8LXP/VhiPZfGja3sk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lf/eR6E4vdr7ohXsNw6TjKZOGtSxGh0BuF9bXkp/nf+D5w+lA0VF7rYW5+nIuVL0DgzNT2G2Z+HSrXEIr09xetXwZAEfleMU/wZ7FLRbS6Hy3GmJPZZeOM9bpoED+R3J7jX6r73k9yZH89Tg/mSQfTdjD0gJnAa89aW2882oRKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r/FsDV4V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80303C32782;
	Mon,  5 Aug 2024 19:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722886810;
	bh=nsjCGH343izgOMkxJYAFGHUyQp8LXP/VhiPZfGja3sk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r/FsDV4VUpMBy9Zf+ZF642nX114nx0JsNcWcTl40GcDV7z9JFNq9bWVd1+iHxCc2x
	 QzYDX1tWqUeHqa5CuOA6Xvh7s383BkvP3LvRtXu7sctMHxTbkMHFjrMm95d15bACRk
	 zuS19XNGsGf6jnbQfPEEMzUxljWbO/OuT8rhNEGFX6ADefT/nkwC0azMIyeytrjU/5
	 ojZHU+TiRgjqIrVyyGEr+TLutxUstLHz9PGD7jdl8RdonFD2HOkUTENoO2FMxwZCTQ
	 O0fdcw1z3E54mo2zIbcE//h9II38mHCeaU9kpzAfdzRZ4HiRlD2fc9+oQv/NMDQ6WA
	 ebaFB0po8cg1g==
Date: Mon, 5 Aug 2024 20:40:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: tiwai@suse.com, wsa+renesas@sang-engineering.com,
	mika.westerberg@linux.intel.com, linux-sound@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v2 0/3] ALSA: Add support for new HP G12 laptops
Message-ID: <c2dafdd5-64c5-4184-9b19-da4988993195@sirena.org.uk>
References: <20240802152215.20831-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U9cAF4Z+E/FV6Zqo"
Content-Disposition: inline
In-Reply-To: <20240802152215.20831-1-rf@opensource.cirrus.com>
X-Cookie: Goodbye, cool world.


--U9cAF4Z+E/FV6Zqo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 02, 2024 at 04:22:12PM +0100, Richard Fitzgerald wrote:
> Add support for HP G12 laptops that use CS35L54 or CS35L56 amplifiers
> with Realtek HDA codecs. Some of these use the same SSID for models with
> CS35L54 and models with CS35L56 so the ACPI entries are examined to
> determine which amp is present.

The following changes since commit a0c04bd55a467aee3eb647555343ad6971106e86:

  Merge tag 'kbuild-fixes-v6.11' of git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild (2024-07-28 14:02:48 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git tags/spi-acpi-lookup-dummy

for you to fetch changes up to 90ec3a8a7fd0d43026fcca979713e077d4883b56:

  spi: Add empty versions of ACPI functions (2024-08-02 18:51:59 +0100)

----------------------------------------------------------------
spi: Add empty versions of ACPI lookup functions

A patch from Richard Fitzgerald adding dummy versions of the ACPI lookup
functions for SPI:

    Provide empty versions of acpi_spi_count_resources(),
    acpi_spi_device_alloc() and acpi_spi_find_controller_by_adev()
    if the real functions are not being built.

    This commit fixes two problems with the original definitions:

    1) There wasn't an empty version of these functions
    2) The #if only depended on CONFIG_ACPI. But the functions are implemented
       in the core spi.c so CONFIG_SPI_MASTER must also be enabled for the real
       functions to exist.

----------------------------------------------------------------
Richard Fitzgerald (1):
      spi: Add empty versions of ACPI functions

 include/linux/spi/spi.h | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

--U9cAF4Z+E/FV6Zqo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmaxKpUACgkQJNaLcl1U
h9A1jQf/ThbzDuoxq7pKr3RSBN1wmnlzv0e3UL7TqekNxcoyKeBGCTnuei6frNYE
tGt+cNydd7vCSVeGv5Yl0tjNetWRi+UG/XoNpMssPPtESyEHeFoDpSfkTBZIingp
7b1nYLjKDoXhATCAIHTzjxlefkTPncvBVqh91T5yA29d54nM3FsnRr1hqsVusQqF
j2E/cUGXQN1+nQNgItXaSrUMuxGHUKro0sjFryIR8/fx+ymoUL+i0v8UWadV7kR0
y/vkuLN+dzc4ktN0bTphehCqIed85KB1p5/P8J1xapGAqPfZWbRiifQ42v+ni4dp
kC55BY7n03BTzbzHkDRDBUhX0yRhyQ==
=ct4I
-----END PGP SIGNATURE-----

--U9cAF4Z+E/FV6Zqo--

