Return-Path: <linux-i2c+bounces-14850-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1ECCE72AD
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 16:07:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 725143004BAE
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 15:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 048C8315D22;
	Mon, 29 Dec 2025 15:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="kZCRIvKK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF882264C0;
	Mon, 29 Dec 2025 15:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767020846; cv=none; b=Adtqll8PDxfu9IcEnAU6nXBEq32zVVCULUwf3GKlEnPNhR1PfQYFBIJBlag7gLiHCk2tdH4EjZbwwDl2TjPI76VhqVlhirQNKdwQFN/Z/gJlud7gTHZipL7bEb+n6nghIeOJQo8E0mab78PPvGIQKI/vIgQoUImeM+2w3HAGZUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767020846; c=relaxed/simple;
	bh=E/jni4isZrCEQAPhyAqDbsgZ6BCoOSNdY5v29xmilUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Py8xU2bm8JJ+pDY/a7NNUCZP2wyyyXSxoBL4UlONgB8VCQh8e9Wl488DURZZro/MD9ARZ00GukLbIO3PWN3/vipSyJC1HLmYLNgJChH8pz/n7xHhqhgK94f9svfeLMtrVy4xNHlMumYOLKAMeTvp73iuYdhNTf9VNbzCH4KTDhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=kZCRIvKK; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=r3xcQVlio1jAsYzH6bF2UOcPNsgAQ8fN2ZfKQURdl3I=; b=kZCRIvKKkVm1m36/YU+zN8rNvj
	xCLfp5trE+ZE9nJYUUQ4DWyF42Xy22kyakepBVvyiz2zhb0gsVcV14s2lCIIwBIkItslMCeCsjjho
	+n25CoOz67Mk05z+JLAU649JXXKUo35O06HzUYaeAcRPNfb5+eoXN9p7t7SDjvUSiZzSol4MPhwgt
	zAgNlR2qPJg+cHk6HC3ACWY/m3IP+C42uO6HeDSQB5TArDrWq+mWm4P2mIxi4ZZKOZv5+8cfu9+/P
	P9kpTEroZ+Y2bKuZK6uFHAzQC+pwlhWlxwKug8CYdwTScUQ1Y70cbGOBguzCXd1s1MbYo4DETCYZy
	FxnI5+Cg==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1vaEq4-00000003Mt9-0yLp;
	Mon, 29 Dec 2025 16:07:16 +0100
Date: Mon, 29 Dec 2025 16:07:15 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v5 2/2] i2c: spacemit: introduce pio for k1
Message-ID: <aVKZIwZf6_NJJRz8@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20251226-k1-i2c-atomic-v5-0-023c798c5523@linux.spacemit.com>
 <20251226-k1-i2c-atomic-v5-2-023c798c5523@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251226-k1-i2c-atomic-v5-2-023c798c5523@linux.spacemit.com>
User-Agent: Mutt/2.2.13 (2024-03-09)

Hi,

On 2025-12-26 11:31, Troy Mitchell wrote:
> This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
> enabling the use of I2C in atomic context.
>=20
> When i2c xfer_atomic is invoked, use_pio is set accordingly.
>=20
> Since an atomic context is required, all interrupts are disabled when
> operating in PIO mode. Even with interrupts disabled, the bits in the
> ISR (Interrupt Status Register) will still be set, so error handling can
> be performed by polling the relevant status bits in the ISR.
>=20
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> Changes in v5:
> - optimize code logic
> - refactor delay handling into spacemit_i2c_delay() helper
> - introduce spacemit_i2c_complete() to centralize transfer completion
> - rework PIO transfer wait logic for clarity and correctness
> - modify and add some comments
> - modify commit message
> - Link to v4: https://lore.kernel.org/all/20251009-k1-i2c-atomic-v4-1-a89=
367870286@linux.spacemit.com/
>=20
> Changes in v4:
> - refactor for better readability: simplify condition check and moving if=
/else (timeout/
>   wait_xfer_complete) logic into a function
> - remove irrelevant changes
> - remove the status clear call in spacemit_i2c_xfer_common()
> - sort functions to avoid forward declarations,
>   move unavoidable ones above function definitions
> - use udelay() in atomic context to avoid sleeping
> - wait for MSD on the last byte in wait_pio_xfer()
> - Link to v3: https://lore.kernel.org/r/20250929-k1-i2c-atomic-v3-1-f7e66=
0c138b6@linux.spacemit.com
>=20
> Changes in v3:
> - drop 1-5 patches (have been merged)
> - modify commit message
> - use readl_poll_timeout_atomic() in wait_pio_xfer()
> - use msecs_to_jiffies() when get PIO mode timeout value
> - factor out transfer state handling into spacemit_i2c_handle_state().
> - do not disable/enable the controller IRQ around PIO transfers.
> - consolidate spacemit_i2c_init() interrupt setup
> - rename is_pio -> use_pio
> - rename spacemit_i2c_xfer() -> spacemit_i2c_xfer_common()
> - rename spacemit_i2c_int_xfer() -> spacemit_i2c_xfer()
> - rename spacemit_i2c_pio_xfer() -> spacemit_i2c_pio_xfer_atomic()
> - call spacemit_i2c_err_check() in wait_pio_xfer() when write last byte
> - Link to v2: https://lore.kernel.org/r/20250925-k1-i2c-atomic-v2-0-46dc1=
3311cda@linux.spacemit.com
>=20
> Changes in v2:
> - add is_pio judgement in irq_handler()
> - use a fixed timeout value when PIO
> - use readl_poll_timeout() in  spacemit_i2c_wait_bus_idle() when PIO
> - Link to v1: https://lore.kernel.org/r/20250827-k1-i2c-atomic-v1-0-e59be=
a02d680@linux.spacemit.com
> ---
>  drivers/i2c/busses/i2c-k1.c | 297 +++++++++++++++++++++++++++++++++-----=
------
>  1 file changed, 225 insertions(+), 72 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index accef6653b56bd3505770328af17e441fad613a7..78a2de2c517e51e6ff997cc21=
402eb8f85054f85 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c

=2E..

> @@ -383,8 +424,134 @@ static void spacemit_i2c_err_check(struct spacemit_=
i2c_dev *i2c)
> =20
>  	spacemit_i2c_clear_int_status(i2c, SPACEMIT_I2C_INT_STATUS_MASK);
> =20
> -	i2c->state =3D SPACEMIT_STATE_IDLE;
> -	complete(&i2c->complete);
> +	spacemit_i2c_complete(i2c);
> +}
> +
> +static void spacemit_i2c_handle_state(struct spacemit_i2c_dev *i2c)
> +{
> +	u32 val;
> +
> +	if (i2c->status & SPACEMIT_SR_ERR)
> +		goto err_out;
> +
> +	val =3D readl(i2c->base + SPACEMIT_ICR);
> +	val &=3D ~(SPACEMIT_CR_TB | SPACEMIT_CR_ACKNAK | SPACEMIT_CR_STOP | SPA=
CEMIT_CR_START);
> +
> +	switch (i2c->state) {
> +	case SPACEMIT_STATE_START:
> +		spacemit_i2c_handle_start(i2c);
> +		break;
> +	case SPACEMIT_STATE_READ:
> +		spacemit_i2c_handle_read(i2c);
> +		break;
> +	case SPACEMIT_STATE_WRITE:
> +		spacemit_i2c_handle_write(i2c);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	if (i2c->state !=3D SPACEMIT_STATE_IDLE) {
> +		val |=3D SPACEMIT_CR_TB;
> +		if (i2c->use_pio)
> +			val |=3D SPACEMIT_CR_ALDIE;
> +
> +
> +		if (spacemit_i2c_is_last_msg(i2c)) {
> +			/* trigger next byte with stop */
> +			val |=3D SPACEMIT_CR_STOP;
> +
> +			if (i2c->read)
> +				val |=3D SPACEMIT_CR_ACKNAK;
> +		}
> +		writel(val, i2c->base + SPACEMIT_ICR);
> +	}
> +
> +err_out:
> +	spacemit_i2c_err_check(i2c);
> +}
> +
> +/*
> + * In PIO mode, this function is used as a replacement for
> + * wait_for_completion_timeout(), whose return value indicates
> + * the remaining time.
> + *
> + * We do not have a meaningful remaining-time value here, so
> + * return a non-zero value on success to indicate "not timed out".
> + * Returning 1 ensures callers treating the return value as
> + * time_left will not incorrectly report a timeout.
> + */
> +static int spacemit_i2c_wait_pio_xfer(struct spacemit_i2c_dev *i2c)
> +{
> +	u32 mask, msec =3D jiffies_to_msecs(i2c->adapt.timeout);
> +	ktime_t timeout =3D ktime_add_ms(ktime_get(), msec);
> +	int ret;
> +
> +	mask =3D SPACEMIT_SR_IRF | SPACEMIT_SR_ITE;
> +
> +	do {
> +		i2c->status =3D readl(i2c->base + SPACEMIT_ISR);
> +
> +		spacemit_i2c_clear_int_status(i2c, i2c->status);

Do we actually need to clear the interrupt status even if none of above=20
bits are set? Said otherwise, can we move this line after the if and=20
before the handle_state?

> +
> +		if (!(i2c->status & mask)) {
> +			udelay(10);

It seems that the poll delay elsewhere in this patch is 30 =C2=B5s.=20
Maybe use a consistent value.

> +			continue;
> +		}
> +
> +		spacemit_i2c_handle_state(i2c);
> +
> +

Please delete the extra blank lines here.

> +	} while (i2c->unprocessed && ktime_compare(ktime_get(), timeout) < 0);
> +

Otherwise it sounds good, thanks for the changes.

Regards
Aurelien

--=20
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

