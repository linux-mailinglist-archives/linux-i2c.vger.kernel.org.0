Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56EFCA94B2
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2019 23:12:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730871AbfIDVMF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Sep 2019 17:12:05 -0400
Received: from sauhun.de ([88.99.104.3]:46190 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730101AbfIDVMF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 4 Sep 2019 17:12:05 -0400
Received: from localhost (p54B337F1.dip0.t-ipconnect.de [84.179.55.241])
        by pokefinder.org (Postfix) with ESMTPSA id B12522C08C3;
        Wed,  4 Sep 2019 23:12:03 +0200 (CEST)
Date:   Wed, 4 Sep 2019 23:12:03 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: cht-wc: drop check because i2c_unregister_device()
 is NULL safe
Message-ID: <20190904211203.GB23608@ninjato>
References: <20190820153441.7693-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="aVD9QWMuhilNxW9f"
Content-Disposition: inline
In-Reply-To: <20190820153441.7693-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--aVD9QWMuhilNxW9f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2019 at 05:34:40PM +0200, Wolfram Sang wrote:
> No need to check the argument of i2c_unregister_device() because the
> function itself does it.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--aVD9QWMuhilNxW9f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1wKKMACgkQFA3kzBSg
KbYBDQ/8C7xWw763amsEzI5uNNh/GKrdnW5DZvBWQTN8XfrC5XZf45XAWdYENpcg
aJ0PU0Sec+MuTg/QanFx+toiNG/4DjWBY2Aa8PGzWYSWrsXtMIWPyrZqPkVreecH
5ySkJUnajWfMC442E63YZkUxgdB1GTsC+68QxHA0Imn0GkNrFRQuqwq1ugQ90k6r
UUYZKRv1DIRmSvON1X3t4A+9HURpUimHGdGmfNDw6T//FnolEWI8QEM+R351H9sq
jx0bCpe2HU0s4J36R1/kFvgvifxMMQ/qQCzswlkFVh5rkK0yeLWjLH2DVEfMV4rT
Bb73wEZyCznj+/mdVd6yKDR7jLjWlW5qFbF/SDslkoMrrBIQ5UVtjH+MWEqhfW8a
S/2ZlSR+fdHG2aWOGFxrquKGKocIEMY587wCtXLc7w0tpyRSYnPN2HJ5zw2utXGC
b2zjB5pmJC+ri5WUM/O0oSIy6yJF7/lehksEjoJaHk07PBPpZNL/KBvKMrdkVyOQ
/dkWqJD+R7IwS2Mq8sragO+3HD2HSiRKgVtQFojIu0uoQbSX2U/lYm/9LX34Sdri
O3H7Fs/W1z9PsI0qDEzVEng79mfqHqA1TcFnKB/FJ5x1e0EM+fHGtrBXAj6nMwN/
9SBAb3duuF35OuJiA0117kBh/T5iWxrITWtu77289rFRoCPDF1U=
=+L1D
-----END PGP SIGNATURE-----

--aVD9QWMuhilNxW9f--
