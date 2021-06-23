Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CFA53B1C0F
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Jun 2021 16:08:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231215AbhFWOKf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Jun 2021 10:10:35 -0400
Received: from www.zeus03.de ([194.117.254.33]:51866 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231269AbhFWOK1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 23 Jun 2021 10:10:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=Mj7EQ7nV6Jff7yb7wTLlSMV9KN4G
        GlxCKUMrrU/WKG0=; b=ocAEe0L4rkKg1d6QWI1gro1X1R2AKa+p4y272Tb1UVP9
        rGpOJ3/nYsIJC1LFxXspuOzc0HRIGeLp90Lm3EI/F/p+vjrIP/foSuV0KTZ09fH0
        qNaDAIJz29s7VrZEBTTXzPkFC7L+nNqkryZIc1FvayFL7Hnu7rT62YeZ38mZDT4=
Received: (qmail 2630227 invoked from network); 23 Jun 2021 16:08:08 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Jun 2021 16:08:08 +0200
X-UD-Smtp-Session: l3s3148p1@Xfieb2/FVMUgAwDPXwWqAK4jk/jYs7Oa
Date:   Wed, 23 Jun 2021 16:08:08 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 5/7] i2c: rcar: : use proper DMAENGINE API for termination
Message-ID: <YNNASBSYBu5lisae@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210623095942.3325-1-wsa+renesas@sang-engineering.com>
 <20210623095942.3325-6-wsa+renesas@sang-engineering.com>
 <CAMuHMdVQ-XFy6fP_g70N8ukNPFj20ds-iEDF58Ocnpg7e5wLsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Z0m2yZezuwqrXzq0"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVQ-XFy6fP_g70N8ukNPFj20ds-iEDF58Ocnpg7e5wLsQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Z0m2yZezuwqrXzq0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Is this safe? The driver is not using a threaded irq, and DMA termination
> may be called from the interrupt handler.

You are right, this will not work. Not my best day today, I overlooked
it for i2c-rcar and lost the note pointing out the same issue for
stm32f7 :(

> Have you tried triggering DMA termination, with lockdep enabled?

Nope. As the code didn't show signs of async nature, I assumed sync was
desired anyhow.


--Z0m2yZezuwqrXzq0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDTQEgACgkQFA3kzBSg
Kba2eQ/+PTvyfQg4n/PazU8mc7PeuEydjDsjlvyoZeRijo5PCY1/JU5x2WnfDA/K
PRIUd/IqAmJuvB+38UY9TgqWmRheri6XfyYhqbLE9Yt6MjMjFYhKKce/9PAr04nS
5j2/CqpCoU0aWC1CNBdJNXDFGV3vFReq+ej9zexu01LRyR5oWu5etce2iux2U/pn
FJ7FB2tABa80dRUxETG7vSCAxJla0L8efirY1dlFbFH0mZeN/tiG1apEXYjJhD5A
ds9M4DkKcYhc2JIK2MCEgb0RDYdxcv1x7ff+Eud9cAfL28SnQUUFmGTvUXQBRCQr
OyRBctpCvDRDu3jKKcW/J0wK3sn9FJKyws0HoH2/L1k7KjK66PF34Upqd/VCmt0r
fMSbT9XwZCbQorwkolfW60JmfaIIaNEnwcYLjJd99ElpgYnqahmYlPUgVCC+ByzH
oSXLiSO2purA2ZerMj7wNyMpkf99U3pERaJvs5imoGgWepicyKrY/OIJ4kFDKZVK
XICVU4I4xXevkcQyaS90kgCyiM7k31K3FORtCoMnoRqRUlaltdNu+46tLwTrZRte
eHRNya3znaxWNIYy15v5ddatwcQnyRImJZzhI7BMhQr3A5JaCMcv8FEH86M3CZZg
FxKuKiqwejA9Vj+EvWp34mTnqify/ZZQ0/Z3NZXnj0FeX57Ek6o=
=lvkI
-----END PGP SIGNATURE-----

--Z0m2yZezuwqrXzq0--
