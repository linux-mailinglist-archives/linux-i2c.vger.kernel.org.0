Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97C7446253B
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 23:33:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233773AbhK2Wgd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 17:36:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231676AbhK2Wfp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 17:35:45 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DAD5C201F9B;
        Mon, 29 Nov 2021 11:15:55 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id A8224CE167C;
        Mon, 29 Nov 2021 19:15:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3473EC53FD4;
        Mon, 29 Nov 2021 19:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638213351;
        bh=As5tGxBWpsIBr6Ptb98MIpSwR+cID+ZtMAjxC8CabBc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AeNzBB06DPCfeHGq6k4OFx0j224B1i++bhjyaRLcobu0p9O1K7sTYCxY0x9YyQwyl
         tJEkYMkGJng+5yPY9cIxMQl+zM8BayIAfOcRD/fOgJmW/NOwspug1j2qmw+yYpnUUZ
         5gjmnYNTtYLEZLOHxGKCH2uiNSPzF8ZE0Q/eN/wHaMl+E+JwnIRhwMo/ux7lqJzvdo
         OlB/gW8G/xXKyL+7c8Hoe2ImxoyPIl5uyq6O3vXkpxo6f2ASjnEqewPTkgQGW8dluo
         Tmj7ohRjbFUzJBELi6QQxlG1inHVLqAOemgUiNp0vYcR9IhY2+CnJi5VYYW93ig9uv
         PW8GahJaUb+kQ==
Date:   Mon, 29 Nov 2021 20:15:48 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     helgaas@kernel.org, corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, bhelgaas@google.com, Sanket.Goswami@amd.com,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 3/4] i2c: designware: Use pcim_alloc_irq_vectors() to
 allocate IRQ vectors
Message-ID: <YaUm5NBr/Pb/i0Vv@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Dejin Zheng <zhengdejin5@gmail.com>, helgaas@kernel.org,
        corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, bhelgaas@google.com, Sanket.Goswami@amd.com,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210607153916.1021016-1-zhengdejin5@gmail.com>
 <20210607153916.1021016-4-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Lgy2OFLg3jDVJdoD"
Content-Disposition: inline
In-Reply-To: <20210607153916.1021016-4-zhengdejin5@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Lgy2OFLg3jDVJdoD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 07, 2021 at 11:39:15PM +0800, Dejin Zheng wrote:
> The pcim_alloc_irq_vectors() function, an explicit device-managed version
> of pci_alloc_irq_vectors(). If pcim_enable_device() has been called
> before, then pci_alloc_irq_vectors() is actually a device-managed
> function. It is used here as a device-managed function, So replace it
> with pcim_alloc_irq_vectors(). At the same time, Remove the
> pci_free_irq_vectors() function to simplify the error handling path.
> the freeing resources will take automatically when device is gone.
>=20
> Reviewed-by: Robert Richter <rric@kernel.org>
> Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>

Dunno the status of this series, but if it ever goes upstream, I am fine
with the I2C changes:

Acked-by: Wolfram Sang <wsa@kernel.org> # for I2C


--Lgy2OFLg3jDVJdoD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGlJuQACgkQFA3kzBSg
KbZ4Hw/+JuoqxZy2bbiNX8LiPt6gXGhQrly3nu+8bhOe5smWpEmFpLUdQHX/0CPk
QJguw68urbcJH1tvCw2g5KM81McukpSavS9mi74JLSwJWblmWZFxXNBxirkDP9QP
/2c6wBEal8h+0T0inKLYm+uUk3DXmVmVp5iv6ZA9kdlfjVvJEAifcgY6/Ie8mOwc
gIuvTuNtRc6YbneDnLbFjII1sgLepkASr4paZ/KgUwVULdqjm8Q6CHzg9OmHWjwF
2oEA7CtIO30pe6Ky6tbVOdcxjBhxYC4h66erAMnqO7Wk3QLS4obEowuX1/i5uAWT
FOO7Az8tKuR+lMNNh3AfTJbkeNNs+wcAb3L2SvIy14braTddeNe5FyzSuC+9QM7X
x5wIFkXz/SbB1eJt/X4KVCadgKZXxK6NMsSmPuktO5+EYxSySZMJQgtWHcC9aP7E
4n4gt/sINW3XkKnNv19vHBuXpn7EPkM8h+t/tK/3SHWDYZzRCRLA55lebYvmcqHs
2BlPZ2cu/WbOm34KeO5y9GFmpKo5pO2TlonWrSVE6T9WnJ01yXd1iPvj4pBnCg6E
6ttwzMfrZkPn0piefq6nRnUutg2jHK/re6ylAMayBOfr9C0JlEfUELxgETyXmbn0
ASU8ebTBdSUWSdi6dyEkCUn8XFEzuojFeUBEr9G4p3ycG07BF00=
=rRir
-----END PGP SIGNATURE-----

--Lgy2OFLg3jDVJdoD--
