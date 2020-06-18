Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F88F1FEFEB
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jun 2020 12:50:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728215AbgFRKuN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Jun 2020 06:50:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726899AbgFRKuM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Jun 2020 06:50:12 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B90A2C06174E;
        Thu, 18 Jun 2020 03:50:11 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id e1so5553808wrt.5;
        Thu, 18 Jun 2020 03:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rq2vtUmYaxK4oFT2JMWTlMByzPndGv5xo1xhKDsPblM=;
        b=tIRU1k1mmbprjFBezRoJ/fRf6b4ii5Zvlsnfw1NYXXMVmQm4MXjoPLMQkSy9D1oWyU
         COnpdWBxiA1BzcutzGTvVRN1Tz4Izy1pmKsev0pIwbF81DXfrGYLiZvlBOU8uS/1SBdK
         wIdX/dgFCGW3al6nLuoYKTb8Qa/tH8GOYUXw945nfC7HvJEeHrU9H+3kfzuaV5SbJ6kq
         NhZBOvH97jHYsQ3QVAwHyZz1RK52KR1+JgbYMA5qZ4i/w3fuyC+bIlftZl8ag6eJM2dk
         X2d9D0A+v12N6ssf1BRC6dVsIekuehm0ncNsKB5A5BakdVfpqudtRYBmB5abLqdnYzX1
         t2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rq2vtUmYaxK4oFT2JMWTlMByzPndGv5xo1xhKDsPblM=;
        b=SBJEZZnvCxNnlWkhtUNSLIZUKa6MJIUUAk0n485OYAt+lo+EJ8X/y5k85Iojns4NHl
         efXxf/5DaGTZXBiJfsHF1tKa5eFnFv672XhMBtFugd2Bf6lSnEMXFsC5v/I96avNYKWa
         8m0rmsSv3TmOmOzxIL+wbGCPRjG0ti5BUlMVwE2+VH2cnqgZOxZHze25Sg9U8CqzHzNT
         fslekuPy/PDTMedo/hYTJgTo1BgXu4hdF4+GgK1U2n1Z8yaUo+Qi2QH6KD9XmwF88aKZ
         GZKOnRn9IQ/7qZ9Z6p/1VMKQGA0hFGQSayDUJKlUtnzaHgnmPg81jv/r03OtScQpZK7n
         fWcA==
X-Gm-Message-State: AOAM532PC5FOXWPZcYiVrEEG10IpxGjlPeOmNPbH4qNI5Ns87jB1JM6q
        szlz1NMK42WzsjeDpQz+Ylg=
X-Google-Smtp-Source: ABdhPJzn6TiRD5IAKs0XCAIfaFPig7mPGXaimtb/vQ+Sfv8NqJIzzX/LezQJNXioqTqXrux5wOb1qA==
X-Received: by 2002:adf:df91:: with SMTP id z17mr3835800wrl.273.1592477410465;
        Thu, 18 Jun 2020 03:50:10 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id o10sm3073553wrj.37.2020.06.18.03.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 03:50:09 -0700 (PDT)
Date:   Thu, 18 Jun 2020 12:50:07 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Sowjanya Komatineni <skomatineni@nvidia.com>, jonathanh@nvidia.com,
        frankc@nvidia.com, hverkuil@xs4all.nl, sakari.ailus@iki.fi,
        helen.koike@collabora.com, digetx@gmail.com, sboyd@kernel.org,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [RFC PATCH v1 10/18] dt-bindings: tegra: Document VI and CSI
 port nodes
Message-ID: <20200618105007.GA3663225@ulmo>
References: <1591768960-31648-1-git-send-email-skomatineni@nvidia.com>
 <1591768960-31648-11-git-send-email-skomatineni@nvidia.com>
 <20200617221411.GB2923473@bogus>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Content-Disposition: inline
In-Reply-To: <20200617221411.GB2923473@bogus>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2020 at 04:14:11PM -0600, Rob Herring wrote:
> On Tue, Jun 09, 2020 at 11:02:32PM -0700, Sowjanya Komatineni wrote:
> > This patch documents Tegra VI and CSI port and endpoint nodes along
> > with the other required properties.
> >=20
> > Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> > ---
> >  .../display/tegra/nvidia,tegra20-host1x.txt        | 87 ++++++++++++++=
++++++++
> >  1 file changed, 87 insertions(+)
>=20
> This is getting converted to schema by Thierry.

Yeah, once this has settled it probably makes sense for me to pick this
up into the json-schema series on top of the initial conversion.

Thierry

--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7rRt0ACgkQ3SOs138+
s6GjeQ//V5z5HHU3AGAEhkRvK5MxJwjbKjLteO/qr7SoHUcB0259EJUCo+M/Sj9r
fhPbTuepd7NldeZBKTTHO+nwYVsl09ztvRAEdHHOZ9Nir6xToHYmr8i9t8bJH0Da
Z1zueXUCBK+XWvodw0qzW6vLAZKAPgXk9ZyWXE2QcdiKTi/nq//ND3Wl2m1f8qdc
IeoReqDLMJZEkig5HdDjkDcX0DnYhWaiN6TlYTN0gFt0P9n/3vrys6A3UnKQHcAt
/vKgw5YKUfk4MHhKVZqWAeOVhRHxpef+2Q5atXqxWCwAQtcbrANXKA2UQMZ/fiux
7xs8MhOOhkfVrH67N8qU/qzS00k8V+5CW1XVBfMQs2qfwRFSXlpBj5ONXPWLzbKs
5/LXp/y+A+L0U7SykbfD8lT6SsCxabI5jF6jF/zlExc4gpqlL0gjVEaNpMcFje1/
40ZwDxxQZHtSamkuOET5flEgDbe/uTc07Susmee5tBP3I91C7zikZZJvvKJ6sZnO
HuQ3Yq67LFLl/q+pjyHPXoxx7+OsY1Z7Zm/3WWjfnprR+Y2IjUJ70nqxvlx/FZ03
HrTf1iReuKRJMB1uDJT9YHxkAELACQql2hxCs1pa+X3GV/G5C0sMxN4rmmZQeQnm
dzqM9ZVaXqmHopcGVfsAXF3/nyLKVPYVTdjngoP1fxcIqv9rEV4=
=gbuv
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--
