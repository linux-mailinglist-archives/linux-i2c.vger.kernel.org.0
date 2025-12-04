Return-Path: <linux-i2c+bounces-14396-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CCBCA3682
	for <lists+linux-i2c@lfdr.de>; Thu, 04 Dec 2025 12:18:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8B6D4300DC86
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Dec 2025 11:18:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55216338926;
	Thu,  4 Dec 2025 11:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="OA8RohSB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8D72EBDD0
	for <linux-i2c@vger.kernel.org>; Thu,  4 Dec 2025 11:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764847104; cv=none; b=pPOBiqQZ+cyxkvCF2HQ+o1e9nW0BzP3Uv2jFqrHn4ijxHIfU947SyMIxKrZD/lhEVHG/gRb/8jaZwtDzBB5Ox2NzRq4aca1LEM9jecxOLzQHgzWIgtAjk240c+r88gKqunDjj6yEEN/MOnGkzjvszaPbhJVUy1J7WtPQampp5Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764847104; c=relaxed/simple;
	bh=+LOeBEfr8ZEdGvSNvofGiFrT7OpuozP6mpPTcUt6zJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m3EbAwZ2R/sk4jJcg/TQ29GYcnlpUmvpniWPgF0mchP2lEEg/CekMqqPBmJOJCvov/3UtVgRtOh3oNCGvq/yUhyJsbbhodqCFRmOvQk+unyOBmCx0NckMRB6I+1xK6xMEVgtsE17BE5dUnfUzH8cX59GqSHjh0TsmlW6D8awfus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=OA8RohSB; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42e2e2eccd2so605373f8f.1
        for <linux-i2c@vger.kernel.org>; Thu, 04 Dec 2025 03:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764847100; x=1765451900; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+LOeBEfr8ZEdGvSNvofGiFrT7OpuozP6mpPTcUt6zJU=;
        b=OA8RohSBujOiEUqeXuXsloF2g+hRrbzpTai76huy8HXBadjwMsStZu8I2fU66DJ8TO
         FwnaDs8n0El1DYvJ46uylCtVzUKlkPxmsD3vhxPCF5EiSbPVit0LuMPaO4sXBZcJFoiR
         mtyG1ZmBoAMLyM2cqApsJZu3xIMTwKe4YNAH65SBW3mBFeDXkM7j9kmuaf/lddfzBN90
         iTLULxe3+ksTW7sj6xWaZVOi3yWz6IXyuzfUBtE27Zu2tFTFKx795tDrB7Hq6OEALiSV
         geJZmKLsuwri9n6FviqzsK5nCdpEoGEmBCfQ4ddyR0f/dmwpvZffTTxDS6xKkMgbiQC1
         SJMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764847100; x=1765451900;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+LOeBEfr8ZEdGvSNvofGiFrT7OpuozP6mpPTcUt6zJU=;
        b=ZgH2TRulSh/VU13zqqek9geupaqKVgffs3odYHlq+5pD6ah1PDwLCNM3Qutm1Lf8xx
         UcoyWPEFrZGgxrwW+xrqQ9SCscofZp9xFoEbu4kYezKfCab6ZissDfaKAZa2uTpjkfWl
         s/rOEtPzmVX6XUrBOyX8Qx7KfJrmbCSPih/n+Z3d4I5VUDvGDT7VXIpVHx5bfkDT5EE2
         T0FYNc9UXVMeq4gP2laNL5qnLIO+oNCiEXbr94NKTwpEJ7/Uyyzd4NVfj8KShEU3Ra9M
         MLUWdEjQy4dyMcOXWn1R4KDh04kUlDF/2ow5o/7tTr8gqReBM/PbF+zLcRwvd52tjieA
         AhzA==
X-Forwarded-Encrypted: i=1; AJvYcCVSNA2JF5/qVDGQlgkhcczrlIFzSsDjAcLo7oWlqcLqn9FmkCrw/tv8/KrLgXsJojvhTSIwczsmhTM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLxZvSxHcaJtG+Fa7nRzcTiNrYxk/VFqlBKAspF5tm5aQNCG+6
	WgyGXoCljCDbVOtXIfml5hXWdFY5fyqWtQGfiBwlsKpMluRgxA6+KXmbIberziH+w+4=
X-Gm-Gg: ASbGncvx/1fQBz1QQokDhK7QBR4u6H8CCakZuMp0PYkbHrOSVTRpBPDMGQu8Ozj7QqS
	V++H21Xkkb8R0PYs8VDrVAlGXZrk1oz64YZjtCKEtpfmtq6Sh3JBskon/4AXWsWXxjwmSF3B63U
	vVIGljpySFQa7TJfiQt7rJ1tuOVxy545x+g9i8Cu9h8F0Yo7Ru/G7I+moo7RCAVZpsbHve73j/Q
	X1a7opfLMbXMEkjWHYlHNGlaIMWkOwfSgshhAeFsv0x5m5xegWsArwnWT2AYM1pZxwxZftkD4tZ
	VK8RMpWTRlp5jEI8FIDiE9C0nwzcWu0+zkGsIufPQFNIh5Y2YKyLCm2H11DZj3F67IXkmfNXCW+
	WqShMgd9Vk7ew2w4/VDmkIzVeva94F66DqLbvmeF0zIHolJfpmZN/uCDLSk1lXE5wOzlbWFc3LM
	GGZ1LSXLJmR1U5UsunqMPGx+ZOWRX/Ak9jqZ/98BqfJy5dTcphs7ColxI=
X-Google-Smtp-Source: AGHT+IH57MsQAl+/XT2gVgjmbcRNCbkMZAWMG/keUEp9la8csas6oJpOYVghaAgaaYbkbn1de2irrQ==
X-Received: by 2002:a05:6000:1a8a:b0:42b:5628:f4a3 with SMTP id ffacd0b85a97d-42f731678e9mr6043858f8f.1.1764847099664;
        Thu, 04 Dec 2025 03:18:19 -0800 (PST)
Received: from localhost (p200300f65f006600000000000000081d.dip0.t-ipconnect.de. [2003:f6:5f00:6600::81d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42f7cbff352sm2654474f8f.17.2025.12.04.03.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 03:18:18 -0800 (PST)
Date: Thu, 4 Dec 2025 12:18:17 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Eddie James <eajames@linux.ibm.com>, 
	Ninad Palsule <ninad@linux.ibm.com>, linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 04/12] i2c: fsi: Drop assigning fsi bus
Message-ID: <lwnjd4a46eypemd6daqitdvmapjjx4c6vr6yeuzf3qpvd2wrs2@bcmxgupsbyj7>
References: <cover.1764434226.git.ukleinek@kernel.org>
 <ef38106b5099e92395d5cc84d1bf0b806b53d1dc.1764434226.git.ukleinek@kernel.org>
 <x4y4m7bclxs3rbb6ptqt6chlg7iaual4wjz2lma5ugdhfp2mr6@phsjcud6vfax>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ofyrr2hu65mfdg33"
Content-Disposition: inline
In-Reply-To: <x4y4m7bclxs3rbb6ptqt6chlg7iaual4wjz2lma5ugdhfp2mr6@phsjcud6vfax>


--ofyrr2hu65mfdg33
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 04/12] i2c: fsi: Drop assigning fsi bus
MIME-Version: 1.0

Hello Andi,

On Wed, Dec 03, 2025 at 06:07:11PM +0100, Andi Shyti wrote:
> On Sat, Nov 29, 2025 at 05:57:40PM +0100, Uwe Kleine-K=F6nig wrote:
> > Since commit FIXME ("fsi: Assign driver's bus in fsi_driver_register()")
>=20
> whoever is going to apply the series needs to remember to replace
> this FIXME.

Ah right, when I wrote the commit log I made a mental note to point that
out in the cover letter, but then I forgot. Thanks for the reminder.

Best regards
Uwe

--ofyrr2hu65mfdg33
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmkxbfcACgkQj4D7WH0S
/k5bjQf/fgyumKlkXTNHtLYRAcdelQgnmwQq3VoF0X5TFn7pl2FyStUJSgvRZ87Z
59RLfegSso/0LIjvLUOkEJ8HX/Y9gDmE0pZKyuJ/jOuxHjh0tcKWtbGzwCbR/bh8
ceQpdwLJo2ZsbUUfMrkfoUTsY27SeDiyhHC9gZnj8KDQDDkZZ0BmLcbStBqvZIKJ
gnFijsB2j18OkWgd4OV2dmvISQgugOBOFTEsP/pe4CvLClTszpnZ7nSX8f2SJcFU
ce/x6ejJOGdagpSy+Udnd8TPWh4CGVPtZZEZT6w4gM5FWXG20l5p8TIFdDZC6iW0
ZmB1RTUTJi/nA9BZIgzKuWicB5Dayw==
=GVZw
-----END PGP SIGNATURE-----

--ofyrr2hu65mfdg33--

