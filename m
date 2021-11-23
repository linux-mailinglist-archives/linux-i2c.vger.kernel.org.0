Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0C2A459F69
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Nov 2021 10:42:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232024AbhKWJpw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Nov 2021 04:45:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:60920 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231246AbhKWJpw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 23 Nov 2021 04:45:52 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 960AF604DA;
        Tue, 23 Nov 2021 09:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637660564;
        bh=BQSt/h5bQp45texdQ3SbpmJQeM2/XPJHobfvAc0tLOE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gfyE9+vJlRg70/mZ+qMk8pw1lbSQKJJFniSknSCJ6n5Eo4XAdnEvLRNNRRlVdk9WH
         6fxlWu1rdMIAxo/2I8j9Ss1f1a1MQVQ4E4RkYwS0KfP1bh5nGZV/5VjrgYNWuLmMxt
         85Uqh/wI/Ky7JIGPujsWz3fzCDnTkp787aYdHBYaP1CTAoiL6k3vEqHvfMv0xCeJJS
         mVA4J1arEaiZzuf+HFhTgOdlS23u4fvgiQpnSDPwS4uoAH6qz1F1vccE1xFWDs03Xj
         4AqStMoQQEmRmn5+6bV4L9qo1hnNU1y3v+AuVqImiWT5xKXvHZaTYox40IwlnYavDF
         CaMH0eWKUtx8g==
Date:   Tue, 23 Nov 2021 10:42:40 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: Re: [PATCH] i2c: i801: Restore INTREN on unload
Message-ID: <YZy3kHJKmxJV0DMr@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
References: <20211109160257.4c089eef@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HaRSOAbVq0o7vT2P"
Content-Disposition: inline
In-Reply-To: <20211109160257.4c089eef@endymion>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--HaRSOAbVq0o7vT2P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 09, 2021 at 04:02:57PM +0100, Jean Delvare wrote:
> If driver interrupts are enabled, SMBHSTCNT_INTREN will be 1 after
> the first transaction, and will stay to that value forever. This
> means that interrupts will be generated for both host-initiated
> transactions and also SMBus Alert events even after the driver is
> unloaded. To be on the safe side, we should restore the initial state
> of this bit at suspend and reboot time, as we do for several other
> configuration bits already and for the same reason: the BIOS should
> be handed the device in the same configuration state in which we
> received it. Otherwise interrupts may be generated which nobody
> will process.
>=20
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Applied to for-current, thanks!


--HaRSOAbVq0o7vT2P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGct5AACgkQFA3kzBSg
KbZJxBAAs94pcbwU7Xro25rDo0n3z2vVRlziVPkiTGtyep/ryhDTd31AF/GZfK88
PantJKqkmr3mPcp82CZOfyqZbwEDYiR6QdKAHpsyQ8yUyu1IZDYdSDcy1XlsZTuM
psJpriZgHs+aqf3Mo40JIIqtdQmg5ldmk6lNGbfrbD92v7/uohy6ro/xAjaoOv0t
XOSS4AH8Wv8k3x4tFjG9bkkakF/BMvjAM5crFqJ85NdpLI1tXgIYD2a9pdMhw8KB
uc6rnbQD5xvIp3JvBBuRgkp6ezijALFiknqIYQTL3L7dsh3XKKfaZDvASRhXahEy
FyksHLhZheG1DWGiVC5bGNbHdmdaWJ5MDTf3Hhcm81X1reOdcJ4BIqIfn+l6Rp8K
UcWEe1VBiAC0HLajj3MTSkjJaRHd8xzncRCDXuRxP5nMbkRfk2x04TxLtp0uhvzE
RQViZ6U8x7YJ3PA0WiHkFKl5JzeG9KOAKulu4XV151miSACt+44ntgOLPphJC8tA
skmthI5tm1B2f3zVIDW3mTzzbCL1yD3ZP03w9CIPdaKvmSvWcrZU7FDHZ9SfeNcU
hoMDCdJT9SkPt6ELKlqAMQy2+AXUt6VvJhOWULYZCx7o/1ocetDEbtzjLf/24Nc2
HnR+hj19tN9yfLl7fYXwP0iZ0nW2nZcZOK0liJI2p1ZPCHCnoN0=
=iDHF
-----END PGP SIGNATURE-----

--HaRSOAbVq0o7vT2P--
