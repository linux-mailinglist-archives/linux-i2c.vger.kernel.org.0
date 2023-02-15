Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F37ED698512
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Feb 2023 20:58:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229461AbjBOT6S (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Feb 2023 14:58:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjBOT6R (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Feb 2023 14:58:17 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C73716A6C;
        Wed, 15 Feb 2023 11:58:16 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 138F8B823A6;
        Wed, 15 Feb 2023 19:58:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DA22C433D2;
        Wed, 15 Feb 2023 19:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676491093;
        bh=HEs3ijSJ9Z1YToGd4T11LvIyBvbW09eo7oxaJ9H6xd8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RCI340uYvpdpCDHyOukhJQvtDVX6Ol1IO6hvwvvY/LJBUzhhUJG5NKIPV2QDPxKHH
         7847vSrPglUGgYu2cITr5KKlW9zVylz0SI1NtAvX5dbLu777S9egXZgYudVJt52CB8
         ClraFe4DPepmPaHGRRWrD5RiyMuBaTZsfDc8akk5zAjJTu04lOZe7feXYMdhNmGTPQ
         qDcd6BEHPiayXa+UkIilbsqOoYM8R6cm3utsaQryVmzLbus1y7mCEBFUjrmxBQ876V
         a8CJ6v9899+l6BIGY0covOLiS97+6GNJkfYwloz04fAM0Mf/sQ+Cq5bVKn1wi/NKCu
         qKoMcGJuiyUfg==
Date:   Wed, 15 Feb 2023 20:58:10 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Alain Volmat <avolmat@me.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] dt-bindings: i2c: i2c-st: convert to DT schema
Message-ID: <Y+05Uv/izJ+YyY0U@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Alain Volmat <avolmat@me.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230213191608.16503-1-avolmat@me.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FvTABU9AZrnonJXa"
Content-Disposition: inline
In-Reply-To: <20230213191608.16503-1-avolmat@me.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--FvTABU9AZrnonJXa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 13, 2023 at 08:16:06PM +0100, Alain Volmat wrote:
> Convert i2c-st.txt into st,sti-i2c.yaml for the i2c-st driver.
>=20
> Signed-off-by: Alain Volmat <avolmat@me.com>

Applied to for-next, thanks!


--FvTABU9AZrnonJXa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPtOVIACgkQFA3kzBSg
KbYTqhAAjkzeRVZmu6GrNxDuEVjGzJe6tFD2B5cP3zCtTJCL8mWEzNVzGtMYv8j1
vIivTD/LZ+uJMD8mw4YGb+Lo7rWdvv79sAgoKoJjJuF5Z++GwflLQtz1+mwilKa4
wjlXgwNKVkZjdI5OasLGnLeTvoIQWOa3ms8JGMarH80IP5lgbbM5RFfXUw7bF/oG
sz48/ilJzEJqDuatW9YfSn1lhiwHL8FN+/ciZs06ejTGLXbnZdULfg0L1x/Xd4zt
Xlz1V9xvcRL+g3RY1cPD7HzWqeK1YYV/+iMRm+cLq6hH7gw9yAPDI6n5fTwlD/a0
5wmE8JLX+XbLwTXYXPb7our27lxUAzd3EBqSTTh75i3MpXioj3UJbBDtsZ70W5VV
2GOuw4ViQhGwIYrkb+97dPDjJRBuNLm5Vc7WWReHk40IFqDu6UOdwcne2kAxbqNx
9CgClfOtqk59oOIxmlV7u9VS8s3xkKOYaaRurs+MB0ag/vtbM+1DUWoXIff153+l
LCEfqmBqw9VvMBUS8GfGdrU+u1NUnXHcLT6Y8Qr9VHd/ooQyIjJcJklNVdPPn65h
yeZEfFuzH7DKgiSaftyHQ2Ndr66U0z9GTrJvRcCEx9P+oOgRWd0n3BNwhh/8Ki5v
Hfsm4bvJ16nGNOo5YiAFxommPvbOxZ4k2YmvTVonKlqpkhidfHw=
=zv87
-----END PGP SIGNATURE-----

--FvTABU9AZrnonJXa--
