Return-Path: <linux-i2c+bounces-6347-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3FD970343
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Sep 2024 18:58:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B4781C2118C
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Sep 2024 16:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3926416132A;
	Sat,  7 Sep 2024 16:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="cm7gNj8Z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBC12E634
	for <linux-i2c@vger.kernel.org>; Sat,  7 Sep 2024 16:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725728301; cv=none; b=f9MtXEbuf+KpxQkBhO/H2J82zjQvWow2yYJ2+ZSXwUINIdf1SOse16MePz+iBjbVXFSn+gmmaPQN4f6rQpr2nu3q1GgZrOuI6MQx5f1yVFp5IsEUweglBSzIvNsLYMnvqlAwUsjYOZ/WH9NmvHAXxh1+xCiOsLMsgY18cNBWcvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725728301; c=relaxed/simple;
	bh=rZlQ4eSQ8swmZpuHQzbJ+s4RoxjeI79wQiFcfVLF3bY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oog/wQK5lbpzzVmfR/b8awnERk5/voPkEjCJdYxU5W9uYl+3w90wElnp0oTc9iHVDFufrbWPbtSf+ilcUjXdJ7x/KbsaZwa6AwTJUuREwN9Dz8SXK8n9B36iOMMRK2NMmBaQzPiSjW+5MpBAa6pEdL7CkfLuSqy/jxwWngrZUEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=cm7gNj8Z; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=HHve
	sUp7I8h9dKLlXZOIZSXZgiKXJCbSqYnBNuMGYvw=; b=cm7gNj8Z9XxUitNfvIZy
	ri2HP2iF6A/uQRQTNoYWrMuSEu8BbFvacyitQuMJMPkvr7TV1YWJ7NQqO+IUwe1i
	13PDyrbpopP+IRqbC8uUqpByKXs0fa0DZrO5jP2u40/UQQO+J11j0LYupWLT1A/l
	Kbim+oKA1wCRym1VrkPdgzON1+r/403OBWO3S9yrggmzc3uUg1xWkchoU3zrgeSu
	aSlp95CsfbxAC96M58+X/l/4xcQisS2DIzqXaN3Bo/SVLfM2sfI61nRQtqk7FMTM
	3a6yEnLuNJNBArwsDd6XPcl+RpML6jKBC6UYFQrUhH6ghG/9Xhs/FmlovyZupsFe
	Uw==
Received: (qmail 1571321 invoked from network); 7 Sep 2024 18:58:15 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Sep 2024 18:58:15 +0200
X-UD-Smtp-Session: l3s3148p1@6m3+bYohJtoujnvu
Date: Sat, 7 Sep 2024 18:58:14 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v6 00/12] platform/chrome: Introduce DT hardware prober
Message-ID: <ZtyGJhm-0GEEFfYf@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
References: <20240904090016.2841572-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ytjyaEn513BUTabA"
Content-Disposition: inline
In-Reply-To: <20240904090016.2841572-1-wenst@chromium.org>


--ytjyaEn513BUTabA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

this series gets quite some review from people I trust. This is awesome.
So, I will keep to some high level questions:

> undiscoverable devices" [2] series, but follows the scheme suggested by
> Rob, marking all second source component device nodes as "fail-needs-probe",
> and having a hardware prober driver enable the one of them.

Where is this "fail-needs-probe" documented? I neither see it here nor
in the dt-schema repo.

> The other case, selecting a display panel to use based on the SKU ID
> from the firmware, hit a bit of an issue with fixing the OF graph.
> It has been left out since v3.

Does it make sense then to add touchscreens only? Will the panels be
worked on once this is upstream? Or what is the way forward?

> Wolfram, would you be able to handle the late PR? Assuming you get a
> chance to look at the patches that is.

Yes, I can do this, but...

>  drivers/i2c/Makefile                          |   7 +-
>  drivers/i2c/i2c-core-of-prober.c              | 437 ++++++++++++++++++

... this is quite some code. Would you be willing to maintain it (i.e.
please add a MAINTAINERS entry then). Kudos for not touching other parts
of the I2C core!

All the best,

   Wolfram


--ytjyaEn513BUTabA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmbchiYACgkQFA3kzBSg
KbZ3bg//ag3oKXvBj1cYBQuG/BsTqEZ+kivhmPcabfoL4S2E30DicIxES4SOZjRP
HO6WDpilY/a3dnTbBnl293WZZFFpq4zrvycJmBaN14cUBtevuDunF0LwPnNfOdc6
WmX23w4zrt4q2rfS4Nv3X3DCU+fFtUF0kb6vmPs1eCAEAoYnpOFR1d/6nCT6mcvV
jPpyov9kg2P+XHmQkGSn+Rh5yyvvUUnCdK9ZCHIY0kMkYGyZ1x9jbSqWeNgqv7Ro
Zo4o3NjCV+PyjRB0+C9OpM+efioytSJEdeJeOn5vwPbGuXLGfBd3KRxCPa0CpAII
7YvUJQwWhsgcp5y3fADIiYJyqPDH3MMwNbet1rJFZsY2wu651QsfEoqtOqjpWZWh
EUzqZr+BhAAOCZFl9TyTnBcd6lW4oKscerYELF1Gs2Hn+Kp4jWNK77gncj1dwb3y
SU+hihFExiPWyWGQVqYufDGTfIIYBNI0D73zBv8xPaUzbEjMArHONAwaX52SyJ9W
O8lK9EnjPy9Du15OOHbnuNfv0cXpSnrig9R/CGdZAE3eOrwvIb3L+TopGYsHt6Qs
6dHq9diNp7IvYUK1I/VIm4FKqCoE0To6TwRaUfiTa/1H+hwVtdmq0EsyZciqPFCE
IfS82fC3QxAhq1EQV3/D2is4luXlbwW2OqQvbJcVAOleQFHPI8s=
=Amek
-----END PGP SIGNATURE-----

--ytjyaEn513BUTabA--

