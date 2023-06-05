Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4B5572213B
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jun 2023 10:40:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230207AbjFEIkT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jun 2023 04:40:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230284AbjFEIkM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Jun 2023 04:40:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5846418E;
        Mon,  5 Jun 2023 01:40:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C5EAC60DDF;
        Mon,  5 Jun 2023 08:40:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAB71C4339B;
        Mon,  5 Jun 2023 08:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685954409;
        bh=Wbt+LNbeUL+UcsjtXJ/AqiBhnvmyO3YSpqiumdxtja0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=juwBwYMfjlFZuyr9B8upgQ8Qws8AzmjJwr3cNmSgBW5CClzQ664VSRQtUc/cZG9EY
         3SMJrqzGpRzdF+XpezRREVqkLZU2JLtOtcjEB3E2Qf6PPZFWbbOL/8cNA/x2m9YABI
         c5K6DodgrQuGzmjrlIxd1dvtgzX3DdmlyM6Qxz6QjwiW9jJ+alWPdTdda2p6/acbFb
         1xdbMcjRECzRkpche48dJ35hL3iIp+mgRVZ1lM6N1xj9mdoWhOPHBLtXJs/kR8tRJi
         hvb5F9qnWWWIYcBjFbvGADICVoMlgnCngFgwgA4ibMj7JJ+TL1tiYgjEAaIfK8vYU/
         lMsTLg5E8Y1hg==
Date:   Mon, 5 Jun 2023 10:40:06 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Christian Heusel <christian@heusel.eu>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: Fix spelling mistake "innacurate" -> "inaccurate"
Message-ID: <ZH2fZoHVHgISnjYH@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Christian Heusel <christian@heusel.eu>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230508141801.88507-1-christian@heusel.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Y6hyWwjIduGm0USY"
Content-Disposition: inline
In-Reply-To: <20230508141801.88507-1-christian@heusel.eu>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Y6hyWwjIduGm0USY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 08, 2023 at 04:18:01PM +0200, Christian Heusel wrote:
> There is a spelling mistake in a comment. Fix it.
>=20
> Signed-off-by: Christian Heusel <christian@heusel.eu>

Applied to for-current, thanks! But please check other commits in the
subsystem for the proper prefix in $subject.


--Y6hyWwjIduGm0USY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmR9n2YACgkQFA3kzBSg
Kbbc3RAAkoCo1fRH+kDbIxpxmnZO+hdNWMYtAG0XUwczy4I/PxNjZ1tnCy75yJlN
VJDrmIv7rzMUEAmJ/sutn+J+6SBjBxlf8MmiVMmm473TV7Km2gByEt9wb/sijT2v
sZxtIImgYpACuTUaMGJCZBCBDW00YZkISSGhv6bBk2Zmi+m2Vb67UG4UOsTF/RDi
3rxt/VRl285FGIVIcJC7pPJdPhtACyZP1pk/rkZvJt7D77u6OXfROgUh8+d1uwy/
QrLpDNiiVlTljM1tb7+FNQHV27MeQVgfGphN4CHsvWVy6jGrA2TQ7gszFO1FrMUa
G6ftMVLEOmGJDZu7aZn3HHeSdWPSXfRSuQKZpD1lemGj6GgcshXEPjdLW+Mtbz04
HR1lu/CYGXVYTvIhW7s3yr/I8NdBJgnjjrjTpLwU2XI5CsPBwGD1mUHSW9jq6A1i
9GoaveGxH9M9Dl4Pkr9m3S22IsLiPQY0KvPrZ9UOJlNS5qGuLafqmDlLU1aBuQtK
+dGerBjtUZ2YbL1UQuKBsL3pBtwtCm+uHrG6t2Xa9uvBkYPK/zivrykEKV+xdXxG
jBYU7u29NxAx9UAQTwfLKjQUCghrOQLmWF8YuzMcEUpXu4cpw0aOXr/ixcodKsOJ
ORWBOPDLctTKmnVorWgFMKNJR9PCTvuQXUBjrmflm1zV/vbOWPY=
=KHaV
-----END PGP SIGNATURE-----

--Y6hyWwjIduGm0USY--
