Return-Path: <linux-i2c+bounces-14460-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD3CCA8342
	for <lists+linux-i2c@lfdr.de>; Fri, 05 Dec 2025 16:33:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6D5153058B99
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Dec 2025 15:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3ACF305E0D;
	Fri,  5 Dec 2025 15:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ymQMBfHT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22936309EE5
	for <linux-i2c@vger.kernel.org>; Fri,  5 Dec 2025 15:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764948635; cv=none; b=KxeQETGm8F6sc7eu+1j5xItssoXDIAxOwo8f3uGRTF3WTNMDcnWuC7DZTSjXoXC2y7jL4XTbLF3PpGKdn6IMG07giuAlEmGt7PrGfQSI781he7wlFtErSYlSVgLCJlWcrryrRK81YIkcS8MarAu+y7hmgX0MvAXQwG5xwW/n7PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764948635; c=relaxed/simple;
	bh=bnF87if676vlxacDwch5pHFPRT0g1yDIFuiGnidHF4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LlJ4ThCzw6cazdq0BmISc7s+4z9P8YvIUs1iS2Jc2NKFedflbfqvkXB0eMS18gtqhp+GL/qWrVrvqjRy51GFmM3c/V4ybGx/Gs1BktyvwrPiy8TbBEjVGOJMNOb5lMF2vOaaUH1d7/BO0ENzylGxIhXiY3EORpD66UhkhxK3PfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ymQMBfHT; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42e2d5e119fso1049872f8f.2
        for <linux-i2c@vger.kernel.org>; Fri, 05 Dec 2025 07:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764948621; x=1765553421; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bnF87if676vlxacDwch5pHFPRT0g1yDIFuiGnidHF4s=;
        b=ymQMBfHTdviE/LSJeor2jrlkRUPhA7tYmPVMSylZVXk6ddlu91w/Ei3BzdsD0oigv2
         9EkEWEE9zOo0FW4eU5+E0JqQEOM5oHwnf6F/sV5hJTUjXxwvAzo/xkoEQz2oaPvrKrtX
         mm8RkI9t1gNufiNyYRm7IGUQVVYcZEyIaCFWZbLZbnyzQ7w+0x1JpzN22L1Lh8emiKYl
         l0+hs9Y3ZNit/cXFfeNalleHE7iHyjhumKePYw4sGGnaXkgFdTYpp1m6kor6unI1a+Nb
         N5N3amg+ccermXbfc1L5abo2/pdeQQnZl53NgsyOv0F3LZl6D6UR3Ri4j8PAfGYiDEvq
         T38Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764948621; x=1765553421;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bnF87if676vlxacDwch5pHFPRT0g1yDIFuiGnidHF4s=;
        b=OYvw2mk1xZwkjP2gHWXoTZ5OcNYcYMPrxiMqwh1YSOBW5sPpuk6WfX3cWT8sAXqYAG
         Kmtj7rc+SvB3FSmkeUhWo8lFJam8mO32t7ojIgL4g0lu06DYfQgHTZXC5tJKc0/lET+o
         9oU9y/5NXhfsPj8s78BDUOMXB7u/BLLZ88cy1Oxe8aPWS6kF97O7T7vHZNEhftkeqUJT
         7ey3CQkmynEEMfyXiad4D1jep1p80hFcDiNGeYyJFspfJGr/ujUFIx20xrxVzaprYl38
         nSdVvb1ix9pTb3kM1Hj4HZv9UwY31oPAkusTG9kBwdrn13hMO5nK/nxW9ZghSIoE5Eq1
         yAMw==
X-Forwarded-Encrypted: i=1; AJvYcCU1anxPXsTBnZcJymKW+YRlx29J4LbzK4speVe19CGbzs7w5YKb7IwJZ0TEgQVY+gWJMqVZwaI+BYI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZrDynIS7uNDSuwbz/6jOyTJVZwSj8CWnGJTsYgkh+dd1Du9/C
	BO9r6n/znci9D7k5JY8l+uZnI65pHlJyACoa+8cg/mCOZp0fSkhuHgnBOgycuWiN54c=
X-Gm-Gg: ASbGncsmIFY05OwCAdW6QfPuGQRB294CZswWkEACcxB87owpBFKoECgjf0U9+gB6BBd
	JDDfKx59uRmTDRbtfiLvZpxVm3uw+LSb5FHh3dSkNfxb0vdfEKCmtpmIxPGhMlXPwR7SlI2crSL
	vI7FKWmi9YD3NRDHL5Pm78KLqed/yGWYkrTbzeQ8YPE7NUBM5sqDlZio3GCNl1pULryDGyfTwPp
	fo4U5LT+FERm5A4KTYqlimz4kcVfj1OKf4evlDeRdluPOGaMLGnTxLfK/4X0V1Idf08ZbZlHK7P
	r2TWt5PpI/379lyAHKVcryD0A9Nos0vSEuuhQXn0XvfEYdviOohrUDGGz7v/xK9uFqZumfxDhpZ
	v0jOriKr4xedWmGzamnv/aBFkV30nAfBj4JmahyCxGJs0yn1y2YrtWnqqY1vB8nZgXJ+aORZXCm
	T+JA5ED7LXe8uhaZ6heBluufUQpp9IBeVcmu0FcdcaASvi3/zJpvDrV/DsBztxa6SCrRUAffYum
	A==
X-Google-Smtp-Source: AGHT+IG9OTpWAaFioAhUqNYkEUIfjg2JVgLW6606fMapNPZXQsf9lwNr2Fe2wAiolNVCjjQfc9D6Gg==
X-Received: by 2002:a5d:5f45:0:b0:42b:39d0:6386 with SMTP id ffacd0b85a97d-42f731e98eemr10449236f8f.31.1764948621389;
        Fri, 05 Dec 2025 07:30:21 -0800 (PST)
Received: from localhost (p200300f65f0066080f2a7d55dcab4de7.dip0.t-ipconnect.de. [2003:f6:5f00:6608:f2a:7d55:dcab:4de7])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42f7cbe9065sm9319885f8f.8.2025.12.05.07.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 07:30:20 -0800 (PST)
Date: Fri, 5 Dec 2025 16:30:19 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Eddie James <eajames@linux.ibm.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Ninad Palsule <ninad@linux.ibm.com>, linux-fsi@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-spi@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 00/12] fsi: Convert to bus probe mechanism
Message-ID: <tkg3ut5prrbur6dqh7elxmu4djqj6dgsymmdzalg5gtqgnn6jn@6pi2fskmnbyb>
References: <cover.1764434226.git.ukleinek@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yfs5kz5w2cta6clk"
Content-Disposition: inline
In-Reply-To: <cover.1764434226.git.ukleinek@kernel.org>


--yfs5kz5w2cta6clk
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 00/12] fsi: Convert to bus probe mechanism
MIME-Version: 1.0

Hello,

On Sat, Nov 29, 2025 at 05:57:36PM +0100, Uwe Kleine-K=F6nig wrote:
> for the quest to drop .probe(), .remove() and .shutdown() from struct
> device_driver, convert the fsi subsystem to make use of the respective
> bus methods. Some cleanups are also included, I noticed those while
> working on the conversion.
>=20
> Regarding how to merge this series: There are two drivers touched that
> are not in drivers/fsi, namely drivers/i2c/busses/i2c-fsi.c and
> drivers/spi/spi-fsi.c. The easiest would be to merge this series through
> a single tree because the i2c and spi driver changes depend on some fsi
> core patches and fsi_bus_type can only made private when these are
> applied. I tried to quickly resort the series to only need three steps
> when merged separately, but this wasn't trivially possible, so I hope
> Andi and Mark give their acks to merge their driver changes together
> with the fsi core changes in one go.
>=20
> Note this series is only compile tested as I don't have a machine using
> the fsi subsystem.=20
>=20
> All the calls to get_device() I found in these drivers look a bit
> suspicious and I think there are some issues with lifetime tracking. But
> I didn't try to address these, so I'm just mentioning that here.

While working on more such patches (for other subsystems) I found a
problem in this patch set. Please don't apply it yet, I will prepare a
v2 (and then also explain the things that need to be done).

Thanks
Uwe

--yfs5kz5w2cta6clk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmky+oMACgkQj4D7WH0S
/k4phQf/TtGRlPwbVYnyLP0xN1AzA3+J1cbc7ZQfmjPBA8VMd4NuPfJYbMYA9S6k
v4ssPKpvMCGVgU9DVWY+HMAmtejMLoj322bJ0N/8YAt+eTlFTfctwKNRPZWU7Nbs
HHQhj9D4Z6/mCwYdULVTeLZRzTf7lJf8MPFdlhpnHcAZrlzEt5MM1fHsMKf1TRl7
whcDek39s9jy75CN3kR3Cb6LtmRG5eigVl6JOQ220UgKX5tZ4kKzuvDHZQAvCxzF
pzM5L7aPOU7xjDH/d2M2CB7ooQ/OslKGo+qZ4aJu0Y9zGMEwuti9fGQ5AV75tkgL
5Iaaxj8c2PLV0tWwemlo5uyUUYN+ng==
=e/VW
-----END PGP SIGNATURE-----

--yfs5kz5w2cta6clk--

