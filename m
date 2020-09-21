Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 138A827216B
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 12:43:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726640AbgIUKm5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 06:42:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726457AbgIUKm5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 06:42:57 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B12D0C061755;
        Mon, 21 Sep 2020 03:42:56 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id c18so12195724wrm.9;
        Mon, 21 Sep 2020 03:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nj8NpdjYxxsUSgIPthtLaRmTM6KYmMVlIzRUg4igEeE=;
        b=pEX6C9zsUqLNVhaTwlesy/3tn9m6HqCJqQlbb8Et/bLNVypr3QEzO9rMnOwLQ6KS2W
         xhtC5eQ8RDtZ0LYSBrE3ovOTeAsuik84uSOmbNwDAhOmEusvHzBPVlcANtm5yGcccxNj
         PR7ieynSXRhLRbFw/qVhF6MDK5Q3bLM1zPgHxCWH5yyJ8zkrkFKmU08c5rK/Cv/YL1A8
         MPTWEYIr9s+KPDbvkxxR76oW/YuS+1KaS8RQoer9VyP+63LbmxveSmHiitqcevkrtw+y
         HcdgLWCxOhpAeCXB120p+DMd0BDnb0hFZajGjhgesJdShr1u2ZxB0mR+3mtEDHqoD5AC
         8Xdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nj8NpdjYxxsUSgIPthtLaRmTM6KYmMVlIzRUg4igEeE=;
        b=egRaBhdtIk+YQID2TaZYJyufNsUgeuL1mQ5PsVNvg388DWlqvJaW0DYX+lGH5zUd75
         lUpN2Mj2GZCdmi1sds2aOKAVAFtnNHJP6b8itR9c5GiB037zb94n0FobZ0DYf3tKOght
         SG0EJgcDswARaIbLDyulT7mkm1wfsnpgi8EDwquhqshCcpyMBQKeeyC70v/jW5SiTMqN
         iM65oPsgDE4cN+MDE1VTuHw4j1dP3LSgYzLk9xz3W+AvAdR28/J09FArUxa7AGBLxxvT
         BzmoLr7FJL6a2lB3UvRdAEJn2wlH8JD/yJ8WurUfRlqPsvTNzL4cddqWvUfyCToLhHwZ
         ywDg==
X-Gm-Message-State: AOAM533SZS+SxG5SyBM6FhYmYCBbivbJ7VqERAW2YaVqU9BP8TcRKgRH
        9guXFSSJEanVKd0bYPVFQRk=
X-Google-Smtp-Source: ABdhPJyDygEN3S5YeLLQgKTbbS+mQAie9mUW+GUSHDAy+/JvBxYUECVevq7KK7P3EO54iLQhdCDftg==
X-Received: by 2002:adf:e552:: with SMTP id z18mr21828317wrm.50.1600684975349;
        Mon, 21 Sep 2020 03:42:55 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id y1sm18824510wma.36.2020.09.21.03.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 03:42:54 -0700 (PDT)
Date:   Mon, 21 Sep 2020 12:42:52 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <treding@nvidia.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 00/34] Improvements for Tegra I2C driver
Message-ID: <20200921104252.GA3950626@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <c075bd7a03eb475682fdc6896c937b84@HQMAIL111.nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Content-Disposition: inline
In-Reply-To: <c075bd7a03eb475682fdc6896c937b84@HQMAIL111.nvidia.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2020 at 10:18:27AM +0000, Thierry Reding wrote:
> On Wed, 09 Sep 2020 01:39:32 +0300, Dmitry Osipenko wrote:
> > Hello!
> >=20
> > This series performs refactoring of the Tegra I2C driver code and harde=
ns
> > the atomic-transfer mode.
> >=20
> > Changelog:
> >=20
> > v7: - Reworked the "Clean up probe function" patch by moving out all
> >       variable renamings into the "Clean up variable names" patch.
> >       This results in a nicer diff, which was asked by Andy Shevchenko.
> >=20
> >     - Squashed "Improve coding style of tegra_i2c_wait_for_config_load(=
)"
> >       patch into "Factor out register polling into separate function" in
> >       order avoid unnecessary ping-pong changes, which was asked by
> >       Andy Shevchenko.
> >=20
> >     - Added more indentation improvements, it should be ideal now.
> >=20
> >     - I haven't changed order of the "Clean up variable types" patch,
> >       which was suggested by Andy Shevchenko, because I already moved
> >       that patch multiple times and we decided to sort patches starting
> >       with more important cleanups and down to less important. The type
> >       changes are more important than shuffling code around, IMO.
> >=20
> > v6: - Added new patch that adds missing RPM puts, thanks to Andy Shevch=
enko
> >       for the suggestion.
> >=20
> >     - Improved commit messages by extending them with more a more detai=
led
> >       explanation of the changes.
> >=20
> >     - Added clarifying comment to the "Use reset_control_reset()" chang=
e,
> >       which was asked by Andy Shevchenko.
> >=20
> >     - Refactored the "Clean up probe function" patch by moving the
> >       dev_err_probe() change into the "Use clk-bulk helpers" patch,
> >       which was suggested by Andy Shevchenko.
> >=20
> >     - Improved ordering of the patches like it was suggested by
> >       Andy Shevchenko.
> >=20
> >     - Added Andy Shevchenko to suggested-by of the "Use clk-bulk helper=
s"
> >       patch.
> >=20
> >     - Improved "Remove i2c_dev.clk_divisor_non_hs_mode member" patch by
> >       making the case-switch to use "fast plus mode" timing if clock ra=
te
> >       is out-of-range. Just to make it more consistent.
> >=20
> >     - The "Improve tegra_i2c_dev structure" patch is squashed into
> >      "Improve formatting of variables" and "Clean up types/names" patch=
es.
> >=20
> >     - All variable-renaming changes are squashed into a single "Clean up
> >       variable names" patch.
> >=20
> >     - Made extra minor improvement to various patches, like more commen=
ts
> >       and indentations improved.
> >=20
> > v5: - Dropped the "Factor out runtime PM and hardware initialization"
> >       patch, like it was suggested by Micha=C5=82 Miros=C5=82aw. Instea=
d a less
> >       invasive "Factor out hardware initialization into separate functi=
on"
> >       patch added, it doesn't touch the RPM initialization.
> >=20
> >     - The "Remove outdated barrier()" patch now removes outdated commen=
ts.
> >=20
> >     - Updated commit description of the "Remove "dma" variable" patch,
> >       saying that the transfer mode may be changed by a callee. This was
> >       suggested by Micha=C5=82 Miros=C5=82aw.
> >=20
> >     - Reworked the "Clean up and improve comments" patch. Couple more
> >       comments are corrected and reworded now.
> >=20
> >     - Added r-b's from Micha=C5=82 Miros=C5=82aw.
> >=20
> >     - New patches:
> >=20
> >         i2c: tegra: Mask interrupt in tegra_i2c_issue_bus_clear()
> >         i2c: tegra: Remove redundant check in tegra_i2c_issue_bus_clear=
()
> >         i2c: tegra: Don't fall back to PIO mode if DMA configuration fa=
ils
> >         i2c: tegra: Clean up variable types
> >         i2c: tegra: Improve tegra_i2c_dev structure
> >=20
> > v4: - Reordered patches in the fixes/features/cleanups order like it was
> >       suggested by Andy Shevchenko.
> >=20
> >     - Now using clk-bulk API, which was suggested by Andy Shevchenko.
> >=20
> >     - Reworked "Make tegra_i2c_flush_fifos() usable in atomic transfer"
> >       patch to use iopoll API, which was suggested by Andy Shevchenko.
> >=20
> >     - Separated "Clean up probe function" into several smaller patches.
> >=20
> >     - Squashed "Add missing newline before returns" patch into
> >       "Clean up whitespaces, newlines and indentation".
> >=20
> >     - The "Drop '_timeout' from wait/poll function names" is renamed to
> >       "Rename wait/poll functions".
> >=20
> >     - The "Use reset_control_reset()" is changed to not fail tegra_i2c_=
init(),
> >       but only emit warning. This should be more friendly behaviour in =
oppose
> >       to having a non-bootable machine if reset-control fails.
> >=20
> >     - New patches:
> >=20
> >         i2c: tegra: Remove error message used for devm_request_irq() fa=
ilure
> >         i2c: tegra: Use devm_platform_get_and_ioremap_resource()
> >         i2c: tegra: Use platform_get_irq()
> >         i2c: tegra: Use clk-bulk helpers
> >         i2c: tegra: Remove bogus barrier()
> >         i2c: tegra: Factor out register polling into separate function
> >         i2c: tegra: Consolidate error handling in tegra_i2c_xfer_msg()
> >         i2c: tegra: Clean up and improve comments
> >         i2c: tegra: Rename couple "ret" variables to "err"
> >=20
> > v3: - Optimized "Make tegra_i2c_flush_fifos() usable in atomic transfer"
> >       patch by pre-checking FIFO state before starting to poll using
> >       ktime API, which may be expensive under some circumstances.
> >=20
> >     - The "Clean up messages in the code" patch now makes all messages
> >       to use proper capitalization of abbreviations. Thanks to Andy She=
vchenko
> >       and Micha=C5=82 Miros=C5=82aw for the suggestion.
> >=20
> >     - The "Remove unnecessary whitespaces and newlines" patch is transf=
ormed
> >       into "Clean up whitespaces and newlines", it now also adds missing
> >       newlines and spaces.
> >=20
> >     - Reworked the "Clean up probe function" patch in accordance to
> >       suggestion from Micha=C5=82 Miros=C5=82aw by factoring out only p=
arts of
> >       the code that make error unwinding cleaner.
> >=20
> >     - Added r-b from Micha=C5=82 Miros=C5=82aw.
> >=20
> >     - Added more patches:
> >=20
> >         i2c: tegra: Reorder location of functions in the code
> >         i2c: tegra: Factor out packet header setup from tegra_i2c_xfer_=
msg()
> >         i2c: tegra: Remove "dma" variable
> >         i2c: tegra: Initialization div-clk rate unconditionally
> >         i2c: tegra: Remove i2c_dev.clk_divisor_non_hs_mode member
> >=20
> > v2: - Cleaned more messages in the "Clean up messages in the code" patc=
h.
> >=20
> >     - The error code of reset_control_reset() is checked now.
> >=20
> >     - Added these new patches to clean up couple more things:
> >=20
> >         i2c: tegra: Check errors for both positive and negative values
> >         i2c: tegra: Improve coding style of tegra_i2c_wait_for_config_l=
oad()
> >         i2c: tegra: Remove unnecessary whitespaces and newlines
> >         i2c: tegra: Rename variable in tegra_i2c_issue_bus_clear()
> >         i2c: tegra: Improve driver module description
> >=20
> > Dmitry Osipenko (34):
> >   i2c: tegra: Make tegra_i2c_flush_fifos() usable in atomic transfer
> >   i2c: tegra: Add missing pm_runtime_put()
> >   i2c: tegra: Handle potential error of tegra_i2c_flush_fifos()
> >   i2c: tegra: Mask interrupt in tegra_i2c_issue_bus_clear()
> >   i2c: tegra: Initialize div-clk rate unconditionally
> >   i2c: tegra: Remove i2c_dev.clk_divisor_non_hs_mode member
> >   i2c: tegra: Runtime PM always available on Tegra
> >   i2c: tegra: Remove error message used for devm_request_irq() failure
> >   i2c: tegra: Use reset_control_reset()
> >   i2c: tegra: Use devm_platform_get_and_ioremap_resource()
> >   i2c: tegra: Use platform_get_irq()
> >   i2c: tegra: Use clk-bulk helpers
> >   i2c: tegra: Move out all device-tree parsing into tegra_i2c_parse_dt()
> >   i2c: tegra: Clean up probe function
> >   i2c: tegra: Reorder location of functions in the code
> >   i2c: tegra: Clean up variable types
> >   i2c: tegra: Remove outdated barrier()
> >   i2c: tegra: Remove likely/unlikely from the code
> >   i2c: tegra: Remove redundant check in tegra_i2c_issue_bus_clear()
> >   i2c: tegra: Remove "dma" variable from tegra_i2c_xfer_msg()
> >   i2c: tegra: Don't fall back to PIO mode if DMA configuration fails
> >   i2c: tegra: Rename wait/poll functions
> >   i2c: tegra: Factor out error recovery from tegra_i2c_xfer_msg()
> >   i2c: tegra: Factor out packet header setup from tegra_i2c_xfer_msg()
> >   i2c: tegra: Factor out register polling into separate function
> >   i2c: tegra: Factor out hardware initialization into separate function
> >   i2c: tegra: Check errors for both positive and negative values
> >   i2c: tegra: Consolidate error handling in tegra_i2c_xfer_msg()
> >   i2c: tegra: Improve formatting of variables
> >   i2c: tegra: Clean up variable names
> >   i2c: tegra: Clean up printk messages
> >   i2c: tegra: Clean up and improve comments
> >   i2c: tegra: Clean up whitespaces, newlines and indentation
> >   i2c: tegra: Improve driver module description
> >=20
> >  drivers/i2c/busses/i2c-tegra.c | 1435 ++++++++++++++++----------------
> >  1 file changed, 701 insertions(+), 734 deletions(-)
> > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Hm... not sure how this ended up here. My reporting script is parsing
the mailbox from patchwork, so perhaps this is patchwork injecting any
stored tags into the mailbox?

> Test results:
>   14 builds: 14 pass, 0 fail
>    9 boots:  9 pass, 0 fail
>   47 tests:  47 pass, 0 fail
>=20
> Boards tested: tegra20-ventana, tegra30-cardhu-a04, tegra124-jetson-tk1,
>                tegra186-p2771-0000, tegra194-p2972-0000

Looks like something went wrong here. Some additional boards were
tested, but the reporting script seems to have failed to retrieve
some of the logs and then decided not to include the boards here.

Anyway, I don't see any failures with this set of patches applied
so I think it's all good.

Thierry

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9og6kACgkQ3SOs138+
s6GRixAAhFfNYIt7s5nGzXk4X43woiTrz6AM73d5hFtuOv6PDpswsjAsRA0YbNYM
UfN2pwXoAeJk48MFCT1pBSNrf7Pa0uft0WsL9yjV5ErcthvztztpfR45WHeSqRu7
3rT3krELvGSL7ctSoaBgrBO3DGFleiSiCiE4Zxz7W8vD79kUUwI5NEBxC80rjjQl
oUnPdriHl9FVcW0vW0hal95jKdQIErrVZ4cv5r7gugqyrpov0xLtesNhM0DaBHaD
bjarACPR0BLXFB6d66AUZgP6pEBmf1Ns+WH2ZRiMpsYLJAlK2+etJIKnjAF9xOHg
Bn115OhueBGp8hQADcsKtB2aOmsorG3ToWRMogm9DJPLNcHqgDHEtQ0GxNBjLE3y
foTP2ZucRDMIJ0brZ8SFkB2PcMjiFF68hhd7NYfUZehQC60SVMMeKiMjj5wMSTrG
zd/CMrAxognZyc8hUDwtucNm6sglkx1UQLPDdTfj25IR4J6My+LKZTcbuTVi1Eqd
Mle+/MLfLVwe66yMshxV+av0+K79+GYUUFa5y0ivUs4wK/cwOQZFSVdAyeOOG+hb
bsKW3zpCmaK/Ng/nph3veUbZ1srVQleR3O8ESkit0TWg9WXrP8m+tJFthrQd3J33
9mcT45bYrirl0LP7xtg1zHsTO4hB2KZRUI40mSm3gjirk/Vaxew=
=fQ47
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
