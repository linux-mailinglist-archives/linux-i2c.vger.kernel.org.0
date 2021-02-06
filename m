Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8368B3119E6
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Feb 2021 04:25:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231314AbhBFDWw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 Feb 2021 22:22:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:42598 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230332AbhBFDL5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 5 Feb 2021 22:11:57 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 737AB65017;
        Sat,  6 Feb 2021 01:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612574169;
        bh=47TCTpDoco8sYPN7xESPWiOcB3X4kzZp/SX8nMmphNw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SPqxf/zkGL+RVQJqGA9xo1BoHI+L+SmO9mNtCtQiXyLK2gtd6qi1V0o+xGmilpoVf
         UAsY3V5A2QurZ7YpfI3NhfPaA0Y37i+mvmNNGskebCMiDlkRa4btqO9zGNwg7YkMkF
         n2sXFSLejuqY2l9IVv4D2Wu4anm3DOBp58zJm/EOQiM+dvKczYgflrdlgJZVwjzJY9
         wCAlTa/WVY6g+/frOXmbC+LfFV/AcZsIeE6uPROLMijYolperSDOn49abTJhzob9v3
         Y63H3U7dcjLcyIS399x6SN1mxl79TexRr1BGYYi4cWs/t8GOM2SJ67wfeomgAFARNK
         uUa10TkSnSPtA==
Date:   Sat, 6 Feb 2021 02:16:01 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Mark Jonas <mark.jonas@de.bosch.com>
Cc:     Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, Adam.Thomson.Opensource@diasemi.com,
        stwiss.opensource@diasemi.com, marek.vasut@gmail.com,
        tingquan.ruan@cn.bosch.com, hubert.streidl@de.bosch.com
Subject: Re: [PATCH v3] mfd: da9063: Support SMBus and I2C mode
Message-ID: <20210206011601.GA3847@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Mark Jonas <mark.jonas@de.bosch.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, Adam.Thomson.Opensource@diasemi.com,
        stwiss.opensource@diasemi.com, marek.vasut@gmail.com,
        tingquan.ruan@cn.bosch.com, hubert.streidl@de.bosch.com
References: <20210205155006.130458-1-mark.jonas@de.bosch.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Content-Disposition: inline
In-Reply-To: <20210205155006.130458-1-mark.jonas@de.bosch.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +	if (i2c_check_functionality(i2c->adapter, I2C_FUNC_I2C)) {
> +		dev_info(da9063->dev, "I2C mode");
> +		busmode = 0;
> +	} else {
> +		dev_info(da9063->dev, "SMBus mode");
> +		busmode = DA9063_TWOWIRE_TO;
> +	}

In principle, this looks good and is sane to do. I'd just suggest to
leave out the dev_info calls and maybe just do:

	busmode = i2c_check_functionality(i2c->adapter, I2C_FUNC_I2C) ?
		  0 : DA9063_TWOWIRE_TO;


--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAd7c0ACgkQFA3kzBSg
KbajFA/+Oqb7AZKnYdcHwZR9dhbxEb0ufEPQqLEG5l9GJWcAfIYeZFWU4lVtqC0g
BQMoW5PS1Mbiz4Lka+YV+BH4u4VgaUX4O8qdNP+KE+sCrLWwxatrRd/GfkhKSUU0
yTxjoJD8D1v3Jr2EgIVTj3jCWpwMc+aPK9JKT2BzcFnmT9wOWG12eHF5O01gyznL
ro0cq9drL1oi1SYsVuHypz91YaM0fcSQ4J2wFheeJF5aNo65wLX2Sr+cAPp2iXla
fdnV+VDspGB1BQH7XZxkOolBtMnVe6Vc0/cmeAScbAf7MqwC50Kf70vWAkhNC7rg
9zqllsiG823sAe7gODaLed5omnE4/rsI07sSQnJjnXmjSigXN4L0E/RTZC3GC4BC
Otv+UpciOtTFCX8//w9e4i/SijoEVA4S/S58kad1D1LWoG9wqtZNn6wXCZ0GmX3w
E+srC3U19wh0a8YpXT7RePlIQtfKSRRJXTz5aI6YJVxDZkqyMXZFlBFxy1cohw/m
oM+3eQG38Ut9gZHVMZ8uUdFPeBcL0TawGhn1H6uzDs6ocspFGXOpKi58KWuOoiM/
u6ja/DtIyTkGnx/ON3Q7+lgoVuTG/U+H//F+0tdyZ26MBOsa89f6GqomxfHvyyKs
HgTnvh+2lBhK4e2gJQl8431fgPWK7UbyDKUPH6HMErDBrelS9zg=
=iZRs
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--
