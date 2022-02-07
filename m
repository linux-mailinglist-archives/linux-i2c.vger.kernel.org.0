Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 517DE4AC15F
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 15:37:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243830AbiBGOgj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 09:36:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235071AbiBGOPB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 09:15:01 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F81AC0401C0;
        Mon,  7 Feb 2022 06:15:00 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DE95B60A57;
        Mon,  7 Feb 2022 14:14:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACF23C004E1;
        Mon,  7 Feb 2022 14:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644243299;
        bh=kXCavZxVDpPavOetLGC5KN88JPcZOskGkjpwki3m8Q4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tqOZR3W07vwmXzQCM2E0Jpg29RkdWgGlOikhYShhnfwqLUDp3bwc9NNnNvRRNrEdS
         NG74LGgdD+pQO0gGxzbxZtLTFn2WfDh7izPqjiqifo1BhL63ZWsPi4fea1HrhNneOw
         XJezewxS0cAkDkZCAlbvMqDOCn11nAIi7erEPS09RUSMmo495JbQbb9dVeoYYW15Bo
         B/vG92mt3hmQk4bi6PghWSswbxtq/mcqFkFrcbTw1CxiUXju0ZsYJH+LDz+b9JLkxt
         5a5EqC2ZB6xulm11xwaKRxewuYvS+Vn1uZazPSwvWlsiqgoy0bOeyna9J1j9vZscoo
         xZmftkPnQXOWw==
Date:   Mon, 7 Feb 2022 15:14:56 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
Subject: Re: [PATCH v3 1/5] i2c: Introduce common module to instantiate CCGx
 UCSI
Message-ID: <YgEpYE2VNc05XhpG@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
References: <20220105141935.24109-1-andriy.shevchenko@linux.intel.com>
 <Ye7AhqMsOkfvHOAg@smile.fi.intel.com>
 <YgEa/blO2UMzztCq@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5Q9Y37aHm32GDcLx"
Content-Disposition: inline
In-Reply-To: <YgEa/blO2UMzztCq@smile.fi.intel.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--5Q9Y37aHm32GDcLx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Ajay, is it possible to get your tag on the series, please?
>=20
> Wolfram, can you remind, please, what the process is, if there is
> a non-responsive (in a meaningful period of time) maintainer?

Well, I can apply patches if there is no response but interest and
reasonable trust, of course. Your series has interest and trust. But
still, it may be nice to ping active people from Nvidia and ask about
Ajay.


--5Q9Y37aHm32GDcLx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIBKVwACgkQFA3kzBSg
Kba05RAAk9nEfFctEY0932pfK/smckobW69iSd1by93obopbJTmi5wR0SzqHaCBq
PQwjiH+vW1OBkwE1oTr1L5CJnub3EB1dnfjmQV5maDyVx/wHO/gVwlsNiDtO8/fG
AAv7b1EP7jXtbcGMhaB9CDf6K9ZCCb4PuQbe5Wdk0ijcPeDiQbpzgf1yxC522SS/
dcJbeb5Uth2Mad4G29yyqBlykJW/I2iXDVy3sahMin1c/6hhMkXYJBsodrztKmbt
3vK6JXRCktFemcKH+SduSmo3Oa3ELwqcphCk+5u65YIEX2hJm9W3+ffakIQVpnRo
lDoRcJBo63KjJOQvDzN3aDexUgzss42s18/EtEyFVQgsW3zxF3e4sgexn1tii5fj
KTV9ejhDvlLK4FxijYYTs7IpqOdqwnc9rRmtS1lffVHP04gNoT7RaFbxsLxqrky0
IxfRUDdJPRdK27M709iGszlYww9SUpSbBuNBbwMC+LgXXPRR2YW0JvoPpWg9Oo20
MC4B+aQvzW/ubcEYUjaYytGfCca1Ulmm7Zr/sau3IY6zw0gyh/UZtDlg2LTUBzVS
WpaFNaZpZ7WrdrbnZBZ/6Di3xvGtvgheqPQpaHhajrpeSxlrqCgh0rXMBxe/m7t0
feKmmC6ffTMWpjUrz7ZZFp/aktcBe7bIZ3ftQlb6dBf9CgE9OX4=
=HfHu
-----END PGP SIGNATURE-----

--5Q9Y37aHm32GDcLx--
