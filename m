Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09E653936D2
	for <lists+linux-i2c@lfdr.de>; Thu, 27 May 2021 22:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235375AbhE0UK5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 May 2021 16:10:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:33842 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235263AbhE0UK4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 27 May 2021 16:10:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B15AA613CC;
        Thu, 27 May 2021 20:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622146163;
        bh=UdOSMJhiWdMFuMPyZC8SgDIJ+u21cVkCCXaws8FpHNk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=djGJNcrw6YV/UdDdiCPi2k4Mn9afOaZuYC803YugvpoJJCl0bSps3PPluNh30iN1P
         dvA9MWw6Fv+3Bz9grT/Nlhotijvr/Lb8RO0kLXY4pDOmy5us4wLgEIes6L2HDkwLAt
         Tho+5PToeoGsuad97pevI8QUlmuWWRZpDrD4WKnlnOOU4vzhbsAiApe/5XvU/Uj3dD
         Ja0DFCUGyPT+VDOish72tDn+Q5h1pvrdczYx7XcrGzpp6zcv70W8UPG2TW7gUizPuC
         cR+HGpEPwlpBdlf3+3VEPjWsFtvYCnkW2e1+BarvFqPkYxEEnISKicA3Z2P5CgAF9w
         MHYLD9Q0RNWVA==
Date:   Thu, 27 May 2021 22:09:20 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Heiner Kallweit <hkallweit1@gmail.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: i801: Remove unneeded warning after
 wait_event_timeout timeout
Message-ID: <YK/8cIogwcLg1sFz@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>, linux-i2c@vger.kernel.org
References: <561b74ab-b020-b0c7-c1ad-b7c3326245e3@gmail.com>
 <103951a0-4233-bbaf-2192-ac140469b07e@gmail.com>
 <20210525120012.1ea1d5f1@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4ThZwLgsyJjpHNNu"
Content-Disposition: inline
In-Reply-To: <20210525120012.1ea1d5f1@endymion>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--4ThZwLgsyJjpHNNu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 25, 2021 at 12:00:12PM +0200, Jean Delvare wrote:
> On Sat, 22 May 2021 00:00:28 +0200, Heiner Kallweit wrote:
> > When passing -ETIMEDOUT to i801_check_post() it will emit a timeout
> > error message. I don't see much benefit in an additional warning
> > stating more or less the same.
> >=20
> > Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-next, thanks!


--4ThZwLgsyJjpHNNu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCv/GsACgkQFA3kzBSg
Kbb7OBAApY3e2SLHLGvkrZAYiN6Hyw1/5FQiMXNOXYVu03mxk40vyUA2SLrNXlnP
bzCQLJDcfUtaL1lwKXPiQK75xYxEff3y3wCsNepPXvtH+1GV2ahz/+IHaZZJt+fz
aFWGeMFZ8z7Sp+5jTMevYirjRhZQr5aiOzPbkknnHsBO9DvHz0pCjzr0EW2CzC9Y
5w9oW+MC8TUnTVzkZLlZfQuAzbiya6pf0aoEzIm3YI8pA/pRbH2a3Ohd6+twRwlB
GFiBwxE6yZuGNiuvoIeobCfcweOY0hGDc1n/G2/aQ9zIQdWzMYFwZPtNe1dfjugx
cKk/PZENLvVndzQQxYsfihPsb5AR7YKxA2vFDzmvXpSYMFnS9gpdOdE5fA6x3lZI
M+d+AI7sVWkMD9wxNDtcwN1SUnPbLQ6dNbW/ZWaSMgHslgIljSNRDB3/pl3FeI/J
5Nl0B1tRqncgJ9N0KNPGJBJpUHDVF2kq6JiwEFPWnxkoeSQzLEGgtF048gz8jDny
sdx7/+nOeKeNgbRV1RV+u1ocALOwus4S/Tl+Xi38BVEQ6uJ1WNAG5T16XVF2t3cE
4pkHq9vo06E+fW8bJTr7n3Xq/X/YwAlQ9uW0l7kObzKgiXCA66OtS1QQJpUDkHN4
XtL+ZWupvidUtVVm7xKMwRTDaKuMNxPEpjvt2W7J0F1JLsmKBXE=
=iO7/
-----END PGP SIGNATURE-----

--4ThZwLgsyJjpHNNu--
