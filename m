Return-Path: <linux-i2c+bounces-8644-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB759F83B1
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 20:00:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95C921890CC7
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 18:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 905471AAA2D;
	Thu, 19 Dec 2024 18:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RTPZ8waf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B2D1AAA1C;
	Thu, 19 Dec 2024 18:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734634726; cv=none; b=GKt1Hn2cKo9iGfIX2WFaTTtmK9AqWQIrg1ojyz6NSQ+8Bf+KsoC/GUOCB/1akLA7yuLiBiVp8xRKOgtGTnwK2ALEkRy0cOivZIPcTncvY2Ng9m4C+Ud7TR3JoD7IqJYI5t1NnOPFyQxsIGCx3yso/pSFfinPkIK9yV0mSR8wwDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734634726; c=relaxed/simple;
	bh=kgJEoNPKfY1gTSYmJDJvsuhIqNGn/d05TWIeklx6scs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ju7TZXlsdqJmzNPp/zp3uX6hos9+E616MptwBGnh5TghJumyYDMy3Q+g9epWJwyElFPPXcwJwojLV7iOfc0UnRm3Jk41KhMRj7CVF29emKxnkHhY3qPNJSNLcbhe4rvm61oEGOw4QGfj7prsIF/CvDyQzE6T0e2eYEHMnGWO0LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RTPZ8waf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5091C4CECE;
	Thu, 19 Dec 2024 18:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734634725;
	bh=kgJEoNPKfY1gTSYmJDJvsuhIqNGn/d05TWIeklx6scs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RTPZ8waf3usUV8erb6rM13AUR/I5uI/8Z9K9LFaoAOtl3SfgORaY99kRsqybnocNX
	 7/npNYE3w98duVvbl3Sc2VIZI5b22Pxfw9qC5Rq/SzXboEWEuHCKDKSg/4xcNzfCp3
	 RDwG6FzNyYOYeiefWVWcxFI3YIAgugSiHs+97JEocXMYurbV3AUTjllqdKr4n+CzDG
	 m6EUJJmEHxbwWIAc2dgXqUpYDPs4CeBYoAC5vgV2cuXP88DgNfEbJLpSb/8oFEQXp/
	 PDdvLinn89e3F9s1VzvyFtUQP4rqEJNa0hhKAbZfTn3LLHB8VUKtLFxIq5u+0ASB0x
	 qqo0mp1aI7X9w==
Date: Thu, 19 Dec 2024 18:58:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Fabien Parent <parent.f@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	vinod.koul@linaro.org, Fabien Parent <fabien.parent@linaro.org>
Subject: Re: [PATCH 5/9] rust: regulator: add Regulator Driver abstraction
Message-ID: <058f6ecc-5d45-4fb7-8432-8e4cf00df7f7@sirena.org.uk>
References: <20241218-ncv6336-v1-0-b8d973747f7a@gmail.com>
 <20241218-ncv6336-v1-5-b8d973747f7a@gmail.com>
 <Z2P00_DCL5H6Zwor@pollux.localdomain>
 <CAL6vTrgmL9GUbS5RpTgAKSHy=tN6EO+BusEPvmxxhstiwmRJ8g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N5rqcDO3XQsU41Gv"
Content-Disposition: inline
In-Reply-To: <CAL6vTrgmL9GUbS5RpTgAKSHy=tN6EO+BusEPvmxxhstiwmRJ8g@mail.gmail.com>
X-Cookie: You have taken yourself too seriously.


--N5rqcDO3XQsU41Gv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2024 at 08:00:20AM -0800, Fabien Parent wrote:
> On Thu, Dec 19, 2024 at 2:26=E2=80=AFAM Danilo Krummrich <dakr@kernel.org=
> wrote:
> >
> > On Wed, Dec 18, 2024 at 03:36:35PM -0800, Fabien Parent wrote:
> > > From: Fabien Parent <fabien.parent@linaro.org>
> > >
> > > This commit adds a Rust abstraction to write Regulator drivers. Only
> > > the features used by the NCV6336 driver were added to this abstractio=
n.

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--N5rqcDO3XQsU41Gv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdkbN0ACgkQJNaLcl1U
h9BtxQf/dZjq36ZrjwE3CLSfGOOQpW6/KGMOBxSUNinTq+jttzy3En3Ixci0SFL9
MB/Dv4YwgRS5R/90BkseZcTe14IjNpqPlAIrwTdIIE7youKBx6sWRGYfJButnW4z
V1ZLcEUfRq+4dgzQqDdm746KBobzhoXgxoD/EB+UqbKrTfYJHuL7/6huyaaNdz1U
VD+JogEfO5ya5Xze/6gFOuarlCEQ6OeXX1RcdWRYoKS1nUTPe+EUvlWXF0MWLIpI
ZrLlPNNzzkNxmI8/vhxlWPMtHfJPv8/PrbImVtQpnRyPAmdKJCSbpb9o1QET3B8E
6w3FCfBzxZtEsU2TuMnuXdUgBRqgVQ==
=ol9A
-----END PGP SIGNATURE-----

--N5rqcDO3XQsU41Gv--

