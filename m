Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B20411E651
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2019 16:20:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727508AbfLMPUX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Dec 2019 10:20:23 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55593 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726908AbfLMPUX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 Dec 2019 10:20:23 -0500
Received: by mail-wm1-f68.google.com with SMTP id q9so6784275wmj.5;
        Fri, 13 Dec 2019 07:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=IyM9kYryGwhS/vfw2Mg4/Xx3FqaSXsAW203JftzNDs0=;
        b=N28oMX0/frD35kBPCdODSXIneJVNs1piLH+1pf5vlECwg/XmdCWl9aKoeRPWGjYzFR
         4lr5StryK5t51Q41QZyl2qz0JADZ0tqpK7k0i0gXbsw69ldYS92j676yE7Edq7PyJ5rt
         B13QJHKGK/QfHYMYp7EGfvfHlpM4IO5nfpuikdQlUYj8ZGFNHuskv+OrDWrfYTCSFC7Q
         pTGPgBgL/nDypJcr1Ts4nYzA80Fxh9+4mpIZizmvYjq84k1PztNVBd9eQnyjPp1Ay0a3
         vXSlPYpjBZ/eHXyW0qrQyaUjHIrBi90tFN1aR/WnyRm7CPlX6JsrOzbLvdVjc1+vGKVF
         vjnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=IyM9kYryGwhS/vfw2Mg4/Xx3FqaSXsAW203JftzNDs0=;
        b=tT3wXTxlk6f7KrfGSzcxdmyJYDRKTvnL0hXTVGv9pas2GYj2gbNaz5KqR7PIuY3HEz
         11Ehj1csevtLB4womjbXqfAEYR7qsDWU/DzbuGSUx4jhhr3F3W3l0/dKGgiccy4gDnz5
         1VR3tdydC8FaNCv+l54ifzQmLipaHDX8CA/RIKtugxbYfbvNr5gYhetcGBScIdilvy2N
         KElNNn3b/craP/EHW2mQNlBsSdH7y6DBw/rAY7EPP6WZeLnvkKkPzVbAa16mDKtthovm
         hdL+iD8anaJB6oG4BW5M6cbyXB6J4DFc9aejDsWZy+sDgQmuz4mCljIG6DCidSPYVfp4
         EiQg==
X-Gm-Message-State: APjAAAURI4407mGYAEUsz2B2CgyhMXMdgb5eOSLOkmvLZgzDSVsIzBdC
        xEHnCtFP8mDEeTZLsnm31z8=
X-Google-Smtp-Source: APXvYqx9j6cHiFKuIvTAZD33wJm3bj0hty8LlcLFoWEHTfNTBH1O47z2QWNQohvK+Dlm66pSt3k1SQ==
X-Received: by 2002:a05:600c:28d:: with SMTP id 13mr3871453wmk.52.1576250419664;
        Fri, 13 Dec 2019 07:20:19 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id y20sm9932789wmi.25.2019.12.13.07.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 07:20:18 -0800 (PST)
Date:   Fri, 13 Dec 2019 16:20:17 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] i2c: tegra: Support atomic transfers
Message-ID: <20191213152017.GA293199@ulmo>
References: <20191212233428.14648-1-digetx@gmail.com>
 <20191212233428.14648-2-digetx@gmail.com>
 <20191213151208.GC222809@ulmo>
 <5a2a9cef-f4ed-c5a4-1f35-c89c3b5106a6@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cWoXeonUoKmBZSoM"
Content-Disposition: inline
In-Reply-To: <5a2a9cef-f4ed-c5a4-1f35-c89c3b5106a6@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--cWoXeonUoKmBZSoM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2019 at 06:15:12PM +0300, Dmitry Osipenko wrote:
> 13.12.2019 18:12, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Fri, Dec 13, 2019 at 02:34:26AM +0300, Dmitry Osipenko wrote:
> >> System shutdown may happen with interrupts being disabled and in this =
case
> >> I2C core rejects transfers if atomic transfer isn't supported by drive=
r.
> >>
> >> There were several occurrences where I found my Nexus 7 completely
> >> discharged despite of being turned off and then one day I spotted this=
 in
> >> the log:
> >>
> >>  reboot: Power down
> >>  ------------[ cut here ]------------
> >>  WARNING: CPU: 0 PID: 1 at drivers/i2c/i2c-core.h:40 i2c_transfer+0x95=
/0x9c
> >>  No atomic I2C transfer handler for 'i2c-1'
> >>  Modules linked in: tegra30_devfreq
> >>  CPU: 0 PID: 1 Comm: systemd-shutdow Not tainted 5.4.0-next-20191202-0=
0120-gf7ecd80fb803-dirty #3195
> >>  Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
> >>  [<c010e4b5>] (unwind_backtrace) from [<c010a0fd>] (show_stack+0x11/0x=
14)
> >>  [<c010a0fd>] (show_stack) from [<c09995e5>] (dump_stack+0x85/0x94)
> >>  [<c09995e5>] (dump_stack) from [<c011f3d1>] (__warn+0xc1/0xc4)
> >>  [<c011f3d1>] (__warn) from [<c011f691>] (warn_slowpath_fmt+0x61/0x78)
> >>  [<c011f691>] (warn_slowpath_fmt) from [<c069a8dd>] (i2c_transfer+0x95=
/0x9c)
> >>  [<c069a8dd>] (i2c_transfer) from [<c05667f1>] (regmap_i2c_read+0x4d/0=
x6c)
> >>  [<c05667f1>] (regmap_i2c_read) from [<c0563601>] (_regmap_raw_read+0x=
99/0x1cc)
> >>  [<c0563601>] (_regmap_raw_read) from [<c0563757>] (_regmap_bus_read+0=
x23/0x38)
> >>  [<c0563757>] (_regmap_bus_read) from [<c056293d>] (_regmap_read+0x3d/=
0xfc)
> >>  [<c056293d>] (_regmap_read) from [<c0562d3b>] (_regmap_update_bits+0x=
87/0xc4)
> >>  [<c0562d3b>] (_regmap_update_bits) from [<c0563add>] (regmap_update_b=
its_base+0x39/0x50)
> >>  [<c0563add>] (regmap_update_bits_base) from [<c056fd39>] (max77620_pm=
_power_off+0x29/0x2c)
> >>  [<c056fd39>] (max77620_pm_power_off) from [<c013bbdd>] (__do_sys_rebo=
ot+0xe9/0x170)
> >>  [<c013bbdd>] (__do_sys_reboot) from [<c0101001>] (ret_fast_syscall+0x=
1/0x28)
> >>  Exception stack(0xde907fa8 to 0xde907ff0)
> >>  7fa0:                   00000000 00000000 fee1dead 28121969 4321fedc =
00000000
> >>  7fc0: 00000000 00000000 00000000 00000058 00000000 00000000 00000000 =
00000000
> >>  7fe0: 0045adf0 bed9abb8 004444a0 b6c666d0
> >>  ---[ end trace bdd18f87595b1a5e ]---
> >>
> >> The atomic transferring is implemented by enforcing PIO mode for the
> >> transfer and by polling interrupt status until transfer is completed or
> >> failed.
> >>
> >> Now system shuts down properly every time.
> >>
> >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >> ---
> >>  drivers/i2c/busses/i2c-tegra.c | 95 +++++++++++++++++++++++++++++++---
> >>  1 file changed, 88 insertions(+), 7 deletions(-)
> >=20
> > I ran this on the test farm and the results are all green, so:
> >=20
> > Tested-by: Thierry Reding <treding@nvidia.com>
> >=20
>=20
> Thanks!
>=20
> Does the farm test board's shut down by verifying the
> hardware's power state?

No, that's not something we test. I was primarily running this to make
sure we don't regress anywhere else.

Thierry

--cWoXeonUoKmBZSoM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3zrDEACgkQ3SOs138+
s6GYQQ//ahbs76xzIAUlts/MDie7XTbSsoyXAOp2kMoEfIn0nVo4ewTgmpx05ekN
Rw18GGGzFBjoLIpJLBclbKFrtyqq8Ztim+qoWdonDKDTGkTsXajen0tv6sjvQf8r
10eAPZ2MA0mVIUww/YAVace6Ao/WisHJ4xN9CgHAkCdKw2QCnl4C4RAqD2QK5Ks/
znryFOsJIZbHyVRT/KnaqFc765E9S6UMGh2kqkMc8WjZp+cjuFq2IfmSG+sQr09H
+LVL8HEJuBvVJTf38CT4hzlqJEXRYFwFcYpks/p+uefhfE51O9BCcEir+TeH8crc
1rbMXtuOFIrs2lU5l2u9dOBtd7qQxh0cbBf0Qvwmb2doZR8w4Mz7bAI07UB+OeSi
BeZBzheqo4/USxLqnhoBoUryFtJ60m8P49I80mIcmVUYPlEZEisszAW7j9eV//zE
3YXwZRDv6P5DqmZ3saXF4jkYeb8ZDWrfwQDsoXEgoYhanjZfkM3uC6wNtwXth/iN
/2QQN/+nmwoF3oKCBYao7u+KynYAhv9tkT1kmVtojXfGqSqCfJVs4+CVoc/SfftG
nkb6zEsH2aSfAH1LJCJodukRrTAbOoyVBmqB/BCc2NHkLLOxvP9zsc+1TfIC7Fkw
qLyMwgRrkVd6No9/0Y3Yje4tblRxM1SuGsp7RKUibHkQIO5dStQ=
=SwoH
-----END PGP SIGNATURE-----

--cWoXeonUoKmBZSoM--
