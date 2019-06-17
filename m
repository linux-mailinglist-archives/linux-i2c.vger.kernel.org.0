Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC5C547A5F
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2019 09:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725884AbfFQHDE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Jun 2019 03:03:04 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39617 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725778AbfFQHDE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Jun 2019 03:03:04 -0400
Received: by mail-wr1-f66.google.com with SMTP id x4so8623488wrt.6;
        Mon, 17 Jun 2019 00:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/08HwRtUcVTCzzmcyja5YEJAa6PYX9c/fcHk5cauzEs=;
        b=AZPXeGocFtVVQLMDMFslcEC3HVlPvFemb5OqXKG7ZIg4n+pbpCJnkO961xgpDcYQPm
         cFb6f3hez8xTq+TM1if6wSLwLbk1etPOe7UzuR4wpybL79Vt11OUmWNKqxD47KMYQow4
         GJLPPv0UdhVNpokceFvnLywP9M6zr0HS8TXXYYiLexpmRukNqDQn0b21IFpQE+XB+loS
         mKBVlOtoXswCSn2STk69R1tmNmoV87qEzJG35ECfIm/qsGzpBnEbTbyXg87sMm50Co5R
         ZlgY2FKHrXBqmzArgsRJo975oanfKdxv9Ou5T8UsYUR+LIGLnAW6B1mOISnlglDAsxnr
         2Zmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/08HwRtUcVTCzzmcyja5YEJAa6PYX9c/fcHk5cauzEs=;
        b=jm/vzn94bNvUEEO1EvpWBDaB1FWQhOQ9T1SPMO7ot2J8H0qVYtio82hPJXmapu6FUm
         wzpnSM16L3GhhDIr4SrYj/FSSjvZzFqhK6AzI8NmwQhvTi43fOfx5ALe3/D7CGBEJSme
         l46DIDAI8aTOfmlqHYIdyCt9IqZck/EuaGSGaOGahPIGUmN8eYAEWYtzRCthiOMrMAfZ
         gu4pUqUrBjA9bO/trfpe7ob+J39o+QrEVWJSU2Pdw/d3lz+kh0xoMOj5jWGNOBNy0km5
         gkDhpHDSsHZMyY1u/zR63lCjpH/H7IUeO8ITtW6hic+gz3DhVJ2pObGF5fOTHmPsv8cr
         EHRQ==
X-Gm-Message-State: APjAAAVF1AwNkJlMsE1vJt0e0mk8Y7zJ3PpMzwiBazGJuABCG0g+wKCz
        lbw+otE01C4Gcf76e6bqk433s+vh
X-Google-Smtp-Source: APXvYqxQxEIx1A1i1Eb+vnIYA8kD+8BAyGsi5bezbQLe9fLx2miKdyg3y0PvQ1hQLGhjHz2AYSkBlA==
X-Received: by 2002:a5d:46ce:: with SMTP id g14mr17948518wrs.203.1560754981966;
        Mon, 17 Jun 2019 00:03:01 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id h90sm23765954wrh.15.2019.06.17.00.03.00
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 00:03:01 -0700 (PDT)
Date:   Mon, 17 Jun 2019 09:02:59 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Bitan Biswas <bbiswas@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
Subject: Re: [PATCH V3] i2c: busses: tegra: Add suspend-resume support
Message-ID: <20190617070259.GA30126@ulmo>
References: <1559885867-10190-1-git-send-email-bbiswas@nvidia.com>
 <20190614211129.GG17899@ninjato>
 <758d6dc2-f044-6be3-6896-196ef477d393@nvidia.com>
 <20190615045405.GA1023@kunai>
 <69a9a7e3-f885-b6ab-60bb-a1165ce2db23@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="HlL+5n6rz5pIUxbD"
Content-Disposition: inline
In-Reply-To: <69a9a7e3-f885-b6ab-60bb-a1165ce2db23@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 16, 2019 at 04:56:06PM +0300, Dmitry Osipenko wrote:
> 15.06.2019 7:54, Wolfram Sang =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >=20
> >>> Without a maintainer ack, this is an exception this time. Should we a=
dd
> >>> Dmitry as another maintainer or reviewer at least?
> >>>
> >> I shall followup with Maintainer for ACK in future I2C tegra patches.
> >=20
> > This comment was not directed at you, sorry if that was not clear. It
> > was more for Laxman, Thierry, Jonathan, and Dmitry (if he is
> > interested).
> >=20
>=20
> I don't mind at all to review and test patches for the driver and can pro=
pose myself
> as a reviewer if that helps and if there are no objections from the Tegra=
 maintainers.
> My primary interest is to have my devices working after next kernel updat=
e, but I also
> like to review patches in general if they are touching area that I'm fami=
liar with.

No objection from me.

Thierry

--HlL+5n6rz5pIUxbD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0HOyAACgkQ3SOs138+
s6FunA/9FnsBC0lgpKTkMD4x/XSYqwhavvrILocW3n6+bcJ2oQonGzaHr3+QJzHQ
9Eipq1rP5XmUzm/OvCyUXWV+jXBuVmgUOt/duHJSC7rRs6YYQuhGYpF5+HWPAoQG
dKiUX4/x/ziFiSorakCNQtTK/nufWC2Oe4k8qc5Gh2G8GRFwqij2DVRmCvElP4qm
Cnf8J6K6gfwuTNX6KAcK0sfbDycBsu6VKa/9A72O8rf47JPCVYPR/8PpvftKzWZ+
CcHHggTE2KfexaydT9VsC2PGniYwkcKp7CyS7YWQ/IPUuaVztydbJCdpmHgsd7yC
kNWYdGUl9TeD0SyzK8vPRMmBiWZ9EqNE621iqg7gS2A3V4oru+NFWvlFsVDzLVs+
SLFberGcdx6lgXDFLK5IMrTlpszfSG8Bwsc78ub2d9D+UU7tmsMXyxMqCbi+bCbu
HbyqnLCivgz8t4lujcBggGWGzn4w+Rx0OafqSm/NhjmQfiBsQ5yc1n/zuEEMT/cO
AkPxOLERNhHUanYwhz4bmErkmbdiKGZAz38I1nYnFzvNxRq77rfjMNgZg7e50wr6
pK5LmpXZ14X4y4Fv1kD5y/CJh97dfrUqIAWiC8Az9N9zJ1mdEwjp7f41U44MA1+e
mZd2Qf3kF1icB8X4lsgW47ObG7YAMK0oXxBdcV5d9RLYtwSoWks=
=+FPI
-----END PGP SIGNATURE-----

--HlL+5n6rz5pIUxbD--
