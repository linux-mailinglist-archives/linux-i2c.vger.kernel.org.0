Return-Path: <linux-i2c+bounces-2580-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A733588B279
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Mar 2024 22:16:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 26913B2641F
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Mar 2024 18:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C90CD4317B;
	Mon, 25 Mar 2024 17:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xvpf7NjB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DCE1DA5B
	for <linux-i2c@vger.kernel.org>; Mon, 25 Mar 2024 17:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711388170; cv=none; b=oTPyYCNyrsWjsqXMOus2/iN5K2NyZgcf0S2IGJ4cK0BUvt08tX5WsB4fbBbzBs1mVljxLF3Mmar6Y/yr0vS0Yyqg6c8Fb2iyDAYRf5zWS++Zttd3FgW40Wek3MebM2VeuAjOZrOxWIZNw3dws8AG4E9E3h7sIYz0bJ6DWrbXCV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711388170; c=relaxed/simple;
	bh=AjOTT4YD16qoYuqItAJwaXAtdj5CkCHfLLXUiK+h21U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i2wX07Kfs8j/sSiaHn5Pbyrh1PPBex2tJSr4R2kiZVs/91VDymEXLVJWXWPat8EdksR1tz3icF/CS9kQDFM8H/+caMMga0yJELvWBrKfFIK8sr8pLWzkXLsDhSOE49pAj1WFzA5EikegJNFfIFy+2nXbtM8ZgHRPE2C6nic2Q/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xvpf7NjB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63598C433C7;
	Mon, 25 Mar 2024 17:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711388169;
	bh=AjOTT4YD16qoYuqItAJwaXAtdj5CkCHfLLXUiK+h21U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xvpf7NjBhj8IPEmAiMWf/f3YBFjPGgMjKekSi/A0wOB00IcgxcaMJlpcNod6e0AFq
	 e2cZRdLwe/IFH2QWVJehAEGPuAo++CwkIokRMk9YO5aEy3wynonUCkMMPXv4+c4Y4y
	 1qzuCbyaV2W0NLGVSSq5mrwXAXEpevPqdYjjU/tMDni2u59mwjVCyOZvY1w/ilnGfR
	 EiqRHQxpCl8MHiEK4aLm0N8dx4ytNWjko6sUmxgrOPRNaEZIuB9ijKIP1b53noY92V
	 uWjCHS4m92J9L1RsDzK7jk2QHcov7nJTwVu2Pvy/sDpiwGFzt08dCk5x5gMjX9qg04
	 zUqbGAiduPoVw==
Date: Mon, 25 Mar 2024 18:36:05 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Jean Delvare <jdelvare@suse.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH RFC 2/2] i2c: i801: Call i2c_register_spd for muxed child
 segments
Message-ID: <ZgG2BbOSO6GOo8yK@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <eac54582-44f6-4101-93d9-012eb4ee3241@gmail.com>
 <cf8058db-03d2-4d47-bc39-2645c3d42e10@gmail.com>
 <Zdxprq9jukWj0XJF@shikoro>
 <b4cf0d37-f597-4218-9773-dc6eb8a0dc2a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7gYveF8IRgEilSGs"
Content-Disposition: inline
In-Reply-To: <b4cf0d37-f597-4218-9773-dc6eb8a0dc2a@gmail.com>


--7gYveF8IRgEilSGs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Now that 6.9-rc1 is out, we would have several weeks in linux-next
> before 6.10-rc1. Would it be ok for you to apply the patch and see
> whether we get any feedback from linux-next users?

Yes, we can do that.

> If yes, can you apply it as-is, or shall I resubmit the patch?

This is a question for Andi who picks up driver patches meanwhile.


--7gYveF8IRgEilSGs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYBtgEACgkQFA3kzBSg
KbZfOg//QxlNXWfKMPbw3euUa1hxoT31tq/wuI9XlBk1MWl+r8ec/NeBNBlB5AV4
6jb0uMdhYxo05dSMbpRIirWRyTdwduZMSsfeVIEWIDaiYh1WBUyIaWZwHiDIMpPo
Pey+FyFZMBhfxgHGzLPFahaXzBfyWVJlF7kZ/Th6H+UXm/oNcsT6ycFuRsedgq4a
sBGtvG3rRI6stHjQTfDin85LlNk+8aEdvnL3ZrURUp6D/yhGLBWjAaqFgdGj1WaF
qanPwxGKtrCiFQX0wh0W8VnXX31dFWqYAGDZvyrHIxMbqwgikdKNnk1XsMkdBGaE
pKzZxoTtj1UU7eurNJJLxm6KWDlZZ2LgVW4ri1h7Rh1Z9hFJ2ehMm01MW1wWmRF3
GVxgb/F5+BevlWgC5oHHSKKOhaMZUxfJXIbu1ccABfzsVRnnL8tqZ24P7n5onH+m
CLz+smEpHTSQW/dvSq1uK5wBpT+a/343JwRZJB4LEslvLXzUuIPiYOc71JcFPQum
hlFWKPii2E/oiwvA0QfBNDUPhzVmUYCAsGxWA/QjgXV+8tKQvu+rngDzttF2pFCp
LonSSesmiaNsDX/7+hHDMkrd6UP+q9d1Wm73smF9D6h0rmYIfKWnqQx5suw23vDZ
bEDHEs0yPARf85SD7rlmAXesHvcxX6m4L6Psj5RBFJ/KH9Rih2c=
=EAMg
-----END PGP SIGNATURE-----

--7gYveF8IRgEilSGs--

