Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45B8A7ACBE7
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Sep 2023 22:52:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230148AbjIXUwH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 24 Sep 2023 16:52:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230289AbjIXUwG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 24 Sep 2023 16:52:06 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C342111B;
        Sun, 24 Sep 2023 13:51:59 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9381C433C8;
        Sun, 24 Sep 2023 20:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695588719;
        bh=DivKW36ifYhSuWveaE8fv6x1ATPfjvZRn5gc+v4tRdw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hWrrw28VLH3hL52RjHuYuQ9WP4LokvIYdkeSvmHLfITI/a5ob2xyq4Cr2AOf4LhaE
         hHCVc5cnERCeHnG640ipd7FfhDlkTx+tBE2IsmVp3vwsSqoxLYJWJnGb+HStciptZN
         jHUsF6lwDOgM6zuK/I5TQ7Vn2VBazjRGipHkwrbV37x4ilDVZf8cQfXerYb2O7OHL/
         PzXxw25DYf10bqWOyNhMdpR19JiaMfCS+ea77DWf2NszCiljz31cbrRFruYCCr2lN/
         Oysp06ZopNIwBcSYND1uvyaT+4iag2keC8eEVMzPRRqcQkTmkm4mzby3umPCliWbjb
         8wH+zOLU9b8iw==
Date:   Sun, 24 Sep 2023 22:51:55 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Kees Cook <keescook@chromium.org>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-i2c@vger.kernel.org,
        llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH] media: i2c: Annotate struct i2c_atr with __counted_by
Message-ID: <ZRCha5mt/MpJRFv+@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-i2c@vger.kernel.org,
        llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
References: <20230922175424.work.863-kees@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ra/2MJe5Rrzch4Us"
Content-Disposition: inline
In-Reply-To: <20230922175424.work.863-kees@kernel.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ra/2MJe5Rrzch4Us
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2023 at 10:54:25AM -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
>=20
> As found with Coccinelle[1], add __counted_by for struct i2c_atr.
>=20
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/c=
ounted_by.cocci
>=20
> Cc: Wolfram Sang <wsa@kernel.org>
> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Tom Rix <trix@redhat.com>
> Cc: linux-i2c@vger.kernel.org
> Cc: llvm@lists.linux.dev
> Signed-off-by: Kees Cook <keescook@chromium.org>

Removed "media: " from $subject and applied to for-next, thanks!


--ra/2MJe5Rrzch4Us
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUQoWsACgkQFA3kzBSg
KbZryw//V+lKwNm7KSeUZkoAllbOtYbTr5J5dwbk1ySzTcbJYNZTGItjW3cRpaBm
KR20iCnXa3l/eTZTd3k1p6JO2QgFMbeIh+oaEhgoXQKxwCHZqSkQJVwysCSIASIz
Xbh20wCE/Oaq++TywoSE98GOiWjrLKEvCtrF9+zYLRbXUaTicKjJbxnP3YXiayqe
RT33QWpfl3BJy/i5tmzhgTItYzFMeA6jiAhYegHEW8iiCcoPKwtpF3PWvGCE2TqR
w2bZsOo9eCupS0sVs7hXTDaoY7tX4b7eOddjZi8Bhtla/W1xemI0LigbEfbnwMPB
b6iZcJKtIEw/dDhyVxGFgxXObQAmM7W+jOmXYXM/TObVvvYp5HFBCF3k2kkvnP8l
kTXhGRw3pJGF12iImIqgjPaLQ/kXJ23fY/X8XIZr3ty09OK/qq3vE+P+vfMHIkAs
LfR6wPgrzpookiwwY1SBrw7o6a0ZNGKHQH+aUq8sVkKrD8Vm+C3Oqu95IbGfo2P6
EZVcMbMIovTKii3MMnMKsv5mgxnLiF87o6L+hz1RybNwpRL5L2G2WbVQl/NMNwzT
LMY3NC2ozbUhF7id5x6XxD0tg8cxj8tKHvtJGf+jMtmJ8V35zJSQciYEY0l4Cjy2
UAmohNCw8KP1sCzI7QPbqIyP95UzzN4Rus9NOgvm4e3RPwEqqy4=
=aMwP
-----END PGP SIGNATURE-----

--ra/2MJe5Rrzch4Us--
