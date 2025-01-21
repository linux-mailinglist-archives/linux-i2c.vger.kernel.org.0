Return-Path: <linux-i2c+bounces-9145-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 303DDA18337
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jan 2025 18:50:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 207E43A1DD9
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jan 2025 17:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA46C1F5439;
	Tue, 21 Jan 2025 17:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="kaKb2PG+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7811E9B38
	for <linux-i2c@vger.kernel.org>; Tue, 21 Jan 2025 17:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737481824; cv=none; b=qDJ6ycbu73khGMvmjyU5qdqw3lk5ig7KDazp/dxuBA0oc3nJia7IpajOdQ7MVVYB0vEaMbrdLFFvJQPc3TdYpquSGLlHYqpfr331Vj8ku6IGIYFQQRfaS/XDngDg05BR5kYWzaybJ6Xu1iOMaBp8cp5EuwpXHnT0I4vnshEfm6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737481824; c=relaxed/simple;
	bh=RoMhuipM8TGxsbQLw/Bc12tlRQBMBDonsLZOaD7QmI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nanVcy867c5XWdIJfnnxgakLHayEdxDqvSatRKpcTX/qH6KxIo/9yrZjxSyuFDZW91tBipR3irFFwS1+Ov/JOGAvCa+nB9rqiOkvDmP8c/kzQg1S7238yGtgip5OMiREPUoILcZN1W4ld2DRmMgWtR6UFEfmJ0sNAYcgHpi9It4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=kaKb2PG+; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-438a3216fc2so31944595e9.1
        for <linux-i2c@vger.kernel.org>; Tue, 21 Jan 2025 09:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737481821; x=1738086621; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RoMhuipM8TGxsbQLw/Bc12tlRQBMBDonsLZOaD7QmI8=;
        b=kaKb2PG+pRm6+p/Eob8rTWL4EbvQ6MCZYsEH+163TFmFpMxRbOeOtKFQIE7U9I/MbM
         WIt822usvvSjnKfW8zzjR2Vh7xOBR/xChpQln3DIu+zdNkoAwp+44MsR//f5yhTrNz/X
         1MQa6b5JoB30pjRAVMlWdEtODwvFYGf8klyxbNpwaFFHw4x6p56L36G5Hl+jqWMutVk9
         JBD/mZqNkUo8OMgldKNVKARrB95Jx5aMvN6SpqlT3cYRLzRsxgJ33/w1JABVUIWeQuXQ
         pKu0589MKNAU7PQOMUyUgdjBrWI/q/S62rtiX8Cwcf42jAW3y1XatEfEW7UY5xIms4Qw
         uwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737481821; x=1738086621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RoMhuipM8TGxsbQLw/Bc12tlRQBMBDonsLZOaD7QmI8=;
        b=lm9trklAC8TMaRwUsp0v5Xw0i+jy+yKNUNRPy3+uWH9dApsBZPUKpSUZWcrlDLOnfe
         AoV4iyw15DgaYJJxdFBF3Y5Vt+lwhMDu0j4xTUd4CptSSVGuWxRs1m/OKEP6w/FFJuit
         36RVJfBuaKGowRsAHbdDXVgjLTQOwp5QBPMdJ92BJSvCYRdW52KQeqk4jkkSmyXMrLCj
         8/F2GK6QZnSZGbccjrTjNfxvCBXx+I831Kbmw9vPbO/vEivP5do9FNPJLLR2SGe/M93B
         R9NgLMswxoXeFGggUkIXoDqbJZ8sTalk7tReE0bpBOjnS6FPIGDxDEsLRl0WU0p372ww
         Mf1w==
X-Forwarded-Encrypted: i=1; AJvYcCUrStFghWNs0eynBXtl5jonVYmBtorA+2bpxvkxXZKYCbaUYQDqEAtrr1xgvkaVCHN9vb7hpnugHXA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJecOB+sUVfs7J3ikQ61KJLCa4w2dy7p0kiOmFemrN6EDfrAWz
	Zc5IbuCjDWKsU+gXOvJz4nssjJJnspB713ozwqgs+zIGy980n0V0duK7upN29nI=
X-Gm-Gg: ASbGncuxLhE4ecjIaqnLz5l4O+jo+lLzrrmoFs6g2a49xa5zJ8kQfDimy16iUY7W17d
	qNPlPh96+oPUkRcE+h9B1X7Dy5Qxog2y+kn0qthTz8EZFOMH34kdWWRzJPpx0YxZNAEyHEpzTH8
	Sls6ajMW7hJ1uGmhxIjnpvMDErmfleXm3P1o4sQ4jDJcRlQNBsvj2F8DydYrb+Nuhhm7sYEcMWr
	8FIvSvKYJlg/+7f8rgzSSsHRPGYNYpkhBxcGw02yLhoGNafIgmYam7CqGRO4V5oOHywGDfSt14b
	+XK9QbbqqoNbEuHCWs8RPctlYIzxe45CrLAt
X-Google-Smtp-Source: AGHT+IGPbhDxMbt3iYzgXLX3wIo1AlxBNC0CatVnDX2Ryc3K1ya/vSA+XrTgwj8dmgoeD68B8Htdsg==
X-Received: by 2002:a05:600c:9a3:b0:434:fa73:a907 with SMTP id 5b1f17b1804b1-4389191b819mr167514035e9.13.1737481820805;
        Tue, 21 Jan 2025 09:50:20 -0800 (PST)
Received: from localhost (p200300f65f0afb0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f0a:fb04::1b9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c7499884sm252100635e9.5.2025.01.21.09.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 09:50:20 -0800 (PST)
Date: Tue, 21 Jan 2025 18:50:19 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: andi.shyti@kernel.org, rjui@broadcom.com, sbranden@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: iproc: Refactor prototype and remove redundant
 error checks
Message-ID: <rv3ej2tdmfff2qilnpgvef64ujrozuplu7ix54rpd25kbrbhwd@zm5sjyn2vjra>
References: <20250121084818.2719-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ug4dj3w4uiulvkrk"
Content-Disposition: inline
In-Reply-To: <20250121084818.2719-1-vulab@iscas.ac.cn>


--ug4dj3w4uiulvkrk
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] i2c: iproc: Refactor prototype and remove redundant
 error checks
MIME-Version: 1.0

Hello,

On Tue, Jan 21, 2025 at 04:48:18PM +0800, Wentao Liang wrote:
> The bcm_iproc_i2c_init() always returns 0. As a result, there
> is no need to check its return value or handle errors.
>=20
> This patch changes the prototype of bcm_iproc_i2c_init() to
> return void and removes the redundant error handling code after
> calls to bcm_iproc_i2c_init() in both the bcm_iproc_i2c_probe()
> and bcm_iproc_i2c_resume().
>=20
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

LGTM:

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Best regards
Uwe

--ug4dj3w4uiulvkrk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmeP3k8ACgkQj4D7WH0S
/k7QlggAkOfHqgXrjFpc18b6r08Yz1N73AYGtxalMar9UBjbJ4mnvejHMlCZw1S9
iMf6fMrZCQAdZQYoPQ4xc9Ri/EMTuYoNUN6SWnS0P53f7HIzpzSEZoYwflxDDxov
rbPlhcXoCZPQ0eywbXbev1frxH06OPwj3Rb7WoECfJY18Tb1czKjgGa9vwS+otLu
N4ZYlUQnbS7u0PO/omVtMB1voNBJzRVqc81tjVrwIHJjzLPf5xFHfjy45vbiCH5O
ZabwO/ZQZWtHA+zwUjJ/UCM+8Wc948R+hhzDHRhipHO19/Y6nTqACwZ3hQj/ncay
hhKz/yQOBncrz8yjTaAC+9AJGRqRTg==
=q30A
-----END PGP SIGNATURE-----

--ug4dj3w4uiulvkrk--

