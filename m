Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31E06527169
	for <lists+linux-i2c@lfdr.de>; Sat, 14 May 2022 15:53:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232776AbiENNxd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 14 May 2022 09:53:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232762AbiENNxV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 14 May 2022 09:53:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 217D73389B
        for <linux-i2c@vger.kernel.org>; Sat, 14 May 2022 06:53:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AC5A960F00
        for <linux-i2c@vger.kernel.org>; Sat, 14 May 2022 13:53:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84A06C340EE;
        Sat, 14 May 2022 13:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652536399;
        bh=xug21/oeia3VFFc1AHCwn/gd7gpn7PCZZOl45awAXj0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WLcWtfvMy6N3fbjGxvUvopgHCho528b//0h9HJyMlFIzpFqP/MG8/w+ZM6QClm0q2
         SNqPH6+CGpS98PklVEypoN+Qy4gewrqdoqqIKGu0kQ/BqpwaW6u6QhFpL4kqg0ZwUC
         xlVpiC8v/IqMzK3lgCSqVqH6d7Nlj+qlmbUhGtfO6YcpSqd7PcB9/GTTGHUZEhEHSQ
         fDZAGmd/zEFvAXGKMDL8HnVCD6JvFkwdA9CWPetUW7m6gQSyUMoNzYGSwjZJpovy2z
         PqZt/z7eZwKqBalWmzd0P9kgPEOfICAPHpfhYMLLd7TOzvXrLbjMKldH22sx7ZCKEQ
         fiK12KcbGYhyg==
Date:   Sat, 14 May 2022 15:53:14 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        david kerns <david.t.kerns@gmail.com>
Subject: Re: [PATCH v2 1/2] i2c-tools: Use getopt
Message-ID: <Yn+0SrNnWpkCeib6@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        david kerns <david.t.kerns@gmail.com>
References: <20220509110326.53e4b669@endymion.delvare>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VI0/8ZlcLNgxgBZ6"
Content-Disposition: inline
In-Reply-To: <20220509110326.53e4b669@endymion.delvare>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--VI0/8ZlcLNgxgBZ6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 09, 2022 at 11:03:26AM +0200, Jean Delvare wrote:
> Use the standard C getopt() function instead of parsing the options
> manually. The benefit of this move is that getopt() supports merged
> flags (for example -fy instead of -f -y) and does not require options
> to come first on the command line. As this is pretty standard by now,
> not supporting such possibilities can confuse and disappoint the user.
>=20
> Based on a preliminary patch from David Kerns.
>=20
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> ---
> Note: For i2ctransfer, I chose to keep arg_idx although it has the same
> meaning as getopt's optind variable, as I'm not sure if it is considered
> an acceptable practice for the caller to tinkle with it. If it is then
> we could get rid of arg_idx and use optind everywhere instead.

I think we can improve that incrementally once we find out. A quick
glimpse from my side also did not reveal any conclusion. So:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thank you for doing it!


--VI0/8ZlcLNgxgBZ6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJ/tEoACgkQFA3kzBSg
KbaFZQ/8CHeTPqa1aMa6uK2Fwyx+gsUVik4q/D+H0LlTUgT7LO4xnrgT7RkOWYXG
ixkHW6VXsCELX0hmaxNpPb9JYpZJbVZHg5J71gBxPFJWltIXTGb5RgcLr9mKoilY
aYPzNP8lLsnO3vuxc6YVBD+PTJuKYqpT5Ime4dhZASj67v4raV+88LwQ1+Fz+rm7
cbK95ajf/gpfhpKVCQB1sTU4LTuElguCbzp1sS1JeTZGp6vDEFUW3X/HnZ/SczHK
lbnHdteZS1NPMnBOnqo33y0Hc2pSSvc99IWT4HTnIH3+q6E1OCF/NMPatPXF95Fn
78MZksQZ/NO6CXVZLUxtzz50y5DUZ7YseJrKz5UflMuN2Ryrq8MQdCie/vKxzLpy
Bb2kSObLW7wh6GEN2kE2TSreNkcwQ/5ZdbHJjd2x2WBi46ry1NRrvbNAeej6ihpz
thBo3MRpQijNHXrR+StfhyawmYLI4ZLZ/wdJ6FCVVIAPSCspDpk/F1Qn75qXz9Ai
1RGNSp1aaTiVIK5PeDBhTgFtqIstsWDlLIiRVFwpRfXylx1hk0LW6vlEJsttcbyG
G/J2Jds0SBT5RoqxqqYVSVmbXlQj9eXnOBGpNH1Nwi/XuY7lXUXcTgsCZBxeBELv
6Ao7K5i/Qlt1jyXKojl3/Hw4j+kcoTf/R+ifb5IKruweBoqzDJI=
=2Gff
-----END PGP SIGNATURE-----

--VI0/8ZlcLNgxgBZ6--
