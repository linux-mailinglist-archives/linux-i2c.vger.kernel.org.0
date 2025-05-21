Return-Path: <linux-i2c+bounces-11090-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF63ABF005
	for <lists+linux-i2c@lfdr.de>; Wed, 21 May 2025 11:35:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8EC724E31F6
	for <lists+linux-i2c@lfdr.de>; Wed, 21 May 2025 09:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AE13248873;
	Wed, 21 May 2025 09:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="H1y0Ty95"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E032472B6
	for <linux-i2c@vger.kernel.org>; Wed, 21 May 2025 09:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747820130; cv=none; b=TKzCOAz4oiGvE6F92US4C6LVDhX7rJKkx/5y5B/xl1zsx/3wSmW95QWboBkgfIa2xi0BlVmIF2nCiiB5b8jbgqiirwg15EYCzXDGEIJ7lj0a6d5q8FvIvqD1quZ5SErcwAp+vMuDAuGFJRYztHuCQ4fWtY7g5N6xA2VE1nGbsnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747820130; c=relaxed/simple;
	bh=zCpVGOY46npj5hztF2H/D7hUPZG4VbkBf6TIh+lGy5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kKvgg5e324mONGciy9PRyL8XZphxBFGEe6JlhgK4PvhR5ghk77yHx6b+NF0ZmN3KCoFgq0bXi/gFfyQucqS3SE3Cw0f54wxhk6hOR/zi1J5y5r+nc60pQYkT8J+fYU0Z9g6L7P8iEOhBCIjLuhkhrnZL3tKTlQwrOZq9qXaJIg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=H1y0Ty95; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=zCpV
	GOY46npj5hztF2H/D7hUPZG4VbkBf6TIh+lGy5E=; b=H1y0Ty95a2r2mz8z/c2t
	HO+piVqFQTtrOlLGln0bJr2xBkWwY54rG4gKwCuzvo8mZaBNIBN+NJiD2DsGYY5G
	IVoutH2w3Jg6h+1BA7TFGa6doRUQauANCDwZhb7xlV1rVH1abpnyWrRfySTeCw1e
	HTw8OdqhysYHSknmA9hXozAsfl4wK5ZT58LSxa0ONu0t+ynXkeOD19NU3fOh288g
	CNTPW0piJqUClQzJJe22N2XE05MhYmf/2/jF22Yfy8QQwVHn7XPpSXB0Gbsb/ptv
	1PxQ9fKxNRrzbDo9wHBg5Q6Rp+6cfCv/QoDzwd/53QDwPUruhmDQqoojwNH+jBBG
	9g==
Received: (qmail 3206593 invoked from network); 21 May 2025 11:35:26 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 May 2025 11:35:26 +0200
X-UD-Smtp-Session: l3s3148p1@J7PDFaI13Jtehhrc
Date: Wed, 21 May 2025 11:35:26 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Rob Herring <robh@kernel.org>
Cc: devicetree-spec@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH dt-schema] schemas: i2c: Allow '-' in 'i2c-.*' node names
Message-ID: <aC2eXoAyATuusWX4@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>, devicetree-spec@vger.kernel.org,
	linux-i2c@vger.kernel.org
References: <20250519184530.21845-1-wsa+renesas@sang-engineering.com>
 <CAL_Jsq+UCU8RdAGVPbsFDo6aaAyoAKtjDd4yYfs47YOt__VhgQ@mail.gmail.com>
 <aCxKlniEUCJq-aqu@shikoro>
 <CAL_JsqL6CdmrCTbvbFEUjhbd+yDtd9Jf9r+OcV0imcoB117iAg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FZ+PYxgj2QU7N/F5"
Content-Disposition: inline
In-Reply-To: <CAL_JsqL6CdmrCTbvbFEUjhbd+yDtd9Jf9r+OcV0imcoB117iAg@mail.gmail.com>


--FZ+PYxgj2QU7N/F5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> The hardest part is doing a dtb->dts pass and comparing those before
> and after to make sure you haven't combined or split nodes.

I'll pass. I'll fix the boards I have actually access to, but the above
task sounds no fun to me.

That being said: is my original patch here rejected? We allow only one
'-' for i2c node names?


--FZ+PYxgj2QU7N/F5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgtnl4ACgkQFA3kzBSg
KbZJeg//XOEs+tUP75TLJ3/mrAjOfk9PDXDgwskaUM1+nfU3hpVvXAkV1hGVmjtI
BZBMV9FHSgEj88B/2tmPynPw5v6BXYTfxnjVwnejgZMcle5HOlXUIXvde6UvzSZt
HXmuTIaUxighWhRU+9IEf2IHJRgp1j9Hp/tpbEIJj5xXuBWA7vMyh4yi9fHfGjkG
h54iDRm5f5fJNKO6/hqWiesnH6yuy1E0r55nWFc78rjLU1L3uvrrMUcz397tu4Gm
wE8OvvNmwXcANjXq1+zss27xrt4r/Pywk/NQVszY0kxRU3PfUx+BUD161/+3220r
GwYJe/CX/gsOHX/PDzbe7cuHWYRNB2KsqMNnWY/ikoi+ecYbt8LlHicF6TiMKCWc
BkLhHTgPZu5UTN6TGGaxboUl1tbTzXv1qlQ5EnaG7UNL48n7qsCF/ZD/Gy/4WTLt
No8G6vGdqGFzSvxY+Voe0wsK1DVK6qydi6fOEEj8bFi6MkY8x7gIeVucdUXcGNUr
7aFQ6wyJIvHhKaxFV6RGNg10gNogLiNcIyBZZjuB4+gVrOWl4tXFfIjW82l/hwiw
HoHK/oiEPa2txrtgPMEFVjGoDYOeZe3xNHfJtPCl/wu2Lkx86HWUOJRD9S7oVaIV
lEDs5U3EOVmtuC2ua22Whlh6U/TsnYeiOB4Z3UBZXXtMh2RZpJk=
=fqO/
-----END PGP SIGNATURE-----

--FZ+PYxgj2QU7N/F5--

