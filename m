Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF80E1BE3B0
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Apr 2020 18:24:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbgD2QYk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Apr 2020 12:24:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726423AbgD2QYj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Apr 2020 12:24:39 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DB53C03C1AD;
        Wed, 29 Apr 2020 09:24:38 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id k13so3282961wrw.7;
        Wed, 29 Apr 2020 09:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xtwaBYRgwWpI7ZDRylIlgWfe63HqeV3mVKtAgz5zQUI=;
        b=f+GPGedjvZ67SC2kBeOC33muN3L5DLwHO6Qp/YkIfruOG1GIAK5yn82DX0jjpB1u7J
         zHPrHe2gn6dOqQ1XoePCOLtQ6CdPYVMByl1uCidzlHIx/RjOEsOZZTMBhQ4whw/sARtG
         fcFKDXKUk+zbSCPc/hp8ByeGsh4Hj0tYuoKLwyKwPMJdWC742J0JuGDjh1vCD9Y1ZBeo
         Q6Ng9azPkSWx42/YkvAHXggNTALttpetWmyJCYWH80HnB1QfD6ueeThCqfJ6/EJ9GgDd
         UtuNfxQac0lvw2Wr7YY7hMceS5QzD3e5Px+9TwYxfiPQQGTMKIZw9qwBH7/atEDx567k
         d+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xtwaBYRgwWpI7ZDRylIlgWfe63HqeV3mVKtAgz5zQUI=;
        b=gZEXVuhQdZqfx8NbHbBxQftoXO2BbC/tQ3EbAfK39ZSddabF4JbGUUqVnGumH1YnhG
         GDku2Pk8uK3RCvUEWdr5c1QrpopsjOaJGVMhoqhV1w2ZN1Q+5GQ6et6grCw6uvurHCR9
         bpl1Pe6kaTJr6Ao+wUhYuZDuhSQ7td5iB7sg2n8EZTPI4xA014qLahMYoycI0JHTXaHE
         RyJXU2IdIth0yERrJrenV1Zj6Mr6mTlzPHxzKkn0hRWF1jiZf4DEvhai9mRcsOOrkEW0
         0tkwdH0oU0Cu+UJ0uKHpKUbG+CDFE40RPtjoQ+wmroYDI54yMKBfxwFO5KTFYdW4Q51u
         p4Uw==
X-Gm-Message-State: AGi0Puaqtdi7qyGqlLsoFwK7KMjIGtmZEw3r9G1z40d7QZ+SUng7z82s
        3qcSNl2CruVcBORZ40ymAPU=
X-Google-Smtp-Source: APiQypLiANjaASRaBnIdSvEstCEu4tal3I959T18Eu2PC65eya9WdX1b49T0uOHrvtYT1Ylw893QYg==
X-Received: by 2002:a5d:6850:: with SMTP id o16mr38929500wrw.309.1588177476826;
        Wed, 29 Apr 2020 09:24:36 -0700 (PDT)
Received: from localhost (p2E5BEDBA.dip0.t-ipconnect.de. [46.91.237.186])
        by smtp.gmail.com with ESMTPSA id s17sm8300441wmc.48.2020.04.29.09.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 09:24:35 -0700 (PDT)
Date:   Wed, 29 Apr 2020 18:24:34 +0200
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
Message-ID: <20200429162434.GA3157354@ulmo>
References: <c1190858-eaea-8e94-b4d1-1cf28076c330@gmail.com>
 <20200427110033.GC3464906@ulmo>
 <3a06811c-02dc-ce72-ebef-78c3fc3f4f7c@gmail.com>
 <20200427151234.GE3464906@ulmo>
 <1ab276cf-c2b0-e085-49d8-b8ce3dba8fbe@gmail.com>
 <20200429081448.GA2345465@ulmo>
 <20200429085502.GB2345465@ulmo>
 <9e36c4ec-ca02-bd15-d765-15635f09db4b@gmail.com>
 <7442f4cd-6406-41f6-5c9b-932bff8ad5b2@nvidia.com>
 <5863e364-480e-7839-c42b-73a7f6990a30@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Content-Disposition: inline
In-Reply-To: <5863e364-480e-7839-c42b-73a7f6990a30@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2020 at 05:46:46PM +0300, Dmitry Osipenko wrote:
> 29.04.2020 16:57, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >=20
> > On 29/04/2020 13:35, Dmitry Osipenko wrote:
> >> 29.04.2020 11:55, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >> ...
> >>>>> It's not "papering over an issue". The bug can't be fixed properly
> >>>>> without introducing I2C atomic transfers support for a late suspend
> >>>>> phase, I don't see any other solutions for now. Stable kernels do n=
ot
> >>>>> support atomic transfers at all, that proper solution won't be back=
portable.
> >>>>
> >>>> Hm... on a hunch I tried something and, lo and behold, it worked. I =
can
> >>>> get Cardhu to properly suspend/resume on top of v5.7-rc3 with the
> >>>> following sequence:
> >>>>
> >>>> 	revert 9f42de8d4ec2 i2c: tegra: Fix suspending in active runtime PM=
 state
> >>>> 	apply http://patchwork.ozlabs.org/project/linux-tegra/patch/2019121=
3134417.222720-1-thierry.reding@gmail.com/
> >>>>
> >>>> I also ran that through our test farm and I don't see any other issu=
es.
> >>>> At the time I was already skeptical about pm_runtime_force_suspend()=
 and
> >>>> pm_runtime_force_resume() and while I'm not fully certain why exactl=
y it
> >>>> doesn't work, the above on top of v5.7-rc3 seems like a good option.
> >>>>
> >>>> I'll try to do some digging if I can find out why exactly force susp=
end
> >>>> and resume doesn't work.
> >>>
> >>> Ah... so it looks like pm_runtime_force_resume() never actually does
> >>> anything in this case and then disable_depth remains at 1 and the fir=
st
> >>> tegra_i2c_xfer() will then fail to runtime resume the controller.
> >>
> >> That's the exactly expected behaviour of the RPM force suspend/resume.
> >> The only unexpected part for me is that the tegra_i2c_xfer() runtime
> >> resume then fails in the NOIRQ phase.
> >=20
> > From reading the changelog for commit 1e2ef05bb8cf ("PM: Limit race
> > conditions between runtime PM and system sleep (v2))", this is the
> > expected behaviour for runtime resume in the noirq phase.
>=20
> I'm curious whether there is a way to tell RPM that it's okay to do it
> for a particular device, like I2C that uses IRQ-safe RPM + doesn't have
> parent devices that need to be resumed.

Been there, done that:

	http://patchwork.ozlabs.org/project/linux-tegra/patch/20191128160314.23812=
49-2-thierry.reding@gmail.com/

Thierry

--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6pqj8ACgkQ3SOs138+
s6FufxAAljOq+NRIHB/PrCysp40r4qVToNmFmuf2zWVsbHpiIlzuZ+F7+QcgkgTt
Myj7pH0g9k+7Xo/Od6aHpoA3ZaYeP2TzpTWii79LwzphTMOa88bzggP0W6td7WO4
f1NINRTRi8VN6yC55OqJB+6Og/3IemmEENmCR0HuiRTBI9Di8rJD0sA1dKH81emy
pf0y/Sct2xkplpGoePczuhOgWZkikqubTRtFjcri7ISzANEMWUc3Sopb//UZ4C/t
tpgGUT4TDD1EwLlt4HEGKEKfVn++nmxp7MKcF2kK7g6AmryrxIACq6kcsZPWhjZZ
Zz/fxxrsyKucAWfOsr+cvCU97IP+xhFOQqb/q1yygmLu9hgtFBrgg8+N5+NCdVBN
lMJYDTsXTrLa/2Px0N51hK1uvlKFiBEll+Ae5COoDb8Qokbxzx0+7ArumgOM/Iq6
kAmvEFKoGNCUovcMzpNAEXU+nPst1rGlbJ0Nbl651mc7JWzKZrVaOU/G63ykm5TG
lwkRJ7UmLzc4V+NQsB4WXVZ3tvKPf3bjYTY9tbnKxvQ3RKwRPS7tZB5ZXAsfPH4v
UAvcuKezK0AjRBjm7R74zhpd+lbzzcRm5YofPkLsVefYri53c/HNOTiICxPZPzwl
HvfrJcVGjDt4r2nSd2qxO451DAU3EflwafxVvSetF51T5GBq8LQ=
=rzYl
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--
