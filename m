Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6217741CDA5
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Sep 2021 22:56:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346816AbhI2U6Y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Sep 2021 16:58:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:39544 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1346812AbhI2U6Y (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 29 Sep 2021 16:58:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DA630611EF;
        Wed, 29 Sep 2021 20:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632949002;
        bh=TNi/mUJDowoV8HXHjOWSXBOb9jkNxNy2oKGJBi00AXo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZQ6F43eu2Nkksh5pcO29C2pWUSqf1JAhyXx2JBCnYDRM0zEwVx3ATwyzlMYFM7QGB
         PLc9IRkrmWe9TH2RVEYa6KBvrZwNLMZbSAIRlsiARRULjpTCNDY4vFOVALxxpziJ/L
         tDgTvuwiO3s24f7aOD8ncwfmvGUOf3FbXTUg+fZbfF6Bruqk2Eg3TaMcRvlVRoxu2R
         gcWWzBgKHHbBmk9s6gbLlZybIe/8q6gsbClbFFIIdIamSoAnDV/xW3jvE+Ip76QgSM
         L+fgPrg3mYPZDygZff4v2e0uLjBNlDIWeiYxUrFHIMS/B3BEXEvc7LszueVho1Gba9
         4syBrwDkcOsFQ==
Date:   Wed, 29 Sep 2021 22:56:39 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jamie Iles <quic_jiles@quicinc.com>
Cc:     linux-i2c@vger.kernel.org,
        Octavian Purdila <octavian.purdila@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] i2c / ACPI: fix resource leak in reconfiguration device
 addition
Message-ID: <YVTTB//qSm7bLCy4@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jamie Iles <quic_jiles@quicinc.com>, linux-i2c@vger.kernel.org,
        Octavian Purdila <octavian.purdila@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20210922165718.179585-1-quic_jiles@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lF3zHISEJvtARqd+"
Content-Disposition: inline
In-Reply-To: <20210922165718.179585-1-quic_jiles@quicinc.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--lF3zHISEJvtARqd+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 22, 2021 at 05:57:18PM +0100, Jamie Iles wrote:
> acpi_i2c_find_adapter_by_handle() calls bus_find_device() which takes a
> reference on the adapter which is never released which will result in a
> reference count leak and render the adapter unremovable.  Make sure to
> put the adapter after creating the client in the same manner that we do
> for OF.
>=20
> Fixes: 525e6fabeae2 ("i2c / ACPI: add support for ACPI reconfigure notifi=
cations")
> Cc: Octavian Purdila <octavian.purdila@intel.com>
> Cc: Wolfram Sang <wsa@kernel.org>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Jamie Iles <quic_jiles@quicinc.com>

Applied to for-current, thanks!


--lF3zHISEJvtARqd+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFU0wcACgkQFA3kzBSg
KbZxpQ//dH3N8qXK50Tl30wLQfD/6IoH48prhVKGgdnNtlWDn6c89WgSaL61Tg2Y
SuE+tw7KX31enVyb81LvdsXmpIPamvmRJOKGSmoUmBeAQWPwL3K9wVRf92VqiVT+
JFDXlNrUeW798sYDBQgjl7gTidMZl+bQRUUCO5e2ZLbRbLCqSdaG5TEWzQcsZdgv
ijWRsfUm73H0/59+DgAaHp19QLFMOy79kD43HgAlL5vQHyHK4Do9+XbEzmX2/tOn
ib6IIYU7UTjPedYmLK4UAeIZCagXeiU9xVzt0QNS8ksWRaEVLrXCADNH5JCo8v58
2LxfSRU66pvIh+BC7cBUGQ0L14eBcC4BitmYIzFFgadsqcBNXbQJSlKZGOcKuFFw
LnJj6Yp6a9IBtohKiDHqcv6FlIl0kNTn1WhAbKx5eLGuIcICScPyfRGuCvbCg1YX
1CcsRr7xuw3DK2OQvFS6xHYu3NYjpO7iUppW7xlL6ZtLSwgSXT0ivD7l/2n+mxwx
dIx7NLRDRECuLtR9nPaVwvAmzB5qPjT7gDwYFAQRYplIOsKMrtj/SdFG1/JVnb4I
q8iM7VlIbV5TyK0mWnbbI/PgSTmVZqZeFw2uSsDD+qKwfTUoJpU7kzK45/WgxSxR
+HTte+FJRovKzOk7UxBj1jSrw2njpae7e2OJIGcTUVWY3JQ4isA=
=mvpQ
-----END PGP SIGNATURE-----

--lF3zHISEJvtARqd+--
