Return-Path: <linux-i2c+bounces-11040-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB0AABC4AA
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 18:36:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3ECFA3A66E7
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 16:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F5F4286D7E;
	Mon, 19 May 2025 16:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="aKkBpfbF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FDA28641D
	for <linux-i2c@vger.kernel.org>; Mon, 19 May 2025 16:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747672598; cv=none; b=LzKm2c5Ss6+d53D6HTRnaTF+DJNfjplEmSej84VT8QA0+WWYN4pPf6+X/oFeE5HMpoo2n0ttj/DoVpR5qVmDphyqnDztgBqk2Tjl2YPN/+9wI3jrR1Ul2bLPTm0SUMuy5Q+O/i2qdr9GRuthqaiYPG8XEkgXJAXJxXC37MlBxvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747672598; c=relaxed/simple;
	bh=5Mj7ZxjTXQLcI3Gm6GbJ2gJvCPof2BFcBArnNKcLEA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gP9dzwJUGqxSMGxHmhcmGBd0No1hZCI+ccz6w5b/eca6EcJFFM8yrFiwGtRKLPPChCQHadDxIIlSuSy6czTGZULlw2gDRwHF26bad7WDY+i6MgyPPPSO70DjFI+H9iVXQbw8Wbk00otMHKPzJw404JRsfNugNkfxfckCZ40QZUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=aKkBpfbF; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=5Mj7
	ZxjTXQLcI3Gm6GbJ2gJvCPof2BFcBArnNKcLEA4=; b=aKkBpfbFEvQsyXqRiTSv
	5my+RuAMdMpyJOo5o0pNVU5qttOdsfAQ0mwaO3A+AGKGxqd0itr/oQ+hpGeHd0Wa
	6QazHJzCERdBbhPFY+AYb45UI39+fPfIWUEG1CDg7Ny17LLK5GO3fHAEWaBc9TEe
	fc7ezcmByJMLmmdgyFoAxGyUU9Ckn4ba8KtQVVC1GISgGRdFh8Z1WcRwhgQ3BKGa
	R6bWo2yYpXgPvFYaJB/CQ7MR385gmrrCjU1p/SnFKncIsnAFEHsSAOXt3/9A4TFu
	+GBEtF8rwCMTTMC3EMLeAoe/6U8UTD+1W4UGJrD3Lg0QwgYsX44clEAMO6nBY8cO
	RA==
Received: (qmail 2563603 invoked from network); 19 May 2025 18:36:34 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 18:36:34 +0200
X-UD-Smtp-Session: l3s3148p1@SjXdu381PJlZz6uL
Date: Mon, 19 May 2025 18:36:27 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Sumanth Gavini <sumanth.gavini@yahoo.com>
Cc: skhan@linuxfoundation.org, jdelvare@suse.com, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: i2c: Fix "resitors" to "resistors"
Message-ID: <aCteCxfkiFCxOAll@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Sumanth Gavini <sumanth.gavini@yahoo.com>,
	skhan@linuxfoundation.org, jdelvare@suse.com,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250517082555.1249609-1-sumanth.gavini.ref@yahoo.com>
 <20250517082555.1249609-1-sumanth.gavini@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ksPlj12In18DboDH"
Content-Disposition: inline
In-Reply-To: <20250517082555.1249609-1-sumanth.gavini@yahoo.com>


--ksPlj12In18DboDH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 17, 2025 at 01:25:27AM -0700, Sumanth Gavini wrote:
> Fix misspelling reported by codespell
>=20
> Signed-off-by: Sumanth Gavini <sumanth.gavini@yahoo.com>

Applied to for-next, thanks!


--ksPlj12In18DboDH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgrXgsACgkQFA3kzBSg
KbYb/RAAs9/Uuons9acx/OIt8dRQG36MKHf4WqK1SGjqy4D9GpSwweANZvF2l0Dw
SZJ/l9AEUBMK03OpTlGN9lxLZBgnq19o8xouWWffXpK3xgIpvQInukchIO/bLrzV
rhZkOfvTZe5Jgba+9oZU5/2UmAM1Q6RjNTUO2xY2oaGeQErWvuUQcaVE1kEPwgML
zk2USHu4Kl7KDdjZDN6d27IT5Q6ge3I0r1FHKzhif2Ks7vTf4XNxMgPS4Pjxa6qT
kEo8sSRuPzL3bCvwTIx7dPh5YCqbJom7Y55kgvQOaWJsdstAfgEo6CAoxVEQ9RBy
cLDUhT7hHjkeaOu9yQkO06UniD4bgtKN8Wws8OduEvA1gjmuQsm8zNCVc3uJcIIq
1H9btrWUSj2jwSLl+g9r77Y62YvhGiJkWW95OcwYQZp76mlydi+JGw4f7btkDk9/
7wgAWVoZpeIOF24Oi0vv1lupJnySNLLYRyq4wbLQNApAt7emydwJgUrIZqtqfbcQ
f4Pk76Flq2bkR9RN+SY+oubeuxKzBcHOVK2xVpEEiJdJOAwMurvAlaieeD4m6BSB
q3MXJ2pE0dfiSqdTXoNOKUnB9VFM6L4kcYblMsQqNHESKWK4FSd9eTGnUV8GUvsB
qJ/D5K+7m3SedxTQem7eeTOBLGYAfv4hABDZnVrHXFYqnqzzERo=
=Fr7X
-----END PGP SIGNATURE-----

--ksPlj12In18DboDH--

