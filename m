Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBCBF26D9F8
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 13:19:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbgIQLTQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 07:19:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726241AbgIQLNp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 07:13:45 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F39BEC061788;
        Thu, 17 Sep 2020 04:13:24 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id x14so1594597wrl.12;
        Thu, 17 Sep 2020 04:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Nt7n7JGDESks5UU38AjyadhzQHGiDeVLbF1cBRJfheE=;
        b=bHRuTsVo+POh92t4Xme7cL9+MvYsfa7QSHOja6EzFdMma+VIOuYC6qnbX8rMdXnJN5
         tWB8iXQNq/Kta7ZsL6C9pB+W5Qy2iA7aoKpPCYRwksWIJdpqdKmHu0m5kwcFagL9TT+C
         JoI/zmflZ9ernYOgTrA2vTpeeCiykO7eFdL3uySj3uYkJByGGBW3pueqfMY9pDhiepXY
         wG6Y83TsCzgNR5CFCi/omYKSLckO9rW2eCoaC0BoNirNyPJ5XoVliNXqOc6uu+r7/gLv
         8zXYAfUsa/2BMuKM2jRa6w30vnY0SjJB9MizY2/mzVjol2UCuA3y11fATOYAGKaT0V2i
         eYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Nt7n7JGDESks5UU38AjyadhzQHGiDeVLbF1cBRJfheE=;
        b=gVG35KYuY4E4Jg/ggVUw6DNDMwjCwEGInvCb26+WnrCj195yPtdvr4KuePvNQYI/tc
         sh+3jM5W2ROpGVCfTUAOvH7EpJFBj4jqJ/6KYDo8l9RpTe3FNGz4ir3lTOMm1i8GlM/R
         LtwjkwGSs6fgXfwfyuOt9hxUpwTXXMx9lqGYuCXQF+attAcNjw/PaH5UWj9nTzIPUr1M
         n6Sot82r4tRy/Sg04Zz9W2R+cCn6PmAoel1Pl+blTJhidWgtMpkCeVeZ6LI5iF8YcPKe
         Hsib3Tpyu2uq5oq47JEFW0B24SXoBIfmPYbF323LVgwsKG4LSnpV4xK/PRZwpVaKQZyR
         75Qw==
X-Gm-Message-State: AOAM532eAhNhd6KlZ2SdBHwc9UVJd24l85ioOR3XmeGOb4eTXWpWn8uo
        ZnfADrGg91S3X4qwt42Qjnc=
X-Google-Smtp-Source: ABdhPJzNG9RMf/CqtZbx6j49UbPE/EFJ1dRmob3JO3cojh1nlUXoSX5IBSf/lejj/vTtvBX0T69lmQ==
X-Received: by 2002:adf:f586:: with SMTP id f6mr31442811wro.299.1600341203527;
        Thu, 17 Sep 2020 04:13:23 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id a81sm11327645wmf.32.2020.09.17.04.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 04:13:22 -0700 (PDT)
Date:   Thu, 17 Sep 2020 13:13:20 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 03/34] i2c: tegra: Handle potential error of
 tegra_i2c_flush_fifos()
Message-ID: <20200917111320.GO3515672@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-4-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="IpgPcFyQO6wM49Um"
Content-Disposition: inline
In-Reply-To: <20200908224006.25636-4-digetx@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--IpgPcFyQO6wM49Um
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 01:39:35AM +0300, Dmitry Osipenko wrote:
> Technically the tegra_i2c_flush_fifos() may fail and transfer should be
> aborted in this case, but this shouldn't ever happen in practice unless
> there is a bug somewhere in the driver. Let's add the error check just
> for completeness.
>=20
> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegr=
a.c
> index 4e7d0eec0dd3..88d6e7bb14a2 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -1177,7 +1177,9 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev =
*i2c_dev,
>  	bool dma;
>  	u16 xfer_time =3D 100;
> =20
> -	tegra_i2c_flush_fifos(i2c_dev);
> +	err =3D tegra_i2c_flush_fifos(i2c_dev);
> +	if (err)
> +		return err;
> =20
>  	i2c_dev->msg_buf =3D msg->buf;
>  	i2c_dev->msg_buf_remaining =3D msg->len;
> --=20
> 2.27.0
>=20

--IpgPcFyQO6wM49Um
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jRNAACgkQ3SOs138+
s6H/qA//UB+x04pnr7VzSdeexRXpI67j12uMWfv5MzDAIRhA6inj5p+WT2/fQRTh
vJo4OxgaoZzl9H6L1GkkWlReqGs9K48wyAR8tILOVW5JCGSM5aFs31EXQgS8gv1v
8C87sbg2kO/lsi+bne7gemCGa7MERqOmLgMPfMCkkT5ZpAffJd6yDEOfU23vsexr
bhGQT0vHCtIaHTCzLaav1R7kVQndERsxbaDrpNWdxruLhbJeX0IDAeP1jZNPZdla
DHjHZRe0M7fFcZCKyxql66YuElAHr79JS12C2RbdT5lPHxT46F+2ILk3kbITBSBx
ERN5m/xD5XdGuRPB3DERqI/0bMio77htYnLVnUQm+aq2Dsg4SHnhkdEo4nc5pNtm
fyUMm451j5ymrunVZGdIcdMGw8DPH6vz891RRzAMwfisxOHBXlmfjbsj+Hr1FRJP
YaonB4v3TwUpWxAqZr/8vR6XgzYcJjktf78n4jbZ2twKKVj0iV3Aw+9w2uNAfc3a
9S/rP4x4JbETGySejOqdI7WKq1PVdGhjJhYWR1vb1Jcq3Rx1kX2DqhW5luTOfrWG
4PwcX6XLCP6nMLWjLLUgRD9FmQ/IeTgGdc5BK0VUcRZcsT7D4FdrzgmoKkQlbuPI
QXSM1Uo181EuQ9aLtc7g9IlIiTSosHqnuh/FhQ5ZTDm7H4WXSQU=
=TlkS
-----END PGP SIGNATURE-----

--IpgPcFyQO6wM49Um--
