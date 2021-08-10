Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 282053E846F
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Aug 2021 22:37:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbhHJUhh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Aug 2021 16:37:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:41772 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229649AbhHJUhh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 10 Aug 2021 16:37:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8DDF9606A5;
        Tue, 10 Aug 2021 20:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628627835;
        bh=40lR3UuYfxWIcHzzWgzYtKeON+Jm7vbiPKrgNQKw8ww=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fqUwUYKZxrT/OS5VaRMYrX0DSGSuXg2FDa5vo9D+elt8/8ppgpxHB+Ev3NcopmqNH
         Dz0lP6cNF+TnN46WDJvHwz8+Kv5o3NOHNJ8Ts6pvhIh+wpQAELDJM1Y4nqQ3jU3P26
         Qbx/jz6JQDcDRe/62pIJPUNbCzJS1X68XfAO9y6uDZmMf+MUMgccpXbRQwbee31A8c
         m2N4QoT1JdOlWn9VgHt1pdLxFsSwG/RH4VRo88G9FEcinWjyg923j6rEVnyO7rgm1+
         xI+uHKLxl4IC3dpi4Mkxuok3Q0RcgYVpRaUGvfQpjrQfEhx/aQtF86+WhOpVPV/EXQ
         HV9OrN/msoKIw==
Date:   Tue, 10 Aug 2021 22:37:07 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2 1/9] i2c: i801: Improve disabling runtime pm
Message-ID: <YRLjc0ZWuys/d92/@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
 <10690555-2317-4916-70b8-870708858f9b@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3fMrbBWYeBJOnknj"
Content-Disposition: inline
In-Reply-To: <10690555-2317-4916-70b8-870708858f9b@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--3fMrbBWYeBJOnknj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 06, 2021 at 11:12:18PM +0200, Heiner Kallweit wrote:
> Setting the autosuspend delay to a negative value disables runtime pm in
> a little bit smarter way, because we need no cleanup when removing the
> driver. Note that this is safe when reloading the driver, because the
> call to pm_runtime_set_autosuspend_delay() in probe() will reverse the
> effect. See update_autosuspend() for details.
>=20
> Reviewed-by: Jean Delvare <jdelvare@suse.de>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-next, thanks!


--3fMrbBWYeBJOnknj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmES428ACgkQFA3kzBSg
KbblHg/+Mgr2Y3/rdH5IHoxgevqj6nMJyUcMxZgTQq4Zb7aJ8yC1luJjveM0hQaX
xXUkwJkaEQB2ZlKOCi4VN09x0iI5RJKpvd4XPTScsC6ZPi6HmDxhR1QC134YaCEa
tlBgJAGTR0rOhUW18ihu9EclWZtgfPSVYUGKD2Sp2+4sl8qAEPYP9MvWXAXLrDgc
bkZc26c6tux6z1jINlV0VFrfrX2f8T4Z3sO4UCJs6crcdH0UDdF4c8iTwCmOo33E
MPqTiN6CsM3/VBfE7WcHrscAuRD+lM13Se9tCCDMXU7LwooT2eQCg+gpj9gu5NjK
B+2mp4K8f6GjlGqS687nJoNM1eES/uOWUX0qduh0gOIDvOfSXJuGKxoWhHkCTKeC
M+yuUtoGILpDzJoO+jN7salsDnB2LXG7rZcxPJJzLI0IXYkxC7U2VKgK+yElUvXV
bde2hnM/ADJ1N7tsDuw8U87OlA9uE16N94smtkU1iUQaNJKQ9bYGrAX4TAL3uZhJ
JP+hkWSVCCYSgj9vSXfKd3Vw3aNHUaHyghP57IA3BO+Xx8GXZBESQBayapiCab2V
FXM2MXMfbXqkFWZczqC/Epf0EXloO4cgtHvooRopy2e/c4djR/iR3AjMVNFPyg/+
BGegNxCI128xq0fVMVfqRHnC4gPDco6y9YkCV2jVZpQ7CICEz3w=
=03V+
-----END PGP SIGNATURE-----

--3fMrbBWYeBJOnknj--
