Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0283FA5D37
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2019 22:48:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727320AbfIBUsp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Sep 2019 16:48:45 -0400
Received: from sauhun.de ([88.99.104.3]:44050 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727183AbfIBUso (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 2 Sep 2019 16:48:44 -0400
Received: from localhost (p54B337C1.dip0.t-ipconnect.de [84.179.55.193])
        by pokefinder.org (Postfix) with ESMTPSA id 367C82C0165;
        Mon,  2 Sep 2019 22:48:42 +0200 (CEST)
Date:   Mon, 2 Sep 2019 22:48:41 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-media@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Peter Rosin <peda@axentia.se>
Subject: Re: [RFC,v2 3/6] media: dt-bindings: add DS90UB954-Q1 video
 deserializer
Message-ID: <20190902204841.GB7253@kunai>
References: <20190723203723.11730-1-luca@lucaceresoli.net>
 <20190723203723.11730-4-luca@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nVMJ2NtxeReIH9PS"
Content-Disposition: inline
In-Reply-To: <20190723203723.11730-4-luca@lucaceresoli.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--nVMJ2NtxeReIH9PS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> + - i2c-alias-pool: list of I2C addresses that are known to be available on the
> +                   "local" (SoC-to-deser) I2C bus; they will be picked at
> +		   runtime and used as aliases to reach remove I2C chips

After some internal discussion, I have been kinda convinced that it may
be better to assume all non-described addresses are free to use and
enter the pool.

The problem with the binding above is that you may run out of aliases
depending on how many aliases one to-be-attached module needs or how
many modules will be attached. And another add-on module with
non-repogrammable devices may occupy addresses from the defined pool
above.

I am not perfectly happy with the assumption that all undescribed
addresses are automatically free. That also might need DTS updates to
describe all clients properly. But this change only needs to be done
once, and it will improve the description of the hardware.

So, I could agree this is the better option of the two.


--nVMJ2NtxeReIH9PS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1tgCkACgkQFA3kzBSg
KbZMQQ//RpP2dX+xa9Yjy+mG8Yo5Ot+EZMlLQ5MflnJP9nZDui1leHVK/NdajRYu
3o+VDyfMhL3pA9HBN9aGSYAPT9M2lxv+btfQ6xGXV8yeqvreHVjb1Nt5u6QLfoxn
cjTQSAes77cd8FgtMwtw52JeDBMJ3XZxy0VrEnwteG6MTVOzf6zPGwWH/j+SW6QC
wsIGfTJEfQwn9SBRcHKrlLsTKua5BWyis78bN6xdnnBUoW7VtbTxsDAOYS5g5K1t
FOU9mcw5XORab0mz7Khro+j9GaiAH6EQuKNpVq3w0zJr/+wqGfB+5tudArGpz0Jl
hKJfpghYUElX60Q1v2A83iFO+VQ4toKbIdoJCZbqKf9f181/BJFQ2LlelVv2dGa+
3Wl7bJYbzGgDgxzLXj6ef4nSwoIdc+3Ws4BwsBgYTIlrJyXYjR4/SstsZSysICgW
2vlYkpwJbEAmbtCRu2JsPrx1+CK5bkbvdU3bS9p/gk3RlUk/CmO2pL9dSERANYpL
DMX/PSA8FVGOrvenhUoZ4LPdjm6EkvZzp/2fcFIMu2J88G4iG0+hPGzlPdI46Uzy
5uI6CBc2KQuGGyebs9CoJCJM8j8Vc5yxAXkOdjNap9oSKz9yACaw79F3GvEojgqX
ObNivNSPA1l6gr3+PML4D6VwdYxAFcy+4T0y0QKemvUSKLkxBzU=
=AIwW
-----END PGP SIGNATURE-----

--nVMJ2NtxeReIH9PS--
