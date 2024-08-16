Return-Path: <linux-i2c+bounces-5451-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC8F954557
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2024 11:24:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DED61C21725
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2024 09:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7228E13AD3F;
	Fri, 16 Aug 2024 09:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="YQjQAIEA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E3B13E021
	for <linux-i2c@vger.kernel.org>; Fri, 16 Aug 2024 09:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723800249; cv=none; b=QG8+zIBdteqSEnllaNEhURT9IztaSE1q1R2VyziTYkCraY4tH3we2ZRdqoEVZM5Z+NkFgs6N+l5djqouiIe/gPrv1W62ghi1KiuMs0p6ydQfS//09ZO8A1a/Fuf2VEQhhaHZOYjD/7cw+45ydTHYU+1EYndX55DOrN/p8fP1+q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723800249; c=relaxed/simple;
	bh=TRYFMGwz8zfWtTWCW34HtExNTtcy5dn4muLOv+Q/MIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQowXqHKWscLpGGOLmsjZynd79geo3c4UPYjfuXOV2MjfcA4jM5WPIXbGLTyA82npKCJvhfgB5wSWLAvqETCAEIiSCB3IE0dZ0X4vrFhGdKzeYQKIbZCCKZBDxvfbPZyVMUQj5pjDCFSHhSXr1GzZErSfHz5LM0sITQQT5Sb1CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=YQjQAIEA; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=HZYr
	Np2O1n1wqwbcBOkwCSWSpUcHtNdlKpK0jiwNx2c=; b=YQjQAIEALvC5qQoQ1n9T
	br6UIRSTvawCBj8V4noFu+RRgai6JlyqtLX1Gqb96bSHGBfmZmH7oqTdYOH9vwWC
	71IuY8eRofKcFuGAAt6wBeuj23g41tgKOSszpVofqGRBGYRfMuE+vGKhPgpoteTF
	FG8SlQPYltVn4qfqwJYrJ/LlJns+Fnx0xUsstuIj+L26wYoTcDQGTeRdpNUCLElr
	wlJHH8sd9ernv87h74/uBTbukuj/DjllFMOEpCTpRxIHnaCYnIkNAq8fua/utGfq
	gAMGKr/6g2qDn2AuvRigWQDFty4T5aH7L878ZAn32hLOfhgMp7qst3i+WwW2T8cb
	gQ==
Received: (qmail 2543792 invoked from network); 16 Aug 2024 11:24:00 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Aug 2024 11:24:00 +0200
X-UD-Smtp-Session: l3s3148p1@aUD5hMkf5rRehhrc
Date: Fri, 16 Aug 2024 11:23:59 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	Krzysztof Piotr Oledzki <ole@ans.pl>
Subject: Re: [PATCH] i2c: core: Lock address during client device
 instantiation
Message-ID: <Zr8ar4SCtYAiq-U0@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Wolfram Sang <wsa@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	Krzysztof Piotr Oledzki <ole@ans.pl>
References: <3b1964fa-56fd-464f-93d3-98d46c70b872@gmail.com>
 <ZryRqVexisiS-SGp@shikoro>
 <dfbe5afa-daf6-4366-8f53-c8f7434b0748@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mMqSWT3Z43IKgTVu"
Content-Disposition: inline
In-Reply-To: <dfbe5afa-daf6-4366-8f53-c8f7434b0748@gmail.com>


--mMqSWT3Z43IKgTVu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Heiner,

> I didn't find a single dts(i) with a 10bit i2c device. Because you said

In all those years, I didn't even find a device supporting 10 bit
addresses. And I really looked especially for them. Some controllers
offer 10-bit support in target mode, but that's all I found.

Also, there is only one user of I2C_CLIENT_TEN, and this is only a hack
to allow instantiating the device at address 0x00. No actual 10-bit
usage involved. I will remove this as a first step, because this hack is
terrible anyhow.

> that you're tempted to remove 10 bit support: Could the device tree part
> be a starting point?

I don't really have a roadmap how to deprecate 10 bit support. Because
it is exported to userspace, the first question is if we can deprecate
it, after all. But not much bandwidth even for that, currently.

Happy hacking,

   Wolfram


--mMqSWT3Z43IKgTVu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAma/GqwACgkQFA3kzBSg
KbYjgxAAhs/9qGbsYG5xXOTCp1kNCN4Y2U7r1z/jfE9vBUlynjIeQs9I+KNFEYo2
4Rh4PW3VZNzt4bD285AdJ5HOrWzPMcizI0t83TXi1vntHcmFDfOLsG9QC0wKmcvt
8YIvz8V/NzrTmdPj6MemuWsHG30p2mvyjrRIHrqvsVSWdPTO3TjbgqXQQgDQF8aZ
jPTxT32rWCd2i+0WXBuKOnXXqsx6NT/atXNxETE5Eqn3XDhiLETyIF60BEgC8FQH
21RDG4t2KP3CmkH3Jcw4HYPao7pc5TNzSiXM1OjWX+3yIDn9OI6ppiM/yJxA31yU
qbAsMknBQQJTE5oEUI31bUILANupJF4uGDb7vtD+6ERudr8kL7B/nX1o8cKkppDS
hR4VCQAKnNbutnUq+CVAMFOFk9n2e0sjcfTPzAObu5mwtPMuHHK6ffK2WJHqxXUq
Fb08l4vvumyKHt+0sbTwj38bcoTVCsdqGkfZvcIIi3zHbuwfkoZrgGIgs6zp/lxC
YpYORsuXX4u378bDKdsor1ktMefzIlPhLj3gbCRNRIJO/3VgMLknlkXQjGUDghxp
A4RZTdB1ghGplNs5aiSIzYwVfmqFyxWzviWCXb1KkwylZZCjhHRlWxOUTuBlya03
SAB8Y16DLExqS6zVYyCe/YWjxQaikn+fN9YZdy9sAySNDj46qqk=
=UZbV
-----END PGP SIGNATURE-----

--mMqSWT3Z43IKgTVu--

