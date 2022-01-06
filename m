Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06E0748621F
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jan 2022 10:30:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237420AbiAFJaO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jan 2022 04:30:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237429AbiAFJaD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jan 2022 04:30:03 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54C2CC061245
        for <linux-i2c@vger.kernel.org>; Thu,  6 Jan 2022 01:30:03 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A44AAB81FEF
        for <linux-i2c@vger.kernel.org>; Thu,  6 Jan 2022 09:30:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94E87C36AEB;
        Thu,  6 Jan 2022 09:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641461400;
        bh=oyUdyjSNxx2Fc2CysWzrYEiNeAMYkOX6CkInjFaX2Og=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nPeeLdkbkp2OiJbWapOp8saXwIPL56t2MEGKB2er/KjB7zKbYJDh0GyO1LbuJfq/k
         Ki8HcejLIZdPUxGtyINm7UO5bnhJnIaansbdgBLqMaksczcVyYB+hWfKzUN1KxxPrf
         SOK9mGca1xVSLB+6+9hGstNRLEPwT5b9582autjmVfnAbNjqJt3AXxanaZAQCJ4BP+
         Si6qbSWWTg3OEeU2BeOSYYCGZMT5TADy02A1KHBPnApbofZNf93SIZn6dGySxcyUmR
         KKMplK/i/4HqPwQk99gNEt78EVawfzaOq9xJndVfDTCrdakAxlMSthvGHan+TCDXTM
         zw9K4ePmHYyVA==
Date:   Thu, 6 Jan 2022 10:29:57 +0100
From:   "wsa@kernel.org" <wsa@kernel.org>
To:     "Tareque Md.Hanif" <tarequemd.hanif@yahoo.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [bisected][regression] Applications that need amdgpu doesn't run
 after waking up from suspend
Message-ID: <Yda2lUHg+RcD2jWc@ninjato>
Mail-Followup-To: "wsa@kernel.org" <wsa@kernel.org>,
        "Tareque Md.Hanif" <tarequemd.hanif@yahoo.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <1295184560.182511.1639075777725.ref@mail.yahoo.com>
 <1295184560.182511.1639075777725@mail.yahoo.com>
 <YbJj7xyiPs8HBxC8@kunai>
 <1394751822.39123.1639136356516@mail.yahoo.com>
 <1173204999.356114.1639136939857@mail.yahoo.com>
 <925415165.717231.1641227067217@mail.yahoo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/85u4RD6zmVTlANS"
Content-Disposition: inline
In-Reply-To: <925415165.717231.1641227067217@mail.yahoo.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--/85u4RD6zmVTlANS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> The bug is still present in 5.16-rc8. The system boots but suspend/resume issues still exist.
> Reverting the bad commit on 5.16-rc8 fixes the issue.

Thanks for the reports, I will revert the problematic commit.


--/85u4RD6zmVTlANS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHWtpUACgkQFA3kzBSg
KbZIyA//SllBaYAptXpP5e61o+tsqC9wqx3oQqXFvZm80lRzDBDAXdPYmafsERIh
PmPbMeksT2eIvWk4aG7k1AFNLbwuUh7NF1a1h+XcJAjDkzIUW6US5iZwvd4OlV3y
UCJwRDxCC7RuJK136N1oSUp33hbUFlb6LrjWjsSgUT8y0sqtKqRjsW7F+yBFy5iU
g+5k3yv0Gnfju1qFHKEuguwGhJk4hkkmzH9JcotFBgf0/rDuY9ymGL3CZjUB+vlP
5dAinFegFHLrnCu2MLaHhwU1kcttz14xlz7HlMFzQxCASl2l+U5bP+UdZKQQX3D1
vvHfWfgu3Lh+flcXO1m1Htmho4yU/MEpujmLqTR8OhPwDUnv9tFuOgoYISPqXr3T
gSRtud4XT7xN8t6PxiYPRIKt12OTkB1Ph/zhtsPbzzLSkKsmP0oMCmXy46IIgtPH
BzNr5qMgWEUmGjKlsVZFAl07HpQjFl2Tj6u1523QhtLgn6JRArLZcJXMVOq963nR
tlfRL7j0eS7XBAXBZNa8AhZhoOoeylHaTh9wFEMfDHqXgixvkk4gUadk1PHuGusG
9nhh0Ap0mMAUD7ZSGzJhybHAAPbg9eMCV4jPKQX1B6W9vw8jGTPQGCPmNjjNGFJ+
ubv/SemLE/+DZJq5myfJgDs3ergiZg6jhtwd50oYg5nxiKsVkrA=
=kSsq
-----END PGP SIGNATURE-----

--/85u4RD6zmVTlANS--
