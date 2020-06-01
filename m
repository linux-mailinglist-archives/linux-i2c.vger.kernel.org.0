Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83C9E1E9FAC
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jun 2020 09:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726005AbgFAH7Z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Jun 2020 03:59:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725935AbgFAH7Z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 1 Jun 2020 03:59:25 -0400
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com [IPv6:2607:f8b0:4864:20::a44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4024FC061A0E
        for <linux-i2c@vger.kernel.org>; Mon,  1 Jun 2020 00:59:25 -0700 (PDT)
Received: by mail-vk1-xa44.google.com with SMTP id e1so2208291vkd.1
        for <linux-i2c@vger.kernel.org>; Mon, 01 Jun 2020 00:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessm-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+/lonEZ7lAjJM9p39P8BR7wI92X7wL1JFjHzHvAjHkM=;
        b=QJIC2sGSvW8+pkA3XwPz6SEdhDVwIlJXrSvgwrJz14gWv9GFyjtDG2MTUcUmBE9l/P
         bFNwlOPsXAWxexrOr1FTH77p7eziPmqwaCwGID1oap6GBKrL6bP3eKe5qkD6tXL7uk2X
         AsmB7QGgkZYU5ME7vUpGEwso2aVlQHv3oAdXI0rooRnnCqt1KHlc6NdJOf5WkBA/tLWk
         0HmRDDYVgBWOKM8wQwZO6+lG88hsmWd0K/Qcbpso+qCDMK6HjpYt5w6hR6ty4EmjPrjF
         ysAIR0YGSpqPj7ajyUokQlELevpS2gTch8EmZmHAPyqDvGWCwnC5SUywivMOGkZQ+Qmb
         hyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+/lonEZ7lAjJM9p39P8BR7wI92X7wL1JFjHzHvAjHkM=;
        b=CD3ylUoyEIurX9hBXi8hChAEHpQS+Lpod6av85AYONkj4nmSpsM5nJttMZ8uOauZUL
         anOLU/kVIuAWPxlbIopbqZy6pz6X/ZtuKZge7jn9/FQNZuV9zeZ5pduTAt98WvZevIj2
         EUN+Cq2h4Wzyq6ykOjwrg+MGpCUSkd8elXjjhoa2s9u1Wd4ecS/aH1bUHb/pRqC1A7Xr
         epYXW1TygFQXjmTgrezozuDsetn0vRnxhX4r1YADCqG8vBMYMkbfjyp3AIQ9ij9oolzs
         5Sf5C9IR3ZMEUtCuUMWDw81iBJtFojSdRzalKfCSav1zmOUOmYx/PBB/kzDvtbpq06WB
         +9MQ==
X-Gm-Message-State: AOAM531DaYqvpR6C/GgYIlwZe6lHXqKJOUl6l3GuXWkWrUOK5Cgm1UZw
        c0perHrtY+53ewOD3mHrpkGTzf0U5D8rcN8O06SyLA==
X-Google-Smtp-Source: ABdhPJz5/TY/hSbADj3oi4wF5cfCkxs3IZ3jGUJwi+iQ030QrAjfPx7lmoOmw/UVp6y5U0jhlKMWyCVws+HntU+xFxQ=
X-Received: by 2002:a1f:2d8e:: with SMTP id t136mr246292vkt.61.1590998364343;
 Mon, 01 Jun 2020 00:59:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200427072342.5499-1-jian-hong@endlessm.com> <20200428162152.ztsqp7nxqbwqrm6r@gilmour.lan>
 <CAPpJ_efvtVzb_hvoVOeaePh7UdE13wOiiGaDBH38cToB-yhkUg@mail.gmail.com>
 <20200507172158.cybtakpo6cxv6wcs@gilmour.lan> <CAPpJ_efxenmSXt2OXkhkQ1jDJ59tyWBDUvmpyOB-bfPMDENQZg@mail.gmail.com>
 <CAPpJ_ed9TMJjN8xS1_3saf5obQhULJSLNgQSAFxgiWM2QX9A7Q@mail.gmail.com>
 <20200526102018.kznh6aglpkqlp6en@gilmour.lan> <CAD8Lp467DiYWLwH6T1Jeq-uyN4VEuef-gGWw0_bBTtmSPr00Ag@mail.gmail.com>
 <20200527091335.7wc3uy67lbz7j4di@gilmour.lan> <CAD8Lp45ucK-yZ5G_DrUVA7rnxo58UF1LPUy65w2PCOcSxKx_Sg@mail.gmail.com>
 <20200528073055.znutrhkryzu3grrl@gilmour.lan>
In-Reply-To: <20200528073055.znutrhkryzu3grrl@gilmour.lan>
From:   Jian-Hong Pan <jian-hong@endlessm.com>
Date:   Mon, 1 Jun 2020 15:58:26 +0800
Message-ID: <CAPpJ_ec1KRwUrHGVVZrReaDPz4iga-Nvj5H652-tTKmkXL=Xmg@mail.gmail.com>
Subject: Re: [PATCH v2 00/91] drm/vc4: Support BCM2711 Display Pipelin
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Daniel Drake <drake@endlessm.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Eric Anholt <eric@anholt.net>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-rpi-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
        Linux Upstreaming Team <linux@endlessm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Maxime Ripard <maxime@cerno.tech> =E6=96=BC 2020=E5=B9=B45=E6=9C=8828=E6=97=
=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=883:30=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Daniel,
>
> On Wed, May 27, 2020 at 05:15:12PM +0800, Daniel Drake wrote:
> > On Wed, May 27, 2020 at 5:13 PM Maxime Ripard <maxime@cerno.tech> wrote=
:
> > > I'm about to send a v3 today or tomorrow, I can Cc you (and Jian-Hong=
) if you
> > > want.
> >
> > That would be great, although given the potentially inconsistent
> > results we've been seeing so far it would be great if you could
> > additionally push a git branch somewhere.
> > That way we can have higher confidence that we are applying exactly
> > the same patches to the same base etc.
>
> So I sent a new iteration yesterday, and of course forgot to cc you... So=
rry for
> that.
>
> I've pushed my current branch here:
> https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git/log/?h=
=3Drpi4-kms

Thanks to Maxime!

I have tried your repository on branch rpi4-kms.  The DRM VC4 is used!
But got some issues:
1. Some weird error message in dmesg.  Not sure it is related, or not
[    5.219321] [drm:vc5_hdmi_init_resources] *ERROR* Failed to get
HDMI state machine clock
https://gist.github.com/starnight/3f317dca121065a361cf08e91225e389

2. The screen flashes suddenly sometimes.

3. The higher resolutions, like 1920x1080 ... are lost after hot
re-plug HDMI cable (HDMI0)

Jian-Hong Pan
