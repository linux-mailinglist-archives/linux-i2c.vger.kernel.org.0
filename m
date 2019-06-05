Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2BEF35A18
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2019 12:03:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727145AbfFEKD2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jun 2019 06:03:28 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:50280 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726690AbfFEKD1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jun 2019 06:03:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=u3C13c87086hMiV9w85rPm7zIsQPWFDde0xcEZuXQO4=; b=dorjVI3a+BwPR4KW5H82UKRlg
        Q9KqAanswJa5R2Wb689KlEmobdDfNHeCIoIrmt5I/PSgctZsHRi60Lg3gnFmHSNLPuQAliaq0R9s2
        vaYe1Hr5IKUF5PPoEbYIxmcmqmsGkWm/Qs6VhqrIEdJ0/Z6P1uHRVEgDVNJ/doyVFZ37k=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=finisterre.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hYSkO-0008Uv-UU; Wed, 05 Jun 2019 10:02:21 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
        id 7EA0A440046; Wed,  5 Jun 2019 11:02:20 +0100 (BST)
Date:   Wed, 5 Jun 2019 11:02:20 +0100
From:   Mark Brown <broonie@kernel.org>
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
        linux-pm@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Evan Green <evgreen@chromium.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Cheng-Yi Chiang <cychiang@chromium.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Kees Cook <keescook@chromium.org>,
        Colin Ian King <colin.king@canonical.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jiri Kosina <jikos@kernel.org>
Subject: Re: [PATCH 06/10] mfd / platform: cros_ec: Reorganize platform and
 mfd includes
Message-ID: <20190605100220.GN2456@sirena.org.uk>
References: <20190604152019.16100-1-enric.balletbo@collabora.com>
 <20190604152019.16100-7-enric.balletbo@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="RnxXMyWEPIZsopkG"
Content-Disposition: inline
In-Reply-To: <20190604152019.16100-7-enric.balletbo@collabora.com>
X-Cookie: The other line moves faster.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--RnxXMyWEPIZsopkG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 04, 2019 at 05:20:15PM +0200, Enric Balletbo i Serra wrote:
> There is a bit of mess between cros-ec mfd includes and platform
> includes. For example, we have a linux/mfd/cros_ec.h include that
> exports the interface implemented in platform/chrome/cros_ec_proto.c. Or

Acked-by: Mark Brown <broonie@kernel.org>

--RnxXMyWEPIZsopkG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlz3kysACgkQJNaLcl1U
h9BVMAf+I/I3bNW13EZ789wBAFxmn5KXFbH0t6CdJDgbILW9HMsGSKGbJXJRTRDG
GGeIfMEYK0lv5boeQbArMfoX/kkuVYHVj/71aQVsgC53JIBFFxHS2zEfzrFzgN+R
sNsvROQYmO1T5gOySrMN+AsqPwnu3CR2LgMPRqsvguCPduIfXzEM3afJQuRh2lAW
a5Im4U6GQX5cez1MGDHB3/Mk8fH194coSUTUtH134gpeA5LWemALrlDCRsfdSbw2
G2oeM++LQIDx2VcKfRKWfqvKhC1Ajp5FdiZw6Z7lo6+BXFHKSVupSjKAhtIdT4gj
RVhPy7IzR78PM8sLvDnqD6CyTHtuXQ==
=7p/R
-----END PGP SIGNATURE-----

--RnxXMyWEPIZsopkG--
