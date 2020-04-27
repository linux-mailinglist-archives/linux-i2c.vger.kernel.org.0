Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 543C21BA630
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Apr 2020 16:19:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728067AbgD0OT1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Apr 2020 10:19:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728070AbgD0OT1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Apr 2020 10:19:27 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD058C0610D5;
        Mon, 27 Apr 2020 07:19:26 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id e26so19749417wmk.5;
        Mon, 27 Apr 2020 07:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=SfPuELRIWxp5jXaR1sFBkvGfN5BclUxZ+W3cAMGm9ow=;
        b=E9TeY8dhIi+QX5Tt8DRtwCOArHPzendJuUF+E20AZFPXTpkhlupVJbX9O5Qo6qQWJW
         2Y5kftqQWrzPktcA0MrfBw5RFjZGprATbavPE0xi61C42SKOrw4/yA0Ad7363XkLAmWU
         pbrWM2xyex0VvN5XQonqjbrL9mGGKmqD1lSHAvfVo/QBp1aszS9lIhn8GnIVf2aui8ph
         u4i+cChluvH9k2uaDBFnlotTx3xyU3INS098ljIQp/DsVLxvIz0HA/d1ZtqDAMsTK69L
         vGMnRzLlmdXycw7nhBNzwovr7G1wU/EGliCjAQiJ3gjAeGpNqlhP2YC1DEDgEVKo2PU8
         gT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SfPuELRIWxp5jXaR1sFBkvGfN5BclUxZ+W3cAMGm9ow=;
        b=S0CS63cnAZR7l9cTHunoo+orH97HYOjFELgDcuFtwS+wqKPWmdhazxvMEk0NS5L38t
         D+TWjjRNPxR1TYqdTSNljHcylBFDQVdsyHFnne1OqwF+Zu/r+bkRJ0I1PbFHrkdQ86Bs
         XHhflzml3shmRvEQnEE5YdoZV8dKiyaWJeXIoMz/iBUpIsmGKOlMxvOC/3zeWx547+d5
         Re4A2g1Dd7Ytmju50RULnHR2kUOQIyveEDoVbfLyhxMFfL4Vg8t8MZjM01nxCtE0uF6b
         vgN5OGLkUo991wBXZl+cOvY2X6wOYWcnBcKSpVPOyShYtNZ66gv0TM5vGXaSE+ZBYizz
         zjzg==
X-Gm-Message-State: AGi0PuZjDGckitCzaiw/upAzRmc2KqGXKt+O25Wg/65l3rfbVLaH9K+T
        HhYAked0kC5z6OkI1haKfFE=
X-Google-Smtp-Source: APiQypI2SvMyeV2Q5rXnJ14bTo3q4Z66XQDagd3Qhp4sIf61dariP2UlM+4tloNavM2mOhhrF0DeFQ==
X-Received: by 2002:a1c:3b0a:: with SMTP id i10mr25763470wma.26.1587997165506;
        Mon, 27 Apr 2020 07:19:25 -0700 (PDT)
Received: from localhost (p2E5BEDBA.dip0.t-ipconnect.de. [46.91.237.186])
        by smtp.gmail.com with ESMTPSA id 33sm21525843wrp.5.2020.04.27.07.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 07:19:23 -0700 (PDT)
Date:   Mon, 27 Apr 2020 16:19:22 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Jon Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Manikanta Maddireddy <mmaddireddy@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
Message-ID: <20200427141922.GD3464906@ulmo>
References: <d2531fc1-b452-717d-af71-19497e14ef00@gmail.com>
 <a5198024-7273-74c4-b4f4-3a29d042bc36@nvidia.com>
 <f8fb1f7f-2497-033e-ff2c-c86c6caa9706@gmail.com>
 <fd1ca178-1ea3-851f-20a6-10bf00453ce3@nvidia.com>
 <a5734f19-254e-b6bc-e791-fa1ac63f11a4@gmail.com>
 <79f6560e-dbb5-0ae1-49f8-cf1cd95396ec@nvidia.com>
 <20200427074837.GC3451400@ulmo>
 <c1190858-eaea-8e94-b4d1-1cf28076c330@gmail.com>
 <20200427103851.GB24446@kunai>
 <dc2de966-81d6-6ad5-0c51-16dd28ca4165@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lc9FT7cWel8HagAv"
Content-Disposition: inline
In-Reply-To: <dc2de966-81d6-6ad5-0c51-16dd28ca4165@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--lc9FT7cWel8HagAv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2020 at 04:15:21PM +0300, Dmitry Osipenko wrote:
> 27.04.2020 13:38, Wolfram Sang =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Mon, Apr 27, 2020 at 12:52:10PM +0300, Dmitry Osipenko wrote:
> >> 27.04.2020 10:48, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >> ...
> >>>> Maybe but all these other problems appear to have existed for someti=
me
> >>>> now. We need to fix all, but for the moment we need to figure out wh=
at's
> >>>> best for v5.7.
> >>>
> >>> To me it doesn't sound like we have a good handle on what exactly is
> >>> going on here and we're mostly just poking around.
> >>>
> >>> And even if things weren't working quite properly before, it sounds to
> >>> me like this patch actually made things worse.
> >>
> >> There is a plenty of time to work on the proper fix now. To me it soun=
ds
> >> like you're giving up on fixing the root of the problem, sorry.
> >=20
> > From what I understood, there were (at least) two regressions reported.
> > So, to me, it makes sense to revert the change, so for upstream users
> > everything stays "the same". Of course, this does not mean it should
> > stay like this forever and you guys can work on fixing the root causes.
> > I'll happily apply them for this release when you are confident with the
> > results.
> >=20
>=20
> For now it's a single regression in the PCIe driver and it's actually
> not a regression, but a PCIe driver bug that needs to be fixed. The I2C
> part should be okay.
>=20
> By reverting the I2C patch, we're back to the PCIe bug being papered
> over and I don't like this. Let's just fix the PCIe driver and the
> problem is gone.. it needs to be fixed anyways.

Yes, that bug should be fixed anyway. But that doesn't justify breaking
suspend/resume completely, which *is* a regression.

Look, I'm not saying that we should drop this patch altogether. All I'm
saying is that we should postpone it so that we can: a) get suspend and
resume working again (and by doing so make sure no other suspend/resume
regressions silently creep in, because that always seems to happen when
you're not looking) and b) fix any preexisting issues without possibly
scrambling the result with this perhaps unrelated fix.

So, again, I think the safest road forward is to back this one out for
now, fix whatever this other bug is and once suspend/resume is working
properly again we can revisit this patch based on a known-good baseline.

Thierry

--lc9FT7cWel8HagAv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6m6egACgkQ3SOs138+
s6Hmsw//Uzwdybr9wuj6AsAY89t463pL9vAk42ZwhrzZBpXcey07PyykuVPeOksH
dlekmFYutFVttiZne1WWhfyo0q+pWa7OtsmatGZ0zj6Dqa69Jv3lwpwXTwm1dHoC
T+NTx7/h3Gcz4qWY8sZBiikzXwePh5WkZ9n02t5j5xeOBaxPBnvNWsd/1dx3Wry6
aFwOvwEOmCGKTLvx3h+IgGGCXU2Fw9TXWL9PM0RygZD4/ZGmzpsrcI0Kq/qhsEax
ZIqfNYKt7Df/71HBSusjwzUf1Xc4PBHXQXY5DC0XT+lIZxlWcDkeVoH9/hsm+/mn
Y5Z1jHdYtUXvfeVEM7Uygj4r87Qqq9oRyO09vzstZBgMnlfw7ooQUT/MaHcUpMY3
bd66W/9pO6LsBVJ32+GpL3WavNmD7h1EwU4VoSjkHKr5bDl5PWMqDrUB3H72TjK4
567mRx2ZdLJ5G7x76PXH7P8FT9XmbGvFHRtY2J1oV8DTTFUwnA5Z1op9A88tcKIO
+s1kmqFObLC5PIQUx9hCzbprRN2R8p4WemoG3Goe2Cs3ZUcaTbIVUKA0K+xLoJPx
xOcFR0cWOYzabOGW8le54lj5IrCDFtYocozhD/KzYhoW1ZuEN7w+ljR64xIcbB7D
D3/heQd0r+WLZQxYT7sBrpK70bB7DPXXuIScoLR4fmcBUdinTDk=
=3Tty
-----END PGP SIGNATURE-----

--lc9FT7cWel8HagAv--
