Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79936161357
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Feb 2020 14:29:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728424AbgBQN3h (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Feb 2020 08:29:37 -0500
Received: from sauhun.de ([88.99.104.3]:32792 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727089AbgBQN3h (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 17 Feb 2020 08:29:37 -0500
Received: from localhost (p54B3307E.dip0.t-ipconnect.de [84.179.48.126])
        by pokefinder.org (Postfix) with ESMTPSA id 75D4A2C0746;
        Mon, 17 Feb 2020 14:29:35 +0100 (CET)
Date:   Mon, 17 Feb 2020 14:29:35 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Robert Richter <rrichter@marvell.com>
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Jean Delvare <jdelvare@suse.com>,
        George Cherian <gcherian@marvell.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] i2c: convert SMBus alert setup function to return an
 ERRPTR
Message-ID: <20200217132934.GA5838@ninjato>
References: <20200210172929.6001-1-wsa+renesas@sang-engineering.com>
 <20200210172929.6001-2-wsa+renesas@sang-engineering.com>
 <20200217075837.2agub5deqdpet3ce@rric.localdomain>
 <20200217081758.GA2814@ninjato>
 <64a14944-ed27-9f4f-6d1b-e31508c92692@lucaceresoli.net>
 <20200217100056.di54osv76xlcnhdj@rric.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wac7ysb48OaltWcw"
Content-Disposition: inline
In-Reply-To: <20200217100056.di54osv76xlcnhdj@rric.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wac7ysb48OaltWcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Anyway, it's just a function name, but while reading the code it was
> not obvious to me that i2c_install_smbus_alert() is actually a subset
> of i2c_new_client_device(). That said, I like the i2c_client_create*()
> variants.

I agree that i2c_client_create* is a nice naming, but it came in a bit
too late. Renaming the API is a tiresome job, and it shouldn't be done
(again) just for the sake of renaming IMO.

That all being said, I think i2c_new_smbus_alert_device is a better
naming than what is in this patchset and it is my favourite until now.


--wac7ysb48OaltWcw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5KlToACgkQFA3kzBSg
KbaHlQ/+LE9anbJ+qDwab9HkpKMWQOzk4cCv/9tu/9QLBiVVXICzzvQ9u61xo+Pb
/tYF909qA3cZwLNLV7SoH5ujxfAKN1gcls2U63IJHsYchvLwumT4MBKU9907evq6
omsplnI23/vA2wfy19mwSiFdgF3EodI/b5FzVkOt8IAwC4M3JuuaTe3DlzHzoPk0
6or1UdgAhAqZqCigIYpyErxNEvd7BXhjd6X4kq2p3Lys/caUChhEUz7tkcZrQxKt
oSNKzTMzgMWZycz62H34Zx3un7quORbvI8vQnX9wbEjSxxh38Q081BjC0r9RYkhE
Q8V2JAu20kA6wz8Ay8XdftB/vfuugAoaahpBB5fB0v7CHRdbY4VFBED5TOdRJBsz
+9IO8jDXuOdpLuQ537/PJ2+iwC5dq509sKgYrt3t73CdA3/Fbotsn6Cx7xpP4bXG
YBSSZrNUu3+/7Ld9BXrVIS1l87aLNH3lgP601t7fKIgq8MGBCQLlMFlD5UJMAB/d
zzPkhrYUDR+SUqeSttswgCRdFAtRIOThpCKuLWivt/nG/mlOJ/gBWUhDf7UOM6XU
pIMn189L8PwDH08vvtMRu2Z5SUuCmOLD1k0tahUdZwSLihsJTjkaVwGU3qNQOxa4
cqsY4I2IeUUKv437dHpNzWkp0POO5zKFDSIzjZDox1SWs5jZ2WI=
=nH9f
-----END PGP SIGNATURE-----

--wac7ysb48OaltWcw--
