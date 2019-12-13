Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0611711E4DF
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2019 14:48:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727516AbfLMNrv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Dec 2019 08:47:51 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:51899 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726524AbfLMNrv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 Dec 2019 08:47:51 -0500
Received: by mail-wm1-f67.google.com with SMTP id d73so6441682wmd.1;
        Fri, 13 Dec 2019 05:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jVjtvPjTqqfiwFuP1hQNQHB84DjsEMm03rL1vowSzlM=;
        b=kt2PtCMM5a2pWIm1sMNfZNonRFfJ+y83+3GLrdLul2sh2pnZEuzIfpDlLez38xGF0C
         gsjYnMyoo4oesaYFEuzILr9bxqu4lSyiLjBQEbStq6B7D8eHpnSh9yEvrX0fnb97rHYu
         jmzYtIKVhFUXVo7BPZ/TIBAUDWSM5PhJXFW806CDxsgLITVLhpfrWCHexRjbo1B7FVuJ
         GylZIE/DtmHWDvr77f6qIwetJzdMLzcWFjuGgQYQJANN9yjCPpioA3fLGWGHUp0xIchU
         iamew9qt3PPNCMPxsRfjCsrX+y9QeIAoHxDc/wlcFD3TS25DTRDSOoKVXBeXSy6XceWp
         4oLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jVjtvPjTqqfiwFuP1hQNQHB84DjsEMm03rL1vowSzlM=;
        b=smnSzVsmN8/iUqc0wzUGi8L7iRSpLvSI1gyL3SXXkEoc6xU66S80S+g5uctwDfFkTE
         5GSqZ49AIG+mIzQliJOxWj6MvwqIbOZS79DVZf1wltr2y8U0REjx38+RZQK6gr+npdNy
         Un35RmzUz0wMPVuG1RLrrm14jL47gZyqsRUEHcTYsvErCYpv2WDicWWdCn5u1dCzH0R8
         VII7dcIBd3irBVhdD8mFR/ECLIptp7xUdBIDY0TJNo//VfZJUfzEIkajPj4eUP5cLdGy
         m+MdEgEVe5rrqCbjOtvgHSHLRU4qEEWcKeSUYUjyv7HvyDJAi03VXOod3gD44mQH+t2q
         SWyA==
X-Gm-Message-State: APjAAAURBnmV23CEMwcizyTcfMLLjyCDkL4fUjfXoOWqov/nDfbYMz3C
        VT9golUPJDJCsTZ7/IPKEPU96Si9
X-Google-Smtp-Source: APXvYqzamqlXoXnM936cfqC+1u+klfrne2Kt0bhX0Ariz4JbA0JlFjfklX8sQr6ck1eVgrtVxm1L1w==
X-Received: by 2002:a1c:9ec6:: with SMTP id h189mr13619213wme.28.1576244868360;
        Fri, 13 Dec 2019 05:47:48 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id b17sm10124570wrp.49.2019.12.13.05.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 05:47:46 -0800 (PST)
Date:   Fri, 13 Dec 2019 14:47:46 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] i2c: tegra: Fix suspending in active runtime PM
 state
Message-ID: <20191213134746.GA222809@ulmo>
References: <20191212233428.14648-1-digetx@gmail.com>
 <20191212233428.14648-4-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Content-Disposition: inline
In-Reply-To: <20191212233428.14648-4-digetx@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2019 at 02:34:28AM +0300, Dmitry Osipenko wrote:
> I noticed that sometime I2C clock is kept enabled during suspend-resume.
> This happens because runtime PM defers dynamic suspension and thus it may
> happen that runtime PM is in active state when system enters into suspend.
> In particular I2C controller that is used for CPU's DVFS is often kept ON
> during suspend because CPU's voltage scaling happens quite often.
>=20
> Note: we marked runtime PM as IRQ-safe during the driver's probe in the
> "Support atomic transfers" patch, thus it's okay to enforce runtime PM
> suspend/resume in the NOIRQ phase which is used for the system-level
> suspend/resume of the driver.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

I've recently discussed this with Rafael in the context of runtime PM
support in the Tegra DRM driver and my understanding is that you're not
supposed to force runtime PM suspension like this.

I had meant to send out an alternative patch to fix this, which I've
done now:

	http://patchwork.ozlabs.org/patch/1209148/

That's more in line with what Rafael and I had discussed in the other
thread and should address the issue that you're seeing as well.

Thierry

> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegr=
a.c
> index b3ecdd87e91f..d309a314f4d6 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -1790,9 +1790,14 @@ static int tegra_i2c_remove(struct platform_device=
 *pdev)
>  static int __maybe_unused tegra_i2c_suspend(struct device *dev)
>  {
>  	struct tegra_i2c_dev *i2c_dev =3D dev_get_drvdata(dev);
> +	int err;
> =20
>  	i2c_mark_adapter_suspended(&i2c_dev->adapter);
> =20
> +	err =3D pm_runtime_force_suspend(dev);
> +	if (err < 0)
> +		return err;
> +
>  	return 0;
>  }
> =20
> @@ -1813,6 +1818,10 @@ static int __maybe_unused tegra_i2c_resume(struct =
device *dev)
>  	if (err)
>  		return err;
> =20
> +	err =3D pm_runtime_force_resume(dev);
> +	if (err < 0)
> +		return err;
> +
>  	i2c_mark_adapter_resumed(&i2c_dev->adapter);
> =20
>  	return 0;
> --=20
> 2.24.0
>=20

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3zln8ACgkQ3SOs138+
s6Hf9w/9HOu9U+CgVU21E6/qFJ3vw2/n8AgoS8/lzIMxeosqFW1Nn/FapcBw+Z1a
TmkffpQA0QizAPmo3iqNJG+8ERFPxQ/gJyN4dhmK1HX5wGFv/HznnJRolhhZNybG
HcssDdi8WT6L8PvSSeVxwINp7bTQXd8jHh6B9fA3QfFAvr04QS2TurqO5yd8JKmT
1PpwaWeZ0HY9XLftLUr/gmkn7yYZwaD1uEXzsHsFDPw/HpXOrDKjzKo9r6KLWqpU
KCKEnqqnBQ8IznUDjbBMNg8YkgvoFQLAdStvaC7QXAtw1s6CY2QC8GzHngZU2z6d
2d6ST77UQEflJM7lRRbKzQXxpkS84zR40eRECmFQi/rJjD6YVIGr5rnYqtPy/Ek8
gBAEsPiAd8JQE9fHELVvHeVBYWSruaz4O7CJ5wNjxJ+jOVWz40bc1eEkShy6fBCo
zUw3A/6S+FPfO+D4n5UEw6DbvLU+4tlWn7SUyBauguPCItE0Gq+B1bd2dJS/Fiyn
Pnbzi3LsDcQnqVtMbbpHdWjduHkMw+/qdV4lKyo1B0E8ePEdtSgRcbRdD3eTUwNj
RhL/C9NEcmOCQpZUckvmZBj0a35Q76UNlRvQeLjypQU2RK2wm/Mk6HGpklBFi1Ur
h5BueJ/e4hVdF+ozrGEjiKjZsL0saF1gpC84UAp+yYimc1Z+w0c=
=+kDV
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--
