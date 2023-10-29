Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EAD47DAD7A
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Oct 2023 18:17:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbjJ2RRN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 29 Oct 2023 13:17:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjJ2RRM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 29 Oct 2023 13:17:12 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 713F4AB;
        Sun, 29 Oct 2023 10:17:10 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F652C433C7;
        Sun, 29 Oct 2023 17:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698599830;
        bh=kqHOtdnj+507j2C+JnNESsq5H7LYdz0LhzhA6Vu3rfQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XsE4M9P0mzhzERev83qkMJuMvJH4/AdIG2ZtGMSLbeAjhCZsip6fsg4WDtFH2niRp
         kqMi4prFv/tLAmSnC1Ph+uXxURhIRLU5atU6gjlDQs5Rmerr+GklwSSfL8WgTtZ8d8
         HnZIUE/YaRQjgY2zzLc5TxE7NycUFTWQgDQ2JV+GHM9z5HnwzphW6crER2HTws34sD
         h05ntOySmUa7leVhGHu/Z4Ki8qQgYjQmDiRZJ08OH9bgp7gVKAtZaVgI4YuETK/nor
         /owuA8fQytpfT6nJkOVKUABHI26ocivq0rJXXwx+zNE9oL+Gh6JM21nbfNwNuM+w0F
         w5LAjZLs6IAUQ==
Date:   Sun, 29 Oct 2023 18:17:06 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Marius Hoch <mail@mariushoch.de>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] i2c: i801: Force no IRQ for Dell Latitude E7450
Message-ID: <ZT6TknMc+34NCqPG@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Marius Hoch <mail@mariushoch.de>, Jean Delvare <jdelvare@suse.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230514103634.235917-1-mail@mariushoch.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LVHbfEbx9LzAVSb2"
Content-Disposition: inline
In-Reply-To: <20230514103634.235917-1-mail@mariushoch.de>
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--LVHbfEbx9LzAVSb2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 14, 2023 at 12:36:32PM +0200, Marius Hoch wrote:
> The Dell Latitude E7450 uses IRQ 18 for the accelerometer,
> but also claims that the SMBus uses IRQ 18. This will
> result in:
>=20
> i801_smbus 0000:00:1f.3: PCI INT C: failed to register GSI
> i801_smbus 0000:00:1f.3: Failed to enable SMBus PCI device (-16)
> i801_smbus: probe of 0000:00:1f.3 failed with error -16
>=20
> Force the SMBus IRQ to IRQ_NOTCONNECTED in this case, so that
> we fall back to polling, which also seems to be what the (very
> dated) Windows 7 drivers on the Dell Latitude E7450 do.
>=20
> This was tested on Dell Latitude E7450.
>=20
> I chose to explicitly list all affected devices here, but
> alternatively it would be possible to do this programmatically:
> If the initial pcim_enable_device fails and we're on (any)
> Dell Latitude, re-try with IRQ_NOTCONNECTED.
>=20
> Marius Hoch (2):
>   i2c: i801: Force no IRQ for Dell Latitude E7450
>   i2c: i801: Force no IRQ for further Dell Latitudes
>=20
>  drivers/i2c/busses/i2c-i801.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)

Where are we with this patch set? Other solution found already?
Discussion stalled? Too much other things going on?


--LVHbfEbx9LzAVSb2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmU+k5IACgkQFA3kzBSg
KbafUxAAgd58sc/w7TNN3XnqkARACN+uSB+NhVdhfF7g2NJbNSpUzXWttkaBD8L8
fqlX8gD9sNHs4cBL0MlCnUPDoA67flTb/q96Sk6zadnAL4eNW4v1bQpxHK1StNqR
8bEeEYAyoUGX6Xe2rdYiESHjtFNy2YCMX6pzAvLJn+yHwTrMcrYFU/VtOHi7HfA/
qiTUZJbLfrl1OXxqcuEBUyYB2WhXed/SRsO0NdKhkpwn90V/s4EwrlVXjGpuUKdn
0mI+OrCTt8umBQDn023FWtvUX8lWww4KQOo2szsMD/deCt4YzsYLO00Aj1z/T+GY
YvYYo4R1W9zVZnbXq7w+nihYIApiaEN3QiICzbo4YvubRqyMeJ1B+vSutIrLVFKS
gT2T90sMtWKxXjS/zAFSCB63dgabml8QB1o1SqdsLHL9l7vrnKK7TKXDrzo5I+Jg
z/2mdCsxyaPHMjHRhk9dKQ3BtOHPSXsKajePtkgj1RYuOpSbI4EMt92l+luVgCUK
s5miafDazxyru0b8F7zccy0FvMwXhJSMHChlfzjVbAvjwr/s79bzPEPuRNRoqJFB
QXeODrTouBci68cqnV+eq3KL334+2mNB/yiVIWyckrcrmVdzXye+f1HshKNFwL2y
XtPHFHG1lDWLVdbIq3O6kEm+Skr/5cDWSerAT8q/g5a1HaIJzM0=
=yPh2
-----END PGP SIGNATURE-----

--LVHbfEbx9LzAVSb2--
