Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B533F4B66F7
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Feb 2022 10:07:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234987AbiBOJIG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Feb 2022 04:08:06 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiBOJIF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Feb 2022 04:08:05 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5053C13D37;
        Tue, 15 Feb 2022 01:07:56 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E2023616AF;
        Tue, 15 Feb 2022 09:07:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2F23C340EC;
        Tue, 15 Feb 2022 09:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644916075;
        bh=zzQ++jFkJ8DRWiYqWQzzq0FtqQUHIKh7quqO8EbrYN4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VsyAoIaXucVFWp4Tsjd2qrHPO+lWQINOlbRQWSDb8uf6aKkqIvG+j5AdGq+Uq4IV2
         QX6IVd8SATEB93neJYT9pnK/K3uPB8qr0q1Sw/YvADctJGIweNxyXKSzL8lEf0S9Ad
         BHVosijkt8AHKtCQuqY9Nimcw0ZVKznpoTmGKEh6aK4/j+3HOnRM/ARqinnjJIKjJM
         9BGG3bqf+mAFgLionSOfnDZXswAULGXOwT8AD77GJ96GwFvQvdjOsbYh/QyO3qsx+s
         NDUJr+H4fUHari7Fi5Esd18XPU5DxSlwHKkVLlXp3U4ZaunJAi/4sDNWvVqFrvahFa
         uO/x2pHnztz0w==
Date:   Tue, 15 Feb 2022 10:07:50 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
Subject: Re: [PATCH v3 1/5] i2c: Introduce common module to instantiate CCGx
 UCSI
Message-ID: <YgttZtBkiV8k0ph/@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
References: <20220105141935.24109-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="81Lht1NIFPVUzLOS"
Content-Disposition: inline
In-Reply-To: <20220105141935.24109-1-andriy.shevchenko@linux.intel.com>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--81Lht1NIFPVUzLOS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 05, 2022 at 04:19:31PM +0200, Andy Shevchenko wrote:
> Introduce a common module to provide an API to instantiate UCSI device
> for Cypress CCGx Type-C controller. Individual bus drivers need to select
> this one on demand.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-next, thanks!


--81Lht1NIFPVUzLOS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmILbWYACgkQFA3kzBSg
KbYaXQ//a93XY/0HhomvpPcq6DkGyDS+SPsBfbsuySWPt22mDFBmeMqBiMUdJUfk
Qm77uVUM2z4OiLem6kvncAQYAIYvEYMW7KgLEf552lLEPAEc2Suq1AVkbGh0KnQa
wDkkQVXaccL6wUjDIrbGQ6TV53IyJxxMegbPikS/heADpk+jcYKYOjkbR1h4nsur
i2BFqktQ4L369p9Tm8mbowdnnj9dl4q4iQMeiEFjdXI6Gj+nhCTL1V7hr427PaH2
Z/hFQNOmTVZcF7Qigv5ti4jMenOGVr1+RUoD8UHR9bKE/zMwoK7S2UKvJG80D+4e
o4rfov4fAQ+F7gfa+IP9d3IuuqBruzyOY6gRbbLZWNGhf7aIO1L5mKss961io5v+
oW5ZOe+2jYyDo2Mt693o6gSZ9RAHQmD+ElXZ/0/WASUv5/qVbX2JThwRH608qhV1
5kJ8bBe56r5hrtU7L+tsNtEQE2KGfQ8lSiEKXoxiBSomQvNgg3X62EJaK2ClkdZv
LLapAY6SZ+Gfssx9irmbPQ4HSYYq3klKTVQYHQnQ9+8eHPTR/NdF5p2o2kEPZAgq
MCz8GcxeQ4XHxz/4QVTNxX/V6fxlfwArGQ6Sfv2KU0/enfcjwjfRSV7gdZZIpfqV
x/QAT74rPUVK+j4DynA2hAob0ODMOzxKESI4Jtax3BE06mxQPXM=
=g1Wa
-----END PGP SIGNATURE-----

--81Lht1NIFPVUzLOS--
