Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A70647F46
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2019 12:07:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727845AbfFQKHY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Jun 2019 06:07:24 -0400
Received: from sauhun.de ([88.99.104.3]:55526 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727678AbfFQKHY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 17 Jun 2019 06:07:24 -0400
Received: from localhost (p5486CE69.dip0.t-ipconnect.de [84.134.206.105])
        by pokefinder.org (Postfix) with ESMTPSA id 273052C35BF;
        Mon, 17 Jun 2019 12:07:22 +0200 (CEST)
Date:   Mon, 17 Jun 2019 12:07:21 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        rafael@kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 21/28] drivers: Introduce
 bus_find_device_by_acpi_dev() helper
Message-ID: <20190617100721.GC3502@kunai>
References: <1560534863-15115-1-git-send-email-suzuki.poulose@arm.com>
 <1560534863-15115-22-git-send-email-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="z4+8/lEcDcG5Ke9S"
Content-Disposition: inline
In-Reply-To: <1560534863-15115-22-git-send-email-suzuki.poulose@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--z4+8/lEcDcG5Ke9S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2019 at 06:54:16PM +0100, Suzuki K Poulose wrote:
> Add a wrapper to bus_find_device() to search for a device
> by the ACPI COMPANION device, reusing the generic match function.
> Also convert the existing users to make use of the new helper.
>=20
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: linux-i2c@vger.kernel.org
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Acked-by: Wolfram Sang <wsa@the-dreams.de>


--z4+8/lEcDcG5Ke9S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0HZlkACgkQFA3kzBSg
KbaBHw/9E5Yuiz3lxNRvEtcUo1jwCtaX2BvdRSaSEqrNq/ORPGcut400uZTWAVF1
OKU0Cr459TChlC1nrRXlnaUAIW9IcfBoXArAFrUHZ0p13YGFMXGx6bSBDMnOTcBU
N4FurU7C49pFQUtFExquLbI3vDghhKp1BozLynwZlLpOkucuXF5tSG6h53qhQK3E
5ZFkKWxJ48/IBucKm/sd7XevwnzmVQMhDIAM7mC3ZIh2gVMmSIo1ckp1RWZWhVTB
XSkaVRC78L6uKrhghLJxgVjR/jJHfR/KhqRW3sImeNi7Ee4wVtd0qBKePYSLQoT4
XoZ//8hgRUuB3+6STEnbe/umVDTiMNra3EyvpfA8eisSOn6d0oJ+SwRolrB4yUGy
Wrv1BSN0HLeIc1kohZoonpRANHqAyhe4EwrEMpDxCsA9oEgJEIhkQxJB/NjImZ9D
J7ReXnoBkhwlowqrQJM19EacmBG3+SEOecGY4sILiP1yyujbX4kvref65ZV++Jre
Iy2D76p2pJ4UlBHcyandAruG9hHCxI2fUVLV9xPn+aGWMsErwyigW2quAL1189H0
70tbCqSExrtPFD7EEezKQst3PVt6j2/9yRp5IfJJ5nUT3az3nszCxdkcOQYWmYOz
SrMWr72UQttvTuiLgl/nXhl6f7W0CvLpOL11w91GfDuvWqpnmG8=
=RcVr
-----END PGP SIGNATURE-----

--z4+8/lEcDcG5Ke9S--
