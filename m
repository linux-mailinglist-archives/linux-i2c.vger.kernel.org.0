Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A82C552FAC1
	for <lists+linux-i2c@lfdr.de>; Sat, 21 May 2022 12:56:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbiEUK4r (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 May 2022 06:56:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235388AbiEUK4q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 May 2022 06:56:46 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 438E14BB85
        for <linux-i2c@vger.kernel.org>; Sat, 21 May 2022 03:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=jkX7hJdXDwyMtaoNwzUaUTft6Tj6
        kG36MjroXZFFjW4=; b=dLAAKKiFyTUaBBNidXaT5plCwCVHCQro8G/fmHIv1xXk
        MOv/ZOGgAONSi1nQvBrXTYwpvlJOmsVwLxMIoUnjRfVc7MRyMzaoC8yqS36dPlQi
        gCAkg1fR8sEr6gB8yJbxYV9q5C53gN/OOsMPRz7qgf75ATPPKy0UqoQGkJPvu/I=
Received: (qmail 4129057 invoked from network); 21 May 2022 12:56:43 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 May 2022 12:56:43 +0200
X-UD-Smtp-Session: l3s3148p1@Ci9fdoPfxLAgAwDtxwyXAGMY7IbT6g6m
Date:   Sat, 21 May 2022 12:56:43 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/3] i2c: rcar: REP_AFTER_RD is not a persistent flag
Message-ID: <YojFa5igxj/+3w9L@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20220520202918.17889-1-wsa+renesas@sang-engineering.com>
 <20220520202918.17889-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="aVpPbLhWKpE8e15f"
Content-Disposition: inline
In-Reply-To: <20220520202918.17889-3-wsa+renesas@sang-engineering.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--aVpPbLhWKpE8e15f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 20, 2022 at 10:29:17PM +0200, Wolfram Sang wrote:
> Previous refactoring makes it easy now to convert the above flag to a
> non-persistent one. This is more apropriate and easier to maintain.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--aVpPbLhWKpE8e15f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKIxWsACgkQFA3kzBSg
KbbnnQ//dYENLiiI0Xi4iAT+TLTfAFzjzPh4gkwM2pKxo3VjRf/MBgUeQkWcDV9B
brHAhSvHGPpetmxSCm6oVA7fuiaqhHmqSOzkvZ9FC1tqSPex813HhlWVNlRhT8P/
YFNL8zcCW1K7SA1fQxhYSAk8ktQAXb0sjSrMMiuo9OB34sQLIAo2cHU0oMDURmKz
mhSs3zqVcJCsQ5neeWlGZ5zhywOpOPfg3pMN0LF23RZzf/u1DJPiIL/Wi3SrG2il
UkfMc/ZLs+clYe0GGhOpIKSw84WbuYuOz7WLfVcxr5a/jXeRd2mokTKbpbh/ie5t
7pFfcz/JCdiAW1ZwBYJ+GJkN/yZ5YHMBADIGaGFk/TusM0I1j2w/ObXEUXYdXJMq
TV2hWxPFtgMSLwv14njrw43xsY6fQEMZgjYLOfeioPtOxaRxIygH0wssAu0/4oAZ
kj2WK1MTdXU8nl8HiN442/6OFNNHKlo7nVYEoWT/hSia4F6OKIDGbQo0oZKA6eSn
05Qd8JUNWXTNLu3mj5CjX05nQTpsaeVG6uMgsdvbdSjJloB7No3mCf75Xc8D76+0
tA7jD7JQMqkqGT+xSg/TAvA8tVCejXWuAxkMz0gJB3Fm0R9pFaHC0gPh7jvo2NJZ
Q8+M6H6KnSFTlz6tOPoWSeI8wHpCaeVLHa7tyYnXr+5SpaevDY0=
=21Uv
-----END PGP SIGNATURE-----

--aVpPbLhWKpE8e15f--
