Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 105C74B17EA
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Feb 2022 23:08:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344814AbiBJWIR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Feb 2022 17:08:17 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344810AbiBJWIR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Feb 2022 17:08:17 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD96E1F5;
        Thu, 10 Feb 2022 14:08:16 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 68376B8277C;
        Thu, 10 Feb 2022 22:08:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69F23C004E1;
        Thu, 10 Feb 2022 22:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644530894;
        bh=im05UYjFr5xVQmXlVHl+Yh2qcTmxBBBiFbmqQpJ38Ik=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bZ4a0xfnep4I9B1TdtjTkuxbmxOd3LrzEx+KHgX/HRJwMQlHr6BWPQABrNQKFyPDS
         DrGEL3o8alwDzg+kd9IzrkfSdKVezJen4V+fJk7Uh7BF3xzk3UhVEbJVlUIEOjisRl
         yuh42lfnDOYIyDLLdNGBIHVLhwF9GY29/aCs2gm8jgKgldmKr7Ujqucp7/pl+ZKZhS
         GRzUJORC15TCwlntA5WpODg1swPVnBrhiJxqwtfHkVyaV3QtS95VxPhvoKDgzYNU1c
         dXyASnxElPKWJgpJlpEeG+imvcWbwQY2p4Y/5j4Na1Zo8keUPEjL7SONje9/I5leuk
         mjemPxxyC4vng==
Date:   Thu, 10 Feb 2022 23:08:10 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Jan Dabros <jsd@semihalf.com>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, hdegoede@redhat.com,
        rrangel@chromium.org, mw@semihalf.com, jaz@semihalf.com,
        upstream@semihalf.com, thomas.lendacky@amd.com,
        alexander.deucher@amd.com, Nimesh.Easow@amd.com,
        mario.limonciello@amd.com
Subject: Re: [PATCH v4 1/2] i2c: designware: Add missing locks
Message-ID: <YgWMyj6ZZzBQRODX@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jan Dabros <jsd@semihalf.com>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        hdegoede@redhat.com, rrangel@chromium.org, mw@semihalf.com,
        jaz@semihalf.com, upstream@semihalf.com, thomas.lendacky@amd.com,
        alexander.deucher@amd.com, Nimesh.Easow@amd.com,
        mario.limonciello@amd.com
References: <20220208141218.2049591-1-jsd@semihalf.com>
 <20220208141218.2049591-2-jsd@semihalf.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BMLDJw7+yCNEw4UV"
Content-Disposition: inline
In-Reply-To: <20220208141218.2049591-2-jsd@semihalf.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--BMLDJw7+yCNEw4UV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 08, 2022 at 03:12:17PM +0100, Jan Dabros wrote:
> All accesses to controller's registers should be protected on
> probe, disable and xfer paths. This is needed for i2c bus controllers
> that are shared with but not controller by kernel.
>=20
> Signed-off-by: Jan Dabros <jsd@semihalf.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Applied to for-next, thanks!


--BMLDJw7+yCNEw4UV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIFjMoACgkQFA3kzBSg
Kbar3hAAnKWx4hVH7usYrHMzNV52RqTDUm6EPmnoQMuHArBuGynsHfjAcNVBOuit
Ail8RGo6OdhbP9X8nLAlRVfbHBiU2yqwqgYdSwYmNfmlYjAuBasyM1qsQAjvgUYo
aGYrfY6oxqZaq/9qe4T3LTSzWxF4WcpyJ5VnnmCXhiQL0ZA8pBtEq+iwwVZkPh50
/9bk5kjLJ7cj3VumsvHLV127m6/y4ZYd/cQhcZtFzYVdCKF5q3Xm616BjJtukuVM
V6xfNSu3bH0Oce3pGKJsW4WpQgdQ1OJKA+xHQZhl8kFYyUDr/Z1rAzLcFL6Tpgpr
I49jjewVw6xK5QorAStgOs2H65gWjR9z6YXovuH0SQx4ggKbPHRFkZQHprBLBUKD
OJHX5HW9Gx6ydb4LJTkXd3IX+fhl1tr8zycfhnDc9319ZDGYT/T7uB7tS/G4OmXM
ncHIcJiJqjb2X77Mc7g26oeuUuYg4tsp5nx8OwpeznUhVzYBlU9VfTNr9XENWS1I
v5RMXEJd70ZIo/XWfun/8qNdCRX+gwiF4bTZ3oBWewy9CcmbjgzYM1aWrmEG4z1l
ldl5paYNvmJK1EkZ2HXEuZKV1P2us98dzhdqhAKK9PdXssJNMzzKoAW/7r5XmfVF
W0JH5inYNqXU7zsamtrL31u+j/QVrx+HJ+wBp5NFAe+cgEE/B9c=
=oKvU
-----END PGP SIGNATURE-----

--BMLDJw7+yCNEw4UV--
