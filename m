Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9197EA3764
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2019 14:59:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727924AbfH3M6r (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 30 Aug 2019 08:58:47 -0400
Received: from sauhun.de ([88.99.104.3]:53666 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727522AbfH3M6r (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 30 Aug 2019 08:58:47 -0400
Received: from localhost (p54B335BE.dip0.t-ipconnect.de [84.179.53.190])
        by pokefinder.org (Postfix) with ESMTPSA id 5A9932C0095;
        Fri, 30 Aug 2019 14:58:45 +0200 (CEST)
Date:   Fri, 30 Aug 2019 14:58:45 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        Ray Jui <ray.jui@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Lori Hikichi <lori.hikichi@broadcom.com>
Subject: Re: [PATCH v1 1/2] i2c: iproc: Stop advertising support of SMBUS
 quick cmd
Message-ID: <20190830125844.GD2870@ninjato>
References: <1565235473-28461-1-git-send-email-rayagonda.kokatanur@broadcom.com>
 <1565235473-28461-2-git-send-email-rayagonda.kokatanur@broadcom.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Km1U/tdNT/EmXiR1"
Content-Disposition: inline
In-Reply-To: <1565235473-28461-2-git-send-email-rayagonda.kokatanur@broadcom.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Km1U/tdNT/EmXiR1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 08, 2019 at 09:07:52AM +0530, Rayagonda Kokatanur wrote:
> From: Lori Hikichi <lori.hikichi@broadcom.com>
>=20
> The driver does not support the SMBUS Quick command so remove the
> flag that indicates that level of support.
> By default the i2c_detect tool uses the quick command to try and
> detect devices at some bus addresses.  If the quick command is used
> then we will not detect the device, even though it is present.
>=20
> Fixes: e6e5dd3566e0 (i2c: iproc: Add Broadcom iProc I2C Driver)
>=20
> Signed-off-by: Lori Hikichi <lori.hikichi@broadcom.com>
> Signed-off-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>

Applied to for-current, thanks!


--Km1U/tdNT/EmXiR1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1pHYQACgkQFA3kzBSg
KbYqPw/+L16sbeg6ZouyXIds6l9vBvd5ZpyTng7F7EMmGA5qkOQ7Dxk5gtWfW7xL
edvDOfUZOeQRw8IAJBTxUDl8Brg3UBnD16skm0aiOlwCFoyrDmCBQ3/BX6q1mFOF
nbhX0YZRzK+h45anQVsOJ7td7A1F+29EwBu39CZDCbcHzbLmYbOi6/jem4eXZK5I
r3Mk+DhvQtGeDEQEHE92b3WlUGNTVZswssk/OhF/r0Wzc890BYO6/aK2Ux8oFTnw
0mf02w49uhjub9+qeX5yq8vKFD1UyYC5wI6QOWJtuJyj9pXcigzA29T628PjShjI
wlHpGxoVEvzvdi6Ho6wlXwwiz3yNLRT/Hn4fsVDd3os3oHJ8NmFCJqMZMWZv5tyv
d9CLV9FCW9aCMiEyTcHNhwNVSrig++NVYcZcwpAYZyVqIC8s9QWelBMk2veog66K
wjreG6p9d5EZXV2y1Uowff31ZUMWColTayrYXMY4u+Gk2y3MuCunH85oFfH2MLEQ
w6+FS6VVysmJ0YkugyodtVyKIsyYGRcatEYPF1U7MrP67lJLHYw2dnP1JhgrHkx6
wqmMths0bmxu1xu234RD+IeGfZyM7/EqpKH2mSmGXy1Nu6hdBMZm4XNMEFXDlqO7
ruZiI7elM4XeMAZppEoW84Ja9HQrvqM2a2KmVXBpORQP2JBghqY=
=rbvx
-----END PGP SIGNATURE-----

--Km1U/tdNT/EmXiR1--
