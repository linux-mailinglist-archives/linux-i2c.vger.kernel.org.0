Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3293D56890B
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Jul 2022 15:09:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233512AbiGFNJf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Jul 2022 09:09:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233473AbiGFNJe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Jul 2022 09:09:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A77D205C4;
        Wed,  6 Jul 2022 06:09:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F214461CFA;
        Wed,  6 Jul 2022 13:09:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97E16C3411C;
        Wed,  6 Jul 2022 13:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657112972;
        bh=tCGPdJSxKe2o22ghTeorrfE8/xxYhqHBt7RlbZJUOig=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=R+dojw68Wj3R/wsUoUU6bFtYgLn8gBlUYGCY25+q8cObMwEPuC12fFiyeUI9lycV5
         sh16KbzTJnoN5mPYiCBdiknm4pLgVAfEY8jWObeHKnV3c6dXukZlp5/RmYuegU04Bb
         ztZRw2+/NHcvusce1HEFOLkkfJ2+nWjmDA9w+AGbW5Cty/wley/TTVqjywJOpkodNR
         0IoB9ROU3uFA1QqhAa6aa/kus6vHAQnC4Jq51qObrMfBD1jgaL4DcPdsmOLtMxH+gU
         ItLKOVfhJ20i6QAdXHB4XEZ+9KoblWeB0U1oAHitrOMeGp+qBhvdAm2wJcVim0At6J
         6b52ddrjRiKDw==
Date:   Wed, 6 Jul 2022 15:09:28 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Mark Gross <markgross@kernel.org>
Subject: Re: [PATCH v1 3/5] i2c: acpi: Convert to use
 acpi_match_video_device_handle() helper
Message-ID: <YsWJiPOHwPSYQ7AQ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Hans de Goede <hdegoede@redhat.com>, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Mark Gross <markgross@kernel.org>
References: <20220630212819.42958-1-andriy.shevchenko@linux.intel.com>
 <20220630212819.42958-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gfFBjfQD4LmWzExs"
Content-Disposition: inline
In-Reply-To: <20220630212819.42958-3-andriy.shevchenko@linux.intel.com>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--gfFBjfQD4LmWzExs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 01, 2022 at 12:28:17AM +0300, Andy Shevchenko wrote:
> Replace open coded variant of acpi_match_video_device_handle() helper.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Looks like a good improvement to me:

Acked-by: Wolfram Sang <wsa@kernel.org>


--gfFBjfQD4LmWzExs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLFiYgACgkQFA3kzBSg
KbY1Pg//brgfb7cilmz8agELwunWwgwUQpo3Al1zlLGPzTyBT7suwUDktIHwMhBt
K9czE4Ly9fupBj9O1GbcU2xJUV32OKZUIDkFOeHQQdC0e0LtFEetHwcFMrWOI3PD
JPLAIODYZ7iSTt1O3Pfq24YcNVYbBYvpU03qRVDvh+DdE4805wOH1JNeWirP1JtA
AvaAlCOPCFTwA23/0ecEDH4AAnzlW/XA+f+IBCKKhnYVcrbcX7O9YcZ2P+Pwanob
BUN7oxGvzBM/XGNX49uX07NNFTxFEk7c1lJ59tiJ4XYs0iSRCjPCdWA98k4P2LuK
qJMxbnVQb7phZZX/fczQsz3Z4hkXR2VWBuASV1oQsGWMOQyI1iA8J9s9PK88tUhC
HyieWCYPeVfr2wgdD4wjCFRIQVdEYmN0BgHWDrjQN2LM1JiPr/T3dBb+1Ur8oFg6
juDsRBztAeMxFSjlir5/bpNqiGeIrnxjHOUXLUw4W2QSauZIWwGiG794JSjP49dq
pOAaGEKdEz6Ao4xPS/As0mNQEisWs2zYsXIS4shmnn2sm4JV1AkXNoRar8sQi9ug
mAlwEZzUIf10JhRtR0LwrAJIVwVTRMk6xuAdqnVlVAzcGd3E3o4uucEWOaRyU++Q
En74Fg/NVJxKqA8+Qx1ZqfSRGxwLk96eXsnMByMIqjjc9UsAp5k=
=4tIl
-----END PGP SIGNATURE-----

--gfFBjfQD4LmWzExs--
