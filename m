Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F15B674FFB
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jan 2023 09:56:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbjATI4s (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Jan 2023 03:56:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbjATI4r (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Jan 2023 03:56:47 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB66840BD9
        for <linux-i2c@vger.kernel.org>; Fri, 20 Jan 2023 00:56:39 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4204461E5D
        for <linux-i2c@vger.kernel.org>; Fri, 20 Jan 2023 08:56:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 502CEC4339B;
        Fri, 20 Jan 2023 08:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674204998;
        bh=gDXEgenSthBDgkUP+dG+nZ+Hry4k4tfkCsJeRw9xTfk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f0zWGLey1QHjyOpca5mY0vpSullxUQIcIQ1SPQPaPmf0BeiL7a/STNJ2x7J7/Lvmx
         zX1iiPHUXvNPnETdJboBGCvIurOogW1jtuPmk1Us1rS8qpbGQhpZnf5eJDsph7MNkY
         Mkjn4gpYvJpDR90+cFQMJQ6Ddgq3gs1RQU1F9jjWtU3dhSpYdzOGLkt74ZRnRlUEgW
         d6+8rgfluVWHF+Q7pxe3+GQ1MqNnppVN5ZjKCwzqoOiKfo/EecxlczrtF8ntDtcK4o
         IoCm8C77xlv2JkG6LbS/wIGri1Yp14tQhM7XLbjTLuPRGpk+DQ3wnFx4jOjHMNOlp3
         mt61GAXjy75UQ==
Date:   Fri, 20 Jan 2023 09:56:36 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Lars-Peter Clausen <lars@metafoo.de>
Cc:     Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH 3/5] i2c: cadence: Remove redundant expression in if
 clause
Message-ID: <Y8pXRNF98JL5BlQA@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        linux-i2c@vger.kernel.org
References: <20230107211814.1179438-1-lars@metafoo.de>
 <20230107211814.1179438-4-lars@metafoo.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="umojvzVWnyH0LYrY"
Content-Disposition: inline
In-Reply-To: <20230107211814.1179438-4-lars@metafoo.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--umojvzVWnyH0LYrY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 07, 2023 at 01:18:12PM -0800, Lars-Peter Clausen wrote:
> In the mrecv() function the Cadence I2C driver has the following expressi=
on
> in an if clause.
>=20
> 	((id->p_msg->flags & I2C_M_RECV_LEN) !=3D I2C_M_RECV_LEN) &&
> 	 (id->recv_count <=3D CDNS_I2C_FIFO_DEPTH))
>=20
> Earlier in the same function when I2C_M_RECV_LEN is set the recv_count is
> initialized to a value that is larger than CDNS_I2C_FIFO_DEPTH. This means
> if the first expression is false the second expression is also false.
> Checking the first expression is thus redundant and can be removed.
>=20
> This slightly simplifies the logic.
>=20
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>

Applied to for-next, thanks!


--umojvzVWnyH0LYrY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPKV0MACgkQFA3kzBSg
KbbzZQ/9FIvWmT8tiVEPG4/lFjb+7G8kbQ4puxUJIn4mkG8TpEY3uLWxB2SXShLh
OVI0lIvnEG04NUNPgcvgOfsyg5W/3przTzWo3v3DyqsCh1TO0Bi1sZrAnu9v65Jg
VvkVLBjZ4Nc6OifdnxzBbByFAx7VX/jXwZoTBKdZsinzNJkQBixYznSGzHvCrDYo
PxJtExtMTdkgVN+4Aon5Y5Nhl1BbMfUvzA+iIbMQCsYgWH+Z0glEvlIMR3HMVm7U
DQcbvHRRXW6rh4OAWY76+PM9Z9DAUuYkohHKSsTotTqZ7Wa514Qmk3s6im17IRyb
be9oamNBP2429XSJ9lZh6JFvaUH5vc6KGV+OiykGeKFobiS33o9WCst5Rr/1+4t8
wl8pq7NEgNIZJTsR6XHpnvzdr7D9BkIQVCw2nNr02BGqD9d9o8R1Hlpu6tAWFaBP
s7us7zp+TzX4mkTxMeSekPRQLsuMU5SzqKfhF+Ygq6rMGeSW9f9DwYFFvNNw3uDD
lVFqVBwfTwexlu3jxR4XaiNjMDhKGeIzn4ByicXV2kIbJSS5z3tJznpQVuRMReTt
bjvL1Nhk+WfBXZytMUfeQFkIeY1OvvGwjForwF/KAUlO01rrvKNLTSaU0IV35/ZH
9h2UgDiCP9lBSBdrlSYnWJg0mSFaQkwAxC2luJKP4cTFiq+Jf5g=
=4TZV
-----END PGP SIGNATURE-----

--umojvzVWnyH0LYrY--
