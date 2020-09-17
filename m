Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7273326DC6C
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 15:06:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727026AbgIQNGE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 09:06:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726925AbgIQMdC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 08:33:02 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2184BC06174A;
        Thu, 17 Sep 2020 05:22:24 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id t10so1856125wrv.1;
        Thu, 17 Sep 2020 05:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ncqUkSaQxaAWDdynI4bLfrAvSvMSYf9YKP7KRXAhv2Y=;
        b=RhYF8jTR2BGjRpmsSGbQQig2SEQ6UmK9fXqthsfzP46wUAd9Y161HuXMySSidpaZX4
         jjZre5B7s6joverEXDYzIJr9LGVcHjly9PC9CFwljgd1IBFbIGdvG5UQf8WXclXtOQR6
         yKII3k65SvN7P2Aojkx9NvsGJm/GxKnzKHii0r2GyRvh/5iirVlZ8Vi2OPCSlhIq4fgC
         q63i6tpgokYL2dv7hGknt2gW23mO3ONrMQywXuMWBacWZqySKj1Qm2jGhBwV1JQ5qagj
         gr6eW1JTiutYihonIT5zZNo4tcYk5+xCIrnndkCgWwcBOtUNLBhw6VbQYEkilqqwVG/L
         YH2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ncqUkSaQxaAWDdynI4bLfrAvSvMSYf9YKP7KRXAhv2Y=;
        b=JEDEEv+d4kQudAMfdp0bAGq8f9vR0lYv8ogIx+LV9Rv51Lq9Q3SelLaWMrRTb5cQbd
         bzhNqflRKW8mczBy08MPTZ3R/y9noGjN7yJbzV4PuNQOvWsor1V17Vvfrs5M2f1y5yma
         i5cs8q+baza2rsbIYBYScJL6DcvmQrmgDW86KD1/adTHwJXYQ5hhQCqm7pK1XHFLfFo0
         9fT+q+VrHg5GH/RyEHV5iAys0F0HhV8z7DZuxDuJmNOaACR9LePluk3Eqq2JwxWHUkRM
         zQZ02VXY/4rsNntBCOdffA9yLacsMMO/rmCnJ4qd3UbqSvpiTmj6FOuKYTdfsVt6CpVC
         5YkQ==
X-Gm-Message-State: AOAM533WMhoKROYglFDCg40D3LOl1SE3QgytS9lDFhIYBNoa69zdWdy0
        kJfaRvuQzwmgGmPsd38TqFY=
X-Google-Smtp-Source: ABdhPJwv3/XNuNXddFfOChcRh2KJXC/SnglIZkM8Iz+N8j+Xgi7kiOtrCCPANAE63emspjUbt2bnTA==
X-Received: by 2002:adf:84c3:: with SMTP id 61mr31360133wrg.131.1600345342866;
        Thu, 17 Sep 2020 05:22:22 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id c25sm10387284wml.31.2020.09.17.05.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 05:22:21 -0700 (PDT)
Date:   Thu, 17 Sep 2020 14:22:19 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 31/34] i2c: tegra: Clean up printk messages
Message-ID: <20200917122219.GJ3515672@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-32-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="oHxSCaSS3y4TqjY8"
Content-Disposition: inline
In-Reply-To: <20200908224006.25636-32-digetx@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--oHxSCaSS3y4TqjY8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 01:40:03AM +0300, Dmitry Osipenko wrote:
> This patch unifies style of all messages in the driver by starting them
> with a lowercase letter and using consistent capitalization and wording
> for all messages.
>=20
> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 37 +++++++++++++---------------------
>  1 file changed, 14 insertions(+), 23 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--oHxSCaSS3y4TqjY8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jVPsACgkQ3SOs138+
s6FZUA/+NhEBlHU2EMvR5ax5uFi/da9FeMY09TM4LvYKWShdYttQLiQahb+5de6z
67jE0BAnGknHeWNmiMCNJvlpI2OLpBpuLsbwLjuKe78ZrXU3j9T9qEvEquyhroyE
PiqAKpAYrU7l6wF+m1Z4baCni7pr7QBTF0/sUPmHpfwF6C+13OSIiY6R8v7kyBy5
C5psJIAZbYjZU2k8bxyFW9hUi2ir1QDWaR48cJ05mTDWShz3mY+0ppV0qL+Bhwev
5zQnsD+AzHzjgbi5z1uZ2jVTiglTTqrcqNm7cPJmGgssTKC46lOFMZJYzUygklSk
FAhEy0msraPUdczz3VHTtXuIa86bFBMs/dLWwVx7/cv81Da0uvsChYs+rAXqe9CU
x9/IsOHZ/Py79kabiaHimmkmYtIdKs8qGMR5FLubtElSGqcqGkz8ST1cEzaAccQf
PNP6gn7OQhDEcbGcusnlisSaWMDA4Q+pZnn8I7gdtUEC7V4TgBSZ42/2EfQcTJL9
i/5mqGqw7N+oa8D+ujlKJij/vcb+0t//2wG8rl3aHUvo2wW+YbOP9WyaA/Cki5Df
NSt12x/4BlwTFccZUu9NVwVuisLZHTFO0JRV3WAdeZmnv6cMf8Sfi1AKJ3hDagxd
RcuvC5F929TXWdoPB5rXJ3IDrg3bwcfsN6eAoPCOftoy9lBBug0=
=gg/d
-----END PGP SIGNATURE-----

--oHxSCaSS3y4TqjY8--
