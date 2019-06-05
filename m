Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF58935F07
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2019 16:20:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728007AbfFEOUE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jun 2019 10:20:04 -0400
Received: from sauhun.de ([88.99.104.3]:54932 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727893AbfFEOUE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 5 Jun 2019 10:20:04 -0400
Received: from localhost (p5486CB35.dip0.t-ipconnect.de [84.134.203.53])
        by pokefinder.org (Postfix) with ESMTPSA id 291123E43B4;
        Wed,  5 Jun 2019 16:20:01 +0200 (CEST)
Date:   Wed, 5 Jun 2019 16:20:00 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc:     linux-kernel@vger.kernel.org, gwendal@chromium.org,
        Guenter Roeck <groeck@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Lee Jones <lee.jones@linaro.org>, kernel@collabora.com,
        dtor@chromium.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
        alsa-devel@alsa-project.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-iio@vger.kernel.org,
        Fabien Lahoudere <fabien.lahoudere@collabora.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org,
        Heiko Stuebner <heiko@sntech.de>,
        Brian Norris <briannorris@chromium.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Sebastian Reichel <sre@kernel.org>,
        Rushikesh S Kadam <rushikesh.s.kadam@intel.com>,
        linux-input@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
        Jonathan Cameron <jic23@kernel.org>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        linux-media@vger.kernel.org, linux-pwm@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        linux-pm@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Evan Green <evgreen@chromium.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Cheng-Yi Chiang <cychiang@chromium.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Kees Cook <keescook@chromium.org>,
        Colin Ian King <colin.king@canonical.com>,
        Mark Brown <broonie@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jiri Kosina <jikos@kernel.org>
Subject: Re: [PATCH 06/10] mfd / platform: cros_ec: Reorganize platform and
 mfd includes
Message-ID: <20190605142000.GC962@kunai>
References: <20190604152019.16100-1-enric.balletbo@collabora.com>
 <20190604152019.16100-7-enric.balletbo@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Clx92ZfkiYIKRjnr"
Content-Disposition: inline
In-Reply-To: <20190604152019.16100-7-enric.balletbo@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Clx92ZfkiYIKRjnr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2019 at 05:20:15PM +0200, Enric Balletbo i Serra wrote:
> There is a bit of mess between cros-ec mfd includes and platform
> includes. For example, we have a linux/mfd/cros_ec.h include that
> exports the interface implemented in platform/chrome/cros_ec_proto.c. Or
> we have a linux/mfd/cros_ec_commands.h file that is non related to the
> multifunction device (in the sense that is not exporting any function of
> the mfd device). This causes crossed includes between mfd and
> platform/chrome subsystems and makes the code difficult to read, apart
> from creating 'curious' situations where a platform/chrome driver includes
> a linux/mfd/cros_ec.h file just to get the exported functions that are
> implemented in another platform/chrome driver.
>=20
> In order to have a better separation on what the cros-ec multifunction
> driver does and what the cros-ec core provides move and rework the
> affected includes doing:
>=20
>  - Move cros_ec_commands.h to include/linux/platform_data/cros_ec_command=
s.h
>  - Get rid of the parts that are implemented in the platform/chrome/cros_=
ec_proto.c
>    driver from include/linux/mfd/cros_ec.h to a new file
>    include/linux/platform_data/cros_ec_proto.h
>  - Update all the drivers with the new includes, so
>    - Drivers that only need to know about the protocol include
>      - linux/platform_data/cros_ec_proto.h
>      - linux/platform_data/cros_ec_commands.h
>    - Drivers that need to know about the cros-ec mfd device also include
>      - linux/mfd/cros_ec.h
>=20
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Acked-by: Wolfram Sang <wsa@the-dreams.de> (for the I2C part)


--Clx92ZfkiYIKRjnr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlz3z5AACgkQFA3kzBSg
KbYuGA/9GcL4++C/ViixlrJ+2KnwVIZhutol9fcA8YKEeEpGQq42AkU9zJV8pX3y
U6sLvo3bHeDjA98mwO+aWKCaZIp1W5vZrKdQNqUZ35xvEaIgjhZ2dATu2+ontUAI
Yv9koHktSt4oTbZlAPmcIwV/vLrhmJgr0FA1B6pS4qFbccYh+ePsTKvYpsjaguox
vwDsmzJkZJ6AjW51Nx0dvMGJuUX6RLnv14etbz6P1I47cPKG9lYyVOsDiUIHsOPG
JmhUiCaertI9rrsjaYNQIGrzGbkAozoO0c5klJC5BlnfBvqEfwjgBh5+ccqH1HXL
WuegitNsfkAX3Y5nSZUsGoC1wtg+pqmLWsNs2eTc1uQAxYOwlleFOiMKXuhUIG2U
0BMFoJ6/AYCuMkvIPyDdl8UWMjXW8Odreu2Y0h1rF6SuJ+mmI8TfhgfbTG/s1uX7
qs9bPWwmi1EOJ1AoNv3ouLrC2PT6ES7Kt5mnvi4byXFcwkdq8EKcTfLVpy0xz6l/
tDTHCxNLCrku2WX32buEW+mHZfCpbNRfcU7/VlTNU8o9i4QYy4WeL/SgaGLDVZvM
zDFRRhXw2U+mtxRI6yAI/bl0Tl8VJG7cqCHeGuKGeA30siz75gSi6b2n+rCTnkba
dfCggQuvByFYBOqqO4mnuvTflAYInnad7IyBnbGhS7p7NEkPbgE=
=Nrms
-----END PGP SIGNATURE-----

--Clx92ZfkiYIKRjnr--
