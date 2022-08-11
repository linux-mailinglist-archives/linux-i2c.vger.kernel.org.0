Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D747E5907E5
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Aug 2022 23:10:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236086AbiHKVKS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Aug 2022 17:10:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231352AbiHKVKD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Aug 2022 17:10:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D15E61D54;
        Thu, 11 Aug 2022 14:10:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CB32F6141B;
        Thu, 11 Aug 2022 21:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8620BC433D6;
        Thu, 11 Aug 2022 21:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660252201;
        bh=hqfDWQUpYRIkgUzWjUdxfrFJ9S27fu4F1Z6PHuW0F3A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=B7KhKR+k/ZvVPlXELHr25Sk4o/HTdeuAff01uV3CF3hWgCBd1wnQbDfExSZCgGj8n
         uQsX4LHsyEfJMueOF2RqQV3WoBl+07Bpl+xZaR7sg+1XA5zrlaBkaLAoVdKhKeLXf4
         W/T6wEXYevE3UIc5Smkslir/n6C/U2Sc04cPCBxBAyewap/oPtkyx1mNC4RloSosqD
         tjd1Tk9jj+7N92qCVFSWEeXIPk/HcpeDfWnvXXJM/EBsG4Y0dwtLSJ63WEi5WLH+ck
         gBhi/Kba8rjDrWLvAXhmXAju4Rjjq3hqcrmgR6cwLCf8PtRDPS7mlV7xZOUv7dyvho
         WUuvKsecT9GCQ==
Date:   Thu, 11 Aug 2022 23:09:57 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     luca.ceresoli@bootlin.com, Peter Rosin <peda@axentia.se>
Cc:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/9] docs: i2c: i2c-topology: reorder sections more
 logically
Message-ID: <YvVwJf2s45yjUWfM@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, luca.ceresoli@bootlin.com,
        Peter Rosin <peda@axentia.se>, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220808141708.1021103-1-luca.ceresoli@bootlin.com>
 <20220808141708.1021103-8-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bwOb1WpJ03KiHaqV"
Content-Disposition: inline
In-Reply-To: <20220808141708.1021103-8-luca.ceresoli@bootlin.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--bwOb1WpJ03KiHaqV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 08, 2022 at 04:17:06PM +0200, luca.ceresoli@bootlin.com wrote:
> From: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> The sequence of sections is a bit confusing here:
>=20
>  * we list the mux locking scheme for existing drivers before introducing
>    what mux locking schemes are
>  * we list the caveats for each locking scheme (which are tricky) before
>    the example of the simple use case
>=20
> Restructure it entirely with the following logic:
>=20
>  * Intro ("I2C muxes and complex topologies")
>  * Locking
>    - mux-locked
>      - example
>      - caveats
>    - parent-locked
>      - example
>      - caveats
>  * Complex examples
>  * Mux type of existing device drivers
>=20
> While there, also apply some other improvements:
>=20
>  * convert the caveat list from a table (with only one column carrying
>    content) to a bullet list.
>  * add a small introductory text to bridge the gap from listing the use
>    cases to telling about the hardware components to handle them and then
>    the device drivers that implement those.
>  * make empty lines usage more uniform
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Peter, are you fine with this change?


--bwOb1WpJ03KiHaqV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmL1cCUACgkQFA3kzBSg
KbYt7Q//ftQMPUZDT/hXAu+k28HHX9zb7QRLzTxZxUeXt4YhMUL8gVcWx9UvoWx/
1HSoZnmJhUcnxI4uu/4OFuuAo3P6beqkiMGyWz5LaKgpqJm5JsnLBExct1mIJ9ir
wiNdjMILC+vdbO0b7qlm5EdcPZSDBWMtRoGJu5lm/7fj85JE83hGERz8CVk+kK3D
jDdTDQ8+LoJ5gNec/miySGtCTgVOUVBwzM/j5qnQxLoUZFcmB6xA99FqeniVd/np
PSlXrlnN5aW+zipdHQK+hJGqWEQjZFOIVBACwBOTviiIw/zJuhID+417lzu4sOly
UpBjERW1eb+Jzvs/XeR/eGVq6ujx3n3fQKbmOPAA44Mg8sth90pAbFucGYJpeqay
YToZklQGMWt0loRJF800fDw9JD3rf+rB4L8Pg7ARKeuqszbtYDRUDJz3aQqaIeL1
74PuXY98dTSdZtpP5qPgd1SlPHVTduSFsCfKQt1oyMo+/tytBRyAJLquyFSvXjRe
jn8fHISP9yaRrR1nqeodHqej/q75+ImLZFQBGVau34kQQ/VkE4VLkzD8inKC+024
FkAPcM/90Gfzg3F0F8hYxejRD50KtZWA6SEEiCeuCTuUWL1bYU8ioCfW95E2oXFi
1hrLGwSncCYGWureZzi3xrwr9uJDK3JYRt/wzwUlqjEGAYBlX3U=
=Yf7W
-----END PGP SIGNATURE-----

--bwOb1WpJ03KiHaqV--
