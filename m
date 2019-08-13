Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACFE28C240
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2019 22:42:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726188AbfHMUmj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Aug 2019 16:42:39 -0400
Received: from anholt.net ([50.246.234.109]:51562 "EHLO anholt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725944AbfHMUmj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Aug 2019 16:42:39 -0400
Received: from localhost (localhost [127.0.0.1])
        by anholt.net (Postfix) with ESMTP id 38EDA10A335B;
        Tue, 13 Aug 2019 13:42:38 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at anholt.net
Received: from anholt.net ([127.0.0.1])
        by localhost (kingsolver.anholt.net [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id gls5KwEquMNN; Tue, 13 Aug 2019 13:42:37 -0700 (PDT)
Received: from eliezer.anholt.net (localhost [127.0.0.1])
        by anholt.net (Postfix) with ESMTP id DFF6E10A13E4;
        Tue, 13 Aug 2019 13:42:36 -0700 (PDT)
Received: by eliezer.anholt.net (Postfix, from userid 1000)
        id 49DD42FE2547; Tue, 13 Aug 2019 13:42:37 -0700 (PDT)
From:   Eric Anholt <eric@anholt.net>
To:     Stefan Wahren <wahrenst@gmx.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH V2 00/13] ARM: Add minimal Raspberry Pi 4 support
In-Reply-To: <1565713248-4906-1-git-send-email-wahrenst@gmx.net>
References: <1565713248-4906-1-git-send-email-wahrenst@gmx.net>
User-Agent: Notmuch/0.22.2+1~gb0bcfaa (http://notmuchmail.org) Emacs/26.1 (x86_64-pc-linux-gnu)
Date:   Tue, 13 Aug 2019 13:42:35 -0700
Message-ID: <87mugc7q6c.fsf@anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--=-=-=
Content-Type: text/plain

Stefan Wahren <wahrenst@gmx.net> writes:

> This series adds minimal support for the new Raspberry Pi 4, so we are able
> to login via debug UART.
>
> Patch 1-2:   Prepare platform and DTS for the new SoC BMC2711
> Patch 3-6:   Enable clock support for BCM2711
> Patch 7-8:   Add I2C support for BCM2711
> Patch 9-12:  Add Raspberry Pi 4 DTS support
> Patch 13:    Update MAINTAINERS

Series is:

Reviewed-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAl1TILsACgkQtdYpNtH8
nuh8EQ/8CIWIRxuKEDNPwD+swJlhNQsyfP+MqfY6OENxoLeBv7u23S7jc6OEm9Si
9vszx+5zyVzb33gGJv/Tg0XUwiIEWu8R2cEbLAi366056yJ8SrMH9ibaSKU+OsMT
3uN+Px/ahVT1s6WFnmdsRCEwBdRoMjRztBpr4ssRKbXUxZGjjXFVYscOqXqCmu/+
6Z+D9EMe2yL08QqyEK1151HDNgzAqh3kECGJorPBq2V3aL0dJ/sv5Mg62fFO8kKA
kpqQfcEFwIhD3vbSlA6MNU6mC1tpLhhJTjMAcbwCXsE3A+TwUNioJva0L1OovsVH
3HN/4S5O4bXKf6O14tU+FLWDzh61SmAui8hpOOM6yLusJ/NuULnEYx8PeAp7Nh8K
4p0cXay44zdq47Jlt8fXc7MIhAeV5ofjqJvxj0par/mncrpOk6AonN13Ng8XjqGJ
+8LLs+xOrT0wk5RYAMRIzxn5XALtaquHJDL5sb/Vi3Z4sb7QDA+z6+jeHKqPVLO3
kbRmCAx0uE+yZrRXKlcmXTkP4z0pq0ZPC45zRwFR5iHQXdKQ5nvU1liJD1kE0UgL
5viA8cds+hQNsYhKGQbQMdqztBv/dBE3ZHPZCZRkgsSysrPPX77MJSvJPNMs9v0A
d8v2BZQXBmQqRtwaOc2yvjJ2K/w4uZhS1XOrWMyvir7kKDBgvZc=
=TJWO
-----END PGP SIGNATURE-----
--=-=-=--
