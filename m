Return-Path: <linux-i2c+bounces-12667-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B226B446E9
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 22:04:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F10AA4055E
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 20:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12B5127A909;
	Thu,  4 Sep 2025 20:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jPvWeScN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A28279DDA
	for <linux-i2c@vger.kernel.org>; Thu,  4 Sep 2025 20:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757016277; cv=none; b=ujknQLyxWx3WWmKZtSxsnFJ40u57hfIVFjYv2HQKkN3yjnHjv0DVQo/wtlpJ4Rsavv47LMoVeQZvYNiYhxqLvXvW6CZssUsMueNa6grNl7b/TTbigDTmwX1TCoOglfUs7fQZmNbENXfuTjrbZyWzSnVXnYsTKHNvSgNF+9W9vB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757016277; c=relaxed/simple;
	bh=9CtM8kOig8lhqQfkqBq4cGnzcIdZCxWezMouBG2wwGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hofmjVWRdqWAO3ln/2GsqkstkI79ZLN3GDowFPuWclhV8lDA4kgUZl07C8e4k4q6gdsbCckr1YjbrPnrldxzXvqmZpYp8Al3lWENbZPjYhs3fewZQ9/SqcVU0MsJn+InNn37/CZeHH5TZ4Nae/VqX/kmXog9WGH7KWZvjmV5+oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jPvWeScN; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=03uN
	vgwUPEr5pFTjghRkW0v1kpVYYKwWd6HYjQaWs4w=; b=jPvWeScNBfdAuCiRqHB6
	sxRkRcCUuHczF293rrs3sjddA/+gnkLukkz4I0jJMMxUDE1cP6vxkysGWImknBB1
	TMpkn+UcHXPQV7DoToNgx0XqOgOYO6Zm0ahFzgfj+rfeSRTN1HMekeGp0xi5y1NG
	Tk03wvaZQh/wzkNn0Wez6EPAuCkDTblPhnnkANfS19i6JEhBmeaWf/TWHdV9KcDQ
	MXBuqI/2N0+Y6Beuz/RRqqqotswrxd8qyKfe7K/tUY2hqeIAfbgsZw4FNOV74/sK
	Ae5l/CS7lpVAoWP9xBipfj7jPI3RUz98ZtNLsRBflD5VFEiHA197+nFQhfFh0pg4
	gw==
Received: (qmail 3780798 invoked from network); 4 Sep 2025 22:04:33 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Sep 2025 22:04:33 +0200
X-UD-Smtp-Session: l3s3148p1@rs7NOv89wMsgAQnoAEbDAKz8Ugxpiihv
Date: Thu, 4 Sep 2025 22:04:32 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Mohammad Gomaa <midomaxgomaa@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, kenalba@google.com,
	hbarnor@chromium.org, rayxu@google.com
Subject: Re: [PATCH WIP v2] i2c: add tracepoints to aid debugging in
 i2c-core-base
Message-ID: <aLnw0L3ncTsQm2eD@shikoro>
References: <20250817-refactor-add-i2c-tracepoints-v2-1-c0bad299e02e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oLDJ+0ds4x0QP+bE"
Content-Disposition: inline
In-Reply-To: <20250817-refactor-add-i2c-tracepoints-v2-1-c0bad299e02e@gmail.com>


--oLDJ+0ds4x0QP+bE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mohammad,

On Sun, Aug 17, 2025 at 10:55:14AM +0300, Mohammad Gomaa wrote:
> Add tracepoints to i2c-core-base.c file to help trace
> and debug I2C device probe failures.
>=20
> The new trace points are:
> - i2c_device_probe_debug: records non-failure routines
>   e.g. IRQ 0.
> - i2c_device_probe_complete: records failed & successful
>   probbes with appropriate trace message.
>=20
> To support operation of these tracepoints an enum
> was added that stores log message for debug and failure.
>=20
> Signed-off-by: Mohammad Gomaa <midomaxgomaa@gmail.com>
> ---
> Hello,
>=20
> This patch adds tracepoints to i2c-core-base to aid with debugging I2C pr=
obing failrues.
>=20
> The motivation for this comes from my work in Google Summer of Code (GSoC=
) 2025:
> "ChromeOS Platform Input Device Quality Monitoring"
> https://summerofcode.withgoogle.com/programs/2025/projects/uCdIgK7K
>=20
> This is my first submission to the Linux kernel, so any feedback is welco=
me.

Welcome to Kernel hacking!

I understand from the link above that this patch is intended for quality
assurance. With automatic testing, you can find regression of firmware
updates much easier.

The drawback is that it is quite some code for such a niche use case.
Also, I would think this code is very fragile because whenever the code
path in probe changes, one must ensure that err_reason is still set
accordingly. This adds maintenance burden.

I wonder if you can't use the output in the kernel log to identify
problems? We could add some if they are really missing. I know such
strings are not static. Still, my gut feeling says some application
should handle the complexity, not the kernel. Wouldn't we need a patch
like this for each and every subsystem if we follow that route?

Happy hacking,

   Wolfram

--oLDJ+0ds4x0QP+bE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmi58MwACgkQFA3kzBSg
KbYRtw//f79DM39aMbcZLj/iJn0Rba+V2KLROUlT9cmx1NgvbVR2VSL1YqH/BRy/
IbDnHHdEhVFFoS5gWGLT/szYUjoOdEKT/rwc5rEe7najMxAFQ//bp5td7T5UDH+m
VRVzGENbhys7vPABI6KEQ5yrMLhvbTDpB/b2MDsVaNVUd4gfQQ2QwVNb+uUSKO7K
Nio+MK/mf6+CXpRhStDr9edrx70lkFlmPj63APMka631k4CFwQPbAXismIs/kasn
C77JWftI6jLSRJcZP2glQ0n5MfxFF87uzgl0ALiTDxSxXtlZksA3EpCIXuuAVxYO
NZMrDAW5D40uHmRxRsXACptqSabh/yKUUg3AmHpl/SeRqeWThBjt/poXfTUFB9i9
PH8Kr6PAn+DZEToMx2bsbXlkmxOn3NcexVfqhj5Zz8bBd7UJ/zauga9ACSaaVJAa
haXoBnQd2Xanz1bzk/IxI3HPa7wYCE7oGfXK0ZptLt7YCNhn6uFc8hflCfPARLA9
16Bhb5eksk7er5RgwaXrPGuZDImuctkNQP3UpkQsELYAFTTjy5+BqePgx06CoeIn
YyXtdTBih25G04OxqhjRvY424wWCKb70SaaDHPjF2PLA/Mxn5nNHmgpuq1vTe3+j
nC3QgT4l63VfMvTRAN3LO7w925hVrqHipmzyDHcEx6WBxjxyGhU=
=hxUd
-----END PGP SIGNATURE-----

--oLDJ+0ds4x0QP+bE--

