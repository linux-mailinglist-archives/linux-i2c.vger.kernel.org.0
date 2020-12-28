Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA87C2E6939
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Dec 2020 17:47:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728481AbgL1QrM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Dec 2020 11:47:12 -0500
Received: from www.zeus03.de ([194.117.254.33]:41050 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728627AbgL1Mzt (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 28 Dec 2020 07:55:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=cUkCmu3K5ZBrw9JS/0zXOSslVzo2
        IcTlMaVAEVlMv64=; b=aitghaC+Sz/FmOJ0sA4ASt9o7xQl/IOD8f4yhEZR1U97
        C9uxXbMnlsLRkl3Mjwv3G1y1JHP78x2Z3HSb+W8/XnhXGQ9nWnd2Xh4OYCUfG89k
        PrkL4sTG3QMMLGBu7oJ8orBL2RwYInP+Tw8UVcDSrQO01cYwDlyaYW5MelH7W60=
Received: (qmail 1758329 invoked from network); 28 Dec 2020 13:55:07 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Dec 2020 13:55:07 +0100
X-UD-Smtp-Session: l3s3148p1@ZiKZyIW37pUgAwDPXwIpAOUwDQytQs2L
Date:   Mon, 28 Dec 2020 13:55:07 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 2/4] i2c: rcar: optimize cacheline to minimize HW race
 condition
Message-ID: <20201228125507.GD10822@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <20201223172154.34462-1-wsa+renesas@sang-engineering.com>
 <20201223172154.34462-3-wsa+renesas@sang-engineering.com>
 <CAMuHMdV7i28HjfLbrzrJaJw6hB51u=kgmqqYmK_zBETFXumCUg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Qrgsu6vtpU/OV/zm"
Content-Disposition: inline
In-Reply-To: <CAMuHMdV7i28HjfLbrzrJaJw6hB51u=kgmqqYmK_zBETFXumCUg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Qrgsu6vtpU/OV/zm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> But if this really can make a difference, IMHO it is still broken

It *is* broken on Gen2, no way around that. We can only minimze the race
best as we can.


--Qrgsu6vtpU/OV/zm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/p1asACgkQFA3kzBSg
KbbO4A/+J70Auekngjemk5Awmyr634n5FxmgB6LEvBjf7L4+lGD7fj3fKbEWFe9k
QET6JThjcNlnVwQHGIpZevXuCyv8cXqKKFIt+S3Hm3nRFWaK+qjZvlVRSAgs5ueN
ERXHltsjWPM2HVgxGS+d2WoG7Y6/CyCFE8PmgeIJE6i32jGLUgZckOWZjWLYbpUc
elSKxAHBv9gXWAOO3f69zvgAjOrB8VhLS12hM/0SpjsTxJYGVqIREu/mPgWpIEv3
8SWlwcQC/pk/Kq0zSsGHFOvBp3zwhQgc2pe/WAGnO87KFtZk9/6Ev/sTv424zijS
EVMTNa6o07mr/izhAPt8Zdvf+S0d8Bt6xu51Ufd7xEvMxvCZqWPuICPWg8rNCW+G
zC2iiliTi/9CV5xr6ONyFmBTa2FSWVpfxGmal+SalTvOAJrwrIham2iua62PMc3i
1R0O6lMK0OQ10dB/9kGbIR6KrlnGwxTy/b5u83+RBkUv2iOAeNYb4m24IL+MhTWM
edXeMWl7OUYWqpaOn32djrGzAeQkrgNOGTqofmpopp3s0FMTY4MYvcqKOKp0HVp6
jDBvs1BCqgwqMFr1KcESen1vM5YGnj2ndJ+Gphi7cjSo+wuZ0nOkpOLHXkvOVaZX
C6ZvHLR6hKqhyKcpNcqVktOKYRYRUxVPK/94m4oq2xWSdeLYBME=
=7sFN
-----END PGP SIGNATURE-----

--Qrgsu6vtpU/OV/zm--
