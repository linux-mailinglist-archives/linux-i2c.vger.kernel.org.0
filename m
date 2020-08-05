Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68FE423C950
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Aug 2020 11:38:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbgHEJgk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Aug 2020 05:36:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:32904 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728439AbgHEJgQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 5 Aug 2020 05:36:16 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E29CE2075A;
        Wed,  5 Aug 2020 09:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596620169;
        bh=PXC5oj4W/B9mr7c3w63P1zXX/VQtgYJllrmir0NJ3ZQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZSMWqxQ0lKJmgpFMtV28B+px5xFziLMFK6tDZ5slFKNhbNveRhoUnnNvAHoTBqsA2
         NuI2ZNyb13+ZTcwlodcLvGjvFEsobLVroPKHOdhVd2bG73DuMhvZk/dhvjrjB0Fg4+
         iMN6tQhCg1rExjTkdbWcLs35A4bE+T+nPFO66cXM=
Date:   Wed, 5 Aug 2020 11:36:07 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 1/2] i2c: i801: Add support for Intel Emmitsburg PCH
Message-ID: <20200805093607.GN1229@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20200618134240.4091271-1-jarkko.nikula@linux.intel.com>
 <20200707153324.361be5e3@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="PZYVFYZbFYjzBslI"
Content-Disposition: inline
In-Reply-To: <20200707153324.361be5e3@endymion>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--PZYVFYZbFYjzBslI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 07, 2020 at 03:33:24PM +0200, Jean Delvare wrote:
> On Thu, 18 Jun 2020 16:42:39 +0300, Jarkko Nikula wrote:
> > From: Mika Westerberg <mika.westerberg@linux.intel.com>
> >=20
> > Add support for SMBus controller on Intel Emmitsburg PCH. This is the
> > same IP as used in Cannon Lake and derivatives.
> >=20
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Converted Jean's SoB to Rev-by (that's why I missed it so far, sorry)
and applied to for-next, thanks!


--PZYVFYZbFYjzBslI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8qfYcACgkQFA3kzBSg
KbailhAAkXhRnsyipaMvZMkHIx4fkqmaX4Jk+TXecVJ3K6x0ng3P3b9lpmiUsys2
kRHMWAz+k3XSZMkEaJLoaN5y8EG+ke5cbSXhOezf2CFx5DeyiklODvUWL/Oex1t9
/xHXDhWzb3T7iahnkqTpKFEWI29lZV+wtNfJKmycHqFHjsX0Pv7dqy4x3yBJGc6B
mNYRj1E+0+xsUkaA7XDiO2vHygpUmLg8/e6eS/RPguMXpfnQ4mN4sxhSmZYvJ8Ll
zZThyyKFBGUV5OGFhJmPORMQ0k0BRhKMGE9xY9VbM53v5/fvpd5Qt9pWuP4treVw
aFgIX+QtdEhEHVuZXDWSu1xhYs/jMsxjdH8UI202AMJ38EFyEp8IQG9hBPQKHInR
P4MDQoNmrW13mPi+YFM8rGNWVl7dhH9rSbvyhp1KHNwDGh4J3P+AIb9t1KrquVDP
BmslOHon9W6bgGX5ETRXc3eCPOvsYr8Wc8sgnGFhnnA13RF3Gn8qad031HVLiO7E
VBpBdGPC4dZCg0WRCxZjsRJraYzXKZUU7DgSTGCsS9mkoyv7thnNFCMPbOLiGpb8
ZANNtJEIkyFQ1fQ8RLnUu1AwQb23rHxqIWLnSWBamMLSgqvZ0oIH5FbKk+v5WYUE
QBL8IGanf5HWLQI9ah0hH12VNbAsRw7FD1W8vLPk4XamjJOA8Qg=
=Cd/Y
-----END PGP SIGNATURE-----

--PZYVFYZbFYjzBslI--
