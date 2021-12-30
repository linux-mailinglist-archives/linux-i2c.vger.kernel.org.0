Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 289E9481EE9
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Dec 2021 18:56:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240125AbhL3R4N (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Dec 2021 12:56:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237227AbhL3R4M (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Dec 2021 12:56:12 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E417C061574;
        Thu, 30 Dec 2021 09:56:12 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 56922B81CF3;
        Thu, 30 Dec 2021 17:56:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46253C36AE9;
        Thu, 30 Dec 2021 17:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640886970;
        bh=bwsVhNkkDFOjOAsbHGkdYBEibZ6g/JN+XwAYr+0kPLA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lZnZ4c7Gn+QEOUL50jYCiJlENE4Y1oX+nfJWYHWlugD9x+MGgiXSKxK4i8FAnlFjk
         /DvlkgFBmP6BJ+9j7e2hfoojjpVEQNJhkDrp0xJAvEMUm6D8j5hsnMSFFi/g4yvDPR
         5zb+09jZzl0t7DRPMz1+otEL6G9PEPRgpV7RKYxyp7TqLZeD11o1mA3Q43smuiV66g
         GjfjT0GA1xipaMs9S14KCBxS70vuVAw5EDnYZbiDMAjbKURUyX3jxGxQgKi+gWmd3C
         GCHT+yVYh2SnMrOkAbaFs/hcu/G4H+CyNg5x7yZGhGVceH8r6DnZM1KrCPhR5ho3gD
         Y2TkkNIclfdkg==
Date:   Thu, 30 Dec 2021 18:56:04 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 1/3] ACPI / x86: Add
 acpi_quirk_skip_[i2c_client|serdev]_enumeration() helpers
Message-ID: <Yc3ytI/NxnGT0aVf@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>, linux-serial@vger.kernel.org
References: <20211230141722.512395-1-hdegoede@redhat.com>
 <20211230141722.512395-2-hdegoede@redhat.com>
 <CAJZ5v0jw7jNq8FgMFcF9p=YYiuYj=RuV2MTPqGu62QoaG_O1MQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="45HTPdWQTiadDo1r"
Content-Disposition: inline
In-Reply-To: <CAJZ5v0jw7jNq8FgMFcF9p=YYiuYj=RuV2MTPqGu62QoaG_O1MQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--45HTPdWQTiadDo1r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rafael,

> or please let me know if you want me to take this series.

Yes, see cover-letter :)

All the best,

   Wolfram

--45HTPdWQTiadDo1r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHN8rQACgkQFA3kzBSg
KbZuZg/9GzN3YswsTCbY30jJrnb1fNokTxf8IHAkOsNfuk2PLKvC6r+87z6eAdqj
o+40GmojApm4pnSZRDs04tE+H1N4bb3Nf2zF8fofYgB+VKHzzl/9m1eqnKh5w9Fe
5/ePjaovHvTB68Tcuk4zcgiiAbNDbY+jE3ejrBvpehZQaohKy5g2afu6i0m6/bO3
n5TOtEeEux0ObEV0vRrZaPEfsSzorguGMw5gKBnTwMoMx/NWfINbNta5fCQqf5Pn
e5f0kcBDyWattur+XL6OAYbAHZXSLNz78LJqCmlPmQUgtGyfNSRHDXm2lwKL1iyV
sARaxtmN7Rkcgi3h702DFda7n6Kjy+8wvM40BhnEJY/SER6iefEsxBbpmnUuLMHf
uA8ls3u5V7YcZV+Woc/NRIJKHXrYsYxQga12fApAAMX+j+S2M38wNk6WumO/Ve3r
8mDMScy6cYNUG0DLXBaB6pBbHGcbzwXFaHYSQHmOo7V79f4Jey8lKlGbnI9VlmiI
AUqTY5DZZy7FGCrvfD0HwglwFYtdDnmimlRU3TGFRChw+zCWI58hUknIDH4+7cet
Ij0Jjmz8RNW9IFLM/8TwGQGIidBgfknOajoGwTvP4OG+M13n2ravyCDWiVPdyNOh
Ye8pd0Lr5RqF2+4Vb7CNhJrTIkdQqxWwamyj7jVKZiRlPPbBCiw=
=xHnm
-----END PGP SIGNATURE-----

--45HTPdWQTiadDo1r--
