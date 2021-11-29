Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2981B4610B6
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 10:00:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241369AbhK2JEI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 04:04:08 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:37844 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236684AbhK2JCH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 04:02:07 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 374FEB80E2B
        for <linux-i2c@vger.kernel.org>; Mon, 29 Nov 2021 08:58:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A094C004E1;
        Mon, 29 Nov 2021 08:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638176327;
        bh=N0rnSHdOyXJ5PfxhII+ialZbd5Oawwi4oT0gQz8aLhA=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=n7d12LBVSFC75HcuWOVoOCkYg90PShCt6vtterRsdWVoUGcEU1H+ACjSo/OoDpuAc
         5T/iDcU1HPYeXkoEV24gPdPqKEm/2QIiSQPLqN6632VZVYk3BY3SXP6p9NUcBHPscN
         OdV4mrBgFp6nK4tG1TOAaLGKpOt5H9ylwZ0NP68Pc9bOEEg8b4GI7vZNqdJviFh6o1
         Vr//7ILLWQi4aYEswFGC9kdyTEO/yeZgNewguKHI5689uaJvmn+pZZoxuQyj8CE6mH
         KQeB/Momd9r3GjGo6hGrbzbEnJZik/rg8wS5Qfr5OMvqQkW29T4C4yvEPPxpQJPz6Q
         7a3xV9UNC+Vdg==
Date:   Mon, 29 Nov 2021 09:58:44 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2 9/9] i2c: i801: Improve handling platform data for tco
 device
Message-ID: <YaSWRBJEgq9ZGhjE@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
 <0e8188d1-e35c-162b-6657-b22e8034483c@gmail.com>
 <YVgN9xLPSJAOqkz+@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2qPTi0px14SV2SAd"
Content-Disposition: inline
In-Reply-To: <YVgN9xLPSJAOqkz+@kunai>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--2qPTi0px14SV2SAd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 02, 2021 at 09:44:55AM +0200, Wolfram Sang wrote:
> On Fri, Aug 06, 2021 at 11:18:40PM +0200, Heiner Kallweit wrote:
> > The platform data structures are used in the respective i801_add_tco
> > functions only. Therefore we can make the definitions local to these
> > functions.
> >=20
> > Reviewed-by: Jean Delvare <jdelvare@suse.de>
> > Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>=20
> Hmm, this doesn't apply on i2c/for-mergewindow. Did I miss a patch?

Since a lot of other i801 patches have been merged meanwhile, I'd need
this patch rebased if you still want it to be applied. Thanks for all
your i801 work!


--2qPTi0px14SV2SAd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGklkQACgkQFA3kzBSg
KbbbTBAAlz++qSr1zHt2/CtTh26wrRIo53HwLG4A1ORSEHaNAg4lYt74wW50n1aU
CAgCzc1UkPcoeFdPEISI3ynES5hAIKfXqXmz48ErGtWLKrW/Ji5tAyv+94KnOF6D
rPPcTxQqSFeJuRlC2FBb3s4mVIvguMuCwe3o3y3EoeYcf1g1+I8SnXTizgRb0t/n
qhbDAk0Nfm+9OiCKwcYfcTuJScFCHbXY9v3ZKpBO2oFumh6sjGxR/nYv7h1/MOg/
EyV5BkCyDBI/SNac1R+y09YR7sXb87peCQ87FevjN7a2Q+7CcWITXNUgAdyKaQFt
Jxs5l/GUTGRi7GkWypNvpbS7rUZnibX2nVbP6DbvvHSUOdKWLwxbd8InBx0ijGRl
HLDEVhsCIwMg1EOLIM0HjMtZja+EvDrK0MYCI4a73gPZlx0dHHXKQL7Acj4+ufEw
BPPGmvcZyeAqueGxi4B86uO4kTr4elCzwVtNKvhmPVPt0uKddr4q8pcRamDUBWLB
cSNpMecIbFUVWA57iJlj05daw8a58WQNbHSL8i3Kdm3qSusYdZn/1iqY4rusPECR
BUOcGk6EvjKXD+5wjyDxKIFW0QW3dg6/4lX5xGwggXvfGj/jK7vwWv4ojlPTr83Q
kZXzFeFHE+JqXwHbL6F59WT5vY/jOQKb1ExHl52p/6juCR9xrEA=
=jo3V
-----END PGP SIGNATURE-----

--2qPTi0px14SV2SAd--
