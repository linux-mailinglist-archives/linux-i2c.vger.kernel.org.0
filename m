Return-Path: <linux-i2c+bounces-13185-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44689BA1A4D
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 23:45:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C0CE56451F
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 21:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39921322DAD;
	Thu, 25 Sep 2025 21:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Loz85c5x"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07C0277011
	for <linux-i2c@vger.kernel.org>; Thu, 25 Sep 2025 21:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758836486; cv=none; b=mGIb0uQa687m75LPK6quvIZVeEw+fS7ZOar230UoOHY0C94JM9M5y57deHRLHVCjk6IuynuPMoOFCBUC+zm2f/aCHcRzHStPvEBE11uVeAu7pqciKGwPLpR/BfyNLsAqqUTeUoreBEwO/gRQfmdu0Q+0kaOgKXVnlg0JC7zWutI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758836486; c=relaxed/simple;
	bh=Y7JeSweNU8EmM7dpS4PCxDbvVYjn9N83VLWmufxTieM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NMYBM0D7cc9dEP5oVGYerExkt6jWDgb4Ip5BnUUPjqeohAY/I0mUNvI4PO/YJWGppKw0luchodJCMXCMVCTCD05W1KVqDlhpMEmKwTgmGW2aN0XB2Z8vAQzgLBqLMOvwfRZJP44GPTsJNRxAYokJ/FKfo/DytsXsyfpi8dek9k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Loz85c5x; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Y7Je
	SweNU8EmM7dpS4PCxDbvVYjn9N83VLWmufxTieM=; b=Loz85c5x2ysawknC6a1w
	oMwPSzmE6E8AHoErUnxFcK1WE4ijyoMiDlF5XC/FR6SAedGw9CnaLOk0d2rWDj+J
	0VOH+YhIyqAiIhckLocUApw51RaK03DgDQb3fqpZql8oJkjtncPCmEbTZ1SdkVOO
	9fVtHWuJwP+uSfwX3tkdv+GDpSZzexKIFbbCISU7TUlXNJ/aw7ftA6vek+DrvggQ
	gy+SqVtBFq574GkvqJBkISyjYx0YCXZKX+ZI965tigbrt+T7W180O4O6e4pGbbea
	Xls1eV0ccJDLvwphzzWfFSCj45Yd85Y+r5vjzcWb/pQ3LXepoXdWu6Ck31zDzkjx
	ag==
Received: (qmail 2022309 invoked from network); 25 Sep 2025 23:41:20 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Sep 2025 23:41:20 +0200
X-UD-Smtp-Session: l3s3148p1@6lejB6c/8KUujntx
Date: Thu, 25 Sep 2025 23:41:20 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: I Viswanath <viswanathiyyappan@gmail.com>
Cc: akhilesh@ee.iitb.ac.in, peda@axentia.se, linux-i2c@vger.kernel.org,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2] i2c: i2c-mux: Simplify boolean assignment in
 i2c_mux_alloc
Message-ID: <aNW3AEPhPTIhsDnC@shikoro>
References: <aKu8tBBOWqltEstx@bhairav-test.ee.iitb.ac.in>
 <20250825031430.3001-1-viswanathiyyappan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="goNpn2N6KLlXDDZn"
Content-Disposition: inline
In-Reply-To: <20250825031430.3001-1-viswanathiyyappan@gmail.com>


--goNpn2N6KLlXDDZn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 25, 2025 at 08:44:30AM +0530, I Viswanath wrote:
> Refactor boolean field assignments of the form `if (a) b =3D true` to `b =
=3D a`
> in i2c_mux_alloc
>=20
> Signed-off-by: I Viswanath <viswanathiyyappan@gmail.com>

Applied to for-next, thanks!


--goNpn2N6KLlXDDZn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjVtwAACgkQFA3kzBSg
KbapEQ//buJpYGw1VNZbQ/OktFY8YqNno/1UBEYKffvR6h9b3jvfuRDjqn5DD4h4
XEbTEjmrgRlvjLHE8W3uP0smbkD31lLAU9JRAt4W0MebA6kJK2TwvXTeCc9uMym7
Xexy71ZyAOhwjlt4N+hQa5rQSZgTmylpPEp9d/zeymPmqM1Ie53jqPnwtyHWHSxT
nt6rCHnFYnUqqGRK+V72uJ8M1WBv74tJ+F4ZufJbG9qKYrygRndsRSKbV5gsOhsQ
6juN5La7HM+Wyjnzf5a4Hbjk39ZyXUf0wrtJ/e6ApASdrkxSmnhXuzVNLeM5VCRc
5JEwNn/DC0trvn8EQAvkqqQF9vhJBa/PD3FSXcbx9xKe43pD+7K6lMhUMBqdpfOZ
e3xe4ECml8pXQRtYjZy+LJwgBTll5Y8H7LG7if4HcKAPH8XAWNaENJF6wmR3xObU
YDo+L7jGpitT2pPUhy8BfuqDbne6rxDJj2QUi9q+KuHTm2Wn1HMCzZc0sbjFvwc/
A/MuBoT/rPwmnOEBq9C31I78wloggwD9EmpNshP/fBDCRmKsjM4MvVGIBSswTa4b
MONZqlKzE7q54Ytwa4ndUWKgIz2657XCg14PYXu7dI0XfJT6lije3dl6WPe3YE3b
8UNzcHOUZKpNT5+WksRAO9woK9+L5+vG2b8D6h0lJsFVUnwUTNg=
=lHDG
-----END PGP SIGNATURE-----

--goNpn2N6KLlXDDZn--

