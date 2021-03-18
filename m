Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A0D333FEF5
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Mar 2021 06:41:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbhCRFkT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Mar 2021 01:40:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:51770 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229512AbhCRFju (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 18 Mar 2021 01:39:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EC9D764EE2;
        Thu, 18 Mar 2021 05:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616045989;
        bh=bLb6B3Kwic8zqedLAeoNWlXD3yE5rWf/jO7SfuSY/Vw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BSX6358sGuNNu+JoPZDgITjf5dGGtU7ejVKRRXg5vh2jCemiiYA7c4inEDJbtdWML
         la8CdzSv59wsaVvV4D1lDNTWqkRT4bnIwto/+zW7zrCJwv+JxGvBseOblTa6Ylps9/
         zrEV88ovb7nk1/IgYYFeai67+kaLtcgqG8xEZOcvc2HQYreDy1NSd20i0ok6cjIIz+
         /I3dOfZFGmEaDGXnVxUN2ASyA14JqV1eyElNxCCqp/c+xBws8iNGRmEyFcr0+t0nqL
         yog+beSksYB5rrmeb4TgaNRYuMavtjxkJRQYBHlmN8OYRWCuy+rx74nk6MZXARV4/N
         qFpZ/C8aNuCAg==
Date:   Thu, 18 Mar 2021 06:39:40 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: Errant readings on LM81 with T2080 SoC
Message-ID: <20210318053940.GA1053@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20210311081842.GA1070@ninjato>
 <94dfa9dc-a80c-98ba-4169-44cce3d810f7@alliedtelesis.co.nz>
 <725c5e51-65df-e17d-e2da-0982efacf2d2@roeck-us.net>
 <9c912424-2cc9-8753-1352-1a5c27722cd2@alliedtelesis.co.nz>
 <8e516ef6-340e-a873-68a9-71a10008f32c@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Content-Disposition: inline
In-Reply-To: <8e516ef6-340e-a873-68a9-71a10008f32c@roeck-us.net>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> The polling code is from pre-git times. Like 2005 and earlier.
> I'd say it is about time to get rid of it. Any out-of-tree users
> had more than 15 years to upstream their code, after all.

Parts of the polling mode might be interesting for the atomic_xfer mode
maybe? Which is not implemented yet.


--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBS55gACgkQFA3kzBSg
Kba2vRAAg5fp6fMbPzHqo6G9u5ftRMSPW6GewoQk8xj0lZdY8HiKBJYSnNu8CgfN
wSeXMwvz+9sXnvVmTTABfDhHwyTLe4FmMLmXEWCpkctH7JECfgwupch2+R7IcVON
SJl8Jc5/z08eUjiLIyHP4NpkHdMdkkZMdbLYnjlSyxS/i/GY0sKZDomm56103vY+
MKX4M/YT144LxfNX+T/cLqrSKbxJaz1lMqufo6McPs5oIzBljLMtffKD/nNyc6Wf
ht5XVJ2frzhO0iix3OXpnBpr5m6NpSNlnHGmaM+VhxRIpzomDyKJX4El1e0IKumJ
JExGPYROBbVvWjX1iuN264Gt0OrYmJ2GcIdKJWIwIzmoPTAM5/J3Zw+6924LPmqH
ubXDwwRJGt8pixJf7iYfld2KCoWbCqnp1HsiBtijP3x1/HzjDUquQ2BsIsicIX48
w7C7AXuhrF4tilLecUaAIN3Mfn1oYXBAvQyUNODkqSfiChtjZfuX9PvRpF0KZsuO
Z0hVjPQc/nDUvXXH/gA/81leJcGIO+xUs/sy+5tVYE/dxVflZPFue2Ub2Sapj+5N
lniAtiiFyTYUaMi3VqyyWbm/lyoHJCUg7euliN3km843nqMy9KAeLzClbpc5VzgB
R+lCzi6PJheLUgNL3l3lS50wDbMm1D6zd10Nvur58yOSeAGEpdo=
=Tea3
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--
