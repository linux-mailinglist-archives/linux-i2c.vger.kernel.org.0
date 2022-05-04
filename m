Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DED251AF5F
	for <lists+linux-i2c@lfdr.de>; Wed,  4 May 2022 22:36:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378138AbiEDUkD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 May 2022 16:40:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378229AbiEDUjp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 May 2022 16:39:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4D3F50B1F;
        Wed,  4 May 2022 13:36:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7500561807;
        Wed,  4 May 2022 20:36:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67A4FC385B2;
        Wed,  4 May 2022 20:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651696561;
        bh=Azs5piOwt3Bqh7L98SSWFa8f69doIGX4wtdQXrTRZLg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ml4oVqTNXN2gFXV7aunzber39JmCbl0gL5g8yqGp/NZvyauf5oXhQYLYkq8HJFiNc
         bEXsNElG6S0Db0pZdABIxadawc9nN6d9CQBUck7JIqVq034bE5H7KzBIBvWZJVM7vg
         in7ukLAlRDsRKEkQqU15/m7N3hJrWqkvUcu57VVTFmaSzxXNQW3cgYhA4w8PYFhoNx
         W/JSKKkAGcBiqvEcWTare2Ff6uXaPc0lR2ztUn7zPLbqeXf4XDSgivhhrNfG3PDFMA
         i+5EJJIn5K26R7AMCjg6/rj1LH3Gayo2MTowlRxrmSlP4LKup1ItNDb7rvAfOvI8cV
         VdMcMV/sDDUFw==
Date:   Wed, 4 May 2022 22:35:58 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Stephen Kitt <steve@sk2.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: i2c: reference simple probes
Message-ID: <YnLjrt+86Bu3QNAl@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Stephen Kitt <steve@sk2.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220325161910.1202539-1-steve@sk2.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="z/82Cbzcg2wtUCBb"
Content-Disposition: inline
In-Reply-To: <20220325161910.1202539-1-steve@sk2.org>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--z/82Cbzcg2wtUCBb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 25, 2022 at 05:19:10PM +0100, Stephen Kitt wrote:
> Instead of documenting old-style probes, reference "simple probes" and
> document the i2c_match_id function. This might help reduce the use of
> two-argument probes in new code.
>=20
> Signed-off-by: Stephen Kitt <steve@sk2.org>

Applied to for-next, thanks!


--z/82Cbzcg2wtUCBb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJy464ACgkQFA3kzBSg
KbbvkxAAlGdAVMrwi6GlxBeZJu8jPGXva7rQZfJ73iYFVP7wxAt65LYDrinX2Ndx
PhRid2sV27RUjRrpLtHuHitGHbkhrMHhz+Y0pUY/7ePSt5aJE3N3BGyXXFKPgyed
dYLLf+QK5PYYrEeojpOjRSJFBIhU9jesNhg/WkrnUjLSBS5bDk1HRZ0OSJMmcaCL
EQhJTw+32QDIHnHR955EPIb77raZfBeSeqZqgFEb+BkBdGANroHmusbKWYukaLcn
bCNJpA1wW8RoHg3GzGMZDgRT8IfuEQKAjKhMTBacbDiF1XTTag1t3xWH5RHNHUhl
ZRseaKNVz5lTRRalN7kXFZwEGBynfczlFtcxHyGwReLvDeNDMxDtS1+o/P5SOvAO
6dXaYReD25/kYKyHrWZT6qG64PpP0yZq/ktC3w+4xCcvORSJffZD7fzMmarmCV0w
Llr1tFUhWCUOyEwUHwVNI2vTII5cSGp3yP6LXC6xv4crPuv7ofO7JFtLQgiyNSMD
CaCBy2vJQjExT7U3I4VHThjibLKJPK0prV7Lxk8hzkgeWYQu1jnn2Obqd/Gzf+9w
EMuPd8OHLQz+R9RUIB/usZnhh3xjP4wlnR1ZnvGLlH9k6Zy0K0z3+Th0Og69SUE7
HqbztbESB7CxVSAD/ecL3knI4RA/8sipf0NpT6mflgy8ZDB1jpU=
=PiHl
-----END PGP SIGNATURE-----

--z/82Cbzcg2wtUCBb--
