Return-Path: <linux-i2c+bounces-12827-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B6192B5174D
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Sep 2025 14:53:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E7153B64A4
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Sep 2025 12:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 817F030DED5;
	Wed, 10 Sep 2025 12:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="QAt47TRh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAAD31A57A
	for <linux-i2c@vger.kernel.org>; Wed, 10 Sep 2025 12:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757508812; cv=none; b=UZeZ0svN+L4UrlSeNs4oK6m9CbsklYL1AQM1zhUrQVlzxVRAu/YpJR/8S3K6mXDs9NNOhUWJWwV879oNZYclg4Cl/GP0pUJBy2dAUKZTN8flrXEeB2NALlANz0vZnnbk1/sE610ygQn/Gidm6APqVpa5XTiwWMv27QwOiwyatks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757508812; c=relaxed/simple;
	bh=UCknWCVKZ/v28NkgB+CnV++ugotQy6Cu4r2M0VTiT24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pblKPDZiX1UyKibCGL/iufy3KkSOjImoYK9iqPXs4/Rhq580F4CT09lgHiFOuITyOjM0FgPy9yV4bLQR2RCRriBoDzhvKw+redjy7HLDZfWgLVQvjTP2TYGjRzxjM1viOXz0VlJneJCXdUEkR05xO8VhKHLQb+y8IZ8jGX9PXXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=QAt47TRh; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=UCkn
	WCVKZ/v28NkgB+CnV++ugotQy6Cu4r2M0VTiT24=; b=QAt47TRhN3q8wccblduw
	n86xSls32C5RENplgQEYnzXQqDO9hEithliKipWt7cwGHaeinFKQAgNEQFGGi9i6
	OLqbWoF+5t2O26xyZ/sdEp4xEiR+/KEYRGyjfwO9WaX4g05Of3RwD7VB6fcmbIzO
	RatUdpQhzmWc+puyrw0i9I8q5V6/LxuUzlzkn+bJCHdTimSZQj2GxImyqXHWIKIO
	nuxvRJd/5qxMCmuZRQbH+xaXTf9Biu5tsWVkEny9twgVK2XQ+vMcBpQP3w3Sfrw6
	2bzu5PKkCI/huHKGkrUJRSXKgr41VcZyyFpa1EGnNmgJHImjrPonRIAMBzktLYV3
	dQ==
Received: (qmail 608083 invoked from network); 10 Sep 2025 14:53:25 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Sep 2025 14:53:25 +0200
X-UD-Smtp-Session: l3s3148p1@P04L6HE+PkFtKPOV
Date: Wed, 10 Sep 2025 14:53:25 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: =?utf-8?Q?Jean-Fran=C3=A7ois?= Lessard <jefflessard3@gmail.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v4 0/2] device property: Add scoped fwnode child node
 iterators
Message-ID: <aMF0xW9rBrSK--Cl@shikoro>
References: <20250902190443.3252-1-jefflessard3@gmail.com>
 <aLgY1z-MvQbDBx2_@smile.fi.intel.com>
 <aLlgpUlHp7t8P4dQ@shikoro>
 <aLljGIcjAjQhC2uS@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TWXpdjkKt5uEsI6e"
Content-Disposition: inline
In-Reply-To: <aLljGIcjAjQhC2uS@smile.fi.intel.com>


--TWXpdjkKt5uEsI6e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 04, 2025 at 12:59:52PM +0300, Andy Shevchenko wrote:
> On Thu, Sep 04, 2025 at 11:49:25AM +0200, Wolfram Sang wrote:
> >=20
> > > It might be good to have an immutable branch for me from i2c core.
> > > Wolfram, can you provide a such if no objections?
> >=20
> > Sure thing, I can do that. But there is still discussion on patch 1, so
> > I will wait for an outcome there.
>=20
> But it seems that the discussion can be implemented in a followup?
> I think we are not in hurry anyway, so let see if it settles down soon.

I pushed out an immutable branch now:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/immutable/s=
coped_fwnode_child

Please have a look if I got the tags correct. Once confirmed, I will
merge it into i2c/for-mergewindow and Andy can pull it as well.


--TWXpdjkKt5uEsI6e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjBdL0ACgkQFA3kzBSg
KbZjcxAAg8zr8VLGHvhvSHTBfPPt0Z3gRKZ8db4YqhOu9SgnVC+wY50FBxx/qLCi
6BXDQO6cMcfAqaWYT9/mE0M8JNMG5JakPRq+nWK4N/qlbhtUYje4GIs0df0BCRUY
vNW5eoXN4kEi5kTt+LLZyRmzFs1RQMCqyZYTAHhs2FUBJz4V6M6qIBLc+Rl7TG/o
5GfSRrzwLBa0mbqdldA56zBgI/KeZzQWXV4s5Hivaci6kwJtPwE6ANS1ymWGnrXq
le7D6X582rqLRmZWHPsJNpGmUJVrKCf4MnDoqqS3AcCACMcJ4OnY+fqAaTfi71i6
ugo+KtkYEt9fLnHkiaM750mgk6Z6pB3Ujco/b3wC/Q77MdJZaHgEvb1vvk/pwaLY
UNDkVte50L8XXlCUAGDwc0tBpE/CxdKEg57OUEbGbNg0czCdKaF79KzMk9KOrXbv
WJJPOpBIjR5oTEyGtctpXbMc3wm6TJiA50/bJjklQA42PSiyJpyh8QCMpyKZjHDW
G0z+lojwab17OIK8z1nIsqq8jNG3kGSaoGv/xL8MBTXdKbS/qmBKqMnKcvWTK/LH
qsfUOAHuRpI4IJEuKSk0zb8SvzGC1/uwf/M2D7j/+YqwYnVg3UnV7y/zn4LOkIgJ
9Ifs/fucj/uI6SSADtYiS/WxbzUTo6GFSGE3bMvIwsyTZWTzCqg=
=kzqx
-----END PGP SIGNATURE-----

--TWXpdjkKt5uEsI6e--

