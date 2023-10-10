Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC5857C04CE
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Oct 2023 21:41:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231596AbjJJTlw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Oct 2023 15:41:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbjJJTlv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Oct 2023 15:41:51 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25CA5DB;
        Tue, 10 Oct 2023 12:41:48 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35D94C433C8;
        Tue, 10 Oct 2023 19:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696966907;
        bh=YbjcVPLcZSTQEmDpKd/PlJwKdY9kwZW4f2hfoRMYoIU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UUQ3ZaPZAwveJxmaNiOlKKQp+kxSRUP5C7euw0+Tbfx/+OL+XcfcvaOq5WSwdL9j2
         ZFiobaBI8at/xf6jf/L3Oq68/kVx1e76sjYK+F6ZAHFO8rAqXGaGL7BcUZjVbChkKV
         H6fYG3G+w71RCAmaKrPiHp4r0QXmUcAQu0eYJlIsMmgKUCgr1R1NOkfSTGc6RIuP+t
         fwGQA25z1Wu6PYGyN20l2jYBiNDm6lcZ0WPOA+Rlrk3GrZwQoe4T87smFv1MK232Hz
         symlBQYLtGl8KKEidMI6fwC8QxwF0/UuhrZhuq61Da4J07Hj43ecPWxEJE5sVVnlE5
         CHxyfdDwrqomQ==
Date:   Tue, 10 Oct 2023 21:41:44 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Gregory CLEMENT <gregory.clement@bootlin.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Vignesh R <vigneshr@ti.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH] i2c: Use device_get_match_data()
Message-ID: <ZSWo+FoFBYTqwIGd@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Vignesh R <vigneshr@ti.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org
References: <20231006224446.443015-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tp39jzaLqYpPOoAn"
Content-Disposition: inline
In-Reply-To: <20231006224446.443015-1-robh@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--tp39jzaLqYpPOoAn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 06, 2023 at 05:44:46PM -0500, Rob Herring wrote:
> Use preferred device_get_match_data() instead of of_match_device() to
> get the driver match data. With this, adjust the includes to explicitly
> include the correct headers.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>

Applied to for-next, thanks!


--tp39jzaLqYpPOoAn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUlqPgACgkQFA3kzBSg
KbYOuhAArYYwQ5CXnRdoJfFsVTfI32jFJtSkGywgLNffPFNnGQ1iqCc3BaYSI6+w
3NqFCi6V9e1mk73kIAFCo0Dd3p0wQ3LYuDl71mh3dvmhXeWJaHOOh1Y5OhQaxyey
dQUXxw5700pHN93jI7Z+z7Zmo4iTA8xzm6GVyvWwmutcBd8GofUtK5ra7vNCIuI2
WnOTzv1k6aRNchrxkXTJFoHZAiymfCU537jgIj/xiqoYxlszzhh9gRd6UaWmPcnY
sUM+AnlCt9QyN89lDmoKmrgl81CfOT6YEgU1uIDMdq4WA/ApUyM7KSBdtPFvhHr0
QmN4XWUJDkDTeRHWI/cWBYEEvHqvkbCic3xh+qrfCIBHmdmwOazB1CnUeEml9TOi
BuiEzZOjBemavM7O/28m7hOZS8nLGiKXSpcUQ76Uzyg2Ch46MUfL8wqlzJO5KmY7
O676lje1KlanrvYwUJ/Eamk/aWzEuMYD6Mh1uRC+cMd4wMvTUVglV1th1YEf7Xnc
KivfGaP9GSq4UulQcZxY4hUHct14H0lqAB4m9kAJ33Ho2eLQ/CC8dL7wuEjBAwpv
iXmLjSH84LIFkXH39rGmBbElvYjjSI/YgFWTHsZTcb0Fosq/LSfngRdZKw3w/uGZ
gTugvMLt3Wdz2Hh4c1s9u0J4tkPM7HvMT6H379us/5bDLHN5IjU=
=gsIk
-----END PGP SIGNATURE-----

--tp39jzaLqYpPOoAn--
