Return-Path: <linux-i2c+bounces-13970-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEEAC383BF
	for <lists+linux-i2c@lfdr.de>; Wed, 05 Nov 2025 23:46:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37BAD18955BC
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Nov 2025 22:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E05A2F1FD0;
	Wed,  5 Nov 2025 22:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="JcyOecms"
X-Original-To: linux-i2c@vger.kernel.org
Received: from hall.aurel32.net (hall.aurel32.net [195.154.113.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732832F069E;
	Wed,  5 Nov 2025 22:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.113.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762382651; cv=none; b=S+zsQRFtH11h8EjQnhZqIAhoxKHidB5Lxh6+Vre2dRRiYZhMZxyUTAHu4ATshXWyvmeYjcwcRh4ZrVLD75nl7OIdaYZ6+sTVTw7y4luMfs1vwwFMw75knRImdqF4Kp0PEhsLl6eyFvXtu+LtXlpGtzrHaDLfpaGUhyrVTvTN9kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762382651; c=relaxed/simple;
	bh=HJJ+Z6Pcc4eCNf8/RJk1ipVnGmaqj1iMMsHBL1HQYms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lXSxgptsic8vLJy5slO7QthwwDIfFyl2VNKkRS08S6126Y7bXF+ycBH/DgrHVZJsmrPWg2IX5zSvC4mpTZgpfqpD3TPN9LKJ6cPy5PDgNvVHFiwsneT/JYA4MqWFIs4bpEys5YfWxNrZqM8/XLKkE1M/s/jEtiwbiNTzFmqp+/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=JcyOecms; arc=none smtp.client-ip=195.154.113.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=Rcz9OHWqrkXIvtIUBV6foEU7yY/XR+LTCfFnMpPJAWE=; b=JcyOecmsyvuctmYcsfL2VURPJK
	ARZA57NqLJM1Ls3zX/oV0/jnhV3xqV+9A9+AobFBMu59TamRLLipjY2jBF3lD6gmQbInegLZgpyqu
	tlr9NXjnD35fCY3OLg1rNI/UQLcoWFVCJ45WI2DheKW8eVjmJFjvirLCoFoHEwf2MIqYqpkR5zQSH
	QkParKIUeN3oBmYzXuuJE67Q3UJ3i2yPy9JqWQoLyeQCyFIs53aEmri0981o+Ggw3BmTq/E9JBsge
	xi1GRtVCPhTbr/5sjrAtlCodfVSifq8FI3wJ25vkOkXK2VGJSb6PQ2/9MIL5bhdVpn4H0icoBpcI/
	SRvJiNXQ==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1vGmES-0000000AfjF-2E3C;
	Wed, 05 Nov 2025 23:44:00 +0100
Date: Wed, 5 Nov 2025 23:44:00 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH] i2c: spacemit: fix detect issue
Message-ID: <aQvTMM0S16gOdiAN@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20251103-fix-k1-detect-failure-v1-1-bb07a8d7de7c@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251103-fix-k1-detect-failure-v1-1-bb07a8d7de7c@linux.spacemit.com>
User-Agent: Mutt/2.2.13 (2024-03-09)

Hi,

On 2025-11-03 15:06, Troy Mitchell wrote:
> This commit addresses two issues causing i2c detect to fail.
>=20
> The identified issues are:
>=20
> 1. Incorrect error handling for BED (Bus Error No ACK/NAK):
>    Before this commit, Both ALD (Arbitration Loss Detected) and
>    BED returned -EAGAIN.
> 2. Missing interrupt status clear after initialization in xfer():
>    On the K1 SoC, simply fixing the first issue changed the error
>    from -EAGAIN to -ETIMEOUT. Through tracing, it was determined that
>    this is likely due to MSD (Master Stop Detected) latency issues.
>=20
>    That means the MSD bit in the ISR may still be set on the next transfe=
r.
>    As a result, the controller won't work =E2=80=94 we can see from the s=
cope that
>    it doesn't issue any signal.
>    (This only occurs during rapid consecutive I2C transfers.
>    That explains why the issue only shows up with i2cdetect.)
>=20
> With these two fixes, i2c device detection now functions correctly on the=
 K1 SoC.
>=20
> Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> I checked the vendor version driver and tried commenting out
> spacemit_i2c_clear_int_status() that runs before xfer starts.
> Surprisingly, i2cdetect stopped working as well.
> ---
>  drivers/i2c/busses/i2c-k1.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index 6b918770e612e098b8ad17418f420d87c94df166..37828323317770ae2f0522d21=
3dca67342ae166f 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -160,7 +160,8 @@ static int spacemit_i2c_handle_err(struct spacemit_i2=
c_dev *i2c)
> =20
>  	if (i2c->status & (SPACEMIT_SR_BED | SPACEMIT_SR_ALD)) {
>  		spacemit_i2c_reset(i2c);
> -		return -EAGAIN;
> +		if (i2c->status & SPACEMIT_SR_ALD)
> +			return -EAGAIN;
>  	}

This makes the resulting code, while correct, complex to understand as=20
it is now two really different errors, as you explained well in the=20
commit message.

I therefore suggest to organize the code as:

	/* Arbitration Loss Detected */
	if (i2c->status & SPACEMIT_SR_ALD) {
		spacemit_i2c_reset(i2c);
		return -EAGAIN;
	}

	/* Bus Error No ACK/NAK */
	if (i2c->status & SPACEMIT_SR_BED) {
		spacemit_i2c_reset(i2c);
	}


>  	return i2c->status & SPACEMIT_SR_ACKNAK ? -ENXIO : -EIO;
> @@ -491,6 +492,8 @@ static int spacemit_i2c_xfer(struct i2c_adapter *adap=
t, struct i2c_msg *msgs, in
> =20
>  	spacemit_i2c_init(i2c);
> =20
> +	spacemit_i2c_clear_int_status(i2c, SPACEMIT_I2C_INT_STATUS_MASK);
> +

This sounds good to start the transfer with a clean interrupt state. I=20
just wonder if it should be moved to spacemit_i2c_init(), ie where the=20
corresponding interrupts are enabled.

>  	spacemit_i2c_enable(i2c);
> =20
>  	ret =3D spacemit_i2c_wait_bus_idle(i2c);

Anyway:

Tested-by: Aurelien Jarno <aurelien@aurel32.net>


Regards
Aurelien

--=20
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

