Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1684B6AA05D
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Mar 2023 20:59:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230482AbjCCT7y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Mar 2023 14:59:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230351AbjCCT7x (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Mar 2023 14:59:53 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DC555F514
        for <linux-i2c@vger.kernel.org>; Fri,  3 Mar 2023 11:59:52 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0F711618CB
        for <linux-i2c@vger.kernel.org>; Fri,  3 Mar 2023 19:59:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E798BC433EF;
        Fri,  3 Mar 2023 19:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677873591;
        bh=ZgqkCWOvuKdyh41grPWN89gmsQ/cEZ+u5B8RuVmQJ7E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oiKb+InDmX7Yf1tTsjOURhWMifLfULJpcW9+jSG6RZje/xLjRkEn82GBO6CtjghR1
         /X21bk4rDRlUQLi33Bh38txAnV3musrVQl8sZSx+qJKhHIoOWCvaHSDCCsO0YYI6nw
         wQdu/84kGC4Mt1KWUcPbhPWQfHYtOWwOZft7sjI//mbN0x0ZuO32837mAo4JPbxvUm
         wK4Io7KgTpXkFHnNh50chMluawD1GN46jMGrvT7NgAYUuW4PBprLfuBoD6BFyxmR12
         DOPnY/MBLnSOEPdqwYz21ojbu3kKvAoTahCOUzXXv56IqypG4OmbcVbFjnGe36OH8w
         JW0px2/mS4Dhw==
Date:   Fri, 3 Mar 2023 20:59:47 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-i2c@vger.kernel.org
Cc:     nick.hawkins@hpe.com
Subject: Re: [PATCH] i2c: gxp: remove "empty" switch statement
Message-ID: <ZAJRs051DicI2TL1@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        nick.hawkins@hpe.com
References: <20230217221330.27000-1-wsa@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+ABsHU9nLFy5vXyD"
Content-Disposition: inline
In-Reply-To: <20230217221330.27000-1-wsa@kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--+ABsHU9nLFy5vXyD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 17, 2023 at 11:13:30PM +0100, Wolfram Sang wrote:
> There used to be error messages which had to go. Now, it only consists
> of 'break's, so it can go.
>=20
> Signed-off-by: Wolfram Sang <wsa@kernel.org>

Nick, I hope you don't mind that I apply this without your ack, I'd like
to have the driver proper with rc1 and time is running out. I'd think
the patch is trivial enough.

Applied to for-curent!


--+ABsHU9nLFy5vXyD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQCUbMACgkQFA3kzBSg
KbZrEg//YexHf+oQqKPxom49bg3jI0ydZ5ZxOm4KiJR6Jb2CNUrqgousfMMANV5N
00t9o42Vjj9aGf3ZCM2/FuxFEPhHW92vAT6yrHbmJR1Gx4F79NCFaPglHV06Uo3E
AHDpNeLvJqRUZY8Z2Q+5rA5heODFTJC8voYqqoI1ZlGwbK/jblisH0C1plBeEKoz
934OeE8IzsOU9gj0J7vgUI1vRHSYk3DLERbGv9E0nnmNGP8oC23FYObTLe7vfoSV
VEaIPNyzixyADXlZzKKYhIo0UxaGQpsi+w1B6gCMZCYYcCdy6BgZG81rH8aRgMEv
QsngNYqgONm8n8yp8S1tFqEeVuwZWyN0Z5ABmXrM92C7XOHEIrZq6krd93YXDhfo
X4GIy92d6eiNlQttDOtQzrw6avyPwyHSCUJGMTmD+dZf8FOZ8+LrSWRSDhu1aZlQ
os92E+Yfd6nu6zCF2ZbFGVvotNy69o4tYmOSaNkp3WDcEh20KaWYu2/PomR/TDXv
ALGr719GUNFU9HKGArQbSt97JHyLQ2bRJWC+ypwnWkx7jccnuT76IvrFZVrMT7Hl
bi3CqYpbvnLOUomJvVDC+dlzyytGCSzUkPS14H+cTb4DKl1jrvW5JAbGcdspToQ0
uQO7VbIV+TdCAFAV063AMlTLNoOnrnEvWbExZ8mLdZkM5rv7BXE=
=vdtC
-----END PGP SIGNATURE-----

--+ABsHU9nLFy5vXyD--
