Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 492BA614B07
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Nov 2022 13:45:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229511AbiKAMpZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Nov 2022 08:45:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230295AbiKAMpY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Nov 2022 08:45:24 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7109A1AF1A;
        Tue,  1 Nov 2022 05:45:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1398AB81C9C;
        Tue,  1 Nov 2022 12:45:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B217C43470;
        Tue,  1 Nov 2022 12:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667306720;
        bh=pB6J1z4n/eqy93yhnvL7eDVaMSLRXXGitapDfJcOOyQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gw0aZkRWhB1C2HhDgK3atKN/2j31j7NpjyvhbxElBXIA+anT9eTN+Dj3E6T0qOGKW
         V0Jbcb/UdRdxoudrb0i4bVNGg1aQV1827h55DrMhVQz9CVHOfF5YKQgjuM75ZhTJmu
         dHiz9wvXQ/+Udci6NFxrVzEWVfJmhDpJE/fu7055soKnDEtZdLqW/thVHik3dhMiUU
         ppMbF8SS4/PgP9h+E48yqi89E4anPBnSTPe0u8B9pamD6kWnm/YHli443BDcOBRCSf
         wXInrINxondGetTLxCbVFJ/TrjU/aJK69D+co9Qoj9/OmTY0GfOrMPmjP3lJV6vire
         aFRvfWs/5WBpA==
Date:   Tue, 1 Nov 2022 13:45:17 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: npcm7xx: Annotate register field definitions
 with longer names
Message-ID: <Y2EU3aLbwfq8wXUv@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        linux-kernel@vger.kernel.org
References: <20221008125924.1220203-1-j.neuschaefer@gmx.net>
 <20221008125924.1220203-2-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="aC1YO4lQe2I8bgSA"
Content-Disposition: inline
In-Reply-To: <20221008125924.1220203-2-j.neuschaefer@gmx.net>
X-Spam-Status: No, score=-8.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--aC1YO4lQe2I8bgSA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 08, 2022 at 02:59:24PM +0200, Jonathan Neusch=C3=A4fer wrote:
> To make the code easier to understand, add longer names to the
> definitions of register fields. These longer names are based on source
> code published by DELL/AESS for WPCM450, but should apply just as well
> to NPCM7xx and NPCM8xx.
>=20
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

Applied to for-next, thanks!


--aC1YO4lQe2I8bgSA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNhFN0ACgkQFA3kzBSg
KbYdwxAAhzCz7aYqdzx9y2ld3o6Y/J4cYOFdv5+vTSsCtXyA6iin7uYH6il9PbPW
YXLk3Mk+QBs+VJ9LUTKgpkz04j0FNC13f1kzUJqN4Tgw3Ao8NPFFTKynE2dmZOoh
5yJv8FQtJcXno2tU7CM38Wc9Ns9jA/UtyLXTN3rAvIUBF4enLGDncy0dfkQUc8WR
YdPbMsKzQbmAv6XT+ZBrs+xkIUgVoxM28xY9idRfpcBBVNERF1jTM07ThhAzWmgg
30gFHQ5i3NHYxcmx+YFiifV9d6CHLVnQh4TcqPiboshRlmpLApIt9Kz2dCLENu5+
zMhLkTTeGk9qP7/XIgVk5XhReNLqguEa/oiRtA8PctpHsOXAyR5wl/XqTzCiTC8C
pPq6PAgu9xahbSe0Cp3sBZnbfoL5PU5nKreS9S/ztFpvdTfgTztp/UYF1CEhnqlb
JEDs6CXIE6SvW8ZLo7fu0MJFGfzfaviOnpWilIYdfc95nmqrzhJ0EzoUOB99hHfb
sA8BbVysxo0vKLUnaMOMCSLPnUGOahthsw2oXLBVRW2iIkfpREqPEb1HX0nqRdGG
ynMt0cR04o7ykGuEpuolaZabUm1SHX+IvJG6Ekgzsx17mZvkAJcNRJoflKBHqygV
nG3JSakxMEJNO6FuZ+ZFOA7WG1bzdlx3JZzOyJGWMuQcotYtGnU=
=BQ8Z
-----END PGP SIGNATURE-----

--aC1YO4lQe2I8bgSA--
