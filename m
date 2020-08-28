Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 254112556A0
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Aug 2020 10:43:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728218AbgH1Inr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Aug 2020 04:43:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:39400 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728016AbgH1Inq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 Aug 2020 04:43:46 -0400
Received: from localhost (p54b3345c.dip0.t-ipconnect.de [84.179.52.92])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 59A442086A;
        Fri, 28 Aug 2020 08:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598604226;
        bh=0eqHzFOsCGMrQD8DfXLrQR2u63x+QxvyBrrvxlBWyII=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U3ttdXKJGih5z6fpCL10+RbUReRyPoU1Dqeh5QVGnoxOed3IjquUGGo0uPYpNablU
         SZQEcA8Zhp1gSMWLnUqjlJX+6Tk0o4DFBDjD8X6pCfCdPRy/sTCjvkTYhlJ7NO+It/
         UZxZf3cqoQwyJCMzYPy4CYxRebw+azNv8pKQ56Qo=
Date:   Fri, 28 Aug 2020 10:43:43 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 1/2] There are several eeprom drivers
Message-ID: <20200828084343.GF1343@ninjato>
References: <20200827152523.6cc67392@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dgjlcl3Tl+kb3YDk"
Content-Disposition: inline
In-Reply-To: <20200827152523.6cc67392@endymion>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--dgjlcl3Tl+kb3YDk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2020 at 03:25:23PM +0200, Jean Delvare wrote:
> There used to be only 1 eeprom driver (named "eeprom") but now
> there are 3 and the legacy "eeprom" driver is not the preferred
> option. So list all 3 drivers in our documentation to prevent
> confusion.
>=20
> Signed-off-by: Jean Delvare <jdelvare@suse.de>

Oh yes, that is needed!

Reviewed-by: Wolfram Sang <wsa@kernel.org>


--dgjlcl3Tl+kb3YDk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9Iw74ACgkQFA3kzBSg
Kbaulg/+L1cLL8kJsLARPk6hVFXBOYNCalNSrZ9lrCv0ql89frY92JEaTQCukiAc
AzRawZ4o84MUmhtJRBBVpceskdba/TrTPSNBKfyoWoMQ/3d5xWx7xlGK902HLiRo
cm1JVn90Cq7oaElpF9FeAYVj2Ua8MGROj9THgTebW5WnAbDoix+tilLQXdZzqoGY
PlecUM8i4apUyGK0MklY8HLANfUGrX4OCYWppyGQL4t965LVxdaREmUSwVMC8JAp
bOh+mHLMwS+aRuFqEdk8lr7R6dGQZksjkYm/T494Zq0j5a1i7mAhAR5qlMzLFdsv
KxRkErd1Ktamofhg3K4JhcFg3mP5yuWlbayLD/ITVQ5+4tUOB0Fjm7mhbPNk0txq
kh5NjSJcGJOopVBhxbb1J/lg1oUiQTyb8gGsKfDol5rvjm8x71VK3RRZEnrMzYY3
VPiKNF0vEYeyb0zpJ/BEtJtuU8bzg8XMoAkTC8COOpFF6L38HtQ5yIpVqjoM80/g
VJmYsmCxCoyLNStSSpCyP+9pg44UrhaDTSyXbmZjompKdIzkrKQlZ0eD2gqks360
FNuvpJB/LdKhr1FHT9H5igi/P8QkL/h0T/4HmsD5EUJNMQGkwtsC74A0VsgE3+NH
8ULC2+BaqdMY/nEeEEFypAj1wT+id+sX1eFRTG1sGY3+rZq3uqg=
=5sJW
-----END PGP SIGNATURE-----

--dgjlcl3Tl+kb3YDk--
