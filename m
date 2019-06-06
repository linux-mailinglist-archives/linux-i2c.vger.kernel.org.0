Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83B1C37DCD
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jun 2019 22:03:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728258AbfFFUDk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jun 2019 16:03:40 -0400
Received: from sauhun.de ([88.99.104.3]:36742 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727082AbfFFUDk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 6 Jun 2019 16:03:40 -0400
Received: from localhost (p5486CDEB.dip0.t-ipconnect.de [84.134.205.235])
        by pokefinder.org (Postfix) with ESMTPSA id 4ED692C35BF;
        Thu,  6 Jun 2019 22:03:38 +0200 (CEST)
Date:   Thu, 6 Jun 2019 22:03:37 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        rafael@kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [RFC PATCH 22/57] drivers: i2c: Use generic helper to match
 device by acpi_dev
Message-ID: <20190606200337.GA8739@kunai>
References: <1559577023-558-1-git-send-email-suzuki.poulose@arm.com>
 <1559577023-558-23-git-send-email-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Content-Disposition: inline
In-Reply-To: <1559577023-558-23-git-send-email-suzuki.poulose@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> -	dev = bus_find_device(&i2c_bus_type, NULL, adev,
> -			      i2c_acpi_find_match_device);
> +	dev = bus_find_device(&i2c_bus_type, NULL, adev, device_match_acpi_dev);

In general, this looks like a nice cleanup which I am in favour of.
However, I didn't understand why ACPI uses bus_find_device() but OF has
a seperate helper bus_find_device_by_of_node(). Why this inconsistency
of having a seperate helper here and not there?


--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlz5cZQACgkQFA3kzBSg
KbYI6RAAmuWimkzjk/bPvsyMSJT3Pdc1H0CMg9BNC6Bd2OqG7K4a1PfRpVueZddY
5OVWpmoHhEjXBFHDqI7inEhQ61ecuwlOeM0qIJEq5uU7CQKrEjgOc2BWp1AeiEr0
+5YvEVnIdSikPDL6M+W2fWGiyAt1hgxM+Dg9M4qmuQhU9EvJnvTuA3bw5/ld4Jtb
tx9MaBAwvuzXwIwHN+95neWe7uTB5jrB3Asiuj3F2R48aOytMQgFLVKL+bLAziJM
JJabLD0K7L91r1hSPnNBpHmcHGL/MfaUFoEA/Ne2l4bucK6c1ni9y42UF8owI51u
y8UT3l+1iANReVlZZ6Wqc3tQtNV4R+8uUq6sA/so3Uq/tO3FPLLoXNbv/Vq5HZU/
UKWeAUkLGdBJ+9kL8XheUPVFL7OxHlab61DmvRDKnrQwZI0Q0FuVFhWEXdeAXI0c
wnBcPzhTVb05mmym6z59aMcLWEQVo+uZzlNPAWpm2NMUaHWtGji1/tXdWJWKSU4H
zucPjBz4Co0DAr4h/kLfmaLhvuV3dlxLtbMyZxytTPmERbXJu1kVJJURG8fxUviK
QZvGDKbuRpHvyU7bzV/qvtSgBFjKkt9cpnMBe1x0OylV3R7hB5dInbuwfOQcEa6v
loX4SLD9M8rMN4Z9c5CYd0BnR8Fe3DiVqU1IVO2CEh/5lkmvT0U=
=7meo
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--
