Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C937339F68E
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Jun 2021 14:26:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232525AbhFHM2X (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Jun 2021 08:28:23 -0400
Received: from www.zeus03.de ([194.117.254.33]:60560 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232580AbhFHM2V (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 8 Jun 2021 08:28:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=UJB2R7z6c1JLI0tSU2WWCmcB3EKC
        ULo2n4qIA0VITwM=; b=RngtwJXSKxV5UvquuZoUPn1G86Dw2SlIXSDcJR1tAFZQ
        qkScdfcVEqA9g+02vkhqODonz2MLHKKmdndCnpcoSDdqFCeCwUj9f5Uw2p3NRvwa
        0QOYNhnp1HWAIlTdt7gtkjV74+J78Qyh4GQRVCp6R3m/helf2pSalqBUZe4Uj7Y=
Received: (qmail 1102873 invoked from network); 8 Jun 2021 14:26:26 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Jun 2021 14:26:26 +0200
X-UD-Smtp-Session: l3s3148p1@jGRPREDErKBQT+F6
Date:   Tue, 8 Jun 2021 14:26:26 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Peter Korsgaard <peter@korsgaard.com>, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH i2c-tools] Revert "tools: i2ctransfer: add check for
 returned length from driver"
Message-ID: <YL9h8ojf2t8eWaFR@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.de>,
        Peter Korsgaard <peter@korsgaard.com>, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20210310204648.GA332643@ninjato>
 <87tuoe5zfc.fsf@dell.be.48ers.dk>
 <20210413125433.GA9879@kunai>
 <20210521132158.6e0689c0@endymion>
 <YK1fwC4aR5RKTPcB@kunai>
 <20210602110332.73f9cbc1@endymion>
 <YLew8cFWTRQKrBuk@kunai>
 <20210604155708.14159db0@endymion>
 <YLp9Lc5Ondu3Gicg@kunai>
 <20210608142211.6aa9ad4f@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NKrBx0tGQtTcsss0"
Content-Disposition: inline
In-Reply-To: <20210608142211.6aa9ad4f@endymion>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--NKrBx0tGQtTcsss0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> So I'm actually tempted to add the feature to *both* tools. Crestez's
> patch would be the base for the i2cget implementation, to which I would
> happily add SMBus block read support. For i2cdump, it's about adding
> support for register range to the "i" mode. I took a quick look already
> and it seems fairly trivial to implement.

Sounds good. Let's take this road then. I am convinced :)


--NKrBx0tGQtTcsss0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmC/Ye4ACgkQFA3kzBSg
KbbS3xAAo+Kcu8c7EL/zhVaDuTwy6NRoJwdN4AqFSfWWAuasMTbbvdGKiGlE3lsl
1z9a7fIjVKwEq8GUVNlKcZfDL93ceED6ZJ6JiGnAONdESEenUp1sIj0wDspCnc2Z
WXh2y4QHROdYGLCa3CgsDQ/PMr52JsakgOi+DrfbySjdDUFlSZr8Sxkt5IXebT/Y
8RkkY/OQ33A40NlzC3o2TGQqWsXqzL+JAV74dpRIerpTMXoEiVOEClZD2YYGxii1
agQvEIp/2jiolVy3IdXZEp7KHrkvfRxSdb6rjR+JrukIQFitUcrl9KijgdLRKetq
TisjQtAUsQiDKL6ho5qelZfDm36lz829ssVfeYsvOUZl8YexYVqz51rUjG9yRujA
ZaqGyIvGGPOqT/dzMTG4zBfbjDoY8Qpl/VsvRhtN423tYRm6rJbUuHUXyIL+5/q8
cxB5TGbndZN7OgQa3mJ5lc0mo8fCNGcMbT7rRxrXgA96hp4Kn1oivaGXqQEzHATz
2uWEBYHn/u0khWX6y1ig61UXcBJfQqf4leW0X08td69/+u/nEfudf51lLyczEG6W
3WFDvEPALD/ICuYzj1cCl2XjwkbVIGx3KAf+Z7zH6BXuIZGpemTkI11oL0QZHPbo
H6KPte7O8hOG+uLBu9clsNnL4IWP/DQ3ttczpggUcnzkr3odn2A=
=pMFx
-----END PGP SIGNATURE-----

--NKrBx0tGQtTcsss0--
