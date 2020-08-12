Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5058C242F26
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Aug 2020 21:25:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbgHLTZM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Aug 2020 15:25:12 -0400
Received: from sauhun.de ([88.99.104.3]:56170 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726512AbgHLTZM (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 12 Aug 2020 15:25:12 -0400
Received: from localhost (p54b33361.dip0.t-ipconnect.de [84.179.51.97])
        by pokefinder.org (Postfix) with ESMTPSA id 0CD802C0448;
        Wed, 12 Aug 2020 21:25:09 +0200 (CEST)
Date:   Wed, 12 Aug 2020 21:25:00 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-acpi@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media <linux-media@vger.kernel.org>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        LKML <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v4 5/6] at24: Support probing while off
Message-ID: <20200812192500.GA8942@ninjato>
References: <20200121134157.20396-6-sakari.ailus@linux.intel.com>
 <CAMpxmJU5dG49N2FA0oSQsOfKrCr3KQ1BisON4c+nUJJmZQG=bQ@mail.gmail.com>
 <20200311085555.GH5379@paasikivi.fi.intel.com>
 <CAMpxmJVPTKW+sYSJ3dnfF8nLAOKEa4Ob7bpxG0KD3Tkdm+rtYw@mail.gmail.com>
 <20200323213101.GB21174@kekkonen.localdomain>
 <CAMpxmJVdyTkZMVuhSy0Ux8VUYTmQN_YEfH-akQsAL3zrwiz8Dw@mail.gmail.com>
 <20200810082549.GD840@valkosipuli.retiisi.org.uk>
 <CAMpxmJUKSR-oCGnV1E5XiAMA2nYBy5f_f8=VSoMn0zf+qF39vg@mail.gmail.com>
 <20200811080009.GE840@valkosipuli.retiisi.org.uk>
 <CAMpxmJWziqW-PiJPSm6aH5aXbYktMJfVjJfvfGxv8fdbWKydqg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Content-Disposition: inline
In-Reply-To: <CAMpxmJWziqW-PiJPSm6aH5aXbYktMJfVjJfvfGxv8fdbWKydqg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Wolfram says. From my side: I'd prefer to see the
> disable_i2c_core_irq_mapping converted to flags first and then the
> flags extended with whatever you need. disable_i2c_core_irq_mapping
> could also be removed AFAICT - nobody uses it.

I haven't read the details here, just saying that
'disable_i2c_core_irq_mapping' is already removed in -next and also
within the next days in Linus' tree.


--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl80QggACgkQFA3kzBSg
KbZAQhAArYLHgzgk1viHELEk2aemBZfyspk3fR/1E5DiRGmmzwTvApTVbCqWAIfK
RAJ3EooeH+YZ4KDllbTg5WVDyPlObbil7Q08u9DwFbKijGBnJwpscB8xGAcUsRup
/DJcMl0mwXk12sO3pgEnbbJb/hNnr0yY5Mb8M32aXNNdojNn78XEqVYCMNXZJLXO
lBNtvNKwRgBnRfxg+R1BMMTQRtmsNtMUFE9xCUUZOIFUvWOTrrbrhtelg1cAxIHZ
JemOZcIRUikpvc4PKI12c8urwT53GmgrvDBft7mBmCFH5EIRQUjtFHFmC/pzY01W
97OcOVg9H7sCheilmvxgO8zzjVzaR9Xpw+C5StrmEfdcD7Sl/eEB7UBpcP0I29Vy
tqwpEdW0nCpKgwexQse02Do/yWmHmlvaXKQsoi0tOOoPdYzAwgUPEktCHeEPh8vE
tOc2ZIwK9F5c3+dEJDLuYSFWwoxmT+8LFkYr3tjLyU9FndqZA2FxEBuzhgx9TTbq
Q3IWJoZWOtT3mvNzrq8Y1SCFnHb9VombQob6cFg7H37yZM8WM7mfhB8uz8iHZAm9
Wj4H1LAxidd55WyvzslOTABupLA91nE2l8Kt17FfJZucV5gyRYiurYBRpj6/2NbF
JDTi0eo2W/JuMyU17XYBjrZYMa1KfnZO8xUpoY+DTzDjEcO69Bo=
=x2E6
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--
