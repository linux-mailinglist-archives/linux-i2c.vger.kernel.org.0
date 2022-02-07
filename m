Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 397B84ABF09
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 14:23:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344251AbiBGNTl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 08:19:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442751AbiBGMVi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 07:21:38 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEC99C0401C2;
        Mon,  7 Feb 2022 04:11:56 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id ECA70B8120F;
        Mon,  7 Feb 2022 12:11:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3B14C340EB;
        Mon,  7 Feb 2022 12:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644235912;
        bh=5gMb2sVTGroqNBeDfOf0Z9dK1PjhMmifCwWjbl/BngI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WNOwgobMcO+5QbbaE5uTv5JtVOctLDnzVB4gkvkG5W/jtjnQaIJsSNcsSrARrFuFs
         iUDRb3Mq8U7l1AvhGZK8k6QNixcs3joakKnTAF2FLadTB4hptjP1+qiiKnPmyX1TVk
         G+LCuoyZemDy5D1/VXAC1R+7EOg8NZZXyYqc1nKI6ibKOR7cGRQzmgoYdLjqIMGeGR
         mhhedWDNCz+r+PRDEMtApgyVPY9SSF0jn/CcIWp2OBv7lOFkus/6W/kWwZaiU4L0WC
         n/2z4KIc73RpZd5Ceg8Z5tZQP4RWouTViAVcEnqf60beaG2Z4w466nsNq1plDnltY5
         eN+/sLYwrsXSA==
Date:   Mon, 7 Feb 2022 13:11:49 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Henning Schild <henning.schild@siemens.com>
Subject: Re: [PATCH v4 6/8] i2c: i801: convert to use common P2SB accessor
Message-ID: <YgEMhTT87aY76JQZ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>, Kate Hsuan <hpa@redhat.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tony Luck <tony.luck@intel.com>, James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>, Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Henning Schild <henning.schild@siemens.com>
References: <20220131151346.45792-1-andriy.shevchenko@linux.intel.com>
 <20220131151346.45792-7-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="q6vDFucLg0OY10c4"
Content-Disposition: inline
In-Reply-To: <20220131151346.45792-7-andriy.shevchenko@linux.intel.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--q6vDFucLg0OY10c4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 31, 2022 at 05:13:44PM +0200, Andy Shevchenko wrote:
> Since we have a common P2SB accessor in tree we may use it instead of
> open coded variants.
>=20
> Replace custom code by p2sb_bar() call.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Hans de Goede <hdegoede@redhat.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Wolfram Sang <wsa@kernel.org>


--q6vDFucLg0OY10c4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIBDIUACgkQFA3kzBSg
KbZUaA/8DRJuCj7W7r4GvotOsX0pfGB7yfmokP/mtSPdJf2Dwu7d1QFlD1LAT4Bn
Ne9tAGHdPQ+I2fkolX/+mojLbwBWBMtQELFQYJEOKcLpt77H8IR+9d0HvGXuycal
bA59hcNywNJB6BVWYJXxJgCovLxZmet5Pvl+vo3+ArxbJI2UzZNwhg+6SfEj+mwE
S0ZjZyD7+BJfFYZ44AGQn9p8bqDiC0vz7T/yTUz5GVylNJ4blPLcjEZ/gFDvXgBL
L0Cio2QiPf7V7q/awOxmQr8iIWMbAu8/kjjQbr+2astCs92x65sv0QakJzJt+2GG
3MSzyWKJIzUpJLG07IJlP98ZK0aB+hAkd2XWC5LTN92HRINYKbIuSvOHBGWFk4eG
nJMxbq35p67nOdx0ba4w7NjyrysdKmqZrTbZC+e1j7KJMezTCP7PGLlB/68ic0RN
mg7gEuBRltMw1CqLIZzR8cQRiPSwMd47msNoJ9l84FLk/N+0arFI/sw7lrUUgWUR
ug0VLz3WfSfF6t+g7Vsqnk4ZbQ0g5FMOYQdDryqhoFDy9d2V+aoC98AG3JqoJ5Mg
ejSV//Jtw2fYvbmbgvNmKMavq3tsbpcpkYukU9l/dbJAfo/q39ptyKpKRjNMfkjF
ZW96HlhXKStsI6ei/0BFzZ2Il/ztJKtxBxMIJ3NMtqWw0Ipscxk=
=Y6Q6
-----END PGP SIGNATURE-----

--q6vDFucLg0OY10c4--
