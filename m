Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFDE16DA8CB
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Apr 2023 08:17:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231295AbjDGGRq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Apr 2023 02:17:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbjDGGRp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Apr 2023 02:17:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07A7A3A9F;
        Thu,  6 Apr 2023 23:17:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9575260F77;
        Fri,  7 Apr 2023 06:17:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BC2CC433EF;
        Fri,  7 Apr 2023 06:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680848264;
        bh=05FIeaLmW8kMjhfxY3zVPrzEsRy/mxJHL/LzoAKdCcI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nCaCtvl4IzHhL9l0u4XgpKpQTiugfDQTG80/5Q1oTzpEiazutclZ7G/UzgFvWl9ri
         xUGiJxroLKn+njzca36+cQawzQ8c7cdZyXTj85Yng6uq80LIRKdVtwy++bBSNYOsz+
         9IOLvSqljJdzAiE08i5mmmeshoXytczh8WjOT5iW0dgzWRi9+qBhiMLL/z8IFZ9asy
         2XgeH2mzHhQ/7/tXF+BAUklTCgpTBcGr0j+a9YuTdE89x7Ou+pWVWbRG5Jfl9rlSPJ
         vl+FVhRue/aeIrj50mUohK4Osnxzez+Fa2rK5MFPqZbWrgyauifHdy5LtYB9H+wgzn
         Ya3dg7XQSXekA==
Date:   Fri, 7 Apr 2023 08:17:36 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, Held Felix <Felix.Held@amd.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Mark Hasemeyer <markhas@chromium.org>,
        Grzegorz Bernacki <gjb@semihalf.com>
Subject: Re: [PATCH v8 5/6] i2c: designware: Use PCI PSP driver for
 communication
Message-ID: <ZC+1gJMc8/LtCv/M@sai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, Held Felix <Felix.Held@amd.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Mark Hasemeyer <markhas@chromium.org>,
        Grzegorz Bernacki <gjb@semihalf.com>
References: <20230403183216.3493-1-mario.limonciello@amd.com>
 <20230403183216.3493-6-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="r+H0tXBnDGwTM1Li"
Content-Disposition: inline
In-Reply-To: <20230403183216.3493-6-mario.limonciello@amd.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--r+H0tXBnDGwTM1Li
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 03, 2023 at 01:32:14PM -0500, Mario Limonciello wrote:
> Currently the PSP semaphore communication base address is discovered
> by using an MSR that is not architecturally guaranteed for future
> platforms.  Also the mailbox that is utilized for communication with
> the PSP may have other consumers in the kernel, so it's better to
> make all communication go through a single driver.
>=20
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> Reviewed-by: Mark Hasemeyer <markhas@chromium.org>
> Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Tested-by: Mark Hasemeyer <markhas@chromium.org>

Acked-by: Wolfram Sang <wsa@kernel.org>


--r+H0tXBnDGwTM1Li
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQvtXwACgkQFA3kzBSg
KbYgPQ//WXRPOtwlXQQr/XCTFDd0stvPFu8x3LEE8GDsNka8o813yRjiS3MabVA3
qjgoYubXo+fpHa5x8CXOhppRw0wxQ6/YllmvLxtACDUIBXIOFQ9CvEbqKYSLSyF8
1D0gVP5U9/2McocbozRzFy56b8L3nZiSHMLy8y0075Myeviq4DND0x9SXFBaK0MU
lz999ortyPrTW4aoXqBTDbSuw7dJ7DrbWELFx80kT+iEbGKXxO+sDmF2RWWMktCr
Hrg30BlR1c9riBr5BQLRFupVCcSM8AM5fqc3MZuMlfRoRgw64aLPds+HXlIV7/E+
DEDkUtXxLHCgeUumtxZVZsTm8g1e40uXgjBIg/WspaTz1yfGQ8O8Vb80TIM2dIj1
ww2ujfAfS+s7YqGN8pcVyjW7Q7xxIGUM5fYsMfvPH1GjFrzV+k5BlxDAlxHniXId
L3621ib4HoSDZ2abGzNuZGqdbDYkglALu5WGm04e0Arxz1MVraCtz3lzTp4qW+i3
FvG388zzJQW1UNwT0sQMGw1g8ooFpa3OP8bNz27omNFlnmyZsy8GrmAfERXFYuZU
1DBM6QpD0ZvX5tC8le0zzjEr3YccNqJK0Jz5U2L0sOjoYQ2T1ZOGZeI75Z8BJKwd
/ebePBIQbSQDvbV9ftxucI8CrebkZSOEZzunu8kZbX1TTphygYk=
=Ee3K
-----END PGP SIGNATURE-----

--r+H0tXBnDGwTM1Li--
