Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 750131DB51D
	for <lists+linux-i2c@lfdr.de>; Wed, 20 May 2020 15:34:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726747AbgETNec (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 May 2020 09:34:32 -0400
Received: from www.zeus03.de ([194.117.254.33]:59218 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726576AbgETNec (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 20 May 2020 09:34:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=udmxY3eElyisrOqhNbRKohBCfXPS
        2K3Axj2gciVQ+Ew=; b=PHWMs9Yk2Na88RyxULIH1iLcLVgRlqO5As6BQZEgRz+M
        q8Ag46CeHXO9j2718wl7ABf5CpSCjk5Rjybl+afalhMMPTAwB67xYmO65s1lrpDj
        MbM0QG/kw77XPDjz2gDI9gUDuWcxL2TMMV/JeMgAZ+cUn5GvNU3567wB7bCzdsE=
Received: (qmail 673327 invoked from network); 20 May 2020 15:34:30 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 May 2020 15:34:30 +0200
X-UD-Smtp-Session: l3s3148p1@7JqndBSmOt4gAwDPXwjBAFv42Jy9rssU
Date:   Wed, 20 May 2020 15:34:29 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>, Lee Jones <lee.jones@linaro.org>,
        Jean Delvare <jdelvare@suse.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Max Staudt <max@enpas.org>, Stefan Roese <sr@denx.de>,
        linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 3/3] mfd: ensure that AXP20X_I2C will have the right
 deps on X86
Message-ID: <20200520133429.GC5759@ninjato>
References: <cover.1589801950.git.mchehab+huawei@kernel.org>
 <cfbb80f220bba5051640d92fc00825bdaa2ec877.1589801950.git.mchehab+huawei@kernel.org>
 <aa23c170-f4e8-e1f0-5c7f-35e51ec84533@redhat.com>
 <20200518145302.56642b22@coco.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xo44VMWPx7vlQ2+2"
Content-Disposition: inline
In-Reply-To: <20200518145302.56642b22@coco.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--xo44VMWPx7vlQ2+2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > With that said I'm fine with giving this another try, maybe let
> > the test builders / rand config builds play with it for a while
> > and see what happens?
>=20
> Yeah, it makes sense to me.

I'd like to see an ACK from the designware maintainers before sending
this upstream. Testing is all fine, of course.


--xo44VMWPx7vlQ2+2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7FMeQACgkQFA3kzBSg
KbbHeg/+KhGr/M5GB/4C/j1LiglUMLhY5MY/aTO0UFUQYG2dHkBRmpN1iFHkUa3v
QzWcU9uZ1q/Ew84IXLiX+myrbCwX7ugbrQZhR1XnVXmB2SonkJvXeOqdNoLkDFT7
rSU6I3Uu7QnCXQDH986GgH1DGYQehdHArPje833DzUaY1okLE3R8pXYRZvs9eVVq
Hf2eKFTNczDYGhXqfTrTW6n9cnvmooIfAMTCj6p9fpbcous61ZUuMgHiPUBMkuoL
v7G7+oYpD+R7l2oNIOE/ZTdCp6aJENmEi/seoeNoDAqMDVwYg7XZJUzc3FvJ4pJd
Se1H3cIc08Ytqr3Aa1l7kxSZ1iBvf1hf/xIyGO4dTiNJAUxR3QV4oTe2QClqhP38
DLiNZ74/98Aq13XwdOssk9OQXlTMfS4Bd7v4JJcXqJiLtLINbrM6tmfFWkYmGTFJ
Rku2P+pvO4bNf/1Szh5rWWPCHRzBc5Ux8hbevO11aHUvf2453U5OsmmVomJK6rn4
fd32JKN8PGOdkZOnPYtHeLdzQcBXouXNk0fxVajFD5hNneuey6dtgU4g4wxh0F33
8ONTBKMFbMhY8AVevHWcMGgwWhdqs+aIZoNldjbFLtrSB1dHe1Fkwuy5OqjvAp9a
Lr5Qu7G37ES7GGCb5uiy+XPV4cv7kGpdzhTtz09J18vWi1ogTLw=
=LZ2J
-----END PGP SIGNATURE-----

--xo44VMWPx7vlQ2+2--
