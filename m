Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAB356BD92A
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Mar 2023 20:29:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbjCPT3l (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Mar 2023 15:29:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230199AbjCPT3j (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Mar 2023 15:29:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C52298093B
        for <linux-i2c@vger.kernel.org>; Thu, 16 Mar 2023 12:29:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 599C8620F1
        for <linux-i2c@vger.kernel.org>; Thu, 16 Mar 2023 19:29:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48780C433D2;
        Thu, 16 Mar 2023 19:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678994976;
        bh=+rpae27puJL35u4doHYNedSQrB3DV/YNHkjxrlxDN8s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jfu7/8bjmjd6oQxKA7zrTmN6N6m5eTkiKPjvVp7VgxrzqoJ5jP2i82Vd5eiuURi0p
         QTRZaKcLT8slyp+MEusmmFWPWNcX+ZR1IcZX6u0eN6xqM4L9oMzpFb9lGOWb+2Pt5t
         EmH8wfmWHE8uNPvAWnTWD79PVGeiXfjfko5UEjPwIe8l8VQxYh5w4XDLyRFusu7vKs
         G6a2NWVlQMLmjfACadXQK/NB6E9N6C6pK0HEhGKpsaEjr0p7RAfr0lisHmeF04x1AY
         SWau9ANrP11SccZOwPNNyr2BF6Cbu4yE3gJn91R5ZAHmkxFemcQ0xk0IusIOZAi3/T
         m7WAwGAAU7IOQ==
Date:   Thu, 16 Mar 2023 20:29:33 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Lars-Peter Clausen <lars@metafoo.de>
Cc:     Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH 5/5] i2c: cadence: Remove unnecessary register reads
Message-ID: <ZBNuHahnC4XBbaoL@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        linux-i2c@vger.kernel.org
References: <20230107211814.1179438-1-lars@metafoo.de>
 <20230107211814.1179438-6-lars@metafoo.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3XK6eob4zpMBj8G9"
Content-Disposition: inline
In-Reply-To: <20230107211814.1179438-6-lars@metafoo.de>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--3XK6eob4zpMBj8G9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 07, 2023 at 01:18:14PM -0800, Lars-Peter Clausen wrote:
> In the `cdns_i2c_mrecv()` function the CTRL register of the Cadence I2C
> controller is written and read back multiple times. The register value do=
es
> not change on its own. So it is possible to remember the just written val=
ue
> instead of reading it back from the hardware.
>=20
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>

Applied to for-next, thanks!


--3XK6eob4zpMBj8G9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQTbh0ACgkQFA3kzBSg
KbZD9Q//XHqHF4CWToG5+tH0Kyg4m77R4HqlpCfbSfP1z1Dgy3CWqFZXvNLkmUoJ
k8N+B6uX0ydMKCSh1ghE0p0HVYuwJd0v6K1Ha7t42QhdrGfOjAeOWFj218UocNa6
3Di6UH0bVSmqUHWiUbdQm+dhUcXe9WUEnFj4/cXLcECU8k51JXwUPCUrnKKd4Y6b
POEfchExc07tqvH4m+h0MkEaJKLmh1JX3jq+eWjDnyJ27YQEqJ6S25rK7nRWueFN
W01DP2A2Cc7HtKbx8xmTm/xuZCKSkBNZa48kM76ZOvGq3A8/Vu72viqt6l+R1BSB
S8Xz12csPADTYQet6HeUtYZ8Yk9C5t66H8hlho7I69fAzH9j1zX3ZJfISjl3JJnv
AY32/ht+3zNLJMZ3FTjpSrxZCIJpDGS+qiXVEbTZ+SuVvGzK7YmC7G242S+yjYlq
cyE0TjzJ0fAUmLC6x3IZD0eVWLWqshq/hHJhWmoXGrN8ZhMnWD8C1shM0q5GugDW
lsnvJ75bv1SEoOP+kNFIkkR4uy6PEi92YYmdhujqzXcsbScXAjnodOxUKyhTGQdC
a9qfKTrCqti/Qh2ePD2Fss5NVehTQPY8bv2FM+rhyQ/rotcABM39IvtWVzGO6y2y
N4s9r7TDBoTBcam/fdB91IstIask6var2duUc2fnQKiJvCbMS30=
=vMS5
-----END PGP SIGNATURE-----

--3XK6eob4zpMBj8G9--
