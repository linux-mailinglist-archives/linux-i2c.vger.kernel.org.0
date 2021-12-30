Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BF5F481EE4
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Dec 2021 18:55:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239126AbhL3Rzd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Dec 2021 12:55:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237227AbhL3Rzc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Dec 2021 12:55:32 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04526C061574;
        Thu, 30 Dec 2021 09:55:32 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9751861710;
        Thu, 30 Dec 2021 17:55:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A527C36AE9;
        Thu, 30 Dec 2021 17:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640886931;
        bh=MGNtt1rr+Xc9WZUTfZIOR2nlGccdOE8ZIvOaZRzqKqo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GUcLH7GqRxkx5TvANbnooZWyBHBK94G962gGMDW4Am2ma4ciW7CKZvIugjNbEKEXF
         F7X95mwMhwS2pAAyEwkpfxN5kE19eWdZ3FM3gVUmF91jhPL+QkgNfSeZ+CNAakwLW2
         9wFCmRo+yl+S7SOdRzh/SrOaXX50vq3bFYizWLALxcffMTiCQsJ17jKzhRf5WwrTTR
         MYJxnUM+04LMWfmfgNc4EWqP5gZ2DqNcdN8I7xOIG0C1trWuFTR6jcwJpAWKAjyQfo
         6EbkpiVzD2Pmu896FCnAOB+FfA5XUCo4fqCJrJfsycf6n730v+HIsGiwH+7Z/R0hYL
         dnyE0+YNGg8lQ==
Date:   Thu, 30 Dec 2021 18:55:25 +0100
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
Subject: Re: [PATCH v2 2/3] i2c: acpi: Do not instantiate I2C-clients on
 boards with known bogus DSDT entries
Message-ID: <Yc3yjRe87+wXt+o8@kunai>
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
References: <20211230141722.512395-1-hdegoede@redhat.com>
 <20211230141722.512395-3-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="joy7/O780lFrQmV+"
Content-Disposition: inline
In-Reply-To: <20211230141722.512395-3-hdegoede@redhat.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--joy7/O780lFrQmV+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 30, 2021 at 03:17:21PM +0100, Hans de Goede wrote:
> x86 ACPI devices which ship with only Android as their factory image
> usually declare a whole bunch of bogus I2C devices in their ACPI tables.
>=20
> Instantiating I2C clients for these bogus devices causes various issues,
> e.g. GPIO/IRQ resource conflicts because sometimes drivers do bind to the=
m.
> The Android x86 kernel fork shipped on these devices has some special code
> to remove these bogus devices, instead of just fixing the DSDT <sigh>.
>=20
> Use the new acpi_quirk_skip_i2c_client_enumeration() helper to identify
> known boards / acpi devices with this issue, and skip enumerating these.
>=20
> Note these boards typically do actually have I2C devices, just
> different ones then the ones described in their DSDT. The devices
> which are actually present are manually instantiated by the
> drivers/platform/x86/x86-android-tablets.c kernel module.
>=20
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Wolfram Sang <wsa@kernel.org>


--joy7/O780lFrQmV+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHN8ooACgkQFA3kzBSg
Kbbk3g//eM2sDqEA/3JYO1S3NiUUbx+fD6XsEsvRhi2V7bdGiBno34o/Y3Ml5drv
0aRv1tSZqW4XPxrZq9WwHeoFE4tCdX9e1nc3F6axRtl1aLPbwWJWzKF5FdwtBwyx
HBFITW7/kv4mI/DaDhqrUkc4gLCpflJDif6nbInVJB0VCWmX5c0CiqC2WTLl8lZR
eSqZxCMMqJMnjoLFT7yOCjGAbGfv/SK3IOaC5gQecI4ESkQCzbzxTvE1N3cJU06K
A0C1+XdI9c0OLkAXPstok+UPEQ0FuNYryGD6rW8wivLnzYA685B/UFjomDKSAioA
EKFAHbfJKbe1s9784D2pFcO0E5xJn1H3lMHJGiuAHvoSoHAL4sadPhij5ZMLryiH
g9MCbCjOLHsF4tf2fgT1tr9Y0tu5QP/xYOT+TOFlH2zIQdgjh7/sPHzOkKWfsZ7Z
n4Dckfrgr1ugMT5nug1WqExgnbSFvoBFhma/ZSvdcQ/f8/oIMv4lsrdT/V15UL/o
aiLox0W73kj2DXjgJuhTNKLm/TvRdPt/brhsviWokbzBRkIUxxg6S2dAsulZFCJY
T2YZzTcSJ4+387lK5OyecsNheoSx7tC8lszjuTcqq94CU0LvH4qtTHlMrvQNk+Ub
mz6rF4eZVLTAmg3GPxE9+GDGT8gcZ0kDK3j2TmO1/yzbmvDqjvs=
=aUdP
-----END PGP SIGNATURE-----

--joy7/O780lFrQmV+--
