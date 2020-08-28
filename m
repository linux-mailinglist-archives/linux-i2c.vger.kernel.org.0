Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00E842556D3
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Aug 2020 10:47:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728362AbgH1IrH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Aug 2020 04:47:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:41220 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726834AbgH1IrG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 Aug 2020 04:47:06 -0400
Received: from localhost (p54b3345c.dip0.t-ipconnect.de [84.179.52.92])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3D9352071B;
        Fri, 28 Aug 2020 08:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598604425;
        bh=BhiFxyMsrM8W9kLzXRr3grqHfMTD9BB3sUDdh3vk+i8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WaBqKIXsX2WBhVnqLM8ajbHetc+GRr6eBi/vvLcFC19Yl0+8whrHLxTOF9ePLP+Rh
         G1yhe5BDiAadhHLqWkMnLwgsUb6mUVmZbbWnVkYYExdNUC7sgB1SRsV1oJHs93jgev
         eLVFd/5OjLRZmkt6dPs+AIGYt+E1IMtIINZOm7Ts=
Date:   Fri, 28 Aug 2020 10:47:03 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 2/2] decode-vaio: Add support for the at24 driver
Message-ID: <20200828084703.GG1343@ninjato>
References: <20200827152523.6cc67392@endymion>
 <20200827152842.44105002@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9Iq5ULCa7nGtWwZS"
Content-Disposition: inline
In-Reply-To: <20200827152842.44105002@endymion>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--9Iq5ULCa7nGtWwZS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> -for (my $i = 0, $found=0; $i <= 4 && !$found; $i++)
> +for (my $i = 0, $found=0; $i <= 31 && !$found; $i++)

Isn't this an unrelated change, scanning more busses? Should be at least
mentioned in the commit message, if so.


--9Iq5ULCa7nGtWwZS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9IxIYACgkQFA3kzBSg
KbaxLQ//Q9R1xTl1OtNkjiaiDwOOli78TzI/FWOdhddwo0r99Wyqw3D6PqzXZQ/K
uZBoj290Lhg0X6S8bJx31u8/ygTbKt5sIEOUcWOvDdKrw8AEIqSkJvIayWLoKpa6
g1RuVX8U+plZkcMtuKuLkWN/3JgbMRTX8QJ5AHwsNbYAVaLthkVAwRX842WuqSpH
y1D9uhWVpzfYoTGGYiv6bdTyFNg7eUpibLcDOA+4qPZoP76q9GpNPF0Ez13ZU3g1
3nJI6TnkOzFsINwDFdVLim0Uswqmk1ms1BTUthwYxiCWfpbDrXcRE5l9at1jW59H
kthpYLlcCNC0rCbLN/SBlh31RW1+LTpIRLvnYFgBwxQEdGhsQiqIdul+BWKGrvFx
2kghOKeAlzTqPoZ8FG5HJ5yiItGBsnLPP0VZKS5xhOfWtIYGwRJCHzWCOT1CjIcm
Sol0WviR/KhXPYy8R/ffwKqARYpx3UYGayxbsTr8PECCMvPBTsWuykbAjRTIvJvq
eBQoDBOH3LyuIe5kXvlZ8RYZdj2sfD9BMlR5xuaRrHgp/L5dHky1SN1KwbTOdqnC
o+gHq/jfqdCW45VWcgFivUShTPumZ1RnFs8wdP2d+5DdnWHWWqazg3J/dI5eeP4K
ILR1mOtKuEIQ1wyumj3/jI9JpVJjWCm38zhvY57M4Bvm5Gc81Ug=
=p2xh
-----END PGP SIGNATURE-----

--9Iq5ULCa7nGtWwZS--
