Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 161C9355C92
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Apr 2021 21:54:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234547AbhDFTy2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Apr 2021 15:54:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:59954 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233018AbhDFTy1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Apr 2021 15:54:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F2AAB613B8;
        Tue,  6 Apr 2021 19:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617738859;
        bh=25ULw3TRgMm3UNuExmKYaO/DK9UkholrM5ZS8OqPuj0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kUQOxf8NdNC4hX/NzA5uGhEeRHK9VNh9GlnhcRB1wnSehVRKjvvlggO7VO8M91GRY
         2VusDJv+iVFZtQr2zZnapxPcAaQoBjy3C3Suos4fdCXUhxoTwo/HY83DhWxHAY/7oe
         dQGPoFZu+Kr2C0j3m62tc/OmNq59J2PdaQkj1In/aV6Vwo9tjk7Xs/QU+fUiXe0hl/
         7h8MVmFReeOZp9nVqOrJIi9ABkunKI3Qg0uA2pGujpGin6dJhOYmdXj33NoXc+UppB
         ZGmUzlTfRlVYe1qRDUuQ/D6i8wrgjtFii4LFVHFtxYRD+8u38jKJP7B+C2qYuCf9vy
         blESEQJX6EWFg==
Date:   Tue, 6 Apr 2021 21:54:14 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Yicong Yang <yangyicong@hisilicon.com>
Cc:     andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
        Sergey.Semin@baikalelectronics.ru, linux-kernel@vger.kernel.org,
        digetx@gmail.com, treding@nvidia.com,
        jarkko.nikula@linux.intel.com, rmk+kernel@armlinux.org.uk,
        song.bao.hua@hisilicon.com, john.garry@huawei.com,
        mika.westerberg@linux.intel.com, prime.zeng@huawei.com,
        linuxarm@huawei.com
Subject: Re: [PATCH v6 2/5] i2c: core: add api to provide frequency mode
 strings
Message-ID: <20210406195414.GG3122@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Yicong Yang <yangyicong@hisilicon.com>,
        andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
        Sergey.Semin@baikalelectronics.ru, linux-kernel@vger.kernel.org,
        digetx@gmail.com, treding@nvidia.com, jarkko.nikula@linux.intel.com,
        rmk+kernel@armlinux.org.uk, song.bao.hua@hisilicon.com,
        john.garry@huawei.com, mika.westerberg@linux.intel.com,
        prime.zeng@huawei.com, linuxarm@huawei.com
References: <1617197790-30627-1-git-send-email-yangyicong@hisilicon.com>
 <1617197790-30627-3-git-send-email-yangyicong@hisilicon.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Qf1oXS95uex85X0R"
Content-Disposition: inline
In-Reply-To: <1617197790-30627-3-git-send-email-yangyicong@hisilicon.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Qf1oXS95uex85X0R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index 10bd0b0..7268180 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -47,6 +47,26 @@ typedef int (*i2c_slave_cb_t)(struct i2c_client *clien=
t,
>  #define I2C_MAX_HIGH_SPEED_MODE_FREQ	3400000
>  #define I2C_MAX_ULTRA_FAST_MODE_FREQ	5000000
> =20
> +static inline const char *i2c_freq_mode_string(u32 bus_freq_hz)
> +{
> +	switch (bus_freq_hz) {
> +	case I2C_MAX_STANDARD_MODE_FREQ:
> +		return "Standard Mode (100 kHz)";
> +	case I2C_MAX_FAST_MODE_FREQ:
> +		return "Fast Mode (400 kHz)";
> +	case I2C_MAX_FAST_MODE_PLUS_FREQ:
> +		return "Fast Mode Plus (1.0 MHz)";
> +	case I2C_MAX_TURBO_MODE_FREQ:
> +		return "Turbo Mode (1.4 MHz)";
> +	case I2C_MAX_HIGH_SPEED_MODE_FREQ:
> +		return "High Speed Mode (3.4 MHz)";
> +	case I2C_MAX_ULTRA_FAST_MODE_FREQ:
> +		return "Ultra Fast Mode (5.0 MHz)";
> +	default:
> +		return "Unknown Mode";
> +	}
> +}

Any reason ehy this is an inline function? My gut feeling says it would
be better added to the core?


--Qf1oXS95uex85X0R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBsvGYACgkQFA3kzBSg
KbYCQA/+PdT6HVc/TnzGzmFsTSdFke1JlOrp/s6hCmRd/o5jLfbqm5csefgkiKpc
A7EmrpisZtmzUSMhPgTbfjTnb4/FReCwc9cSljFAVv962tPFtKXDgJPtfMVrIMWo
xjeHJk/pXNvTYH518vCzCoCzDETcY3J74rddiUjug7EV34/R//UpLfSA21DphCfd
y0rd9cPyMeXvCeTJeCnltzU9TcM2RuCHrG9BibxXOiX875c++L5kZsMX77v5LolL
lf2h2m++TxqcTu/bs9+LoS1UkrSWYJsQ6GsV/QSM//T+Y1uqoj2JppDMnI07GoXW
UMeK9C/nQASvvkYHrG1eTj6OzaA5ucMa1oBVh3i7LP+uRRSIY6Iy72rbdiUm2DAj
zjVtdEW3uy9r9HgCe5gChLkb3OJLxW0elHk2ZYqpp9aYzuhYpsoOr/lHOtszdadw
GTe8msD+XaqjNPm2LaXNbOYYMIYdfzn3B5DrjivlSyq9TdYr22cmuXvAcvpvLdmk
QPhpwj5x+r++ipOeuk1M/AbF7srYmA24BXg4PQYcipNviO2j1na4LcktBRqra62Z
5C5R6tHApO30CFi4J6ueGB4PVl/qG2AK3krudOCjdUFK+4olbk2/4HHMQHbpBas4
f6pfiaNVXwKTIUpB3rVsdtVG1t9PlCRAC019f+fUSLGs9Gs2pX4=
=jouF
-----END PGP SIGNATURE-----

--Qf1oXS95uex85X0R--
