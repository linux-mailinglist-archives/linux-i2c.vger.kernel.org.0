Return-Path: <linux-i2c+bounces-14311-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C94C8D8C4
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 10:30:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C30124E4574
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 09:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 692E82FF15E;
	Thu, 27 Nov 2025 09:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YzCfYd7w"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6214C2DC355
	for <linux-i2c@vger.kernel.org>; Thu, 27 Nov 2025 09:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764235847; cv=none; b=JBz8jNslrI9tdw+WJyAUOKrQy483shyulKBiTwCtGzYE/Q0zPaZWkhoscLqROdyJXWIX4Ve/v7yDDSt1iY1pi0RjYF4THJznd8z1ghAphFCvElVH9dEB6G3NPQq49q55ANrE4+3dE7wLesO5Zp0sA+aW/08QXeCqrD7NsO4lmxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764235847; c=relaxed/simple;
	bh=spSmCKtlFmblh3YTGsQTjmqMV2aD2KZPtJTd3tmXQmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pKQ+ifEsIBLS0v6W+4taNwqXi9/FU7/MNk8AHywgPYKSomkiA+9I1W/Vj8EiATUYpf/lurCl1zjby1v3iYypvYyWDiwioNkjl2MaizG5rU9zOpqQ1RXU3urYQ+84pD+eWpb06ZKGHcMHotH+5RKup0CyXXNKsGkTQ+MOXr/1czY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YzCfYd7w; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so3293415e9.3
        for <linux-i2c@vger.kernel.org>; Thu, 27 Nov 2025 01:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764235844; x=1764840644; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WQ4PYLxJ2erplB7TcyLC850CpB7n84JAFETV9m1Ihb0=;
        b=YzCfYd7wF9Y9/f3st6V8KaeM6zdguW2ii+PGb9D4dLm9c3giHE1vXZ7ZH6St25N8wJ
         R67HHjCeU1UIgNK4EHruY/0P8RmVy6DM8aUmH8eDsT2Ti9oa6/Kx1s4fXUxe+I/hUY0o
         LuPLknKgAWWUdQE2mmYA1IzS9wunJCyeo5HuRClii/d+tVlC6JGqq425PfAVEt0zZ7m2
         35agcABKutMtphtZKuxN7sENLer/wrVITkVuUtgP1lNRDMlNNypjd0BMcxSlvxYkeDIS
         /1d0YDde9LqnYV3EOw+uVyWtR+8YfEs0GeUPOIliqqK9AaJchOnUenOm6csiZPaoNzzF
         kKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764235844; x=1764840644;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WQ4PYLxJ2erplB7TcyLC850CpB7n84JAFETV9m1Ihb0=;
        b=N7x5ONXgBUA01C3MwkddMG1gdi+j0MIl7dVMd45z3rcnE6y4CsYaFT47KsIIm0oxt1
         iBwn/mtYAiNWvXwXf89aZd2UfSJIPd4bA1/pgTFDILJggh33+RGZEvAeitgUtBjdhyrj
         27sfoS7bRrBeL47nsB8UKFm/k9IVET8kQmF74Mc+glbGpnF0GG9JudsRek/aB368hH7j
         a9RwD/YepCSAKaYSNjYAo+r8huUSiSQfnHUrIztt/5GCjjcov8uu3lzXIVhnB+vImSYO
         MxucS3FNBfduSAKJUsktqUONuIgKO7dUk5NGjROjF3mZHQBTnyOuaLHPYGi9T11Swtgi
         ztjA==
X-Forwarded-Encrypted: i=1; AJvYcCV9VpQTaMXCK4d0W3v9wB26/3D61kDLNksGauP9MjtblhMBRQZOw6/OBqKTJMtOalUu5dTlISPNozQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwF3lD5jOgQH3PDurXLl8YxuTRx1Ol/Ex+sY/CLno+vgZmo0380
	URkCWlIuE/2nH+tZnOIIG9I8rPJMTchObHQPKvnil7ATOlpL8TGeMhlw
X-Gm-Gg: ASbGnctVSwwMLwzq9lDIBVckcCbbuFvyUQBayjgvxSPrN0MwN7Q8TVasQpmNywEH3PA
	YHZltlZurc1bOP7hUuom1uvbHjixLgTzTNENTSmmvAyr7QjoawgX/y/rEifeLwKBIPqpnlM354o
	UTqH9soSGJTj29FFMUSZhfhtWPnEEUvCuk/d1i6tyxoTs/fp3btXhWvSj7QnNvTADG3Ct2PhXxk
	/jhbJshJ/o2J0L54u8Yk3VK1pOm04982TW91AXPrDLiKkUXjoIAj920ux5akZWF8h8eJ1KVNOtQ
	nFoTi3waBIN15+N18lALBnUyv6n4v3uKYysINaO9V4Mmcwekt2zHGN50rcqOMQdizzQyLgjDn5y
	pDGcZBK5GMwBr3gz5FAO7frHFSHWvDXaMounVeD9qsFoLbWSaAA7OE694EMTFcc9a8cjmwbx+64
	85Cp412syE5Ephg1MNKxDppOXAZ3jcB6MHs2dVJfZ75PP9YxeRDlXmawQ3wTMR+Ba+oCYrSOAR1
	xA0gw==
X-Google-Smtp-Source: AGHT+IF3nKt904Se8/WqPz9d/UCigz+46+wqHvckBtV3krmOyMb9KB+V/5ibRAtW+U7hqls76pn3sw==
X-Received: by 2002:a05:600c:3b05:b0:477:9a28:b09a with SMTP id 5b1f17b1804b1-477c00e7900mr252183205e9.0.1764235843615;
        Thu, 27 Nov 2025 01:30:43 -0800 (PST)
Received: from orome (p200300e41f1abc00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1a:bc00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790b0cc1d6sm84863095e9.12.2025.11.27.01.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 01:30:42 -0800 (PST)
Date: Thu, 27 Nov 2025 10:30:40 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: andi.shyti@kernel.org, digetx@gmail.com, jonathanh@nvidia.com, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	wsa+renesas@sang-engineering.com, wsa@kernel.org, kkartik@nvidia.com, ldewangan@nvidia.com, 
	smangipudi@nvidia.com
Subject: Re: [PATCH v13 2/6] i2c: tegra: Use separate variables for fast and
 fastplus
Message-ID: <gvrbeiwc56ng2rmbcz3zye35k5jtafsvrjfc7i5cf5wqar2kqc@h5clfpllhk5c>
References: <20251118140620.549-1-akhilrajeev@nvidia.com>
 <20251118140620.549-3-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kh3kx25vzxovgxee"
Content-Disposition: inline
In-Reply-To: <20251118140620.549-3-akhilrajeev@nvidia.com>


--kh3kx25vzxovgxee
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v13 2/6] i2c: tegra: Use separate variables for fast and
 fastplus
MIME-Version: 1.0

On Tue, Nov 18, 2025 at 07:36:16PM +0530, Akhil R wrote:
> The current implementation uses a single value of THIGH, TLOW and setup
> hold time for both fast and fastplus. But these values can be different
> for each speed mode and should be using separate variables. Split the
> variables used for fast and fast plus mode.
>=20
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 119 ++++++++++++++++++++-------------
>  1 file changed, 73 insertions(+), 46 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--kh3kx25vzxovgxee
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkoGkAACgkQ3SOs138+
s6EPuA//WOAZGzOMGif+R5tep3JqJnWwVq1frPfLsUmOJoGVW2/AIDLfNvogcARS
8X3gOQiv5R2lB7EKaDPet9z9bWVcZlpq02oDhjKtC3uFZKwC2fGv2S9fehKiAft8
N2DiI6Meupn9qQUccIGV1Bbm7uza0k+RrztnZHojVnfVxkdp65mc2HJsropbGxJ5
+Wp9dYJH98ed6fxvAOurH7vyLUX6XYEFzimPqkL/EMmmvge+K3X+eyrqQEeL3j+l
PXaS/5qD9aD8N+cZs3IHJ/0OGd4ypC7F1nAJrhkz92W6AhmrZc4cFEVhVXdcVFLf
3OfT7mc+p3VpzWLsFU9/S4NtFzgeCjWuyPHwqge1J1C3IoH+FWobBt+HYrTzki8x
Cz/gIlPes49Mj5dQpGXvoHTTvuUxwSMwT/KQvKtNjMO5Nmxy40PrITRoKw1ThVXE
qAtc4e/1Q2GkfpMuIL0pehaaj9OoLBt8a74RDh+Ll6+ZULrkAp4R42G5T9/oSy32
QBqM4ur1iNpjB9yK3NrcBn3aIsQ1tyAZktLpY6ag5ITNyQPTN8wN2Fn7XYD5fNXe
+/h6mb3QLOOW4Zj7Q+U1ojdZilQmhsO4O7LSELfOgs6Zqtn/pxzJlOi82Qrh4WoN
KsxQxitVsCC2inF2YqEbRgBydHPVhNF8YO43oQSvL3PUgI2rkI4=
=gXUJ
-----END PGP SIGNATURE-----

--kh3kx25vzxovgxee--

