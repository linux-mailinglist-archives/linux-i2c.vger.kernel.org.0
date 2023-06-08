Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB971728953
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Jun 2023 22:24:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232369AbjFHUYW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Jun 2023 16:24:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231626AbjFHUYW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Jun 2023 16:24:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F044F2D68;
        Thu,  8 Jun 2023 13:24:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8146061335;
        Thu,  8 Jun 2023 20:24:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67183C433EF;
        Thu,  8 Jun 2023 20:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686255859;
        bh=IB+islnkJPuKH5r5DBGbfelqgP9jYtteAfvXOcx+1rY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=m4OKC6k63o5WVlApxAIFYhwq3tbez/jvnRW0dxAr6bm8sIGe+5NIC3d8BN2Qi7C6A
         JM+GPduMkLR++79ECWmwrEV2Tpp6WDZeCAAD3G3H0xQA83iGlZ6WFQD8425XhPQZsa
         zl8N7gmj8oFIJkPYOtom377s1jtXp/YLHcek22rJRgN7OF8a1nEyhnH4DZeF+KpFy8
         BSIYK+hA3fPtaQ5+zLTynW5z+ctksOAacdPNc6ZsiooRyY7JqHiF7KoK8kaWw7z+q+
         dJ6xJpFqNUk8ebT+w3Sc6BfhBhT29cBQ3RdVihtrV/Sld2jRCroM+scixYGguBH6fa
         EvfU+vbrJtZhg==
Date:   Thu, 8 Jun 2023 22:24:16 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     XU pengfei <xupengfei@nfschina.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] i2c: busses: i2c-img-scb: remove unnecessary (void*)
 conversions
Message-ID: <ZII48BBQtuxuWMxM@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        XU pengfei <xupengfei@nfschina.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220801013319.3299-1-xupengfei@nfschina.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="MqnwMx7GvK187Ipa"
Content-Disposition: inline
In-Reply-To: <20220801013319.3299-1-xupengfei@nfschina.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--MqnwMx7GvK187Ipa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 01, 2022 at 09:33:20AM +0800, XU pengfei wrote:
> remove unnecessary void* type casting.
>=20
> Signed-off-by: XU pengfei <xupengfei@nfschina.com>

Applied to for-next, thanks!


--MqnwMx7GvK187Ipa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSCOO8ACgkQFA3kzBSg
KbYXng//akxSlLzs7y+T3B/ntqerP1wTiTCareE5ajVJRZabpnkSBzji/am2oSgT
U0cvSuQVAaj9i20qacXnztepqmPyEMU3Btu0fy40VhfdBEmidKHqmJYq+t/LG1Y3
XqJj23MdZOwXWDqhN+7jmNX//tBF2mO38xJN7lXRZv/LIK68e2k6rdhLAS5afNu9
KbXKqNgg33FDz5mAtcOrut9xk2kzcXCFtpSLR3+Z/tlvEJZmfo8g1qbRdZMi5WnD
O+ULE4ij0fFlJ5xRs9Oh/mT3qDLGqru77PDskj26q+1JUB/ucEZPCKo8BhAzzCns
x2uOMxlig50aeFe7EqbtGjqc0k5OYwmur96ikz+tp/TZJQeDL+M5SkYVAmnKkKjC
dX4ax4SOrSQ2/+0SnvQqSYXCdZTZ4fsuL1587UY7ST8j8TXsdA8XcgiVFR2jC+Mj
v6jk9in3Ix0LnuzMKXNDFzsBBUPwZtndmVKtEsJKQVnk9TfEiqB8JUwvxwTTjX8d
dxIJw7CdKtcXxT0SPzC8IfZyBjp29DzR/+lYgsrufwpbVXP3MX6h0gcqnlRXCEjA
l+XwwzyliL+jIwxlTI21dCnPD/IHONYway8qRwoK2JQ0rkI8/D+2LdrKRGvL02Yy
pXWPnUhHy4qafhOWYM37VR3QM8JbwdivZCIeeSqUhsu8BrEtdzU=
=rlHF
-----END PGP SIGNATURE-----

--MqnwMx7GvK187Ipa--
