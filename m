Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6107862F25B
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Nov 2022 11:19:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241298AbiKRKS7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Nov 2022 05:18:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239887AbiKRKS6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Nov 2022 05:18:58 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C6CF8FB00;
        Fri, 18 Nov 2022 02:18:57 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id p16so3308740wmc.3;
        Fri, 18 Nov 2022 02:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+bs3XWb/FSMOotckh2VpyC5u8RoljJ5uQ85+dceixyc=;
        b=A7Vwu0KE1FOX/cKsNx+Tu51CqqvMeqsvFG2qBTq5hO/sQ019xC7m8jVSTXuFhzIL7c
         NtoDjn0FZjNYF3jzkJiS29/gwqz8aHX1gAMWoaJm+5Zod+drKy3gyjMsw4OcgUe8MIyb
         Y0ZN90/GK6PZMcCEp7JYgHd73nj0s9d3AKMytsqkZPg/K/XduZ1R7Jvwfv6z5QYqMH5D
         rCbwELrs7LfKIOU3v9ByWFqlTooyIf5Zby6T8pzyoJPEDPuBmmCs0+AklE2WvQt4ZTSw
         xEDYzh6MNrdK8j15GmnCUPK+evLMhC2gYiEohH/VvcyEyWA2xoCCSSLUNwo934BKGVe8
         I2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+bs3XWb/FSMOotckh2VpyC5u8RoljJ5uQ85+dceixyc=;
        b=ijdkLBneU3uwlj2BsIiGGV6KdwODycTg8VmfyOyLJUw76yPPBMLgR9iRN9mgG374CC
         /V/4QA6yjj3MtAo5znRtMrkoqY2F0n94NbVdM8pSCzz2TuiKlswq2lrp0+vKasIQal9m
         PSe3SGVdJUF2BdapIZtoiwn37QjkgrTDGk1Sbmx7xyrgcJMb4HkA/DJ1HFN+kp//8Erk
         rFOqJK45193vVROIE5GOr5TVH+SVTrarfeCc3ugTdYnM6xYQnzCbtclFq3o47k8d8XKz
         D2c8cVQmXG1sbXtAGeDJZnsxIhZ0qaHMqQWUyTYCbpYb1z5Dt351K9yHZnl0nTPX/+nv
         hlkQ==
X-Gm-Message-State: ANoB5pke8j3w+GHli2th2tg/G5Vl6Svi+KRLC1mOfsa/n5AGG3+0fSkv
        o6evxsBT/ThYJHHNXPVYfGo=
X-Google-Smtp-Source: AA0mqf7OxTVeJ5FdeJ785O2O00LPnh0P3jU9/Ktp6dPi6D+TJG/j9OqeDlvH6cOBOQ7FRzr+19CEQw==
X-Received: by 2002:a1c:6a02:0:b0:3cf:71e4:75b with SMTP id f2-20020a1c6a02000000b003cf71e4075bmr4613838wmc.114.1668766735412;
        Fri, 18 Nov 2022 02:18:55 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id i3-20020a1c5403000000b003cfc02ab8basm8744040wmb.33.2022.11.18.02.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 02:18:54 -0800 (PST)
Date:   Fri, 18 Nov 2022 11:18:52 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Akhil R <akhilrajeev@nvidia.com>, christian.koenig@amd.com,
        digetx@gmail.com, ldewangan@nvidia.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        sumit.semwal@linaro.org, wsa@kernel.org,
        Zubair Waheed <zwaheed@nvidia.com>
Subject: Re: [PATCH] i2c: tegra: Set ACPI node as primary fwnode
Message-ID: <Y3dcDCgC42QcMX3k@orome>
References: <20221117100415.20457-1-akhilrajeev@nvidia.com>
 <29db0e24-4f7c-e3dc-91ce-2decf6a253a5@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="FutM8JfzTk8389nd"
Content-Disposition: inline
In-Reply-To: <29db0e24-4f7c-e3dc-91ce-2decf6a253a5@nvidia.com>
User-Agent: Mutt/2.2.8 (2022-11-05)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--FutM8JfzTk8389nd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 18, 2022 at 09:38:52AM +0000, Jon Hunter wrote:
>=20
> On 17/11/2022 10:04, Akhil R wrote:
> > Set ACPI node as the primary fwnode of I2C adapter to allow
> > enumeration of child devices from the ACPI table
> >=20
> > Signed-off-by: Zubair Waheed <zwaheed@nvidia.com>
> > Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> > ---
> >   drivers/i2c/busses/i2c-tegra.c | 1 +
> >   1 file changed, 1 insertion(+)
> >=20
> > diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-te=
gra.c
> > index 954022c04cc4..69c9ae161bbe 100644
> > --- a/drivers/i2c/busses/i2c-tegra.c
> > +++ b/drivers/i2c/busses/i2c-tegra.c
> > @@ -1826,6 +1826,7 @@ static int tegra_i2c_probe(struct platform_device=
 *pdev)
> >   	i2c_dev->adapter.class =3D I2C_CLASS_DEPRECATED;
> >   	i2c_dev->adapter.algo =3D &tegra_i2c_algo;
> >   	i2c_dev->adapter.nr =3D pdev->id;
> > +	ACPI_COMPANION_SET(&i2c_dev->adapter.dev, ACPI_COMPANION(&pdev->dev));
> >   	if (i2c_dev->hw->supports_bus_clear)
> >   		i2c_dev->adapter.bus_recovery_info =3D &tegra_i2c_recovery_info;
>=20
>=20
> Do we always want to set as the primary fwnode even when booting with
> device-tree? I some other drivers do, but I also see some others ...
>=20
>  if (has_acpi_companion(dev))
>         ACPI_COMPANION_SET(&i2c_dev->adapter.dev,
>                            ACPI_COMPANION(&pdev->dev));
>=20
> It would be nice to know why it is OK to always do this even for device-t=
ree
> because it is not clear to me.

ACPI_COMPANION() returns NULL if there is no ACPI companion, which will
cause ACPI_COMPANION_SET() to set the primary fwnode to NULL. If I read
the code for set_primary_fwnode() correctly, that's essentially a no-op
for DT devices.

I guess that the extra check might save a few cycles by not having to
run through all the various conditionals, but it seems a rather minor
saving.

Either way is fine with me, though.

Thierry

--FutM8JfzTk8389nd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmN3XAkACgkQ3SOs138+
s6GiZhAAiPts5oA6T5oXg4xKYVPjsnsJNEEkfsSwNQm0MwuFNyiZvSoHonmwB/2r
nktVg9pG2Rf2QfQZG10BWx4kBqrvyOrT6JO4JgKEFwtOub23F/P2OeykJmbCY11g
tP7MxQnMA/4qEsjFos2EEG5EJrgoCtM31O9QXXnfvuWH6q6Yv9uoUvXTp/huQvl2
21knzvr0tT9nGvb+sdfSvAD5GyNu6I7C38wCsHTAQly1MCkjqF3afkkB+shDc2dN
6t+z/nE+v8/0Wqb2g17CmlFb59SV1ESHoxpHfn6B9Z/YbeDKQCxgPHxfwkmXNORs
sqoM6vbtpIaKTvgx6cMtxQ+dteQRZHBdace1IIEHFnztwSjKpr+S0VqV0oSJQThQ
noDq8NC/8wfeMA/2H66nSH4xP7jFA3vkbyFbVWFLN8PR5KnMhL9/nV34aSAauZAv
Ybjhs+ll0pQyx+JKL+nuMuEL5fWWEw2g77LR4hsL57lnSiP1nNwyPm6yI00Bivhy
XMDFrThYUI6NH/g/GNaTrRdxKMR0E/a2DatYASm+42VUFmuEMX47uSr5RJXPe9OB
JRA/JmTEtLcdUHxqCV9swuY/O28+AxwoiwFlYC1oLqX3WVpCxeDtHVk5kf7+0zeT
trotAZOs0nNRufTycA8p3DpGHhhZ3c0ftKlkYDSs8UhupE5GMno=
=rjSE
-----END PGP SIGNATURE-----

--FutM8JfzTk8389nd--
