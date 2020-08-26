Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82C0C2526BB
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Aug 2020 08:14:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726040AbgHZGOs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Aug 2020 02:14:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:46752 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725786AbgHZGOr (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 26 Aug 2020 02:14:47 -0400
Received: from localhost (p54b33436.dip0.t-ipconnect.de [84.179.52.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 97E8C206FA;
        Wed, 26 Aug 2020 06:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598422487;
        bh=49bBfzJ0v+qJasfusLzXWkh70Zib8QKIhWug9Dvwlmg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=O8u9cTodiav9/5/uP9JrzGmXxnudMVcpy4d3occvVrX6f8H99soSLyI+MDGAYZRB5
         Z28E1Jc2+mNow1kniqA+dqyDjeptyQ9Ilrm25IDtW01AWqv0p0bKusZiX74vo7lQE5
         uoeEC/KzlsT0z26TFgL2ySaUWeHZjaHj0YC8cpKE=
Date:   Wed, 26 Aug 2020 08:14:44 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Codrin.Ciubotariu@microchip.com
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        robh+dt@kernel.org, Ludovic.Desroches@microchip.com,
        Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
        linux@armlinux.org.uk, kamel.bouhara@bootlin.com
Subject: Re: Re: [RFC PATCH 4/4] i2c: at91: Move to generic GPIO bus recovery
Message-ID: <20200826061444.GB1081@ninjato>
References: <20200619141904.910889-1-codrin.ciubotariu@microchip.com>
 <20200619141904.910889-5-codrin.ciubotariu@microchip.com>
 <20200802170820.GC10193@kunai>
 <65890aab-1d19-7e7e-abff-3c6ee05c8ade@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tsOsTdHNUZQcU9Ye"
Content-Disposition: inline
In-Reply-To: <65890aab-1d19-7e7e-abff-3c6ee05c8ade@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--tsOsTdHNUZQcU9Ye
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Thanks, this would be great! I tested this on a sam9x60, with the HW=20
> feature for the 9 pulses disabled, with a picky audio codec as I2C device.
> Please let me know of the result.

I can't make use of the feature on the platform I had in mind, sadly. It
doesn't really support switching from/to GPIO pinctrl states. If that
ever changes, I will add bus recovery for that controller, but I think
this is low priority.

On the good side, there are patches which make i2c-mv64xxx another user
of your new mechanism, so everything is well, I think.


--tsOsTdHNUZQcU9Ye
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9F/dAACgkQFA3kzBSg
KbYNJw/+NFAFce8+QOGLjzXTrfZC+xhRwteAfXf5szBpChtCKinehTdgy/VIPABE
DvkKYf5ocko7S08+wPdXNeeCX6CDglhgeBB89fW1MVOzIoiTcQ4TisNWegjFOIcD
bbrMCoDObXs3PvnpaH58u3x10O1TXvPBZchywcmHT4TnZ8KwvdWOV63cX7ZNoYtE
bJTuQaBJwgsisfCrOqAIw1w1hQ0/+9wln56NlAktwGR2hQfUfmXU3RrhmYssVHao
Pc975YvoyRN4OJlwz8eITEfWG+2NcazKwT28Mv5LJU0Q7h5Tau4rwjzfU2Op32bW
h4E3AV80ocUML8etDOfFYEc8N5biVOMURyJWxM2OaipIpfGoBkT9BTswvd61q3+R
RacGLtRmaFyLtjWLndRy9DVZ1V+B6KsdGugQqABrzOwiAXK3OMf965427aI7v60B
S2ZrxK3QhFTctotYAqHm7wCzLJNZBchSZzxYgJDEwuscbAbN7dBECdiCAfPYyO0K
R+YbY6TuFZwBaEhKmJQ9IP26DB+Av5963X9CjU+e+nUxaPr5Nq/cS3sD5ku3bgGJ
kJtaaM6fG9M8ZLa5bzOKQlOR1B4/Zojp5KCk4vTUhUzV97VX0VfaR8J7D4/k+Cal
dF/LAlikTn1TZmLiLdYZrUFu7FPU9JTvXET48Uoa2s9vEPFw7rQ=
=+8C1
-----END PGP SIGNATURE-----

--tsOsTdHNUZQcU9Ye--
