Return-Path: <linux-i2c+bounces-11321-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FACAD2F4B
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 09:53:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5DA967A3C01
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 07:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24AF728000A;
	Tue, 10 Jun 2025 07:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jhPOg7zO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DDF27FD49;
	Tue, 10 Jun 2025 07:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749542001; cv=none; b=UkTXPps5zUaxZTptMWvxGdyrzYgjE72GIWH4R9nTduUd0TTglOoJAKFdHw8XtFrlniYBK604OU5XWJqQtt6/YLOj8LDUg9/daKn7bZxEGBpWKcYao/4Z8ZkGdXcPJRjgMs7+IbA3FUBKjaKkXmxhjmCmMHFRyCHV50SdJuSYnMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749542001; c=relaxed/simple;
	bh=D93wrwrug+T7phvKNJP76KESEMVNJ0xHk87qxJW+p58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RtOErsfnf1IoI6I7NKcVxor4FI4bR9PmW/TfqhHc9Q4qE+wEb/EHC9cW8WlVOT7aRhwD+LfvZ7UJFIexJ0+Xd4PYOvHqFkRE8PiFFHEuXZ6566Ys2vZ9O6U17x4b3F0Qu0j8S6yrWz71j8cb5SyPCSQAN+0F8AUc7SZHlMpo2dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jhPOg7zO; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so41953695e9.3;
        Tue, 10 Jun 2025 00:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749541999; x=1750146799; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D93wrwrug+T7phvKNJP76KESEMVNJ0xHk87qxJW+p58=;
        b=jhPOg7zO/p81vdnqNl6+0txTYwf38xXS5VfhA0pDvyDCI2g8eDGzRpHog3x5P5DOwY
         JR1xzSCZK4rMuK4htmI7SM8IyiJC7FofdDGFQjvZr4dF3lTMquXuy4Y9udHhplkzMF/9
         Yp58Af3mKJbpzoq8RePRVOwOEcYkP3mcXe4jNltYmACTWq24qojgVcbeEg6QSO5LXpki
         PX9PU+Fg8U/HHtSxS2pktanKKYN7qJnmDuJB0DyhAMdHleGYNYW2Kal2tvU6XfKdvZzp
         d9wRtd6WgFcKI1AMXd7vfbxEQfhgT+xpTwu0Bg1Db6K9G0sHRdsZ0GRDUjK/oHPHr7kQ
         /Ghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749541999; x=1750146799;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D93wrwrug+T7phvKNJP76KESEMVNJ0xHk87qxJW+p58=;
        b=vD8esIW8ZKT1SNH4+LjBohULRGTOjjl3P/h4D1yjwJUnTWZAsrNKm/Tiw7SZoaAX9R
         SCgXUael7OTgqwaMpeVkKh75SF2jhyEcg4ja60VOUTijp+Cm1VE47k1FXoLSGFsiKk/m
         GlN1Ai4aTh+uX41vFZIdwC2ka6uk8OshNmyyjfDr4LZ7vCAZyQ614CrS67P/HfSK0bjY
         ilblfrks/hJSKpJya1zHVK5u3LhPYuwcgvw5idZ73V7UDSVMToNEIa56l295QIP/NWyh
         oRdHGEmHZ1U1NeOswQ6lnlRaKTcsbsjwQSSTRhw4JWVY4q/lKjuONejE5HrBbqgpQu+/
         HCbg==
X-Forwarded-Encrypted: i=1; AJvYcCUd17q/+1txeoM7K9S0ftglh9JLZicHz9QVElce8jMWXXsKvHNRNIOcrFXk11Yad04ZNPX7kyogee/aeWjt@vger.kernel.org, AJvYcCV/2wMLisUqs83FaMgDI9KWrBy7Nna2ePMzYqx9GMwICIvHA5H2cMs6pYN3h1Tadf41m4E5Vco+k6qXda8=@vger.kernel.org, AJvYcCW5bsTqhFgE9H0kULnEUYX/NKUH3Te1g9ggB4R6CZOJNZCn2l7h7YCLfGXwbP6sT119SDhOyydDvone@vger.kernel.org, AJvYcCXhXdljLoxXszwMNrmLvG2cq9Dd93vnS/cWevH/HllZYJv2tS/+qlL+Y5o9/8cli1iFLNEF496Oro64@vger.kernel.org
X-Gm-Message-State: AOJu0YwwuFU3rHgGNzNfR0PJgEQeqVAgvcG8GuiDxmnnpy657bvxWQjv
	nUWWd8KnjEvbqd7BgeybYj/bUXrs78LK4wHbvw6L7nvxDyH8WEQav05F9lczrg==
X-Gm-Gg: ASbGncvuMHwcC6Se/B3GGrX0PdofkRPlTiQ1AVJ5id6VRZiDuMtnr5LvRTw9wfjvtQR
	tFNqpk3k+er20n1Uw0Vfx7pLWXt39r1stvApgnSytKA6FcfGj0ZrLipoSWLtoi4ahFMZ20YrYfp
	jdgvSRlvIjDSf8cXC9RUBMae5CEjwmwlv9g6y7QeS2AuGUsUa/IEDdBRGlm53jyiHwybQVSyKp0
	8gtfX4IgHQ+Y8//YLFHOczTNr0myHuP/DnQ4CpHxZOO3rYJTvw4/A/zGw5ZNkxrB6uu6SkBZIbC
	NQgcF059y3DqJuU61NNGHXx3LGcONMB0ha6Y1Ygd0nDPuokzx57kwV2uh0aeWjF4UxzwGVWEYc3
	0Hm4lFn85PiEBrsm6NSG71oxMVUe0FU5oGVo+xfhrB6eJ/K2N
X-Google-Smtp-Source: AGHT+IFh9YhJnqhWDkVmmvuw004LvuNmD2yeN3hYhtP9reA+plSwptUHsmV7EJfZF3m7Whz33ZBByA==
X-Received: by 2002:a05:600c:8b48:b0:43d:9d5:474d with SMTP id 5b1f17b1804b1-452013141b3mr160712685e9.0.1749541998248;
        Tue, 10 Jun 2025 00:53:18 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45307b4788fsm83220535e9.21.2025.06.10.00.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 00:53:17 -0700 (PDT)
Date: Tue, 10 Jun 2025 09:53:15 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Kartik Rajput <kkartik@nvidia.com>
Cc: akhilrajeev@nvidia.com, andi.shyti@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, jonathanh@nvidia.com, ldewangan@nvidia.com, 
	digetx@gmail.com, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] i2c: tegra: Add Tegra264 support
Message-ID: <kbfl4ye72chc4avrpjzirh73belp6waue22sa4qypuljjaus44@hpxr5dkthezd>
References: <20250609093420.3050641-1-kkartik@nvidia.com>
 <20250609093420.3050641-6-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hfqhgukshndrcmfj"
Content-Disposition: inline
In-Reply-To: <20250609093420.3050641-6-kkartik@nvidia.com>


--hfqhgukshndrcmfj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 5/5] i2c: tegra: Add Tegra264 support
MIME-Version: 1.0

On Mon, Jun 09, 2025 at 03:04:20PM +0530, Kartik Rajput wrote:
> Add support for Tegra264 SoC which supports 17 generic I2C controllers,
> two of which are in the AON (always-on) partition of the SoC. Tegra264
> I2C supports all the features supported by Tegra194 I2C controllers.

Maybe mention here as well that there's an additional SW mutex feature?
It's not that big a deal, but since you already mention that it's
similar to Tegra194, might as well be as accurate as possible.

Thierry

--hfqhgukshndrcmfj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhH5GsACgkQ3SOs138+
s6EspQ/+PB6DNO8iUCugszKnl/8J65y10Nd+TPJXhkeLJrDX17RbSzbLQc6iBLZx
GT+RxN3uLVU+bCcun1b5OnG5yH4wK3zKb6WBVga36vlhYPhei83qwzQt3c4w6W6w
EcgZR9WVSUCjxuEYwqbO66QNwG20CoO+3n6IV34fhaOMLvvekZtvvdQeT8+rQnB8
WIErkxJHmyphc0i5oPwmPyAdKYLVzs41Vyyod1e5UEEF+xQoMiew9fuaq2eGo9eT
j9AXFXgCR6y/elW8id3OB+N5V/K5WD0cv9rWusRctXxMBUL/oXXHk8p3HLnU8fOl
qGPRzweeOiRx+U0+85xgp4E4RGWomKNeifJ9o8h5zieaG5+2P/plAWzPGOVXzfIu
c1T6vVtAkTwZjLRC2ZmueAytR7sSkOwtJ+uiPRAFD4+6jLc2OGk9kSiuqK+sj2sx
soeilJLLG3ixHlJCVtNfl9nwG32Vq3roIAjNKNr4LQcS2sospX0PaOmsLH+pbNYL
35PrCTWHiRy9utj1PY7a7tgj8btPEsazI5a956Evj5o9FLum6oz4FQuKg5CsVGji
OICNxW5Ij5GHpSN1DrBQiK1XqY2jBA0AuMBV9jAwpj/cbTm758b4OsVt9DI2zwbf
25a85IkmzVeS1qUNiu0LrkiUinvAOTcvHANfBnOsQwZ1D1eEh4c=
=7cXs
-----END PGP SIGNATURE-----

--hfqhgukshndrcmfj--

