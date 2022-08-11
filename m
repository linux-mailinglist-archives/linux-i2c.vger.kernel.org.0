Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5617D5907B9
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Aug 2022 23:06:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236197AbiHKVGF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Aug 2022 17:06:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230422AbiHKVGE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Aug 2022 17:06:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B88E6DFA3;
        Thu, 11 Aug 2022 14:06:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BC91B61316;
        Thu, 11 Aug 2022 21:06:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B39AC433C1;
        Thu, 11 Aug 2022 21:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660251963;
        bh=DNUZFNr0brj4JgGDixT044yYQOEQzr3/qHvXPpvph0I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OM/50eY76Vo+l+eiM0FaAK7JWhPwPy79ad+z3MGGvPsnfQ5LISSL/HmLhwsZk95hc
         9+dES6H5vdGZLVJ2atyCosohI3kLlqhlXqdnRdGdDc7TT7aH3fvPSGm9Lxu0GhKeiC
         429+P5fgGgna32Qpo6z/8LEka9gg/u+f+4Q9uXEJfJrqIeEKqXQdUGM5bu9c7Ocqwx
         +6wgj1O1Nxz00OuAS8dIMFqMSRFetxBHvJWenS0YjPJ0+fFXDYLaH7P0UgdhtvRKFb
         81OADWF8uAT8vWIRWjKcjQSqctfzQ05THdhQC7xZVcpBZNlpR1VgIMRxX9yHYuWIHT
         w+8N1P2wDGx1Q==
Date:   Thu, 11 Aug 2022 23:05:59 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     luca.ceresoli@bootlin.com
Cc:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/9] docs: i2c: smbus-protocol: improve DataLow/DataHigh
 definition
Message-ID: <YvVvN4T9KvpHMOnm@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, luca.ceresoli@bootlin.com,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
References: <20220808141708.1021103-1-luca.ceresoli@bootlin.com>
 <20220808141708.1021103-5-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tI3PQ/KZSa+iMmb3"
Content-Disposition: inline
In-Reply-To: <20220808141708.1021103-5-luca.ceresoli@bootlin.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--tI3PQ/KZSa+iMmb3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 08, 2022 at 04:17:03PM +0200, luca.ceresoli@bootlin.com wrote:
> From: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> Use a more professional wording.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Applied to for-current, thanks!


--tI3PQ/KZSa+iMmb3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmL1bzcACgkQFA3kzBSg
KbZ5EQ/9GZthwzG7o0+0tWgmbHBZWo9XeZzWuWujFSobk7WkFJ4xsp2Y85voqpXw
hcwzWdoQg1oTIDA8A8rBKrmZ+jZAOQ4NoaKTlKFeX3QMa5JqJAdYb9rh2Ezvs6tL
vfSFt8DAfuGRKUpSJE8G3vgceNd5JV2ppTDG4kFR63J232D13DaX+ol1J1aj4qbj
FZm5A3DXdKaA0jCA7kya2Mrdu5LEL4EQG4IL0ysA0jN3K/Fc3oIo9fxzbWpmQZCh
X83ogBWmL20NnyG5K/raQev2Awusw8r1miZk0t3yfmxdvrLnTEm2DgYMf77Ih7il
nhg8FNIamdaPs+Grdfls6Sbebzf7A9QKZBr+hjKP4ne3tsb/5RpAkw1P7dUx8N3d
+hHLU8GX1+oStnC59tNVAH+W5dqt0pxMJE2WozB2uXDAZrNwGWUcNU4MXitZ801t
tiKKOaXiJtHoNIhPnFRKfSr7PvBU4eLzOWvyEAB+vRGl7JBvs8+mg86+U6icVc1E
1+XWTtRJACHhNj6TmEZZnNP+835T7kMiFNS4xlAJWWsepJ8p84tGGuSRTw5xR44d
OUzW/a7f1/ICJ+sWkiW1Cx7H5kTSQsXIl/gZ+hUE0yAtPCvPi6LmVZeLuQ4DZkKh
2HbhSb6qWirfmaJ6mS99v5cOkUR+Yb6hAU+u0Bv5mdFnO9Kj0xE=
=7097
-----END PGP SIGNATURE-----

--tI3PQ/KZSa+iMmb3--
