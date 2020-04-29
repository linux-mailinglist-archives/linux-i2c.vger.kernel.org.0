Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F12B1BE3DF
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Apr 2020 18:30:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726481AbgD2QaY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Apr 2020 12:30:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726423AbgD2QaY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Apr 2020 12:30:24 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B64ECC03C1AE;
        Wed, 29 Apr 2020 09:30:23 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id d15so3323749wrx.3;
        Wed, 29 Apr 2020 09:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eDLFJhIDyyhZFfNHp7gDZU+deFWav84Z9YpnjYPu3Bw=;
        b=lJunmteZQVriwxd6lHaa1io/1eT/FcGDL9M+vWDmyrPaHy2R/Oh0T3emayqwFOlsMT
         j9dyYmWAXU4RN5k6ivHgmwBTuY+ATqvqOvF2PKJMPsgpJnz+PYhmmy6DXXyxyZxunuQX
         EJ0IsoBkwOx52ULy2KZ+WMgfDecgfDMGkNHMIpLJEhjSXjpzfMD/IWBDcZCylQmFhJRl
         U5qm0hoLbPWoWK/lZ4vJKFX1KyepY8cz945hBs7tbEWEQczDEX17vK6g/gF3YdPLlcI1
         tLW8as0csKYeJcrbtpfzwZJ5PB3EF+rQBezwZN44ixIwbXUaUvMOYfXC/A8yAQ9jtx7e
         F+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eDLFJhIDyyhZFfNHp7gDZU+deFWav84Z9YpnjYPu3Bw=;
        b=dG71OgbCciLWQI0/w6HddOFZrz+o0KIk+o8iSTNACr6deVfogeXlQhlt7hVgTZYPLy
         rznHrhG5PSx91D6BM91JUlu5svQS1v4ukBSM+EYiuPnDUMiznvb2/as2YvwhptosztkM
         aG6N1RoRonggZ+ee56ir+prInjbJ3y3qexETHp3s9NE4uJyYaUDGXlOq43LgLs3F8Uwi
         kGBsenISxUrwv/JMWqlTENHkNGShM/DwT8sWCiNwwHr02Vu6Ga1swK0+mC2H02HUuZHv
         RwbKKQKzQbbDCG9q2frVsiiW2QubRcXWlLzFgHsrKTCzsTPXYokWvYUgFm4dz1WQSMre
         n+hw==
X-Gm-Message-State: AGi0PuaX1/J1/hN+vylUT+4dM6eAGa+WvgnegQ1cjhfKCNO7YP2UGYIY
        POJT84dlHk4L6z1YdVOQDPs=
X-Google-Smtp-Source: APiQypJREiAFT6nMiFtUv2zKh9f2y9oJySGt4M7D2mAaBEOiCK8/Xmq3exOuVGZqFZySDZQoaC3Izg==
X-Received: by 2002:adf:82cf:: with SMTP id 73mr39693899wrc.411.1588177822452;
        Wed, 29 Apr 2020 09:30:22 -0700 (PDT)
Received: from localhost (p2E5BEDBA.dip0.t-ipconnect.de. [46.91.237.186])
        by smtp.gmail.com with ESMTPSA id w4sm14891590wro.28.2020.04.29.09.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 09:30:21 -0700 (PDT)
Date:   Wed, 29 Apr 2020 18:30:20 +0200
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
Message-ID: <20200429163020.GB3157354@ulmo>
References: <79f6560e-dbb5-0ae1-49f8-cf1cd95396ec@nvidia.com>
 <20200427074837.GC3451400@ulmo>
 <c1190858-eaea-8e94-b4d1-1cf28076c330@gmail.com>
 <20200427110033.GC3464906@ulmo>
 <3a06811c-02dc-ce72-ebef-78c3fc3f4f7c@gmail.com>
 <20200427151234.GE3464906@ulmo>
 <1ab276cf-c2b0-e085-49d8-b8ce3dba8fbe@gmail.com>
 <20200429081448.GA2345465@ulmo>
 <20200429085502.GB2345465@ulmo>
 <9e36c4ec-ca02-bd15-d765-15635f09db4b@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="98e8jtXdkpgskNou"
Content-Disposition: inline
In-Reply-To: <9e36c4ec-ca02-bd15-d765-15635f09db4b@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--98e8jtXdkpgskNou
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2020 at 03:35:26PM +0300, Dmitry Osipenko wrote:
> 29.04.2020 11:55, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
> >>> It's not "papering over an issue". The bug can't be fixed properly
> >>> without introducing I2C atomic transfers support for a late suspend
> >>> phase, I don't see any other solutions for now. Stable kernels do not
> >>> support atomic transfers at all, that proper solution won't be backpo=
rtable.
> >>
> >> Hm... on a hunch I tried something and, lo and behold, it worked. I can
> >> get Cardhu to properly suspend/resume on top of v5.7-rc3 with the
> >> following sequence:
> >>
> >> 	revert 9f42de8d4ec2 i2c: tegra: Fix suspending in active runtime PM s=
tate
> >> 	apply http://patchwork.ozlabs.org/project/linux-tegra/patch/201912131=
34417.222720-1-thierry.reding@gmail.com/
> >>
> >> I also ran that through our test farm and I don't see any other issues.
> >> At the time I was already skeptical about pm_runtime_force_suspend() a=
nd
> >> pm_runtime_force_resume() and while I'm not fully certain why exactly =
it
> >> doesn't work, the above on top of v5.7-rc3 seems like a good option.
> >>
> >> I'll try to do some digging if I can find out why exactly force suspend
> >> and resume doesn't work.
> >=20
> > Ah... so it looks like pm_runtime_force_resume() never actually does
> > anything in this case and then disable_depth remains at 1 and the first
> > tegra_i2c_xfer() will then fail to runtime resume the controller.
>=20
> That's the exactly expected behaviour of the RPM force suspend/resume.
> The only unexpected part for me is that the tegra_i2c_xfer() runtime
> resume then fails in the NOIRQ phase.
>=20
> Anyways, again, today it's wrong to use I2C in the NOIRQ phase becasue
> I2C interrupt is disabled. It's the PCIe driver that should be fixed.

I don't think so. Everything works perfectly fine if we fix system
suspend/resume not to rely on pm_runtime_force_{suspend,resume}() and
directly call the runtime suspend/resume implementations.

So can we please stop deflecting and fix the damn I2C driver. From my
perspective we have two choices:

  1) do what I suggested above and revert the force suspend/resume patch
     and apply the "manual" suspend/resume patch instead

  2) revert this patch and go back to the drawing board

I suspect that with 2) we'd end up back where we started and have to do
1) anyway.

An alternative that I'd prefer even more would be to do 2) now for v5.7
and then we do 1) for v5.8 and give this some more soaking time.

Thierry

--98e8jtXdkpgskNou
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6pq5sACgkQ3SOs138+
s6EGCxAAkWtAzUCz3/+J/7TBO+zNAPzYIxgysMK/J8oIsFOJZwG1gd9ESUgp775d
lVniL7p+7llkJvqxebewr5MNmooah5ZWtWDSgpUFhAn4a0kxAvYT03CNuUYg+tO8
uZ20THWo6dsSEiXlwO7GGnuxgRdwSB2vT8lVzicT0fAKkJVWjjSnIZWCXC4nd9xM
yAXHKBi7V4iR6kGMGU7uUj3QnXmmKcqMHrb5HqV9IefizEqwQYnxfOJTL+Y1t7YI
tHY5QcGQLs4JAjO/cl/x3eTarXzn021rD0xTsTWP61Tm/mI0zljuDkKrg/Feq0Yd
8Xr3+jKk0rPaTL6dF7yFVrUOIloWwmTfYL6v8KB5R3g3LFiX7qjCAc0MYm7JCpDS
qXBzSkwygQqZZv2G0pemsVol9Hr0c4f108N02ZySb0c3NRLJvrI3xwgnYtkLrfgp
oa/uVaAexGmSNhdNRgLcgXi9kmailpVpA98MGhMYUmUXrNuumifrG3+bYPwKKrje
S+cdHqmiXvQbQ+9YUwowHd6SV3O8fKzc6vh469Dpn0jbrHULpg80KfNSSvZfekYG
jQjNHHdemt4qjRrk2gxWqwqw04EHtResJw8p/gH2+7CyffEiYiRR0v4rIYlY0DWa
BoWJtlk7qFSrqyiNRSiF0FjHZzjHGp4tj9FI1rpiqrGAhSgQP50=
=+jdz
-----END PGP SIGNATURE-----

--98e8jtXdkpgskNou--
