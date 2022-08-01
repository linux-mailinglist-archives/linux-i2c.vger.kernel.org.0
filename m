Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 178ED586598
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Aug 2022 09:24:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbiHAHYK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Aug 2022 03:24:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbiHAHYJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 1 Aug 2022 03:24:09 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3464637FB5
        for <linux-i2c@vger.kernel.org>; Mon,  1 Aug 2022 00:24:08 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id m10so7868704qvu.4
        for <linux-i2c@vger.kernel.org>; Mon, 01 Aug 2022 00:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kUKDAQZf5I2blIR+AUaciEIYQ3CQhPKMxZp4utZZqrg=;
        b=a72bmV5vaAoP6w2s5uelKUwNMoVUzIEtnLolEMGAoJ8GJEELiOq+vpQn2aMdPuAEq7
         Ud09zCGaLM9Epl++ptCjcNrK96/vg7SqWO+BWpGzdtpIP6JwmeuwBiKTzr4hjYdxqWXx
         qrgUm7X9cP0yNjx+ERh3fg66flkeAAEr7ynAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kUKDAQZf5I2blIR+AUaciEIYQ3CQhPKMxZp4utZZqrg=;
        b=u1uF9jSGEOp2bkmw0tvvkD3TRiZG4HyB5sv2TxlnCVJqRSc1qoCzvgqSCu7SsTXfEG
         8hek46SyNzQsuu0ZKE5prMoyozWC2BFJPGVI5zpkvWJEnla18pesdHpK+UGrWXrFInq+
         8xIy4grkA582VaMnwgPe19V81exRyvPP8bM9+xUnwtaX60HVVOICf0BThVp0ynal1k+5
         5hirV+HaEE8kSt9gDhGRbigA5rOOei+IMOtHznY4xZwOZOwf6RZrzVWiM5/FkPVVIb5t
         ZqLZycMYFU8un9GBIQk42Q6JAa49tXFSOCrfHrAENHUQtlTgTxSpv8kZ0UFNsE0+yCHH
         4DrA==
X-Gm-Message-State: ACgBeo3do23h8wombOg1WvP+Rvl4tzdr3fxI14VuHeqLgBfcpG3M1QkH
        t8Qq8KIxjnshXgSbVLspSC+3WrlM3ZbZRA==
X-Google-Smtp-Source: AA6agR4E8TtF0uYFAlQTTYiEHq0VNFYW1yWgfQqEsdeE7hranYaCzeoACPo4arnZJTysCIvDI91ifA==
X-Received: by 2002:a05:6214:238b:b0:473:358:ddf4 with SMTP id fw11-20020a056214238b00b004730358ddf4mr13156888qvb.66.1659338647100;
        Mon, 01 Aug 2022 00:24:07 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id a83-20020ae9e856000000b006b4689e3425sm7575787qkg.129.2022.08.01.00.24.05
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Aug 2022 00:24:06 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id z5so15772192yba.3
        for <linux-i2c@vger.kernel.org>; Mon, 01 Aug 2022 00:24:05 -0700 (PDT)
X-Received: by 2002:a25:6e85:0:b0:676:a971:a1a4 with SMTP id
 j127-20020a256e85000000b00676a971a1a4mr10818489ybc.1.1659338645522; Mon, 01
 Aug 2022 00:24:05 -0700 (PDT)
MIME-Version: 1.0
References: <YitLit9LC2zlOfdh@paasikivi.fi.intel.com> <YitMt7hVA2okuQ8x@pendragon.ideasonboard.com>
 <YitPaq2yYnrKsq4f@paasikivi.fi.intel.com> <Yi3rQGmeXQD70Tkh@pendragon.ideasonboard.com>
 <Yi3z2nR8j+ee4E4m@paasikivi.fi.intel.com> <Yi38zOHsh68FrrKK@pendragon.ideasonboard.com>
 <Yi+e/IK+eVpKit/F@paasikivi.fi.intel.com> <Yi+gEVB0FuOcY5qn@pendragon.ideasonboard.com>
 <Yi+vdvMeXqb/BvKo@paasikivi.fi.intel.com> <YkMDfvuhAvsrjbON@pendragon.ideasonboard.com>
 <YlfplRQYDYhFvc5U@paasikivi.fi.intel.com> <CAAFQd5C7-OuNpnduwKpZXFUPQKDeqkz2xkvP+JBBs+aNjB87FQ@mail.gmail.com>
In-Reply-To: <CAAFQd5C7-OuNpnduwKpZXFUPQKDeqkz2xkvP+JBBs+aNjB87FQ@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 1 Aug 2022 16:23:54 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Bgx2u6quaCobrKEFjMPqP1S-HihCo-XP0k_OhAEUDm-g@mail.gmail.com>
Message-ID: <CAAFQd5Bgx2u6quaCobrKEFjMPqP1S-HihCo-XP0k_OhAEUDm-g@mail.gmail.com>
Subject: Re: [PATCH v2] media: ov5640: Use runtime PM
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Martina Krasteva <martinax.krasteva@intel.com>,
        Shawn Tu <shawnx.tu@intel.com>, Arec Kao <arec.kao@intel.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jimmy Su <jimmy.su@intel.com>,
        Martin Kepplinger <martink@posteo.de>,
        Daniel Scally <djrscally@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org, rafael@kernel.org,
        linux-acpi@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        bingbu.cao@intel.com, andriy.shevchenko@intel.com,
        "hidenorik@chromium.org" <hidenorik@chromium.org>,
        jacopo mondi <jacopo@jmondi.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

[Fixed Jacopo's email address.]

On Mon, Aug 1, 2022 at 4:17 PM Tomasz Figa <tfiga@chromium.org> wrote:
>
> On Thu, Apr 14, 2022 at 6:30 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi Laurent,
> >
> > On Tue, Mar 29, 2022 at 04:02:54PM +0300, Laurent Pinchart wrote:
> > > Hi Sakari,
> > >
> > > On Mon, Mar 14, 2022 at 11:11:18PM +0200, Sakari Ailus wrote:
> > > > On Mon, Mar 14, 2022 at 10:05:37PM +0200, Laurent Pinchart wrote:
> > > > ...
> > > > > > > Yes, after reading the version register (or doing any other h=
arware
> > > > > > > access). Actually the full code would be
> > > > > > >
> > > > > > >
> > > > > > >       pm_runtime_enable(dev);
> > > > > > >       pm_runtime_resume_and_get(dev);
> > > > > > >
> > > > > > >       /* Hardware access */
> > > > > > >
> > > > > > >       pm_runtime_set_autosuspend_delay(dev, 1000);
> > > > > > >       pm_runtime_use_autosuspend(dev);
> > > > > > >       pm_runtime_put_autosuspend(dev);
> > > > > > >
> > > > > > > (plus error handling).
> > > > > > >
> > > > > > > If the probe function doesn't need to access the hardware, th=
en
> > > > > > > the above becomes
> > > > > > >
> > > > > > >       pm_runtime_enable(dev);
> > > > > > >       pm_runtime_set_autosuspend_delay(dev, 1000);
> > > > > > >       pm_runtime_use_autosuspend(dev);
> > > > > > >
> > > > > > > instead of having to power up the device just in case !PM.
> > > > > > >
> > > > > > > > Also the latter only works on DT-based systems so it's not =
an option for
> > > > > > > > most of the drivers.
> > >
> > > Does the former work on ACPI systems ?
> >
> > Yes (i.e. the one that was above the quoted text).
> >
> > >
> > > > > > > How so, what's wrong with the above for ACPI-based system ?
> > > > > >
> > > > > > I=E6=B6=8E devices are already powered on for probe on ACPI bas=
ed systems.
> > > > >
> > > > > Not through RPM I suppose ?
> > > >
> > > > Runtime PM isn't involved, this takes place in the ACPI framework (=
via
> > > > dev_pm_domain_attach() called in i2c_device_probe()).
> > >
> > > How can we fix this ? It may have made sense a long time ago, but it'=
s
> > > making RPM handling way too difficult in I2C drivers now. We need
> > > something better instead of continuing to rely on cargo-cult for prob=
e
> > > functions. Most drivers are broken.
> >
> > Some could be broken, there's no question of that. A lot of drivers sup=
port
> > either ACPI or DT, too, so not _that_ many need to work with both. Albe=
it
> > that number is probably increasing constantly for the same devices are =
used
> > on both.
> >
> > Then there are drivers that prefer not powering on the device in probe =
(see
> > <URL:https://lore.kernel.org/linux-acpi/20210210230800.30291-2-sakari.a=
ilus@linux.intel.com/T/>),
> > it gets complicated to support all the combinatios of DT/ACPI (with or
> > without the flag / property for waiving powering device on for probe) a=
nd
> > CONFIG_PM enabled/disabled.
> >
> > What I think could be done to add a flag for drivers that handle power =
on
> > their own, or perhaps rather change how I2C_DRV_ACPI_WAIVE_D0_PROBE fla=
g
> > works. Right now it expects a property on the device but that check cou=
ld
> > be moved to existing drivers using the flag. Not many drivers are curre=
ntly
> > using the flag. I think this would simplify driver implementation as bo=
th
> > firmware interfaces would work the same way in this respect.
> >
> > You'd have to change one driver at a time, and people should be encoura=
ged
> > to write new drivers with that flag. Or add the flag to all existing
> > drivers and not accept new ones with it.
> >
> > These devices I think are all I=E6=B6=8E but my understanding is that s=
uch
> > differences exist elsewhere in the kernel, too. If they are to be
> > addressed, it would probably be best to have a unified approach towards=
 it.
> >
> > Added a few more people and lists to cc.
>
> + Hidenori from my team for visibility.
>
> I think we may want to take a step back and first define the problem
> itself. To do that, let's take a look separately at DT and ACPI cases
> (is platform data still relevant? are there any other firmware
> interfaces that deal with I2C devices?).
> For simplicity, let's forget about the ACPI waived power on in probe.
>
> DT:
>  1) hardware state unknown when probe is called
>  2) claim any independently managed resources (e.g. GPIOs)
>  3) enable runtime PM
>  4) if driver wants to access the hardware:
>     a) runtime PM get
>     b) enable any independently controlled resources (e.g. reset GPIO)
>     c) [do access]
>     d) disable any independently controlled resources
>     e) runtime PM put
>  5) after probe returns, regulators, clocks (and other similarly
> managed resources) would be force disabled if their enable count is 0
>  6) hardware state is off (after the runtime PM state settles)
>
> ACPI:
>  1) hardware state is active when probe is called
>  2) [n/a]
>  3) tell runtime PM framework that the state is active and then enable
> runtime PM
>  4) if driver wants to access the hardware:
>     a) runtime PM get
>     b) [n/a]
>     c) [do access]
>     d) [n/a]
>     e) runtime PM put
>  5) [n/a]
>  6) hardware state is off (after the runtime PM state settles)
>
> It seems like the relevant difference here is that for ACPI, the
> driver needs to know that the initial state is active and also relay
> this knowledge to the runtime PM subsystem. If we could make the ACPI
> PM domain work the same way as regulators and clocks and eventually
> power off some time later when the enable count is 0, then perhaps we
> could avoid the problem in the first place?
>
> Best regards,
> Tomasz
