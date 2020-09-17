Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 110FC26DBD2
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 14:43:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727036AbgIQMnD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 08:43:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727018AbgIQMmX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 08:42:23 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97AADC06174A;
        Thu, 17 Sep 2020 05:42:12 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id l9so1902399wme.3;
        Thu, 17 Sep 2020 05:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=h23f+0CVelMxCyz72LzrDG5uYQIOPlWIq9Em2KmjoFU=;
        b=puBGiThhSXGDmlOmHslnD6UOi+uzdAO5gWZ4zZSG/wo5YK8z4KhmZEyEryN6u+h6Qk
         e8nyuPh0Uv2LZpk19V2FNhc08ALl6Okup17b4OWWp96FGs8a5SnUJocoqGyfZcQqbt/c
         oZNu/2YInoVo3joLy0wlGNWgArxZJuVvfYhz2uY9EobxB5qkWmdwKJot16auib8UyHH1
         8A07gGcVwQcuS+6GJ9TqmgBVxmG9f+IXMUOimyYbcg/pR0IsWzif5oq3Gck9Wk4T92k/
         Wge2F8ml+8FtIvNDhZhB2XFV/pC+ZQEXPa9+ATl25x3MEKhcn+E2ciwV/1d2Yq5AkFTR
         WRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=h23f+0CVelMxCyz72LzrDG5uYQIOPlWIq9Em2KmjoFU=;
        b=dhxjKuDPNOHd2HW1kBTFXQ4VPmv8sBaUWqKSvk2TTG4GqCzJFqPMtFDDPtJyiNUn/6
         2EYVluHiO3oh6CIV6vEtJkVYAWLSazUySRWC8X+/t51p7eGa+b8W1vAN26TDZD7E4FVc
         9p0g2pnCmGtyKwy26MfLWqh/O9TIqX3dJScgx2tmkrsFDUHf9KAJD8SmrjwFTMNOMZKe
         p5ASd/muDlbFQc3RCgbxuDVTrB7FqZnpE+0gthc8JVAWcGpSkuyqGyOjusG670WA8Rls
         lEM/yJEbnBj+fvs7fMzcjGrF/fSELs77NNXKG46733vJdt62gAoR1yaLddRiesb508bE
         I2cw==
X-Gm-Message-State: AOAM532PeOqJQo0kT1nq56NQRFYvtTZfif4yxlEAC9PL1mCDUZCwTkXY
        O/HlVd5OrlBWa2d12Cgsqs0=
X-Google-Smtp-Source: ABdhPJysq9ETrGqay5QFOErstjXAvBv2c8Hj0PEQi4EqvLjTQzhwYb4hbDm1kB8eyiwSit8VhFUY1w==
X-Received: by 2002:a7b:c397:: with SMTP id s23mr10116069wmj.174.1600346531347;
        Thu, 17 Sep 2020 05:42:11 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id w81sm11157547wmg.47.2020.09.17.05.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 05:42:10 -0700 (PDT)
Date:   Thu, 17 Sep 2020 14:42:08 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 19/34] i2c: tegra: Remove redundant check in
 tegra_i2c_issue_bus_clear()
Message-ID: <20200917124208.GT3515672@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-20-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hn090KliNom6wizA"
Content-Disposition: inline
In-Reply-To: <20200908224006.25636-20-digetx@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--hn090KliNom6wizA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 01:39:51AM +0300, Dmitry Osipenko wrote:
> The tegra_i2c_wait_for_config_load() checks for 'has_config_load_reg' by
> itself, hence there is no need to duplicate the check.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--hn090KliNom6wizA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jWaAACgkQ3SOs138+
s6HRYxAAlUDHxsJ3l8Wd8B6zngzHT7qiHNVLLx3MuUnWj9wmR5tKPlJJYiMaGrLb
S/HokvVegqCxfCpUoxmkIpcgthrJhcaSwoAOz0c3Zy/LmzOvIQwI/Kln8iYC52VK
KR6KR9ruKB8z01g4k+DJ+OZqQyiZH5ddMbQ/0OBJR8UcnpIYgGoa7gGqJRTpjnqO
dv4dUf6PlX4t8bpovE+KB9P2AAPcX/JrqSMkody9GagEQK5D+JdqQ4wbTic61pb4
frJ7mIMpm5J2Be/mrsUTfTYWde4DpaI9ZXawm6fWZzPRWnkuXx603qFf8xungjPR
jWy97LiiD5lx/CrfPpRNO3KY6CTjurGAjF5P7IgjlbEDEVm7BhPaSbcl1gG2rh1y
2b2DEfB6H1fNSJJZV8CiMFLf3Z+jdzoPKAb2JlivaguoFGHIeyVD8bmgVIIIosVu
sb8czk7NIJbHltMGM0HOOX/aPsHWJqF2NuzhIEybp8Zj3cjSb31KYjWESm6glmsf
W2/0sPibO9yXXZ0ySxJWX/2TbdCuJaceSQBBzl4l047kRAsUqshZwWxPrnSXcstD
vR0KCAACRUfPSayKub6hHJ98o6lkKqfFXBH737q5vCa8Qvof8RH3xx2Y9XwzBnua
J7a1uvwoxnQ1snixx50wixFghmrBXpvKOKZ4jGyu42IGb3+cJvY=
=UcSp
-----END PGP SIGNATURE-----

--hn090KliNom6wizA--
