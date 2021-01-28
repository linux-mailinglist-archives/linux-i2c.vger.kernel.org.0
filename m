Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FD7830727A
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Jan 2021 10:21:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232424AbhA1JUy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Jan 2021 04:20:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:51432 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232481AbhA1JSZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 28 Jan 2021 04:18:25 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1DF7764DD1;
        Thu, 28 Jan 2021 09:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611825463;
        bh=KLm4wo+HtSbrNHCKJ/zI7Q/uyUKm613jhpDefnBjTCc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cXApo3jzimWIpxwBqGNdyQEybpPRBqHgQ9PZnSB4RjOhMTb4N/tuILK5r+HTkXCyP
         rGax5AOP3ylP+wxTqxDpA15r0v+723HndGTP7+4La19gtxP4Iq52eNIlpztEOsEMga
         oXLhQbKXndEgq5t/8JiB1moGaNFDs23OuBaFGoqBY/PyHFTJ03xAoFpCe5vSg4lJab
         K+uvzi9o8FqIyLM1BmVaBOYweGroBUfAKC/5MYbnSsGU7E4TdCevBWyedTL6fVWsw0
         iLxxgg5efWJwReY4IMO+ylkjyQRI9Q2y3kIDJrw/Ip3elfLV6qgZbQbwucXkxM7mSI
         pPndFJUUeKEgA==
Date:   Thu, 28 Jan 2021 10:17:41 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        linux-gpio@vger.kernel.org, linux-i2c <linux-i2c@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "open list:ACPI COMPONENT ARCHITECTURE (ACPICA)" <devel@acpica.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>, andy@kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v2 4/7] i2c: i2c-core-acpi: Add i2c_acpi_dev_name()
Message-ID: <20210128091741.GJ963@ninjato>
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-5-djrscally@gmail.com>
 <YAVSf7+iTPNYf5XS@pendragon.ideasonboard.com>
 <CAJZ5v0hUELtKc9CK=z47XQvSAAx=wTWvoVwP-PaMqugaXaCgZQ@mail.gmail.com>
 <20210128090053.GE963@ninjato>
 <7e7a8614-3cdb-e160-b10f-8aa0e11b15e5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nywXBoy70X0GaB8B"
Content-Disposition: inline
In-Reply-To: <7e7a8614-3cdb-e160-b10f-8aa0e11b15e5@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--nywXBoy70X0GaB8B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Just to clarify; "open-code" meaning inline it in the caller like
> Laurent said, right?

Yes.


--nywXBoy70X0GaB8B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmASgTUACgkQFA3kzBSg
KbYp/Q/9F/nRbn3nFjrt5FM2/iCyVjGf2gclcksrI/3A5i31jDJYjPUOXw2f5kWH
Viv6eRE1An7Obe8s3ia3ZkL2xVHI0AHK4KFwPDTOdN8svzXqeNAL96wSRowmCoPI
jQoFthGD2Oq1/FyAPw/yOp1GSm+JwG+D0PNz6iJ1f7MgICd1INqyFd81B370RAyV
SzKhKLNS5jZG3S25N+M/EWcs3sEz4/oeTvD8RX7Ir593o3fW7J/z2LJD/6YySpMX
VypgMsMUn/1iAqOu5vA/Edc3ltiqMFRtjNgjTGlpCzSfsjEDv9hkI3/ZA6Q9XI39
T6uRnzjRX0LWCO2GInKiRgJ9pFzS2EFrO+Rhr1SShALqdcbLoRCC7qX7ecA+F2bf
488MZFAEURUnMaY6Yf7Iz2wIFE+EraToQsbW4OICydoqZpX2wfKonpT6JtPHjV3D
eVYvwLMkIgDd3sNqAj6kt3qP76+DoYSCetryy0teyC6uDnt1Ql01QBn9hHljvhbF
TCHzO0E/3MyOi1gwadmlQLTJSD+dyD45SYStpP1yTaURXLLV81DDeHZrGe3ao1PN
AEgHP0XMXVdMMTo2z6gGc7kEtMhfK0Uy8UcWF6VhmsGFtXvtZCa9a/6oYKgky7rT
99zeypU23JYVD3cfuGlm9hInMH+2Ed7n2F5RWKUbeQm9+H+b378=
=RtKi
-----END PGP SIGNATURE-----

--nywXBoy70X0GaB8B--
