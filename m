Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 318D374A479
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jul 2023 21:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbjGFTjw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jul 2023 15:39:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbjGFTjv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jul 2023 15:39:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC21719B7;
        Thu,  6 Jul 2023 12:39:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 693216118D;
        Thu,  6 Jul 2023 19:39:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4683DC433C7;
        Thu,  6 Jul 2023 19:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688672389;
        bh=yd5ZfhpPHoEtN8UO2XW5AaVfdcS9cerHuenbgKjZVMQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EZgNsNm7ACja89GCYt4QZjwNxiDlS0fz4BPSniEBObGls7+KlAUmGLwsQnIF/GHEP
         f0oxiGB58FMNIC/aNMThhmHfOx3qxKNaGTLOYiejzlqC6PX3KC8LzFA0KwXiamCVDk
         fWd+Xi8U9/vnIVMghD8jwm856FzlCkB8WSD6YzWbGTX+p+T/yYfsUXtpvGXangg7Hl
         8HkS4hloqIVpl/wkSlK+ImsM1wSEMu/pP62tcsVZashDOnVlKC+HZxEBNdIJE5ZFH0
         b198AOKlBCtY6T2mdVZ3qCjSwhV/DAXMOjpJovuraXhEe0XwT5rHVoaUYOKlMTthSv
         vTyk9pOAh5c0Q==
Date:   Thu, 6 Jul 2023 21:39:46 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     dan.carpenter@linaro.org, Linus Walleij <linus.walleij@linaro.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Alessandro Rubini <rubini@gnudd.com>,
        Giancarlo Asnaghi <giancarlo.asnaghi@st.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        stable@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3] i2c: busses: i2c-nomadik: Remove a useless call in
 the remove function
Message-ID: <ZKcYguUjJqxOGcUB@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        dan.carpenter@linaro.org, Linus Walleij <linus.walleij@linaro.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Alessandro Rubini <rubini@gnudd.com>,
        Giancarlo Asnaghi <giancarlo.asnaghi@st.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        stable@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-i2c@vger.kernel.org
References: <62ae6810d41e04a9eb5adfa18a9e40904bc72256.1688160163.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KIbpIBjWo1WrAkVC"
Content-Disposition: inline
In-Reply-To: <62ae6810d41e04a9eb5adfa18a9e40904bc72256.1688160163.git.christophe.jaillet@wanadoo.fr>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--KIbpIBjWo1WrAkVC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 04, 2023 at 09:50:28PM +0200, Christophe JAILLET wrote:
> Since commit 235602146ec9 ("i2c-nomadik: turn the platform driver to an a=
mba
> driver"), there is no more request_mem_region() call in this driver.
>=20
> So remove the release_mem_region() call from the remove function which is
> likely a left over.
>=20
> Fixes: 235602146ec9 ("i2c-nomadik: turn the platform driver to an amba dr=
iver")
> Cc: <stable@vger.kernel.org> # v3.6+
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied to for-current, thanks!


--KIbpIBjWo1WrAkVC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSnGIIACgkQFA3kzBSg
KbbTLQ//Z17Q9oUqZ/7oqQGbFyjrzw+cB9E4wcUpsZR4Qi8uhZoOar1Gnq8oHFBS
q4twrbMNdWx4vVCVVcHBqSEj+8sBDAgIxfhJ6Iwsbp7A5khg1ifxLE6HJXtZzn5z
DgsuNeVREQY8vPPwSHggNQI5AePgVGIyPh/16BQIAsEiRkse5yhjSdvUKdTSKBm4
rw8TRSBhoTR/abTRolI8GrAcbqVwXPOKV4aNE1rFZObcDCHB6zm/mxdKuc0tY1K9
YKKY+Ditugim9MO3pgH1M9n9pZObmInFIusRrv+i9gA8Eb9/dCYe10EuD0nchK/i
07OdJ7kAvHucMn9CJqz3LRzWskTYOqTj+7nvK8kRAyaRhuAXug8C/SeU2R9eL8Fq
Ey/bKMC7J0YJYf+/ZGxEFjILPiBNR1Sao8xalng30ReeA2pYcsHmOCKSG7f35e+n
y5QNghs2MZrGW5+hh3IMVIVb+fjxh2Qvxnr41SJ3knhV0nSUFdc9wBMXtegX5vrW
ALROVLBqBv0VdGDwY9rGVLJiMnhdctwgDfFXDHoqn+48c+TjREeW9qy+WHbO+yBs
/OzU9wQRG/FL0ud/MXSAPpJgZTWHT0oAZxYPHhe9jQpoGQa3lpNsYPhMrEYpkUsw
hNHoNKF5dbMh+q+Q/WhIJEvs2VimrjVmHqQQTj0YjHH3M+o+hNE=
=230U
-----END PGP SIGNATURE-----

--KIbpIBjWo1WrAkVC--
