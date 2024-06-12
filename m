Return-Path: <linux-i2c+bounces-3993-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBF190583F
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2024 18:15:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC9921C213DF
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2024 16:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41174180A8A;
	Wed, 12 Jun 2024 16:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ZSi8BBPo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F196182AF
	for <linux-i2c@vger.kernel.org>; Wed, 12 Jun 2024 16:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718208901; cv=none; b=FuGd7Xv9B4CyMSTfNDSlfUpdj34fD2Q0DMtavsmVv0OpNxy5PXY/aOWmnijsE8v8ubOA29urddoTPLtEAXRFHzzHoPixKKCo9epeq1NEy6gISVTChFkAVtgaA3mglx5xN2BO3PqFk98MqsHx6Y5Qsh8pGj9Tnp3kcpxQGYeoB/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718208901; c=relaxed/simple;
	bh=7IaOkQTvZhAIxMJg8oiQzlRd8SmNiomrhY9Jtmiv2hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fAaz+osxYpo39cfzeJmV/1GY0UrrvGiBTBQmHaEf1KVlMn1wakHOaAWippGWf0/T51a3EttJAsKpR95D3dGdt7LJI5CUSC5Peiw6vahvVPe3Y5ZxC9NWBAf1RZJejHpxaRdyMrLotvMAXpInM+0LEeyCCBcuNHyTLqsLd93+KEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ZSi8BBPo; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=7IaO
	kQTvZhAIxMJg8oiQzlRd8SmNiomrhY9Jtmiv2hs=; b=ZSi8BBPo3Nl2Z1779mEr
	k8mnUOAwD8nchMo0LGNgmtS9Ofmi9+oqMRpU2Bm1owFRAseRS04PYJu3XGvAEb8F
	fb32Ks48Q3sYSjjMG0QM9SB8hyTzeXLtbj3dixNwWthCj9eMH2THmyLMRlOC6tdL
	Hw2X6J27apJlJhSRr/G8zkf1ywYttapd+/qc1karJktOn7G76bsoMEtJ6L7vmRn1
	h+dfPjyvv5qmdqpZhyEHosqerGCWzZo+lc4yoJRE8D8aHLx6K5ohXFb/5tfWy1NF
	B2I53BtYxm+NhADo8yDm9M7HQakjD/XWRAniv8uPU1kTjz2n9OUXHAosm3MExLng
	9A==
Received: (qmail 867536 invoked from network); 12 Jun 2024 18:14:57 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Jun 2024 18:14:57 +0200
X-UD-Smtp-Session: l3s3148p1@Z4fvrrMauhVtKPIY
Date: Wed, 12 Jun 2024 18:14:56 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/6] docs: i2c: summary: document use of inclusive
 language
Message-ID: <k7skotoxoml3anejknhcofgk4qbubsxwegfa6c4wyofu7yrdcw@55ezznhofqyz>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Easwar Hariharan <eahariha@linux.microsoft.com>, linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240610081023.8118-1-wsa+renesas@sang-engineering.com>
 <20240610081023.8118-5-wsa+renesas@sang-engineering.com>
 <8e051ecf-a355-4aef-bc40-007f9b709ba6@linux.microsoft.com>
 <iizkptuud2bcqnfvyvfomdbsakywyszzfmyawgsymsdvkatyyz@eze75wfqoczl>
 <2770eb46-7322-4638-a5fe-9d994458a5c2@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fwelgbx6weqjrtet"
Content-Disposition: inline
In-Reply-To: <2770eb46-7322-4638-a5fe-9d994458a5c2@linux.microsoft.com>


--fwelgbx6weqjrtet
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> I am wondering what the impact of this doc update is on my series[1]. I
> am looking for a straightforward recommendation for what terminology I,
> and hopefully others, should adopt *outside the i2c subsystem*, where
> Linux (typically) has a driver for the controller and is communicating
> with an unknown OS/firmware on the target.
>=20
> a) Spec-compliant "controller/target"
> b) Linux implementation/spec hybrid "controller/client", or
> c) Linux implementation "adapter/client"
>=20
> I prefer (a), FWIW, so do apparently reviewers on my series.

I also prefer (a), but people should know what (c) means when they look
around in the kernel source. I'll see how it goes with rewording this
patch accordingly.


--fwelgbx6weqjrtet
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZpyYAACgkQFA3kzBSg
KbZrnA//VDxupQph4i4nzxcFiBLijZAkRB6jbx+os4BiqInq00eKQwRGyMqQedH+
OXXEDYLSNfDETSrn+nB17qVChFoAILTpfFxh1UWX6cr7nNo7BtOWTwVYHTw1Ot+z
discuzXwUJgPNNGkOwIBwpiFkyAsn0TKnfy1Y9hS8MP/LpVnZUS+x52aEFPvwu3d
7h5Uwzkkx2JlhQaqMDaed6oxfhmGhozjhHac/KyJ8aLzxpgvOCtgXh2qqBmeTkHv
V6F8WY6YakpddQLgeD9xUOf8kG4PA13VfT8E6MzpShXJPO9jZ7Ez3J5knRhK6iju
3URM1oCf0ZMJ/w00PEhhk+CvuP1F2tM7Qt7wG5+vjilsFEP4k+rs5+qPWYs9dEKY
WMuMJGzZRL2e5E0dMBwc5eEnLXs2c1IRkDu6P8l1vKeysGI77gIRATCu8a68qE1U
KhqacjhwK5QfpaajIjY+QyIBHsMaCOPCLsfuo5EkBSx/gdOcKYz8EZvzvO5sVbOg
JfXCMeX6/qaRsseZ5nPyEDI+wtfY6DdWfZm+Gai7pK1MEYulY/3/oiiJs4u3sdVU
qfZdYyBLjzS97Wd3JLynKcFsnh0pJ+sIGD9VDBBmPwYr3jvNsTn7EN7MtzKTJqhH
xkc3RRl27Jm0T+UL6eqEizsIMkMiPbVaGhD9X1G2mw3/nOB0fqM=
=7E9O
-----END PGP SIGNATURE-----

--fwelgbx6weqjrtet--

