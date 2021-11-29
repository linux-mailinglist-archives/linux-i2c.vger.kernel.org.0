Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2A66461C22
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 17:50:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345951AbhK2QxZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 11:53:25 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:45730 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347015AbhK2QvY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 11:51:24 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CAED7615BD;
        Mon, 29 Nov 2021 16:48:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90DC6C53FC7;
        Mon, 29 Nov 2021 16:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638204486;
        bh=UbS4qk0d0chnTXSGcmfZ7R1i2koRRudFe/+X++xLqpI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CJzhCIO1dr2bFwDthsX0RnG19xeSewfR3ihswpw5affNItRXVtRXQl1iOLrzoq4J6
         md7vT9E391Dz9/NbE/Lz+xH+1JNKkW5B0FH321wmTkm5gQ1s6Vw/XLl5ckLIgY+cMK
         o7VUXxN8mSpod66yRqW6r8IxHzcc/i/3EZsDdDtoCNRc5GtO6Irn6hJhF8YOM+BnMr
         v6U1vyu7Z6BXSKF0mx+4/8i0Ah35pMgGjrJKh8XA5laidRQPxExPxV7CnSNtKR7qjn
         2c+AVaBGtNZToB4talKxBWp+6symoH7g81f8QxRysRu8I+eV35ER0yrZXotxaTxZHZ
         jBJ9VD1UZhSBQ==
Date:   Mon, 29 Nov 2021 17:48:03 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Rajat Jain <rajatja@google.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, dtor@google.com, rajatxjain@gmail.com,
        dbasehore@chromium.org
Subject: Re: [PATCH v2 0/3] i2c: Enable asynchronous suspend/resume
Message-ID: <YaUEQwYeUgqlMOmu@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Rajat Jain <rajatja@google.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, dtor@google.com, rajatxjain@gmail.com,
        dbasehore@chromium.org
References: <20211025213532.2349161-1-rajatja@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="POKVtAmmjJwrTKPt"
Content-Disposition: inline
In-Reply-To: <20211025213532.2349161-1-rajatja@google.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--POKVtAmmjJwrTKPt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

> As far as I understand, the only reason we might not want a device to be
> marked for asynchronous resume is if we suspect it cannot handle
> concurrent resume with other devices, which does not look to be the
> case.=20

Since parent-child relationships are handled, I'd say let us try this.
If there are siblings which depend on each other, I think they should be
marked with "device_link_add" anyhow. I am afraid we will encounter some
regressions with such siblings. However, I don't think there will be a
lot and the time savings for all Linux systems may be worth the
(hopefully) little hazzle.

> This patchset marks the designware, the I2c adapters, and the i2c=20
> clients for asynchronous suspend/resume. In case it helps to gain any
> confidence, the patch 3 (for i2c clients) has been included and shipping
> on all our chromebooks for the past 3+ years, and has not shown any
> issues. The designware and i2c adapters should be easier.

This in deed helps to gain confidence. I agree that the clients are
probably the most tricky ones. If that works on all Chromebooks for 3
years now, I am positive we can test this series in linux-next now.

Thanks for this work,

   Wolfram


--POKVtAmmjJwrTKPt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGlBEMACgkQFA3kzBSg
KbZViw//eyB+/5oCFyG5ctW9t8jVasj4Ud8gm7bCoKyG2HTJlusDVfCcfDWKMI+Y
juPqniuzrP9R1MooW0SX6ggaUSjq3U5hUI2BPOnD3vQak69mNqy7OFP6t19zgbwI
+rhxWcUN4c0l0F2xsXTqC6tKJliSXEED58WFo7tKUe3O9+lgZ8NULR6ex/A+1Joc
qGFhlDfxsuVCf1O4wtv/aGSurAqRVHOL2AtOxuBJGlM3n7CNq0FOi/Q2cmvTXt26
gOEgJdlSXXb4Bwg2ww5ncHCSd852l0KjuFBmmFQvOhBEgAgOM2aq8Tbau3VBPgXC
Uqmd60MM94H5c0zlF6hqmY1XN04sR+u15jO1yIAwE8hKfgp7BLakaoutRf05ioST
t33eD3HX6rIbkZW0lsnB5i+nGEHmxdiK+ff7zIpntWl4eiCHZ/yZmVyZX/UB3359
yG/UghMjFzrmy2wroV0v5kqHs9Rr+i8V3DEZa/MAvPRYRn6RlMiikbBRRIdMULyu
BgmFka7+00tfoGapHU8UqG3RrYU+JfInxPsvzKM3Ng/qkZSHB5ADrW8hDOcPo2RT
PT5oODEZ0iRo0oauMpmRw6u18BDyOP/3ni2nD5BPWsghtqqWlPPDOVzOm/d8Rc9l
CYI4dmVnV67bOUz2ObS+nTqLunRk0Hip1RbRSPBPKnnib3VI0ck=
=ALIp
-----END PGP SIGNATURE-----

--POKVtAmmjJwrTKPt--
