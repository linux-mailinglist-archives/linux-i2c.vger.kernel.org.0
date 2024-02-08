Return-Path: <linux-i2c+bounces-1660-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6505084E349
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Feb 2024 15:34:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04D6CB233D4
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Feb 2024 14:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C2057992A;
	Thu,  8 Feb 2024 14:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IyVEfMyG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5465E6A347;
	Thu,  8 Feb 2024 14:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707402874; cv=none; b=MX9uakV+Hn7ZId5g13SKJgqOqbBElGvHUmh4guJuPLhI0Vvjb/y7Ttc2LRzEgRx8fGQo2TCuMtKaaW9d3VAEEhYWqcx5Yd9dHAfJO0G7eOYCXL92VK61iEisZEKTflnzf//yvwFROrrYUfE6J9Zflc+1MVbtNiMLzAhUyPKq6eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707402874; c=relaxed/simple;
	bh=cjeBQF+H60qIRCN8KiTSL9BpFV9avuvy09H2SemvsUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VmVVMHW0ZjfNfHjuWJW4wt1I/sSYKboocwwbxMIM6ZGP8uq0B97EkzscEGW+kE8BMLGaaebp/xeN1BFq83OynBsvw6/p1ojgSinWWlF0ZRfWhvC3s9/fDu+q6XGXi+9ogn2akTFtzxnxBstR0rGH1Kq8LNhviPffSbLrLUxIO9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IyVEfMyG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7192BC433F1;
	Thu,  8 Feb 2024 14:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707402873;
	bh=cjeBQF+H60qIRCN8KiTSL9BpFV9avuvy09H2SemvsUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IyVEfMyGfOFoou2K8QzU1KqpicVeCZb0GO870IEZ2BfvNSHL+O763XVE+6Co4+NZi
	 733hgpRETljSCdt8xfp0EeZ0Ti2awUJ+oSIfAe2XVz0WeEFkijI5S0dlBUU6k5E7fk
	 MI2E9xYe/qQLfJFnJi8575kBzTPmSu9RxFYfBri6fxgQfpBn0sgSsrHqyWoIKr/Ham
	 oybP3+loI6ITuzFtC7IZhx2u12zG4jg2IIaZivD3c+UzSxoBMRr7lknnlahSSIMFK0
	 9Tut197zeX0mk5ycsGQHn1FJjfkpu+FEiu2j+9zF/Yhw4aHwJw9V+vkN1SfQbDCl+0
	 hDm7nsxrys/3Q==
Date: Thu, 8 Feb 2024 14:34:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Hans de Goede <hdegoede@redhat.com>, regressions@lists.linux.dev
Subject: Re: [REGRESSION] `lis3lv02d_i2c_suspend()` causes `unbalanced
 disables for regulator-dummy` and `Failed to disable Vdd_IO: -EIO`
Message-ID: <ZcTmdg2qTq0bP0ul@finisterre.sirena.org.uk>
References: <5fc6da74-af0a-4aac-b4d5-a000b39a63a5@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WpfLvOBs6QH8Jk+0"
Content-Disposition: inline
In-Reply-To: <5fc6da74-af0a-4aac-b4d5-a000b39a63a5@molgen.mpg.de>
X-Cookie: You might have mail.


--WpfLvOBs6QH8Jk+0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 02, 2024 at 12:38:04PM +0100, Paul Menzel wrote:

> Testing commit 2f189493ae32 (i2c: i801: Add lis3lv02d for Dell XPS 15 759=
0)
> [1], it=E2=80=99s very likely this commit, it turns out, that Linux logs =
the warning
> below during ACPI S3 suspend:

The driver is just buggy here AFAICT, it's powering off the device in
both runtime suspend and runtime resume so if the device is runtime
suspended when system suspend happens then it'll power off the device
again.  The runtime suspend and system suspend need to talk to each
other here.

--WpfLvOBs6QH8Jk+0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXE5nYACgkQJNaLcl1U
h9D2FQf/aIy1W/ZQfqQl38qjH+AxWm2uBJTRKtUWbZlYKX75+sYgnz+SSeSNs5Uf
tQ1fFae7U27jP4eqD10dVVx9iInwPHg7MZMSr5eEoZHKxpTDBZzDFNbYFXeuwZNi
cR7lGKdqV2zBhKeGip+h+JzwPZk5kSzM96lUFe1QJZwCKvr9ocj6fqIedTrtbkCC
Mn37SnlSTz9H3/0+uk3xMyop1EePKJSmpgGORA6t6TfPzPhqhjBkyFDc5XpqmDtK
v3p6QH0xRTLQbvzo2fAEXgYGPdOifKXk6jqDWZ/l3aOSzMu6+Zmcf3hVt/zIcsWT
ft9AUmNoVO3FiPNqqcaqCpMC4oZWnQ==
=MLow
-----END PGP SIGNATURE-----

--WpfLvOBs6QH8Jk+0--

