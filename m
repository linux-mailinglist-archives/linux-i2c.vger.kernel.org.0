Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B702526DAB2
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 13:49:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726928AbgIQLst (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 07:48:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726921AbgIQLsn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 07:48:43 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35BEEC061756;
        Thu, 17 Sep 2020 04:48:42 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id j2so1722575wrx.7;
        Thu, 17 Sep 2020 04:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TPvEDJjNK01UiyyGzKwR/f90hyBviw1IeZoepaumxsY=;
        b=CT43GMhD+VVnJ7NNFjwEg6T81/FYExAZG3VvUQ1t8U8eE2E4EPROTXTtjgiY7n1PTh
         8cNIQPkxJ6g+0oiByFyzEHsdvDbXWlOqUfVzDbbTPdloDosC9BbuYo9oBOfcb82z8hbR
         WT67iN28GpqLgSIHgDkWb/70huMSTOt/bwk9l0OjVNeunChilo4U55fjDEcN75TlkRTR
         KnyUAFMOyVXrVurET2+H6tfRaR8IxQp953TDN83yIWvdMogqwcSD2KZgFlIoaw8jUOZ4
         JXrZ0P330ojmiZVexlpZJzitxwyerOdd3rhuI8xSXhQbA8NmSW9P0UVQfZ/K+2qZCVYN
         pNvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TPvEDJjNK01UiyyGzKwR/f90hyBviw1IeZoepaumxsY=;
        b=h18xVVH7lZYh9u93tJi2anhrB3y44WxdVjGvNgSu9KHMnfJ0BfFhkMi+RhVxcb520C
         RFzoRE7nYjJbKh0FWZZ6CtDu4dDiPco5qacRxPiQhnuwuDw+tRQwUEhh2DA7LcoeA+Dn
         Eju6H2VXn5ludFjawdXXXgGCCIuYfUuB6bim3QeCV34oQ8mra+aRe1qNKBNHH8Mg/nhp
         VBmdUAq4W7qncz7VAt4/xbV+R0NYf94R0AH2ZKj0P8qoPQcnNuMEu4dT2u/y/d4q7c/8
         X4XfTG82v81d2bzkl6pil0DfqIH4pyADOWgZGgdyWeke+wu4qh5Y4k8ZxDe1OsBxsKuD
         jKJQ==
X-Gm-Message-State: AOAM533URWxBuVc2JsCRVKuEWx9EoNCGGibTZhtnzaFaEPZ2tDhMm9DR
        PsUOG55QcxZxYHlYQQ9qlM4=
X-Google-Smtp-Source: ABdhPJxHKQoT22n12GJMrgck0/ByHn6OVOq1eELaXM/xMeHYkghMHNSKkU+wExQn2W2hwPnOBjjp0A==
X-Received: by 2002:adf:e391:: with SMTP id e17mr30675700wrm.289.1600343320943;
        Thu, 17 Sep 2020 04:48:40 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id q4sm39776166wru.65.2020.09.17.04.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 04:48:39 -0700 (PDT)
Date:   Thu, 17 Sep 2020 13:48:38 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 22/34] i2c: tegra: Rename wait/poll functions
Message-ID: <20200917114838.GA3515672@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-23-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="W18qbkTAGYos9/y6"
Content-Disposition: inline
In-Reply-To: <20200908224006.25636-23-digetx@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--W18qbkTAGYos9/y6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 01:39:54AM +0300, Dmitry Osipenko wrote:
> Drop '_timeout' postfix from the wait/poll completion function names in
> order to make the names shorter, making code cleaner a tad.
>=20
> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 32 ++++++++++++++------------------
>  1 file changed, 14 insertions(+), 18 deletions(-)

Not sure this is really worth it, but I don't feel strongly, so:

Acked-by: Thierry Reding <treding@nvidia.com>

--W18qbkTAGYos9/y6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jTRYACgkQ3SOs138+
s6GZjBAAijMN3OUjAB/JXXlGmivh74E6fcLG9QtQIjkjlNveaAKsJxsoIrjopELD
0rvAMHNegxy5Ye2x6XWHnLRPeQGyZ4U2vsk3hO8L7VW03DWhd6xEygQhL+hVM966
JwXFrtay++JtmehAHimiSurnfzBKCdZ7ZjagfUwxrmhPAlDfY/IpOLe1EbLNYv5Q
HTGb1GkaNnPQU4Kg7J6zIW9Qqc/cJ4WJE1SLbm5s+EL+sar6xGNjtv95Cizo6gjI
rvmHO38KjRFEBqs0JRXvBGDts1NucRrJL1p+Mn8TTMooHL1372BiLgSohCzf7Nd2
YWaFeGV34BKOe0xXY6esBfVqNyESEIZb+Q+vDr+3MAuOxjlaWeyRwmVEczIyhBGD
Q3FVnHO6Olu8HEeFc0XwGbfZZ+YuRBV+LU4k7U5UsTx3hcL5Ufw36zIzaT3y91n7
Yv94CUde2w8iuPYp/nLrrM67Krzdr17qCbK9N1QsmHFy4xxPQmlEblQ2AlFtZMFT
aYLzodQy9KzGXmz6LtRWHpzrjEOPl+FwmrRTYG84PARJvs5XeqgMITNMFsUsIAeC
wuWrSUvblxBI7OPZojpSSnU8qyrpqdwDg+cNnOL5v5/ymMC71LV5donpVQjslA6J
vrra8RG+6oyYxdPsEu9L/5rGw1kgbUpjOkoCPIxcecWp0MUTaoE=
=+lWH
-----END PGP SIGNATURE-----

--W18qbkTAGYos9/y6--
