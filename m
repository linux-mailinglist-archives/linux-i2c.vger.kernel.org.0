Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D61D625770C
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Aug 2020 12:00:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbgHaKA2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Aug 2020 06:00:28 -0400
Received: from sauhun.de ([88.99.104.3]:32800 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726081AbgHaKA1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 31 Aug 2020 06:00:27 -0400
Received: from localhost (p5486cebe.dip0.t-ipconnect.de [84.134.206.190])
        by pokefinder.org (Postfix) with ESMTPSA id 8149E2C0537;
        Mon, 31 Aug 2020 12:00:23 +0200 (CEST)
Date:   Mon, 31 Aug 2020 12:00:23 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rajmohan.mani@intel.com, Tomasz Figa <tfiga@chromium.org>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
Subject: Re: [PATCH v6 1/6] i2c: Allow an ACPI driver to manage the device's
 power state during probe
Message-ID: <20200831100022.GB1070@ninjato>
References: <20200826115432.6103-1-sakari.ailus@linux.intel.com>
 <20200826115432.6103-2-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bCsyhTFzCvuiizWE"
Content-Disposition: inline
In-Reply-To: <20200826115432.6103-2-sakari.ailus@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--bCsyhTFzCvuiizWE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +	unsigned int flags;

u32?


--bCsyhTFzCvuiizWE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9MyjYACgkQFA3kzBSg
KbYsfw//UgYn/PzkMeyk6d+Otmk/8HU9JGUA7pWj0FokOdh0mJkaa1DEFXAzLM01
HUyJhdQiW7lTW0eaDT2SNwq+FubadRMjoCpmQRrRo3+LPEaxGtpYv/2bdZncvIx2
unefFvMjag2MSW/cacSa3Q6HvzlwCxAQ63gK8tdosSDvOkhQOVek05kSE3FG+5GF
Qxc7YLCASq23/MPeRiT622hSUbsNZOW60VU3TGeYmmO2SduKJiXuni9vsPLoIhOo
Q8hrviC3rn7Ai0UnsKNQs0g0vMT8gm6oLiKe1pKp5s0xlqUSmHmKyhYSJkNIQHwd
W78v1Dwp5k733YXQ8QH2i4Y0cCIstTqx68tgZhfbH6C14gNJgB8xSAQDjEuPqPcQ
GJJDh4hCuF2F1hUN/4zwranxM16B7J9PmF2hN6li3YJKPKVlmltPGx0MDvKHBnBY
32WfDVw4iEOIvN6zMoYmaKBeW4+Tcfndb9JuQD9Qy120VXDoCqLXTcNO16O7Z++e
9RhGEFVAtDauB55rnEkZ1J5+ueyxo7BpNi+E1oyYacsVbuOCrUA8GKwQgqR06WFf
WGJ9aO+IElSgiwBksTlVYJ3hnG0nrM8auo+hFle5g4Pk/XHgS5m4zJYNgSkn8uPL
V4drgFiV93hgYgYb1DHPyaZRRXmkHJV2kWp+as1qOQMa4pXORoM=
=gT6D
-----END PGP SIGNATURE-----

--bCsyhTFzCvuiizWE--
