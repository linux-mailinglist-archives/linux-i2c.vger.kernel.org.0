Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F383F1BD6ED
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Apr 2020 10:15:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726401AbgD2IOx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Apr 2020 04:14:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726355AbgD2IOx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Apr 2020 04:14:53 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA063C03C1AD;
        Wed, 29 Apr 2020 01:14:52 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id x17so1363140wrt.5;
        Wed, 29 Apr 2020 01:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mZ9nmYfVscIKSoOv3hAxmlwFmolTjEnwI6aGV+jeb+k=;
        b=SxbxXPmnAXwclFkA74EISkW0ObMw6vOlZf6ZJRuBBuq1ZCSDU4zctOAbgM3bISr3tB
         2R7abtwmeP57H/EfqoEOyWHnUN3MR6vMogkFLboRiF/CoXOPfV3P9X5r0lXA+i2/eqsM
         AZEQN2jv+4x0nB7tJrM7EFpPaCIoaNVXSL3sveAdF7S1dsDMa47bwJ5xFEXwB8lRDrPQ
         Lr+FOjiRs7A0ThjpmlGfAPz03XPA2AAaPzeL/ko4T6b5W947HJ+pQrv0MaHdSjbRYNMY
         +DinsAunPJdjrrpc1PcoCMQJavYKdIKNY/EBYlsGma+Y38DaksOcHzD6nG13i8NhZ5ny
         bR6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mZ9nmYfVscIKSoOv3hAxmlwFmolTjEnwI6aGV+jeb+k=;
        b=Sd9LZ7wJwo4eD7RGawTb1ORmN6euYX0E/NZDoftqUvw7cUsAlgn8kzgz5438zt8FAR
         re5nAaJQ63aOv/t7krEknPXyiHQTJdnoeUW8koGy03JZsI8s0B8/Gnmul6jbiffQypl5
         P9OxqJN6qz4XLHprQB5POA59kpu5jvp4mGgA874qdayNCiu8rVuQlU4EP5pCbpDbDyOy
         DV23ltNLJNfD2ix/r7wrmGM8ffuF0sJHfNwhkB+41ZjN7HGm1kzvy8cagp5/EzDRCrHT
         x24A3WiUCV9m4bEAzKpBA9+7Yy/ANie7iOcKTaD5j6wbZuyemoeZYR4kQ+iLJkE4qbE8
         pF/g==
X-Gm-Message-State: AGi0PuabFwuGbfrr7Z2R1UERWo+VuOmKknM81oF6xkpIO/8Q/lbnzMNp
        ZS0NN/cl+EE4d1ohRwmVTCRxRLtr
X-Google-Smtp-Source: APiQypJnsa4b+iDoWDzclN3hPXMZgJptYeH58mnXNTXoQZ/LTjRyi4nFzH54WL1sPr6+YPDPu9hj4w==
X-Received: by 2002:a5d:4042:: with SMTP id w2mr35157333wrp.195.1588148091373;
        Wed, 29 Apr 2020 01:14:51 -0700 (PDT)
Received: from localhost (p2E5BEDBA.dip0.t-ipconnect.de. [46.91.237.186])
        by smtp.gmail.com with ESMTPSA id d5sm29169088wrp.44.2020.04.29.01.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 01:14:49 -0700 (PDT)
Date:   Wed, 29 Apr 2020 10:14:48 +0200
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
Message-ID: <20200429081448.GA2345465@ulmo>
References: <f8fb1f7f-2497-033e-ff2c-c86c6caa9706@gmail.com>
 <fd1ca178-1ea3-851f-20a6-10bf00453ce3@nvidia.com>
 <a5734f19-254e-b6bc-e791-fa1ac63f11a4@gmail.com>
 <79f6560e-dbb5-0ae1-49f8-cf1cd95396ec@nvidia.com>
 <20200427074837.GC3451400@ulmo>
 <c1190858-eaea-8e94-b4d1-1cf28076c330@gmail.com>
 <20200427110033.GC3464906@ulmo>
 <3a06811c-02dc-ce72-ebef-78c3fc3f4f7c@gmail.com>
 <20200427151234.GE3464906@ulmo>
 <1ab276cf-c2b0-e085-49d8-b8ce3dba8fbe@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Content-Disposition: inline
In-Reply-To: <1ab276cf-c2b0-e085-49d8-b8ce3dba8fbe@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2020 at 06:18:34PM +0300, Dmitry Osipenko wrote:
> 27.04.2020 18:12, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Mon, Apr 27, 2020 at 05:21:30PM +0300, Dmitry Osipenko wrote:
> >> 27.04.2020 14:00, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> On Mon, Apr 27, 2020 at 12:52:10PM +0300, Dmitry Osipenko wrote:
> >>>> 27.04.2020 10:48, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>> ...
> >>>>>> Maybe but all these other problems appear to have existed for some=
time
> >>>>>> now. We need to fix all, but for the moment we need to figure out =
what's
> >>>>>> best for v5.7.
> >>>>>
> >>>>> To me it doesn't sound like we have a good handle on what exactly is
> >>>>> going on here and we're mostly just poking around.
> >>>>>
> >>>>> And even if things weren't working quite properly before, it sounds=
 to
> >>>>> me like this patch actually made things worse.
> >>>>
> >>>> There is a plenty of time to work on the proper fix now. To me it so=
unds
> >>>> like you're giving up on fixing the root of the problem, sorry.
> >>>
> >>> We're at -rc3 now and I haven't seen any promising progress in the la=
st
> >>> week. All the while suspend/resume is now broken on at least one board
> >>> and that may end up hiding any other issues that could creep in in the
> >>> meantime.
> >>>
> >>> Furthermore we seem to have a preexisting issue that may very well
> >>> interfere with this patch, so I think the cautious thing is to revert
> >>> for now and then fix the original issue first. We can always come back
> >>> to this once everything is back to normal.
> >>>
> >>> Also, people are now looking at backporting this to v5.6. Unless we
> >>> revert this from v5.7 it may get picked up for backports to other
> >>> kernels and then I have to notify stable kernel maintainers that they
> >>> shouldn't and they have to back things out again. That's going to cau=
se
> >>> a lot of wasted time for a lot of people.
> >>>
> >>> So, sorry, I disagree. I don't think we have "plenty of time".
> >>
> >> There is about a month now before the 5.7 release. It's a bit too early
> >> to start the panic, IMO :)
> >=20
> > There's no panic. A patch got merged and it broken something, so we
> > revert it and try again. It's very much standard procedure.
> >=20
> >> Jon already proposed a reasonable simple solution: to keep PCIe
> >> regulators always-ON. In a longer run we may want to have I2C atomic
> >> transfers supported for a late suspend phase.
> >=20
> > That's not really a solution, though, is it? It's just papering over
> > an issue that this patch introduced or uncovered. I'm much more in
> > favour of fixing problems at the root rather than keep papering over
> > until we loose track of what the actual problems are.
>=20
> It's not "papering over an issue". The bug can't be fixed properly
> without introducing I2C atomic transfers support for a late suspend
> phase, I don't see any other solutions for now. Stable kernels do not
> support atomic transfers at all, that proper solution won't be backportab=
le.

Hm... on a hunch I tried something and, lo and behold, it worked. I can
get Cardhu to properly suspend/resume on top of v5.7-rc3 with the
following sequence:

	revert 9f42de8d4ec2 i2c: tegra: Fix suspending in active runtime PM state
	apply http://patchwork.ozlabs.org/project/linux-tegra/patch/20191213134417=
=2E222720-1-thierry.reding@gmail.com/

I also ran that through our test farm and I don't see any other issues.
At the time I was already skeptical about pm_runtime_force_suspend() and
pm_runtime_force_resume() and while I'm not fully certain why exactly it
doesn't work, the above on top of v5.7-rc3 seems like a good option.

I'll try to do some digging if I can find out why exactly force suspend
and resume doesn't work.

Thierry

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6pN3QACgkQ3SOs138+
s6FqAQ//RHJgl9oNrYYROPHrxVn2OtMcmj5+/dkO6Kh5NhE2esqn/x81QNWSgHwJ
b2KkOJJW9z7npldk5w6IR5VPwN8Su4bcK16e9gGOBLvOyjltOm50txt/rRIByKpI
0/9H158SB13+ppy1tfOMnq6u3imcbO/3YgjZ8+NXSpghACCAhwEfgh5sccG/ZoXK
GC1AsI7QHQxDR/HONQKhQNqnUWeEW8OJ9+WrZJrFZQ7PgkSF7bEEReAGFlR7jMTJ
d8oqCP7OdrAWWskeHOdvlGeYyxl0EjTIwEDFe/ggh0hNBuG1RmcyPQSf/FOo5n54
ZgaSfi7wwQbnK3XTjJSBZBKwBGwlio0Fky0UbP2fZpWNLnf161n0QTPNc7xsu/Ex
jNjqZx1KE1xLgo1Hv+2rz6xRFT1TTyB7J/jIxazqhn5cP1Sk+8oY/4/IAr7kmPbq
2DZS+ijyqcGO+P4qDtPsdHn1j9MQTimVfF/tTzLIx31PH/+b92btgl0MMx3/tPXt
14K7kJ6idTPm34vPVw0Lk3NWkI3oCr2xBawY9gSWYETQd5FUlA/OtP0aP91A1CQU
BVv3txR7kxVCsGqKtv5PCS1PgLWcpJDBxsffOELv/FIb/X6SlbFBkOV51aptOlYS
PZkLNNzV4KkFQMipM/E+p3gPx366wnhHXo1MhCqlVfwnQZtzCWI=
=NmFD
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--
