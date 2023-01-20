Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97BA5674FFA
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jan 2023 09:56:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbjATI4q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Jan 2023 03:56:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbjATI4p (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Jan 2023 03:56:45 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4609366AF
        for <linux-i2c@vger.kernel.org>; Fri, 20 Jan 2023 00:56:32 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7FE6561E6E
        for <linux-i2c@vger.kernel.org>; Fri, 20 Jan 2023 08:56:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90431C433D2;
        Fri, 20 Jan 2023 08:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674204991;
        bh=xoJYwQt6LPwNvRAiNpky3HGDMZIyJldv0p+RI34auoM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qlauZbrwjrsL2vm4Elv2KSDT3XnhX0GzAcI9hOIEHap6A0fzmgWrHsaLwLBAlzg5B
         Hk2u2i9wwJhKjasvxRaeKVnmvuj8dE/vWPX1frkYeo5iDhWQME9dBjP8bI5RN8iZFs
         Z+QTSa4bWFjZneoEX7tFuVPMwE8Ifdd+FGTH46NBOmP74kqZzpl2Cc99ULTJdcaEJ2
         eHmblTmeJIWGeRwFz+ZXswO+YVsWEOmgIoW03kqZN3kImn+GC53+JuLamzUklPi9f+
         OglYk09YRUhvICZGJ8M4cAwqx7GutkES7WQLV4Ng/r3wW+MY0HiRFlCWof3iTtk5uP
         wxdSwkhrCrGCg==
Date:   Fri, 20 Jan 2023 09:56:29 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Lars-Peter Clausen <lars@metafoo.de>
Cc:     Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH 2/5] i2c: cadence: Remove `irq` field from driver state
 struct
Message-ID: <Y8pXPS35z/xxhWRn@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        linux-i2c@vger.kernel.org
References: <20230107211814.1179438-1-lars@metafoo.de>
 <20230107211814.1179438-3-lars@metafoo.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BFScS0tkgbLKyfCK"
Content-Disposition: inline
In-Reply-To: <20230107211814.1179438-3-lars@metafoo.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--BFScS0tkgbLKyfCK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 07, 2023 at 01:18:11PM -0800, Lars-Peter Clausen wrote:
> The irq field of the driver state struct is only used in the probe
> function. There is no need to keep it around. Remove it from the state
> struct and use a on-stack variable instead.
>=20
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>

Applied to for-next, thanks!


--BFScS0tkgbLKyfCK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPKVz0ACgkQFA3kzBSg
KbYIwQ//deCOa166GxgexLOFYZ+ax9+ng+Fnulraf9WDE3u+rNcRBO9lRa2JM8UP
bUKNb8xwdwXZbp/a9/+2iNuyi3o6vP2sHgIikYDt5ByL6txovKfZZ+zCePoBhq2+
k5qL2Bb8lQF2yvw1tieUgKBgqIZZla5Iyzcb3jaeWT7B7J/qlXnlTTRyKmsMedHx
wp3LzULAtw+0x7TV81KkDLUw1qKrhUqQkws9//XwdKTcr5cZwTaiPpsAsRdQa84B
c5q9hRPNLZ3iQO6wenfEusKDppTXI0G8l2zBVtpiIwv5CbnQ/mwO+MjM12TL3MaI
HvdZObfllVz8bVqPlbXlgMQ5I73C0k2rMORSlhsqxnIt/1ngQgfi4U1i5q4zGhzq
b+SmTWPiRTmn+607SqEEu1I6Q9IlMV7ZBGSs/LeqHFOZACGUKbkC/sqHWe2JT9Kt
z5QV8qpHPd/FZtfFr4E+2Kqe8aFT2n/PuorThzvbJEtYmqELZwk5IwGYbj16lhBg
qhQj6fJ6d0AmzBTVEv6drKZliLkL7jsvgZ+HDc78Brz2jiolpc07HJ2JxNR7ma9f
rsbNPOm7z3iqbvIB0iJo0+nZStJHAlIGbClsrTkdurL3Qu5GIERNuHNlmnFSUJc2
gJ0/j7JUMjAUw/hn4fVmxfwhJctsECZvuSkC5I8jykK/7nrtkrw=
=MMv3
-----END PGP SIGNATURE-----

--BFScS0tkgbLKyfCK--
