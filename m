Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9A24481BFF
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Dec 2021 13:21:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239166AbhL3MVV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Dec 2021 07:21:21 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:41062 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbhL3MVU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Dec 2021 07:21:20 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6A10D6169A;
        Thu, 30 Dec 2021 12:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 553E1C36AE9;
        Thu, 30 Dec 2021 12:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640866879;
        bh=7c2jIbmQWrJcunLczYU/rzP/vwSAussEe7dJWNFuvlQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EGnk+1uWGYtasSFmJdgClE08rxEj0n6APefMhgbVPX9yB7DAyqP7VS4zGU92mdVt8
         QK56Y3rYwt1NjNTqyQmSgYsvD0gfyoGN/o26CDKEFNDrpKocE62BzigZb0ll9P+WAc
         WFozQzwJb89zoULPc85Qc6KuBX8XuE8mkmH8L3+m8Od9ZHLWIY/zzZeo3gdKgDOXSE
         5merZX/C4q/e0QytySx/rQplrgvpl+AK10DspuyWqfYyO4hjVPzldFmk57sGrV9Mrp
         B6xsaFS2etwABZsZ2vyhqgY15leD9LOUjbo5sQjXMlhJVxHKtrQ2tQ/VI5B/9O+lRJ
         uTIH9E0nLt9Sg==
Date:   Thu, 30 Dec 2021 13:21:16 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     "Rafael J . Wysocki" <rafael@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Len Brown <lenb@kernel.org>,
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-i2c@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH 02/12] i2c: acpi: Do not instantiate I2C-clients on
 boards with known bogus DSDT entries
Message-ID: <Yc2kPCe3R0EX8+A1@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Len Brown <lenb@kernel.org>,
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-i2c@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
        linux-serial@vger.kernel.org
References: <20211229231431.437982-1-hdegoede@redhat.com>
 <20211229231431.437982-3-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="l9QD1I1TGdxXkLLb"
Content-Disposition: inline
In-Reply-To: <20211229231431.437982-3-hdegoede@redhat.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--l9QD1I1TGdxXkLLb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Okay, I have a question, after all :)

> +static const struct acpi_device_id i2c_acpi_known_good_ids[] = {
> +	{ "10EC5640", 0 }, /* RealTek ALC5640 audio codec */
> +	{ "INT33F4", 0 },  /* X-Powers AXP288 PMIC */
> +	{ "INT33FD", 0 },  /* Intel Crystal Cove PMIC */
> +	{ "NPCE69A", 0 },  /* Asus Transformer keyboard dock */
> +	{}
> +};

Can't we add this table to patch 1 and check it within a
acpi_quirk_skip_i2c_client_enumeration(adev)?


--l9QD1I1TGdxXkLLb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHNpDwACgkQFA3kzBSg
KbY5zg/+PLL6gOU7FAksfDVOMM0uRjhWj8x9AQn85+7iEOkKTMbQ3TzRMBSbc5XN
RZ4dEeYzRWD1/eQV2n3ayzscq7qO8jz4Bms769MLiD146SjeR7OUTD29yyrTsd+n
5kDnWoce/WU65H1A5CZ7NO9AI9DuyMBCQAtsZ1xkhNr+Htjl0LqLtGV3z5wB11zU
W4KlAnNWeI56BPuOmKUz0fb6Td8Ww93pXXnhXA3UiOGzTLpsxQBYrs0yGVn9mI8Y
46jrO7Rv7JVuOv14eRGYnJx9dAqOQ3ne85IlWMrSro3Ia7JdVlFL/dDGdvR9Oole
hqEeMrZJlD1K9RndkaQzukPkX3Ou4KCCntrOpb5KlWJe94fAYExWMCNWs7BdWXq4
YNIDyavQlE5XRkmLJ5wpngMybgcf4NsfNYW0sUgzrU6WSXNLyu9WWgVjEvztECJA
P3ERywDphHIrgOJWRX97s3KYL/qjr3Xn7uZWU7n05m43EZ7LSWiBo3R0WTQHtep1
QoiK/qjQ7RHE0XVZ+Qgc/hRTyue0umV699ZUAtfcwOuOA3/y6uGUpvW8wfAQTQe1
HgCl+g6pEbITpt21F0PFC4bc1UFbwLRx8xamEez0w2bJ+1KlSI7ppGG6S4PBTNKV
KqSrCpDwB56edYvjMww51fJHrHXdatIPoknMs7/eilSKe8GukyY=
=5jcQ
-----END PGP SIGNATURE-----

--l9QD1I1TGdxXkLLb--
