Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71061213A6B
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jul 2020 14:56:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726324AbgGCM4Q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Jul 2020 08:56:16 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:33833 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726074AbgGCM4Q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Jul 2020 08:56:16 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 3E8EE580A96;
        Fri,  3 Jul 2020 08:56:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 03 Jul 2020 08:56:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=uPpl+lfVxDbJCXigKHHiQzdsypG
        IWPPlBUTcBSClrZ8=; b=FyDrVUHQOvVC5qJxgrfdCHEN06b7Fnh5+jNNx3bcmQv
        dHjsr7XNJb6D857VWQ8I1d2I/UG9RLg6cJ6QzA4Yp7ioAkMMdUyjusSIQZrxqnc9
        h7ZLv8eUM02CkvXHQU641qgofhv884f+boCkGiaXwbR9HfJiZ0KpCexNRjrdan/j
        8ovqq+w/+vx1fhYhZ9kUPdolMWnw+cjCQYZGe6VP6yvPvflN78gdm2jRyzeRhSqW
        qReyAhltIMJf5f5zkIE/1nTmBNSmT/mJM43FhyCk37F8rmcoY/PCrSDnriJGtOqX
        a/Yzya1huw+b7uOT2ffL2woxFxp43UcLnUMF9Aprgcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=uPpl+l
        fVxDbJCXigKHHiQzdsypGIWPPlBUTcBSClrZ8=; b=oK0rbY37kDFFgiQoAl5J5z
        67cDSbQJ+CJb3Qet03p0wy1pQPq3NZ/XU4Oq2KGULfBsOiTb9j+yR2bHW2HzjXcP
        2V3AyVJS6//Z3WC+wAY15ojAvVYhLFfyIWBFME3Mpm7uM3c4SXPcbGp5+NiWQ8fK
        AzGgyjk6WSj5okJuHrqr/gGjfW7UY4GKgHUBvs5ebF88TVyuXyEdYquwfi472NrV
        sz2KgbCgd8+ytFnIDVlxQvHsouXP4ZeKAwjoNbn3gFqq036iWJNgtwlKW0faXwhq
        yHtXipBTMxO5PZ6ViqX1HtVEeTD4UOqiGhLN7FvETdzbyBtLpjC2CTP12tGg06sg
        ==
X-ME-Sender: <xms:7Sr_XjzVID-yWnPQf-i1qobVycroPh4YqY-ZGrnbmtgmV0_dkzf1Mw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrtdeigdehkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeekgfeludfflefhteejvdekveefgeegvedtgfeiuedugefgfffhjeeludehffel
    heenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhdpphgrsh
    htvggsihhnrdgtohhmnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhord
    htvggthh
X-ME-Proxy: <xmx:7Sr_XrTO1EPFgIwfnY7ApLJVswAdRwbrA9Z9pU1m4zayNIDPOw0RDA>
    <xmx:7Sr_XtUSorAVpF9tGyCVf7_dorDeM79qG7WirhecQDBdoZg_yFPL7Q>
    <xmx:7Sr_XtjOLCkaG4MVFaDkdp0pcthkv59EsPJiSMuL2lwjYjQU89s0LA>
    <xmx:7ir_XptV86QAr12e4tOQpKg4CuVRT-MCOVvfq5IzicNuL8NOnermMg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 0BF42328005D;
        Fri,  3 Jul 2020 08:56:12 -0400 (EDT)
Date:   Fri, 3 Jul 2020 14:56:11 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Jian-Hong Pan <jian-hong@endlessm.com>
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
Subject: Re: [PATCH v2 00/91] drm/vc4: Support BCM2711 Display Pipelin
Message-ID: <20200703125611.7pny24kpqkvxiir6@gilmour.lan>
References: <20200526102018.kznh6aglpkqlp6en@gilmour.lan>
 <CAD8Lp467DiYWLwH6T1Jeq-uyN4VEuef-gGWw0_bBTtmSPr00Ag@mail.gmail.com>
 <20200527091335.7wc3uy67lbz7j4di@gilmour.lan>
 <CAD8Lp45ucK-yZ5G_DrUVA7rnxo58UF1LPUy65w2PCOcSxKx_Sg@mail.gmail.com>
 <20200528073055.znutrhkryzu3grrl@gilmour.lan>
 <CAPpJ_ec1KRwUrHGVVZrReaDPz4iga-Nvj5H652-tTKmkXL=Xmg@mail.gmail.com>
 <20200602110442.2ceuymhwuomvjj6i@gilmour>
 <CAPpJ_eePgLxO5URB3V5aeNMvBHOp+vXrW=+6SnVt4mB9J8oR+Q@mail.gmail.com>
 <20200629142145.aa2vdfkgeugrze4c@gilmour.lan>
 <CAPpJ_efVO9HxrYzbrZgYpcniX30YtvthcYAc=AOabLsThkO02Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yksztr2amnkhaur2"
Content-Disposition: inline
In-Reply-To: <CAPpJ_efVO9HxrYzbrZgYpcniX30YtvthcYAc=AOabLsThkO02Q@mail.gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--yksztr2amnkhaur2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jun 30, 2020 at 04:26:20PM +0800, Jian-Hong Pan wrote:
> Maxime Ripard <maxime@cerno.tech> =E6=96=BC 2020=E5=B9=B46=E6=9C=8829=E6=
=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=8810:21=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > Hi!
> >
> > On Fri, Jun 05, 2020 at 04:44:51PM +0800, Jian-Hong Pan wrote:
> > > Maxime Ripard <maxime@cerno.tech> =E6=96=BC 2020=E5=B9=B46=E6=9C=882=
=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=887:04=E5=AF=AB=E9=81=93=EF=BC=
=9A
> > > >
> > > > Hi,
> > > >
> > > > On Mon, Jun 01, 2020 at 03:58:26PM +0800, Jian-Hong Pan wrote:
> > > > > Maxime Ripard <maxime@cerno.tech> =E6=96=BC 2020=E5=B9=B45=E6=9C=
=8828=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=883:30=E5=AF=AB=E9=81=93=
=EF=BC=9A
> > > > > >
> > > > > > Hi Daniel,
> > > > > >
> > > > > > On Wed, May 27, 2020 at 05:15:12PM +0800, Daniel Drake wrote:
> > > > > > > On Wed, May 27, 2020 at 5:13 PM Maxime Ripard <maxime@cerno.t=
ech> wrote:
> > > > > > > > I'm about to send a v3 today or tomorrow, I can Cc you (and=
 Jian-Hong) if you
> > > > > > > > want.
> > > > > > >
> > > > > > > That would be great, although given the potentially inconsist=
ent
> > > > > > > results we've been seeing so far it would be great if you cou=
ld
> > > > > > > additionally push a git branch somewhere.
> > > > > > > That way we can have higher confidence that we are applying e=
xactly
> > > > > > > the same patches to the same base etc.
> > > > > >
> > > > > > So I sent a new iteration yesterday, and of course forgot to cc=
 you... Sorry for
> > > > > > that.
> > > > > >
> > > > > > I've pushed my current branch here:
> > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.g=
it/log/?h=3Drpi4-kms
> > > > >
> > > > > Thanks to Maxime!
> > > > >
> > > > > I have tried your repository on branch rpi4-kms.  The DRM VC4 is =
used!
> > > > > But got some issues:
> > > > > 1. Some weird error message in dmesg.  Not sure it is related, or=
 not
> > > > > [    5.219321] [drm:vc5_hdmi_init_resources] *ERROR* Failed to get
> > > > > HDMI state machine clock
> > > > > https://gist.github.com/starnight/3f317dca121065a361cf08e91225e389
> > > >
> > > > That's a deferred probing. The first time the HDMI driver is being
> > > > probed, the firmware clock driver has not been probed yet. It's mak=
ing
> > > > another attempt later on, which succeeds.
> > > >
> > > > > 2. The screen flashes suddenly sometimes.
> > >
> > > I append drm.debug=3D0x3 to boot command.  Whenever, the screen flash=
es,
> > > I notice the logs like this:
> > >
> > > Jun 01 15:22:40 endless kernel: [drm:drm_calc_timestamping_constants]
> > > crtc 64: hwmode: htotal 2200, vtotal 1125, vdisplay 1080
> > > Jun 01 15:22:40 endless kernel: [drm:drm_calc_timestamping_constants]
> > > crtc 64: clock 148500 kHz framedur 16666666 linedur 14814
> > > Jun 01 15:22:40 endless kernel: [drm:drm_vblank_enable] enabling
> > > vblank on crtc 3, ret: 0
> > > Jun 01 15:22:40 endless kernel: [drm:drm_mode_object_put.part.0] OBJ =
ID: 159 (2)
> > > Jun 01 15:22:40 endless kernel: [drm:drm_mode_object_put.part.0] OBJ =
ID: 154 (1)
> > > Jun 01 15:22:40 endless kernel: [drm:vblank_disable_fn] disabling
> > > vblank on crtc 3
> > > Jun 01 15:22:42 endless kernel: [drm:drm_ioctl] pid=3D584, dev=3D0xe2=
00,
> > > auth=3D1, DRM_IOCTL_MODE_CURSOR
> > > Jun 01 15:22:42 endless kernel: [drm:drm_ioctl] pid=3D584, dev=3D0xe2=
00,
> > > auth=3D1, DRM_IOCTL_MODE_CURSOR2
> > > Jun 01 15:22:42 endless kernel: [drm:drm_mode_object_get] OBJ ID: 159=
 (1)
> > > Jun 01 15:22:42 endless kernel: [drm:drm_mode_object_get] OBJ ID: 154=
 (1)
> > > Jun 01 15:22:42 endless kernel: [drm:drm_calc_timestamping_constants]
> > > crtc 64: hwmode: htotal 2200, vtotal 1125, vdisplay 1080
> > > Jun 01 15:22:42 endless kernel: [drm:drm_calc_timestamping_constants]
> > > crtc 64: clock 148500 kHz framedur 16666666 linedur 14814
> > > Jun 01 15:22:42 endless kernel: [drm:drm_vblank_enable] enabling
> > > vblank on crtc 3, ret: 0
> > > Jun 01 15:22:42 endless kernel: [drm:drm_mode_object_put.part.0] OBJ =
ID: 159 (2)
> > > Jun 01 15:22:42 endless kernel: [drm:drm_mode_object_put.part.0] OBJ =
ID: 154 (2)
> > >
> > > Here is the full log
> > > https://gist.github.com/starnight/85d641819839eddc7a55ca7173990a56
> > >
> > > > > 3. The higher resolutions, like 1920x1080 ... are lost after hot
> > > > > re-plug HDMI cable (HDMI0)
> > >
> > > I should explain this in more detail.  Here are the steps to reproduce
> > > this issue:
> > > 1. Before unplug the HDMI cable from HDMI0 port.
> > > $ xrandr
> > > Screen 0: minimum 320 x 200, current 1920 x 1080, maximum 2048 x 2048
> > > HDMI-1 connected primary 1920x1080+0+0 (normal left inverted right x
> > > axis y axis) 521mm x 293mm
> > >    1920x1080     60.00*+  50.00    59.94
> > >    1920x1080i    60.00    50.00    59.94
> > >    1680x1050     59.88
> > >    1280x1024     75.02    60.02
> > >    1440x900      59.90
> > >    1280x960      60.00
> > >    1152x864      75.00
> > >    1280x720      60.00    50.00    59.94
> > >    1440x576      50.00
> > >    1024x768      75.03    70.07    60.00
> > >    1440x480      60.00    59.94
> > >    832x624       74.55
> > >    800x600       72.19    75.00    60.32    56.25
> > >    720x576       50.00
> > >    720x480       60.00    59.94
> > >    640x480       75.00    72.81    66.67    60.00    59.94
> > >    720x400       70.08
> > > HDMI-2 disconnected (normal left inverted right x axis y axis)
> > >
> > > 2. Unplug the HDMI cable from HDMI0 port.
> > > 3. Plug the HDMI cable to **HDMI1** port.
> > > $ xrandr
> > > Screen 0: minimum 320 x 200, current 1920 x 1080, maximum 2048 x 2048
> > > HDMI-1 disconnected (normal left inverted right x axis y axis)
> > > HDMI-2 connected primary 1920x1080+0+0 (normal left inverted right x
> > > axis y axis) 521mm x 293mm
> > >    1920x1080     60.00*+  50.00    59.94
> > >    1920x1080i    60.00    50.00    59.94
> > >    1680x1050     59.88
> > >    1280x1024     75.02    60.02
> > >    1440x900      59.90
> > >    1280x960      60.00
> > >    1152x864      75.00
> > >    1280x720      60.00    50.00    59.94
> > >    1440x576      50.00
> > >    1024x768      75.03    70.07    60.00
> > >    1440x480      60.00    59.94
> > >    832x624       74.55
> > >    800x600       72.19    75.00    60.32    56.25
> > >    720x576       50.00
> > >    720x480       60.00    59.94
> > >    640x480       75.00    72.81    66.67    60.00    59.94
> > >    720x400       70.08
> > >
> > > 4. Unplug the HDMI cable from **HDMI1** port.
> > > 5. Plug the HDMI cable back to HDMI0 port.
> > > $ xrandr
> > > Screen 0: minimum 320 x 200, current 1368 x 768, maximum 2048 x 2048
> > > HDMI-1 connected primary 1368x768+0+0 (normal left inverted right x
> > > axis y axis) 0mm x 0mm
> > >    1368x768      59.88*
> > >    1360x768      59.80
> > >    1280x800      59.81
> > >    1152x864      60.00
> > >    1280x720      59.86
> > >    1024x768      60.00
> > >    1024x576      59.90
> > >    960x540       59.63
> > >    800x600       60.32
> > >    800x450       59.82
> > >    700x450       59.88
> > >    640x480       59.94
> > >    684x384       59.88    59.85
> > >    680x384       59.80    59.96
> > >    640x400       59.88    59.98
> > >    576x432       60.06
> > >    640x360       59.86    59.83
> > >    512x384       60.00
> > >    512x288       60.00    59.92
> > >    480x270       59.63    59.82
> > >    400x300       60.32
> > >    320x240       60.05
> > > HDMI-2 disconnected (normal left inverted right x axis y axis)
> >
> > Sorry for getting back at it so late. I just tested with modetest only
> > and my current branch and it seems to behave properly. Did you had to
> > run X to get that issue, or is it just how you noticed it?
> >
> > Also, was that with the branch based on 5.7 I pushed on my git tree on
> > kernel.org or some earlier revision of the series?
>=20
> Thanks for coming back :)
>=20
> I use GNOME 3.36 with Xorg 1.20.4.
>=20
> To understand when it starts to hit the issues, I separate to step by ste=
p:
> 1. System boots into command line mode first (systemd multi-user.target)
> 2. Execute Xorg, then xterm.
> 3. Execute mutter upon the screen of Xorg.
>=20
> I tried both branches rpi4-kms and rpi4-kms-5.7 of
> https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git
> Both of the branches hit issues:
> * The screen flashes suddenly sometimes.  This happens after mutter is la=
unched.
> * The higher resolutions, like 1920x1080 ... are lost after hot
> re-plug HDMI cable (HDMI0).  HDMI cable connects to HDMI0 -> HDMI1 ->
> HDMI0.  This happens not only with GNOME, but also pure Xorg.

I just tested with raspbian exactly this, running the same xorg version:
https://pastebin.com/3fKeFPxf

And without X involved, modetest also reports the modes properly, so
it's probably something in either the DDX you're using or Gnome/mutter.

Maxime

--yksztr2amnkhaur2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXv8q6wAKCRDj7w1vZxhR
xabEAP9kaeHz1BWPFh3I27T/E6ShRFd3XIR8615gyS2pCZItIwD9GYtH2BgSIfMd
ipmn9OI9AGceWKTVcQvOX9WrRlyATAo=
=+Jlb
-----END PGP SIGNATURE-----

--yksztr2amnkhaur2--
