Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 884F9527187
	for <lists+linux-i2c@lfdr.de>; Sat, 14 May 2022 16:04:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231540AbiENOEG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 14 May 2022 10:04:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232521AbiENOEG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 14 May 2022 10:04:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7657013FB8
        for <linux-i2c@vger.kernel.org>; Sat, 14 May 2022 07:04:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1058560ECF
        for <linux-i2c@vger.kernel.org>; Sat, 14 May 2022 14:04:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0472C340EE;
        Sat, 14 May 2022 14:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652537044;
        bh=lA/ncMX/s6j27vmAdo2DnMzAdIag6jwvg4ARMvjxDxA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=b/3HCy8WIe/N3p81gndiVDorPaNoCRe7qgZ92tCH/bA3tVoV7fcAMa+K7Lb3hjP7L
         GJ0tAIihTAXtotevNCnoCyyZOZOIFitYtPXfIZ77YfLIBI1m3NjD/LFSqCd/2Iy2l+
         +Eah29AEoOtgUE40fI4MCtBaeklx2ADcKug8cj9dvetpmg7uAjeqQiTiCuKs2PNkwG
         yyCX24sTvsMz+e1v0DrKhDb1z8Z8V+G2qF2UCGCFO7yeGQVsyxXRSGFv07/5LUq7C4
         HcknOi8K0++4tpS9wxDUsi5YxpobMvfKW0FPGEoa5l1tFAq+GQWyjIAha/z2xYJGVx
         BL9JEAPSXhH+w==
Date:   Sat, 14 May 2022 16:04:00 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc:     linux-i2c@vger.kernel.org, michal.simek@xilinx.com, git@xilinx.com,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: Re: [PATCH 4/4] i2c: xiic: Fix Tx Interrupt path for grouped messages
Message-ID: <Yn+20DoaDKLKKM4D@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-i2c@vger.kernel.org, michal.simek@xilinx.com, git@xilinx.com,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
References: <20220420075924.14546-1-shubhrajyoti.datta@xilinx.com>
 <20220420075924.14546-5-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kOiJ8G6OH/lgVq/z"
Content-Disposition: inline
In-Reply-To: <20220420075924.14546-5-shubhrajyoti.datta@xilinx.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--kOiJ8G6OH/lgVq/z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2022 at 01:29:24PM +0530, Shubhrajyoti Datta wrote:
> From: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
>=20
> When a group of messages are sent from user space as a set, if
> the last message has less than Tx FIFO DEPTH number of bytes
> to transfer, Tx half empty interrupt is triggered continuously
> from the hardware. It is due to Bus not busy interrupt coming
> along with Tx half empty and tx empty.
>=20
> Hence, service the Tx interrupts before Bus not busy interrupt
> to update the i2c message status correctly.
>=20
> Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

Applied to for-next, thanks!


--kOiJ8G6OH/lgVq/z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJ/ttAACgkQFA3kzBSg
KbZXuBAAp0gQ27ag0SnrUH97O5q7Oj+k63xwrl82V8+LsO67fnAdYNFkAcUCdctl
kbxTEFxIZ+xzqtdbitb3wzu3Xj2B/pqvMp3UuYmx4UtqV8iKHcZX6qzoRHC5y0iu
bz+mNVC3kr0xuqv7syS92wpE3BCMdsVuW7VhmTTW2NSO18cFm2n/uXTBCYvpJaG/
cyN45+b3wDxVM9eEGT0vJD/7e7NZckblUuOSZ9KATHsE2W4USl6Gf8C3zBrDg1+W
d2C/lfBkGb9u0GwLJMEDB8wVxa51oQdy5KURZCVGn3F9/0aljkbj7kS+svibad3+
cDLbOTankQYeUaoDwkddWfcIfBGpur11V59lRsx1rQLIcsGtNQWxn/1Fj6c/u0CS
05tCNV5FfPAhR9hcSmGiLIOT+2HDi+wmsWf5GGz6booNeNJH9M0ljzA2r8/pg4tQ
uzvpjsGpRhVJZUrI+6HGDHO8ZRWoBnh95CKhbyp7fuVw9aSmL5TS1l4aTr/m+uZQ
g2Nmy0vdiq8MEG9Jd0AoYZ//pwJ8e0UIdqdFIx9sz++Cqn0i9HQl3jJCr8QbybTY
jx3ETC4+OCxUpKchKhs6EMlMfl2GSProBioPQbpSSNm/BnO/lmFvUe7YpkwGDHBB
QAMlW+CKuJ3kwaC2f9j+1idvT20OW1FI+coqXAnvBOYkEz0ZVcc=
=T2y7
-----END PGP SIGNATURE-----

--kOiJ8G6OH/lgVq/z--
