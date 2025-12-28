Return-Path: <linux-i2c+bounces-14803-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE65CE4AD1
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Dec 2025 11:34:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B18E300C0F9
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Dec 2025 10:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CD852C11E8;
	Sun, 28 Dec 2025 10:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lUOYiB2k"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69FF28CF7C
	for <linux-i2c@vger.kernel.org>; Sun, 28 Dec 2025 10:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766918096; cv=none; b=WpVvxg/1B6p6Boq85vZQ3U2xp36wsy8mDaOzHl1LI9le2RBvJskTw21rWWfu58SC0sUu7NV+7kNAHskgBc5PccSldY/CPTIlN+B5FL7v6LxQI5DaTXdKhHXqJc1Jdp7YmCA9/A1fx6bMRXK29VrzCbuGclZPQsGMNFK1McsGDIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766918096; c=relaxed/simple;
	bh=NXvI+P5VpbmmE59nTCwRvFpwVBPrE4C+iM7ziryf0Vo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KKZA1hlU1p46maEqc7Go+FJag8nUGLIwHBfgvN1CcPYLZXvMPxWdBI9OAi1jT07rRpGvs15p3rtyDX7PFZ57+G/TWItwscRMMAA5xTagt6TfJyrYbSbzUnOwpMZfhW/6crw+ZXOsqIaH9tuMhw36OZ9YJ0uJY1IBBwm+56Y+0/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lUOYiB2k; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-37bbb36c990so80473071fa.0
        for <linux-i2c@vger.kernel.org>; Sun, 28 Dec 2025 02:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766918093; x=1767522893; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2JxxmkTi4FGoSoE6oHcsfNmtpGy25wMUBs6fj3QNMwA=;
        b=lUOYiB2k1tzx4FVu9mSsSqp9eCkxePi2cDrfaIR0QIqEaV8Uyf1lXVaFoLZKUPNNGg
         EJV5iK5AWc8xAeqJlhuzTBPujHAIu9BaOy5Wjl2H+F2V4w3/IM97Zf3e6gIv99rMuT1h
         v2hYqTqcuzF1ax1p8jK5DWayuLctWtq9eWC/spKUqjlDaJ5x1IVelyyHw5MXhaZy71Ia
         KLl4dA2LkdWlrg5Ig1Wsb/fH9azcbvj0orBHc1fFip4Trn043HQt86Mh018qxPZNj/lV
         7mCz0dBO4VTtrTM2P6VKLLZeyakiUwk5926Ogqk2RQ4uA5Kfu60PckU24zGwzM2sz8jz
         rsfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766918093; x=1767522893;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2JxxmkTi4FGoSoE6oHcsfNmtpGy25wMUBs6fj3QNMwA=;
        b=B9G2OTVkT6kyTmjVSTj9WMskrKPI49Cbx8CUJa34xOCvGNW8xAdl/w0LmzriGTOESv
         1rrKgGQk5jjmu7JRTqbZ+aa2RUeVVbjmtzaIiNjQ9Vkpfi0jPR7QmX6V5JfjaEjOk6PS
         eX75el6xPxtW5Wq5rJoqHB/KYOu0rVw54bRhshX6FmtMlg7GN41ThsPx3OOSUdKCobtY
         rjAl4A3mfZlKn+b0EyoF1eA57HRQkOtUBONaxwScRqdGW2jt9eTlKw5uztGBnrcUJkDc
         F9sX9EQ8uSLYK+u/q7leTlJIdNWDZih80SVYJUb+KrfMRjf4BzA8FRb21JX8lZbQo4um
         sA6g==
X-Gm-Message-State: AOJu0YwpcIDlnZ98IJu0G6i8yZD54ODo8yIkqbC/8D5XSiGZYnoim7WO
	/vNuPtVlHaElQivUqsK/w4yoU7kI5y2O7/Ly9ID+vsmug56MKAyfjhBG
X-Gm-Gg: AY/fxX4yJUcT6S7ztvjlOk7cjYtu1KLK6qvLz6jg9RZpqVSWF6LyknkkLjy4RQVITaT
	h02EhpPuaSiSblRa1D56UPvj6e/6K9k9JCIsDdCwV28h9XL6VUdZnyHQcjqI7j38ezEN9+lnH5e
	a+KobrUsiXjn4IRdtPgfQo5VhU2584K4t8cocNrJxRZ81EXWD9Ufz4l+LacR7fiKP63B0wLhNzq
	V2wmJJKYJGmbWl5bQYOtXbwN1EeG6mGFsT3oY7bsZDOFBxzye96mZyYDmy3wzflwHE9ginph9TY
	E2puBH/eegBKkQMbZ+uf1TWAp5Le5cqTI3KvlkJUon3Jt6ZG8bmvfDIV7uNdE+sQc94Oz1EF7V6
	GEM1aFYAY5xCIEpadjo6DzL3yVy1wstlhF7xGlozzT9dTCu7l3FYhYmHbmeijIN+eUokhb9Dqv8
	S5/Jgz5HaMMqyAlnYBcscnWal9mVTmudwLyDJsCoiaS/07bkGe
X-Google-Smtp-Source: AGHT+IGnORvckzTpLa52QolfTAqA8mGzGUAPMaAuOTsKJD+KE4VlIltzyntZT3IUZ+4D/FxrPPT7lA==
X-Received: by 2002:a05:651c:1506:b0:378:f3b6:f762 with SMTP id 38308e7fff4ca-3812079a3c5mr84928361fa.8.1766918092714;
        Sun, 28 Dec 2025 02:34:52 -0800 (PST)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812251b2b0sm75897681fa.18.2025.12.28.02.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 02:34:50 -0800 (PST)
Date: Sun, 28 Dec 2025 11:34:49 +0100
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RESEND v3 0/5] I2C Mux per channel bus speed
Message-ID: <aVEHyUsijrnFUWfD@gmail.com>
References: <20251202-i2c-mux-v3-0-877dcf478a9f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7rFkj6zIm9eFzZmB"
Content-Disposition: inline
In-Reply-To: <20251202-i2c-mux-v3-0-877dcf478a9f@gmail.com>


--7rFkj6zIm9eFzZmB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 02, 2025 at 09:09:47AM +0100, Marcus Folkesson wrote:
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

Ping on this series.

Best regards,
Marcus Folkesson

--7rFkj6zIm9eFzZmB
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmlRB8MACgkQiIBOb1ld
UjKa/w/9EMK7/UO6JtAlL56xG5HWlpyOxFHWUAO9UIWno2hVyQynqNH4v7diLRBc
BsDhmURF6cuyUB+vmhczfA4CKXRSPiVju8mWMBu4XP4s3hGg7HTIezwxIFUwGHWN
hsLRWYFIJXcxXmM+kc0/GUdxKtZnB/LtB/vBtt/hP1PqCy2PXgDoohrRoziudpcC
c2WfApN1ouNEWggVNlvHLYks+IKY/KDDRU8K00uhqLtVLeBeHXZbn2l2U3vBAxw9
UFjBGOTCIlSHKOQ9WXOqBo0UkiAsgAokWVn2RQ31NJHkBZpW8U/XYeYPIbjulUB8
V8FRwEy1az7dPIGRybgl1OA3DSQxxI76KMBoUZCWXRxZUKtnVoOd72b//TUvsJ7C
wtdRjslcTWInxdOS3n+muvaH+oOHuoUw1lidEJWF5V0z840VPFDl/IJHETIRj0AP
9EWrz2bPlMQYi8WcwKmKmpTybU9cytA5N1uaOHUKKqYDhAFT+TQ8zAXvPN4tQJgR
Kt5hJ+TxtzU7mHp/Q18K1T6V/Mp0SGAhysNdjEUzgSEyngN462tirHrIRIqQ54Y9
iSUkIx3faPeQOttSzlwrW68gVxhqb+m/CGR0oLFtQ4J1gC+qP8dghQ2+NCQImIYd
JdFL5CaaSBphpsbYDgDL1Is5APPRoURE5zCqzmqBgwyemOQXUY0=
=kP3i
-----END PGP SIGNATURE-----

--7rFkj6zIm9eFzZmB--

