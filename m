Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B5495839B
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2019 15:34:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726370AbfF0Neo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Jun 2019 09:34:44 -0400
Received: from sauhun.de ([88.99.104.3]:38636 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726832AbfF0Neo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 27 Jun 2019 09:34:44 -0400
Received: from localhost (p54B33130.dip0.t-ipconnect.de [84.179.49.48])
        by pokefinder.org (Postfix) with ESMTPSA id 230072C3112;
        Thu, 27 Jun 2019 15:34:41 +0200 (CEST)
Date:   Thu, 27 Jun 2019 15:34:40 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Eugen.Hristev@microchip.com
Cc:     alexandre.belloni@bootlin.com, peda@axentia.se, robh+dt@kernel.org,
        mark.rutland@arm.com, Nicolas.Ferre@microchip.com,
        Ludovic.Desroches@microchip.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        pierre-yves.mordret@st.com
Subject: Re: I2C filtering (was Re: [PATCH v2 6/9] dt-bindings: i2c: at91:
 add binding for enable-ana-filt)
Message-ID: <20190627133440.GA7158@ninjato>
References: <1561449642-26956-1-git-send-email-eugen.hristev@microchip.com>
 <1561449642-26956-7-git-send-email-eugen.hristev@microchip.com>
 <4e81d3c9-25f3-ca6e-f2d5-17fad5905bb8@axentia.se>
 <84628b5e-bea7-7d91-f790-f3a2650040fa@microchip.com>
 <20190625093156.GF5690@piout.net>
 <20190625095533.GC1688@kunai>
 <20190627132200.GK3692@piout.net>
 <eb2d87b7-437c-53ee-a1ca-37c4d3fadea6@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Content-Disposition: inline
In-Reply-To: <eb2d87b7-437c-53ee-a1ca-37c4d3fadea6@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Apart from enabling the filter there is indeed one configuration
> > setting, the maximum pulse width of spikes to be suppressed by the input
> > filter.

Yup, this is what I anticipated.

> This is a number 0 to 7 (3 bits) that represents the width of the spike=
=20
> in periph clock cycles.

For a generic binding, we would need some time-value as a parameter and
convert it to clock cycles in the driver then, I'd think.

> I am looking to see what is PADFCFG , as it's related to the PAD analog=
=20
> filter configuration. It may be unused by the filter.

Thanks!


--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0UxewACgkQFA3kzBSg
KbbBxw/+PKlsndFyCPTuBvbsZv6QYFNcJSE6IMOwxnfLjInOoY8cAl/2uc55yh8K
uVXgbOdp9bQEtjjgva8oMOZdT+8N6EOqm+Bjqu2Nw44UsQ6HQXUM+LJU9J35Me4T
USjBCsZL+3rf9SUBq4xDSUa05wBuKN0ZC1Mss55kkBD/R4ULrd9VoVx0rpSe6oAF
/XQeBDsWhqDG15zoZysXgQ/he7kLCGgtPf+dz0vA80JefsflXEyrr3Al9rggVP/F
gK3+4UqBE8YLn0Iepd0HKsk7z3Qs7uLfjZex7fbd9Ul81JCN2yHn4PFIuV+NJf86
C7Nh7zYojp41vxBF1llxMvm+2E4z23KkQ/SKmTqOshOxxEcYH2OdfvuWPyLBctHr
Ex3IKFo/wESvBs12NPz1AAC/EadHG6elpaHNkdNaGjWMA4eIchDF+vaVXVsr34gT
FYSfwVLHx4WZEKBzF+jWds5EBUbNWhSF0+e5vBOkL6BsGJpU5PTgxuvbO3L6jqCj
nbCIkxFFM+pJCcwnb1eaDG9I9IUb1962hciz4tjFWMLog+QJdtWrwSk+az1237Jc
0okdeuwS1ztxn84GLBuELSkDizc0GlYEJbz0+ICd2ZLXXFRwytpC/b3Sj/QgGOWM
GNZtPtRGoadH2jxHySVRG+j9veFm1US51dR4b25SHUzlWyAR62A=
=tCqi
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--
