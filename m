Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A88EA605067
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Oct 2022 21:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230491AbiJSTa2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Oct 2022 15:30:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229890AbiJSTaX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Oct 2022 15:30:23 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D416A102DC8;
        Wed, 19 Oct 2022 12:30:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 33F14B825C9;
        Wed, 19 Oct 2022 19:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E2BEC433D6;
        Wed, 19 Oct 2022 19:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666207816;
        bh=K2VPaaXi4DrVyxX5gjTkJ6yRtFP6eLH94NE8lilHtRc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lqa0hmIouKzK+7mOAF/n8W2P50SsUpjODuO5+rCZ+cMgjWT1/NVQsrYNLKXU1k8PC
         6c6Mlt0cGGIX7s440GEtNGyax83c5rw2D7otJMEJATMHJYp3/HG0eo7/wcZVrsdN+H
         Jx8CmzVVPKu52x4qA08toEbErigvds9wGhXo/Lym3Q0YT4yWtCGOBxIAbE6ejTF+cg
         VF6K6t/QIBkqkMMYvCpZQEefVzd/5P2vjuf4XI6X64mc4gW/IYSF9yuwjUJEFA9p+9
         VBn1YlmXFgCqcWE2cDk/Xqmz2JA40RejPuGvcevcYjwRClkDtxnTvD611IQ9a/9WMN
         jpe5jXCrfj/WQ==
Date:   Wed, 19 Oct 2022 21:30:13 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Dan Williams <dan.j.williams@intel.com>,
        Lennert Buytenhek <kernel@wantstofly.org>,
        Martin Michlmayr <tbm@cyrius.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 09/17] ARM: iop32x: remove the platform
Message-ID: <Y1BQRcwjAQ5qKvzY@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Dan Williams <dan.j.williams@intel.com>,
        Lennert Buytenhek <kernel@wantstofly.org>,
        Martin Michlmayr <tbm@cyrius.com>, linux-i2c@vger.kernel.org
References: <20221019144119.3848027-1-arnd@kernel.org>
 <20221019150410.3851944-1-arnd@kernel.org>
 <20221019150410.3851944-9-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="23YSAjVTOzwU2E0+"
Content-Disposition: inline
In-Reply-To: <20221019150410.3851944-9-arnd@kernel.org>
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--23YSAjVTOzwU2E0+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 19, 2022 at 05:03:31PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> This was marked as unused in 5.19 and can now be removed
>=20
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Lennert Buytenhek <kernel@wantstofly.org>
> Cc: Martin Michlmayr <tbm@cyrius.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Wolfram Sang <wsa@kernel.org> # for I2C


--23YSAjVTOzwU2E0+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNQUEUACgkQFA3kzBSg
KbaD9g//TT4/N0arF0g/tFhsKwFtBCXTFsi/XHJNP+4EiLs+DioPgvDpQd/XiO/f
dkJOAHTsa/m+hIcLc58oqY8oLhNmXoh8V/s8nftcq5PfTnUZcXznRWe8w0iOnT/Y
f7C/S/UMS8J+sWUMN6OXuUmS1c4CkLZBQ6EynipGCkTlcN/sUi+IzkztSCzTLwLe
G8clKnrX0NYE3u7v6w09EarRIysMUednKYqsBJPU2lI3IawsjS53gite25kOaHEr
gCqJVC4hBX/onr+KkW2pztaEe/Isn7cXrGRJYQxm1ecamFJBfbONF1ua9OXV8XhG
WKXRYv7EAQ9YOzyKHxFdrCS9EpWRYnMOClKdcUW0EuyOgHogLCw25QdRNCiX5Xof
msO9AmZ5pO0sHHizBd/XvXEpMkcdCjh7cGlKgUthnTSV40cR8/vEhXRERFo+Jbxt
xq+rapAj9Jm+8vqExVrYP3K3ldqU40sIK1NrLswtGVqd2zXj/tqqnjIhr8jR/EIN
umbG3AKp3+Byc1uO+Ot4iZtkQoyge8r3qJdMPLid8kxTfpc7ReMSuOMvRjkEEjmh
XM7qiC6EtQLC+qaBueDs7s5J9Bq1ONhCA8ouvqg119w7wwx92jA+eZa+yGSId/S7
iT4HxQSrEsqlYq4YlyfIT+VXinBw0W4EXLZAxStIax36DYY5Nyw=
=OlOz
-----END PGP SIGNATURE-----

--23YSAjVTOzwU2E0+--
