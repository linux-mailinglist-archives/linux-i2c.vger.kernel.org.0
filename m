Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C61C84B6739
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Feb 2022 10:14:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235730AbiBOJPE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Feb 2022 04:15:04 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:40206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235735AbiBOJPE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Feb 2022 04:15:04 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4B4526105
        for <linux-i2c@vger.kernel.org>; Tue, 15 Feb 2022 01:14:54 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 810DD616C6
        for <linux-i2c@vger.kernel.org>; Tue, 15 Feb 2022 09:14:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61F3BC340EC;
        Tue, 15 Feb 2022 09:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644916493;
        bh=ugyMtOsU4JcM3IW22VpT43PC5f3Zi2mOibS0WdmgUJE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=exTUHVrl8Ag4DgaxRHrhK1SBW9yBizcbm5/WM2LlpkXIYeL1P8pS3vaj21pVCWE/Q
         RilS4hoxP59sn1rKVHmWSZU3RRUn12aMu7xmf0ZWQu+cdSbcm5nR5PH4o8x9NNYTJQ
         MWJ7fYy2TvQJAYbPbDHiN81blbA0LX1lwLHSy4pKBnfi/iCsq7gmAM2TUkG7GEKKks
         G3MmMWmthi+2OTspW/jq+KIUCt9wcItiWTVy+oYWRzmx/l/6aND4lsMMNZ7wiQBTu+
         Rf5/hKMsDs5gEwKrq7ldf2oX89FRUDco8tco4PLn1N+IG0TEmB93iCzDfHTbK9RhJ/
         oqx6HPGLzw8HA==
Date:   Tue, 15 Feb 2022 10:14:49 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-i2c@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] i2c: qup: allow COMPILE_TEST
Message-ID: <YgtvCXLDV5+sg7lY@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20220212194707.11262-1-wsa@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yCZwYEhZ7utWS6Ra"
Content-Disposition: inline
In-Reply-To: <20220212194707.11262-1-wsa@kernel.org>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--yCZwYEhZ7utWS6Ra
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 12, 2022 at 08:47:07PM +0100, Wolfram Sang wrote:
> Driver builds fine with COMPILE_TEST. Enable it for wider test coverage
> and easier maintenance.
>=20
> Signed-off-by: Wolfram Sang <wsa@kernel.org>

Applied to for-current, thanks!


--yCZwYEhZ7utWS6Ra
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmILbwkACgkQFA3kzBSg
KbZjGw/8DKg2124mDYKeD9LYt0oVNEWNGhE720gv3yOV/8v906Vi0EGsntST7zpR
9ZY0pLo+yGyryhxkD1OsVK4RX/FkO5aWD2l7vVJrVAxZsByt7SVrVG03QcQjnUCc
pHtPs292KA4S3837gEfFx/0jPgGury6UBF4Hy1nycI/GHP09gQUQDFI4v9ljZbB6
3TYO9bdboM+drZVI+guhZ5xIewN1L8PQehjYRaF6fRgdM5DOgsFIJ56+jOV3VU1g
jRHCzt0hf2c+P3wR0dJBwbR9fanXm9Z/qOKNFs5Q5aUfLz2Q3CqmE2eQMikDjtEA
LvJzbOj4qf5v+a98GnwZq0uPMma1iQZ15a0JWD9TqOX7dHyt7wX+aC3ZYdktXZY2
JoY3hHV+/lKywZua0aBeLNCiWND9/22NxDxm+XDESxEsCOGvJsIOHaQl/npLvPEv
WGzLSrrUpyJhwlQfx96teIIQW4dsWe4tBhvUbN1srcntyR/FF2/IDTJ+ec+e9GTs
LuzUm+EILe/9Jr8zbt/qaQwkOnX4bTGs4frlTjO47P2wjPdX72BeKXfCjKTGvgnO
5KrQnyPINA0Ymt8nqn+oqYa3C+PJXr8nuz5ZBE+vWqCWFDjMZXzIPOrmNkbTslcQ
5SW4jxWE4Ryk16urCRMS6u72un6j8OShisLZktYET1E/n8h38mw=
=i6XM
-----END PGP SIGNATURE-----

--yCZwYEhZ7utWS6Ra--
