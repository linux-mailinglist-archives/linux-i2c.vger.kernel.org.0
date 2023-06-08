Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B347728783
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Jun 2023 20:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232957AbjFHSxk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Jun 2023 14:53:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229775AbjFHSxj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Jun 2023 14:53:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45BAF1FDF;
        Thu,  8 Jun 2023 11:53:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CE3C565065;
        Thu,  8 Jun 2023 18:53:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F989C433EF;
        Thu,  8 Jun 2023 18:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686250417;
        bh=zVdGP+Ew0Gem0m83/DOeF3Hf1y3exPOt9ndNwmCapHE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aHo3QJHY4GDz6clEFdNgD/xZgsFiIbC5Ei17HO0WJkzPy+ce76MAKzFoBpItPzw2s
         fY4/CZXzHWaNWK58kcK/vi4bfe/lKUkFwWZb0nsQ/sVtFsKqVpsan6X+AwL3OLnxKO
         tIzfkRUAtUOzb1w2TuiaKMj1AbilccCb/ptX8GmV4P7XIxLiY8ENyi2Ryiev590lRB
         avoHWRov1egLy+EGNIOLz6i7HEDWBBUysMV8M735FPw8UJGrNnd8CFouioJ5HVZdPf
         or77TX0hV5rkQWyIfYoetgKmfKcQLlwp4JS5XyroP0aY9Uzm+KMKvjcaiv/UEUBFX5
         D08yyU1wfI7gw==
Date:   Thu, 8 Jun 2023 20:53:33 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: Re: [PATCH v2] MAINTAINERS: Add entries for Renesas RZ/V2M I2C driver
Message-ID: <ZIIjrd4Pr+wMtrGs@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
References: <20230607170729.139555-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ILZMzs8e5U9orZ8s"
Content-Disposition: inline
In-Reply-To: <20230607170729.139555-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ILZMzs8e5U9orZ8s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 07, 2023 at 06:07:29PM +0100, Biju Das wrote:
> Add the MAINTAINERS entries for the Renesas RZ/V2M I2C driver.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Acked-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Applied to for-current, thanks!


--ILZMzs8e5U9orZ8s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSCI6kACgkQFA3kzBSg
KbYH7g//SuQN/XIjSIQjGROWzPQJGRVQd76ZY45MRTjfstU2/UTAsVfY8E7s0G/u
VCZATitrja+Wn1C0A1QwMhLQFXERwXG8kaX9pOzlsHTBcnnG60wuMy3MrLDxI5/Y
69QgqVs/knAVw5OmMVUS7GM2xPbUPn2HS2gb/SKIl8rcXnrlhKSgtKg+w1gQE7WG
GpthoKM2zSmLJ2fQHj6JExMg6R3CwkqOb7X+EoN6ia/C93hhNWf5FLu3sQG5HbQa
FAD5LVs7PAdjoKpt4jJoDNGCFvx3N1WcEGjjo0DkEX3pMefbpu++p+NSI4vSBn6O
J6luOFqsDQVsvH3W6TUN9lqJcGxFYocqODCwm19qwcyrT/N0E7Yr7r9UxHJiT7fk
W5uFV1iVeZHakhQ2vyTS8wGVTSYCsZLtOPH5BkUqLlP4za9eVoEw9YA69B3oEI04
9U1iaDCVYiyuO5BwzBVw9dM8aIIDvL/pE+toOoAg4Y6Dahw1qMos/6K8yCFWLDNX
LSv837ZvVLp4poKUxx0HNHqFMxdPapW6HwP+X3A474mNqIYdOVC4T7aP1leYMQQO
qYHWD14GkjH4bUYST7FzBdWpd1zp5Txsih60h3dUl64L5M3sTXBB/tncobb6fbd7
Ljwq9WiVmhDnrmaS8bKe+Q1ejJHp/9tqb78px386ZRkuHwRxjZU=
=oX0j
-----END PGP SIGNATURE-----

--ILZMzs8e5U9orZ8s--
