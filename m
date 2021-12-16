Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0407F477E93
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Dec 2021 22:17:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234267AbhLPVRb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Dec 2021 16:17:31 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:40090 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229818AbhLPVRb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Dec 2021 16:17:31 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C993A61DD8
        for <linux-i2c@vger.kernel.org>; Thu, 16 Dec 2021 21:17:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B3B1C36AE2;
        Thu, 16 Dec 2021 21:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639689450;
        bh=49xRmXR+NfZYZBwf47nRF74ZKHESmFN/vKMWQVHfl/o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ICJqXMvMTHX6AGL0AwwTNedbC6JlanSzqcRHcOaDlFkcEQCcxXxJ1ERhFBtjTTUpj
         i1zTW+C2nBsZ0eh241T7BvtQ5c01wAboVXFDLVVTKYvzdIGcrbZsDzD7jUlxV+uC86
         DlVjgpQNqH6RwLQP+8ufp/7QN8YrBZNCKqyLNK82/y99JnAnkvI32r8bjvusa5KP3C
         lTq66r31no2/YsDsoMK561KVWhX/cPQkdxR8fJfp6EHgOgcQaMNHMCG4MqbdWw0zll
         AKuHurV4JkcTK8NX2lmT/7TL9Ij0A4WIgMsmBoI0CpU7IPRMy4pilttUUyC1bL4HjT
         3dwXcZpME8yPA==
Date:   Thu, 16 Dec 2021 22:17:27 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Subject: Re: [PATCH 2/6] i2c: designware-pci: Fix to change data types of
 hcnt and lcnt parameters
Message-ID: <Ybus52Ghx88iWcpV@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
References: <20211215151205.584264-1-jarkko.nikula@linux.intel.com>
 <20211215151205.584264-2-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="d/YM33TUh2sWfZ2Q"
Content-Disposition: inline
In-Reply-To: <20211215151205.584264-2-jarkko.nikula@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--d/YM33TUh2sWfZ2Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2021 at 05:12:01PM +0200, Jarkko Nikula wrote:
> From: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
>=20
> The data type of hcnt and lcnt in the struct dw_i2c_dev is of type u16.
> It's better to have same data type in struct dw_scl_sda_cfg as well.
>=20
> Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Added my Reported-by and applied to for-next, thanks!


--d/YM33TUh2sWfZ2Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmG7rOcACgkQFA3kzBSg
KbbA7A/+KPW8hSHsAWg1kHiuauotbq/TtUWekdEYlUAuWv+h2wYTClT3cFlJcSSh
EeqXk/Vwqwu0onAiSh8WhIuNIKOokOJZ1eywVWCOfjYt5A2+WEDCKcTHS9wlYDwY
FJeb4rFPA7xUKLd/ezBisOmBeVzpjOnR2l8s4jzA/10MtN7TV9TCYexnTxZ0aApH
vGx+axOEivI7lEqeEGYGHQvwtS0Yj4urjCib5cl9CDpKbjgdYOXVne3tTv2QBz5X
W0eYRgjrpvA0BetRsWHuswHdlSjOBszv9YMjOzwElpcYaTuNxRg2qOEWryadf3NH
D4pfYdISK8aGE9p9zXLyEenIA9UC+OVB/3kdZdRyqNSiP/iRjq9KjvepDoKuIX8J
q1LX/2qt/mM3cAbBUrMix68vLTPbhC23f7Rjl2SvzPlcOqXPENshJnlhrZ2TfXNW
jQrrO7/74IFiD77FODeKiwHxWo9MNH3cHipN9YSKfQy0Jm143WDWfOtDjBZwDXzf
tCZBtRRfuJCp3tuOy86QWfCajIniQjsyix9xfvUA5PN0YcovRNh7P+WRiNJRp4fj
wEnPxvL3pP0tbrv/P/OMXsWRrt6XNrtjlFSU9lubApYddJfLAAJFSG49KU4kxEQB
Ml2M9s3MyHafHRQl12kxC/QeSnv3LOrhOeLaPVWii7jEZBGsfEM=
=HIfF
-----END PGP SIGNATURE-----

--d/YM33TUh2sWfZ2Q--
