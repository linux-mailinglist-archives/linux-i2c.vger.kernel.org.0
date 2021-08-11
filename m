Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 119183E927D
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Aug 2021 15:24:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231443AbhHKNYw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Aug 2021 09:24:52 -0400
Received: from www.zeus03.de ([194.117.254.33]:36450 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231314AbhHKNYv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 11 Aug 2021 09:24:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=Ob18HouyjEG4yKGxnXe8mW2b9Ubs
        QmEYQVddNMLg/Tc=; b=vE/Z4umeG8rqyiGlUVPlQGI7s+tAEkpPvEkpLJWYZkyt
        dE3xHhJx2hi4NM801MAB07HUZ1Ug7h99ZHF2ra3Wmz2nTejsN3S2bOTzvHlByk5e
        sKD6KoZLVxKpYVcMOqWM40aOkRiHSfVyiM/deFkoqiJI1IKP6KGV3LlW5n4+oEU=
Received: (qmail 2664356 invoked from network); 11 Aug 2021 15:24:24 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Aug 2021 15:24:24 +0200
X-UD-Smtp-Session: l3s3148p1@Vm5ziUjJ8J0gARa4RTP4AfHKOCm/nqrR
Date:   Wed, 11 Aug 2021 15:24:23 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] i2c: at91-master: : use proper DMAENGINE API for
 termination
Message-ID: <YRPPh6ucRfL/gGZG@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20210623095942.3325-1-wsa+renesas@sang-engineering.com>
 <20210623095942.3325-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="QdmGwop7VZKZW5o7"
Content-Disposition: inline
In-Reply-To: <20210623095942.3325-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--QdmGwop7VZKZW5o7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 23, 2021 at 11:59:35AM +0200, Wolfram Sang wrote:
> dmaengine_terminate_all() is deprecated in favor of explicitly saying if
> it should be sync or async. Here, we want dmaengine_terminate_sync()
> because there is no other synchronization code in the driver to handle
> an async case.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--QdmGwop7VZKZW5o7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmETz4MACgkQFA3kzBSg
KbYuUA/+I2bdHPXgGVSkfL9GsxgoG+ReEDCPFZuA6jN4kagY1rmXHVSlSeIMlKyR
r0x8l4FGpcQiG4gc3KoU1K60t5tTk3AmR8/sFoEwLRD3vZ+XO3SRMLafzPOsUqJ9
0RrxkH2tRRWGfs6VZdmeD5LzG952rpyRB3DT/rGOahoQkXeVax7hgJQdO9rKfo4E
Rcl4TBgao4gKooGRZfGPeU9SFZ6DrAS/TK5aEm4eg1vREH6Vw/rXgwJm0L9/5awI
3bKtbHogDRaqcsm0snS/cpgJ6KoRUMRlsbvx9RM4lENjQOloG6RHFvtTBfOW9+A2
RetOLeiWe3EHJzA1xqjTx8PtxRU15DUJpK0dZuk6g0YaJZsNoTXb2WFglcjkHgTm
bnDrZk/r7RTt8NUwPQZUyXarduR7VV3CfrnVvb1POkSBBBqDAfAtUik/L+RJoc7j
I0TgMzQWvZL+HoG3xnaoCYEoDgEemzi8n6+4Ls5Yj+SjEoQYS1gWfefpoFGJcpIR
hS2FNzMgZilMcPD9BbtRczqUgBq3Ry+fB7GSJTwNYRkQckMw4FV7OSRMSmuLpXcj
ox0Z8P3q3rsH9bodav+ljf0mJUQdN3O6LodU+WZuI52wIsIwQ31cG+HvTnbb/56d
/6BWmVSo1UiVmcOtSDbDXcjWGc0lwAR4j1OYQXKwQlxTY7nmzlE=
=tkps
-----END PGP SIGNATURE-----

--QdmGwop7VZKZW5o7--
