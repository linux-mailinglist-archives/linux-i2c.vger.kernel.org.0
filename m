Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC6BF5A9AA3
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Sep 2022 16:42:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234888AbiIAOlA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Sep 2022 10:41:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234982AbiIAOkk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 1 Sep 2022 10:40:40 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D40E1286F9;
        Thu,  1 Sep 2022 07:40:25 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id bj12so35118782ejb.13;
        Thu, 01 Sep 2022 07:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date;
        bh=oGpl7pItr3EHWOEnJY9fD38ZGuHllIQRNMyk8Qf83dw=;
        b=N1FwxgN9415RIK+wBsTxPPtNnGwIPbgqlexuoTp0gTyyukByY5D4/sBDFaGeTlPYxR
         lOOhvFtuA+XrSCqIdLuIy948cFPddOMSkwMeeySAYhUbhZOYMWnbYCwysHXk0JsuG2oe
         bjiJho+SAZ15MgrYG5g3xdxtjaCgG/2UGqF6XNbKrQD4GvPoKKyNEYrLLaWypSs0tE2c
         6ydDKOelKqv/oB1+eC29Wr1gXl+d06QkhCbIv4bPGwda2G7FaME+L7l7Genx+GWwSw3h
         l3GEL4XWP0aCHEeKT/IBP3Qa5ke3lC+4Te207qzJd7aFeuQLm3AZOZSHKDdOl8DN3yIV
         DSvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date;
        bh=oGpl7pItr3EHWOEnJY9fD38ZGuHllIQRNMyk8Qf83dw=;
        b=bRzLrkGeILM7oQ3pAPiChf6QXT+BUm0Iwa5u0bEVBdi/OUa7lnYQ34YisCg2c+jRyM
         BCSDjZreGFTAu/SuKyEdo21hr8MsER8YWW7GzsVhXzcH03chpNGIOT5QHqH4p+IjuZ7K
         7nIHbXUfYig8RVOgNduMdeo4xhQuzl5PoL3XcRUhLGoE3OMInNAh9iDJx+0E13Qa2VWO
         kPqRuLa9XHJcizqVzfrJz3jGEb0aBZvqkKoUAHwFZ1qPCvuBZCCCP7bZUxRGMVEsHHtt
         mSLLwqGvrUkfHrHZRpupsAl9bGeiqNQEEDaNWB9D/F66pWF+Vt9q5qg0C06Fh1blU17s
         C1eA==
X-Gm-Message-State: ACgBeo0YiVuBVXSEpw+mXueC0AGteJvsf/njzXuj8mA5c+sApWAQsV4b
        b+I4KNdN77enzaO2tZ7nOAo=
X-Google-Smtp-Source: AA6agR6vUjQ/0PGeVFFQqXilMO5abv4F+H//fFBMRDUOkeFHP0ANy2GnhjFcuD7PPmwTjhM6SNM+6w==
X-Received: by 2002:a17:907:2cea:b0:741:6251:3a22 with SMTP id hz10-20020a1709072cea00b0074162513a22mr15534680ejc.6.1662043223741;
        Thu, 01 Sep 2022 07:40:23 -0700 (PDT)
Received: from orome (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id kx3-20020a170907774300b0073d9630cbafsm8045006ejc.126.2022.09.01.07.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 07:40:22 -0700 (PDT)
Date:   Thu, 1 Sep 2022 16:40:21 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc:     Akhil R <akhilrajeev@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "Kartik ." <kkartik@nvidia.com>
Subject: Re: [PATCH RESEND 1/2] i2c: tegra: Add GPCDMA support
Message-ID: <YxDEVUq3jbjnOmnI@orome>
References: <SJ1PR12MB6339FC1F82EB1BB7417E533BC0719@SJ1PR12MB6339.namprd12.prod.outlook.com>
 <ebb0764f-db92-d69d-49ac-151f4e3e0b8a@collabora.com>
 <SJ1PR12MB63396DC508F63807F1CE9901C0719@SJ1PR12MB6339.namprd12.prod.outlook.com>
 <fac10841-1682-845f-3e4a-5668f59caed0@gmail.com>
 <cd0374f1-2c05-7e61-7187-cfc9c42edf63@gmail.com>
 <SJ1PR12MB63397BBD4EF314A742680F2CC0709@SJ1PR12MB6339.namprd12.prod.outlook.com>
 <a7ba27c4-992b-28d1-f6c2-3937b4f275ce@collabora.com>
 <c9ba2629-fc81-cefd-0d6d-991084781ec3@collabora.com>
 <SJ1PR12MB63393F51E29BA1F85AD249DBC0709@SJ1PR12MB6339.namprd12.prod.outlook.com>
 <4f791065-e0dd-6ed5-f152-86d7be683490@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6EXBlDW1rh4vcfOw"
Content-Disposition: inline
In-Reply-To: <4f791065-e0dd-6ed5-f152-86d7be683490@collabora.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--6EXBlDW1rh4vcfOw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 23, 2022 at 04:32:11PM +0300, Dmitry Osipenko wrote:
> On 8/23/22 15:55, Akhil R wrote:
> ...
> >>>> What I am trying for is to have a mechanism that doesn't halt the i2c
> >> transfers
> >>>> till DMA is available. Also, I do not want to drop DMA because it was
> >> unavailable
> >>>> during probe().
> >>>
> >>> Why is it unavailable? Sounds like you're not packaging kernel proper=
ly.
> > Unavailable until initramfs or systemd is started since the module has =
to be
> > loaded from either of it.
> >=20
> >>>
> >>>> This situation is sure to hit if we have I2C driver as built in and =
DMA driver as a
> >>>> module. In such cases, I2C will never be able to use the DMA.
> >>>
> >>> For Tegra I2C built-in + DMA driver module you should add the dma.ko =
to
> >>> initramfs and then it will work. This is a common practice for many
> >>> kernel drivers.
> >>>
> >>> It's also similar to a problem with firmware files that must be
> >>> available to drivers during boot,
> >=20
> > Isn't the initramfs loaded after the driver initcalls? Wasn't very much=
 clear for me
> > from the code and docs. We did try adding the module in initramfs initi=
ally, but
> > couldn't find much of a difference from when it is loaded by systemd in=
 rootfs.
> > Will explore more on this if this really helps.
>=20
> It doesn't matter when initramfs is loaded. Tegra I2C should be
> re-probed once DMA driver is ready, that's the point of deferred
> probing. I'd assume that your DMA driver module isn't loading.

One problem we have with this, and it's another part of the reason why
we have the TEGRA20_APB_DMA conditional in there, is that if no DMA
driver is enabled, then the I2C driver will essentially defer probe
indefinitely.

The same would happen if for whatever reason someone was to disable the
DMA engine via status =3D "disabled" in device tree. And that's not
something we can easily discover, as far as I can tell. Although perhaps
code could be added to discover these kinds of situations.

Both of the above scenarios could also be considered as bugs, I suppose,
and in that case the fix would be to update the configuration and/or the
device tree.

> >>>> Another option I thought about was to request and free DMA channel f=
or
> >> each
> >>>> transfer, which many serial drivers already do. But I am a bit anxio=
us if that
> >> will
> >>>> increase the latency of transfer.
> >>>
> >>> Perhaps all you need to do is to add MODULE_SOFTDEP to Tegra I2C driv=
er
> >>> like we did it for the EMC driver [1].
> >>>
> >>> [1]
> >>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-
> >> next.git/commit/?id=3D14b43c20c283de36131da0cb44f3170b9ffa7630
> >>>
> >>
> >> Although, probably MODULE_SOFTDEP won't work for a built-in driver. In
> >> that case, change Tegra I2C kconfig to depend on the DMA driver.
> >=20
> > Since I2C can work without DMA, wouldn't it limit the flexibility of I2=
C driver.
>=20
> There are kernel configurations that are not worthwhile to support
> because nobody use them in practice. I think this is exactly the case
> here. The TEGRA20_APB_DMA driver dependency created troubles for a long
> time.
>=20
> If DMA driver is enabled in kernel config, then you should provide the
> driver module to kernel and it will work.
>=20
> If DMA driver is disabled in kernel config, then Tegra I2C driver should
> take that into account. I'm now recalling that this was the reason of
> "!IS_ENABLED(CONFIG_TEGRA20_APB_DMA)" in the code.
>=20
> Since all h/w gens now provide DMA support for Tegra I2C, then should be
> better and easier to make DMA a dependency for Tegra I2C and don't
> maintain kernel build configurations that nobody cares about.

This is a suboptimal solution because we have APB DMA for Tegra20
through Tegra210 and GPC DMA for Tegra186 and later. So we'd need to
depend on two drivers and that would then pull in GPC DMA basically on
all generations.

One potential workaround would be to have a fairly elaborate check in
the driver to make sure that for SoC generations that support APB DMA
that that driver is enabled, and for SoC generations that have GPC DMA
that the corresponding driver is enabled. That's quite ugly and it
doesn't solve the status =3D "disabled" problem, so we'd need that as
well.

Another thing that I've been thinking about is to use the deferred probe
timeout to remedy this. driver_deferred_probe_check_state() can be used
by subsystems to help figure out these kinds of situations. Basically if
we integrated that into dma_request_channel(), this would at some point
(fairly) late into boot return -ETIMEDOUT (or -ENODEV if modules are
disabled). So this would help with status =3D "disabled" and allow us to
avoid Kconfig dependencies/conditionals. Unfortunately it seems like
that is in the process of being removed, so not sure if that's a long-
term option.

What that doesn't help with is the potentially long delay that probe
deferral can cause, so it means that all I2C devices may not get a
chance to probe until very late into the boot process. We may need to
survey what exactly that means to better judge what to do about it. I
do agree that probe deferral is the right tool for the job, but it may
be prohibitively slow to get I2C working with that.

Another mitigation would be for the driver to keep probing for the DMA
channels in the background. Sort of like an asynchronous probe deferral
of that subset. Similar things were discussed at some point when the
whole fw_devlink and such were hashed out, though at the time I think
the preferred proposal was a notification mechanism.

Thierry

--6EXBlDW1rh4vcfOw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmMQxFIACgkQ3SOs138+
s6FH5xAAqTlqEFg0v+RseYBA6ke9pT/l555czmR5Tgl7x8KBcPhZEzL/SXIW8JLL
45No62nZBKM6Wk5WmXhbaq3xrH4xj339PKYg2gN2ZJ+E/eMDsF/ruFZK5LGpQ7vs
DQI2vK1ER1ms2vVTdRjIceW0X9IfkLsgP8Xk97yPY2s7sABMYoaxjjD98GFXyInn
6ZjiPKJlDLH2PZI7WQmGMGpd5ct1m29xyO2G7unVeHONavngBtA3nzTx4RadK/CK
sKaH3Ixy8MpnFvncSrSF+Wp4B7u+TDdVybB3GdLhn6P85IfuVPYw1UJp0XdgnkNH
viJ9Mbond5VOOy+5zv/wrA29i8xQZt/4Fym/pmyDjgbSNw3qhN2XV3nn//W+0c26
Vgyti6rZDW6O6W1SXKHjAL2CG2cnJorv3nYPnF4eiPzPikWdq2m6YD3hxb2eHl8G
DaPsDpd+1eagoYgewipROyIcaY4w+OygphDUXYQkz76pTOOh90RruQ5wvgUSOUyX
ENxJpku0xO/MQv+Nt6LlxzcW8WiY4nltpDljFXzqDCXIiShfAXYrlKO3nIajMvyi
7Rtul601MsvO+h6jCXFo2GayPHWntY4kLXt2NnAnUDgEZbqadO/72vphKJ0RsST+
fHH8Y1KC62G+O0Et4GAbUX4gGJ4PTQGAkEl4VeHyyoqUTR8pqp0=
=hUEH
-----END PGP SIGNATURE-----

--6EXBlDW1rh4vcfOw--
