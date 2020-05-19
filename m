Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5436B1D9BCA
	for <lists+linux-i2c@lfdr.de>; Tue, 19 May 2020 17:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729206AbgESP5e (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 May 2020 11:57:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729124AbgESP5d (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 May 2020 11:57:33 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69449C08C5C0;
        Tue, 19 May 2020 08:57:33 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id t8so1056931wmi.0;
        Tue, 19 May 2020 08:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wVHnheUXb3rHqUKvRML054BsK6ulx8JWBVXMW18p7w0=;
        b=U7zuFt9CsNY863Jhdrf0UCrPxbW9bKXQNboA0eG91Q0LogrEFouMiy68rhQUCHuwdc
         NVyKKyHeM2oqkaB7Jx/ZJaamUs3uXz2e/7/OJYypxd5ON5cenIimGzLLmjC4mf2ikgdQ
         sTXh01dezYSmMjDtS1r/lVZkecz0XTJrIDMwJK1kQ5q7LlLc7QFfb7BpUOlhm5mVM+Q9
         vIUa46IF0IpLwqhP81fNB2/VSkfxSmNjixnbQk/amBlZEX+NDlr8bGcFehodc0d5Nxhq
         1bxWMkXdYch2Mh7Vf9+pXoWzi9ooyvLZD5+gx5S5vxyMizqRmhMys/hvxd+h53yzsIsc
         Rb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wVHnheUXb3rHqUKvRML054BsK6ulx8JWBVXMW18p7w0=;
        b=DyZO25snnNEuO0Blx3YtA0131iqsLspOYcqdlHUzrfyboMwptAKRR6XXkNV3jGSj6Q
         yQiqVFghtO2BnJzy7WjjPm95qDSiYGciKJ6KXzGQXKVYmP4Ocg6qs5XfoHjUvZYGtKCU
         ZNwMWvjqnBhccMS1xYGPDl9Gaxkka9mR+QN6iU+fcmKhg2y2whRGeZi7QFUg+cNqn6pR
         1apWtEmOQchGF+DCDzDIP/WT6Ds7Ef9sbj5d2efwywWqapXrzNr7OASURa2XHgWfXuYp
         AtQno/XtnZefihjeANsLH53YFepoOdXZsH/Dbkqsc5m9QG2MMT0tIwUClsK1TQXx1mYd
         13PQ==
X-Gm-Message-State: AOAM530wR1aMrdw0Qmvp3JDn4J/1pEptctl93BUfsVvdS91ZXCncHJs9
        OU+Dxgd0ZmJSoHGUriu5VrE3sBGv
X-Google-Smtp-Source: ABdhPJy5ugWSpEqoVqs8XKxTn/m0rDzLaorfTKIJeC6HArn3zTz1dBerxI0JFBk0FiF291adNaOWoA==
X-Received: by 2002:a1c:6204:: with SMTP id w4mr56809wmb.55.1589903852097;
        Tue, 19 May 2020 08:57:32 -0700 (PDT)
Received: from localhost (pd9e51079.dip0.t-ipconnect.de. [217.229.16.121])
        by smtp.gmail.com with ESMTPSA id q17sm127445wmk.36.2020.05.19.08.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 08:57:30 -0700 (PDT)
Date:   Tue, 19 May 2020 17:57:28 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Jon Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/5] i2c: tegra: Restore pinmux on system resume
Message-ID: <20200519155728.GA2113674@ulmo>
References: <20200506193358.2807244-1-thierry.reding@gmail.com>
 <20200506193358.2807244-3-thierry.reding@gmail.com>
 <2a0404ac-73bf-2f27-9147-8bef28ae995f@gmail.com>
 <20200508103130.GB3030605@ulmo>
 <f149bb64-e93b-364e-47bc-c851e9638a35@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
Content-Disposition: inline
In-Reply-To: <f149bb64-e93b-364e-47bc-c851e9638a35@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 08, 2020 at 06:00:57PM +0300, Dmitry Osipenko wrote:
> 08.05.2020 13:31, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
> >> Is it legal to touch DPAUX registers while DPAUX is in a suspended sta=
te?
> >=20
> > DPAUX is never runtime suspended and the dependency from the I2C
> > controller on DPAUX should ensure that they are suspended and resumed in
> > the right order during system sleep.
>=20
> 1. Could you please explain why DPAUX is never suspended? Isn't it a
> problem?
>=20
> It looks a bit odd that driver is doing this [1][2]. RPM is supposed to
> be used for the *dynamic* power management. Should we remove RPM usage
> from the DPAUX driver?
>=20
> [1]
> https://elixir.bootlin.com/linux/v5.7-rc4/source/drivers/gpu/drm/tegra/dp=
aux.c#L524
> [2]
> https://elixir.bootlin.com/linux/v5.7-rc4/source/drivers/gpu/drm/tegra/dp=
aux.c#L591

Looks more like the intention had been to eventually enable dynamic
power management but I never got around to it. The runtime PM
implementations are what's necessary to runtime suspend the device,
so all that should be needed is hook up the pm_runtime_get() and
pm_runtime_put() calls correctly.

> 2. Could you please explain why I2C driver has to care about restoring
> the pinmux state? Why pinctrl driver isn't doing that for I2C and
> everything else?

We could probably do it either way. I did it this way because the
runtime suspend/resume will get called either way, so might as well
reuse the same code paths rather than add context save/restore.

Thierry

--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7EAeQACgkQ3SOs138+
s6GxKA/9F1d7M5zu28FG0E8bt+oxWhTeupG07NNioVF1IUKq6TKzLAcMcRIiJ6tk
QKxlEEEQJRdzGQ49rX0WZE6Qanqy3tf3id32rS6vbna4mIImdaWt1jAGLICubLus
689DsfyFIGHiZCdcbsCC23Mpa3YkQm6fcet1ymObfV8WjMGgr8H2sCqkzC2xX//a
KXlXUdA6GEXsrWx9NJIvk+U7+M0o7mraj6hM7lm4Qy6eNSu/NhvPibZ+IDGEBbJY
daGf//ugxAp5/byoK6v09XJUniI2sXQhoMx8zBgnTitAOwiubNd3Mjd4hgiHRTu/
+OBECb1vyTNizvSCb61qNqpMABTS+NymosVCTSwxDyqmlFwW9TKexO2Rsd31o05P
s2oaMQjAdrcwXSbS6XImANfnUBfVhw0RQu0Nc3Gr21+oKnXyGnIEdUlY6nKYKWIg
XckwfFytvCK51L/xdzDhsTUUCbcUxNMWwTDot3Ul5DPYrvzBK41Cya8Z8Ik+w7rf
9KzJ9FBnnLs3TZ5c+7quEEGlUGNpyj5CNQvjXMW1ib9F44vH0BJ0bCtEPEWMlimO
2JkI2iDdRQ1zQUV9gnvXI1WuwdoibNkDO1PAuQGvIY3XzsqzyKaDxW+DERTXeriZ
AWjBe000xllVPEvZMYhcxDdgNvbbxgMLMJtVvICxKW50F7w9wRY=
=Osjb
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--
