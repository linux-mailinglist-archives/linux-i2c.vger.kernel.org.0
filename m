Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6CEE26DAAB
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 13:47:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbgIQLrb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 07:47:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbgIQLrV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 07:47:21 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C57B8C06174A;
        Thu, 17 Sep 2020 04:47:20 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id x14so1699031wrl.12;
        Thu, 17 Sep 2020 04:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CsSULRHEwOUPa0oBdSSa2xFRccNBYxIxudhxZxhguzQ=;
        b=QitX2hEbnZeGW/PJejcn2xiUVk97n/t1hg3QgOSFJXVTo1UxxAiXTS6yyXT8XipbTs
         nqdZMmAtQVBpv0q8+8DRERuHhMfvo+8fCS0w31oIY9vXSPj8mhats3h48EFUliUNdYij
         M0mIW21JLzG+nQ91I0ym9jPK6QAwVfO7rn5vjOVVLsEe/qRcnOStBU+C5DTBPo3BHqAH
         U5FLdmKmmD4aLX0OPWKo6x1hBNYQ1e9JAYG/Y9c8pqZJgr55D2EBPseMPHSnV1E0eopC
         CSdpzdLqtfTPJ1+IhmVnOURgEilywrGFF4N7PS9PeiKXl2NexFTKQU7K2I+Lzin8mWk4
         t9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CsSULRHEwOUPa0oBdSSa2xFRccNBYxIxudhxZxhguzQ=;
        b=gPuDNhDIC92YEUN1u3BtHzYqhPGZmKVrbmwFVJbVetzXerp94XPC3X/r8r+QIUTlAP
         thQSjmruQQqpZn3SHPrM2ZHqQoN4RA35nfJrTjNsZt+LTM7uJSGSMLJBCsC83Tsy212p
         KN5ASDuGQLYcGvYiHTnjNb4YoMCwpk5jihZL5IHIw7JsByzaGF4FdZ43H06KE3nLh6BN
         dqCiweiHI6RtuCxx8OF0CBz/KlnT2fY7RTRHvKXTiDS/NKvu1LbZ9TqS4iCVaJ1GzCUW
         DM1EHtHYRylbpO7TlucrPVhcJxE7T0kQzLmfNqks+WaBzwXe253YqAx/0Sxf/bTPU/ia
         wQng==
X-Gm-Message-State: AOAM532uakGNlotmLv2qtF/b1iEenHBVaDaPYjafQVDZIq8geyS+f1zy
        eVAkAmKUbk1RE5fwdBE/L3s=
X-Google-Smtp-Source: ABdhPJz+yKz3QpNLXp/JzXcrh9g10SAeQ/RabQPP8fMs6W/gl/lwTvxyNClHAnNctIYQvKWAa9vquQ==
X-Received: by 2002:a5d:458a:: with SMTP id p10mr30826324wrq.282.1600343239531;
        Thu, 17 Sep 2020 04:47:19 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id q15sm36499027wrr.8.2020.09.17.04.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 04:47:18 -0700 (PDT)
Date:   Thu, 17 Sep 2020 13:47:16 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 21/34] i2c: tegra: Don't fall back to PIO mode if DMA
 configuration fails
Message-ID: <20200917114716.GZ3515672@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-22-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Wn0J+vu9+NMIXK57"
Content-Disposition: inline
In-Reply-To: <20200908224006.25636-22-digetx@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Wn0J+vu9+NMIXK57
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 01:39:53AM +0300, Dmitry Osipenko wrote:
> The DMA code path has been tested well enough and the DMA configuration
> performed by tegra_i2c_config_fifo_trig() shouldn't ever fail in practice.
> Hence let's remove the obscure transfer-mode switching in order to have a
> cleaner and simpler code. Now I2C transfer will be failed if DMA
> configuration fails.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)

I'm not sure that's a good idea. It's always possible that the DMA setup
is going to break because of something that's not related to the I2C
driver itself. Having the system completely break instead of falling
back to PIO mode seems like it would only complicate troubleshooting any
such issues.

Thierry

--Wn0J+vu9+NMIXK57
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jTMQACgkQ3SOs138+
s6HHJw/+JbrupYuSJ+2UrJaYVJmaS3aD2VRhWfwqmchEo35Mm8b7gpCojcNZbF8N
pqGsYXjkyg6Rv7lxuHBamwJMkpwhw1ELEqQM7Eh4QjWTfVTZ1dU9PCYZfQB5xUMm
kcYGrfKyHQMfOpS4rYhOtYQirXzGQ9up+2UdR9LhL+ypvsh+kIjGDE1Fk0WTO8LN
n7p/fpfikDzklNWh5VmWZKT7GEg9bcRVhQRHkTAQQ2Zm1DL8Io/jGnkGeyP/GjFq
MoFRnAFBYxZaWE7Zv03CUw9JLucEuVe7AbxjV+4wlSWpqsTuVqREL977RB+4wGZo
sEvuGCZBBwH+K2n+UKRMPfsbmLARZ2zMnAA8S3FNtNE+nKDQOZrRak2QcOmgDlY8
+5wH+F5cODFXAuxHzYxmcnfp4Wk9ThigT7yv6+zbtOUvwBYeXiMi4lVh/TS83ncM
qhdWpbRTToG+V4lX9tShb1309X+yjh3cYjHgE9IKHPDVOUh/HQQOke4YlTdHqxyt
yJSjmeuQkPOPcM1qwY9wcViWaqCcvVNbWYsv/vsuBHX35QdGSxKNgylzDWIRmpml
NaoVP9eshXPwbe6B2RrjEJ/SXNtIVLIGFACVg4BlU53LXOHBVKiTKXDcfYuw6DIP
5+g/ZgrRprtbk5RBYJexHSRRyzY9RNSe/n+8Amu6wKnj4ltGxGA=
=USYD
-----END PGP SIGNATURE-----

--Wn0J+vu9+NMIXK57--
