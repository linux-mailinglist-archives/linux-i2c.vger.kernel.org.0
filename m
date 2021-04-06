Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A8DC355CA6
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Apr 2021 22:02:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238239AbhDFUDC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Apr 2021 16:03:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:32874 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234411AbhDFUDC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Apr 2021 16:03:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BE8D46136A;
        Tue,  6 Apr 2021 20:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617739373;
        bh=P889avgBFB0bi2ojrpin8Uk1g11A/55qILssYLXrdyg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IRODlppE4u/hQX7UdelwAg6h8sw6WEQUc1R0QNj2frM7lFX0mSvgr2H5RChOeFcyx
         bLPu6AYe4TMHteN6XNRFn1oPcIC0hs1wru3W7DHLGHY95SVqve7EcF3TGQopxWDMnt
         agT93iaU+BIH8VNvb9Tn/BswbxoddGgVxMEh3Bl+dYRzw270mCgctFZQK9KY/0KpoX
         TIfqD6i2jKVQcZeTP4gtJIb2/GVjDAG2CyPTRuX3SL7bQcyLsMYjT+WHsxSAJzK6av
         aSpNZm6rRKMNzQqkOxDh9CmM6LmwD8NME6I/VGsYNPQlSTDdBPBwxxeLRc+2ZKemYO
         l2OksajcNsp9w==
Date:   Tue, 6 Apr 2021 22:02:48 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Yicong Yang <yangyicong@hisilicon.com>
Cc:     andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
        Sergey.Semin@baikalelectronics.ru, linux-kernel@vger.kernel.org,
        digetx@gmail.com, treding@nvidia.com,
        jarkko.nikula@linux.intel.com, rmk+kernel@armlinux.org.uk,
        song.bao.hua@hisilicon.com, john.garry@huawei.com,
        mika.westerberg@linux.intel.com, prime.zeng@huawei.com,
        linuxarm@huawei.com
Subject: Re: [PATCH v6 3/5] i2c: add support for HiSilicon I2C controller
Message-ID: <20210406200248.GH3122@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Yicong Yang <yangyicong@hisilicon.com>,
        andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
        Sergey.Semin@baikalelectronics.ru, linux-kernel@vger.kernel.org,
        digetx@gmail.com, treding@nvidia.com, jarkko.nikula@linux.intel.com,
        rmk+kernel@armlinux.org.uk, song.bao.hua@hisilicon.com,
        john.garry@huawei.com, mika.westerberg@linux.intel.com,
        prime.zeng@huawei.com, linuxarm@huawei.com
References: <1617197790-30627-1-git-send-email-yangyicong@hisilicon.com>
 <1617197790-30627-4-git-send-email-yangyicong@hisilicon.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="y9PDtDHaFrXNoMPU"
Content-Disposition: inline
In-Reply-To: <1617197790-30627-4-git-send-email-yangyicong@hisilicon.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--y9PDtDHaFrXNoMPU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Only super minor stuff. Thanks to all the contributors and reviewers!

> +#define HZ_PER_KHZ	1000

KHZ_PER_HZ?

> +	ret = devm_i2c_add_adapter(dev, adapter);
> +	if (ret) {
> +		dev_err(dev, "failed to add i2c adapter, ret = %d\n", ret);

No need to print that. The core prints messages on failures.


--y9PDtDHaFrXNoMPU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBsvmgACgkQFA3kzBSg
KbZ0Nw//boFzeFDX9pJMYnU9ZpW5WHJO7lXahbT9MjrWEw9/pILqtOQvdbYuU5jk
U+NWcQ3iyzI+9P0OqfZIub5MnqgMBbE/uEAoJt3+btv/OEw6sf5zux7wa0nEQAP+
JdXjaMNGKm7wP7LJv5GgStsNoDzHNrtyH18BfDYL8hHVJq5cvmFwI4JyK4Wj3tVJ
MnHK0o+7HqxyDzgUZY6FU+/oJMCYW5WIE7JI7Gqa0EKcsc3HUfgZG3EvA0tnrv5K
dG6552xRFDHNLGwdNsSnOEedRPIar0fjHvbHQwi6rE75r/FXO/8qzXITLMXU6q9X
8cY/U4vNxTl4GlMUnIZRioeA3MWTspAl/DWeeYaELc+uLdhEFzu9h2Rg6oDKV5St
YGKblb5r8JCO+/59aSWqjiGQPzDETlhrXQe1zCUBHq7KEdH41sLGDsGEG4dug4Yp
bz751h0LbzYhGL8Rzuu3aF+JbCNQQLC/Z7yjKTG+GzwGP2wnznGQTpejDwjEYzmE
Qma/SnBZqMR1ulEor47mslRdBuS1/v1vljTGqv+n4hWrsuSmTwsCqXjsr8nDcgpQ
26puJE1padPiaba9XqpSIZUEpZMMIXRkjIbmKEtUQVU+8ddT2aaCJocY3yol2XMX
FMCdTee++Ekcoaw1xG08zxwAlJeMtHa/I0+UhGVyZirqQ9WwV2k=
=QjPO
-----END PGP SIGNATURE-----

--y9PDtDHaFrXNoMPU--
