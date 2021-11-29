Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB9E14610DD
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 10:11:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbhK2JOs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 04:14:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241123AbhK2JMs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 04:12:48 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49799C0617A2
        for <linux-i2c@vger.kernel.org>; Mon, 29 Nov 2021 00:56:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D81D36120E
        for <linux-i2c@vger.kernel.org>; Mon, 29 Nov 2021 08:56:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E290C004E1;
        Mon, 29 Nov 2021 08:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638176178;
        bh=QXQTz222UGeJfJzjjGcHyVkAsZ9qtGOEX8nHOEQuu58=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=l4I9GMjSouZElYYTD0NBc6j0tV3vm3XAWYKOclI85j4JPo5xuMYZ7SXaDCiD5jScz
         l2eX3zBWgFX4Jd5i9f2ggKDcwqLwd/3/WvWhCIUvVZSdS8gJFHZcVBP8tzC7keSl1U
         KCnxZhT0aRA7TuuYf7X+fMjdrrm/c7OjQgTG7GUslLsJ3C1pXuB+M6gfbJmIJPGZc6
         cR2Ck//387l1U6WHozd2uOI770dbShw/Pw9hZn+dBFTo5ReN8njTRhpmXpwWLuU6+G
         b3jNX7kkNRTwgOEB+id/Vw03LVfXDj9UpLq+7gPMNgoXi8n+lwrs4MwAagYwEHaYxY
         6v6y6HoSTvwCA==
Date:   Mon, 29 Nov 2021 09:56:15 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: Re: [PATCH v2] i2c: i801: Improve handling of chip-specific feature
 definitions
Message-ID: <YaSVr18exOfx+dm8@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
References: <45c1aa85-bb20-ccb0-189e-b8353da3f403@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Ph7m4JBj/hxIIUQW"
Content-Disposition: inline
In-Reply-To: <45c1aa85-bb20-ccb0-189e-b8353da3f403@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Ph7m4JBj/hxIIUQW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 19, 2021 at 09:45:54PM +0100, Heiner Kallweit wrote:
> Reduce source code and code size by defining the chip features
> statically.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-next, thanks!


--Ph7m4JBj/hxIIUQW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGkla8ACgkQFA3kzBSg
KbZ5cw//XKmnvGzI046C1SNyby5L2ckBJEPlLciVtkVsESHzpVsK5bXLeYKhXVJl
gN81T97KrSc/WEG7Sn91B4WwWYkvPty0L6+5+kL8vCY0xSCERJhUZW41RVAvA5CR
6g7j/OT7HcolOZ4RVMKPOWXZENxF5Bv2BzEvV9Oli8cCpO8LMJgdh7sXJ2vDEskB
IVKRAS4SOyicClHXhAt0TkRuI36lhHzm7UvEa3yWLVyAEDYVcWCaZKrApanA9tqk
ejQTvsO1smOkptQBfWxcZQ2t/89uXfaFHyyf5cbKSgWyFcZW+A1gNlmMezTXlfGW
uLM4sH9JSJFGv05q2EHH7GYVmhiD2S69ipyteeWrTVCtKo1tpIuG0XuS10Pxqapk
JwyKWscmgKXQH0UcOrigce0BtCKGDeBQQuaL+lYumDWf/lENrm6ztfxaP5LIZw5G
BeHAL80baoUk4J/Yw3GcFtl2Q+mgzOhKbbQCJZt/sZJFTPw4ZpzqAVEfmztiH1SY
LOlzNcld6S0W2AFccouaO6cj4INsW4b0epXOoskaq+BYOHbgJVyLqUSaq9nDq+Le
uhl2Q4i2HAxnw01fkMsFjPYibpZgCgs/0FAqEuDL+ZsIxFpoc+xyZSRIej5kZwYH
gL3HkONc8gaSLVwMEJzjlhKuQvUNFpUAV/sax24YGbCZDT/+/n4=
=Os5t
-----END PGP SIGNATURE-----

--Ph7m4JBj/hxIIUQW--
