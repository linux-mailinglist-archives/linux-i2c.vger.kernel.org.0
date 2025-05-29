Return-Path: <linux-i2c+bounces-11156-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 180AAAC80B5
	for <lists+linux-i2c@lfdr.de>; Thu, 29 May 2025 18:10:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB02F4A4D34
	for <lists+linux-i2c@lfdr.de>; Thu, 29 May 2025 16:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9453221262;
	Thu, 29 May 2025 16:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="g5vi9JbX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B6620C47C
	for <linux-i2c@vger.kernel.org>; Thu, 29 May 2025 16:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748535051; cv=none; b=MFkbuLBRhTyQukWjB2vD1qVkX2v6G5xYbGZMwASyuKpeGRyZr/rbNosVEEV9G3QpPhnagRn7WD7OkVUQr8Df0u0sb34aPlOow1pO2lg5tbwkjWRjWz4SS8Frr/7culnKEYUiZ9KvwjFgipXpGugySayTAfOwQMXUODGmdEZa97s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748535051; c=relaxed/simple;
	bh=KRcfY24mi9yw8cxXhxI8b8kkJsITeRS/FdD1aX20zUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TKYQ3JeNuOloOraRoNg4amQV9c5aBecH9RrLJCmhzfd/8FhZj1mbDljlam2MweoEcebT4kkX2uTor1KLXnE5/MkR8Ako2S5XE94PP3p/YuY596UMyRo97IFJrGsmMBX1l15SOgqL3UbFAH727krLBVIn+Rt7g9ff65T/LTzbk/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=g5vi9JbX; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ad93ff9f714so186034966b.2
        for <linux-i2c@vger.kernel.org>; Thu, 29 May 2025 09:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748535047; x=1749139847; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KRcfY24mi9yw8cxXhxI8b8kkJsITeRS/FdD1aX20zUs=;
        b=g5vi9JbXX20J+aDfMTfAQEop04YboDkC7zx+jyMukaT4dPDi1S6x1DjawuiOn8g0Qu
         kBpvfJIYjVGdxiaKUFOpQaf/Q27tgKGXjM0cmhsds6PpeS+2nVkbTb48A/YsnzIbB7Ak
         hEJnPcpR34GlijzNd+L5gocJlb14FV/5jQzoH1z34whR5ZZ1LXxwvIXigy0wiTedlx/4
         M2lEDRlbc46AVc7vtkqT+q7EvRUKO7bNZX2PFEl83ikx8V/21RYJxtV6X2UBgP5cVdAl
         sHXOxqj2IkNmtBzMmilA75qeG+XVu6s+Lt8onAh9Vq+ZuqXC66yl+vNJ287Vpb8Tt81l
         l/Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748535047; x=1749139847;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KRcfY24mi9yw8cxXhxI8b8kkJsITeRS/FdD1aX20zUs=;
        b=sOlrbDE6ao7ybAdG30kwTiw07JV7Xb2k75cWL5wxlPWSVdaUp26wBRualpIpyxhLbc
         HydgLhpiC4zuiBzLA+p0Gk/bYYHvAF997NV15vfG9xWeX1aodQT0i73hvwb3VBpbjpIw
         pnlZ3Q77R4faROYzZxKOk6RtdHmdvzDi6mMezoaVKlQiUbum2kjEu7Y3dADtb65zPsO6
         GPynOIGTlc8SnDnMkoIHuonIZvhk2GdYnECs3/paizCoYZKbPOWz4GgPDlNnUOZ+J8DU
         3/zMDcgaHaewco8jfeGNdeKc8u6Gavq83n53ENAv6Tlt+GmCvPAFnw/tqmRPjJsX2qMP
         zjuw==
X-Forwarded-Encrypted: i=1; AJvYcCWQNhY6YDV4eGBbBlTRC+YK+JqAMzIZPMcLoT59vMF1gZtGQkdozbeDRAqXySW5eNSYIHQxg/vqzMk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNj4y1UX1Zg3SSVHMWjIIecY2rxFOS+XEPQkQ2ZbqZrt2OJGpd
	eXxRmDJp6qiee9QoOvp4vKryThrA2S1rZv6cg0SP4sVyQN0Y2JBk0jnvSYavYpIsoZw=
X-Gm-Gg: ASbGncsWL5ihk9bq4u4GD1T2GN5yrHSOWmr3AdCI1m1WRt+1IMl6Xui7eNdeF+m/cyq
	62JJXJEsUC1D3xpjuFehNnadvf05/8RrdRInlk4MLe0HKJU1pBk5C4FGEt5Mi5DudgvrXNQ4srw
	qVzJ1wfDl+wl+kutJApI+MJ0UzLSfSgph6ZZpTXGse+Z8Pcu0W0mteTY/++epGDQSt1pUwT9pko
	xFJmxwVb8ioR5jiJYKznpoOVKp/fgIA5lbEFJV4re1Gb1wbxzgRqsVymi1HwYZWegU80LKlPpgM
	g/tej1JTgjO/A+l/V+9T1MBb56M5nCLO7gBmPoTovmNBmZaMj74XOALZ
X-Google-Smtp-Source: AGHT+IEfa2jPYgUuU/as8VKHFvQvfG2ji+E4kfrCVt+QzCyjv3qAywky5rhy+Da4tT20JY9vJ8LTUg==
X-Received: by 2002:a17:907:3f0e:b0:acf:15d:2385 with SMTP id a640c23a62f3a-adb322d8dcfmr7168766b.16.1748535047336;
        Thu, 29 May 2025 09:10:47 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ada5d84bdf5sm165195466b.75.2025.05.29.09.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 09:10:46 -0700 (PDT)
Date: Thu, 29 May 2025 18:10:44 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: sergio <sazamoracl@gmail.com>, 1106498@bugs.debian.org
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>, 
	linux-i2c@vger.kernel.org
Subject: Re: Bug#1106498: Acknowledgement (linux-image-6.1.0-37-amd64: Ouput
 sound disappeared after last update on Lenovo Yoga Laptop)
Message-ID: <d7e5wempkmwckq3xegeucuj7ckfqino647no6czey4n4s7efig@5um3az3z3ysu>
References: <174814452778.7037.3139530479075309721.reportbug@debian>
 <handler.1106498.B.1748144532663278.ack@bugs.debian.org>
 <174814452778.7037.3139530479075309721.reportbug@debian>
 <QVAUWS.D0WMICKBJT0C2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="27yi7j25fi7nqrwb"
Content-Disposition: inline
In-Reply-To: <QVAUWS.D0WMICKBJT0C2@gmail.com>


--27yi7j25fi7nqrwb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: Bug#1106498: Acknowledgement (linux-image-6.1.0-37-amd64: Ouput
 sound disappeared after last update on Lenovo Yoga Laptop)
MIME-Version: 1.0

Hello,

I added the i2c upstream maintainers for the i801 driver to Cc, maybe
they have a good idea. To get an idea, find more context at
https://bugs.debian.org/1106498.

On Sun, May 25, 2025 at 07:07:02PM -0400, sergio wrote:
> $ dmesg -T
> [dom may 25 18:35:13 2025] i801_smbus 0000:00:1f.4: Transaction timeout
> [dom may 25 18:35:13 2025] i801_smbus 0000:00:1f.4: Failed terminating the
> transaction
> [dom may 25 18:35:13 2025] i801_smbus 0000:00:1f.4: SMBus is busy, can't use
> it!

That sounds as if there was a problem with the smbus driver or one of
its devices. Maybe bus recovery would help, but the driver doesn't
support that. I don't know if that is implementable?

What devices do you have on the bus? (You can find that out in a first
approximation using `ls -l /sys/bus/i2c/devices/*`.)

Maybe this is a firmware issue. Are you running the newest BIOS on that
machine?

Best regards
Uwe

--27yi7j25fi7nqrwb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmg4hwAACgkQj4D7WH0S
/k6FOgf/WKiiS1JI11Kmn0HmsfwGb41oi+xvy8PQgj8bPtmZ4n++fI8y/+Tr64jK
G4XH6na3RG18SoCOPMhenwqSxRNhIKCkkHehgZzomK6dH+QdZ5UhZODiz+G8iOl1
OMwpxwIjFBLM37GUNwaEGivltGF4MuE50ZrIcvpqwvgZcdILCMCn7YypaPcn4MoH
Ve9RGCFGpwrwKHu3nIfFlXK1Jm+ucLT1OnEIhQCtGWAHDioJ0BoE0Px5MXxt4a+B
cFlPBdJAnINuuW10ZlQQ/q8MFhbt0CHg6f/7WxK4n7xP2h0v6ealNiVD5ilK8v21
uv4vYA2NMxnTQpC1kpFU/d/mGzkOag==
=vIRT
-----END PGP SIGNATURE-----

--27yi7j25fi7nqrwb--

