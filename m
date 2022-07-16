Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0694576E0E
	for <lists+linux-i2c@lfdr.de>; Sat, 16 Jul 2022 14:47:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232118AbiGPMq6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 16 Jul 2022 08:46:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232125AbiGPMq6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 16 Jul 2022 08:46:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC83F1FCEC
        for <linux-i2c@vger.kernel.org>; Sat, 16 Jul 2022 05:46:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 59F9961006
        for <linux-i2c@vger.kernel.org>; Sat, 16 Jul 2022 12:46:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05D91C34114;
        Sat, 16 Jul 2022 12:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657975612;
        bh=daCVSKbECk7BW7tT3I7FVOEJeYqbUtJ5Mv8PdmjGO70=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sO7qLBXD4Rf6zNXgTLktvX/kJ0JNgyg8QEDNwz0P4bFT0o24xWgez1RFee0wh2ywB
         MzQCWBndvOFlX4iSwqPv+7HEWeT+OWKHLjRAA5MRQsvMNG31pqYZmHxYg4K2CM1p+g
         faK1M26BOE7svvRLW2megIYcFxjtQfRZHQy7vJ3Bjb9afeOh+I0MWDHfR2gKcsFGXu
         uQ4FapjOnpo9TVtaH5KQiYNfbzjjaN3wWiHCciHQ+vVPZGc5YLvLIXe7s6x4zUfy3y
         piKJpCNIZapT0Zzpts3f+Ai3hqfr3liX/LLyR9A/1zOGvgive2acwhH+Jax+FsdCUS
         sKkViFkr3gLZQ==
Date:   Sat, 16 Jul 2022 14:46:48 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Robert Hancock <robert.hancock@calian.com>
Cc:     linux-i2c@vger.kernel.org, raviteja.narayanam@xilinx.com,
        michal.simek@xilinx.com, anurag.kumar.vulisha@xilinx.com,
        shubhrajyoti.datta@xilinx.com
Subject: Re: [PATCH] i2c: cadence: Change large transfer count reset logic to
 be unconditional
Message-ID: <YtKzOBdSy754CkQ1@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Robert Hancock <robert.hancock@calian.com>,
        linux-i2c@vger.kernel.org, raviteja.narayanam@xilinx.com,
        michal.simek@xilinx.com, anurag.kumar.vulisha@xilinx.com,
        shubhrajyoti.datta@xilinx.com
References: <20220614232919.1372621-1-robert.hancock@calian.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bTjDDnMB48NSlAME"
Content-Disposition: inline
In-Reply-To: <20220614232919.1372621-1-robert.hancock@calian.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--bTjDDnMB48NSlAME
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 14, 2022 at 05:29:19PM -0600, Robert Hancock wrote:
> Problems were observed on the Xilinx ZynqMP platform with large I2C reads.
> When a read of 277 bytes was performed, the controller NAKed the transfer
> after only 252 bytes were transferred and returned an ENXIO error on the
> transfer.
>=20
> There is some code in cdns_i2c_master_isr to handle this case by resetting
> the transfer count in the controller before it reaches 0, to allow larger
> transfers to work, but it was conditional on the CDNS_I2C_BROKEN_HOLD_BIT
> quirk being set on the controller, and ZynqMP uses the r1p14 version of
> the core where this quirk is not being set. The requirement to do this to
> support larger reads seems like an inherently required workaround due to
> the core only having an 8-bit transfer size register, so it does not
> appear that this should be conditional on the broken HOLD bit quirk which
> is used elsewhere in the driver.
>=20
> Remove the dependency on the CDNS_I2C_BROKEN_HOLD_BIT for this transfer
> size reset logic to fix this problem.
>=20
> Fixes: 63cab195bf49 ("i2c: removed work arounds in i2c driver for Zynq Ul=
trascale+ MPSoC")
> Signed-off-by: Robert Hancock <robert.hancock@calian.com>

Applied to for-current, thanks!


--bTjDDnMB48NSlAME
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLSszgACgkQFA3kzBSg
KbZg3xAAiKUVzvl2IwP7Ht+k2QDzRthCpuR+jZu07SL3Xjay61MnSq9Ugu8zi4Kd
ch01P7stFplSBW9hIQenhuhpa2M8HGqbm0zgSBrPEn6eRTRTjwG2FB2+WW8P+gND
uk1PNm3mFfQVtoXeNNezgvQ6tSAIrWrSTGZ4il7k67jREnjru9XEixsQy48dD5WB
lF3/pYgotlgp9zVL85uxcKDq1GfDFbMiNKvJ7OgwDjL2ivP14wT8zDTjOKelXGjx
04D08VSaaJIR2wCaFA6w4fHIMO3HRmBY6mlZbhI7zEPyRh8Puz1S5azpp/rl0TSe
R0OczLOC2ayLt1p+FMOOrofSbEQ1cf6xPwbijxENJfTwXawDTadi4HNI1u2pjVfW
y0jqu20BWviW6wRDdx0ygifCQXBQfcSjDGyAnNUB7hhoU3L3xEp3MVliqkYD2KrK
cg5N8cezvyHJ0YrnJgtTWGFIfL3bumMt2oce6oxPhiamDW78yHHtBDRw9t4O9NWp
huwUsVYVNb4eJDZ3CX3/g/8Brr/wwXtXJHjtcZ3Doq4nGVwGAwCQOPo8Y3T2zg3i
GcGj+I7wrdeSPxL3ciznH9GfHe45xHf6Ar5MuonE31EQOejoSNQf0KKDWEjzkaFl
0WxDcNh1WgZa6N14Hu1FQFVCy04CP6yWfYOIVTBJ2N/LjKiVASs=
=/1sE
-----END PGP SIGNATURE-----

--bTjDDnMB48NSlAME--
