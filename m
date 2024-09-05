Return-Path: <linux-i2c+bounces-6271-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8983896E22A
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 20:42:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B41841C2244C
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 18:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D775187FE0;
	Thu,  5 Sep 2024 18:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F0cbN73W"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BF018785F;
	Thu,  5 Sep 2024 18:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725561728; cv=none; b=Aee5+G3zAzwK+8TIx3nH/DTyOy1G8Y5cE0EYzklk28H8WFZ0AAQoIpUm/13+3LC17A3GoqMgCw4fv5raC+S5bn/mecdbEFZ0Zx5RIW52njBjjyq7aq5iNA7fuDdFgHVUS53/Eua26mfwsVW5l4DE1uNDIXCA8+FiMXv0DfTI5kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725561728; c=relaxed/simple;
	bh=JLzVazegeLJ+NiJYdoB5mJULvbuw17ruPjgTitRufoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GNbD1xWqRrpiKhwh1kPW4Ey82SrOy6wNJJK9eAM1rwF/NxZWv+yavX3yjk67n95u72qwOVhohNcyuROCChc8cl3NWxirxfv+4sjgOCjvQ4J+U4jS424EaldoIiLrrsE1efrDNrDIZy82Bydkj6xNHM30N2TkZ7GqsvQVfegahaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F0cbN73W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E462CC4CEC3;
	Thu,  5 Sep 2024 18:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725561727;
	bh=JLzVazegeLJ+NiJYdoB5mJULvbuw17ruPjgTitRufoE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F0cbN73WOD3DxYI/K0CjeWeXQd+U2po05/OERE8h+3LJsoO65AO8hdXiC5G1uW26k
	 Mr0thEzBNsosJ/XZ/MGKrcc2q5nRtKbmNN07lWaa2J/plvpbavsA5vQFfFAM4wWdcG
	 OfoBOn5tY98MNlmAvKTK+yV+h2l3A8+BUVyoWyTWQFIYsxxiYa1cnwNztDaigyURad
	 7Md/MqbqhEpRZ3vC1ibWwrh7QeHcsYKy59cpPvy8Izuzugfn2oGrsNsYq6gvgLB1ja
	 H6tuWfrXiZDfcB+A7Z89KPML8vSAp6ugE6xqJPmppgoGBvbPlErl8sR1UX5DmI4sUk
	 EKTqn0OtRTQLQ==
Date: Thu, 5 Sep 2024 19:42:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v6 09/12] i2c: of-prober: Add regulator support
Message-ID: <1e91439d-e8fe-4675-ac0b-03939f563bca@sirena.org.uk>
References: <20240904090016.2841572-1-wenst@chromium.org>
 <20240904090016.2841572-10-wenst@chromium.org>
 <CAD=FV=UGOz3Xzg7reJKP=tA1LqTxszv5w-CL9krmoXQtXdJLaQ@mail.gmail.com>
 <CAGXv+5F27K76t=ht5v75jKsNF-J+C0r5+m=czHz6PtV3t5DxcQ@mail.gmail.com>
 <CAD=FV=XVrAdQN8p9QJtt3Ah_YQAG7Y-D4wDx8_+qb1EGN7+Uig@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XGG4EEhvNkYs12Vb"
Content-Disposition: inline
In-Reply-To: <CAD=FV=XVrAdQN8p9QJtt3Ah_YQAG7Y-D4wDx8_+qb1EGN7+Uig@mail.gmail.com>
X-Cookie: The horror... the horror!


--XGG4EEhvNkYs12Vb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 05, 2024 at 11:14:58AM -0700, Doug Anderson wrote:
> On Thu, Sep 5, 2024 at 8:10=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> =
wrote:

> > This next item would be a later enhancement (which isn't implemented in
> > this series anyway):

> >   - optional prober callback that does actual probing

> > In our case it would only be used for cases where an HID-over-I2C
> > component shares the same address as a non-HID one, and some extra
> > work is needed to determine which type it is. I still need to think
> > about the structure of this.

> IMO _that_ would be a great option to the i2c prober. It feels like
> you could have an optional register read that needs to match to have
> the i2c prober succeed. Most people would leave it blank (just the i2c
> device existing is enough) but probably a single register read would
> be enough to confirm you got the right device. Most i2c devices have
> some sort of "version" / "vendor" / "id" type register somewhere.

I'm not so sure about the "most" there - it depends quite a bit on the
class of device.  This also imply that the prober would have a regmap
config as well...

--XGG4EEhvNkYs12Vb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbZ+3cACgkQJNaLcl1U
h9C98Qf/eDbxzuWN9wKXOgtyn/KGNJ9usI1DrqYUNAy7+kXpYwuywHuxw7jQX/m7
apBm7viyIeyEcsCjy7BmmPJ3Fyfqfpt/4/cvh+wFla+E/dVadH0thHf+1XHjI7sC
M6Vs/bjtPpEIAC2StD3yNUezMRQc/6KW2mlzh66rPCfE7vubfHN3xXgq5xFr402G
/m1HX2HkBqGarvXdkUgOOQuFfb/FIiKB4l+VyXwGmzAgwTeXYofMuEwfF6lPqpvX
VYgxNyAJdvImmjHthf/EFx5TDwj3tSMDYj0/qAhKrFnreXU6H1sNcAhIvv/7gyGa
+SArYn2Cah9+B40+mW2rGa619WFc7Q==
=aEkW
-----END PGP SIGNATURE-----

--XGG4EEhvNkYs12Vb--

