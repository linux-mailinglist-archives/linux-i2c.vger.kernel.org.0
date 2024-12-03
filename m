Return-Path: <linux-i2c+bounces-8316-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4DA9E2F34
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Dec 2024 23:46:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24870161D19
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Dec 2024 22:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E4DC205AD6;
	Tue,  3 Dec 2024 22:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="WDJB5QXx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97D21362
	for <linux-i2c@vger.kernel.org>; Tue,  3 Dec 2024 22:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733265975; cv=none; b=a9JNJkiZhulFsM6Cs0Svu4dDfo83sdExzoZgm7Mxp+0oa/5eWq7L9NNR9oHzWDYFPXBdap+nOlWtDAzVc0RGDj4EovqU8NNAqb2sDRDp+kHMr5foYPcYS8K0Mydqj7HaNM4t/72+Kq7ywgGRJ9yjFS2Vu+NR4OB/4SWL7JBC4qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733265975; c=relaxed/simple;
	bh=tRR8QqFF+CAyRsdkrRGkGGX3JD3SSD6sKwxiTCWlcQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kZZFP8blA7ROVrsD6uoYPhv/uh072oL1MbpgDV7BCyeEr6JUoV4KPQYFDs8zEZl9Uvzv9kHh9QMwL6scBVE2hE+jL7WwrgS6oo9e4o0IQbQbLYBuGV1qTWUUS/KJEKKdswAp4e5Ry1OWBwQaYCGRynecft5Rb59N2jS7dE4dt68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=WDJB5QXx; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-434a742481aso50101185e9.3
        for <linux-i2c@vger.kernel.org>; Tue, 03 Dec 2024 14:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733265970; x=1733870770; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WeNtaj0ZwnGvInQdd/kfTueTpqdkwF9B6wPSpC5jgRA=;
        b=WDJB5QXx8GVzoIy0G0ZNDUlQp6PLXxtg8FrAw/yrAhNzN9Yi4k+MOqoJ4hn1WHZGCd
         0uPQlps+o6473/fjakijO0NLhw35Talbc4SPst7jzIvmw2VPsN5pp8MLx6S7ze+AtPxs
         DgwsZgIKThMun3yq2I8IlbFYmrWoig1EgXvDgMOiwc1IX+GEhlTV66lZjxP8jdoa/xL/
         4HTyvjDsjyfnsvJCc7YiQ0fLGlZrRy48P3Tvra7h9YbnPsQokO3sB89M+ALyQQ/o9IXq
         XEPCg8vgL9YmUScaypsOTRZ3hV4f/kzxHR2f5gghmpO9Bl90GeqrcMNipRLqTKB3qg91
         YFQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733265970; x=1733870770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WeNtaj0ZwnGvInQdd/kfTueTpqdkwF9B6wPSpC5jgRA=;
        b=ppWFG9mrsIoVvLTXv5G+jXlRDbihjcexbv54S+5p6AT54bzS1jJUm0/DmGcfazCMmi
         7s1DVYc/cYq/O50miyoxYxAppde7vjjH0j6WT/vdV5HJvPyy9GPMdhAX/tqCY/YXPLse
         kBdA3wX/eTuv64FXOOd/0V7KJ452c3IU9M1TH6cujC+paxZ8RKcJudrtB/V52Dyz9RTu
         kAHnWyXywxe383X92VOSVmZ6QErBpBvbHalh3H+w56X8J1k0R3QxLnZ+e74y4Ep/1CK3
         ZvUEEf3xARK/KuyCl0GA0ICYlfEm2FcZ1LbF0mzTibz3I7VFNc/u4nju571j34N3cvKP
         kHAA==
X-Forwarded-Encrypted: i=1; AJvYcCVLmlFzphOq5cet/pXKpzndji3cCRvQmMfrR9ciBgFP4nO8lOJjC2HysGXY03FkRL+6iOMqRWTuDns=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx23YBDQ3VX4pzClQbJljK5WeYJdydBuEl6b2HPPdWGoeOoXYlA
	/J901H3UtGCwfp/rnkKAVnibXl4zDA8ymTtyVSizPAzOhdiwpfCWmzr8nw68VoUV4TKiZ6ZHxgG
	Vwu5Mvg==
X-Gm-Gg: ASbGnctKmUspxfuzEACjd5rJyLIW2paMPDyo0BCEaM1WZU/Z68YoljwpCviNrak43ic
	ERIJI+7NRR8sOdFzczFkiysRkaEzlw6mP5RabtTUuPt6GDtzBQY9tWoBs2pqsPIM74DENzYpmWN
	dUbUFokiqqFzEuKmQ3rrKUslpIvwSrqYSVOSawdq+1xiIbEElUqi4CTOQv+zcdUdR3QJ1J0423W
	6QtzfaJ5TXaaFyPOYjVJ4rhJWEEWF8zspgIY2MHsx4+9PuWcBq/+tE=
X-Google-Smtp-Source: AGHT+IEN/JIUER/TdMXUiRcBGvfKm/agaqlDbJm2g6deRoxkyVGj+N7IFI2/pbovWBYd6hjfu80O1w==
X-Received: by 2002:a05:600c:a07:b0:42f:7e87:3438 with SMTP id 5b1f17b1804b1-434d08ee8c1mr41289825e9.0.1733265969828;
        Tue, 03 Dec 2024 14:46:09 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:8675:2091:2e1c:14db])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385df74157asm14076007f8f.0.2024.12.03.14.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 14:46:09 -0800 (PST)
Date: Tue, 3 Dec 2024 23:46:07 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: designware: Actually make use of the I2C_DW_COMMON
 and I2C_DW symbol namespaces
Message-ID: <aenflylxg46hie6yj2hzlelnzbq42mox24fzzz7o44dvb3j575@r2hgad4ghgym>
References: <20241203173640.1648939-2-u.kleine-koenig@baylibre.com>
 <Z09bp9uMzwXRLXuF@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3nypz6isvsi3zhhx"
Content-Disposition: inline
In-Reply-To: <Z09bp9uMzwXRLXuF@smile.fi.intel.com>


--3nypz6isvsi3zhhx
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] i2c: designware: Actually make use of the I2C_DW_COMMON
 and I2C_DW symbol namespaces
MIME-Version: 1.0

Hello Andy,

On Tue, Dec 03, 2024 at 09:27:35PM +0200, Andy Shevchenko wrote:
> On Tue, Dec 03, 2024 at 06:36:40PM +0100, Uwe Kleine-K=F6nig wrote:
> > DEFAULT_SYMBOL_NAMESPACE must already be defined when <linux/export.h>
> > is included. So move the define above the include block.
>=20
> As in the other email I pointed out the doc says that we need to undef the
> symbol. No need to move it around.
>
> The only requirement is to place that before any EXPORT_SYMBOL*() we want=
 to
> add it to.

Did you test your statement? I did on top of v6.13-rc1:

 - Remove the MODULE_IMPORT_NS(I2C_DW_COMMON) statements from
   drivers/i2c/busses/i2c-designware-master.c,
   drivers/i2c/busses/i2c-designware-pcidrv.c,
   drivers/i2c/busses/i2c-designware-platdrv.c and
   drivers/i2c/busses/i2c-designware-slave.c
   =3D> Built fine, ergo the symbols are not in the I2C_DW_COMMON
   namespace.

 - On top of the previous: Add an #undef for DEFAULT_SYMBOL_NAMESPACE
   directly before the #define
   =3D> Built fine, ergo the #undef doesn't make the namespace define
   work.

 - On top of the previous: Move #undef + #define above the #includes
   =3D> Several warnings like:

	WARNING: modpost: module i2c-designware-platform uses symbol i2c_dw_prepar=
e_clk from namespace I2C_DW_COMMON, but does not import it.

   Ergo the position of the definition is relevant.

 - On top of the previous: Drop the #undef
   =3D> same as before, ergo the #undef is not needed.

Independent of what is in the docs that matches my understandment of C.

I don't expect that DEFAULT_SYMBOL_NAMESPACE to be already defined. If
there was a definition already, a #define without #undef results (under
some likely conditions) in a compiler warning. With the #undef this
warning would be suppressed. So the #undef is something like a --force
switch that I prefer not to use without reason, because I want to get
the warning if my expectations are not met.

So I still think the patch is fine as is.

Best regards
Uwe

--3nypz6isvsi3zhhx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdPiiwACgkQj4D7WH0S
/k774Af+OcEklZJAlmmjzgrpONG7dL4o53bInXY31iazKrPZL4VECZ6P7gvQzPcT
cYh2HCQjSzWjcIn8HlpqiOaQyUBEJM8NVxLLKvg8cFUl9sL4Wqt82IVBsY9b1hdI
5jQWw7FNwD8L+za5P1r+8lHKHCB0o8KShWRX5n4xVtz7iKiok+IWZ4UT408iooK3
PDIzam0ny8HYR24JpZoLq+sy34NCY4FWqDSekvQMYvBrGc2O8nTtY/GktiSGu3Sk
K1ysDa6FMRldU0hCdfpG21H4nqnxtdebmfS/UdJ+kDO2p6cQBuqy5Bbb9O08hxHd
9FEUIu611JYZWqhxk9qPJlAHrohEwg==
=KvZL
-----END PGP SIGNATURE-----

--3nypz6isvsi3zhhx--

