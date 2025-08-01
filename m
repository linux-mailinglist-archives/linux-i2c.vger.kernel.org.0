Return-Path: <linux-i2c+bounces-12104-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF17BB17FB5
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Aug 2025 11:57:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A62823B7E16
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Aug 2025 09:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D64B523535C;
	Fri,  1 Aug 2025 09:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HkzbNeDI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A1022FF2E;
	Fri,  1 Aug 2025 09:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754042212; cv=none; b=XsJjUPmz8PD01qkg6+d1UzJQrnbCCvhtwakPyU7Tum1LpjzzgxKMm9ovFfZlcoaNf0AHkxJEZ1wN448pBuyT8G90eazJXmueFUQhj+3xZGBObW+EPOeILi34QgV8qrNTN6zwYJo3eTbLSTQV6BBBNPesKF8hEA3YjIV5w6f9dDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754042212; c=relaxed/simple;
	bh=Cti1oyJPdDn3oJT5A9VlLm4mV7CVgPDS1tW1vmqK8IQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zi7+BkbJmjxylg5UHNvl8s2T0H+1OMshxkSyFywhpjyP5vTmjPr2FGEhWYqXTXpNrxxl9Gh6EzmO5qWsrlzO1TbMUcSs/oUE6hEmSw2H95HTPqXguR5cFOiAF6yNgE9P1QRwG+BPaSUm5VyJL5So1CFgcZ84waVGQTBKXiNtXgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HkzbNeDI; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b7848df30cso1731673f8f.0;
        Fri, 01 Aug 2025 02:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754042209; x=1754647009; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gUcfhAUTnpvKTqgTj6oeDN+sY7M5EapKEDlksciuL7M=;
        b=HkzbNeDI68GMM+dteAvpyP4Pt77BTKzjr1tqGA0gOHpCvjiDZJUM9Nrofv1j6maizc
         atmj6lzuygkGPqdDAKAgzdNQ5Kl2bBPY5mSTbKY7a6HiY0+CDzUYdNAJ9TxiHyLMaDLa
         H8AyPiFhciD8avk8Szt0S7JgUbTNMEOgRUvwsO/OrnNZW9Cu84p7cG1AZttjvN1qh6gZ
         3KUt2wXJuNq39x/QhQtPF1KUtSJddmkSqtxRiiQ3uWVtmOcYW1GYXQ2lGbJNBFPBe8kb
         IrDwvsK8rRPmNZAaA91YEZbZXVVmDsu43D8VoV/aypi8faeYIFScZYehFQ0/2va3w/xw
         ZBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754042209; x=1754647009;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gUcfhAUTnpvKTqgTj6oeDN+sY7M5EapKEDlksciuL7M=;
        b=M5sCCR0Y0Ms+QTDBst3/gHHcSQjcmtNlzuNLhHRE4q4afA93hDljVlMhTl6iubxuTZ
         3sEjlNuZrhRVn6VnYNEKsFI8MD+SHDLmQqRMGp50gi6SMvt/9mHeSkOq5MG7xAAwfwor
         azE6S12Qx0Hj/U0R2mu5eGp7LribAJWEw9lZsmAAwJRkI376s0/wuURmiNsg+5iIgIhF
         NlU/1rvjxkTpZ+PBpr7wKp0REHFrgM7DNfzJZhTzjwYm/npLXwn02/afIAn7uYE4Okz0
         hM9BDssuF4+592n2LXvuhWJkdhDy3TQhrt6TXVECVyDbh5o32K5yZv2Z6hh4LlteLv3y
         foFA==
X-Forwarded-Encrypted: i=1; AJvYcCUj5EDGXP2Vc7U2WrRqMjVYqD9M75gpWEiPrpJOYlusJoA/mu+f/iwShCYYaSnmTNcTW1Kr7b9Fya+a@vger.kernel.org, AJvYcCWoVKH5ePhl4Imrs1wqrbbLvbOrlQF/tvA6/l517B8ETR2YrtTmIsqFZHMYBm+W+syF2/AXDAby6DKAyHjE@vger.kernel.org, AJvYcCWwALMp4fhsc8X8J59407zDZxexLxhKPZU7UcbM9NItUo4fLFHEy4wedVYmec6uYIfarTpskUgQQEEEtLQ=@vger.kernel.org, AJvYcCXnVYdKVv0PN2BgIwNRvpVLQ5PFYmkfwDZhUbop3KxASHcFOjjuNJR6JdVVlzExbdZeyGNgKRKKOVIX@vger.kernel.org
X-Gm-Message-State: AOJu0YzvxbFDi3Zwq+RrRjgT4LKEc0J+2GVSaSVLGI/7H6JhbJEf8XhV
	pGjuJ8gzVdMKFlH1GUKzCCK+P+9gDUMpwKyo9FGvDYAQwHwZI0T7HlIM+iEcsw==
X-Gm-Gg: ASbGncuowgTyzbqHaGVY+ZoAHhngGxQlHZm10pCF6oZleu/JGQr9OtJXT4AMLPB8tpE
	XdzK2XLGM6i39iXVrJCVcRfdaCjwbK9rbc9RqLD6QxyvIhDYKf0pj7frPpGBe+kD8lSfMthB2XK
	VVMg9PHsb5AD/PxnUtTBtZ1pBhLg/y7dlPw/iQw+BsvmiZ4MdzdpGBGevehLR+7bmrd2nhAF+6g
	uRkRP/lXO8aZ5JojqaV/tfHmofbiTyMJPUgdzU+IrvCVJKtLVDlsmMUAauySDuLFSBd2qEbFcAl
	1GIvrJYLOrg1MorJaKMCMhRIDkSByGtJAR3+uVpTOEbjLHaH/W3jRCWYltVPFWaG+hWzwgYARqY
	LYRQUQYI9OESVbq+U7gUkckumqnwTCl88pYu7ELYr0dcUKNoFwc+8tA6tt3f5N8iTORBvefte82
	Cw2Mp4p1z2
X-Google-Smtp-Source: AGHT+IESS8Q6ekv5in9XSQWjL/IRFTfWRGHGp8d8bTmHI54KBNDbsIed1g40lasqifFJWKmOJ1Ph3w==
X-Received: by 2002:a05:6000:2dc2:b0:3a5:8977:e0f8 with SMTP id ffacd0b85a97d-3b79d4d8b4cmr4688148f8f.19.1754042208882;
        Fri, 01 Aug 2025 02:56:48 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c4a2f03sm5215667f8f.72.2025.08.01.02.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 02:56:47 -0700 (PDT)
Date: Fri, 1 Aug 2025 11:56:45 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: andi.shyti@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	digetx@gmail.com, jonathanh@nvidia.com, krzk+dt@kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	ldewangan@nvidia.com, robh@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: i2c: nvidia,tegra20-i2c: Add Tegra256
 I2C compatible
Message-ID: <imaclsvs7szgj66pgc6lqdr6ouosj2i2kddugqyfssxb5nk6cx@rpiov7cjpceh>
References: <20250731091122.53921-1-akhilrajeev@nvidia.com>
 <20250731091122.53921-2-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6g62m6f6zdf6dccq"
Content-Disposition: inline
In-Reply-To: <20250731091122.53921-2-akhilrajeev@nvidia.com>


--6g62m6f6zdf6dccq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] dt-bindings: i2c: nvidia,tegra20-i2c: Add Tegra256
 I2C compatible
MIME-Version: 1.0

On Thu, Jul 31, 2025 at 02:41:21PM +0530, Akhil R wrote:
> Add compatible for Tegra256 I2C controllers. Tegra256 consists of
> 8 generic Tegra I2C controllers similar to previous generations.
> The parent clock frequency is different in these controllers and
> hence the timing parameter values are different from the previous
> ones.
>=20
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  .../devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml         | 6 ++++++
>  1 file changed, 6 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--6g62m6f6zdf6dccq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmiMj10ACgkQ3SOs138+
s6HtTQ/9HaWSIxAA8LCEXff6aSKteZRo5d3hRSr2YTli6EeF4gxkZjWEwEctY6OE
aMm9til0hTIblUGmnpx+WBH3BCNtoylIgR9fIu3Ke9MPLRimnmXOaL4fS7cYr6tR
bSupfihw4M4p4GVv5fYOyYWFVJq76/vFPmk+GK0F7vWPXGLP2wH38lg5uU8mr27t
U4oEkVbzyQf55sV6j1JWyChrom15bzTuF0D5tiK61c2FapWOHr0n1Fl+RA6+j8a9
r9+ROz+cLaX9W/D7yAzcZSbyvjMtrt22Ggo642oHA3LOYL/deReTPjjKyd/AcwV1
HbN3kTbH2if8n8lmMjMm5WXK+qrmMZU+y678zplNeznYLYtfoj5d0Ko8u8sd5MwI
O0ZMaewxFlmFyOx4+o/8uCbcQPqbUdl/4LTonSqEPvORlI5wjwXy07dQQSHjP3la
U6WPyMYZ4PIytLFJ4SAoTu/C55Q+yeg20Rj7jsDwoJ/GBKJT46k1zLbUnUHREiv1
Z9wBgIKkydS6idIb1qwdyHHGHviCnRWzepPd1nitMXxaYwCaU2oJ6dYD6ji8i8vw
3AAIX5SfwE8U+M6LJO3/7YxXKdloW35+Ic3iPUQVAnlGR9BPGrlkgMGHdSkBLecj
TqObmHS/99uUwj9ZHAZuXXdcnyBmqPHjlfCqAwWLsmJav/CAjE0=
=Vwdq
-----END PGP SIGNATURE-----

--6g62m6f6zdf6dccq--

