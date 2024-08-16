Return-Path: <linux-i2c+bounces-5459-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE6D954D26
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2024 16:55:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E0E3B256F2
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2024 14:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25FD71BDAA3;
	Fri, 16 Aug 2024 14:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="j3lmPef1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3B51BDAA4
	for <linux-i2c@vger.kernel.org>; Fri, 16 Aug 2024 14:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723819752; cv=none; b=re7d7ewPv84WkRWw3Ti8ToRnxQdEzqsunlRWttFcKcRZBMwxPErgqaVSSDe19xXEd5EMx6J8Mp+Vg30+U4wnHWkTn9Drrfz14dLbQ6Dofom9eU+SgJ78/3M1Lc7FuDKOcBL3NrJI4YDKwXSUDau+06VAyYPaRvlx7EO70yEOj+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723819752; c=relaxed/simple;
	bh=Y4tei9TZ7pV0iHtaob/Fcck48ClDR6t1GM2RVCH1uW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M5nH/mUVJEHqRAuUi1L2BeewX3bcgMdI/a9by7VrnsU7SLo2GO+Flnome14Fs/whNy+E8Pvek+ieFWBtD6obeqBb/NfsiWGmbzewcoeLYMU1AJe/kO+GXkS9+OJKVXuMorapyT+sS4YuzR6Ds0Y675bU7FBO7AkdaAQlatWz8gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=j3lmPef1; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Y4te
	i9TZ7pV0iHtaob/Fcck48ClDR6t1GM2RVCH1uW0=; b=j3lmPef1MGHfR3Q0XDrp
	gnYujCbHuoBBtQNTJh1mlK+wS5jIj8XepfFaKThRQqVWq+R9zmalIhqv+toXzsOY
	9MqoOygsJJFFuVbDf9ZOiif21yLwl7i1wosbeXs4nuRt12sXed2rwLj5uhGJLTuI
	5Sm9ei3ZcmHXP9dtRsjlTaP8y6Iy6INlhnrEWpx/8dqXdEb8xOGmBk1w0klXpIT9
	o40ACWtikby1xckQ4LDwnNmClpScwvHTszO/XtxUizmmvqmQvro+cZTk9/GXuRcS
	6uCYVNtUHm3+B49XJT24iK+HEGHkrvXHlCdriNlTc6pylEX27Nuv08Tsg3HFjok+
	wg==
Received: (qmail 2630687 invoked from network); 16 Aug 2024 16:49:08 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Aug 2024 16:49:08 +0200
X-UD-Smtp-Session: l3s3148p1@DbHDD84f0pBehhrc
Date: Fri, 16 Aug 2024 16:49:08 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	Krzysztof Piotr Oledzki <ole@ans.pl>
Subject: Re: [PATCH] i2c: core: Lock address during client device
 instantiation
Message-ID: <Zr9m5AYgD9VZzFIp@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Wolfram Sang <wsa@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	Krzysztof Piotr Oledzki <ole@ans.pl>
References: <3b1964fa-56fd-464f-93d3-98d46c70b872@gmail.com>
 <ZryRqVexisiS-SGp@shikoro>
 <dfbe5afa-daf6-4366-8f53-c8f7434b0748@gmail.com>
 <Zr8ar4SCtYAiq-U0@shikoro>
 <271bc1f6-966d-4567-88e7-4bfb82d979aa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PbmlJHRv2iSy9J/6"
Content-Disposition: inline
In-Reply-To: <271bc1f6-966d-4567-88e7-4bfb82d979aa@gmail.com>


--PbmlJHRv2iSy9J/6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > In all those years, I didn't even find a device supporting 10 bit
> > addresses. And I really looked especially for them. Some controllers
> > offer 10-bit support in target mode, but that's all I found.
> >=20
> I found LM8330 which supports 10 bit addressing. However the upper three
> bits of supported addresses are always zero, so there's no benefit in
> using 10 bit addressing.

Interesting. Never saw this. No Linux driver as well. And for some funny
coincidence, I wrote the LM8333 (no 10 bit there) driver 12 years ago,
and Dmitry asked me just yesterday if we can remove the driver because
there is no user and nobody updated it for DT. But still, nice find!

> > I don't really have a roadmap how to deprecate 10 bit support. Because
> > it is exported to userspace, the first question is if we can deprecate
> > it, after all. But not much bandwidth even for that, currently.
> >=20
> Yes, removing UAPI functionality may be tricky.
> What I meant was that as a starting point we could replace the following =
in
> of_i2c_get_board_info() with an error message stating that 10 bit mode
> support has been removed.

Sorry, same answer. I'd need a big picture which I don't have yet.


--PbmlJHRv2iSy9J/6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAma/ZuQACgkQFA3kzBSg
KbYuzA//XAMaJEPSwo6aRG0jKkNTgFxq0fbBqUoAL2M0VxF3K22bXvzcQ40xQE6r
8YJuWWHY/dGSmoX4ASEGGTaFMQz4jNQvinHHIZFIswfQVxkhbvoSBD3Ldi5KNMWR
Zu4kzAsIhQo00pCnMb5sNeQ7wGKGWQdtlYbVYiLdKnsRum8SLfRgTGfK4cELUBmr
R5ZbqR8YpDSfki84/XZ3LUz88ZtPlgU6meQHXARaKEIHMkC1C+WSABZRMkeukG/B
p12pieNiueGj7T1Ay7ugnEyNwjiGNq61yGGNImXh2LExzvLHBLBOe+ggB9JhsK6M
zaqOyIMAIQ418WQom2dcrzE6xQUkBm00IK5RPEEq9kKHixNuSeZ+Ghil3xtYAfk2
YLJdo/v40Kzk5aw4prwDDVSDjFyNxvEQ3XtvZxHyclimz5XXRPjzcWPA/OSLOAhC
cmxgU/X/AOY9X3OzKxaxuFp5CSfuMTLUjsdKhXzH46qhlmpgcupSqDA3G6k6yFa5
2lYu333lbS6/NM3tiKezkeur2f7e+GvYEEB5ZOvxu2S9cFGGKz+urpOkasGLe9xQ
urEhb3Fcib619UZAcGFN4kTmFlswhWPPHNag/5lYwyoJ/3HgsIETVRoF16IvG+Qd
OrY7g+2B+/rQ/TBXFcg+hvmE/Ncb1Z7Z4lugqS754uu6YT19RkM=
=blew
-----END PGP SIGNATURE-----

--PbmlJHRv2iSy9J/6--

