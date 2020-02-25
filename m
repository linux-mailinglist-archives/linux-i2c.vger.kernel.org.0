Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E94A716C395
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2020 15:13:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730478AbgBYON7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Feb 2020 09:13:59 -0500
Received: from sauhun.de ([88.99.104.3]:39166 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730552AbgBYON7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Feb 2020 09:13:59 -0500
Received: from localhost (p5486CE6D.dip0.t-ipconnect.de [84.134.206.109])
        by pokefinder.org (Postfix) with ESMTPSA id B8B5B2C1F2E;
        Tue, 25 Feb 2020 15:13:57 +0100 (CET)
Date:   Tue, 25 Feb 2020 15:13:57 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Laine Jaakko EXT <ext-jaakko.laine@vaisala.com>
Cc:     Michal Simek <michal.simek@xilinx.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>
Subject: Re: [PATCH] i2c: xiic: Support disabling multi-master in DT
Message-ID: <20200225141357.GE3677@ninjato>
References: <20200218135627.24739-1-ext-jaakko.laine@vaisala.com>
 <481fe028-0ec6-eca3-7436-ebbb8527f3d8@xilinx.com>
 <AM0PR06MB518514EE9C057CB129079825D4ED0@AM0PR06MB5185.eurprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lteA1dqeVaWQ9QQl"
Content-Disposition: inline
In-Reply-To: <AM0PR06MB518514EE9C057CB129079825D4ED0@AM0PR06MB5185.eurprd06.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--lteA1dqeVaWQ9QQl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I will make V2 without aligning new parameter as suggested
> if this is otherwise ok. This will reduce changed line count.

My favourite is to change alignment to be just one space. Then, we have
a bit of overhead now, but never again in the future.


--lteA1dqeVaWQ9QQl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5VK6UACgkQFA3kzBSg
KbZkUA//dAN/MLjeOKdbi8owAIyuKyADUxV26MxP0p1Keir5/BrJ2hhfe8vpRgLQ
Dy/tX0L4Upf8lTlIFAbpMoROyD6Ube6CYDyfZyakD+o2YKJXe8KqVodvwgTXSKlI
uJ96n2D7Y2d46sq1bpZIcH/PuXAcpKhRpNwsP9Dwuf9yxLnar7o2ytw4XOihTWUv
tjRqr/bAnApBHdZN6s8BfPevEjW9i288xLPZh3harL2l+OJoMM+Et4HrTtAWBWoc
QAybhYWOmCd2LlP5WdvQs8da7XFm0ts262TdS2NtS0iN7rtkwLfsOChNVmdcdgVn
e2XP6ZTDzMotvVOsRwBX//rAyuuhXo0HhJFueN0UGi+yG87UXPAgH6YSd4n3Wwjb
ln0d/09gflPUSket35dJq6wldp411foeo5R5+6WmdPjc6J8nz74BcyXCm+E4Q8sC
N4EqArvGHApHKNEV5x8GhzL9G3ATKPGiqP0IVZj6FLS3T/uiIf0ZD0nXpEKbHbHy
9c28VoNOT/A6YCUk+zf4ZAO90RRZiFb6cv15Snpt9J23ZWacFruAnFRVwX/k/3q2
Z6bMWftl6/sZaRHVTDLSCG4pqxeOJfxe1zcAMg+Zo1IB+xuaei5zKTk4mg9ekzFV
WgqYdBM6X8VWz8tDPnOy4FNsxaZ2/Te5m/DFDFZKqwsaksL7M3M=
=g+c3
-----END PGP SIGNATURE-----

--lteA1dqeVaWQ9QQl--
