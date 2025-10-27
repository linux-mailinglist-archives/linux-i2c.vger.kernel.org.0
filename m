Return-Path: <linux-i2c+bounces-13832-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 486F0C0D72E
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Oct 2025 13:15:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FB0F3A7B18
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Oct 2025 12:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CD3D301012;
	Mon, 27 Oct 2025 12:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jDzZsf2P"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0D63009D9;
	Mon, 27 Oct 2025 12:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761566922; cv=none; b=Bp/q/ezbYvhyyza5+NwF2FiPA04Jd80wuG9epgqYCAL7aWEdJIQwMGJ4bLkoXe1JWzSTqzCvbRZdbyyGtbcz5Bj7QT6RuMSkOFPNqeG/3HlwhWqfJkJAlcpeCLdMXzPMg9CO+GB9L6Lwwcm0HyI8Xg5904xR+T9qpJipgZroas8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761566922; c=relaxed/simple;
	bh=WuGfIQ+tG2jneTygaVEiQJvQSrmd5e58lVq0BP7dw44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=syFI64j/DoROh1qS+/fiHNmV24lUFE1CX1vv/76slrpQzGlokU+U4lG7nK0SbV1LY4sxbgO7zjK12SrrrO6br2o0Zx5p+6ARQa1WOXtkjQaypFydszVKC2X+2iolEWUKzFaKLTp6xAOuHtWKmZAnwiQ9PAiOCT2KAZHLwfdT8tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jDzZsf2P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F34A2C4CEFF;
	Mon, 27 Oct 2025 12:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761566921;
	bh=WuGfIQ+tG2jneTygaVEiQJvQSrmd5e58lVq0BP7dw44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jDzZsf2Pb9QWorLgRaQo0kRdbyrY6T9ANXI6cMpDVAL06ACAgFDrqDn5qBUxee2yH
	 zYIUMBLAi/Ik6jgr+lN08HXD9WjCcAFqcDdl9HrrCXvbuzT+lTfjU8OX7NkbNO5wjx
	 r7lzjsbx6S7LEX7U/WooITDDFKvVnnm5uGrBe3ZAGJSvvQ+cnkmlS2eBhlXqruUXKf
	 e/s9Hbul7Xzuei3n8QaO+BHhJGfEuQJa7L2+0nmAF9WR8Q8IbvFYrmXWst6ud4xhnM
	 6AKJ1psai8xuL27Ph6iw5huiDkxIIZYOOSMSQe6tmIaSqEsFNqwTihIdzsseoe4Nv6
	 6dHHsh/VgXmTA==
Date: Mon, 27 Oct 2025 12:08:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 4/4] regulator: spacemit: MFD_SPACEMIT_P1 as
 dependencies
Message-ID: <9964721d-eeca-491e-9700-13f7ab66c4d9@sirena.org.uk>
References: <20251027-p1-kconfig-fix-v2-0-49688f30bae8@linux.spacemit.com>
 <20251027-p1-kconfig-fix-v2-4-49688f30bae8@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Qgx8naedt5U4Gp/s"
Content-Disposition: inline
In-Reply-To: <20251027-p1-kconfig-fix-v2-4-49688f30bae8@linux.spacemit.com>
X-Cookie: How do I get HOME?


--Qgx8naedt5U4Gp/s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 27, 2025 at 01:48:08PM +0800, Troy Mitchell wrote:
> REGULATOR_SPACEMIT_P1 is a subdevice of P1 and should depend on
> MFD_SPACEMIT_P1 rather than selecting it directly. Using 'select'
> does not always respect the parent's dependencies, so 'depends on'
> is the safer and more correct choice.

Acked-by: Mark Brown <broonie@kernel.org>

--Qgx8naedt5U4Gp/s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmj/YMEACgkQJNaLcl1U
h9Ay0gf+IgmWmQeq60zu9vsu+n6e8+NNPmt9Sn7rEiF2HnhwwYuV9H0gcXPhlyus
mgyiWSCDo2vH+edAY2zHFb7KgWtGrG31Bf5jTpaF5QtG2x5ZcpNgRhnodKTBEFff
ovMpQXPMzHeu/1fGbE081rV4bc6iQ3Vn+Rbl7giqaqZ98a/ibQZUcset34yl/UTu
9bQWFHzI//e0sl8UnMsyk0E0VmKKdqCjHlneRqmYhmB+1/GNEiTeRK2P2O4XwOuw
D0nhTEaXmm2OIlIBRMezE6gsnAptWdpFrBal92/CBNesEZ4PTu3NdqWQkOOfekG+
eRMz8He3JKvL5pb2PFELkRxo5hBr8g==
=Vfcb
-----END PGP SIGNATURE-----

--Qgx8naedt5U4Gp/s--

