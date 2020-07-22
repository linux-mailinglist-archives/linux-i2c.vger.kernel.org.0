Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EECE229608
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jul 2020 12:29:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732084AbgGVK3E (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jul 2020 06:29:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:43026 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730417AbgGVK3D (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 22 Jul 2020 06:29:03 -0400
Received: from localhost (p54b33083.dip0.t-ipconnect.de [84.179.48.131])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 12AA320729;
        Wed, 22 Jul 2020 10:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595413742;
        bh=lTc4TRlHDScl5Z1G4HHxd8eHjd5BknTeB2jTOiImhU4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0yFUs6b3bNer+1h93+pB9OHGrqgmBCKXlv2B+Fr6ioy4KEsMc+q9WO1UkCQuNY/g2
         J46BbsE3+n/aHgR7etj2QOZ2GUPn7abrI094s00GTr03+gp32yAmFM0ooFnIJ5dtRt
         MWbLN+pKd+robgVcRKusbrpCRzXO+MmWLzOPklcg=
Date:   Wed, 22 Jul 2020 12:29:00 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Cc:     linux-i2c@vger.kernel.org, michal.simek@xilinx.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        git@xilinx.com
Subject: Re: [PATCH 1/2] Revert "i2c: cadence: Fix the hold bit setting"
Message-ID: <20200722102859.GI1030@ninjato>
References: <1593784549-21489-1-git-send-email-raviteja.narayanam@xilinx.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BWWlCdgt6QLN7tv3"
Content-Disposition: inline
In-Reply-To: <1593784549-21489-1-git-send-email-raviteja.narayanam@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--BWWlCdgt6QLN7tv3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 03, 2020 at 07:25:49PM +0530, Raviteja Narayanam wrote:
> This reverts commit d358def706880defa4c9e87381c5bf086a97d5f9.
>=20
> There are two issues with "i2c: cadence: Fix the hold bit setting" commit.
>=20
> 1. In case of combined message request from user space, when the HOLD
> bit is cleared in cdns_i2c_mrecv function, a STOP condition is sent
> on the bus even before the last message is started. This is because when
> the HOLD bit is cleared, the FIFOS are empty and there is no pending
> transfer. The STOP condition should occur only after the last message
> is completed.
>=20
> 2. The code added by the commit is redundant. Driver is handling the
> setting/clearing of HOLD bit in right way before the commit.
>=20
> The setting of HOLD bit based on 'bus_hold_flag' is taken care in
> cdns_i2c_master_xfer function even before cdns_i2c_msend/cdns_i2c_recv
> functions.
>=20
> The clearing of HOLD bit is taken care at the end of cdns_i2c_msend and
> cdns_i2c_recv functions based on bus_hold_flag and byte count.
> Since clearing of HOLD bit is done after the slave address is written to
> the register (writing to address register triggers the message transfer),
> it is ensured that STOP condition occurs at the right time after
> completion of the pending transfer (last message).
>=20
> Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>

Applied to for-current, thanks!


--BWWlCdgt6QLN7tv3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8YFOsACgkQFA3kzBSg
KbZT0BAAj7CTkxywHYj4mY+dcRZVfFPQUg5hgqR23yDUWFDdg7vy7tbjqUXHvnXh
AtmREV11AUlyUbDjC+0nrC42HKxVd4BXfqSfXnMZ27jDZ8RVGrUBkfq2TTnaVrwn
JYQSihhIojqqOWfVLWeCKjFoonrYCEUyEWucf6WGgFAm1A4+VKHwX74As9dlsRDL
5Tb8K3r33hC//HuuJbR30Vp1zVDH7jLj/Uv5fp+y8v5uFHc2bjYqN+2mSu6194YX
yAbZejkFjqK5J7bxlLlM79lyNmMnjw6ahnus8+QP/FoN+/D8tpdqZJZMLz+Efgv+
wj+VmVmO7zWtoOg1jFTAserdcNJ4o+swCYP43Ur1fuECGZjWyOo/9KJoFWLBMPke
1EToZZLuQsLxOgeDf1wvb9KM5pPzDuAcSw5INuCHvTIhYxN8Gss8UmBEbykukUld
JRBvDY3jhc8cgNRMhZnVa4yGPk4AVJU/AzhfUyjR7uUrqJGEmE4jMWljwmPTyrH1
vEMUUSlVDwxCd4eeWDJwdhK1+d29+RyH7Sr9m3LNGRmau569nnMJV79UUHO66oBv
xzFS2maiwT7Fwv54PjqBKTULjD7Itnvs9/EERIKLtDp4yLEmreNV+3uiNy/RLm3s
YbSc2UXp037LXDjIUJwn6WcYHtwfUmbwG/5j5CfGFkPY66l5Vt8=
=iU1Q
-----END PGP SIGNATURE-----

--BWWlCdgt6QLN7tv3--
