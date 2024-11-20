Return-Path: <linux-i2c+bounces-8079-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7FD9D342B
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2024 08:33:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B8C31F233A5
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2024 07:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB7A3158DD8;
	Wed, 20 Nov 2024 07:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xz9dk82R"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B8B156F28
	for <linux-i2c@vger.kernel.org>; Wed, 20 Nov 2024 07:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732088031; cv=none; b=Ger0nc3zSr36gC1AijIt617Ru7/tSEa3jdj10jZOvjos+3yL40TH59/CoBlDHD9aVCRh7XqF0Sgtx05qM0Hs38mON8BTKvyGnUlUW/S7g0vPACXjBSMtBqf208E0RCoti9RAXNkuZmT5R+juPpUcwRVUhqBxsnavpsti0FxIhJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732088031; c=relaxed/simple;
	bh=/2N02UjuIiY8AuWl/LLBKwCb8MhnpFru47oFJoT+NTU=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C+O3mVreWDm6U/Lo1ACmfI9gkma904nBO1RQktcYpkSEQmIv9CoUun96ygN5+4cqudXxedcSpkYGxQhWCahdPnC3obx42mU7Tz5Jz9/s+KVRzBbT7ouxggr3WdbHv4MBHbMT58BCEDaL8vIQlUeqSHTOWBOdjveACYmxajX+/m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=xz9dk82R; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-432d866f70fso16145315e9.2
        for <linux-i2c@vger.kernel.org>; Tue, 19 Nov 2024 23:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732088026; x=1732692826; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b0GO9SsWLPkNa5c/A9E/E8jiamAusBNqMG8Hiwpc4Is=;
        b=xz9dk82RkBDy6Kh2nDAKLk9XYbW5ZahXicSSSdipAGx4lvA7St/iPgGfjA/nlWh/vO
         Ail31OIY45XM1SnEbuekMJHHaYkliG5EzQzhFuC1LSL36iJ7XO9qZnCTwcuyJXD/jxxR
         FMeqPKya6djx96J7jJn9Bcw/ekbq1DJ1TENqkIUqO1h0mGAwAo3oQXcxoBGLVFvZWTPP
         ZT+6S6AIqmcQBPck8A2BzHRwOgDVVvp5Z0p8cL3HU8slBKwooStak3p1t4AJO/wQvOYe
         zoe0EKQ7aRuPERJ6XZmh1+MCNDu+tikqcGdkEQDuLKf8RyhkTzsek5KPaIbg3F2JCZeH
         5QBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732088026; x=1732692826;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b0GO9SsWLPkNa5c/A9E/E8jiamAusBNqMG8Hiwpc4Is=;
        b=QzfeyBfLq0d8JRrl+yFf+mrUcHU0uEsEdAeDWkGh1dd7HOWOq7a3T0seEL8jjdBUU/
         bwSt0B2D/hntZxIobuJnj+4smM4nT9VC2fNDlyN0sqosP5317t6a1e8voiWMKymTLNH5
         madKjA15ugFOVndZdV527Ki6bMjn39J1pIGWEQo8qXld/YaYVSDLeZl7yG0WC2Z8y5yC
         JDWLUkNsRl0OxbFpR6SZS2LklTrRfE3Wb99UGvDckOIB4C8La742RUPjnvlf6Zza/8fy
         LF5pdekcq9mq7aL5ePNSgs4r7zR7MJsczGe8CZZreAPZP3YGQKIITWo4s4bwA3jjfL4S
         lD6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUpb+Y9DTv06tMYAEMTc2Ttwf4Bs8ucZ0XyXn2A+0KT0htolCTo+79/HntaTEu44LZFJtrsTU6sXSY=@vger.kernel.org
X-Gm-Message-State: AOJu0YysRWnsBRKesHVC/xiNd5TvamdCoEMFZpMKbgbV50rRkCakvp0n
	jZlTXUvqKxFTZGIUcl1L4icZwMLgL/OmTkMPFmEIdmqrVRCKBLXEqsLfb6LrgiU=
X-Gm-Gg: ASbGncvTdz11Ubw0vlKVIyjoUUz0B4Vluy/JFYIZpVFYfrFQz+o+jHpAjwJ4/sUuUWZ
	0r4gEbCn6MBbUa8vhmytO7Au1nMYbMsAQ288C4PJ0qFlM6qe4LZ9hA1XSQIIHBr4GmjIKpG2Xgj
	gKyNpr7WxKg2yjbrw0isqm6F20nPk7daqflPWWKfMPaiOxQ2W8mjMc4NFvhSkJVnVpizM6v+WHt
	UW2PcRF8EcB1XVuKAYqjm4sWafr+axED7W8LsoXwtETD+SGBH1NDxsJu/EGM4vLOp12jqp+t6gS
	vjE=
X-Google-Smtp-Source: AGHT+IF44p3XgRYVMbk8xdY0R8mxnMIa6aNR5HCHQn96bXYPBkH46u0RpAciqTX+o776jvqSZ2/+gA==
X-Received: by 2002:a05:600c:1c84:b0:426:602d:a246 with SMTP id 5b1f17b1804b1-4334f020b7dmr12439925e9.32.1732088026432;
        Tue, 19 Nov 2024 23:33:46 -0800 (PST)
Received: from localhost (p509159f1.dip0.t-ipconnect.de. [80.145.89.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b01e1170sm9476975e9.3.2024.11.19.23.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 23:33:45 -0800 (PST)
Date: Wed, 20 Nov 2024 08:33:44 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Thomas Richard <thomas.richard@bootlin.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: cgbc: Convert to use struct
 platform_driver::remove()
Message-ID: <xyxayycrcki4gjvgyc4x4onmsoxl24rf5ab4ybgpyggsrmdygr@v5xpdhphourb>
References: <20241016091323.12578-2-u.kleine-koenig@baylibre.com>
 <twrnl6zi3tzluj4z7yutb34r7ljr3jbk5jzf6jzcygxt5yq6iv@h7cwqlbtcayg>
 <Zz10-aGTFmWcw-1e@shikoro>
 <r34ulkawh3c3e2mzyv4eskla7e76z73otpbp4ei2gddarabyxk@pcuw2a3kards>
 <Zz2M68kCkuZvzzel@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5jkjjjbbaazszp4e"
Content-Disposition: inline
In-Reply-To: <Zz2M68kCkuZvzzel@shikoro>


--5jkjjjbbaazszp4e
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] i2c: cgbc: Convert to use struct
 platform_driver::remove()
MIME-Version: 1.0

On Wed, Nov 20, 2024 at 08:16:59AM +0100, Wolfram Sang wrote:
> On Wed, Nov 20, 2024 at 08:01:20AM +0100, Andi Shyti wrote:
> > > > This driver has not been merged yet.
> > >=20
> > > It is in Lee's MFD tree, and thus, in -next.  It will go to Linus' tr=
ee
> > > this mergewindow.
> >=20
> > right! I saw it but forgot about it... then I will pin this
> > patch for later.
>=20
> Lee provided an immutable branch with all the patches. If you pull it
> into your tree next time, you probably won't forget :)

That would be fine. The patch was marked as "Not Applicable" in
patchwork. For the time being I updated that to "Awaiting Upstream"
(though that doesn't make it appear as actionable).

If you don't pull, be asserted that I will remember you as my quest to
drop remove_new depends on that.

Best regards
Uwe

--5jkjjjbbaazszp4e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmc9kNYACgkQj4D7WH0S
/k5segf/Ubh3DSwrRqJywPmOoP87xiFoIozK82by1kJBKZiyd60zdV/Y6Ea/1XE1
I8dnSXsHxLgkx3Xp9p7858agBDELL5GHDuH0kOozEuCkZKVXSOXUtyataRaetum2
3SuAW3bu+vLd/nD8wc8T9I2GRAPH6J3B+jN/Ne84Q2Tq6y14qaGrqR/fsUsZZV9A
U2prZf3NSWPLZLGKaGOL+hlbu4/f+69Rs2C9IFs1KVlxkP2orN9EvUzfF/sd4TLQ
e1hQca6rz9zWYsdC9zbBgVIG4+kIO4yczVjMDWoX+RJka+Lq5eld327JTnEewAtu
AAJMdHB2/ocV1xSPLU+gVkGbbO66qg==
=ZQNH
-----END PGP SIGNATURE-----

--5jkjjjbbaazszp4e--

