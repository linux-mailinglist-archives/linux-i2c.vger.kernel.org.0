Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E1244C8F25
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Mar 2022 16:33:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233573AbiCAPeJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Mar 2022 10:34:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231511AbiCAPeJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Mar 2022 10:34:09 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AF4225ED
        for <linux-i2c@vger.kernel.org>; Tue,  1 Mar 2022 07:33:28 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 31A74B8163F
        for <linux-i2c@vger.kernel.org>; Tue,  1 Mar 2022 15:33:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DE89C340EE;
        Tue,  1 Mar 2022 15:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646148805;
        bh=WS8hFg7Nxn5HMj+n7VbFuRj1B983tvBoCxxN/m9+BMI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HE+gzEwDGAvpSffM594M1lVvil0+f0bcBHOVVKS0wIpLJJW++mBvV7c3z4oZZkxPZ
         E1Lfqy2tLJpAHP6fM0hUH/w+NZup3MGJfP9FnB6gSySl59xpvV9g/B69MwR+AsNDkN
         Pag0DUCQjvFNHsr84F8P3ZwFrgdExzv8q1Yn7RBuMKzhFBm/LZNo+GfgJ37hpEoftu
         G3nsiNLUl5CFma+3gLtEkiCjlHvZQ41SjR5/vJPbNmH+f/7R+PJDhtYN4nlwVFeWwH
         TPy3/rqFaqB0fWqdMZ2t0+1PsTerJIO40R7OgtxYvwevKL+wE86ollQsSWaTqnVTRc
         RQk755AO/iAMg==
Date:   Tue, 1 Mar 2022 16:33:23 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: designware: Use the
 i2c_mark_adapter_suspended/resumed() helpers
Message-ID: <Yh48w7GwMIbkDoCW@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org
References: <20220223134839.731138-1-hdegoede@redhat.com>
 <20220223134839.731138-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2ETbC4+v30VhjE0L"
Content-Disposition: inline
In-Reply-To: <20220223134839.731138-2-hdegoede@redhat.com>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--2ETbC4+v30VhjE0L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 23, 2022 at 02:48:39PM +0100, Hans de Goede wrote:
> Use the i2c_mark_adapter_suspended/resumed() i2c-core helpers and rely
> on the i2c-core's suspended checking instead of using DIY code.
>=20
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied to for-next, thanks! Nice to see the core helpers getting used
more widely :)


--2ETbC4+v30VhjE0L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIePMIACgkQFA3kzBSg
KbbBdBAApZT9xJAWTDGXszlFopzeTvtVK0LQri3JHPA7rv8XxcTgh2MHRueb5yKx
y6tpzu+r1BBrqRR5o8Lu9zinbDXxVouKGrw9pv6QdDa4hcTh5GC9pqsGcu3EX8+L
1E5AzNDGJCdAJ+/7rQU60e9bI10HLw/D2/XycYJrxw+4R//4O+3468OfTLItrrcH
LUGYTyUi323M3EOJN3kTNP8785RWC0c2Dx6WLIwsz6MbJ3WRiuYEm0KIL/QJYCbR
KBwe85NoBD2tpDvQIr1Tga1FCyjN6LybXK853WA8AcibBZtuC69BHIMCRwkh2SQo
H2nVkLArJcT+WsFeZcdAd0HygPI1sK+12OWGwObgMBvBfpdiHbkxrq3pPPtmy/+s
wWScKJnMPZUl1/qjksFynz/uOemKqbiruwlFMYaVE2MwdKk6tLZPs+9JJL8KT9Od
N7Fv0fvMB8uw/r2QE+6+bKlEJkzSKtptFhjMprjArQb9a1l4H6f6MQMhF+9Gv1hE
+ZWPn+Klm+CcBf8kqeu8XaJ2gbtnTPcPWDGF/4vQ/xU2dh80zL9i7lvLQwSRz7gZ
C2UeX7D6e/ki+dEU53yGtw4+5PZZ1ncBuw6njsoZv1SZ0EQa99RRVNv/Q71goF9n
hYTvj/I59pYLqPGEhLyFn2iUnWUV1xmBYvfsBFSBDENZW4vGfbw=
=vUBS
-----END PGP SIGNATURE-----

--2ETbC4+v30VhjE0L--
