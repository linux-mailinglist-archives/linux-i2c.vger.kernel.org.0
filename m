Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA50A2721D9
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 13:08:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726489AbgIULIt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 07:08:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbgIULIt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 07:08:49 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C398C061755;
        Mon, 21 Sep 2020 04:08:49 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id j2so12283456wrx.7;
        Mon, 21 Sep 2020 04:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ewG0hJIfpi/oaXxLzF8ki7JyUeZvpwdBVrzQVFRRcpI=;
        b=AUaGvRVvoZoqEsosmGBYZNWP2WKKYqNtkJ2PmBh5qYnki/7KvKEuacjbVzde5nOo17
         04HGTRE2vCbePlLRzNwTR0NyveJI/t1XKqNE7wPl8beQ0WiSkqzO9Fqgv2+Kk4+h0Ovh
         G4ZiiXs1lVjhEBPO7aTBpm97nQXe8I1frtOBKi4LgfjKKfuD6pGX4Zxk85Nj/EOkUMgC
         GNudU9/+zyce2nh7NV/i5+UJNerXziW9osDLIukzuTUctJXNPUJL0FseQ/W3gQ3hZJhj
         ZWzv4BMqWGo85Bm/Dh+bhAWsPr8C8XkahkPLjNI4tUHVgFdwPZMXHVAozGPWKR8nArXt
         hkzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ewG0hJIfpi/oaXxLzF8ki7JyUeZvpwdBVrzQVFRRcpI=;
        b=V7Neb3VJc1N3R3NzKMB3Z9/55LWHkOie2m+YVS5rK8oO6/el0yVcUemH1GNA3B+Oq9
         8LPhc/3Q0B2EaP9meuzgliqCm4/9WyHHWRB3zHm0c73i21XpuR8ISaqE//+P/Knfugb8
         hXEyLOHIxPP5Z4mtnYqmW2xIqvW8/0U2Hf/q2zXLpl8UbN3Q9PHohWzVU2U5W1G9RaCR
         XCecGgLij3laABUUZZ89zJzvA17sbbaxxyOjpa8OTu5+zJrNoyWdg0vpq24OupWfxH3o
         Fp9ggJPIhOA/qj7ilcYyJX5lxUmsUsugcAkcO5ajbWJ1tgJylQB6ZvYSpE+WVLykfUy+
         6AgA==
X-Gm-Message-State: AOAM533bHZB2PI897AO7ZSYSJflexPAZZ0u+vca60iZsVZPzg9VfdWD9
        F3AU3ku41WuaR92+A74e6TI=
X-Google-Smtp-Source: ABdhPJwWrBcpKmI/ruzT96KVRnHiO0M4IXUmSKVM+yS+Du9H7ITXXpDV/6CyFc4A1C6WrIjZNxHimQ==
X-Received: by 2002:adf:f34f:: with SMTP id e15mr49898322wrp.387.1600686527926;
        Mon, 21 Sep 2020 04:08:47 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id k84sm19378799wmf.6.2020.09.21.04.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 04:08:46 -0700 (PDT)
Date:   Mon, 21 Sep 2020 13:08:45 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 12/34] i2c: tegra: Use clk-bulk helpers
Message-ID: <20200921110845.GE3950626@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-13-digetx@gmail.com>
 <20200917113846.GX3515672@ulmo>
 <175e7f54-36f0-32c6-35a3-14c5b5e89e95@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="G6nVm6DDWH/FONJq"
Content-Disposition: inline
In-Reply-To: <175e7f54-36f0-32c6-35a3-14c5b5e89e95@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--G6nVm6DDWH/FONJq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2020 at 06:01:56PM +0300, Dmitry Osipenko wrote:
> 17.09.2020 14:38, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Wed, Sep 09, 2020 at 01:39:44AM +0300, Dmitry Osipenko wrote:
> >> Use clk-bulk helpers and factor out clocks initialization into separate
> >> function in order to make code cleaner.
> >>
> >> The clocks initialization now performed after reset-control initializa=
tion
> >> in order to avoid a noisy -PROBE_DEFER errors on T186+ from the clk-bu=
lk
> >> helper which doesn't silence this error code. Hence reset_control_get()
> >> now may return -EPROBE_DEFER on newer Tegra SoCs because they use BPMP
> >> driver that provides reset controls and BPMP doesn't come up early dur=
ing
> >> boot. Previously rst was protected by the clocks retrieval and now this
> >> patch makes dev_err_probe() to be used for the rst error handling.
> >>
> >> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >> ---
> >>  drivers/i2c/busses/i2c-tegra.c | 187 ++++++++++++---------------------
> >>  1 file changed, 67 insertions(+), 120 deletions(-)
> >=20
> > This is tempting from a diffstat point of view, but the downside is that
> > we can now no longer validate that all of the necessary clocks are given
> > in device tree.
> >=20
> > Previously the driver would fail to probe the I2C controller if any of
> > the expected clocks were not defined in device tree, but now it's just
> > going to continue without it and not give any indication as to what's
> > wrong.
>=20
> The clocks can't be missed randomly in a device-tree because they are a
> part of the core tegra.dtsi

You can easily generate a device-tree without using the core DTS
includes.

> The tegra-i2c DT binding isn't converted to YAML, but once it will be,
> then the dtbs_check will tell you about such obvious problems like a
> missing mandatory property.

Once that has happened, yes, I think we may be able to simplify the
driver. But before that happens I don't think we should throw away our
only line of defense against broken device trees.

> Even if clock is missing, then you won't miss this problem since I2C
> shouldn't work in that case.

But the whole point of this error handling here is so that we can make
it easier to find the cause of an error. I2C malfunctioning can be
subtle. You could have some EEPROM on I2C that you normally don't touch,
but then at some point you try to access it from userspace and you read
garbage and then you need to start looking why this is happening. The
whole point of error messages is so that you can easily find the root
cause.

> There is a Qualcomm I2C driver that already uses clk_bulk_get_all() and
> doesn't worry about "accidentally" missing clocks.

Just because one particular driver doesn't care doesn't mean everybody
else should stop caring.

> It's still possible to add the clk-num checking, but it should be
> unpractical. We could always add it later on if there will be a real
> incident. Do you agree?

If there's an incident it's already too late. The whole point of error
checking here is to avoid any accidental breakage.

Thierry

--G6nVm6DDWH/FONJq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9oibwACgkQ3SOs138+
s6EZ2RAAgnFLbz52UB5Ku0xCvsimvzg5yYWbshNk0/m0ex3U7THFqshpHlyD+9Rm
+WXk+36NjcIWq/kQxtvXIr9mkgUCDlOCo+4OT7Uh3GXDJLKZqAyAeUFMuhrZOlWZ
jhWDa6+ZREUj/Ot1nMTJrzKM0DJTNP2uf9OlGGjn3e3P1WOArpKw4Gcnqx/ZVJ5J
MrmF4Nq+uMNpbdpGAIqy62q1dyGFI0TcMp4NV5xxmenIVoKjuzhsfLomlBt+bSQE
tNTTv9B/1jowL+EcCQ4tSTU3i3ACgOvEQuSjGxo7xEa63e46lqux96SnGMxQfMLT
tTClh0iHsqDb8WdQiPbl44HZbPBlk8x6M8X+WO3wlqY80xP1bHfFShBZGNCTx5h7
UTSNNrpv6Uqi/PYMF+wp+84w5c0eml4Dx1Ybw9RV4tHeKetNSVvL2n/oXeqwwt6e
4aYzPG0ZSODpsacjQFCSqm2MiZ9cybW0PG2tX9uaxYobYwNEvyTHZM9gyzZBwpgM
uAP9fgoYNhquNmVvn5PssO8dGp1K6kvh01umjrV0ahSWKE3rtKkFWtCbwgV6oXLo
AGSGxT8oy7+en8ZmrW7YfmImPmP48a3MBGoJfrjRSk5Flxm6MLZZFhQKkuUF0pRl
nXHmDnhEM7CPLsg6tY8WW38rqZo9fP7sCU0IaJEVtoC5dZUNK2U=
=eGLn
-----END PGP SIGNATURE-----

--G6nVm6DDWH/FONJq--
