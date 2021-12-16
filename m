Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 834CC477E9F
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Dec 2021 22:18:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234470AbhLPVSd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Dec 2021 16:18:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234877AbhLPVSd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Dec 2021 16:18:33 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC773C061574
        for <linux-i2c@vger.kernel.org>; Thu, 16 Dec 2021 13:18:32 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8BA3261DF0
        for <linux-i2c@vger.kernel.org>; Thu, 16 Dec 2021 21:18:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D53DC36AE7;
        Thu, 16 Dec 2021 21:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639689512;
        bh=dBcp9s9HHI0G+e6tdjmcyVA1/g66C6x4HmiVsAGZbTA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HFsKqvW1yReSCIFbgDemezFO6hUDVmYuQKEarQlSJd9u07mTv38X1qsAP8IU+oW2G
         W2O9VpRNQOvpI/K4nrejahEIfTUN9XuVlEkoEJ+V4sGDQj7WHAtLeyxQMZ/7PacWCa
         3niAZzt9vXKtcurMrlMsOP01CmIdeRYIvdjxw9+Agc4xw/KwlA9SxmaoS0of6zfc7m
         KhHTn4UqalixQHYGNz43QC1uSUaf4JR/NW5GSBD6J98LP+iQsx/Tn2Q1oy6PPXubHi
         EDYWG70St+bzOCEXgDA4dZGoFYIep89ENoGNfnsuGhh156CVdUriANlDL1woUzJUGb
         vGyzWlmSzVV8Q==
Date:   Thu, 16 Dec 2021 22:18:28 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 4/6] i2c: designware-pci: Group MODULE_*() macros
Message-ID: <YbutJCYnoMwjV6Zn@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20211215151205.584264-1-jarkko.nikula@linux.intel.com>
 <20211215151205.584264-4-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="a10H3VtJVNoE7GHT"
Content-Disposition: inline
In-Reply-To: <20211215151205.584264-4-jarkko.nikula@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--a10H3VtJVNoE7GHT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2021 at 05:12:03PM +0200, Jarkko Nikula wrote:
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>=20
> For better maintenance group MODULE_*() macros together.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---

Removed an empty line and applied to for-next, thanks!

> +MODULE_ALIAS("i2c_designware-pci");
> +

This one.

>  MODULE_AUTHOR("Baruch Siach <baruch@tkos.co.il>");

--a10H3VtJVNoE7GHT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmG7rSQACgkQFA3kzBSg
KbZ/FxAAiZAwU6zooYZ6ywkW0reSGVV2L9P5xrp1OgSUbjgMGMhhOizGzxQXbDzY
wLu2Rs4V8lVBv2n1wMQcftchDizpu9tkXLt0OPZyONeqmcaLDsd2i3/jgF+Cz1eq
0OgKEJYaJ8vePPmX9ftlI2X5LWBtQ3VlsOSn8aLc2x2bdgYYmzxkUmwS1ras7Wq0
ubIkRXZR5xZ99cnEYuYGJqR2MdRLRpvo1gXYlkhRm6s6nyTZkqY2VdpRF1yFx9xn
+111mr7EDUurs2/RuUjM0kFzOsjta6ZaVuUp7WXSZFkLHAYKp0OXtYB1rqxbyBuz
dXncJxdEuS/jyTS0rodDm1MQv4fyqAsSUugf7YxXQaikF3XfnMVLN09WVh9wdCzC
OaEgLlCfx9FCkPO32u2p3LsF6WhQHcamI8eWWzUwuCHdy6yUHJfpPOKcqH3UHNG4
mdyfQN8TBZeJaO8rrmHtR+QdwDyncEwO0012fpX/MUZiBkDtSWDWwStRxKWyC3S6
eqZWyDSb+6oUOJMyi6PzvR/KFHn9YScv1qu0qPET3SdEkK/4Z4N3ziC2fyxUGMo6
/+jpBp5J0Xxwx/SzdVQ4em5uUBroq3HvbBDHNRkTsDI/xH2iKNC/o7nYPS87iPpa
o0RyBFwzlxhyCq+B6akN3X/LN/ly++lwatTHOdlssmgzcF+P7hM=
=U7o4
-----END PGP SIGNATURE-----

--a10H3VtJVNoE7GHT--
