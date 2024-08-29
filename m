Return-Path: <linux-i2c+bounces-5901-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BADD2963EEB
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 10:44:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF1FB1C2432E
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 08:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4FA718C35B;
	Thu, 29 Aug 2024 08:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TqEahd06"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1453515C13B;
	Thu, 29 Aug 2024 08:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724921071; cv=none; b=ubEJstXktQfWXMDg7DkqHuINdIKzFbVfpL89QUN3yxnE9yRMh7WSgtJYyNnJ+9t68w4RQrQU1fO937HHIZJ8/l5b4WaCBcS1E9FBbxhUMZL3sYwemjB1uuCTGCP2ykrY6C6HzZZEML5ZR3YiePOWwE4Z0dJTRaE+ezrNVMUDqv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724921071; c=relaxed/simple;
	bh=rS7qG8284LsPMVDZT3Wk6pL1xkn6e7lfFskZ9IfThig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NRj8UyvQTdR/tZ6CdVspcX25wjhWKzfFTBiJCWgJp77T1LGO8Z7JgsJK1RPLVUqPKBu3mNRIjZnRIucgRZWPadr8QVoRgJYHD8pKWI6XMOpzy+Cm6h3ebBUpXlSQSvDiiOKqbDaCWucdZOFHzEzhY5sWSj5TRanlC8eZFhQ+otg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TqEahd06; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-371aa511609so248692f8f.1;
        Thu, 29 Aug 2024 01:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724921068; x=1725525868; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qkYEbPeyDZMPuncnqwYBTt8dp21NOhBXd/4fbCM70QY=;
        b=TqEahd06PUZsD0+MsTe19Sh65SWlINq6cgOJE7DCRng4oWChKojK0Pwy0SVtGAKFTW
         cA6yAbH5Z8gKQicMZSYfBEwiydQGC6PnxikfVcB/NqFkoQBhRecqJ4e9wE64CuiuJoC1
         J9Gu8ZFI3HNEsWMv4t6eEaWN696X6QJj0p/0u2Oa0nx8+MJqS1DacKfNFcNCK9lJVeoW
         3MN/owOHNWmj6eO7RZZvMAr0OpHf7esC01ktzwIamnXEv2Zqf+sHEPpkkQAOS6JN7DPt
         2BAtQPJzp/i0MtLdZONRrCZVSHpGih0Medv/RdiKDDKqLlqmXX8He1w6s1GpbZ9a+ijg
         4H1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724921068; x=1725525868;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qkYEbPeyDZMPuncnqwYBTt8dp21NOhBXd/4fbCM70QY=;
        b=KCU3G6NL4Xh4fi4PK7Hb5jB+kuxPv5HHZnR6h592doF9JA1ngB7MzG2frLRTBxVxcr
         2NJWr0jBSQ3ZfIoLlIJBurHKrrfcOcap+Fe4b9eMZKA4gQFtY4oTwE3n0A56M096H22M
         Px6eRMD/1q7oDIWIofut7nSe0L3XIHMzl3ph5UxSdfcJROpAWMJmFwdTFd8k3TpLJL7f
         kAhp2VcFSyThFCPcbeYR9Joi7baAQLWxkxcx6rYHY7ki7pkQ+0NQCgXLOLMLJvjtXjFG
         44tQqgi7expoGlnQp1zK0/9Yo77cFlSeaQejbXdZcD7Dv1mdEC8hdEx+2b4YGbkwbHhy
         /Rrg==
X-Forwarded-Encrypted: i=1; AJvYcCVssR18l3SmQGGNklrGwZMCJFRekJgckZUvYJbSPp13vrElrAc88S84PzOuKUU4bjg9OLF53+zuaGhQ8Rs=@vger.kernel.org, AJvYcCVusMsq3GeY401s42giufhsviRL42lSyFILXivWVi4X8SF1aLN0jV2sv/DNlJtdtK5RS0Ty015i+szD@vger.kernel.org, AJvYcCWCqAl32kDK7zKPkTrIg+Y9gZrYT3UbYJbaG/SfuDUyvPJFulPu+K5MtiXwSlwKkdt9YecfhUN3e1UHaKlT@vger.kernel.org, AJvYcCXtU+/62miLw44pBPC3EBfi/EzCozx3eh7DEkrl7nt2h1+aArXMMCPfMcBZOWCGSXClR7hKtqfNuu7y@vger.kernel.org
X-Gm-Message-State: AOJu0YwvskqLh5EEkexP6icQZfK6RJjnV2u93YS3xkX8IW9CretfkqWw
	JFydt8xlBOEChiskZMp911gCiAr/5gCwWDu7DsLEHQU+hIyGYyz+2mWhKPBT
X-Google-Smtp-Source: AGHT+IEMouz3ROOjSErGJywXdM5Mfn+/P48p3QNwwTCNoCWFYKxG5dcA1+1v8UKm8OgVo7achmy9aQ==
X-Received: by 2002:adf:c04a:0:b0:366:eb61:b47 with SMTP id ffacd0b85a97d-3749b52fa73mr1316866f8f.8.1724921067626;
        Thu, 29 Aug 2024 01:44:27 -0700 (PDT)
Received: from orome (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ee71650sm836764f8f.40.2024.08.29.01.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 01:44:27 -0700 (PDT)
Date: Thu, 29 Aug 2024 10:44:25 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] dt-bindings: i2c: nvidia,tegra20-i2c: minor cleanups
Message-ID: <kjoc55okpq2h3t3olnsfegp2jalgo3mr636eqg5tndmjc2t5de@7dy7du53p53y>
References: <20240820-dt-bindings-i2c-nvidia-v1-0-2763e9a9a1b0@linaro.org>
 <rzf7wiv7hvalx4svnnxxsu7z2ciprujxfdwbr7te7cqtmi6xkc@757xhotlbren>
 <36769d45-d827-41bf-befc-e7b0e95f199e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jastyiiobfjmpo6r"
Content-Disposition: inline
In-Reply-To: <36769d45-d827-41bf-befc-e7b0e95f199e@linaro.org>


--jastyiiobfjmpo6r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2024 at 04:21:01PM GMT, Krzysztof Kozlowski wrote:
> On 27/08/2024 16:03, Thierry Reding wrote:
> > On Tue, Aug 20, 2024 at 10:44:23AM GMT, Krzysztof Kozlowski wrote:
> >> Simple cleanups for nvidia I2C.
> >>
> >> Best regards,
> >> Krzysztof
> >>
> >> ---
> >> Krzysztof Kozlowski (3):
> >>       dt-bindings: i2c: nvidia,tegra20-i2c: combine same if:then: clau=
ses
> >>       dt-bindings: i2c: nvidia,tegra20-i2c: restrict also clocks in if=
:then:
> >>       dt-bindings: i2c: nvidia,tegra20-i2c: define power-domains top-l=
evel
> >>
> >>  .../bindings/i2c/nvidia,tegra20-i2c.yaml           | 27 ++++++++++++-=
---------
> >>  1 file changed, 15 insertions(+), 12 deletions(-)
> >=20
> > It wasn't clear who you wanted to pick these up, so I've applied them to
> > the Tegra tree. Shout if anybody wants to take them through a different
> > tree.
>=20
> They target I2C and I think they were merged by Andi:
> https://lore.kernel.org/all/dkcfnidl3xgvspiusp3zftgdftyvlbxahlbumjdfl7dvx=
gmdmr@nomisqfu2mwb/

Indeed, I hadn't seen Andi's reply in the patch tracker, so had assumed
people were waiting for me to pick them into the Tegra tree.

I'll drop them.

Thanks,
Thierry

--jastyiiobfjmpo6r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmbQNOkACgkQ3SOs138+
s6FlIw//WEBpF+XgLGpAPoRUyXeGZ+6XkpqogCwhLKJFsPluWlH67WvmK61MvjtY
9Ig+xBiy2ANhZJV9vaudWnIDHte6/amh37rz7fRazi8+UVbDEiUZu5fo0JgEJsnK
YLTRkcGmJr4IBuVm3sVI2+HjdtAnt9Ba9YPoXOansKbN/+hr74mnJwDZgJwOdTOD
so9yGsXZ6dB8fn1iqM+SMxHSDs1k3FcyZ3bYtpRmHEZEBtYOE7H/RLWnCwQF5GKV
GxjXAeNe1nqxO0yf+Y/XgDn1xiGN/42MF8VBglU1d+IaFNHb644BT0iO2GGjXsis
yUJjqTMfgrYqsQu0zFGWgNLgbPlvILi5CbEKlH8pT/9wi9Jc7sj1mVe7fVFOhXPJ
7l5G2zKgKvkokxlmaE4EqYHMWQQRzG9Hz+d3+JpEoEO1sf0TWOhLwUp4/N6ZAv0/
lN3azsZKuip9S6T+W4O9UKiP0yRip2dF0IZI/gdDswkNJv8TU2n5JQaR5jEJWdtw
9ReDs2E7NlKm/m6cK9OtbKCWQRc2DcuKntw8MB40XlqL5gtFolHTxk2XzSfjpj9y
VmSklk8guoGOQB7+X3yVisA1jB0NNc1F7XVV9N8dSp0INDxx6a2qQLXXvoasYz+l
QSB7TEk6xgsOJyuiBy2GaELJOXi9KnrUOZZiDCx5fC4K0YfatCw=
=O9ev
-----END PGP SIGNATURE-----

--jastyiiobfjmpo6r--

