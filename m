Return-Path: <linux-i2c+bounces-2281-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12048876100
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 10:35:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C031D284C2E
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 09:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5EAA53399;
	Fri,  8 Mar 2024 09:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pCtfnlk7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722CB53390;
	Fri,  8 Mar 2024 09:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709890521; cv=none; b=uds8b8ej6+auzL/w24O02ex8xRlAoPRCkWizpvjYSnR7IGzoJAtYpeobyn7JdErlXuyHyI4mrgO4La8bb0yz2SqE/mU9s1JuC8vRBb7Y2tKLfnVorfwe0yz5yBC00FU7XBBIh+K/4tTG9GRw9iQ9Uu4AN8HU/1o87d0DllDPrps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709890521; c=relaxed/simple;
	bh=3MZNR/EwPw6IJcgBh5uNOk6gluDGngBcRK/gvs8FW7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aBjVpTAdPI7PesrHzkB4YlSk+fRtjwTYuw6Cm3wV3UMwwJb0iKmR2glZp/RlkGrEqmLANbu4kha5NDk28uWRvKWDJP/u573CnfViuEihi5cmIEXv+fZOEsPm1oWSSZIv0pQlB1eq/UE+wgahjSNmMTR0lXtxZaGxTKa7JHOhTDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pCtfnlk7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DFF0C433C7;
	Fri,  8 Mar 2024 09:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709890520;
	bh=3MZNR/EwPw6IJcgBh5uNOk6gluDGngBcRK/gvs8FW7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pCtfnlk7zsjD+fQhb2xGR9vrb/llYSEYRPP4pVz0tbBkVf+5JR5is8AaeJr5Hk4mI
	 /bX2biCd4MUiQnrcFGKsHr8GerftxK+x92PfbUFlRawyKQqgT/uCprSKW/R/4iZk5E
	 ouu79xQL2mZkMuH6falePtwy+HAWMvtmLTCwtTEdum2Ng7MerFrNiHimbKTYQWvvL8
	 jE20MtmJfV6W5iFTmucnUvKNz/VmmKMsjO+B2us1qD91ufcy4eDAhth7g3S3c/GtTX
	 dh/1JoROMm0G7cQ1AOWstgO7ABCeJk1zzmOm1w/LGslEmyExZDcJFR0/YbQe1ijjyw
	 IUL7m1DYMN8Sg==
Date: Fri, 8 Mar 2024 10:35:17 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [GIT PULL] i2c-host fixes for v6.8
Message-ID: <Zerb1TLGFq1rCbBw@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>
References: <iofmooj4qz7j2rphzx3ahvpdur7pwoaj4jjduraffyto4yd7si@amqj4p4ldgef>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kkTyT2oRxlol1NuH"
Content-Disposition: inline
In-Reply-To: <iofmooj4qz7j2rphzx3ahvpdur7pwoaj4jjduraffyto4yd7si@amqj4p4ldgef>


--kkTyT2oRxlol1NuH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andi,

thanks, pulled!

> at this stage, four fixes make up a fat pull request, but there
> has been some turmoil in the last week. The rush to get things
> sent by the merge window might have generated the need for some
> fixes.

Don't worry, it is a bit more than usual but not really "fat" in my
book. One wish, though: If your fixes branches are upstream, could you
rebase the fixes branch to the latest rc? So, that only the unapplied
patches are in there?

Thanks,

   Wolfram


--kkTyT2oRxlol1NuH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXq29IACgkQFA3kzBSg
Kbaksw//dNySL08+/A5o2SC3n1c0aeHXfHZsupGGIXeTyKltFjUC4G/YYCu5lKZT
2HdRAh0sPYGtPF9gVbcc9wFvm8w1VWjpPAWhLsBi6+SaBBhgWcCWZ2wVsE+zMj83
wM8euNL8NnRrTS04vxlXnN58dDnWiPVT9+D7RJ/40KhKU5TQXL5auxx79gIoKhOo
FH0eLdYER7r8QHv+xtwshqtafLceYFH847XOtbCVHdsRFCZAZUf9zfN6ZA3HZ63D
xcxSzMGOiZJ/QxRuTBYthzTJgbf72nxBl8I8Y7QvqsB1wUR6Am8UW3Tvo0T5aF9V
XUiKc02qxXlhR5jG9UCgtCCF9xB4SKutf20+tlN4891bvLHK8yBstqa0wgpjFK0H
XY6fmVYmj4oX5asJX6aNsm+fXM43UWgp7El3mpfDh0PaSsutVMSyBDevbOWP6f0R
x44BaOxchMjE09r1J8OZ7IcRW+uKZ7Ef2ulTHh0cyUVtfWxjeWAp/RJCmoTkDg4M
lMmbnR5Rwz1daD9VH2o7dEQDj+oJbSCknX3eU7TJh0Uxb0J9j5PrxzkTCSZqe1fc
l4/gplE+/mcVpzmNFnEedsLT9A2HLPnyHP/LeDQaJNDJIsg7kbo6Mev9Ee5Ds4fO
s087W0C/aHkqHzpWNwWR1GDf4RPolxO+73mZODJQ//V81S+kfOg=
=HjsG
-----END PGP SIGNATURE-----

--kkTyT2oRxlol1NuH--

