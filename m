Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CCF643E606
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Oct 2021 18:23:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbhJ1Q0U (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Oct 2021 12:26:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:50672 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229764AbhJ1Q0U (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 28 Oct 2021 12:26:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EA77860FC4;
        Thu, 28 Oct 2021 16:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635438232;
        bh=EmYTJJ13B1E0RoYAnyAeh+HhBWdvFaVem0sUg5GqFGM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G6LtmcdXJ459KQFzVoJF0jBK73tHKjzTD8vNHgrMNQ0QSuWwkTEAGpUATccGgdpHN
         ZVLfpef9jVL54epUkK4pbPR+qt6hwwXnjInXMaAlirwq61ucyVRKU0xi0SKu6lyFJw
         ikAUdEvBYyNdsHeN9fpAOdWZun2R2Y44cD2fiEB3OKX3zt3ngyztRzbabOe2mP1oDH
         Q7xrDOWz2AYO+r76ARD1eZBHMuHBrbktzlj3bT/s0wVW+l/O73FnxPS+8tXZmn8uii
         dlln8VX05VaKkKqh7J2rRhafTuDVT/iG5lQTTLnGWshTacoyjL/6J3dGqgd2TtrvmC
         qnfn2zsxYimdA==
Date:   Thu, 28 Oct 2021 17:23:45 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Len Brown <lenb@kernel.org>,
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 04/11] regulator: Introduce tps68470-regulator driver
Message-ID: <YXrOkeudAzQZezKM@sirena.org.uk>
References: <20211025094119.82967-1-hdegoede@redhat.com>
 <20211025094119.82967-5-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HICPYDh+BDn1Q9So"
Content-Disposition: inline
In-Reply-To: <20211025094119.82967-5-hdegoede@redhat.com>
X-Cookie: try again
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--HICPYDh+BDn1Q9So
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 25, 2021 at 11:41:12AM +0200, Hans de Goede wrote:
> The TPS68470 PMIC provides Clocks, GPIOs and Regulators. At present in
> the kernel the Regulators and Clocks are controlled by an OpRegion
> driver designed to work with power control methods defined in ACPI, but
> some platforms lack those methods, meaning drivers need to be able to
> consume the resources of these chips through the usual frameworks.

This looks good to me, if you fix the issues Andy raised I think it's
good to go.

--HICPYDh+BDn1Q9So
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmF6zpAACgkQJNaLcl1U
h9CVSAf/QLg3eJMYmRs2uUC6+US55NacBhv8/h4hQIYq+5JYfFBGFezL99DqwPEq
j8N+Z6p+wdcgaxqBB79CGBBt4mEC7gvnnk0HluM/mKS9jNfu7WFhE2NgUHmPgVHW
OfyXfL3Voi9GOGquXkNquLKiTSmSf+Osxrx3w9FPMyIHZpbABtXxoYNolUUZKIqM
Qw4HIuk79CHl6Obh1fIYS9waZJF35bSwTIJO1aT+GaJjvicFDlcI5DbvVmRpaKgM
O92Z5nzihMQGx6YYh6WJEydowJQCo4l0arsbxa38AGuXS/FzaXkAwqnw163njuYg
GweYZ9VJx2P7RnluQUI1ED9BwPUDcQ==
=p/X5
-----END PGP SIGNATURE-----

--HICPYDh+BDn1Q9So--
