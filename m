Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D06E3B6640
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Jun 2021 17:55:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235691AbhF1P5z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Jun 2021 11:57:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:33784 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235132AbhF1P5a (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 28 Jun 2021 11:57:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D4CE0619F1;
        Mon, 28 Jun 2021 15:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624895704;
        bh=BZuJnGMzXGdi218jt3UPqq3NZRayiGsbTHOZS5cZ8/U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WaukQ9q03KqTB8hunoOr+0ZwhRJsJlBZBS6yWjzUxH28lCvRHfTEEflq7qXa7d2ER
         CCPT7QRzbyi5zP/4tZPEDr4ACIeFW0hKPXbugvaPgaXQ5UKi0784LG6V4KKkfSbiyY
         5pM2OZzgGafYokY2Lvb5htCqpRph8lRnqnYdDVz0x9yNngbGdXBHeAJFRnSq/ctE1Q
         qjusZWrFfVQzOm/coyXLkNxvGn4ou4qVF94wZB411O+MnFaErMI2Iag97agrhGTcrS
         +fyjg9sLN7Qatd3ld6E4pdsKFKQQQwi0CZfhePRRgCZ+pwo+j+vHCIoeXOYEvxKqBv
         jgLdc6Lkt3QzQ==
Date:   Mon, 28 Jun 2021 17:55:01 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-i2c@vger.kernel.org, Jose Cazarin <joseespiriki@gmail.com>
Subject: Re: Device match data and DT compatible string fallback
Message-ID: <YNnw1aqUk/zVkz4j@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-i2c@vger.kernel.org, Jose Cazarin <joseespiriki@gmail.com>
References: <YNnq5ljCeSbBU7cQ@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="PUUCDsFdCVjDdx06"
Content-Disposition: inline
In-Reply-To: <YNnq5ljCeSbBU7cQ@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--PUUCDsFdCVjDdx06
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I could fix this in the driver by calling of_device_get_match_data() in
> the probe function with dev->of_node is not NULL, but I feel this is
> really an issue that should be handled by the framework. Has anyone ever
> given it a thought ?

The of entries should also have .data entries and use that.

The driver could also be converted to probe_new to become independent of
the i2c_device_id.


--PUUCDsFdCVjDdx06
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDZ8NEACgkQFA3kzBSg
Kba7TA//YslQeXDaO0OQNiSK2BETtLtePajcne6CHHG+h0WjMhIncG8yZ26gPBT7
Sb9e1NV4IpjBRIz+/F/YuVlB5/UI+SQ+31X50PqvyGpcy1NJL9u1nhEUQTfKSNea
CuG5020X/9TdH0Y1H+PIctspKbA8cW3qWOkuZkRunNsROxi3yCYzYp5Sy4DQAJ1C
Z6GgiE78jYHeqjiJjk96wBTLulhg0q2W/Ec0h61PB56Lu4gWi7QZh/cI1rnawrQJ
fRZkQJFCU4noRklEbOamRMkWt/nLQtFkxqBKJgwXBuRnMUZxieyGmlB9zapzXkRb
PN0IP4AR870lDf7A1WoAZfWGoRNo9vqgr86hVWxMLPBJ3MwuHQKWB6pM3Eu8gLZv
+Qc7P3Zqf9qH35is/HJSJAV/P6pzVHtGwmW+JgigG0lDL4IykBF4VFTH+ihQgr9O
sZduiA1V3DxWxdwMr7LdkKUQg1kC9wU4b41a7J6go+zsIJKHXs0ooclBb6mPyoGN
pooD0DfoOLWxa8bslijhjb+V4U3xaXoC0+Xg+SzbKhmgjaT+sPyxJkGl7Ng44MHO
tlLcpD9iCWsih/vqhPvl1xgZRONk8QO3wqbgdNnzivXqUT5iYBpJ/FDTe7ih+4xD
3MAUZJgMUtpUoR3aQ3IIKNXTiY40CRPiZwuJVpbC0v4e30cGpTs=
=GcTV
-----END PGP SIGNATURE-----

--PUUCDsFdCVjDdx06--
