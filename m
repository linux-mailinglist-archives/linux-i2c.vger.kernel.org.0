Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CD042F802B
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Jan 2021 16:59:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728898AbhAOP6V (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 Jan 2021 10:58:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728020AbhAOP6V (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 15 Jan 2021 10:58:21 -0500
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0B12C061757;
        Fri, 15 Jan 2021 07:57:40 -0800 (PST)
Received: by mail-qk1-x734.google.com with SMTP id n142so12106467qkn.2;
        Fri, 15 Jan 2021 07:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wUihvIYTO+c9XI3nDxsZDkyRWMVzMrDyYmjZV2/Hb7w=;
        b=Y7lA0ZiX7v5y57tlhFjW/SGGhaFXGCVUR3zuOYmxIrpk7M2p+1q4jio2oPEV09AQs0
         gEfX6z2yV/NHWHXHK94KbBlSrCPOTUuPiMr9+nQqfAOgvwdHq6vo9iZ5AbwAYFKMtQVu
         q4Js7SrKZavTor2/7rRqeIxLrTf4CgwSvDEleERjezWNqOjaAT/1K4qxlkOz8xw4FD5s
         1Th1Z0pdll8vKzOS8nIArQBidu9uBplQnPgEUMzti0FO/7D/Jc3DhPuJiGtgDyOtB8sg
         opk4T4Az3A9+xwborNXjr2I1kH3dRgy3hp/nQpUjVS5Zps+voey7MDmDu3137YnjhrK/
         61pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wUihvIYTO+c9XI3nDxsZDkyRWMVzMrDyYmjZV2/Hb7w=;
        b=TYqbSd7vXAqrW6EJUUm8aYTsDq8DlJ+feDrJJy6jfaNAwfP84ikZdJvEN1mZzCWY7e
         QMC/i+46Q+9OEJjfDxElMyUBCh1E63sgBVabLeNE+lSG14yqaSr1F84vTX1b4ba2Vlk+
         nFDbE/bJpCqSXUNob31tB8B5bM5TqyU7vxpjQcJGyYbZ/1Xc+RWaj1UpCeabJtixO/NA
         dZ/XZ2YFbqsy6GBC8mifU+1xKK34WeLdB51ftLUygT+KWi3I/0yA5LiA1R7CozX304ns
         CHCDZotVq8aaqJP3IFDLwSbzEdV4gfRe2PEzTHrAFQ+3v9CjSdbUCeIJwFqxZajVW2Ri
         VCsA==
X-Gm-Message-State: AOAM531dzW8IIGUSHsUjdWz+v5JFMsCyoeyFgZX2mZmocK2/SDbMbWDY
        SKBdulS4AJilvxEFKT6Krjw=
X-Google-Smtp-Source: ABdhPJz003YQOkYa4cIkwmcrgTOTizyV483ds/v1vxy/GMCLv2tXnW0h7AgWE//d4qMoLd2/Q/TDtQ==
X-Received: by 2002:a37:27ce:: with SMTP id n197mr12952414qkn.220.1610726260200;
        Fri, 15 Jan 2021 07:57:40 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id t5sm5053412qte.20.2021.01.15.07.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 07:57:39 -0800 (PST)
Date:   Fri, 15 Jan 2021 16:57:36 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     jonathanh@nvidia.com, digetx@gmail.com, wsa@the-dreams.de,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3] i2c: tegra: Create i2c_writesl_vi() to use with VI
 I2C for filling TX FIFO
Message-ID: <YAG7cJb2y3Yym1xy@ulmo>
References: <1610478161-4877-1-git-send-email-skomatineni@nvidia.com>
 <1610478161-4877-2-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="oAZvG9Hbx9gUz+i6"
Content-Disposition: inline
In-Reply-To: <1610478161-4877-2-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--oAZvG9Hbx9gUz+i6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 11:02:41AM -0800, Sowjanya Komatineni wrote:
> VI I2C controller has known hardware bug where immediate multiple
> writes to TX_FIFO register gets stuck.
>=20
> Recommended software work around is to read I2C register after
> each write to TX_FIFO register to flush out the data.
>=20
> This patch implements this work around for VI I2C controller.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--oAZvG9Hbx9gUz+i6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmABu24ACgkQ3SOs138+
s6FI+g//bK107HZ6P4WEwIsk6ntl3FeTnn4J/0XajD+VkUp4bMoZHOtqBHBEdl4R
dzSIz0B37wVyr2uS4/MvRcdU5WndLpwOG9ZsiUvhR9BI86AlWiqqrTNjzq4ddQ1a
Aj/mue6Q/Zdgzx5T7Hfs6KnpZcHlz+nGGIK878fUqmKKMtFScyoPuN1wk+FI6ljU
Fj40ZPjZxMIP/YGosv2W9+m3rYYvksh/87iDF2GnH9BWzPppA4Y2OqeYNiXKblbp
Cq9xZAo/ilsADBPSJ9sS5fNVsLTh7qg/gGOumoenyox9J1xKk1WkVj0TLUbQOxmx
+xodXVEJ0yhymRbKxJgioziMPspGXrPz33LHMeIYaI0uVw1NIEOfN6ems2lxyWtY
DhZ0Vy1FOWOacvyq+tBs/Hg1AVaeB60fC98V9gTcXLr/DcF1V9Nxg+hxMugrKjqp
aN10FpurrmMLQxZsdO3OoIBNae3Ti0c6QYdjsIohPB4hh+0teRXXPGOhjHxmYbE8
cqWI1BovSlfL7bMMzH7LBKn6MaHsud2hb3G5WH/HheEk5wnrSVXFn64m6+UCVSKk
3O1ymLtEv9ukBpllHDEibseHNi3/UeVB0Oai4v5durVoJWRQQnNUlCi89Dpj2r4b
alLWfd1JyBSDBJXg2KyxbePzyvTZX6dFMDc9V7QJ9C5J7ZIQ9eM=
=X1yL
-----END PGP SIGNATURE-----

--oAZvG9Hbx9gUz+i6--
