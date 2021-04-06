Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8205A355C40
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Apr 2021 21:37:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242696AbhDFTiA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Apr 2021 15:38:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:55684 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242767AbhDFTh6 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Apr 2021 15:37:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 491F8613DE;
        Tue,  6 Apr 2021 19:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617737869;
        bh=nd3UOZmwQsenr/t5/raAf6Th3zxlHmqSgqlN32BosPg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sxPqIANlre6K5WxSqiF8Wz2DC62XErL/Oi3D6bPM69rFD4HfNEeL8mAS7w3c5wDAY
         xgs+j8omDJSY+ms0zqOMnjtLJjuVqDDhL4qkwE6zuXMnXxvx8WorGkGNVz9HYy+5uH
         xFTQy+OsILr0G1IBXQQHazwmWT3YoZ7PAK6m2dRKJCZvJgkDz2pJGXz2/YwH4TPxsk
         5KHhIqen24+H3R+jPJS7GM7UZeAcyfmHdScwcNcl5T0IExfTQQwRxEEcH/SkQjNgqe
         szBrsrN2iJWWdDW7UDhJgXJ1JW79OfGUEmB4yB+HwnWWZfsG+cgGR+q2vK2aG5Qntw
         tVYa+cCNbMeNg==
Date:   Tue, 6 Apr 2021 21:37:43 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/12] i2c: Adding support for software nodes
Message-ID: <20210406193743.GA3122@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210329105047.51033-1-heikki.krogerus@linux.intel.com>
 <20210331092232.GL1025@ninjato>
 <YGRMHf63aHniHIJW@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Content-Disposition: inline
In-Reply-To: <YGRMHf63aHniHIJW@kuha.fi.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I think these go via I2C tree.

Good, I'll apply it this weekend. Until then, let's hope we can get some
more acks.


--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBsuIIACgkQFA3kzBSg
KbYHRxAArxAukjo0VnVJCkwy+qPSDZvqOAzglvb+ezqnfimdn6dYHlnLwIB2MXeF
U2JXXVHR6vJ5nXfZ9YYU5f5ZalXhhHJ02Td2s15vbe43I5jZ+Y44PNUATgQzsGwW
35v39AGPlTJGeihl2c1TETfKHOFVI3lcJAntaZLlBeShCFBtdRzQeWdgMFcR7IiV
3FaGCthx09nusoXw82a+2eGyk5BIRJtLycmmeK6LFVepJLRzX1p4Ua2+Onw7hSbr
KTOrAl5RuykmDwuy0NjaYccecc4o0wkmPiayfl5vX4EVl3TwFmLuLo0wVY9CPLW5
TcLIO1G9csL07ZD0xGdFNH2/8o/g7rPg7HHzose6D0qH45yAlPMhC4XD9ILaLWGz
WjZFGZIh+8RGQ6m92X/JM7eaFiOJI5qATZLBObuvXUMLDrJSnTzgu8f2o3Vt+EBX
pmunWVwjhsRU//lD2Gw+joxfGsUdH0yGTLf7vL1TyHhjFV5irO4DnM+xD5/f/Rcg
WpD6xneU64Ot16Ua/EtyU+wasG6JT/k3EOGYToAngNaCcQLr2IHHIxYwTqPhMIh8
Vq/rGgo1ANvmIi1nzwaCZMH5OzKhGtwlRqC5Vc6JQSNufH5MQ+NYah2aR0P1a0qr
K6zzUlPe+cnnp/cFq4MKez8nObk7bZWhS4KpEzhEagx9pk0rsrw=
=4twB
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
