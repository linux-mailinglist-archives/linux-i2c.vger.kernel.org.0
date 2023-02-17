Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5416769B4E3
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Feb 2023 22:41:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229748AbjBQVlI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Feb 2023 16:41:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjBQVlH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Feb 2023 16:41:07 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AEB664B17
        for <linux-i2c@vger.kernel.org>; Fri, 17 Feb 2023 13:41:07 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BA54662043
        for <linux-i2c@vger.kernel.org>; Fri, 17 Feb 2023 21:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92EF2C433EF;
        Fri, 17 Feb 2023 21:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676670066;
        bh=yAF77rNup5zQbym3zbWRWXnaFHAtCz0vsWdVaPSbTSY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iMIkra2sChoIT8JkOXf/LI+w7Bwj9sOJcrfSdrihCmuGP4X3L5e8A8+ONmkqMEgAb
         mURgZJozFo7h/aWHctEweYkDX6pOnBGFhfPiLB+kvfOAv+x3VyOIdxef48J6ikxHCa
         gUanVv/cAHlqvt9f1kWCgUHtqNLurzj4Mhzjw4FPnWdJlkX67inmaUNwr7KSp9Of6L
         zVm570Pcrt3O6B3JSOAXrB+HpsxMH9LZ/4rJQB002kAqgb1oHYQREebezH6/toIsTJ
         wqsFeFWYiNR+s/Rp6SDnKUF9T10uHulws7j9kjf0LKUNjfV2fMP8F7JnE3tWh2oamE
         Eq5KPZn8GqvGQ==
Date:   Fri, 17 Feb 2023 22:41:02 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v3 4/6] i2c: i801: Centralize configuring block commands
 in i801_block_transaction
Message-ID: <Y+/0bodGa9RRewGi@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>
References: <20230216170830.206f0bb9@endymion.delvare>
 <20230216171416.608045a0@endymion.delvare>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="s8dNVLHseAmWrWHS"
Content-Disposition: inline
In-Reply-To: <20230216171416.608045a0@endymion.delvare>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--s8dNVLHseAmWrWHS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 16, 2023 at 05:14:16PM +0100, Jean Delvare wrote:
> From: Heiner Kallweit <hkallweit1@gmail.com>
>=20
> Similar to what was done for non-block commands, centralize block
> command register settings in i801_block_transaction().
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> Reviewed-by: Jean Delvare <jdelvare@suse.de>

Applied to for-next, thanks!


--s8dNVLHseAmWrWHS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPv9G4ACgkQFA3kzBSg
KbYmMhAAqhV9ih4J4On9hwkkWNxW0ciP//OCxjTn6G6HIZEz7rWPbbMtw/ttiF5r
5kvJMeH3xEbPo7E4ClTWmPzDHFJLRZ+vRpXBIWBqfArGhLo0sANkheJV/7ugHe4C
hQpmFq8MHInX/zCwiuVbAC9/RXoAc6vb2UXEuHBLHpRjk7zAfuIQK9LEHnHCzSsK
I3+jFFqMPyX+D8O2HzMZyguBYygSdrZigykHPEI0ugguSQKAJo7IzGl1dQ7TMSd3
9C9rY//yOyeMeTXCVPiLCYnXVhu13N9bV5KY415N6yv3bhMWPdjsF3LKDcPoxDj9
Ee6tCX0lduuxAv8YcPCitJWsRgb9kgvp4dPqXvO9Zjj50OmKdHmUNlqM1N09Fwup
XLm8nyP0cuN76cwQhj/eMkJCIp+9/OrM4zJWK0jRKMMAsPUfpiTEi2M8YMWQ5iqd
eSJ57exHDDuXnFEl7RUV4raeimKXcMYGA375xVNySzz5vs6ZdII5PmfUge0EgBmb
Sc0+PdMthCr0gRS/0oVk8jMsoY6WJaRH9l8idaSgOVJeEpdiL/dWw/bwPoZQ8bVD
dff7JgV7AmyXZzSUkAW+B01Z2TIH52ggqWbQs+OIEc2xGGZU+GwFR+vSpMCZtjw7
I/yxyEwCRaKWO4W3MVAQfGzTCkBaTW5UFoKnRn2qyD7/KDnBTV4=
=wv++
-----END PGP SIGNATURE-----

--s8dNVLHseAmWrWHS--
