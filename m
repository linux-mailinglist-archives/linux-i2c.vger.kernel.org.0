Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D8ED461C36
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 17:53:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346509AbhK2Q41 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 11:56:27 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:47072 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347315AbhK2Qy1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 11:54:27 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 61C3C6159F;
        Mon, 29 Nov 2021 16:51:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28875C53FCD;
        Mon, 29 Nov 2021 16:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638204668;
        bh=LBTwJYqGilRyT+Hxq5AEXOnolHh3ORZnVoyMPoB8cLo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SZX21dHB7QH+DxrjuNi0zCW4QFGbg4wvVtvclE3kIxreCQ8q4ivLVhfPFPVQQRX4C
         ERtcYSAOSVdSIP5zDJ7R2DJIOSDLhO1/feHAJHqcl0J7yhAbpArVpxs3PW/PSMXm1B
         40Jw0wjYIo8+mH2wTjfzdOuJLp5CQiSTuDE6pimNBk4JXaTEdZTdCXzyNfIlwTBHd+
         g+WWlXhGTB7H/Z2U4AZQR4u3X3fDQd8jUa1tR70g8EoJEJ3snSRU82cFrPuId3VtjR
         oPhNfjdln6FHTi9y9VPSFmBvufROPkXGhWhueell7N1C7uFId4gLbYUyCOHwtZ5RKn
         WGqkafC9kRETg==
Date:   Mon, 29 Nov 2021 17:51:05 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Rajat Jain <rajatja@google.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, dtor@google.com, rajatxjain@gmail.com,
        dbasehore@chromium.org
Subject: Re: [PATCH v2 1/3] i2c: designware: Enable async suspend / resume of
 designware devices
Message-ID: <YaUE+Xks5MJm/UOK@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Rajat Jain <rajatja@google.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, dtor@google.com, rajatxjain@gmail.com,
        dbasehore@chromium.org
References: <20211025213532.2349161-1-rajatja@google.com>
 <20211025213532.2349161-2-rajatja@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="uw2LOSK9R7cPfqjH"
Content-Disposition: inline
In-Reply-To: <20211025213532.2349161-2-rajatja@google.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--uw2LOSK9R7cPfqjH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 25, 2021 at 02:35:29PM -0700, Rajat Jain wrote:
> Mark the designware devices for asynchronous suspend. With this, the
> resume for designware devices does not get stuck behind other unrelated
> devices (e.g. intel_backlight that takes hundreds of ms to resume,
> waiting for its parent devices).
>=20
> Signed-off-by: Rajat Jain <rajatja@google.com>
> Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Applied to for-next, thanks!


--uw2LOSK9R7cPfqjH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGlBPkACgkQFA3kzBSg
KbYSJRAAsCnE6yygwDLkWHETG6dkGl7h/QM8KiUBXnvpPNgsUnRBl+LgoqRtt1vN
+BQBV43kwWsDtNZxoyDw1XUtJKtVeAOuDoZ1EIfcXONCYLU0Om3YeLaH/oLLpcJN
EbrSb0Ph5eP72Waa3id+0p6xveT7OG5gBQ0vuzY+vE1Uo/Xd3kpQQlZlv4QVuTTd
X9wn2GmY4aUgOhfiCbVHNif7XfWtsYhYg3PFmSZ8+ggPS3U/qfsomegALkWLTDPX
WrXsUDwiS+pTIyNsAmLvq6pSo+3jZ9d26c8dZ8R0kv1HEoYbONiMNGodOHhtMvBQ
FprK6L2f7PFND45AHNqpsc6B0sva9MPcfmOneNz8usdhM60QWPKlWo3ybPX+Vprv
L5Mzgws5b3Pckgf6/ss33Ab8kxGPrtFYR3PDh3sdinL8fzELke7cwh6KrfJ5x5W6
D6VcqHgmKg59sfCRLXogi6amzJMUmo/fUDWx2dkYRO4JLnmjJlVP7ZxPu960H/We
OXn5M5Gyh7ElnYUb6Fh/wFLlK0rquq6vZJNPP2qfquBg1fMHlO+vjjpEyDrj/8Fz
2ShPl1Qi3BalKEBF2OL8G8/bM7/mDbU/K9UulORQko+HQQhiON8VkrUZEC1WfGxe
YWaJ7JJRxAdW7Rm44XPXX3lzcFV2n4bfq3tU2mbjc19NkLmX2Pg=
=8+TH
-----END PGP SIGNATURE-----

--uw2LOSK9R7cPfqjH--
