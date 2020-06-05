Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C8CA1EF34F
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jun 2020 10:45:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbgFEIpw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 Jun 2020 04:45:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726116AbgFEIpv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 5 Jun 2020 04:45:51 -0400
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com [IPv6:2607:f8b0:4864:20::a42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3173CC08C5C4
        for <linux-i2c@vger.kernel.org>; Fri,  5 Jun 2020 01:45:51 -0700 (PDT)
Received: by mail-vk1-xa42.google.com with SMTP id f126so2022439vkb.13
        for <linux-i2c@vger.kernel.org>; Fri, 05 Jun 2020 01:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessm-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+jBFtxmml2UF+SqNxby8rCTJfROuy18HbtkfW0zgYb0=;
        b=Orors8UnFs80EJIYP/KDavj+8S/RsPvJBh7SCISTksRVf7f4rAH/P560wXs2u/J6az
         pLlDexOhDBMkt79w0+ofS3+f4xcnBuNUhq+c++wVjsKLE1jc5jzPMaU0ntxEv+VzpJOW
         vf8JZ3z/GSdXQ73Dm2tMH7Uo3c+Gq7BR3tCL+JQ+cN4dWgw5MjGAhxYtxejR0Prd6iY+
         6ZZkJcm1wr02Z6nmkyy0QuByc8wAJurm3MPsvINFpfalEBb4ZT0kmHOLA4rt4yqs3noY
         8LqBEZLRANgp5WuxTDJkI3EjW/LX6Dr9+1sGkp9NrHS5iOhMpbnO8xzAXaW0orSU4N+3
         p7ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+jBFtxmml2UF+SqNxby8rCTJfROuy18HbtkfW0zgYb0=;
        b=qeVpTEuYpo2F2JS0xYiTWV64NSqUKW1YUPfsDrz9cilZhrbQGOC6M0Uets6gUMtK0u
         sviItJethVWqOsk5w33XRen0Vjaa5kjx9bI6ZoWkgXHCNjX3zMywRapJyTVjE7mp7xt1
         o8xhzxXhXauN19QxFUDjJqdvTf23K/il982509QqzHMCXqOD7fjZECxg+qrzi7CAsCAe
         GDelu+uX0XraTdhB37UM5RO7OBuYXNc20SBGyLsvzjrTPduWW73uetIlo8kXvbxVGzu5
         y6b7Id912UM+zKz0AivzzkzW3Z3DFWHg+EWcqIP5iEBh6yfkoy59pxZYPH0A1fIcV8CL
         Gcwg==
X-Gm-Message-State: AOAM530cKnez613O24SR0Rb90VLW2i4ilg0nY3X+jImNl1NyRA6OU5lV
        AZJY1NKfgCEdva815xIULQTRE6t+achcxy+0bOU67A==
X-Google-Smtp-Source: ABdhPJzmvRHbvh3nZTnE3simXC96ekcS+Ch2AtnIE3Svbty3w/cPWX4iVpb084QbaBYoV7z9md14B6vaSVk2SSa/NyY=
X-Received: by 2002:a1f:cf03:: with SMTP id f3mr6271662vkg.72.1591346749358;
 Fri, 05 Jun 2020 01:45:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAPpJ_efvtVzb_hvoVOeaePh7UdE13wOiiGaDBH38cToB-yhkUg@mail.gmail.com>
 <20200507172158.cybtakpo6cxv6wcs@gilmour.lan> <CAPpJ_efxenmSXt2OXkhkQ1jDJ59tyWBDUvmpyOB-bfPMDENQZg@mail.gmail.com>
 <CAPpJ_ed9TMJjN8xS1_3saf5obQhULJSLNgQSAFxgiWM2QX9A7Q@mail.gmail.com>
 <20200526102018.kznh6aglpkqlp6en@gilmour.lan> <CAD8Lp467DiYWLwH6T1Jeq-uyN4VEuef-gGWw0_bBTtmSPr00Ag@mail.gmail.com>
 <20200527091335.7wc3uy67lbz7j4di@gilmour.lan> <CAD8Lp45ucK-yZ5G_DrUVA7rnxo58UF1LPUy65w2PCOcSxKx_Sg@mail.gmail.com>
 <20200528073055.znutrhkryzu3grrl@gilmour.lan> <CAPpJ_ec1KRwUrHGVVZrReaDPz4iga-Nvj5H652-tTKmkXL=Xmg@mail.gmail.com>
 <20200602110442.2ceuymhwuomvjj6i@gilmour>
In-Reply-To: <20200602110442.2ceuymhwuomvjj6i@gilmour>
From:   Jian-Hong Pan <jian-hong@endlessm.com>
Date:   Fri, 5 Jun 2020 16:44:51 +0800
Message-ID: <CAPpJ_eePgLxO5URB3V5aeNMvBHOp+vXrW=+6SnVt4mB9J8oR+Q@mail.gmail.com>
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

Maxime Ripard <maxime@cerno.tech> =E6=96=BC 2020=E5=B9=B46=E6=9C=882=E6=97=
=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=887:04=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi,
>
> On Mon, Jun 01, 2020 at 03:58:26PM +0800, Jian-Hong Pan wrote:
> > Maxime Ripard <maxime@cerno.tech> =E6=96=BC 2020=E5=B9=B45=E6=9C=8828=
=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=883:30=E5=AF=AB=E9=81=93=EF=BC=
=9A
> > >
> > > Hi Daniel,
> > >
> > > On Wed, May 27, 2020 at 05:15:12PM +0800, Daniel Drake wrote:
> > > > On Wed, May 27, 2020 at 5:13 PM Maxime Ripard <maxime@cerno.tech> w=
rote:
> > > > > I'm about to send a v3 today or tomorrow, I can Cc you (and Jian-=
Hong) if you
> > > > > want.
> > > >
> > > > That would be great, although given the potentially inconsistent
> > > > results we've been seeing so far it would be great if you could
> > > > additionally push a git branch somewhere.
> > > > That way we can have higher confidence that we are applying exactly
> > > > the same patches to the same base etc.
> > >
> > > So I sent a new iteration yesterday, and of course forgot to cc you..=
. Sorry for
> > > that.
> > >
> > > I've pushed my current branch here:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git/log=
/?h=3Drpi4-kms
> >
> > Thanks to Maxime!
> >
> > I have tried your repository on branch rpi4-kms.  The DRM VC4 is used!
> > But got some issues:
> > 1. Some weird error message in dmesg.  Not sure it is related, or not
> > [    5.219321] [drm:vc5_hdmi_init_resources] *ERROR* Failed to get
> > HDMI state machine clock
> > https://gist.github.com/starnight/3f317dca121065a361cf08e91225e389
>
> That's a deferred probing. The first time the HDMI driver is being
> probed, the firmware clock driver has not been probed yet. It's making
> another attempt later on, which succeeds.
>
> > 2. The screen flashes suddenly sometimes.

I append drm.debug=3D0x3 to boot command.  Whenever, the screen flashes,
I notice the logs like this:

Jun 01 15:22:40 endless kernel: [drm:drm_calc_timestamping_constants]
crtc 64: hwmode: htotal 2200, vtotal 1125, vdisplay 1080
Jun 01 15:22:40 endless kernel: [drm:drm_calc_timestamping_constants]
crtc 64: clock 148500 kHz framedur 16666666 linedur 14814
Jun 01 15:22:40 endless kernel: [drm:drm_vblank_enable] enabling
vblank on crtc 3, ret: 0
Jun 01 15:22:40 endless kernel: [drm:drm_mode_object_put.part.0] OBJ ID: 15=
9 (2)
Jun 01 15:22:40 endless kernel: [drm:drm_mode_object_put.part.0] OBJ ID: 15=
4 (1)
Jun 01 15:22:40 endless kernel: [drm:vblank_disable_fn] disabling
vblank on crtc 3
Jun 01 15:22:42 endless kernel: [drm:drm_ioctl] pid=3D584, dev=3D0xe200,
auth=3D1, DRM_IOCTL_MODE_CURSOR
Jun 01 15:22:42 endless kernel: [drm:drm_ioctl] pid=3D584, dev=3D0xe200,
auth=3D1, DRM_IOCTL_MODE_CURSOR2
Jun 01 15:22:42 endless kernel: [drm:drm_mode_object_get] OBJ ID: 159 (1)
Jun 01 15:22:42 endless kernel: [drm:drm_mode_object_get] OBJ ID: 154 (1)
Jun 01 15:22:42 endless kernel: [drm:drm_calc_timestamping_constants]
crtc 64: hwmode: htotal 2200, vtotal 1125, vdisplay 1080
Jun 01 15:22:42 endless kernel: [drm:drm_calc_timestamping_constants]
crtc 64: clock 148500 kHz framedur 16666666 linedur 14814
Jun 01 15:22:42 endless kernel: [drm:drm_vblank_enable] enabling
vblank on crtc 3, ret: 0
Jun 01 15:22:42 endless kernel: [drm:drm_mode_object_put.part.0] OBJ ID: 15=
9 (2)
Jun 01 15:22:42 endless kernel: [drm:drm_mode_object_put.part.0] OBJ ID: 15=
4 (2)

Here is the full log
https://gist.github.com/starnight/85d641819839eddc7a55ca7173990a56

> > 3. The higher resolutions, like 1920x1080 ... are lost after hot
> > re-plug HDMI cable (HDMI0)

I should explain this in more detail.  Here are the steps to reproduce
this issue:
1. Before unplug the HDMI cable from HDMI0 port.
$ xrandr
Screen 0: minimum 320 x 200, current 1920 x 1080, maximum 2048 x 2048
HDMI-1 connected primary 1920x1080+0+0 (normal left inverted right x
axis y axis) 521mm x 293mm
   1920x1080     60.00*+  50.00    59.94
   1920x1080i    60.00    50.00    59.94
   1680x1050     59.88
   1280x1024     75.02    60.02
   1440x900      59.90
   1280x960      60.00
   1152x864      75.00
   1280x720      60.00    50.00    59.94
   1440x576      50.00
   1024x768      75.03    70.07    60.00
   1440x480      60.00    59.94
   832x624       74.55
   800x600       72.19    75.00    60.32    56.25
   720x576       50.00
   720x480       60.00    59.94
   640x480       75.00    72.81    66.67    60.00    59.94
   720x400       70.08
HDMI-2 disconnected (normal left inverted right x axis y axis)

2. Unplug the HDMI cable from HDMI0 port.
3. Plug the HDMI cable to **HDMI1** port.
$ xrandr
Screen 0: minimum 320 x 200, current 1920 x 1080, maximum 2048 x 2048
HDMI-1 disconnected (normal left inverted right x axis y axis)
HDMI-2 connected primary 1920x1080+0+0 (normal left inverted right x
axis y axis) 521mm x 293mm
   1920x1080     60.00*+  50.00    59.94
   1920x1080i    60.00    50.00    59.94
   1680x1050     59.88
   1280x1024     75.02    60.02
   1440x900      59.90
   1280x960      60.00
   1152x864      75.00
   1280x720      60.00    50.00    59.94
   1440x576      50.00
   1024x768      75.03    70.07    60.00
   1440x480      60.00    59.94
   832x624       74.55
   800x600       72.19    75.00    60.32    56.25
   720x576       50.00
   720x480       60.00    59.94
   640x480       75.00    72.81    66.67    60.00    59.94
   720x400       70.08

4. Unplug the HDMI cable from **HDMI1** port.
5. Plug the HDMI cable back to HDMI0 port.
$ xrandr
Screen 0: minimum 320 x 200, current 1368 x 768, maximum 2048 x 2048
HDMI-1 connected primary 1368x768+0+0 (normal left inverted right x
axis y axis) 0mm x 0mm
   1368x768      59.88*
   1360x768      59.80
   1280x800      59.81
   1152x864      60.00
   1280x720      59.86
   1024x768      60.00
   1024x576      59.90
   960x540       59.63
   800x600       60.32
   800x450       59.82
   700x450       59.88
   640x480       59.94
   684x384       59.88    59.85
   680x384       59.80    59.96
   640x400       59.88    59.98
   576x432       60.06
   640x360       59.86    59.83
   512x384       60.00
   512x288       60.00    59.92
   480x270       59.63    59.82
   400x300       60.32
   320x240       60.05
HDMI-2 disconnected (normal left inverted right x axis y axis)

Jian-Hong Pan

> I'm not sure on how to exactly reproduce those issues (or what they are)
> though, can you expand on this?
>
> Maxime
