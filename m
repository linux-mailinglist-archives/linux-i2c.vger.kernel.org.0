Return-Path: <linux-i2c+bounces-1120-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5C58246CE
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jan 2024 18:04:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00ADC287C24
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jan 2024 17:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABAA72555C;
	Thu,  4 Jan 2024 17:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X+U4cZM/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C63425550;
	Thu,  4 Jan 2024 17:04:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFE5BC433C8;
	Thu,  4 Jan 2024 17:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704387852;
	bh=NRJexN6VwGPs36D7qqe8cb4lnZNM38wLpxTLgdfCEZ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X+U4cZM/7Tj1bP8WBpsaQuB2IdIoWzs7doufaTmOqZrv6DuiIOwbSqxUcGboKslJl
	 zHRzYlNVXNSUG3u65IZcu6Coc99NzxdHOVCr7VNfoq/vbemU7vrqQeSMlCyVdMdN4G
	 pKNo4qhmN1AeMpGug+ka7hDOAJKmr22RARGNOuJXUX9EDnrw7KQQGHX4I9peiPG6xK
	 6a6zr5yzgHuJOlX0QEqwI82r/z/cLiEg7wxiWM2CMWsfXxnmI9KGL3+SXLwd2qWADg
	 WQG9gDv+Ekn1qsREjCES8NoZ7Ezx2mr2XgCmEd1BnBXTIAmHvYeUJ0RI2qUlnxT1s0
	 lB7J4jbfnGheg==
Date: Thu, 4 Jan 2024 18:04:08 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Benjamin Bara <bbara93@gmail.com>
Cc: Lee Jones <lee@kernel.org>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	peterz@infradead.org, mwalle@kernel.org,
	Tor Vic <torvic9@mailbox.org>,
	Erhard Furtner <erhard_f@mailbox.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Benjamin Bara <benjamin.bara@skidata.com>, stable@vger.kernel.org
Subject: Re: [PATCH] i2c: core: Fix atomic xfer check for non-preempt config
Message-ID: <ZZblCO9li-TMSOKV@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Benjamin Bara <bbara93@gmail.com>, Lee Jones <lee@kernel.org>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	peterz@infradead.org, mwalle@kernel.org,
	Tor Vic <torvic9@mailbox.org>,
	Erhard Furtner <erhard_f@mailbox.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Benjamin Bara <benjamin.bara@skidata.com>, stable@vger.kernel.org
References: <20240104-i2c-atomic-v1-1-a3a186f21c36@skidata.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XMiTFXgN4YJXP0Up"
Content-Disposition: inline
In-Reply-To: <20240104-i2c-atomic-v1-1-a3a186f21c36@skidata.com>


--XMiTFXgN4YJXP0Up
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 04, 2024 at 09:17:08AM +0100, Benjamin Bara wrote:
> From: Benjamin Bara <benjamin.bara@skidata.com>
>=20
> Since commit aa49c90894d0 ("i2c: core: Run atomic i2c xfer when
> !preemptible"), the whole reboot/power off sequence on non-preempt kernels
> is using atomic i2c xfer, as !preemptible() always results to 1.
>=20
> During device_shutdown(), the i2c might be used a lot and not all busses
> have implemented an atomic xfer handler. This results in a lot of
> avoidable noise, like:
>=20
> [   12.687169] No atomic I2C transfer handler for 'i2c-0'
> [   12.692313] WARNING: CPU: 6 PID: 275 at drivers/i2c/i2c-core.h:40 i2c_=
smbus_xfer+0x100/0x118
> ...
>=20
> Fix this by allowing non-atomic xfer when the interrupts are enabled, as
> it was before.
>=20
> Fixes: aa49c90894d0 ("i2c: core: Run atomic i2c xfer when !preemptible")
> Cc: stable@vger.kernel.org # v5.2+
> Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>

Thanks! The code looks what I also would have suggested reading the bug
reports. So:

Applied to for-current, thanks!

> +	/*
> +	 * non-atomic xfers often use wait_for_completion*() calls to wait
> +	 * efficiently (schedule out voluntarily) on the completion of the xfer,
> +	 * which are then "completed" by an IRQ. If the constraints are not
> +	 * satisfied, fall back to an atomic xfer.
> +	 */
> +	return system_state > SYSTEM_RUNNING &&
> +	       (IS_ENABLED(CONFIG_PREEMPT_COUNT) ? !preemptible() : irqs_disabl=
ed());

I removed the comment, though. I don't think it explains the following
code well enough, i.e. why we have a decision based on a Kconfig
symbol. We can (and should) fix this incrementally, though. I hope this
is OK with everyone.

Thanks to everyone putting work into this. Much appreciated!


--XMiTFXgN4YJXP0Up
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWW5QIACgkQFA3kzBSg
KbYQKg//eYli7Hwwc1K5si3RHLD2tT4bGbnWMiBo4YpaSANRwunI7CnwLyTw+8Yr
VDVstpqCucFlNqTf+khRscO6WHS9TSrwG4CK3FC1r9LuxEOuu7F/SBWiBkpAYIDZ
2xhNEdmkBGodqjkSgwFwrBhexVxQO8Fa4nEyULAoTzjCNSbVe5IsZ8MSVQjthMyQ
06hJTnEFKi9hAYSVQhaGhaieACZVLlBk4oR0AwM7SF/i48MnC9ZbGJo8VjBGVJs4
9m+gilxW+Io93ln1tZVoNFczhj1DMdAO+vJbj8kybE48I8r7uaEbUoJeNUoLvU2o
D1eHhEBzsvWKix0TQRYcOCd0BkLwfK7YJ4RwMSjmFt4uj1hM1WsroYxIrJrmbjNl
mGI3pstU54APNxeO2BwimsUXtlSsXMTbUPy77KC6og01kp6ndeBMGZNdZbRErqvM
RE2knvP93U8Ne6lcTAwvoavy0YZZopSuB3RB75UVn318Ojx/wzTbGjEwBlSuK12y
Tz+b+VpVM9IDV2Y8YsLmc3cXoaYgvYenGshqNQU8Ky5AlAkvRUdkGqe3EER9TGNG
LeJ0yoHUn5ZPEQ+O2NVu0OFX9NZ4pHy2G2AQW+2deFRznkVC/4UFxSi1WTXLurOe
60C3j4fpOWc2sYlqb3iClM3Qfi7I04nqu225kgMCRuvav1PQwTw=
=Y/2l
-----END PGP SIGNATURE-----

--XMiTFXgN4YJXP0Up--

