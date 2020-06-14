Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74C8A1F87F9
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Jun 2020 11:12:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726099AbgFNJMG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 14 Jun 2020 05:12:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:42454 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726014AbgFNJMG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 14 Jun 2020 05:12:06 -0400
Received: from localhost (p5486c990.dip0.t-ipconnect.de [84.134.201.144])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 20578206B7;
        Sun, 14 Jun 2020 09:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592125925;
        bh=zcRl5dzioE4oiJSEfWn1q1ANQ0yluGl7UnG8UepPK3M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dnH6BCMCsUSd/1yD1/tbpoUBB2a9th87D7C1PQCnXFF/MU/DRwhAiUyYa3WJtYM+P
         +Wt/LJUp2S3R9qIVUF7HzdT6xl4Q+8SpIoPJqJ7t4VzX5hEEO5BLOr+3PNknK2h5KA
         bej8V5iTQqiwMl1LzXLhh8ezDj58ZNu5rpkQ8mHY=
Date:   Sun, 14 Jun 2020 11:12:03 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>
Cc:     kjlu@umn.edu, Markus Elfring <Markus.Elfring@web.de>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Fugang Duan <fugang.duan@nxp.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v3] i2c: imx-lpi2c: Fix runtime PM imbalance on error
Message-ID: <20200614091203.GC2878@kunai>
References: <20200601061640.27632-1-dinghao.liu@zju.edu.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="DSayHWYpDlRfCAAQ"
Content-Disposition: inline
In-Reply-To: <20200601061640.27632-1-dinghao.liu@zju.edu.cn>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--DSayHWYpDlRfCAAQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 01, 2020 at 02:16:40PM +0800, Dinghao Liu wrote:
> pm_runtime_get_sync() increments the runtime PM usage counter even
> the call returns an error code. Thus a corresponding decrement is
> needed on the error handling path to keep the counter balanced.

Can you point me to a discussion where it was decided that this is a
proper fix? I'd think we rather should fix pm_runtime_get_sync() but
maybe there are technical reasons against it.


--DSayHWYpDlRfCAAQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7l6eMACgkQFA3kzBSg
KbbomhAAsSDK9VozV4hQIjYDiVrG3P1dSoA0Nv0svNzvGBF3XDOvmYGFLM0oPPRA
y/AhGqxktdvOK1iCa3xvdgN9WW8VvVf/wPE3anOmQ6YF8t+K8YIWxpEq7S5UE7kX
qdKTwK6n5U6SCMPYRklp63lfCwxHxYOPz5LiF8Fahlm02xm5JTAR/DIZu97mFnMo
vjKgDY6c1VfSKDSAhOJJEMwcdbpeSotsAUBUPSj0qyFymLng3Mip0iiI30ubfQxh
DKimD5eJM7UXe3iuYw5mC6gXQX/ViWhpsAbP1otylqcMXEpebcPMdWGa7rr3R5yX
TWNdBsFH0P3KUvr7ULY/XPzvOMfbijZoGCkqxa8ExihJZiK2PiLhDaxETR7LxrXy
28eu3mH9KK45rraUO3I4fVosyqASJ1NbSCC5qg3ldu/pXnoS8jGZcpwgZwv0Udme
nwrjevSPmJ487gPkYaFlkJRm8kaJM0DOlWFgWdYnrDClG8hw/u1eJUnsEwe24A90
MmmiaUEwR0gMmAUIodwiTsqK9Y+8WYh6BuOEyw/8Cajq2iEYnYgDGm5I91y8hBvh
9t5I8CTQNM3EGGGjMm85fuZAddTk/O/AmA3kCMPbAoxX3bhjm71imaF8Q02xaxml
lVvEfC46bUpQKIXNK0ULE+i3aoJtk5eM8y6Lw6CzOrAd8tcViY4=
=PEkp
-----END PGP SIGNATURE-----

--DSayHWYpDlRfCAAQ--
