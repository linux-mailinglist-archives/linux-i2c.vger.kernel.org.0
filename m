Return-Path: <linux-i2c+bounces-14314-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DE0C8D935
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 10:36:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 08CF84E6977
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 09:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42334324B3B;
	Thu, 27 Nov 2025 09:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IT17L6aI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78B4329380
	for <linux-i2c@vger.kernel.org>; Thu, 27 Nov 2025 09:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764236190; cv=none; b=YMAsMorQCIoSydVGNISJVuo7pNVNNfo5NnI2OmsVl1j4tQZpZQMNfgY1Z/9fPt4ErT30f7LN7ycK51in3Prgujsbv0DJbhwsLTxH77kCQsvX4RtBrq3PlLEfe+UgEYkNmjrtt/Gp/HW9kApCwQ3INXaNzzjwmkDZauR6/nCE40E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764236190; c=relaxed/simple;
	bh=hKkpWP88n3b16vdMv8tX64ZdadOglejX0a2Pmdyz3SY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XEJm3k6iiVRZPxJmoSU2V+Dig0J2icK9UiFiklEQmKrPsisSmKUow2ckZeVtHTr9AGnVhhOJ0GihxUQFWxvHA3wPZa7j3F7nOjTUydSqFYtz1MC/4E6YhAyd8W8PsnVVb4BKDgEc+HbQtWhRRN/3lwKtOSsjlPzprik0y35eMXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IT17L6aI; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47774d3536dso5122925e9.0
        for <linux-i2c@vger.kernel.org>; Thu, 27 Nov 2025 01:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764236185; x=1764840985; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xkjuVlxnDtBeDJu7McmyWbBWdTlwQeavPDxOKxcMxnM=;
        b=IT17L6aI07JT42l9qAgyLU6S8SvoCmxn8osga7j5/rvsJIBOmgzQf+Cl8cA237DR2n
         w5GL6ns8NeHwi9LzFSn9uyXS0NyvcK1o8PkvqdI3Z8usK+sN/QGOfolN9N4l346pnsix
         07rl2kXh5rc+UAH/qHyG6Rpfo3Hr6h4BKyDxD8iU8KeS0/kZDkvPgtbb6GI64dz7wL2Q
         8Y1lvr9vBN4vc2CFMed+YHW6P/cZomZF7CVSXHZPTCWmRDvCxTMa+X0XVgray4uQL6yP
         uXnLvjwq/xJihzueNPRMZf9Hot2kTjKOGOr35ghTXJtFedpZMU68WlTlzeCH3Jq8l57V
         kRnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764236185; x=1764840985;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xkjuVlxnDtBeDJu7McmyWbBWdTlwQeavPDxOKxcMxnM=;
        b=PT3X+rcYy9vmAzGa2qenyXmAyr4PfXK0QEZHEgt1fOe2mAur+Fg5Yklra6ucoiBnfM
         vEKxAWPJgIqjmmesaxvaLSA9wHulHZ2l+RY9D50m1RJ1aTO6Qsu5uBl+vydINnu225Yh
         ZG4XkZWvbUijRIGOVkVZ3ggeX3oK/Gdwx8kMWwj28jPFACats0Ti18ajtaMC6jLcLanz
         yo6eVd3gfw6GEz8KifMsldQelNEjoiihkjXfqy7TynT1xHlPejuYU/7VnsZIE2K1TWrH
         EKzRv9EFybTVRAv8KV5zO9QctXn+XobsxLK0KX3p1Xc04l0mFflBLqHK4Rl67AVb0qVa
         tf0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVvJcTiZrXLVLfyV0zVav+O5ysTra0bncfqerrmQyUU5hKmomvWpKEQLpoovaSOSRUxm3QoSj6cp0k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/xDjmi9AltDb4zqLK4/zfZfZ+2mCZYaiBP0HQRtvKtXR+jrfS
	53CSaMupT8Q4mLXJsJh+FtiFocqNA1UyIkcSH3UOAp3+PnaOSmX35QSj
X-Gm-Gg: ASbGnctIUjqpD34cX9axiHKvnzhfXTtNnPaFs8kkpFuwgpkZ9XhX6DOB70yJoJO6BKL
	CwQ8BgSaRLdXai6dVcIrv/jYrfpW2qMvJGevtP3ZrXyVgMdTmvEHP67gB75tgrnoVD2oyPH3Huk
	S1YWdehRO3T0AG2UjVS5YOJrwv9fu/q7Us0rRpkCzyubPM2UtiFodb9kTYnMu+HbFNv+MzHMrWK
	h/NDUasBl4iVQjt2HPFuremObasc6kTMM77/HHy0yDnFpcDq7+ubMQnAnDl032NO5xXNppU1K0a
	0jH6PRTmjc+xeshvJC4z7gwV2nm8V9RQayDnymIWpVKwkadzt6Hsgd4u3v4X3LGcrx9D2KP93nF
	WPOMJ7xouPVs4f7KhCU599FpG74jhNES6mkjSVAj7qnzlXbiTTwhyBaaWRFw7v+UvkpcCxUCQ/X
	AgamVhNPOFDAxsgAo8vJuk3EBuX0YC6wLZSFxlcSQ1y+UHbkH+VJDIcw9M2loy9QMt86qzWeFxh
	UUDK7A/H5G6Cg2v
X-Google-Smtp-Source: AGHT+IGAcprSuWBr39Jovk2yl3BMGbF7g9hjZCIhouUVNA6iYXFsz94DrWJq53phmHh9EgoFB+jpNQ==
X-Received: by 2002:a05:600c:3b01:b0:475:d9de:952e with SMTP id 5b1f17b1804b1-477c04c357dmr199942065e9.1.1764236184810;
        Thu, 27 Nov 2025 01:36:24 -0800 (PST)
Received: from orome (p200300e41f1abc00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1a:bc00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479111561c2sm26293565e9.4.2025.11.27.01.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 01:36:23 -0800 (PST)
Date: Thu, 27 Nov 2025 10:36:21 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: andi.shyti@kernel.org, digetx@gmail.com, jonathanh@nvidia.com, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	wsa+renesas@sang-engineering.com, wsa@kernel.org, kkartik@nvidia.com, ldewangan@nvidia.com, 
	smangipudi@nvidia.com
Subject: Re: [PATCH v13 5/6] i2c: tegra: Add support for SW mutex register
Message-ID: <tqkqtn7nwbc2pmveymrea5fdzrkl6q3wuehy7kdkgb6kcze4wf@r6a7sug7wnfv>
References: <20251118140620.549-1-akhilrajeev@nvidia.com>
 <20251118140620.549-6-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fwu2w7fh5xwdofqc"
Content-Disposition: inline
In-Reply-To: <20251118140620.549-6-akhilrajeev@nvidia.com>


--fwu2w7fh5xwdofqc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v13 5/6] i2c: tegra: Add support for SW mutex register
MIME-Version: 1.0

On Tue, Nov 18, 2025 at 07:36:19PM +0530, Akhil R wrote:
> From: Kartik Rajput <kkartik@nvidia.com>
>=20
> Add support for SW mutex register introduced in Tegra264 to provide
> an option to share the interface between multiple firmwares and/or
> VMs. This involves following steps:
>=20
>  - A firmware/OS writes its unique ID to the mutex REQUEST field.
>  - Ownership is established when reading the GRANT field returns the
>    same ID.
>  - If GRANT shows a different non-zero ID, the firmware/OS retries
>    until timeout.
>  - After completing access, it releases the mutex by writing 0.
>=20
> However, the hardware does not ensure any protection based on the
> values. The driver/firmware should honor the peer who already holds
> the mutex.
>=20
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> v7 -> v8:
>         * Use `bool` instead of `int` for `locked` variable in
>           tegra_i2c_mutex_lock() function.
> v6 -> v7:
>         * Return bool from tegra_i2c_mutex_acquired() and
>           tegra_i2c_mutex_trylock() functions.
>         * Move `has_mutex` check inside tegra_i2c_mutex_lock/unlock
>           functions.
>         * Remove redundant empty line added in tegra_i2c_xfer() in v6.
>         * Fix pm_runtime_put() not getting called if mutex unlock fails.
>         * In tegra_i2c_mutex_lock() simplify the logic to check if the
>           mutex is acquired or not by checking the value of `ret`
>           variable.
>         * Update commit message to describe the functioning of SW mutex
>           feature.
> v4 -> v6:
>         * Guard tegra_i2c_mutex_lock() and tegra_i2c_mutex_unlock() to
>           ensure that they are called on platforms which support SW
>           mutex.
> v3 -> v4:
>         * Update timeout logic of tegra_i2c_mutex_lock() to use
>           read_poll_timeout APIs for improving timeout logic.
>         * Add tegra_i2c_mutex_acquired() to check if mutex is acquired
>           or not.
>         * Rename I2C_SW_MUTEX_ID as I2C_SW_MUTEX_ID_CCPLEX.
>         * Function tegra_i2c_poll_register() was moved unnecessarily, it
>           has now been moved to its original location.
>         * Use tegra_i2c_mutex_lock/unlock APIs in the tegra_i2c_xfer()
>           function. This ensures proper propagation of error in case
>           mutex lock fails.
>           Please note that as the function tegra_i2c_xfer() is
>           already guarded by the bus lock operation there is no need of
>           additional lock for the tegra_i2c_mutex_lock/unlock APIs.
> v2 -> v3:
>         * Update tegra_i2c_mutex_trylock and tegra_i2c_mutex_unlock to
>           use readl and writel APIs instead of i2c_readl and i2c_writel
>           which use relaxed APIs.
>         * Use dev_warn instead of WARN_ON if mutex lock/unlock fails.
> v1 -> v2:
>         * Fixed typos.
>         * Fix tegra_i2c_mutex_lock() logic.
>         * Add a timeout in tegra_i2c_mutex_lock() instead of polling for
>           mutex indefinitely.
> ---
>  drivers/i2c/busses/i2c-tegra.c | 93 ++++++++++++++++++++++++++++++++++
>  1 file changed, 93 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--fwu2w7fh5xwdofqc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkoG5UACgkQ3SOs138+
s6F34Q/+JBtEghV1MsKa8M+vUbgyuElSEhb47Skk7oht/cGWwnx//PorQsaoJF+g
EduxucNIAncT6gjVUtpVMYpRSVUOq6ooWwTCzH1XZpeBtLbRhEg+Ov9+0FAd4zmI
pEichML+kFtl5Ng2KZmetij6g4rHYtpvMM/FSIlDm8LCcQrHJzW6x33MGe9oAf8s
MAf7V5Y6ZY1Db1FHWEEe5S2Z3q/qRu4hSU56o2eCi4keUpQ7Tpo9HBvS7+W9Lxc6
334/FyQAWSZPhksfzagAyOIiFYBPP4D2eDnMOFwGrckDhg6IPNrPlhV42ZnDTZrM
IJMgAw/c8iWAx8Xm43geScgCHo9SRZeTDx64dy2olZW7iYaMd8gL4i/m6MwJiycq
qENRnQ497/EiYkhjTyrqynfRF5wMEMMMRLH6yHFgJIMzaeMB5vFr5ZCqPGzboFxr
QBL0V9v1nry9JnXeLNOH5z/WDooOqJR5lXsp/Ef6llxRSPlnfNNqQp3Ux9ix7IhN
vYOF8dt/O2GheCMn7QkS+Hwqk0nVnvQXUNwBWN6L+kIYwmE91X29NkjpdVchkhtR
GqflqEUupm7Wis7ekVUPLInw9JXGQBfI2odjq/5TJ9bCxjbCjPAnTrwLhgie9YO0
zKtCcBa5CrntRYGEv6eu3XYBlZi06A2bLCF2TXLhy/KbJYFZ5rY=
=0R1b
-----END PGP SIGNATURE-----

--fwu2w7fh5xwdofqc--

