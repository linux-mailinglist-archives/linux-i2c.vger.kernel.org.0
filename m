Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D05A8272230
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 13:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbgIULVa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 07:21:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726406AbgIULVa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 07:21:30 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE77CC061755;
        Mon, 21 Sep 2020 04:21:29 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id z9so12216782wmk.1;
        Mon, 21 Sep 2020 04:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0ZnIRDHof5llKXKRdM1UTdt+GPv/4voJnfxD2ooD47I=;
        b=kttlAkC1AoyTyET4BKsIM8keD3CJpbyDi10VAiTrTGxPJQ4Kj8XE5+nitoFbm2PsZC
         S4HSpUGhV4mUeWY4JR5AuvrfyBUweWZbCBLqHsYoqMdt9ZN3RkApKeg+/5eWheV6leou
         cMzOEqRMQNQI6vR3TxtgUMDIV8FVbQJ5pyPT1PONXZDlCa5MGLZdUeR0NmKu6SSQyQsL
         0CTXKKBsN1FUL58poNXtl60kOXOJFIlYXJap9BDzm7fb4juhp1s+yoqP0jCdCDtFbgW4
         /NaoczVNVeKWKFz9LCI2ljVBZBU8PTw5mpiGrq7gm5AiPziA5i3YGHX3SqlezjWKW7tA
         peaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0ZnIRDHof5llKXKRdM1UTdt+GPv/4voJnfxD2ooD47I=;
        b=gRx9A1aRURjJTwGw/edXSRuXdfXYkShIUa97nDJqg0PhCNtYgZj3XGG8OLYCWlUcXC
         EwHqeyoiFPHx/i+DYDIjXzcFarveTANMLoJKuCd0STXEcLz6WiYt5n/BErfrR4ZHATLu
         HynaSqULkHKBGcwPWkHrCMXD4e4wEHnQtqZ96ypjijabY25xkPL4WwxJPWC4MnlhtWNc
         Q0RYsTojFs4ZCV0W6sffOGIyCxvQSG+BMowO6N+a6PnfaC7qT2MvPsdiJjII0zaqykzQ
         DbSLBZmIxAUvVKtlKGbokOFdpDT2oyuVqGpMuIUPlhGr8f5udw1RA6zpEMUGoRph8MWH
         8NAg==
X-Gm-Message-State: AOAM530BLN496C4Oi4+HAlI/spFpo+5gx6KPPriufSUusEN1m73EXD5k
        6Nha8qfO4RkRLkKiTSm+CLE=
X-Google-Smtp-Source: ABdhPJzCvxOm652pEtwWdGmLCokCFTSR23EaxWY7c9VoYRNQezGBdnQCD+zwQald5Jqbhm21QCU9Ug==
X-Received: by 2002:a7b:cc88:: with SMTP id p8mr29826223wma.150.1600687288359;
        Mon, 21 Sep 2020 04:21:28 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id 2sm18627914wmf.25.2020.09.21.04.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 04:21:27 -0700 (PDT)
Date:   Mon, 21 Sep 2020 13:21:25 +0200
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
Message-ID: <20200921112125.GI3950626@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-22-digetx@gmail.com>
 <20200917114716.GZ3515672@ulmo>
 <b2f68a72-9117-89d1-70f3-750ddc235482@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2xeD/fx0+7k8I/QN"
Content-Disposition: inline
In-Reply-To: <b2f68a72-9117-89d1-70f3-750ddc235482@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--2xeD/fx0+7k8I/QN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2020 at 06:03:04PM +0300, Dmitry Osipenko wrote:
> 17.09.2020 14:47, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Wed, Sep 09, 2020 at 01:39:53AM +0300, Dmitry Osipenko wrote:
> >> The DMA code path has been tested well enough and the DMA configuration
> >> performed by tegra_i2c_config_fifo_trig() shouldn't ever fail in pract=
ice.
> >> Hence let's remove the obscure transfer-mode switching in order to hav=
e a
> >> cleaner and simpler code. Now I2C transfer will be failed if DMA
> >> configuration fails.
> >>
> >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >> ---
> >>  drivers/i2c/busses/i2c-tegra.c | 18 ++++++++++--------
> >>  1 file changed, 10 insertions(+), 8 deletions(-)
> >=20
> > I'm not sure that's a good idea. It's always possible that the DMA setup
> > is going to break because of something that's not related to the I2C
> > driver itself. Having the system completely break instead of falling
> > back to PIO mode seems like it would only complicate troubleshooting any
> > such issues.
>=20
> That code has zero test coverage because this problem never happens in
> practice, hence it should be better to have it removed. We may consider
> re-adding it back if there will be a real-world incident, okay?

Again, I think throwing out fallbacks and error messages out the window
just because they "don't happen in practice" is misguided. Just because
they don't *usually* happen doesn't mean they can't happen. And in case
they do happen we absolutely do want some way of dealing with it rather
than just have the driver stop working without any explanation.

Thierry

--2xeD/fx0+7k8I/QN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9ojLUACgkQ3SOs138+
s6G1jBAAo7ALv/1b+UdZOVeHC+ZjxIDvuKeSkINgH09LfvSpEP0SE09rXlVrk1VJ
tJkgVoeixIlCNCPPW62AVl91hiYdAoah2oywe8F5wrPuB06sGfcgaOrYTCGilYdt
wN/wCRgHOYhqLB/sfe8vMS29hhxxA5V3F6uCUrdIhHsTv7L5i+g/v3FJsR3LHX3X
aBMwKrO1Ku8gn5jySWeJRTjxnm8X+AhxTJepSS5kxxZALaS3mhLtbYO5qhZmiE0r
xW7i+04SS5ILKdMWEC/xB1WFD7oVSAgzCd9ei7UWxFFUpLWzQ9upWNrLB01Ysap5
lRCRk0PLyA56JdKQgHVUnjMpWpGk7zv/4NjQK5Hn/B3JFCw7CLYbmpWLJiqAWEwb
Ov0SjbCuPeIMNdUlt0Ndlhqr6TeFjTg8h36oqaXZvdA0vYEXuGDVxFWbgLnvwemN
nkAjxUe24kyeCze/RV0EzgpbldywDJe+/q+swkcF4t4f+/cbNXS3zIsxewSRpsN5
IzQc4QRoPgE3dhCWEdi9X4DTWu3wDSXCBW7Plnw5zTekIsq5yMqL6RZOjT1mTv8z
DWh/At1KaPDwZ10vH9zb1pmVQyNnUBNcTB/8YyqI+7ErMEoHsv2AcPBNjEd+qURQ
xaalpSnh91hwMjyHRxoRW5JGBrq28zX28SfO7GXioeEa3qwAhQw=
=wZn0
-----END PGP SIGNATURE-----

--2xeD/fx0+7k8I/QN--
