Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8F3A1BA781
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Apr 2020 17:12:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727843AbgD0PMo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Apr 2020 11:12:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727098AbgD0PMo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Apr 2020 11:12:44 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49B3FC0610D5;
        Mon, 27 Apr 2020 08:12:44 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id 188so18604wmc.2;
        Mon, 27 Apr 2020 08:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xlPDq2Z7+duAXL81aiHn6DAJZ5ySakmXAZUCUWCDqfA=;
        b=RtoV92EjRriYb3tNoMTsPcffGxV+vSMUT5Q8i0M5KXp2qS5wa3L1beL+I1xNwcQx4O
         Fr/KaAJKsjVEhAPD3i+SnlCISTaG9ETnr+dC/KaS+65AMNQN3fa/8h6rIixe6iM6ojmL
         j/I97igvFSlysiDyFbaCpUAn27LQilsDcT0by9V5GV6v9Trrx7MfeFC74TwxYQRSRPWL
         KrrvG944IgPGGqg7H57yWxpgfbc94XaEcvb0dFNozcVIgdPDaI08IykCH8uyJVl+Brtn
         qzCuefq06yGMBpGNxRRh4KbS1Cazi0/7BR6cb3R05vY9XHADuOR5s/KRyPFN1yq3Ixtp
         nqZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xlPDq2Z7+duAXL81aiHn6DAJZ5ySakmXAZUCUWCDqfA=;
        b=XPf1L17/i9UKaWFgAinW5iW9AS5Em5wo24ulJDJs7WnGDKM22gyd05bmsOCd0wWxIU
         RxCrHlhUTVL1Xc8gcKOinDJ5tiwZLW7JtWYJ4sYGxb592olQy7zkxLeSZNVSmRh8CdFw
         XPNa7jeAHB1/S7cRCv7LLtCjKLWGp4Nnz72ao0Uz3D/0MHZp6JONExqUapUxhtpk32Xr
         hyyFVoCYWECkeGeRRzOH/Se7R+icozvEFOkDN0A2tKsaYnXpcizIoGQJ442sHhLl2xyd
         kAlP5HzIoKQuUJgIlQYqqL6Q637l+INMGw7gEz0SClILEOOVfA22IlbjPUGp2d29kPba
         gaoA==
X-Gm-Message-State: AGi0Pub1TVJMPXQpR+5ZXgl5Dz9+AlYmB9H9g1uK3cQ0/gTRUEK8FcEO
        bg0+Y9EyYJvY+kIN5dXBkBU=
X-Google-Smtp-Source: APiQypJlewgxnhPIQMsdhvzWnxDXU1udQ+3S/sAbRomiQX5SIFxsZHKumSqqwFBzMwXMKcnKtSzBpw==
X-Received: by 2002:a1c:cc1a:: with SMTP id h26mr15377wmb.127.1588000362049;
        Mon, 27 Apr 2020 08:12:42 -0700 (PDT)
Received: from localhost (p2E5BEDBA.dip0.t-ipconnect.de. [46.91.237.186])
        by smtp.gmail.com with ESMTPSA id e5sm21326955wru.92.2020.04.27.08.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 08:12:40 -0700 (PDT)
Date:   Mon, 27 Apr 2020 17:12:34 +0200
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
Message-ID: <20200427151234.GE3464906@ulmo>
References: <d2531fc1-b452-717d-af71-19497e14ef00@gmail.com>
 <a5198024-7273-74c4-b4f4-3a29d042bc36@nvidia.com>
 <f8fb1f7f-2497-033e-ff2c-c86c6caa9706@gmail.com>
 <fd1ca178-1ea3-851f-20a6-10bf00453ce3@nvidia.com>
 <a5734f19-254e-b6bc-e791-fa1ac63f11a4@gmail.com>
 <79f6560e-dbb5-0ae1-49f8-cf1cd95396ec@nvidia.com>
 <20200427074837.GC3451400@ulmo>
 <c1190858-eaea-8e94-b4d1-1cf28076c330@gmail.com>
 <20200427110033.GC3464906@ulmo>
 <3a06811c-02dc-ce72-ebef-78c3fc3f4f7c@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="0H629O+sVkh21xTi"
Content-Disposition: inline
In-Reply-To: <3a06811c-02dc-ce72-ebef-78c3fc3f4f7c@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--0H629O+sVkh21xTi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2020 at 05:21:30PM +0300, Dmitry Osipenko wrote:
> 27.04.2020 14:00, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
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
> > We're at -rc3 now and I haven't seen any promising progress in the last
> > week. All the while suspend/resume is now broken on at least one board
> > and that may end up hiding any other issues that could creep in in the
> > meantime.
> >=20
> > Furthermore we seem to have a preexisting issue that may very well
> > interfere with this patch, so I think the cautious thing is to revert
> > for now and then fix the original issue first. We can always come back
> > to this once everything is back to normal.
> >=20
> > Also, people are now looking at backporting this to v5.6. Unless we
> > revert this from v5.7 it may get picked up for backports to other
> > kernels and then I have to notify stable kernel maintainers that they
> > shouldn't and they have to back things out again. That's going to cause
> > a lot of wasted time for a lot of people.
> >=20
> > So, sorry, I disagree. I don't think we have "plenty of time".
>=20
> There is about a month now before the 5.7 release. It's a bit too early
> to start the panic, IMO :)

There's no panic. A patch got merged and it broken something, so we
revert it and try again. It's very much standard procedure.

> Jon already proposed a reasonable simple solution: to keep PCIe
> regulators always-ON. In a longer run we may want to have I2C atomic
> transfers supported for a late suspend phase.

That's not really a solution, though, is it? It's just papering over
an issue that this patch introduced or uncovered. I'm much more in
favour of fixing problems at the root rather than keep papering over
until we loose track of what the actual problems are.

Thierry

--0H629O+sVkh21xTi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6m9mAACgkQ3SOs138+
s6HIgg//dIcA5nNp3RiKQ/afAlJ0Toi2/WrRH1Ah/2Pv7hgQuedUn+bgV0dvNTiA
bsN20O6poktDDuCkGV6n2FXn0wCFMhpdcTA1IZIuLdxF+agwWfNh2bn7u8QzrVyV
sQA4s6BHU8/RiZy5eN7KgEm9M+sqV5EH/ZUnXrTRL7cXKlf41HWwat98jDKa0i5f
Yj3RmeFq7QkIiyI1l+nq0izY6MPF+Lzq7ixsM+KgaAEofedzCMcLfwgOrOZD4xiK
tXmDlHqEhEcQAvXm8Ow9Z0mYUulaWetN8vU6WyViZP8YklFnzKuxBJNe3XTyoinQ
3dB6a3WA/M8sH3S/dhSRT/PiMAKwpCJROzLfNC1pLZXvXOwyDsJVr95TjamIVSHu
P8tzWMrbkzGlCbpqDp08GrD1yxGsSQsY1msrinSoNvb+27xgdEh6SFdGVZlDFPG1
kgMUs0uWQ+SFTvDlCh7HJ3Lug0qnJQzGeRKWMcRvCzStQCIA02gdZS0FUbnIufty
WVRK2tLpkJrA87gg1HHzxT8uCrJfIlo4x3wCGYTapCRikW9TlqkkpuO4yHeiwC3L
8Q9X1xQ7xRcOz3j8KgQYP2sApp/8XyULG23ETN2Ple5wMGj54Ab07JGEd/B4fKPW
I0J0Xp6T+WdpcBoilfSENMHoCTqMQ/6YBjGp7vv5aMGw4Y8kHrw=
=pTlO
-----END PGP SIGNATURE-----

--0H629O+sVkh21xTi--
