Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94BF87A6C1D
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Sep 2023 22:10:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232717AbjISUKk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Sep 2023 16:10:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232036AbjISUKk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Sep 2023 16:10:40 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF3239F;
        Tue, 19 Sep 2023 13:10:34 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF7BDC433C7;
        Tue, 19 Sep 2023 20:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695154234;
        bh=cF7p3OW7nLLAvPuF4ND/J2BcR7H1kVvjtBvIvFQGJ98=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tSeUjPQ9PF8DSnDDbwCPvhjrIctvbD0DvLi7OZJ7YNPJYVb9oUCqUM1l18kTFDqHI
         Zx1MKkvRExOOTfNxJHINyHOIGrwccS57QjkpabwoCiQJalwNjqXHbzyLwCx3kUN+lA
         bSVlVOfoa62TSRP457whreMsRcmhg4R3+s2rt7IOMNdv4nD0mARgBTsAnS4AX5lw+V
         HjTttRALCLG9VTV4Ja8evIQmh/xhKRwOL+ep02SOgOi+r04iyz+gMLREBVUEoRxJw5
         JMqYTbYX/V6b+oxneGoK2rvQEesH3GCbVC+Vxg/66/00Rz39J/APzlMj5QU9yGKFxV
         Oel1QTJ6A+h9A==
Date:   Tue, 19 Sep 2023 22:10:31 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Ivan Orlov <ivan.orlov0322@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: Re: [PATCH] i2c: dev: make i2c_dev_class a static const structure
Message-ID: <ZQoAN+KqAUpb9pNB@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Ivan Orlov <ivan.orlov0322@gmail.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org
References: <20230810174618.7844-1-ivan.orlov0322@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="b1Q/f3bKQt5SBApn"
Content-Disposition: inline
In-Reply-To: <20230810174618.7844-1-ivan.orlov0322@gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--b1Q/f3bKQt5SBApn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 10, 2023 at 09:46:18PM +0400, Ivan Orlov wrote:
> Now that the driver core allows for struct class to be in read-only
> memory, move the i2c_dev_class structure to be declared at build time
> placing it into read-only memory, instead of having to be dynamically
> allocated at boot time.
>=20
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>

Applied to for-next, thanks!


--b1Q/f3bKQt5SBApn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUKADcACgkQFA3kzBSg
KbbAGBAAjB7RkRIEWtfwtlL8RT/FztRycjfTDSCtMgCLFditm8XeudieRwtB1HwW
Lws8ODVLARdFB4O47rvAIMpgFdEoj+gUl3xoo0eCjPE0p75CYQFgExbGrVBqPh3A
UUkHf4AfNa7WrPbWnO/7yEXuYvCtUoI6V2X6X/4PjIgkOCb+MmQaoeLaLXU7WxQ5
eXnVQcu1plKw750aBq5oHn3kePLagdocQ+RvxYltokX0+GblQcYx0hLFBUFyjM2P
FkKI4tzMC4NtoksB5QoqX5pL3s3g9V8WohFMlLyqp9ujt0COBDXPg3hq8liFHGNZ
xxIQRSLBFDuqXeM8c0k8bWKZUAbhXc6UwSZ4MW+J4CCocROhN0uEo+MY3YV5RFe7
S1FgSQrOz5gI9mC2xrbOw43PpEZxP8e0GU1hpY4+dYcmAAXMvW4defcHVSsDW6s3
Wr10AfqfHda07ZMfuRi2E8VXL/FrU26feqOcvGhciSdMUszy6Cu85zgOLcVDLpCy
HeuzsNPw4kL4x4ITTY5xNCq8dx7IxiigOVjhSdniUbl8EBoIDUJKMfG9x3346sTf
OcRVOMRGOzLqCSjEeWjfOLFmB1oS6VWKpDabr6ZL2KT1TC3ARjhp6VBybHP73XqH
v+cvnLhJPNl2N0412551AVaceLQKCwMC3UJEPjfc5JgCoxuPS0Q=
=eP/A
-----END PGP SIGNATURE-----

--b1Q/f3bKQt5SBApn--
