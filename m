Return-Path: <linux-i2c+bounces-8999-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 174B1A0736D
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 11:37:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 139653A521F
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 10:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 266BD204C0D;
	Thu,  9 Jan 2025 10:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XKAt68km"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E9F21576D;
	Thu,  9 Jan 2025 10:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736419056; cv=none; b=c+Bkc40HTRtHpsqy/9PYA4iYNX387vFrx7pyJWVW/ejBIN1BTPafHbgzEMcahdeSIJXncKPBdqWQ6T4LuSGuLqFvOE7fIBh1n4H7KqMS88ntUqv9SOoARtTOhjRZ1ktsy62Y77I0eNqckbB8Myr71Kb8Bn5hUJ5Ak3kg3EEBvxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736419056; c=relaxed/simple;
	bh=mXGI7eCABvaWcg47dxoQxUN2x8i3guMzfrgsTpJp5jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YdkO3dsYvgs4KUNIkEZ+IwinlJJxvytRPsPDRtkh89YHWMDeWOO/sLtfqcg1iPNL2ujMgZL/CkEO2IOs1xFlakwp5XPCGnglrJn3jvIXNF1Df/goYa/lP0wf1y63SBDqq34NGAEmOXfWvxoYWKM7V91i1U8gYw9h2d8G4jCNZyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XKAt68km; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4361f796586so8023245e9.3;
        Thu, 09 Jan 2025 02:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736419053; x=1737023853; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=61IvdtmT2mQUDJhTOWteJAEPNyC6vRcEpkkgoyFVRyM=;
        b=XKAt68kmNSMEZSBLKlEVG1XC3cPsKkEfJxA+bBtUCgAGkDlQff4DAQO0VKGrU4u6lv
         8+3jMysJlL2XvE10DHMTjlJ7GUWFYrrkLjCqMW07XGbPGync76WDvXEMc5Kk5g805FE1
         TNerjf0yDS7Z2gVCqzG8hzSDY+em7qAXpaAuCRAEnSrjGY0ZY1GCKF52QulZZwo2OaO2
         NgfLp1JxyEh0L4n33NO5vvwatVXXZgPbFPyPEbqquzzWxe1NCtRZAwFEHN+I5keXdSyc
         7dIFmft6nmDkxXyUKXt5ngcHzIAdSDC9yimp2qpPnawV/FSYO9e35AXk23U+pfB+jlKD
         1miw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736419053; x=1737023853;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=61IvdtmT2mQUDJhTOWteJAEPNyC6vRcEpkkgoyFVRyM=;
        b=sUEk6eXOGQvKq87/yBtKpAktbHpzPIvOLCjd+iwUmKH7KWmSduXl0kGtfjq8VF16dF
         M1x7vVSmaJ+XOGtlu0ilU1Na4qCpDeIOmLm53o+lYTL1biBE5t3Sz9EMp765nAA8KCE5
         6TB0x2J+82mh1ZIUoFkH1QFevSDqBj68lhMGnJ5jtKVIblwU0JwmNgQS08H2j5/hexo0
         f+YMo8r2wGflbiP18WdrsvUK3bzDPWoxjiuw06fYDN3L1pCcULKC4jNjmuVWg/DM+cbr
         Miwx61w/20e0o1EWO5yfd2SyRJe7Z8IwrNkUuiPsapQLOiPcdzXXWWtiwNNMMHP9WoLr
         tlZw==
X-Forwarded-Encrypted: i=1; AJvYcCULUmmiJdeoHFAaiprfcghUnHUSZ/2jnmMrLJp34WPHX6zbOjc+CkPuzX3rMAksToTeGDtkIseAyjh146E=@vger.kernel.org, AJvYcCVVHimGUp4Q7f2iYbs3yZ7XRr7cU7p80OIYKqN9NzWbt6R3P9sx6MHEMcgxE60enMkV7/4C9YGq1i2h@vger.kernel.org, AJvYcCWIAmecG9tB8Yfmd0LC0QN+7A4YhuXxCW+9qumYdHFUmJ4E/Rdc4hFqi+tdC4Mw1U4uKYJasO79rW6PirN+@vger.kernel.org, AJvYcCX9k00hp/TGfD7QthERs1L8YjujZpxA09zycSXm4JlDdwiVnHHiA+sPcIEkIezLaXo6YGRfxMhhikVt@vger.kernel.org
X-Gm-Message-State: AOJu0YxORlWU5TzNvDmsomcsQfj4YXgh/zx4Y15C38ZBoNgExx43HP9D
	2kblcbz5TTAQJf7RIojtrmaJlfmdb+ODgJMJrcAnwr0xc+6eIVYh
X-Gm-Gg: ASbGncvvhTqK+hc2CemmR2p5PKXDJRmXtuoQHBcgqnC1f84TM5Wt2ERJwf48sHiWxQM
	nPZFl1HNeyp8pTE79eB5ZLMi6ReUNXBRotedEfw+un7TPjo6ewU0tv4EeAssja04HqM8ygxBT1f
	tn4vLFYd4GVHzhG0kwTEWhJJgiBfebLNyLkUoBQzc9RbE1hyT0ItEdWJADpiJDkpb+eUFmm7ucm
	/C/hQQtFE3JczlQpeAPe+rNgA2xVUv0i8uxIr21LoiKl5XdMavQL16hIUQoIF/OknSn1kWw+S9C
	y9doCbRp4NRRmsh8n6TghqEKTfmwUWxldB/vvgrzDJU=
X-Google-Smtp-Source: AGHT+IHA+3nDPFq31WnFthRYk0qa24qBaCM76y6C0117feNDReAEnBZLZt0UZpPX28YCwj4hqXXPKg==
X-Received: by 2002:a05:600c:1da8:b0:436:6460:e67a with SMTP id 5b1f17b1804b1-436e889dff0mr20253275e9.25.1736419052459;
        Thu, 09 Jan 2025 02:37:32 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436ed48f4b2sm2519895e9.24.2025.01.09.02.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 02:37:31 -0800 (PST)
Date: Thu, 9 Jan 2025 11:37:29 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Kartik Rajput <kkartik@nvidia.com>
Cc: akhilrajeev@nvidia.com, andi.shyti@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, jonathanh@nvidia.com, ldewangan@nvidia.com, 
	digetx@gmail.com, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] Add I2C support for Tegra264
Message-ID: <fbulujgwqziyxxzokrtxzhysybuqep6p5pqt7jbqbclirllzp6@jbslthf3zh5f>
References: <20250108110620.86900-1-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kuba22guk62kecbm"
Content-Disposition: inline
In-Reply-To: <20250108110620.86900-1-kkartik@nvidia.com>


--kuba22guk62kecbm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/5] Add I2C support for Tegra264
MIME-Version: 1.0

On Wed, Jan 08, 2025 at 04:36:15PM +0530, Kartik Rajput wrote:
> Following series of patches add support for Tegra264 and High Speed (HS)
> Mode in i2c-tegra.c driver.
>=20
> Akhil R (3):
>   i2c: tegra: Add HS mode support
>   i2c: tegra: Add Tegra264 support
>   i2c: tegra: Add support for SW Mutex register
>=20
> Kartik Rajput (2):
>   dt-bindings: i2c: nvidia,tegra20-i2c: Document Tegra264 I2C
>   i2c: tegra: Do not configure DMA if not supported

It'd probably make sense to restructure this series a little bit. It's
customary to have the DT patch first. It would then make more sense to
add preparatory patches and then follow those up by the Tegra264 support
patches, so something like this:

	dt-bindings: i2c: nvidia,tegra20-i2c: Document Tegra264 I2C
	i2c: tegra: Do not configure DMA if not supported
	i2c: tegra: Add HS mode support
	i2c: tegra: Add support for SW Mutex register
	i2c: tegra: Add Tegra264 support

Thierry

--kuba22guk62kecbm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmd/pukACgkQ3SOs138+
s6HpUw/+LIwzNqC/+AeU00nSfAFTNyCoXIi92PsDN6YMEh5GjJeEfbnXvYUer2g2
7RMWgMmFt4Az4oKmmpRY1ztOas6nFfe3HkmTJ7C5glTxwO76H90Flv5ufC2C5Tsg
gX3nAPT5usAX31cSntDvlV4OWn5eAHYaqhnmxxqTws2xQynhYKaAvc6+WT7xrxeo
+uBvA2K4EesEHJkJ8MgmWvbhA6ESOObCs+3pKnu50srJasmTlCRKvygG/6mD7knH
UexSnECAkHxmUcB6PAZaFJzicDUS8RbiKuQ9fUyQuuoAjAkYUuV24qDRBJO4MaXd
qUh6j89Ffdrv7mJrMFwg9EsPAyEQlkoXhNrn8oIZJUbxuPJCx64x+oqb7P2LmHT3
+SFeuPUGhiuYm8kw4iv5x0swcrR4QTbSazV2GlCfojjvSyLl0R0hKu2uLBej3h++
CKncnamcISlFec6pM5R4aIpPIyY0M1D3tX1XBPhb9IKiX+Z8kZQWh+L2Oszqx4AG
zNZY+2Khx+YOK8jUSDZu5XciyDtPMQd7JK7fEdwAExBjC4r+Jvi/t3AiYiZf7ira
qwiHg1PCab//3z47iE+C7sQNjiaW+Racdr2FYMjSVTVTd3uWc1+/drlAbHvMM1si
xgUJRelongzqqOj1ArXx4R6z6bO0J4FZIG/GBA7PjeftTzE2Zug=
=QBhh
-----END PGP SIGNATURE-----

--kuba22guk62kecbm--

