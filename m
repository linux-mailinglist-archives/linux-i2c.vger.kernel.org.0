Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5859B4C97E2
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Mar 2022 22:43:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238376AbiCAVo2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Mar 2022 16:44:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230285AbiCAVo2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Mar 2022 16:44:28 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F107297BB6
        for <linux-i2c@vger.kernel.org>; Tue,  1 Mar 2022 13:43:46 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 965F961026
        for <linux-i2c@vger.kernel.org>; Tue,  1 Mar 2022 21:43:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BF0FC340EE;
        Tue,  1 Mar 2022 21:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646171026;
        bh=mpDCq4MAy6TruR0JZHpLxIm/EuRDZS4wfJqSOaIrMqg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Qh86sfm8WkXHU3j5qaSZLt5/FPEV35/wpMvWNeKoOlIZ9eerx7FHH1zo7u20LA41W
         UV4L7CqLlqjKGC5uk0kyg0bJWuenx6wNTgldXIrMOqaxMnUOQXvK932V/YeG/BSbxJ
         f7kU+ZxWTW6BpHI4VamArIv1TuZ/0BFDpscCGftLexH5sNvwpfHc0hPQpSS9vliafP
         wg8JaYsiyZArqcJHfx6LkiyhS90nsBfj9ZxNCyb+UupET2Q0XCgfWl1ZAHHHqDziru
         /sXUXxTeW0yp/LIO6ogDQ0iT8wmVOwSk5kWub/hagNj71BQOh2z/aX+jrRKoZRI7l2
         4z56Yx2MsgOSQ==
Date:   Tue, 1 Mar 2022 22:43:42 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Robert Hancock <robert.hancock@calian.com>
Cc:     linux-i2c@vger.kernel.org, michal.simek@xilinx.com,
        ben-linux@fluff.org, richard.rojfors@pelagicore.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] i2c: xiic: Make bus names unique
Message-ID: <Yh6TjgPxGUG6U3dg@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Robert Hancock <robert.hancock@calian.com>,
        linux-i2c@vger.kernel.org, michal.simek@xilinx.com,
        ben-linux@fluff.org, richard.rojfors@pelagicore.com,
        linux-arm-kernel@lists.infradead.org
References: <20220127175013.3689724-1-robert.hancock@calian.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SF+iDXWbo0SotTOE"
Content-Disposition: inline
In-Reply-To: <20220127175013.3689724-1-robert.hancock@calian.com>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--SF+iDXWbo0SotTOE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 27, 2022 at 11:50:13AM -0600, Robert Hancock wrote:
> This driver is for an FPGA logic core, so there can be arbitrarily many
> instances of the bus on a given system. Previously all of the I2C bus
> names were "xiic-i2c" which caused issues with lm_sensors when trying to
> map human-readable names to sensor inputs because it could not properly
> distinguish the busses, for example. Append the platform device name to
> the I2C bus name so it is unique between different instances.
>=20
> Fixes: e1d5b6598cdc ("i2c: Add support for Xilinx XPS IIC Bus Interface")
> Signed-off-by: Robert Hancock <robert.hancock@calian.com>

Michal, is this okay with you?


--SF+iDXWbo0SotTOE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIek4oACgkQFA3kzBSg
KbbuuA/9H7NYigQ36b0FchuKcQgb+qCKXDDuTcoC65LsS7xMOdwxcXYC7ov7qzOh
+9ZbhBK4YRb9LIoQsFALUl6XQNvhdUK2MLIIOxjlrPam1lC0KRqWNpiGHo6MiePy
GBO8CDhElEYgEAEZl4uEFisFaLUc47iEYepdhw/yMnuC/HdhRU8BhED9lIYO88Eg
46BXxjnTDExAnGCbIKwDiTiUBdSUOQfx2TDu7Ci+1wh1qlGdRu5Hr/u1qTGC57u8
+XaZlDQmUb5sUZZHtO64zdTHNQWl93oI2CU+Hg6nM1F5nhSFjp24bKiFdZzYs4Yy
fQ8lW60fgpa7YNjAf4e2cU+tm59I4N9kupYPIM6SO6UTNnV8pd4D47PGYr+VO/xe
adTjwZ+yt98/6Kn4B5ftYgp9gm5uFhZYX7gtB+LWptZ60TX9awqBsklmFP1ZbaaK
9z0M6lZ5MuRUfRwCwWrZrH+3BYztA4EYvZZ8jHXzJx8vwSQBzYanmJ15yj1tgwrU
vKrfhkmXnES6XXZXMlK1uz4nP+dcxOBkNL16xjLeaiVvptYLyJJFjqQ8oOlXhRfu
OGh3F/GXXHVQ5jmvVL/CPwD/Q6hnzoFGgQhTdJUZB4vorNwimmdRrmvK6/IaiPJ0
Qj6NJY1OicnihPvr5EdePDWIL4xFWYZFm+LymD34u8Hfe7RNIco=
=dUfC
-----END PGP SIGNATURE-----

--SF+iDXWbo0SotTOE--
