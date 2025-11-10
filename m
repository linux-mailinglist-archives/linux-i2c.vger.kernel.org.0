Return-Path: <linux-i2c+bounces-14028-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DFAC45849
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Nov 2025 10:06:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7B7B44E9879
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Nov 2025 09:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C014272606;
	Mon, 10 Nov 2025 09:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dhU2qiu8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CE62FD690
	for <linux-i2c@vger.kernel.org>; Mon, 10 Nov 2025 09:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762765608; cv=none; b=I22bFZN95qMtrj5FyLO4OhxKWa412qOsbZrJZv6fU9hv8XdW11EdeppMH6gPoNKB+iWO6VWizFDsO/a04m43umRwn1JNweZATl+SNenbcqVSi2kSHXzcyirv1sa6q5jLRLEk8G3JWmlg3kT9jeFcsMB/EmsiyAjW0wlHPsvWs5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762765608; c=relaxed/simple;
	bh=siUpimkYk3gLSAZv1jl2j/aQszEfhBnebYgez6oqgPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QCx/inoF061u75xbby8TKr2ipI+nwjV/rx3ZkfGdoR5ljQVyHItmY01gdXEzwXkp6QRd5jVgAjaZDfib3jLnqhO3zm7hzcSTmjPhEavs7w9vB6zlEEQStiWsGEbsLcYb8VdjE6xDkCdi0Sizf5MdFwQoMleKTByswij8cGUDblE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dhU2qiu8; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-378e0f355b9so18284661fa.0
        for <linux-i2c@vger.kernel.org>; Mon, 10 Nov 2025 01:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762765604; x=1763370404; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kv669uPkHrSvw8LzIPDONi9ciYMUaJTZqlDY6Vg+I9o=;
        b=dhU2qiu8HSzNe2e4F+We5f0ueCYX/MRij4qVcaRigm25vdhb7okGEO52ZeXHrf6E1Z
         p/3A7t1Mlx22guee9uMHHycXK/qYvENZrIIQMLVAhWqza9LafFMf+OXpkB1dqaQFzg00
         VPUQTFmSrIfTgRedtLqQkZnjl5Kxh+AMu8bnCrSV7cplc4AP/UvldCnHjixL84q4YcK1
         Zi6fpw6BZRe3kQwhD/igd7lZ65zlmFWEwry7DPzqi2JgApFeRIDVmhUWdEtJYvkCj7Ys
         6x6Z36sBXqagMSX3rtF6nTPkuYPP+703b94vbYTYOFzlqrkJhZEDLQ2nKbgAwUP2xASe
         nrTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762765605; x=1763370405;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kv669uPkHrSvw8LzIPDONi9ciYMUaJTZqlDY6Vg+I9o=;
        b=WA9l4MzEdVs9KRb1aosy1ytE5szTMXtGVCg0je1YjVvkth5Z757iVHKYwpcAJdQwhM
         hARIKyDGObZOlSTpZApAcEt3omL8kfMVaeN1piNC+NVC0AgOMcKbzX7gRrdKIF163z84
         nPfCssWcIgTeMf0b4+hEdvAXVJw+QPuui+keZz0BrvWNbjaDsZgJ7i0jxc4AJ3kKAQqX
         UbWBP7NMJzH4/D3z/110hBLRcg7THQbeb65e/TBFLthv1AvoCiKED9YNJeeTo6KePYpF
         WJqkv0nnfKT+RTtj6W1hx8tVbDzcbMxTxmb2ZtUegoZsoZK4IubPZexTCtZP/BAQgf2W
         b5yw==
X-Gm-Message-State: AOJu0YyaH+44ruvhRCu34Lg5y1DuZVhu7VkfKhFWjV5SuQpASuwLYP1P
	ZuddNEMAD1iPnoV0IDFQlzLflRcyOSBHl21shjdkd9GGrCCWV3Ey7yY8
X-Gm-Gg: ASbGncsVPV0DW2Jh4uKYamgstNtoVW94EQXnNhhGUuEpi8gNBalWDfPVVoY/kPbzWwz
	9dMDf+BmCWU3MujEc2rn4R9AKREcMr1B2ebNQ41RrSV55rq+bSH8kVXk/HBBP8DVOpVOzGXc+9x
	mSf4Mt9ptf7GN54BlqbIJSbqRWYeiynXDxW/lZp2Xz9/YRMbnmgjiwOmgf7BsOOWecN8GdXtgob
	GmQhkDVGY9DPLhojrpwsYollcL3tt7rgQ0AOm6JhGY4CE5Sp237VDMWql22g7clY6L5DGVDrsmR
	Q/Zf5lAPUa46CrIqDiBKtdkSuQl5bouPtWklyZ52pK/4i0fFCU5SuURKVRBcFgz97iEIGYfIi6o
	2qux/uMZa9OIHITfW5MMxXNog8JWKnxgTaCU50jhhdhM4QXNRat3ZiplkfCPEgje0/D6Crr69G2
	zWESFuvybMr/HDR1Xwhn5MrR4iQP0uQjHYKZ5u
X-Google-Smtp-Source: AGHT+IH2Bad+qTl99d6KPJeCk3sJy+GS6VSBYjrpF8xVgr/9IQeDjmTmz+kfeOOZUKCjh1vpE36b/w==
X-Received: by 2002:a05:6512:61a1:b0:594:31af:4de0 with SMTP id 2adb3069b0e04-5945f0bd59bmr1813454e87.0.1762765604346;
        Mon, 10 Nov 2025 01:06:44 -0800 (PST)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a01fb14sm3744501e87.39.2025.11.10.01.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 01:06:43 -0800 (PST)
Date: Mon, 10 Nov 2025 10:06:41 +0100
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3 0/5] I2C Mux per channel bus speed
Message-ID: <aRGrIRNgNlRqDLzr@gmail.com>
References: <20251020-i2c-mux-v3-0-908ac5cf9223@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N/hTo/3gW1AqHJcu"
Content-Disposition: inline
In-Reply-To: <20251020-i2c-mux-v3-0-908ac5cf9223@gmail.com>


--N/hTo/3gW1AqHJcu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, Oct 20, 2025 at 09:17:23AM +0200, Marcus Folkesson wrote:
> This was a RFC on how to implement a feature to have different bus
> speeds on different channels with an I2C multiplexer/switch.
> As no major complaints on the design came up during the review, I
> decided to submit the series without the RFC tag.
>=20
> The benefit with this feature is that you may group devices after
> the fastest bus speed they can handle.
> A real-world example is that you could have e.g. a display running @400kHz
> and a smart battery running @100kHz using the same I2C controller.
>=20
> There are many corner cases where this may cause a problem for some
> hardware topologies. I've tried to describe those I could think of
> in the documentation, see Patch #5.
>=20
> E.g. one risk is that if the mux driver does not disconnect channels
> when Idle, this may cause a higher frequency to "leak" through to
> devices that are supposed to run at lower bus speed.
> This is not only a "problem" for changing bus speed but could also be
> an issue for potential address conflicts.
>=20
> The implementation is split up into several patches:
>=20
> Patch #1 Introduce a callback for the i2c controller to set bus speed
> Patch #2 Introduce functionality to adjust bus speed depending on mux
>          channel.
> Patch #3 Cleanup i2c-davinci driver a bit to prepare it for set_clk_freq
> Parch #4 Implement set_clk_freq for the i2c-davinci driver
> Parch #5 Update documentation with this feature
>=20
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
> Changes in v3:
> - Return -EINVAL if channel is faster than parent (kernel test robot)
> - Link to v2: https://lore.kernel.org/r/20251002-i2c-mux-v2-0-b698564cd95=
6@gmail.com
>=20
> Changes in v2:
> - Changed bus_freq field to bus_freq_hz in davinci_i2c_dev (Bartosz Golas=
zewski)
> - Removed idle_state from mux core (Peter Rosin)
> - Link to v1: https://lore.kernel.org/r/20250922-i2c-mux-v1-0-28c94a61093=
0@gmail.com
>=20
> ---
> Marcus Folkesson (5):
>       i2c: core: add callback to change bus frequency
>       i2c: mux: add support for per channel bus frequency
>       i2c: davinci: calculate bus freq from Hz instead of kHz
>       i2c: davinci: add support for setting bus frequency
>       docs: i2c: i2c-topology: add section about bus speed
>=20
>  Documentation/i2c/i2c-topology.rst | 176 +++++++++++++++++++++++++++++++=
++++++
>  drivers/i2c/busses/i2c-davinci.c   |  41 ++++++---
>  drivers/i2c/i2c-mux.c              | 116 +++++++++++++++++++++---
>  include/linux/i2c.h                |  13 +++
>  4 files changed, 324 insertions(+), 22 deletions(-)
> ---
> base-commit: 22f20375f5b71f30c0d6896583b93b6e4bba7279
> change-id: 20250913-i2c-mux-b0063de2ae4d
>=20
> Best regards,
> --=20

A friendly ping on this series.

Thank you in advance,
Marcus Folkesson


> Marcus Folkesson <marcus.folkesson@gmail.com>
>=20

--N/hTo/3gW1AqHJcu
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmkRqxwACgkQiIBOb1ld
UjJBVA/9FekIGivuFU6wWlAnooD4cBtWh+Jfox7uf+UfY2IOlmHIdcYoSlV47Fmb
Z3uCe0KE/ZC8uaSMHiVAYiLoWP5Oq7vWcI7Hs7rCllsctRMt3RHd7PAEpn2m+SrL
U2w086QVnQe/srRRHPuACYrQIw2Rzs6m13CwsVY9dgnJZ4gp8TMWd1ublGyFfmF5
8vASpAJNf5wb4YArKjLZC5y7tX0mN7MsxDjSzrH8H9Sjn3jzIdq/vlsfudLof3gh
rlIuetHCo0OUQB5SOEtnP+pu8j31ULTPmevcMtNOHG25TG+zOwnLCu65gF/DcZAm
AXvLpSUjmfZCZB57I1gn71j+7hKbRE4ibT0tRGxKxcqTpC8sfiGd2++dTubn6QCd
xcj3/km2CKJvKl6V0jHtVdaOLSRQttfE0mQVzuUoLegOpHOXw4RSTA0pDBpIj1mE
+ivVa33rMlzjrHxpMYtoNWWBmA38n7Sm361WBysD//Ucnv5/b7Xkc5gLJGybBNHB
8eMB8TKSTJYLAhDejCl9CFslIzecaMf68Iu48Wiwz3pQ9It4i3bjQ77FeuZIqRNE
L4MGB4MN++mWXBu2/WQTLrG3YwfhUL0YlFEZh8wkYrrErrzGPaAxH9tGTZc0QAEu
lNg8KXZSNhLEtBjNZLstbqdSJNHMKLGhmUwOZb1s2BSgPPoJjQE=
=iKc4
-----END PGP SIGNATURE-----

--N/hTo/3gW1AqHJcu--

