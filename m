Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E220726DA11
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 13:23:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbgIQLW4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 07:22:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726217AbgIQLNG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 07:13:06 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B65D3C061756;
        Thu, 17 Sep 2020 04:12:27 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id e16so1629299wrm.2;
        Thu, 17 Sep 2020 04:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Iv4PAl9Zlwh2pg2Q+4OT04R4n8Ndwrc3cSLBgi8qzJ8=;
        b=QxGm5rMJtTKjJMa1lsdAGjVZOxYYM1umu9kNt7Untl1jJ3mwvvx+XFQdILilw+sDmj
         isbMVpPD8WhmQfgQUNlqBa1QBRSrh3iyhPr5gTy/U5B/Wj/IlJNWJD+G8lXL0C7Ibk7g
         p1QGoYZs5xcF2LT9QnosqW/5JHXHJf9AmQSq6PfngNivE3ULwx8eEWf7sCWGpE7KqHfX
         MWsoXWJlpkqF58FncloNqqY6zObrmWmwT4l8/Jh+viknnyj+alUH1pxL6TS3nbjJ3Vc7
         +RtfQ6De5MLg2kvMsQp+pHdsjlI+2GgU13l4+mMVgCYdcYTl8AKHw8TejZsUUFNsLfOS
         ei+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Iv4PAl9Zlwh2pg2Q+4OT04R4n8Ndwrc3cSLBgi8qzJ8=;
        b=CB7J6mXO+kmWWgsF1SY8+iLEuoII9zRiX+VxNdXlG44NPMp/3WnIR6/IOnBdnun2fG
         Az3sUljOlxP5sJHMk+vBfvf6OT2ZsniwruPSIVNo8jgu0UpmnlH1YXu18tIqkLaSjzyu
         bWnCYF4ycd8qatspNMyVYcT/VicurtY8tUFB6hmymxAZmXQUXvtGizL73AAavPMXcutR
         C8U1WiTtMPDKnie9olVNE0TYdaCJpKWKPS5wFl76AVIREWeU4dtdBqPiDAao02gCGeUz
         x8JWP7jufGSvP/Mne+T23j1M0X6UL+WxOKdI7tfDjXD1dJsvl77px7TzglVx3V7/HqtB
         eUlA==
X-Gm-Message-State: AOAM5331GFxkTCoB9iybGQN28F0aXlz0BkvNMERb8LkpM5svUsVrbxc6
        5kToxcr4VT/m+EsqSnQX/Ow=
X-Google-Smtp-Source: ABdhPJzJp4MsSNYrK3BsIVWXjaNNGxIbClBL3K6sQ7DoUFSBkjVnMy8S/87np9ykM3Td+IhSQYQmqg==
X-Received: by 2002:adf:f106:: with SMTP id r6mr32127352wro.106.1600341146448;
        Thu, 17 Sep 2020 04:12:26 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id w21sm11170435wmk.34.2020.09.17.04.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 04:12:25 -0700 (PDT)
Date:   Thu, 17 Sep 2020 13:12:23 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 02/34] i2c: tegra: Add missing pm_runtime_put()
Message-ID: <20200917111223.GN3515672@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-3-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="A2x6GFCQWVc4i5ud"
Content-Disposition: inline
In-Reply-To: <20200908224006.25636-3-digetx@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--A2x6GFCQWVc4i5ud
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 01:39:34AM +0300, Dmitry Osipenko wrote:
> The pm_runtime_get_sync() always bumps refcount regardless of whether it
> succeeds or fails. Hence driver is responsible for restoring of the RPM
> refcounting. This patch adds missing RPM puts which restore refcounting
> in a case of pm_runtime_get_sync() error.
>=20
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--A2x6GFCQWVc4i5ud
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jRJcACgkQ3SOs138+
s6E+7A/+PkTocxcGu5xzFyy/9wuEFEw+xDFO7ctwpkX0eX0MzFLvMZPsnqsHWxwg
fwYXpdFbNE60rerwmmuKKPImJ9VtzlMSazPY1W7tzc6qwNbpSdwdEIfSLVGf6vVx
CpI4JFrax+O5vJO54YmRz5Nhyu+yQ43bsk8gdu2kaeUwUuh/PeawOER2DSHYbAlM
0UMXsBLGZBpGYqo0OgN0eaEu0eq8jV0XeCPa++l6QnWx9ake8kdhQIK9gt9ydvru
88sKriO2oIS2sY2qci0WZO6jfDKW/AGkg2b1RTN4jtMdoEsj3ER1Qeo835VUg778
TRFAnUbCuTOtD16X1Yj/Dsn6NIWbmsCfpiBt/46Zt/EFPX8pmgQUtsCibDnxT/m5
Y0JJYWZtmT2Vj72aSQbymHTorfEBH4kVb36zO/VNCoAGjQBcb8re12n+I/Cxpgk9
FVdMjj4w3rvBgolDFb0Au6JSOSxnY8P46r988VJCawvGqH7N34PePU8KjXot7OVL
KaiI0pHCVN6+us5Ga/pV7ZhmrQrk+c4I7NvbUar6kR5HboxI6IU35E5fn4TTaHV0
WbleL7/NsUvdrSORy5NDUQtEPQ2xUqAk9ykokEdxynl/KIBUIsFWlOYb4lvhpobe
ViiaheEYDjjsRVD7o3p5wMrbYqQwPesMoPh1pONRrP/jmuqZmtc=
=USTY
-----END PGP SIGNATURE-----

--A2x6GFCQWVc4i5ud--
