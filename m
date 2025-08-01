Return-Path: <linux-i2c+bounces-12101-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE106B17B1C
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Aug 2025 04:10:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB88D5663E6
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Aug 2025 02:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71D9F74420;
	Fri,  1 Aug 2025 02:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="KYs8uw3t"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50394A1D
	for <linux-i2c@vger.kernel.org>; Fri,  1 Aug 2025 02:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754014240; cv=none; b=gY8Zfe5xX/5jjBtB4cvNrulLMVokAfpckjy3wZtijKQGhh17VHYFp0y04fP/B2vHwfa6KVIUk8XRdPnRkncIkm6QMviFL8oEVJxBqPE0BHWhIPuHSZ+wqaymd/jSwoPBeke54wx4XT9TK2kKhxM4FgduRSaN4YGRfanwuV+2BbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754014240; c=relaxed/simple;
	bh=SQ/bemXC+tF6vFlTRKQpTJdwArsXIwT5zrskZvM06SY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QGihuCk1pLLZMyRiCjzBnBNzlbgfjrlT2JnRfNnHzmVv/d/RS+lB5/pEzKznUi0P8fJSrbg6KW3sVIWqhRMyXnALGj7BMyOFg8vbSrU/hG1Uh/U2BOyDwDFd7a1XUDCSPAVPfyO0OHMfywW3hq8Uu4B6QTICYImVvXQOj5Jq/AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=KYs8uw3t; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=t6q0
	t7V72oJCUEI7zz8oG7zkPh1ZXBy59jRBVagXHcc=; b=KYs8uw3tdCvlvwoX3upT
	kPedh8HvBv+earzyZKymSQhI5Jdo7hab3+uY6HPcwUPtgh3qeWdpCS0rxXiGYfWX
	J11Yc63qfXtGzfsIJOwMFXrFy5cxz0DznC9ctkkPvdNVjNo9sZUws/vXb1LC9koT
	fRTLtI0yPh7aQEgyDVp7suy7aXU+Nbys3fUlfJCvg8PwxCAy2bXN6lfCg95fTFOg
	XcCz5j5FcQ4TGTTAEAur6UqgyVgA/1LpL3xtOBIlxxphlpMiy/bL6hguNAdq77xY
	OkiTWiH/tPs9pfmlyDEKtvumQCqKUaTu6aQlNnD+G4CTx8SxjjeNOMD/pWFbJZdT
	Qg==
Received: (qmail 572423 invoked from network); 1 Aug 2025 04:10:32 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Aug 2025 04:10:32 +0200
X-UD-Smtp-Session: l3s3148p1@pnJAQ0Q73o4ujnum
Date: Fri, 1 Aug 2025 04:10:32 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Wojciech Siudy <wojciech.siudy@nokia.com>
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	peda@axentia.se, andi.shyti@kernel.org, mariusz.madej@nokia.com
Subject: Re: [PATCH v6 RESEND 1/2] i2c: muxes: pca954x: Use reset controller
 only
Message-ID: <aIwiGC8B2eemA5Y7@ninjato>
References: <20250603124721.449739-1-wojciech.siudy@nokia.com>
 <20250603124721.449739-2-wojciech.siudy@nokia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/G5xVry5SWfnEglP"
Content-Disposition: inline
In-Reply-To: <20250603124721.449739-2-wojciech.siudy@nokia.com>


--/G5xVry5SWfnEglP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 03, 2025 at 02:47:20PM +0200, Wojciech Siudy wrote:
> Fallback to legacy reset-gpios is no more needed, because the framework
> can use reset-gpios properity now as well.
>=20
> Signed-off-by: Wojciech Siudy <wojciech.siudy@nokia.com>

Okay, since this email address bounces meanwhile, I fixed the patches to
prevent them getting lost.

> -					"Failed to get reset gpio");

Here was a custom whitespace change which prevented it from applying :(

With that fixed:

Applied to for-next, thanks!


--/G5xVry5SWfnEglP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmiMIhMACgkQFA3kzBSg
KbbVNBAAivK2JldPOZ7IQ4XdB+SvXoTIeQfFnMTA+CfUmXw7qtI66HnP6Q5tk8IR
DO3qSmgtuUTjibMkIntiym4XU1JygxacO9obLflZP2DdOEFMuIzw8bF1LI3GyauR
TIGsa2JIR/YX8jHlaFWap19c9yYOCfe4sCw/wqUeQsYk8t3UdKayGsTh/IeqDpwr
zZClQgwwWuC7PhwjwSyMaSmQ8ETitW5XJQTZCNoz1IDI9eXVcorkLIzUluU3+Z1Q
P4wIyUUntWhzwUmmFH0bLgjZIy107Wg5cJ/eqpoXiWpa9h8232CNtC4lRi8j5fhI
pkGYZWhRj2VKzjmKZbjh1BM3qQ3GPiWj+sBVw1oiZr7sNAF4oTeTrt83tG503tjP
NaHJhiYN/2b4dcGgkuCKa2yp9M8al7txPrTgZ4Tl9AlM1ZRneG4rEgjy/Gq0kZ8Q
tC6iC/YmEv9ixJ1WYHHHcXPB7Fz3YrU7YsviT/3QblYrZkF+LIeDdKBCzOxrrMqV
b+grbUrAFmfYS3gMoTi6D3QXIIj/5/YRQF71Wr7/NWSFmxrLCsIhY0l2imhuV+7D
GuFW10AR0LJI9pJxPYJXHFCcxRM7dqSXj52gMvXhvsFCROedaSrke9NyRgMHijP7
1+OlCkfpKPm08i9qnwqCY6aAKQuvtyeMcH0bEhVaTC6WBJbjHuM=
=6GNn
-----END PGP SIGNATURE-----

--/G5xVry5SWfnEglP--

