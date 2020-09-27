Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3983427A2DA
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Sep 2020 21:39:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726280AbgI0TjD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 27 Sep 2020 15:39:03 -0400
Received: from sauhun.de ([88.99.104.3]:38552 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726267AbgI0TjC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 27 Sep 2020 15:39:02 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        by pokefinder.org (Postfix) with ESMTPSA id 556562C0548;
        Sun, 27 Sep 2020 21:39:00 +0200 (CEST)
Date:   Sun, 27 Sep 2020 21:39:00 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        linux-i2c@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rajmohan.mani@intel.com,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v8 0/6] Support running driver's probe for a device
 powered off
Message-ID: <20200927193900.GA30711@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Tomasz Figa <tfiga@chromium.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Luca Ceresoli <luca@lucaceresoli.net>, linux-i2c@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rajmohan.mani@intel.com,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        linux-media@vger.kernel.org
References: <20200903081550.6012-1-sakari.ailus@linux.intel.com>
 <f4b82baa-66b7-464e-fd39-66d2243a05ef@lucaceresoli.net>
 <20200911130104.GF26842@paasikivi.fi.intel.com>
 <6dea1206-cfaa-bfc5-d57e-4dcddadc03c7@lucaceresoli.net>
 <20200914094727.GM26842@paasikivi.fi.intel.com>
 <20200926123807.GA3781977@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Content-Disposition: inline
In-Reply-To: <20200926123807.GA3781977@chromium.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I think we might be overly complicating things. IMHO the series as is
> with the "i2c_" prefix removed from the flags introduced would be
> reusable as is for any other subsystem that needs it. Of course, for
> now, the handling of the flag would remain implemented only in the I2C
> subsystem.

Just to be clear: you are suggesting to remove "i2c" from the DSD
binding "i2c-allow-low-power-probe". And you are not talking about
moving I2C_DRV_FL_ALLOW_LOW_POWER_PROBE to struct device_driver? I
recall the latter has been NACKed by gkh so far.


--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9w6k8ACgkQFA3kzBSg
Kbbb4Q//cQDDt6R/93qbuDZbbBbKU7yOioGMp1yxGawOohDmpz0uV631alJMoKlv
5l2nQXyXHInvGZu7fmdwqH4ouAgvHMC7jnEw2lv8DOj6q8ovnukacpme+JjGa1y3
DYO2CIktDQw1xqUas2B5yu4Qt5D+LgnlMFZN+LUSiYGSAVQdZ+nVbYcwjRNQ59Eq
T38itwlWGIISRo+5zv3prNb//xtoaITJty6DdBOFvoLQK0vv0UNMqva5zD8+86kA
BKa9JZPRLzYeWpO5TJlVYw13vGjEl802a1kF6+xUTc63bSrUtUhSDCLnezrzlkW7
gxJRHwrKYoWuuaRckVA14UNRvnZKMAtpuHToZidgeryEOw+biqzYS4fvlebqkg+w
oub1xk6svlhzujT06LlW5mr0l5eo9yz1+AFmy0Xr7t9ZkOjhK2W9yoZTR7GF8zJv
acmwMqTDnINf7hSmVbSfPi6hPamjf8M1LloZB5ej2OcPZ2urCx17bXJGeyzMvtPr
VsVdE7QJd/JQ1uhvWeU1a9dqh6kCBp9+4my8JIk6BwYP4sbaqftlXLxh0MMm4ANC
mDKxA4Z75Ifj5h+elH23cOZ9eFFANZJM43BmjLff04XUinlnBXm2YBXEECufQJw7
OLSs3YqJz1M+yqX74QGxnb+dZgTObyOU99s/Qe2mWRwFcEMOjNE=
=H98q
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
