Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F65111E63E
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2019 16:12:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727546AbfLMPMP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Dec 2019 10:12:15 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39335 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727499AbfLMPMO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 Dec 2019 10:12:14 -0500
Received: by mail-wr1-f65.google.com with SMTP id y11so7022136wrt.6;
        Fri, 13 Dec 2019 07:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5xjMnK8d3jzGk55yKrr3T8iLeWJCVMJrKa58oe9VrAw=;
        b=u0CvGYAn/bMZA/crdgBKxOSEJyGgQ5RshzxacnadteTrtuJBI7GaIm9C02V5VyiLkQ
         FMt7evI11sHvfUqfUsloNQ01INbVsqHR/BjkYbI7ogT8Ur8+8hwgS7lfNFiu6DRLX7V5
         1qowp3XY8eQpt5urCg+LDoLv38C63lNjjGTyiaDc1z5AYhrNYrYzGvg4Lm8orXnVffwv
         663+wdGHu3u22PafCvUx19iuJAubYd2/ThGLdxbLK0kMaEmhMW3Pv3/doGrI6cd738ga
         66MXV1s94wuscDXSvi/b7Kr99cwMClyowaHukz+nMDcTeYPMP5xhteEtqzyAumxaQqdx
         Dowg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5xjMnK8d3jzGk55yKrr3T8iLeWJCVMJrKa58oe9VrAw=;
        b=frwSwTH+6XkJPJZoZ42ywIh3EpPydGGr2hm9SCNBLFHahVEdxeTmcIoOhVWqISUiFZ
         6+DRApOsEwU5qy17EPPchjjf8rK3vQIO7PRfnHrRh/R4vcQ0zY2kFzhTNgY4k/V0/vWD
         aSCcD6sanYcBUg2A/Ad/ejLVPebYZYEsK0wdLgGtJJHRd/TjarROuv8G8LHjrrqL3Mii
         C2g6XgnM4CLIqQwmrkjsepuo2TKgKVVBNL3yGkGAWZ31RQ1O3XcWIZJBcTYD1AmAHORR
         azB4bcNpJVXhKcwew4Xr4h334Pn/8+WNrKTIzeZ/GFXo21MA5ayM4yHKnl6BNa0rFprj
         Jvgg==
X-Gm-Message-State: APjAAAUJNdr4WfVKA5XWiO4jqp4gv6g9xURpR6YqIF31KUjofAZ9JPs6
        +V2yFvO1x5j5ulNxGb9hJuI=
X-Google-Smtp-Source: APXvYqwpzk77923HcAksbraHc0T9/edYcR0wf0BywZ09CBJMLjJVF6VvY4snaopC5IjgcmLM4Kg96Q==
X-Received: by 2002:adf:df90:: with SMTP id z16mr14214961wrl.273.1576249931170;
        Fri, 13 Dec 2019 07:12:11 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id 16sm10475010wmi.0.2019.12.13.07.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 07:12:09 -0800 (PST)
Date:   Fri, 13 Dec 2019 16:12:08 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] i2c: tegra: Support atomic transfers
Message-ID: <20191213151208.GC222809@ulmo>
References: <20191212233428.14648-1-digetx@gmail.com>
 <20191212233428.14648-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="GZVR6ND4mMseVXL/"
Content-Disposition: inline
In-Reply-To: <20191212233428.14648-2-digetx@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--GZVR6ND4mMseVXL/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2019 at 02:34:26AM +0300, Dmitry Osipenko wrote:
> System shutdown may happen with interrupts being disabled and in this case
> I2C core rejects transfers if atomic transfer isn't supported by driver.
>=20
> There were several occurrences where I found my Nexus 7 completely
> discharged despite of being turned off and then one day I spotted this in
> the log:
>=20
>  reboot: Power down
>  ------------[ cut here ]------------
>  WARNING: CPU: 0 PID: 1 at drivers/i2c/i2c-core.h:40 i2c_transfer+0x95/0x=
9c
>  No atomic I2C transfer handler for 'i2c-1'
>  Modules linked in: tegra30_devfreq
>  CPU: 0 PID: 1 Comm: systemd-shutdow Not tainted 5.4.0-next-20191202-0012=
0-gf7ecd80fb803-dirty #3195
>  Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
>  [<c010e4b5>] (unwind_backtrace) from [<c010a0fd>] (show_stack+0x11/0x14)
>  [<c010a0fd>] (show_stack) from [<c09995e5>] (dump_stack+0x85/0x94)
>  [<c09995e5>] (dump_stack) from [<c011f3d1>] (__warn+0xc1/0xc4)
>  [<c011f3d1>] (__warn) from [<c011f691>] (warn_slowpath_fmt+0x61/0x78)
>  [<c011f691>] (warn_slowpath_fmt) from [<c069a8dd>] (i2c_transfer+0x95/0x=
9c)
>  [<c069a8dd>] (i2c_transfer) from [<c05667f1>] (regmap_i2c_read+0x4d/0x6c)
>  [<c05667f1>] (regmap_i2c_read) from [<c0563601>] (_regmap_raw_read+0x99/=
0x1cc)
>  [<c0563601>] (_regmap_raw_read) from [<c0563757>] (_regmap_bus_read+0x23=
/0x38)
>  [<c0563757>] (_regmap_bus_read) from [<c056293d>] (_regmap_read+0x3d/0xf=
c)
>  [<c056293d>] (_regmap_read) from [<c0562d3b>] (_regmap_update_bits+0x87/=
0xc4)
>  [<c0562d3b>] (_regmap_update_bits) from [<c0563add>] (regmap_update_bits=
_base+0x39/0x50)
>  [<c0563add>] (regmap_update_bits_base) from [<c056fd39>] (max77620_pm_po=
wer_off+0x29/0x2c)
>  [<c056fd39>] (max77620_pm_power_off) from [<c013bbdd>] (__do_sys_reboot+=
0xe9/0x170)
>  [<c013bbdd>] (__do_sys_reboot) from [<c0101001>] (ret_fast_syscall+0x1/0=
x28)
>  Exception stack(0xde907fa8 to 0xde907ff0)
>  7fa0:                   00000000 00000000 fee1dead 28121969 4321fedc 000=
00000
>  7fc0: 00000000 00000000 00000000 00000058 00000000 00000000 00000000 000=
00000
>  7fe0: 0045adf0 bed9abb8 004444a0 b6c666d0
>  ---[ end trace bdd18f87595b1a5e ]---
>=20
> The atomic transferring is implemented by enforcing PIO mode for the
> transfer and by polling interrupt status until transfer is completed or
> failed.
>=20
> Now system shuts down properly every time.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 95 +++++++++++++++++++++++++++++++---
>  1 file changed, 88 insertions(+), 7 deletions(-)

I ran this on the test farm and the results are all green, so:

Tested-by: Thierry Reding <treding@nvidia.com>

--GZVR6ND4mMseVXL/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3zqkgACgkQ3SOs138+
s6F9NRAAhrADoRuLa9YvQLDZbxpA/Tnpsb8Qm67NM8YOmqAeKzOKlE3WRDH63mia
MgbZAOoO3x31sfcku/u71k0fVKdDW4XEmCyCmthqj1Sv1hP5F4ySpAlewQZ5xV29
O+TyJHpegVlBkO6m9cFUU3doeO081pUPf98vGrHjX+S/8eWMnFp836L+ZOPHJ7tg
qC9MTCNdnQCMd/9JAvnWFO3l4d62gvyF6quaYVmanzbXrVZjeYQqfqzem8IeUsC5
6XowmsO9xCUR030DVMnIhzFlno9L7rhZ16qA8ael7v6Ehu95JIJ5Ptoz4NPytk15
loSt1C398luYGOxlVOoqN5eMiy2dYsiqoe/LCnkT8W8GnCCRhptcczyOddA2LoB2
n6jrzgGFRqJgC4vKowqMTLQdZ4qKCPbQbo7DKRy+xWYVLp+B5TMQ7A8I8j2u6Baa
yPOEY0qffNiPgR0xCyEqFRf5l+nuGdUQAmWOv6Bax+uq7U4lApTf7Dlc5HKcvWKh
8+PzEsQ94lrORe/COI2BNCrVfoyqne1ltTrJmE7aryhY3FR8S+RBEQEmju9mB/JO
ScvvU/wzg5ncg5Fy8U6dv1dhcRiqLHk/0Ejc4/MAZSHgUEXwldqsxSUNguRBpeK1
SQhtkNgXOkCnjhQPDmKpbKGFobvSCf1ZH9gdehvvAMasyTykdeg=
=j5aV
-----END PGP SIGNATURE-----

--GZVR6ND4mMseVXL/--
