Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 602F7237C0
	for <lists+linux-i2c@lfdr.de>; Mon, 20 May 2019 15:18:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732732AbfETNIj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 May 2019 09:08:39 -0400
Received: from sauhun.de ([88.99.104.3]:50804 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730570AbfETNIj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 20 May 2019 09:08:39 -0400
Received: from localhost (p54B333DA.dip0.t-ipconnect.de [84.179.51.218])
        by pokefinder.org (Postfix) with ESMTPSA id CCA912C2761;
        Mon, 20 May 2019 15:08:37 +0200 (CEST)
Date:   Mon, 20 May 2019 15:08:37 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2 1/2] eeprom: at24: use devm_i2c_new_dummy_device()
Message-ID: <20190520130837.iglqohsyi5kyj55y@katana>
References: <20190520071042.21072-1-brgl@bgdev.pl>
 <20190520071042.21072-2-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ftlxdhkxnq557dwc"
Content-Disposition: inline
In-Reply-To: <20190520071042.21072-2-brgl@bgdev.pl>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ftlxdhkxnq557dwc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 20, 2019 at 09:10:41AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>=20
> Now that it's upstream, use the resource managed version
> of i2c_new_dummy_device().
>=20
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Looks good now (not tested, though):

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks!


--ftlxdhkxnq557dwc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlziptAACgkQFA3kzBSg
KbbRzg/+OYe+nhJHP0/DHkPXgudVkY1IXbpxlXsulCQTYA2pjj7d6oOnHrBKogGu
Ytqw+1eCb358NeqOaTznJ0a7ZeB7aU9Wa3mznOxonqBJsARso8a42H+vm2JOauRR
eOrPnd0zyBKpraW5GY9sVy7h/UGwRIyh44zOGMJJQFTwbG/Ynw0RB6Gfo+DlSW7l
Uh8FY2rJFalSDr9bIAZ8bA3qt2gQwlmk+gv/cdQxMbqbSi9t4ygkJat9zVc+RcBg
xpnrL4VFeLDCcEXh9+zg2mnZ7Ht+ykjPL7Q/I4W4TC+Eb1f/eshZ/1+j/9Ei+N6g
3qLBPDrRTGi4U+MJG6vTQsYbc1X4i4jo+UlFJed8cUtd5BUo9b7TVKR3BKS8IIVW
qjIIY9sx9OLddS3t/ElZG54kywAdh7d5yjWICNlX8m9h4icAqVwVevkX0yMaQHez
KYpeFWShF1GEehPbxbI5VrFenH1fc4jzulLBzw07X+IpS9DZnBXLX3xcDp4UH50k
h21y1+dlBg3cWpQXNSxlj8rnyb32H06F14sShi/bwAQGtuSN3z1pw2UShu9KcJH/
37OZAo8aKwaR+K7+6vtLjipmtshGxMNZW8v1R6bn5nVLHfgMepbn++WhWSS+Wu3J
+pBwnYJdlfcu1BiqzpQp7phvQYB5MAiTgAihtUXGBeVUulqOVKg=
=hgjr
-----END PGP SIGNATURE-----

--ftlxdhkxnq557dwc--
