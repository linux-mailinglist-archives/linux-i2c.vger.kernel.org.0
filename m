Return-Path: <linux-i2c+bounces-11256-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8650DACEF80
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Jun 2025 14:49:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 024F83AD0A2
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Jun 2025 12:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D28702144A3;
	Thu,  5 Jun 2025 12:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="2nn0JsqU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF741E7C1B
	for <linux-i2c@vger.kernel.org>; Thu,  5 Jun 2025 12:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749127749; cv=none; b=KQ0bjl9N+DaKvQ7bKrE7lfe9o+5RjBUhGvZylbzfH3atBGmfrJDX4iSjXRRG+EEVCQEN5VZDaPsUbfOHzV3FLd4LfH6h1ZHv+rsYKOxO20u7Fm6y0XBxsOz4aOBaCjVpsWm8U5gp7Y4nlfJOozCUlIrr3SBRULTFUwgiHroIdII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749127749; c=relaxed/simple;
	bh=yR6efVVpA6EPWN+z/VOHVYIVZkFbz0f4SOZXeX/ZaLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lhl0TZWqgoXPLrnn2WeswojfBdSmcolt7I4sxdaI06NT50CbUPz1SocPgh0A3lCz9JxG1/RaXK4WWdwIznQfxGHsmu6bZH/vB/IjZMPze9JWDs4lS0mO2lKjPZCBHXjYHQLdi9m9unn68/N4/5iledx4PE8HlP1b8h2XjQllO9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=2nn0JsqU; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-606c5c9438fso1909728a12.2
        for <linux-i2c@vger.kernel.org>; Thu, 05 Jun 2025 05:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749127744; x=1749732544; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WtN4QxoUXsZ1MljIDTCQVSg0h+sC7boiBejFEQtKgSo=;
        b=2nn0JsqUEqu1wP7QWlrKbuKe1+3s7wnWm1fnhF/v4s82+ifHLuwMK7pnuLJLZBDX+L
         UwATXQGL4TVBISHxOtZx6oEm46wzl4IFFb+NLSQepv2mo8iz2ygvI8VVf9kIqrqi8sVY
         8INGi8iuaYcVBx0O2C5axMsiF7ROVOaYRNzt+bmQNeiLs91QoG0uwKcFGkXDQD1OWLJD
         AlqNjsltdlU7B9MigMGjI/VCKrVQfxEQjbnaoIPv+zSyaVBnNTY48nJ05IORA+heo6oy
         ms0JiLMq0myg6s9h96gO6SWNbh5vG4MUrbENd/RiiMo+tcUTWbz+fonnb0S5pa+wINij
         PHpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749127744; x=1749732544;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WtN4QxoUXsZ1MljIDTCQVSg0h+sC7boiBejFEQtKgSo=;
        b=ep6fCwa73mozp+jY5G5yX3uOdLE9UbdlsSErrh6XOLhd3L4prxlcEECUZBWSrmU/TB
         2dC71LVJNZyq3lJYTkugtU8117Zgp9qgOjd5wziA0WI6fH8UNLP4sCeRP279WcQVBwjv
         U2HesY+RI/02hXDJNwgEcMnymgWe4RL9z8x5eUTg5aEK6DJxI1PqS3iIiEs+wG/idbaC
         mYrtP7v7gHhIYwVnZWX3v/VbFPlmZTqbKYNsyj6tVIdiWNX+o+1eZsBAayffyuGh7BlK
         h/+fab036Pkgmal4z4vUh0JsVRCvKxJVixCgU6/63nd1/pEhD/ietJjQBbatDrahsLiT
         afEQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4BXeZHjwANzoxKs91ZaIOaVr20XxXDpMkJWnEbznKjqXPc1usOMR0n7zhfyr38J/HR5vTT6uE5EU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiXT2CQgwjpsTIsj3eugyJPMa1roxbE6PmRTtqMOkQlKBsFZHJ
	7Q2cRUhI9aLXIKin7NfesZn1PNcWfr0Ey1M4/6YSlI5g3sUHmQ3w9dChiR4xesGKyfE=
X-Gm-Gg: ASbGnctEcWJJCy1s/PKOpFXdQg/mW+syz6EJgtekMlsjh+sUckj1AJu3p3YoJPhI10d
	yfM9qWbgpZsiOS+u5g/qWFSilGxkUEXjWYjXVSn6wsz2SsCwfr5yRPymxpqO/dpm1MTeVzB3c/A
	pcBYJdhNFWeLOZ9reroLquhSunZ6ZdiUOGNgNvNzb0vsDWpSbeszuJpK7M6ZuUCGXWqCsiJg9Oz
	DwB5b5owyQavvBuebvld9vMtK/rJ2JehP6pKQ1zZdjl+yL7SWsZ8pkOKhBDvsakao+teb6/gyHP
	GYribQazr2nCVxJrqj5V+/rwjv8VApP9xafntM5RoflRzhHoJMHenfZQDSI4yU6aW4U=
X-Google-Smtp-Source: AGHT+IHt4YfvlTuTknTwQwhcQ4507vc2Wi1EDhV+gn7GZ+jvyV4ZeWPzfTmI75x3ArDL0ghbhiNPHQ==
X-Received: by 2002:a05:6402:510e:b0:606:df70:7aa2 with SMTP id 4fb4d7f45d1cf-606ea3a78d7mr6609486a12.31.1749127744398;
        Thu, 05 Jun 2025 05:49:04 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-60732ee3cbcsm470019a12.11.2025.06.05.05.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 05:49:03 -0700 (PDT)
Date: Thu, 5 Jun 2025 14:49:01 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: sergio <sazamoracl@gmail.com>, 1106498@bugs.debian.org
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>, 
	linux-i2c@vger.kernel.org
Subject: Re: Bug#1106498: Acknowledgement (linux-image-6.1.0-37-amd64: Ouput
 sound disappeared after last update on Lenovo Yoga Laptop)
Message-ID: <xhozce5yxcyszo4fzesiejpxoj64fvb4vnrlzprhsseo5zregt@ha7myfagvkco>
References: <174814452778.7037.3139530479075309721.reportbug@debian>
 <handler.1106498.B.1748144532663278.ack@bugs.debian.org>
 <174814452778.7037.3139530479075309721.reportbug@debian>
 <QVAUWS.D0WMICKBJT0C2@gmail.com>
 <174814452778.7037.3139530479075309721.reportbug@debian>
 <d7e5wempkmwckq3xegeucuj7ckfqino647no6czey4n4s7efig@5um3az3z3ysu>
 <2ctrnceanjbxe65k4e6hcljyqfq7esotiinabwd3rb4dqsfcrs@pyo4wulkjgy7>
 <174814452778.7037.3139530479075309721.reportbug@debian>
 <D7VCXS.KDIVZPLA89WX1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sew2myoldbsz63yy"
Content-Disposition: inline
In-Reply-To: <D7VCXS.KDIVZPLA89WX1@gmail.com>


--sew2myoldbsz63yy
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: Bug#1106498: Acknowledgement (linux-image-6.1.0-37-amd64: Ouput
 sound disappeared after last update on Lenovo Yoga Laptop)
MIME-Version: 1.0

Hello,

On Wed, Jun 04, 2025 at 07:42:49PM -0400, sergio wrote:
> > /Hi Salvatore,/
> > /
> > /
> > /at the moment of reporting this issue I had already lost the mic hot
> > key also, so I took advantage of this second inconvenience to upgrade to
> > Debian 13. Both, the hot key and the audio, back to work after upgrade./
> > /
> > /
> > /
> > /
> > /Anyway, when the audio issue appeared i done three things:/
> > /
> > /
> > /- back to intel-microcode and kernel previous version + reboot (
> > randomly worked )/
> > /- back only to previous kernel version  + reboot ( randomly worked )/
> > /- back only to previous intel-microcode version + reboot (randomly
> > worked )/

Can you confirm that after a cold boot audio (and the mic hotkey) works
and after a reboot it doesn't?

Best regards
Uwe

--sew2myoldbsz63yy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhBkjkACgkQj4D7WH0S
/k7ahQf8CenlChi/Kp/0Kz3aNvxRTcVnkLWVLmsxyeLJ75EF0GoshwAY2Xzx0aye
4UImxYrl6qY1QapUbccQW1GpDro9VlciqLc2Q77zwCYQfZKc6KiuuZdpqOa4IPhc
T5OpSnCk34YobyJk+tIIxqt0SDu7tYLp1BH9LYBWGx5jkS0CDXgvwnV6yFeuEpFH
8ZdpOZLPPk2fbnEbzE+0iI1NgV2Y9m7XO0TvcBmREq0njiitY4fox9xYmqZwBaIp
j38LLDtMb5Cq1kM1rXldCilpSWjTGA5kBv8C6FWkYmvAHlgielNAMRfOWT4bNWI1
TMjnuZs3su7xclOJ48QFx3T9ysJYRw==
=gUd/
-----END PGP SIGNATURE-----

--sew2myoldbsz63yy--

