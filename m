Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B4B726DB3A
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 14:12:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726931AbgIQMMs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 08:12:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726900AbgIQMMo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 08:12:44 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1D22C06174A;
        Thu, 17 Sep 2020 05:12:43 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id x14so1784433wrl.12;
        Thu, 17 Sep 2020 05:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ETKtaxQz6CCFtA+eghZwu0XBWFbm+FVhMoha61kGFig=;
        b=P5Sen6PflSY0MXmL0kzJOfBmSRFTf3z6Z9jJISyF+ccwsYoX8dweR+4vCIZoqEbmdX
         I+Grdc8TVXmuKCYjc75MBKUyy8kKwp2pO6vbE+GgwFNul9VuXQBIiLyu9gROBQnNl/gK
         jVs31IxM4qBWDS0nZLFdumq8csZbjRea322TpMHLGg384pB3/2AypgMrDqms4dFvX3Vn
         uceT9JfuwxxJRcnCEt2PJrIq0oLSIx/4q5MIUyudaSCixtFOXhwjK4CefKVfM/8GGi2r
         +L95MebqGUl3mY/UgTxJDyE3yvSbLEQZvCHVO0WTYexoZVp8B8kMWLB2RbalbYNiM9Mg
         P75A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ETKtaxQz6CCFtA+eghZwu0XBWFbm+FVhMoha61kGFig=;
        b=g1WFBdJPdK1x2It84aSaZfoxUJX6m+3jymspQLqv2ZuZ6SN6wSWVq9WIr38/E4jOm+
         OGe9uztXqSpCcScjBr9sDO6JwdFUgNSnhBiotEB9E7+IoKaPq4xgVH/NIwN1U+QjGI9U
         SmrdHnsgMy4YeASgxaPdDNvuJXL0jBohcOsLVQ9h3xhK0+bHmsOwXFXrOSuO1k8kb9V8
         wT3Wq/8DDLwhjaz7zwY+D1oev8iQ0PDvBIafKpggazBkVI001Lp6vWUcqeGDyn5cou7j
         SEpVwK8bZcKiO/wjGEAce1v9Qsx9iMXn1dciNOeXMroPngu8R2Vmu4QHWhU7bl3vDyzi
         fAVg==
X-Gm-Message-State: AOAM533OlNKsZsX1aBbeNYGszcBJAlMLzpwmBprl+WF5Pk5vmES7rlpb
        8c5oORCXVwIp1nnfpQwATDY=
X-Google-Smtp-Source: ABdhPJw7WAbQYp9FkZXBNijO8aqpPudufvfiFtAmImsIJVj8Yn5fE9z9lTeHLcw2WUrd8cNBD+TguQ==
X-Received: by 2002:adf:e601:: with SMTP id p1mr34373577wrm.172.1600344762585;
        Thu, 17 Sep 2020 05:12:42 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id o16sm36370770wrp.52.2020.09.17.05.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 05:12:41 -0700 (PDT)
Date:   Thu, 17 Sep 2020 14:12:39 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 28/34] i2c: tegra: Consolidate error handling in
 tegra_i2c_xfer_msg()
Message-ID: <20200917121239.GG3515672@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-29-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="XrjDSOQsS4AlGTKt"
Content-Disposition: inline
In-Reply-To: <20200908224006.25636-29-digetx@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--XrjDSOQsS4AlGTKt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 01:40:00AM +0300, Dmitry Osipenko wrote:
> Consolidate error handling in tegra_i2c_xfer_msg() into a common code
> path in order to make code cleaner.
>=20
> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)

I'm really not sure this is cleaner. You've got a net positive diffstat
and you add goto. That's not always bad, but in this case there is no
need for any complicated error unwinding, so I don't think this is any
better than the previous code.

Thierry

--XrjDSOQsS4AlGTKt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jUrcACgkQ3SOs138+
s6EKfxAAtkumcsN+SEoeIj4J6HUVsWcwFzlb6ZBmi8DA9VL8T782x5gPJZKJ8Ow/
S5sxa2rtyLN6jKkMkFCfejma/gENZVbvezVV1+4b1gK0WWAz8fwlsSUVFrMrYodg
dz/Ni8IzatgDS2ZtGLXuRq21qZEwXS5ng3N8dCrT3C2dUzizdsWLZUJBBdFSB5kB
dPNbrd47V0WH1MGpAdZ4g5iZgoe5PWp0KYcP/pwJw9a02RWXhYCyS+jt9/AtDnMZ
099YEs5JFZy4GmTEoabxc88uoTvcWtyzIOLNoha/YcO/G9TaMjfJMunl8s1ZK96G
uHANcX/Ycie/DRm9KUkrR/vPSoQJJr7khut9aFGt/Futa9bOb5j2aTb9wx8Yzv0U
IKU2j1YyqLyOJyzH7WQu93HIc786Sfl2dWc3T2mHGX/envM4xzr0/+SVdnjbVnqI
ZEuLjyHdQdfmRd74VOeRYRtFzhoe5WV2DzLQK+c/uulujatyCR82rfJFXQWDAVFU
a6vTU4gCTEv3Mev43oAmLEg/7Wf4o/20VbMsmYtE/ya8qwtbY9iKWOtj3mCkrpS6
nPriA/8nDswe5Frr1xyJpjMjq15E2gwKFvg8zFeQpz/sfKuAbuPIiM1msyItP1qz
4Q8k+TuWsL+wKgug1ybdthcnlqru+k1CavyzMhQbF+c3d0CYTKU=
=hwE/
-----END PGP SIGNATURE-----

--XrjDSOQsS4AlGTKt--
