Return-Path: <linux-i2c+bounces-11086-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3BAABE533
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 22:51:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DCAB8A7342
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 20:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79FD221129A;
	Tue, 20 May 2025 20:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="NFJa2xx+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A472010EE
	for <linux-i2c@vger.kernel.org>; Tue, 20 May 2025 20:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747774246; cv=none; b=CLb75DL7YE/qjdP8YbLFYhRYEz91MssVyCLsonYf+A5sEVZh1Ud/NzfGUzHaMT3ccCLU048oocCsSWAi1DKWmRLyrMIz351bXYBxHl1dvwe8hlhGcj/bxtW+1PMmlpbbXzJ5RiT9tNg4OPnrRrlh5UFzYCzQcpxwWgDy1uegxQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747774246; c=relaxed/simple;
	bh=6j/xQ/XDZ/5vwEelfWdXLSBU/lb9tzGJP7hwiRt5/ic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g3KYuMiJyHUzfkjz2vj58gLv9Qsh0a8lfsHghI3uL02ywT/bPL9pTBrUa2ubXrYb0fYr2Q7Ro/JR3UfDLYtRDr7Nhm9BImQnnuxMRjuURV4MOur996lBfUh8HUGWGfR53WYmaqTwO+KbV7Jb3YRDmATLwMO7qBwn1eNF/GKPlDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=NFJa2xx+; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=6j/x
	Q/XDZ/5vwEelfWdXLSBU/lb9tzGJP7hwiRt5/ic=; b=NFJa2xx+LcX1VpOg/hNu
	qWyZoVtAkXbIi98iC6qH2/8R2H8b3Qfv0gutbNjmtHmsG+pz9pvBi6jQjhOqVE6F
	0T1QG+t0PoH6lc9myEQAeKU0ZF5v60uMQcpfKGC4ihFCcmxASp1rnA3VWxS9Wwzw
	tiUyzt9TCw9fQICxmvsEbbYcjxAA9I1ZC8B9xd1cxwEHaU5svar7mLwZ99QHYbdr
	+79O7y30stwO9M4V31HgQti0wL3DfAgERW4E3BoFvsNyuj+vOQh+HG3eWY14dvdV
	wJJXEBrYPcuM3CeqezAfB3yENFbYfgYQXOCJY6Q+LEqpgBhqJ+L58bNHokDUp+JB
	TA==
Received: (qmail 3015612 invoked from network); 20 May 2025 22:50:37 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 May 2025 22:50:37 +0200
X-UD-Smtp-Session: l3s3148p1@AOeSZpc1xpZehhrK
Date: Tue, 20 May 2025 22:50:37 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 0/3] i2c: remove 'of_node' from i2c_board_info
Message-ID: <aCzrHZK_YN6dLxzO@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>
References: <20250519111311.2390-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+gdyaTKa0CKxLXgW"
Content-Disposition: inline
In-Reply-To: <20250519111311.2390-5-wsa+renesas@sang-engineering.com>


--+gdyaTKa0CKxLXgW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 19, 2025 at 01:13:11PM +0200, Wolfram Sang wrote:
> I promised Andy to support him in his cleanup efforts, and here is the
> outcome for tidying up i2c_board_info. It seems it was easier than
> anticipated. But my scanning scripts (awk, coccinelle) didn't find any
> more occurences and the build bots are happy, too. It really seems this
> is all that is left to do. No complaint, though.

Applied to for-next.


--+gdyaTKa0CKxLXgW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgs6xkACgkQFA3kzBSg
KbYIcA/+Mwkwe+oxJeIG0cOfe2SNYP4uJEPz9J2/exPnSVguGXIF2+V2SfOFQjh8
zpjJnZxnKkS6Ja8lrrMvxWHpf6uExX2CtN6DA/O3Q2air0NTl4TezzzOGxMHgfZv
2aiVTjYANHnENTHQx29eWZx27WkKKqNMdVPm2K89JeUFpikEXPHJRsoUKiqYErGF
DgTuUorcj4wmsxZc7qE1HlzEnMpSguQeWQa+XT1TFZ2wazJRPveg330gVvBCT3q8
lTVkb9MkzBEEBVfbsVMHWn2wuuw/E1WeeOO7dkENGCMhHHjbjBBImRc6IKP82qtW
h60nxdw6BrcSHHhKwQvEQiQ83IZhDXzUeThLQ/gkog42S27uAAHVbt0Vc/fKmy6x
Ug7CvLupjzqDEqNYKZYHBzi1hckNgAR3Gz2wWs2Rf65dHFhcLPKmiMLzXGrkkiSq
gT+zp+JoLttG6RH4XtfFHZ7rmRMptO9r//JcUKFlp3in9lsyJyYqQqnJ4ziaUl6L
v/hhIfM4BPqAc4kljqmr9fggkEaHNw8LfBQVPC7KuYDEqsc8mrmekxFnFYJMSd+P
L3kyh3zdxnb0BMg33Vjyu+t4tXbqlqR6755ySE1tUbKRFWV0jI4GkMbB7b5eQwRw
Yqtbm1VKkit7akyPquHHk0gVl7It2n3KBmidaNSFf9v53K2cZ70=
=dOW6
-----END PGP SIGNATURE-----

--+gdyaTKa0CKxLXgW--

