Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A93877ACBEA
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Sep 2023 22:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229480AbjIXU4L (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 24 Sep 2023 16:56:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjIXU4K (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 24 Sep 2023 16:56:10 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0141EE;
        Sun, 24 Sep 2023 13:56:04 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C40B1C433C8;
        Sun, 24 Sep 2023 20:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695588964;
        bh=eli+a6xpbGKrYE4WULT6ADRUN8cVjtarJkSExGSpHgc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GmGVh311sNAiu1ZifEr7U6q4HyZWu9Ztw7iVbdxJteoO5XktWmF/peG+MfZMpUOkU
         MkzVEAK9zH6Nf3yF7d2tJ4vkYlubPycQzlsROVBlZYxqBGBbysYVZyaaaXIqJl3yNe
         Mi1ncErtnx740r7+eFxT7jYCJpG4RPLXsyqJTS3Q4jKju2E5kj4znNDh+r7XeLBPXI
         JqR+8h/BOjDyvpp0Llv8qb6+xJWopK5Afjcf2XbovS9BuLJGjmzqhfzSmWNUZq8rbg
         uoViV4e/MMkzyfOgBXhmi3z93BkjO03MLipBmjxoD5nm9k5wfJ1SjQeiazBHln39zp
         j1aiC/4yvuiQw==
Date:   Sun, 24 Sep 2023 22:56:00 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Mario Limonciello <mario.limonciello@amd.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
Subject: Re: [PATCH v1 1/9] i2c: designware: Move has_acpi_companion() to
 common code
Message-ID: <ZRCiYI5SMEVxxJ98@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Mario Limonciello <mario.limonciello@amd.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
References: <20230725143023.86325-1-andriy.shevchenko@linux.intel.com>
 <20230725143023.86325-2-andriy.shevchenko@linux.intel.com>
 <20230725214521.zxjqinryvva2zanx@intel.intel>
 <928d54c4-ec71-5f09-ed66-5f9c52aca6ba@linux.intel.com>
 <ZMgWJY3w/HhsZvVd@smile.fi.intel.com>
 <2e2f4d7e-2831-9161-9564-3d1e89511727@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OPcQ6rHun7cvimSP"
Content-Disposition: inline
In-Reply-To: <2e2f4d7e-2831-9161-9564-3d1e89511727@linux.intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--OPcQ6rHun7cvimSP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 03, 2023 at 04:43:32PM +0300, Jarkko Nikula wrote:
> On 7/31/23 23:14, Andy Shevchenko wrote:
> > On Fri, Jul 28, 2023 at 02:33:07PM +0300, Jarkko Nikula wrote:
> > > On 7/26/23 00:45, Andi Shyti wrote:
> > > > On Tue, Jul 25, 2023 at 05:30:15PM +0300, Andy Shevchenko wrote:
> >=20
> > ...
> >=20
> > > > > -int i2c_dw_acpi_configure(struct device *device)
> > > > > +static void i2c_dw_acpi_do_configure(struct dw_i2c_dev *dev, str=
uct device *device)
> > >=20
> > > Because of this dual dev pointer obscurity which is cleaned in the ne=
xt
> > > patch and Andi's comment below in my opinion it makes sense to combine
> > > patches 1 and 2.
> >=20
> > Besides that these 2 are logically slightly different, the changes don'=
t drop
> > the duality here. And there is also the other patch at the end of the s=
eries
> > that makes the below disappear.
> >=20
> > Not sure that any of these would be the best approach (Git commit is ch=
eap,
> > maintenance and backporting might be harder). So, ideas are welcome!
> >=20
> Unless I'm missing something you won't need to carry both struct dw_i2c_d=
ev
> *dev and struct device *device since struct dw_i2c_dev carries it already
> and it's set before calling the dw_i2c_of_configure() and
> i2c_dw_acpi_configure().
>=20
> Also it feels needless to add new _do_configure() functions since only
> reason for them seems to be how patches are organized now.
>=20
> So if instead of this in i2c_dw_fw_parse_and_configure()
>=20
> 	if (is_of_node(fwnode))
> 		i2c_dw_of_do_configure(dev, dev->dev);
> 	else if (is_acpi_node(fwnode))
> 		i2c_dw_acpi_do_configure(dev, dev->dev);
>=20
> let end result be
>=20
> 	if (is_of_node(fwnode))
> 		i2c_dw_of_configure(dev);
> 	else if (is_acpi_node(fwnode))
> 		i2c_dw_acpi_configure(dev);
>=20
> My gut feeling says patchset would be a bit simpler if we aim for this end
> result in mind.
>=20
> Simplest patches like int to void return type conversion first since eith=
er
> i2c_dw_acpi_configure() and dw_i2c_of_configure() return is not used now.
> Then perhaps dw_i2c_of_configure() renaming.
>=20
> Moving to common code I don't know how well it's splittable into smaller
> patches or would single bigger patch look better.

Does this all mean that the series needs to be refactored?


--OPcQ6rHun7cvimSP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUQomAACgkQFA3kzBSg
KbYm7g//R3U106FWzwxdqiGWBmStt2qi2WlQG4Jxw2FW9LfeOQkVO42xF1i2noHY
iWMPw+F/0li2p/84mpYZ0c4G2D7lgsR88HUuHEwn8c6H9ZwtepjmtkLXngLu2aGC
f32rQ/AX04HfnA2DddJN8vM/D05l0IRDlE1t+fImjLsM5NwGRAwAe8ikQrYVgAHy
Z7VC/gDrUZRxdWy1bseh35p3BazQdd5KyspgE7p8KGCWHh5054k4xqIZ3aLNIbJg
FKLVPLeFLoBc5PbTjT1Ptw8tbxilPrlX4CfRjpLeczYbsts1J/czpxAS4AeNL4sD
numdLRJFgVlOdpCVG9YbiPSB0ZzToi9pWOakIrRc4vbUZoSst7tZA6P/30u6v+nu
6HRL5VR6m94LXOSu6Mr2dZgZ7vDcyXMDUyc77s8fmjAmB4rg4TQD7rsLCp8fjv6q
7+/ZubWgsHmzoKmrYiltVVxK7aF7n/Tuxdi2rc4iIXtsX2QeUkJkVWR2N8Yt7zDB
WU6RyyOAgwHLa6FAdAgeybUYkzjJ8kc42RcWd1dYY2TY9As4MtdTfyr43vq0/a2p
JZ+920CwiD9Hcw+iurABIDYJ6xxrE8zRL1X94zNHAfUidBGq0WY+L4SQALyH1+/g
njYuaHw9H7X+wV9O8j87axuqXi8Ihl7SGnqTm1PxZrhFF5lm4f8=
=HGOL
-----END PGP SIGNATURE-----

--OPcQ6rHun7cvimSP--
