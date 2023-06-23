Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0062F73B52B
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Jun 2023 12:23:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232156AbjFWKXV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Jun 2023 06:23:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232148AbjFWKXR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Jun 2023 06:23:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A102C1710
        for <linux-i2c@vger.kernel.org>; Fri, 23 Jun 2023 03:23:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CB0E6619E9
        for <linux-i2c@vger.kernel.org>; Fri, 23 Jun 2023 10:23:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A899FC433C8;
        Fri, 23 Jun 2023 10:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687515788;
        bh=LVfMYcZfU8ko9env45ni0gTPl2fbvtJkK3hEqyDWzcw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZPlsynfR2jAgvXXlHw9LnWAcdwwWgzyG3lsps7m8NzptY+mYkpPv+XZzQ7Z/OXCmO
         yAEFvvlJcRWw6YOPp53+7uUmdBPpo/xkFBT4rwDa5rfWph4uFHXb10fksb0HIwT0hh
         bepd75KU77geLj3PiMYNrktcLXHA41mhmKaD2Kc4hqXyWBhacNv+nS1wD+/lyyScrW
         CLA877u3eSrYb1MylFhE6vptrZKyXf+Oaqi3zZfSV4JIAKRL5YkDBa5I3Si1G/VkjK
         hDl7d5hRdtp6zTg7aoDwKOjQD1L3e13HAB9ILDqrbTG85tgo6iHnS2dPa/MXWaQDJd
         zv4LlEYmebopQ==
Date:   Fri, 23 Jun 2023 12:23:05 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: [PATCH 15/15] i2c: busses: uniphier: Use devm_clk_get_enabled()
Message-ID: <ZJVyiVfoWfwZkyTg@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>
References: <20230611225702.891856-1-andi.shyti@kernel.org>
 <20230611225702.891856-16-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5GjkhdoJnpSPK1Xb"
Content-Disposition: inline
In-Reply-To: <20230611225702.891856-16-andi.shyti@kernel.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--5GjkhdoJnpSPK1Xb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 12, 2023 at 12:57:02AM +0200, Andi Shyti wrote:
> Replace the pair of functions, devm_clk_get() and
> clk_prepare_enable(), with a single function
> devm_clk_get_enabled().
>=20
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> Cc: Masami Hiramatsu <mhiramat@kernel.org>

Applied to for-next, thanks!


--5GjkhdoJnpSPK1Xb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSVcogACgkQFA3kzBSg
Kbbx9RAAmn7fEbu+c5kKvFoKG4glvScEEGXP4yHlyrd3y3L8LapZKiPQFrq9JVGr
xLKJrsIK3vyW5OKkVtabCjcmSMxoITiLGSkbJyCDdTP10kOG2/xf+4V5GB2QkDTt
KbJmwPN+dueN8y0NGlBzZzUH+p/I/BBgYcYEvl6fTR4pm7ztuPJaOnlWUmhpOdpO
JlkL7ATbChVp/X35AL647Cd6ks8NOXSXTJhEj60UupdaybwPxdKaCzmsoyAaxsUf
1U+lMHBhrvx4+/UEPMKO7cKp8MlST8V+IA0KhMWBbpoM7NLD9/fTV7Oe4PIajoW/
PZeT5PI7DjXwLdBDZeDzfdj/XE7ntjdm3BurBxbCEGbUhxrN6yqPOlec7/JEuVy0
8N1lYd+MiCnwDzD8y24VLb3vI6KC7tLdAZjn1I9gp58eEiHZHgOakJ8HnPjNd1PB
syZ8l/z0OuohyfDGVvqzsUmU4Te+O/GvQLRm7HPYGwnrnzWMxcLLVTRgiD0qZJid
Z3uoTtLQt5DDpv9/2Z2ln7OcXkfyIGn2bsrCyCfxLWVprSrgZ1rUi/HSSxbfJQg+
awCkPAzGsfbwh/rv9bvZjJAS6FzzwoCVlVJcN96PAfAGCl3fGXPY7QZQLUaBiTge
oS1dzm2b/zI8FbRbp9DdZgqxQoRsivf1XaW/+VtToJvkirYRjg8=
=X8Mr
-----END PGP SIGNATURE-----

--5GjkhdoJnpSPK1Xb--
