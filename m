Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A46393B1BF4
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Jun 2021 16:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230326AbhFWOGX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Jun 2021 10:06:23 -0400
Received: from www.zeus03.de ([194.117.254.33]:50954 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230306AbhFWOGX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 23 Jun 2021 10:06:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=5Hz0NBW+dm9DpC3tg2xUSrZvo02x
        pLXSDQ9mKWvGrZo=; b=a6nXb2FF57WWdN3KkRmaItssShKrVhGSiOUgJWDdzz6Z
        8SHdsvJ6rzucr3NnxXaon6EMCxloUccpk3EPZ8FZM223BlageQ/l3j22cMtfDGfl
        LDuDMfsfFiR9Bol7p1MaFvD+apa+YzC4dKwVEPvlnPlYTuwfGM3u3TydGRjmRhY=
Received: (qmail 2628777 invoked from network); 23 Jun 2021 16:04:03 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Jun 2021 16:04:03 +0200
X-UD-Smtp-Session: l3s3148p1@0guzYG/FUsUgAwDPXwWqAK4jk/jYs7Oa
Date:   Wed, 23 Jun 2021 16:03:57 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] i2c: stm32f7: : use proper DMAENGINE API for
 termination
Message-ID: <YNM/TZMWwCLGSEJO@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210623095942.3325-1-wsa+renesas@sang-engineering.com>
 <20210623095942.3325-8-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1fTcwnSHuuE3QDd/"
Content-Disposition: inline
In-Reply-To: <20210623095942.3325-8-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--1fTcwnSHuuE3QDd/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 23, 2021 at 11:59:41AM +0200, Wolfram Sang wrote:
> dmaengine_terminate_all() is deprecated in favor of explicitly saying if
> it should be sync or async. Here, we want dmaengine_terminate_sync()
> because there is no other synchronization code in the driver to handle
> an async case.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Eeks, this is called from irq context as well. Broken patch :(


--1fTcwnSHuuE3QDd/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDTP0oACgkQFA3kzBSg
KbYBHQ/+IJf8b0KVc9LD1AjbSx3G6RbvdgxCXWltzxHXyso9+q5IVQ4IT+JLUNQj
RZWpX8WMrnxCyAG6soDPaScazxJz0WowMManZgOUTjhj59pRl8dnBGy/n/Diws2N
FajIRvjSf0pBF9SlSvGYzrbX1+rd+lUi73JKzH3f5gJKu7Pl3kkXILijIPDUp2zI
64zXApYYlJsJgGJmNEOq4YYoqYPVvQZ8PayjSgEoQXX77ebW45hqc+o3RHUeTu0P
dx5irTMfEw6Brk35lPfkmsTxDf6/mHvzU0B4PAxl5FGWsKdj/9dRGtfqEpN6WJyp
zpzelpZZr9o0l4kieCCgAxeea2qYqcX0OvRn3q51DjL5FTBy8u3p/siL1wVLluKT
Tf5RjgIKR02Hg8+noq1AKConkhynExZLjBCyS99Ct3F0bQqagI6HvxKl2azkWlcC
ETwznqWrENqwvkh4Mwmt5tu5ifRtw6D5iWJSYZbNgSls/0eiww04cuH+5yQf9zUF
++Pp2ltIuoYN+yxWKcSi34pFMeDpFoZAACJ17cKWz3TNM9aufhhgh9zsOKWwM9Bd
cMT854BLnaXbc6jSZfuAh/b6ol2oWsF4O50EsJKVbZuGmD2YZ6HqWZBMEOb8vuVO
xyRAfKXxXDVjqNAdKv5uHSHwE2GGCOxPN05gyQVn2MSUYesejDg=
=FXBJ
-----END PGP SIGNATURE-----

--1fTcwnSHuuE3QDd/--
