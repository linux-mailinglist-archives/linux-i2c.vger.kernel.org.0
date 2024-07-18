Return-Path: <linux-i2c+bounces-5018-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A93DB9347EC
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jul 2024 08:17:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3473CB22188
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jul 2024 06:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 664AF4D8D0;
	Thu, 18 Jul 2024 06:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="POI6V7ce"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C510282EE
	for <linux-i2c@vger.kernel.org>; Thu, 18 Jul 2024 06:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721283415; cv=none; b=M6VDhzmqAoAnkgKRuxVdicyMfYBxj9thz+eyVQZvs1++Ge2kousidEpkBwpVUyuWiywYpaTULnVJWShNQGg83niEvDk659WeNsWWGcK3QwmJwesyTwqKfUI+86gAksIjJWmY5yNpcJs+IATJ/DRWarME7YXYDiu/jhnG1ZC1V2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721283415; c=relaxed/simple;
	bh=kyAEPQ8aqEpNHP56KgTxfs8DkAW5y/OXpKADmfMqipw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SI5r6tTtT1GZ6IX0oUel6kk+xHRGntRIJ0Xbv8i/8Dc7LS5R6lEPTp52+P22fxYOCZwn4W+tf3OdEDMFmcGpUovUEyPtjubRoDLjWfWfsqwgoeXXWsE4/w5jhgraO+Ekl1kD+gJ/HZCNsRtCWCu2kPamDA2H29V+ceFRhJzDIDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=POI6V7ce; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=xdf5
	pkRjQk/2l7quEdwVVAsVanyOiLoDYJ1UByBzIFM=; b=POI6V7cerUMTOAI3LNPa
	SuZEQDja66K97w9kNDpZKFS1i0hZQ4C22Z/mPPBqtGJmTb1XBifYeKxfMPa4Vm2u
	cpHLrmpn+Y2ct3lPvQzPHgPBZvlHQeyW+B4umKyk+5oVxWkBCLtODdYjEl9wojGB
	ZpaD6dGweS6xuinPYe0sFEq9CWTtxZfu1Rp2B/6eVXuS+SX31ZvDNwwrIYMq2JGF
	TnFO3vUnwqbrXNS/bEOD7MxjiwKJ1WgsDLc/iDgUImpSZ//2e0G/ldxsetFwuy60
	qT9XBjaFjCjQNSfTpIm9IEYXiMaXZBVxgMUtChQSpuWuCkiDFzIn9p9hs8DNAdpe
	iQ==
Received: (qmail 784982 invoked from network); 18 Jul 2024 08:16:41 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Jul 2024 08:16:41 +0200
X-UD-Smtp-Session: l3s3148p1@LqCmhX8dULK57tsn
Date: Thu, 18 Jul 2024 08:16:40 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PULL REQUEST] i2c-for-6.11-rc1
Message-ID: <ZpizSLI-sAIng0GO@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
References: <ZpY3X1tggZC3s_1X@shikoro>
 <CAHk-=wigtUnqv+RXkLZ2TwqV35YQeGrYsMnrowpnmQNN6wyhCg@mail.gmail.com>
 <CAHk-=wir5OYeNSytz+EocQnQxoFX0LY962R6FDj9cAHBiXFe5Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="V4NMR6WsPI0KAuJv"
Content-Disposition: inline
In-Reply-To: <CAHk-=wir5OYeNSytz+EocQnQxoFX0LY962R6FDj9cAHBiXFe5Q@mail.gmail.com>


--V4NMR6WsPI0KAuJv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

> > I have looked up said explanations, but next time I need to go look
> > for explanations I'm just going to ignore the pull request as clearly
> > just not worth bothering with.

Okay, I got the first part. My reasoning was that the summaries from the
merges I pulled in were excellent and I could not add something to it
*plus* I was assuming you skim through the patches you pull anyhow. But
I can see that you want to know *before* you pull something. I will send
you an updated PR.

> There are other merges in there too, and this just pisses me off.

That part I do not get:

$ git log --pretty=oneline master..i2c/for-mergewindow | grep Merge
479f18ccca110b727d99c2db60d769736bf390e6 Merge tag 'i2c-host-6.11' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-mergewindow
711703013e340caac3e4a6a3a605324691292621 Merge tag 'at24-updates-for-v6.11-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into i2c/for-mergewindow

These two merges I mentioned. What others are in there?

Regards,

   Wolfram


--V4NMR6WsPI0KAuJv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaYs0QACgkQFA3kzBSg
Kbb7ShAAsYkzZIWcYYi0+3xUnQTyFd7720G5Ow/1tZZ0GE4MsC6EfUtxoPZQ0Dez
4F0gCIVUSf6YFgMN1oBrg1FgA8TEu6nnrpXB7BbyOz5FBwFo80UaFbYJMMH5FXit
SWP1wxJSXfEwf9sSmHtOdSFCEVb31FwxR3VicYMlcv0DBpfFcrT/Jfl+Gk/9Ee+I
wrtcuGDz0+ItNS+HZQEcUtG0wUP45DtQeRS7g1DHraEODP7W4YYiE50Y4nXwE0Ti
c01kE3hF5JP5AAk3oIap0DmzmfLSE7pqp1MBycIRLl5YaGofc3TXYwWVMK3D62tq
6jOzkUnyNq8sQqYajMsxfsvSdx/RRAb9g4FZPp5iRR6P8OeS9Iyg50FfFB5yy9Sj
cY7sQZ2PS8N1/Fu1liMigXB2kBIuKLxpr10th1o1T9cS3C7GtqxKnpzxUfU7PdtS
HdGRlCRGMVlnk1/r8ckxRvmKdjZoTeNSdH7YW5yOzvVEDMcoEm0cr1Dn/6BLwQ7Y
83Q0PgK8qbzf8RRjFhpSbJjTsXGywfk53g1abxdwTMuD6PquGzax9u0IaZlxV97I
otUdxGvZ/jVyo4Amb2UsalzI/fzNAZNHOj0P16NlpgSwa9MorJHlaPICNLU1zKo8
bWJOUBySu/YVrDsgk7YWrjbN0u9wruv8xlOvJm+HIl3NZn5oDjU=
=SQOV
-----END PGP SIGNATURE-----

--V4NMR6WsPI0KAuJv--

