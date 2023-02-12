Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A9E9693A20
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Feb 2023 22:04:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbjBLVEf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 12 Feb 2023 16:04:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbjBLVEe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 12 Feb 2023 16:04:34 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 688051AB;
        Sun, 12 Feb 2023 13:04:33 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A419CB80C2C;
        Sun, 12 Feb 2023 21:04:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1856C433D2;
        Sun, 12 Feb 2023 21:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676235870;
        bh=MBaZW6ftlbRh7fpFjFjtVfKm2Z6GvDeyDUGMpCPL7rg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ADrL7jgm85xkVfpu1dGdXGx1pwphmSqgDHriEJNOxZlXdB5j+MUeTEZ8kuZU5gZfK
         6D0ACL5pxcGuhx1dAteh2of94MZCpvABPiSwYTmLQGTxoTqnHtEy6O6aOhLpX1CeGn
         sYGHq6lonHnagXRPvNxlaL4BnzLuK31CtyZGiELYhZxItXn78HFDVEs3R0XcCZ3ySk
         IBQrhXAQ+bRD+YKWkFXXtkXewfOUUUfBMYP75X4hPYFJR5dakdZIc4uNbRjRZQfy3p
         8NM82bHeq8vasRSwdyUgmEtJun5dXgfdXlkGHn51aQyqs5NyqstGN3jkdQ+ghPkc0a
         ts5+ma/k33cmQ==
Date:   Sun, 12 Feb 2023 22:04:26 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= 
        <amadeuszx.slawinski@linux.intel.com>,
        Raul Rangel <rrangel@chromium.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        "Limonciello, Mario" <mario.limonciello@amd.com>
Subject: Re: [RFC] i2c: core: Do not enable wakeup by default
Message-ID: <Y+lUWpUnjmtp4FuV@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>,
        Raul Rangel <rrangel@chromium.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        "Limonciello, Mario" <mario.limonciello@amd.com>
References: <20230207072540.27226-1-mika.westerberg@linux.intel.com>
 <CAHQZ30Bzn1Lxy+Y2gCcFTmzWzwnxqUZAHAjSh67Pz=WweaKHkg@mail.gmail.com>
 <Y+NH9pjbFfmijHF+@black.fi.intel.com>
 <b429918f-fe63-2897-8ade-d17fe2e3646f@linux.intel.com>
 <Y+Nrhq9l6CIPjL7Z@black.fi.intel.com>
 <eadeb808-1925-164e-3e78-0f14c4f2bdc4@linux.intel.com>
 <Y+S6Wz5P/dMG8I8g@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="H8ylRI22g+LmjiJH"
Content-Disposition: inline
In-Reply-To: <Y+S6Wz5P/dMG8I8g@black.fi.intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--H8ylRI22g+LmjiJH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Okay good to know, then I think we can forget this patch.

Based on this comment, I marked the patch as "Rejected".


--H8ylRI22g+LmjiJH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPpVFoACgkQFA3kzBSg
KbZOKA/+PhgSgP4+RuIoM1yVTeTZv2B4N0O2mkAYQso9ont3pAfwxnSI9DCPT9vz
YJNBUCALUR3C5JdyZlVKXgiLKvHH4e7tbS1rvdWQiQjJ+0RRFvYt1Lr/DeTWRi6U
ZIHk324FlNVPDR4n0O5AyZxjTuajOpBP07fvHgMlRcDQ7f4wMJQW+TWoXe68BKQc
G3Yzlu8l/f8wFBNyjQhJ0YgsdPh9V7pf09Aa37K0ciJJkPkuM+NYH2uL1Jl+ziae
n0OKa+ggh15rqTKLHZtHJL+l4ajUZG+CyhBWzrrAFd9pOeK4iJCPnpgfK1bNgZkM
F4srUry22YhNY3o7HguTYywJZ97PErh4TVktjO+DFLGvwnDurjUklGi65CfZ4l/k
f22pqY/FfG3Sn9uvF91wVAscyvPpPvBUigDmWqVbcs3dk4FjjXpuxzQC50mt514Q
m9h1XTXZM/bHTCRMBrMg11ZHM1jU4beE6nzMkQxGBpMHu4t+VZFg3ypFGs8Jr9GT
Brbn+4kNAk0Y0azowi+gKZPGN4Pw+B6jymdKucJqKKFfVBo7XUVscxON34oTKyu7
GPkWsyZaohpSVYg1cyZrcaATWaceh1wahJlTxGK48K3kOhqJke3SWG8lJHPmLjXU
csKadspGTexRC5wLmj9I4RiMKnbWkIPzBiULn0WDkQGuOL1SaW4=
=G2jA
-----END PGP SIGNATURE-----

--H8ylRI22g+LmjiJH--
