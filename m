Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5DD91C3ECF
	for <lists+linux-i2c@lfdr.de>; Mon,  4 May 2020 17:42:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728716AbgEDPmb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 May 2020 11:42:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726509AbgEDPmb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 May 2020 11:42:31 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8DA8C061A0E;
        Mon,  4 May 2020 08:42:30 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id v4so309405wme.1;
        Mon, 04 May 2020 08:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HZ0kwajVNDVc6kGRwmzoSlZILWUSqHM0exCohrNVZMM=;
        b=BkqQFi0+AaEtXI7qFmwdV/U1uRMvXrakoc5iKBneVuNlGZnI9wD220a1BtDxjCqfan
         o3+VUSP5Xes2bctImgy2dqXoBG9giE3NKvjUiroyuy8bb4llt9xoBuoXGcnVjy7KRCLO
         XAinVgEqxy5poa1UXsg47JMsXE3BCfrsL/vU2JByPuXh0Yorm1My3FKYKH/esydeNXeJ
         XU6zqtt8uzGpQJJfYRaVmFQ6s2MbORUkXEAswxHpkMbuWgcjzgkEd9XPcwPqcaSL1XMM
         Xjtr62lGe/M+G1yQjH/CJNg/sZANHFkQyUtA6JH7LyK2EWVhSlBAlw6FCHn4T6BaJYWm
         vwrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HZ0kwajVNDVc6kGRwmzoSlZILWUSqHM0exCohrNVZMM=;
        b=OWtlDEoS0BVNtMjOxB2l4isKiEfT9QvmayhGgdvvOLRqPNVhA2cKwubtXVjEP3XCgH
         0VH5bmJfk0beIBk+GoLkabNMwgPqEv/Thgduu1rmJbmFXe+yIl80jo5YZPUd0TRQ/vsQ
         Mv6EiSv1o2NFLVqm0iErWajRbWc6lm7S4bpuel8oBGRyDZLudEdJtFNlqrHgawTgq+RV
         t/19wf0K/4GB5NHnkz+/yERd0W6EcOs5PIWinTBsv7pwJTkjuIN5SdxlXAgJII5ShNTU
         z5RqjxjewfhGjvhbsp8s7ItvCHe8vvAbEODBfWduEwr8GpokHGOv0V2wFlJl3aSVt4zp
         tt5w==
X-Gm-Message-State: AGi0PubKRUuI8snmldx0CBRz134GOYYe7Kuwa05LZ8xmB/SJVLnGUy0q
        8TBaYfiSPRDxSNU9+2ci7j8=
X-Google-Smtp-Source: APiQypLpDC/GMx6y2l/BDiHCciUPwVbk3Hj60EHeltjqMQ2qh8snhlQDpB1WaaKTBiTwxh7Uv4DY+g==
X-Received: by 2002:a1c:c345:: with SMTP id t66mr16418509wmf.189.1588606949426;
        Mon, 04 May 2020 08:42:29 -0700 (PDT)
Received: from localhost (p2E5BE57B.dip0.t-ipconnect.de. [46.91.229.123])
        by smtp.gmail.com with ESMTPSA id q184sm14544893wma.25.2020.05.04.08.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 08:42:27 -0700 (PDT)
Date:   Mon, 4 May 2020 17:42:26 +0200
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
Message-ID: <20200504154226.GA614153@ulmo>
References: <fd1ca178-1ea3-851f-20a6-10bf00453ce3@nvidia.com>
 <a5734f19-254e-b6bc-e791-fa1ac63f11a4@gmail.com>
 <79f6560e-dbb5-0ae1-49f8-cf1cd95396ec@nvidia.com>
 <20200427074837.GC3451400@ulmo>
 <c1190858-eaea-8e94-b4d1-1cf28076c330@gmail.com>
 <20200427103851.GB24446@kunai>
 <dc2de966-81d6-6ad5-0c51-16dd28ca4165@gmail.com>
 <20200427141922.GD3464906@ulmo>
 <20200427153106.GA8113@kunai>
 <e5a3dd07-97f5-29f1-974e-3037a01cc89c@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Content-Disposition: inline
In-Reply-To: <e5a3dd07-97f5-29f1-974e-3037a01cc89c@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 02, 2020 at 05:40:35PM +0300, Dmitry Osipenko wrote:
> 27.04.2020 18:31, Wolfram Sang =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >=20
> >> Yes, that bug should be fixed anyway. But that doesn't justify breaking
> >> suspend/resume completely, which *is* a regression.
> >>
> >> Look, I'm not saying that we should drop this patch altogether. All I'm
> >> saying is that we should postpone it so that we can: a) get suspend and
> >> resume working again (and by doing so make sure no other suspend/resume
> >> regressions silently creep in, because that always seems to happen when
> >> you're not looking) and b) fix any preexisting issues without possibly
> >> scrambling the result with this perhaps unrelated fix.
> >>
> >> So, again, I think the safest road forward is to back this one out for
> >> now, fix whatever this other bug is and once suspend/resume is working
> >> properly again we can revisit this patch based on a known-good baselin=
e.
> >=20
> > I am with you here. I want to add that the proper fix should be
> > developed without thinking too much about stable in the first place.
> > *When* we have a proper working fix, then we can think about making it
> > "more" suitable for backporting. Yet, it may also be a result that older
> > kernels need a different solution. Or have no solution at all, in case
> > they can't do atomic_transfers and this is needed.
> >=20
> > D'accord?
> >=20
>=20
> I saw that you submitted the revert of the patches for 5.7, hopefully it
> won't result in putting the PCIe driver problem into the back burner.
> I'll try not to forget about these patches to resubmit them later on,
> once the problem will be resolved :)

I can put these two patches into a local development branch to keep
track of them. From what I said earlier, it looks like it would be fine
to apply these if we also make that runtime PM change (i.e. drop force
runtime PM and instead manually invoke runtime PM callbacks, which seems
to be in line with what the PM maintainers suggest, as pointed out
elsewhere in this thread).

How about if I put all of that into a branch and push it to linux-next
so that we can get some broader testing? I've already run it through our
internal test system, which, while not perfect, is the broadest system I
am aware of, and all tests came back positive.

I'm not exactly sure I see a real issue with the PCIe driver after those
patches are applied. The regulator errors are gone (presumably because
the regulators now do get turned off properly) and I don't observe any
other issues.

Thierry

--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6wN+AACgkQ3SOs138+
s6FAxQ//Z4QpPdcFLKFZCSCH23KA4t2/646O0Py+XUV421tLkrvkOepTvI2CXWQd
vj8cFw6SyA7IKDOEorgHT8nDwJqNTPuEO9eNS33QVlq21ezkibKXAfJH4kbrDr7l
pVFJajPsJWvHUS9ULWtWdQKbH7QgAFyiqO5r/b6tOP32uEN+uHAatlUb0ao3ZXnR
FZZWkZ4QdX+kxb1RRyLc6+KMIl/XwIdVkgXthRHjhKGT5UQOArj7LrxYQgPaUrqK
yFp9ahclAinfGsbPEHbIyxmDTy20SxQbfM9l9Bq/+Tb3NzXfhs5tTnFKx1SImXDY
0fEWZWLiV/uOzwVaAZZ80LRJd2T4VpYGdbX3m06GksmuZRfN74ART7F+dDegECXf
Eug96QB2gNLJKaxwP1eBnlLnEobsmAfIKpo4DMcdKD8kcdMQu6TAJSbIl4vT/f19
n0+er/TSPBmVO8c8FlnT2EXmrYvM2uy4BJiE7TdqU7SauexrUxErR5O2mt3Etofb
9aIq3aApVEG1SyU7/Q1HznCJREGv1kB711bgJxE32ZbgpqxdJF7tuTxWX7aV48Os
2HAO4tVeXZWJ5EiciF0v54QrH0TtsLhtbwb6GyIxJvjOLERDffzvKAwKgGXL+1XU
Ym4+vPB4bGYtfzASLHrJgMFSTVrHBlrS2v4ZOe5zcBgcBUJk48I=
=+3Hv
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--
