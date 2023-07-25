Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 495C0761E71
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jul 2023 18:25:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230113AbjGYQZk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jul 2023 12:25:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbjGYQZj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jul 2023 12:25:39 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66E3B9B;
        Tue, 25 Jul 2023 09:25:38 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-52240b64407so1908708a12.0;
        Tue, 25 Jul 2023 09:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690302337; x=1690907137;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=opEm+NbJrRy11XcZkr0LS4bqRah+SsErui7KFoWzfu8=;
        b=dzO+p5k79gtV73Kt67RWF2+5SbOn5g1cXmQFz4KHZKv542lDp/uNAHUdqSS5U7vefQ
         +7GlGZh1zcyRDqRVzljuqavrt5n8WteDUuZmfXyLviKor8kTQhgbans09CFAUcRzKeVF
         6fTul+1h0Tfs5KITxxGJGxh4MTF3fJVOWkTtj7saI5cskRFLX7TaB1Cbve0f6e4+ycGc
         CleNupZX9N8CJf2womGbKDVr10z7ML5klAgwZ8yy4Qg1H4v/K//q+8apybucx7PneqKS
         1X5z7NVG5PWkMWwBxdMZoke040olVSa6LK2rD95xDU3Mq+MYqNMdEjk8CNV0Bav8YOuf
         gHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690302337; x=1690907137;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=opEm+NbJrRy11XcZkr0LS4bqRah+SsErui7KFoWzfu8=;
        b=j3p6TtrhsUUUBHDUblwcCbXjUzfdwa8BAUJtiYgu33Ael5KLvP72nm+xQGYTi+5VTz
         TWMeJmx0wR8VXshIpRIS4MJgVIXKpsI5bi0nfT0bRl6xHdB2mvgtWX0VZhGycr+832bD
         hkZP4pbiX4S1wrMxxOvtwCFtxv/AnwAunizCp/uv7k/lEsFmJw/H2Pf9NK3toREz8Cid
         i857EmpEy031qn8Z0FfJVp/878lBBG8vSPYoNYm8vbE3MFN9/ib5mWCNDau5kaBMQsn9
         qujvSSZgmuhJOAhDB15+FMhIj0uxAEKCLRdJVmvny/M98K+NkuFIF6duAIga+In0APAX
         B9xg==
X-Gm-Message-State: ABy/qLY5bU6w52dSNPJ4IrsgvGTYivtqQpMyqUx3KkFKneVRgx5peYhW
        rlHhb6KyNqm1/MLc44vcBuw=
X-Google-Smtp-Source: APBJJlF7CN6/xRi5xikOo099I/cPnS0zctQyDhc1pz7caL0MLFaJglPdXQDshJiDcvfXmAnQNTK5+g==
X-Received: by 2002:a17:906:3282:b0:994:81d:2ac3 with SMTP id 2-20020a170906328200b00994081d2ac3mr12267759ejw.18.1690302336600;
        Tue, 25 Jul 2023 09:25:36 -0700 (PDT)
Received: from orome (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id xo22-20020a170907bb9600b0098860721959sm8339056ejc.198.2023.07.25.09.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 09:25:36 -0700 (PDT)
Date:   Tue, 25 Jul 2023 18:25:34 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Wolfram Sang <wsa@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2] i2c: tegra: Fix failure during probe deferral cleanup
Message-ID: <ZL_3fhE-ve08ZZRp@orome>
References: <20230707132619.2998382-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="n6r1FjvzXBt2KPvx"
Content-Disposition: inline
In-Reply-To: <20230707132619.2998382-1-thierry.reding@gmail.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--n6r1FjvzXBt2KPvx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 07, 2023 at 03:26:19PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> If the driver fails to obtain a DMA channel, it will initiate cleanup
> and try to release the DMA channel that couldn't be retrieved. This will
> cause a crash because the cleanup will try to dereference an ERR_PTR()-
> encoded error code.
>=20
> However, there's nothing to clean up at this point yet, so we can avoid
> this by simply resetting the DMA channel to NULL instead of storing the
> error code.
>=20
> Fixes: fcc8a89a1c83 ("i2c: tegra: Share same DMA channel for RX and TX")
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - simplify patch by setting dma_chan =3D NULL on channel request failure
>=20
>  drivers/i2c/busses/i2c-tegra.c | 1 +
>  1 file changed, 1 insertion(+)

Hi Andy, Wolfram,

do you have any reservations about this? This fixes a bug that was
introduced in v6.5-rc1, so it'd be great if this could make v6.5.

Thanks,
Thierry

>=20
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegr=
a.c
> index f155e9028f94..2a13f11edfd1 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -460,6 +460,7 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i=
2c_dev)
>  	i2c_dev->dma_chan =3D dma_request_chan(i2c_dev->dev, "tx");
>  	if (IS_ERR(i2c_dev->dma_chan)) {
>  		err =3D PTR_ERR(i2c_dev->dma_chan);
> +		i2c_dev->dma_chan =3D NULL;
>  		goto err_out;
>  	}
> =20
> --=20
> 2.41.0
>=20

--n6r1FjvzXBt2KPvx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmS/934ACgkQ3SOs138+
s6Hw2xAAkBAxapO9hGNyRwKVzGoldIj1fQUPxwva/YDVms8AK1Cd4bjW4jJInbaa
6UhzzqQZUlULuGUYw+UmlfTAl6FNAAn/+WHJw4f/L/Cc/xionbSamQDPmn+Ltpng
JrDGwf/3hQ5aGs/iqIGbIesYq9dBLt1PnUsn7EaWfiIsEzAaZTOr1pLbmx2epgvY
mUqXlKf6gB4M75bs0HBZ0PBl+/8ycwL0I5bH0ofqCwEnuIpDNZcGhNO+sL5fv5kK
RV5fh/3O3fHewltm7aurg/Z+dsrAJCU9IV7coQUE8mstJQIiLTaIbfx3l4UciG3B
Tk4iW4QWaM7zhSfl3P/5EXdxpjYO4EyKjd5QBXsTwR4bvQS3qKGOffalLbUeMlJi
vWMXXxynEaDNGUIZVvW87zxch2wLX1rveoTa3/rGQ4Kpz2oSBfESnAxEYF/obsLh
pi9mHpl7xmBr8395wQWM6ZX9C8EOPtm6HDYt3AD/Ph159PqRB4Sl9TTzsty0G/L9
GD64KqKiaiAPzUVSGLjXobEdQnMZq0OZsISdP7MDVOpsSyt7XCqii8a7X42+jvIW
C9l/1GC9GXeMgbdyH3nR8ZULd8wcLYrjQfF+IY3107bcvWD38WmU9jNczFiN1DFb
6j0C6fYKAnpjnIjWAXGNUXEmkOF7nuXnvlhHNZOJDPwpeFv2BwI=
=gRhC
-----END PGP SIGNATURE-----

--n6r1FjvzXBt2KPvx--
