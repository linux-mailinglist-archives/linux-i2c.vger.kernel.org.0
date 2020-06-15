Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E3CC1F95E5
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jun 2020 14:01:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729763AbgFOMBu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Jun 2020 08:01:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:60946 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729734AbgFOMBt (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 15 Jun 2020 08:01:49 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 741A320714;
        Mon, 15 Jun 2020 12:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592222509;
        bh=CM24pedTnetKRTjlq0H+6fc2bSL16QovoA2odE5GIvY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f4AIuqKc7TIwjfvhv2rmefsUZLRNT8PWkKDYmZzB2Y2K0R+Bim8k0XxWMyEWFRZyx
         VDtL/EyqDSXpCpLHMs+CRe9zfpzov4HjNszopTxDyVAgdHctUOXZf5VWZX4Arhs8ry
         Hbaf2QazFrz0l50kvfyfqiWJc0/uBGadeW4ift+Y=
Date:   Mon, 15 Jun 2020 13:01:46 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, mka@chromium.org,
        dianders@chromium.org, evgreen@chromium.org,
        msavaliy@codeaurora.org
Subject: Re: [PATCH V7 RESEND 6/7] spi: spi-qcom-qspi: Add interconnect
 support
Message-ID: <20200615120146.GK4447@sirena.org.uk>
References: <1591682194-32388-1-git-send-email-akashast@codeaurora.org>
 <1591682194-32388-7-git-send-email-akashast@codeaurora.org>
 <2e299942-2a51-f023-ea6a-fa7822912d9e@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fUvfsPTz/SzOZDdw"
Content-Disposition: inline
In-Reply-To: <2e299942-2a51-f023-ea6a-fa7822912d9e@codeaurora.org>
X-Cookie: Offer may end without notice.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--fUvfsPTz/SzOZDdw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2020 at 12:57:12PM +0530, Akash Asthana wrote:
> Hi Mark,
>=20
> Would you be able to review/ack this QSPI patch, you have already acked "=
QUP
> SPI" patch from the series "[Patch V7 RESEND 4/7]"
>=20
> Putting a gentle reminder in-case this patch is missed.

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--fUvfsPTz/SzOZDdw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7nYyoACgkQJNaLcl1U
h9DyOAf/buJgSYiAf2Fl+YYl1CDe6yV/KLmnww9YUYvfvzsGAJLXJZVQthCKq7zr
j7m+iDZpujyNeT1zSI1hZqy7sXVaPc3zdMOP+LFa0xVHxICQh4oF0qsHbn402vI+
S7xT0XB1vK526+pHgLJ9FS18jP7z3T2C97M/1E5IvIjpvv4HipVwAsXUuroPZy04
2ePbyIT5rye/tCgBmh8QoZbrtOEM+NBz5zkphREYpUA0Yhb7bWjtbswguwBR+IpQ
OW5+r2OlQ7FHxKWSChKMXAuD3zIdagwe6tkXKFr0ZqzZJpzClcNyU9GMA3PDfIYx
cMoFw4AZrl5MTycVwk4DnifcFo+giQ==
=sGlf
-----END PGP SIGNATURE-----

--fUvfsPTz/SzOZDdw--
