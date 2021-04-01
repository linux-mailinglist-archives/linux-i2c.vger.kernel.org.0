Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA5F535143E
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Apr 2021 13:11:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234081AbhDALLQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Apr 2021 07:11:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234035AbhDALLL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 1 Apr 2021 07:11:11 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA08DC061797;
        Thu,  1 Apr 2021 04:11:10 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id b16so1491642eds.7;
        Thu, 01 Apr 2021 04:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=s2HcVSCCLJRWL3IhED4YLi8u+pfQMoybfhbgzWH6HrA=;
        b=ljQI1XsW+DquJSGEy0G7DK4/p6OaZwF181DDDMWlkdjbRwtvUBa0K/TT/MK1Qy9bES
         l93FC7pgMId+NgeRUCyBeHpE0oIeJN/2dSOZ1AbXjJTHF5zIrOtu/l7GuH30cjT25xJI
         3JqeUVr1T1DeZIGhbm0zZ4KXuxBZPLIN4X07iDg00yGb73xcy7Z17OeAHXceAOk0nB0Z
         UZnGlksE2tYeUpCQAcV+Dd2P2eH/bTA87ZusI7WQ4vtF6/g4e5TgYE0sqstUM68KnrGI
         jH6JvMCb+OpojpRxyXNISem8QmO3K39UGCLyEsVaTBp36jnXBYnkxcnefUniggq0aKR8
         Kphw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=s2HcVSCCLJRWL3IhED4YLi8u+pfQMoybfhbgzWH6HrA=;
        b=ZwicFt4vfORUAtrP54UmiUgCXWrK4zN9GzyXof9AvlQKnEaXDmULPgpGaSIm9/C9b2
         L38E1LPmTucglRk4TtsLZbw/p+VftqQ1b3DjUmAte97AM3c0NcQR65+zOmhqg7Ug4LV5
         hm6mTVl3H6iwDt9PobDp5K+vKJHM4kNaRZmZh8EThz/0u76csKJn2poOn1IImFXhNaUs
         xmuOlUkyCnor7IokDGgT1Hz+awFXtdO1gCO/9l6v7NwyHidIfeeAEmFunHE/CeaiCnYk
         vuFnk7QxdRNxiknkH5JVhKSRV6AXVawOUPiOam2dI9rE5mzrVxz6EWdWsvSejwmLqgeT
         ZaTA==
X-Gm-Message-State: AOAM533Fps+e+WqhISghAze+ufP9rERR3fw3IHwdGKeU/JdPsXhPK9xV
        KDnx8x60bFRr92/z1Su8JDUHZBlbD4Q=
X-Google-Smtp-Source: ABdhPJytPMshfe7m91EyPFJIynR8WWxD4OQSsiN4bJZBRzrMNzbdF3ZrppfRAh72Ru/RhRB+QsMKaw==
X-Received: by 2002:a50:e882:: with SMTP id f2mr9340058edn.184.1617275469324;
        Thu, 01 Apr 2021 04:11:09 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id ak20sm2581050ejc.72.2021.04.01.04.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 04:11:08 -0700 (PDT)
Date:   Thu, 1 Apr 2021 13:11:36 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT 2/2] i2c: tegra-bpmp: make some functions void
Message-ID: <YGWqaOynDZvQ4q5u@orome.fritz.box>
References: <20210331075141.22227-1-wsa@kernel.org>
 <20210331075141.22227-3-wsa@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Tz59CajpPpnP8faV"
Content-Disposition: inline
In-Reply-To: <20210331075141.22227-3-wsa@kernel.org>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Tz59CajpPpnP8faV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 31, 2021 at 09:51:41AM +0200, Wolfram Sang wrote:
> They return 0 always, so save some lines and code.
>=20
> Signed-off-by: Wolfram Sang <wsa@kernel.org>
> ---
>  drivers/i2c/busses/i2c-tegra-bpmp.c | 20 ++++----------------
>  1 file changed, 4 insertions(+), 16 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--Tz59CajpPpnP8faV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBlqmcACgkQ3SOs138+
s6GObA//fgBvfAUilYNrbW31wPJOnNX0fX7Jt2XqeS27SJBuSnQ4lyeQ9GLg8DRs
TJWuoHW/8fLZyEvy8CTM5foyotJg/hj2ygzZNZE9c3khIjIkfZCZsJhoDJ+z+fcX
arvJ7sefXjVRgBUo5RwQ2bizG9mVeF6OsEWrC/OjGe+NLza8lYOYFv5/BoqtB5qa
9SI2XSCATBWDWGcc5bjivbJ4UIE45cW8YK+LOFupy3IYAwRDlFqCw4Uw4tqa6zKT
MIRDv/6VFbTOBAHOuRtCrsPiACovbep3bz5ryQ86PBakYzMIDNQd9UAMLSpZUUnW
TCcH3u8GqtfsPlnbFr6774/B7klc+AoyHZTSXe+g+VDTRDuE5RiJhpPNYQp9p6QU
OKAx+uzLyZkhjQTbhn3zAPuwTnqJOzGqlSB5jy4vx7cHepVf4LAOxJhnl3TGh5xL
R5ImO+uZ3V9ETHFICtCrZchcddqXEhAWLjo0asGfDzuIgq5aNtd+3cCnP5Dbx2LQ
h7X516FbAItFGtn3uRS2monwcvKeiK8c0sgocqHHRXViZP24ekXtgKZNX3dZQkzd
M3q6cL1uX9KDBgSoYdZpEYLBWpkrFTU3zEwxZYliJE7XgaOEghDrmg4EwgKQOOUl
YVUTgEG4Lr7RKuQDLOnv0ov1Z3+sC7ox4luJLW9ITJ0ZiAgv4h0=
=Q+Bx
-----END PGP SIGNATURE-----

--Tz59CajpPpnP8faV--
