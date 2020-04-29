Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 787191BD7AD
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Apr 2020 10:55:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726366AbgD2IzI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Apr 2020 04:55:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726345AbgD2IzI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Apr 2020 04:55:08 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF860C03C1AD;
        Wed, 29 Apr 2020 01:55:07 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id d17so1468778wrg.11;
        Wed, 29 Apr 2020 01:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pN+/RsoJOwfLtXLlFOf9eThv+fbK95dYJM/V7QXaQ/Q=;
        b=kdeetTkkKu4seCme1mTrxKMrQ0Cw7A1McEvtF3jxdIA9U/CYQMr34ZFCuhxbPWiSu7
         5z5DaKnb7VledNwXV0fYtkO8nBKAWEXtoEGT/28HXURkbUroDyS8Oktouf1KspFnbT4A
         d2eJtBc6qb/BJ7F/pGfFYZET+mYp+sqW1yRWa40ua0zyQ4pq5YnFOajOrpxJ986FFup5
         hmWME6/GFpIXoOVAOwkZjXyo9tcVK8+SVlncRSDKTf3DHwig9xfQoANjm6kB1oq8TiNr
         TlJQQ/o1nMlMSQ7gwB5aa/9ANdTgJGtEC9SXoZ6zRpbUko//iNdyetKxUyf1Ei3lEweb
         h8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pN+/RsoJOwfLtXLlFOf9eThv+fbK95dYJM/V7QXaQ/Q=;
        b=V3aOosne+dStAAGnvo1DK2s9LiUwe5rDDjMhQG3ad0rO7gLGxxCvixCrV5hNJNVHuX
         tWtteqDMMM8t1UVNnWvX07/IAoJdrt/JEhK9ttEJ9wD2bQZs48rwz55xRhHaF+xwZ+88
         eUrHLO7CDxZPDjRVo1bxL3aoaOWQTjTNlByB3hY405CTDjX2lg+hgtxrqbFYOUUPxVYh
         trY1X7AKghI/gQCA8nEheHU/y9MFsof3TUkuOguX3R+XT1HJZMxNyIMKmsQ/jhHkTYpq
         lNc6lNiqNxwIPQ9/icAiuzRGCBNJ0O0ND91hJSBMzjSwnfsMQilU/i8MmByLGTwuh77B
         HSJg==
X-Gm-Message-State: AGi0PuaOfkxrN2rUkMJcGGyQeaZcJX4YutUWEttOwpXjNCSF+6vP/bLp
        I3VEx0hIVawF3V4yarD2o97HEU+h
X-Google-Smtp-Source: APiQypJCgmDuRtTM7AtvNKb0zsppf4WCTPA7V1jPYf/V7cmDen0W+cBNcYja4h7IztodgF+2B3zCcQ==
X-Received: by 2002:adf:f343:: with SMTP id e3mr36765270wrp.51.1588150506334;
        Wed, 29 Apr 2020 01:55:06 -0700 (PDT)
Received: from localhost (p2E5BEDBA.dip0.t-ipconnect.de. [46.91.237.186])
        by smtp.gmail.com with ESMTPSA id h6sm6610577wmf.31.2020.04.29.01.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 01:55:04 -0700 (PDT)
Date:   Wed, 29 Apr 2020 10:55:02 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Manikanta Maddireddy <mmaddireddy@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
Message-ID: <20200429085502.GB2345465@ulmo>
References: <fd1ca178-1ea3-851f-20a6-10bf00453ce3@nvidia.com>
 <a5734f19-254e-b6bc-e791-fa1ac63f11a4@gmail.com>
 <79f6560e-dbb5-0ae1-49f8-cf1cd95396ec@nvidia.com>
 <20200427074837.GC3451400@ulmo>
 <c1190858-eaea-8e94-b4d1-1cf28076c330@gmail.com>
 <20200427110033.GC3464906@ulmo>
 <3a06811c-02dc-ce72-ebef-78c3fc3f4f7c@gmail.com>
 <20200427151234.GE3464906@ulmo>
 <1ab276cf-c2b0-e085-49d8-b8ce3dba8fbe@gmail.com>
 <20200429081448.GA2345465@ulmo>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wq9mPyueHGvFACwf"
Content-Disposition: inline
In-Reply-To: <20200429081448.GA2345465@ulmo>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wq9mPyueHGvFACwf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2020 at 10:14:48AM +0200, Thierry Reding wrote:
> On Mon, Apr 27, 2020 at 06:18:34PM +0300, Dmitry Osipenko wrote:
> > 27.04.2020 18:12, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > > On Mon, Apr 27, 2020 at 05:21:30PM +0300, Dmitry Osipenko wrote:
> > >> 27.04.2020 14:00, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > >>> On Mon, Apr 27, 2020 at 12:52:10PM +0300, Dmitry Osipenko wrote:
> > >>>> 27.04.2020 10:48, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > >>>> ...
> > >>>>>> Maybe but all these other problems appear to have existed for so=
metime
> > >>>>>> now. We need to fix all, but for the moment we need to figure ou=
t what's
> > >>>>>> best for v5.7.
> > >>>>>
> > >>>>> To me it doesn't sound like we have a good handle on what exactly=
 is
> > >>>>> going on here and we're mostly just poking around.
> > >>>>>
> > >>>>> And even if things weren't working quite properly before, it soun=
ds to
> > >>>>> me like this patch actually made things worse.
> > >>>>
> > >>>> There is a plenty of time to work on the proper fix now. To me it =
sounds
> > >>>> like you're giving up on fixing the root of the problem, sorry.
> > >>>
> > >>> We're at -rc3 now and I haven't seen any promising progress in the =
last
> > >>> week. All the while suspend/resume is now broken on at least one bo=
ard
> > >>> and that may end up hiding any other issues that could creep in in =
the
> > >>> meantime.
> > >>>
> > >>> Furthermore we seem to have a preexisting issue that may very well
> > >>> interfere with this patch, so I think the cautious thing is to reve=
rt
> > >>> for now and then fix the original issue first. We can always come b=
ack
> > >>> to this once everything is back to normal.
> > >>>
> > >>> Also, people are now looking at backporting this to v5.6. Unless we
> > >>> revert this from v5.7 it may get picked up for backports to other
> > >>> kernels and then I have to notify stable kernel maintainers that th=
ey
> > >>> shouldn't and they have to back things out again. That's going to c=
ause
> > >>> a lot of wasted time for a lot of people.
> > >>>
> > >>> So, sorry, I disagree. I don't think we have "plenty of time".
> > >>
> > >> There is about a month now before the 5.7 release. It's a bit too ea=
rly
> > >> to start the panic, IMO :)
> > >=20
> > > There's no panic. A patch got merged and it broken something, so we
> > > revert it and try again. It's very much standard procedure.
> > >=20
> > >> Jon already proposed a reasonable simple solution: to keep PCIe
> > >> regulators always-ON. In a longer run we may want to have I2C atomic
> > >> transfers supported for a late suspend phase.
> > >=20
> > > That's not really a solution, though, is it? It's just papering over
> > > an issue that this patch introduced or uncovered. I'm much more in
> > > favour of fixing problems at the root rather than keep papering over
> > > until we loose track of what the actual problems are.
> >=20
> > It's not "papering over an issue". The bug can't be fixed properly
> > without introducing I2C atomic transfers support for a late suspend
> > phase, I don't see any other solutions for now. Stable kernels do not
> > support atomic transfers at all, that proper solution won't be backport=
able.
>=20
> Hm... on a hunch I tried something and, lo and behold, it worked. I can
> get Cardhu to properly suspend/resume on top of v5.7-rc3 with the
> following sequence:
>=20
> 	revert 9f42de8d4ec2 i2c: tegra: Fix suspending in active runtime PM state
> 	apply http://patchwork.ozlabs.org/project/linux-tegra/patch/201912131344=
17.222720-1-thierry.reding@gmail.com/
>=20
> I also ran that through our test farm and I don't see any other issues.
> At the time I was already skeptical about pm_runtime_force_suspend() and
> pm_runtime_force_resume() and while I'm not fully certain why exactly it
> doesn't work, the above on top of v5.7-rc3 seems like a good option.
>=20
> I'll try to do some digging if I can find out why exactly force suspend
> and resume doesn't work.

Ah... so it looks like pm_runtime_force_resume() never actually does
anything in this case and then disable_depth remains at 1 and the first
tegra_i2c_xfer() will then fail to runtime resume the controller.

Thierry

--wq9mPyueHGvFACwf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6pQOIACgkQ3SOs138+
s6FJOBAAmZaix3RlDPH0u6y8aYqOfVJOMEH8nOzhEvyZzUxGAzSFBXHed9P2Qhos
RXorSpce3RXWX/ak1jUvXrJontZr8KfYvkz0j4A6UwzRdXUOPlpQSmOFPNys5D92
c6BcRmsqqhw0ZdJv3VX+xHUMDPcAjwYQOEVDNKSK8zLyUgpBAxuAaeQjHoBLaoLn
WDwN3rXmN1pX4VwYf8w3SFc3fwCFeByGDWHpY3CYCTGMeRZA/+21DQYGtdkCXoXM
umRhw7uLsE8YtzYfIy+2aIbfVYltzO4o0jKmxGv1z3G+zN1+2+i3lIEphDS4M2j4
n6+wImva0/TD2is7Khi1saFE7wHT3ghUq3OtRxx9gFagQYnwP1fVzrCW1Pmg142f
F0PJjoAAAJP92GhHs1wtSHryGkzaRpvg10KeZLDGmnHUpr5lsrByH3vmqevMqNfb
+CqBWBvqGuUnUtRK/opKUkKEJHTmm/P3JhyGeeTLe8azqNu1JQs3bKL3Oec/wxuT
goBP0SLbKeJw93nGsl0tKBN7pL0csXj98ToHjKXATu5AJ8vpqC+hanPcDIw/FPTz
1CUHkpjS4wdw1XVPTJklzLI5ogYUF4w9U/eaY927zOe0il+r/xYxYdH4VB0pNxJU
Z/fzWX0vqDUk0bJGji9IeYKpk2FOpIUUMPUCgqSFS15we3jxRN4=
=e/xK
-----END PGP SIGNATURE-----

--wq9mPyueHGvFACwf--
