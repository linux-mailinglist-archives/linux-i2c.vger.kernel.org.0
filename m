Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00EAD46220A
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 21:18:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230054AbhK2UVh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 15:21:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234621AbhK2USW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 15:18:22 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 864EAC06FD58;
        Mon, 29 Nov 2021 08:51:27 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4C2EEB8121A;
        Mon, 29 Nov 2021 16:51:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53BD7C53FC7;
        Mon, 29 Nov 2021 16:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638204685;
        bh=/N3hJs+8+g3Nkkrg8lQ2OdQ2KQb16KwS5vn0inTiGlo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=t+Mq0UkXbA4a6Wt6h0xiiXD4aebndrAF+dVTyMZN88cCwEAqCKOaaAkx3BwsHowCT
         /XZQdsuqYhDZmBGWFeFv2uftvdb/P1PEC95VCxlG8ORHXW9i+n0Fxc65Q42WZdvCmr
         bmjobxtLIVNZNxidKOg+8HhfEHJQg0cxaJxA5LEf5RPAhW3oD2YUbPgMGUe+C5hGz6
         8Tqpgfirm9blVoIYzvxHiQpK+91EXsKSFaDjSY/IduPHkb4WNOI5YfeXoiVqmXdRo7
         chDRm0wYm23sB90lUmq1W8Z1Fnpl20O8742Xpim7sST8R+bg7cJtAxXy86bOt0x7gf
         ehm18Ngwf0gGw==
Date:   Mon, 29 Nov 2021 17:51:22 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Rajat Jain <rajatja@google.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, dtor@google.com,
        Derek Basehore <dbasehore@chromium.org>, rajatxjain@gmail.com
Subject: Re: [PATCH 3/3] i2c: enable async suspend/resume on i2c client
 devices
Message-ID: <YaUFCizDRFbK/3ON@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Rajat Jain <rajatja@google.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, dtor@google.com,
        Derek Basehore <dbasehore@chromium.org>, rajatxjain@gmail.com
References: <20211025213532.2349161-1-rajatja@google.com>
 <20211025213532.2349161-4-rajatja@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wQLIdAQj1LoHmbEk"
Content-Disposition: inline
In-Reply-To: <20211025213532.2349161-4-rajatja@google.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wQLIdAQj1LoHmbEk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 25, 2021 at 02:35:31PM -0700, Rajat Jain wrote:
> From: Derek Basehore <dbasehore@chromium.org>
>=20
> This enables the async suspend for i2c client devices. This reduces
> the suspend/resume time considerably on platforms where i2c devices
> can take a lot of time (hundreds of ms) to resume.
>=20
> Signed-off-by: Derek Basehore <dbasehore@chromium.org>
> Signed-off-by: Rajat Jain <rajatja@google.com>
> Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Applied to for-next, thanks!


--wQLIdAQj1LoHmbEk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGlBQkACgkQFA3kzBSg
Kba8ew//TmsHAD6TPCDx31Bq9oPE2vqGNsvpZsr6eiPRQwIw2eEhpxXZWHwvw/+G
N2un2Oxs5nnccZGuurO3NheZrj1bRv8kQLgRqM6DagVJy43BbH1/rocsCGstfyui
HO3XMrooBDXkJJueLYrTqXmsOGdXb2n5bol/sSl3RkUcenFJ8haz5kkDULvHTVUV
ajbr8EpIiY4kyf99IWPbgYkJvoYbrjsbaR06e9wWB52I1i+POf4o7W8YMgJUzK75
Qa0qcdgEp/ACnk9BfINd+rF4X0a1NRnvQSnK4HtiqJC/Y/UedguAMhZS0Dt9Lcpb
H8P2HVz1mqFIzbRec4JCYlCQOikvIWtz2sFbi/qpxANiWAM79YYbkIW6xiKrOkyO
mPK0SIYkbX4aMcvPcBFMEkIWTnuZC7rPvp+h8bDnDgZ0oIBqG/pjBZwijekd56Lt
tipzbPngQqqbmnEOb70Zh/GriuI9YEq9LIFNtSYYuW+MeArxrCuMMs74QH0H3ETG
NMrkXbj02kyLyxSa8I4jzqnOQEqQyifmeRTXGxzTD6IL+MnNrUpKAIOOSu+l8zkF
AChwzy5TDawjGz/TlzyP60VH3RyGsiV2Bfl3/6zr3oanoXh/hKBnP01iZM3y8Ltk
/OoIs8m4oCFweI7vFWURaUSYBu1Pvh9u3s8BxFG+b7wf6jq95jg=
=3k5a
-----END PGP SIGNATURE-----

--wQLIdAQj1LoHmbEk--
