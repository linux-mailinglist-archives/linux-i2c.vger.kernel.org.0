Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D963F568AEB
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Jul 2022 16:10:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232994AbiGFOJu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Jul 2022 10:09:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233073AbiGFOJs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Jul 2022 10:09:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E434A13FAF
        for <linux-i2c@vger.kernel.org>; Wed,  6 Jul 2022 07:09:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 81FF661E72
        for <linux-i2c@vger.kernel.org>; Wed,  6 Jul 2022 14:09:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F387C3411C;
        Wed,  6 Jul 2022 14:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657116580;
        bh=w62wuprh8S3FG6lx8e3eqNdFsIdOaiOizvICpCWKJWY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pBiMpLq7hQMuaslkVn9AzW8qz1dCOUX5IwzFp+lB7qN2oPyRTqB0VZ2No6BWnS2b4
         MzVMAAHlBN7Qjg0UhgCCFM0e/r6JJ2xggUBkGf+qDn4zodllR56whPHyW8tomcJLcw
         oBIIooZUr0EoIJvjR3URnaHIYqlchQRvgtimy1choH7FUgghWqC8/OTt/Cx8MXJccv
         5qjwatOFvFFG07VefkqloAGteStvFExrkHqhTcvkdDuzruMrIyUL2ykanLhoEuAkyR
         +NQk/65/tCx9WmxsWIGqQ6lPp28SdyyHDRXtuCqatvz/qryBPjfR9XWNcj5MEz1Ihz
         ivfeqmn38DN8Q==
Date:   Wed, 6 Jul 2022 16:09:36 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2] i2c: i801: Add support for Intel Meteor Lake-P
Message-ID: <YsWXoHxWwhjTGwp9@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20220630074154.692578-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="io4Tme8Pd+Ct1WhA"
Content-Disposition: inline
In-Reply-To: <20220630074154.692578-1-jarkko.nikula@linux.intel.com>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--io4Tme8Pd+Ct1WhA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 30, 2022 at 10:41:54AM +0300, Jarkko Nikula wrote:
> Add SMBus PCI ID on Intel Meteor Lake-P.
>=20
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Applied to for-next, thanks!


--io4Tme8Pd+Ct1WhA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLFl6AACgkQFA3kzBSg
KbYRXxAAjwpBlRT/rXg+NUu3xkMeux0tmCxZoLXIDGWg6784hAVti/ucNu2BbmzI
PuLQjKpcz0SU3ADkqC2h7xrQg2fAEd7AhBkkB6r5gOgKD3el7AolUza+ETKtE00m
TYkkMuY78ytt+5isFv3YHLHtcsxVVnriklWa9s/NtHfBDr5ITFqe6CwLG1JJCNcP
YjPEjAj+XE8ibyl9/3bgHsoiNXGUuZ8KkxQOizvERBqE44E21rYX3satl/4Yu7hl
aoC3MKXhXAa4H9IrSmUNYEK48HFPi8qkMqKnV1c0UzmwavU/jcajLi1xZXNX0SII
hlNwH4r+30GFS5tq260a/wQ5WFUFM0tnirrh//7+oc0Lk/IsM4AQMYUQnho1NxmR
p9Q3NnMrBqNv0r4tTR9koT9au2RnkTt5Y3GajVroGBVmrvAnkuNX+/Pp90AdcwpS
zNEWk7hfVwTYV8XEnlJTNpuupsbpOfNj6oaXtJhVmYnUSBJZBeIO3eqqdJ8Jsces
0thtSrcauSlq1kPCaqvotuBolsDt5DKBUkYXE6GmCMQcjm4h1huDxygc1pAPZ7Er
kH4XDL0hrotKsmKnsdknPyGnQjjM26XZjF2GM6I8SyIao9yn6aFMMmkRcITJEqs8
slQu/SK5vG0nFfo7ET++T7qkDdjTo7qxyJ/I3F4pcjCbKDM/r3k=
=0HOl
-----END PGP SIGNATURE-----

--io4Tme8Pd+Ct1WhA--
