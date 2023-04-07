Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58F0B6DA8D0
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Apr 2023 08:18:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232242AbjDGGSj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Apr 2023 02:18:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbjDGGSi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Apr 2023 02:18:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51F13197;
        Thu,  6 Apr 2023 23:18:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E2AE560FA9;
        Fri,  7 Apr 2023 06:18:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBF7FC4339B;
        Fri,  7 Apr 2023 06:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680848317;
        bh=PkUkc3BxGY08e5rKE6FcXGqmMgAN6jFXJmjAdt2/kNM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=osdZjFbBHEtChPItfYS8FeJjike3PRGZdD7nSd7mHn55EhxyKj7ysh5K8oPyKTerl
         44u81tzYhXuE7rzRw6ZhL4LdT0AWF+eF4NUL9lPRedfvC82vj157xhOylR4H7mJQBs
         UcfYAA/ekXQ2rc/+85DU3yGgQtSckQJC0tLr7aM1eq9WG7yywgU5QbGnnABL8UikzM
         t9m27fzWWlj8ZjCVGqUVOxlACcHd5Hl4GfLfcq6Yyexmq8lzWyr3a3ZQau31avXblm
         iw5kSi4+m09LsN7wz7rJ3UpboUflwFo8mPrZiiL5d8GyZQNvpurNJGVNknU8o/C4yf
         PUuNVMnpowlFg==
Date:   Fri, 7 Apr 2023 08:18:33 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, linux-crypto@vger.kernel.org,
        linux-i2c@vger.kernel.org, Held Felix <Felix.Held@amd.com>,
        linux-kernel@vger.kernel.org,
        Mark Hasemeyer <markhas@chromium.org>,
        Grzegorz Bernacki <gjb@semihalf.com>
Subject: Re: [PATCH v8 0/6] Use CCP driver to handle PSP I2C arbitration
Message-ID: <ZC+1ufdj8WYixQsM@sai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, linux-crypto@vger.kernel.org,
        linux-i2c@vger.kernel.org, Held Felix <Felix.Held@amd.com>,
        linux-kernel@vger.kernel.org, Mark Hasemeyer <markhas@chromium.org>,
        Grzegorz Bernacki <gjb@semihalf.com>
References: <20230403183216.3493-1-mario.limonciello@amd.com>
 <ZC5pxORLN+SF/91S@sai>
 <82ef9505-f8ae-36d0-fdeb-9bfc92aec557@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5nOnx0Jc9l74hNuL"
Content-Disposition: inline
In-Reply-To: <82ef9505-f8ae-36d0-fdeb-9bfc92aec557@amd.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--5nOnx0Jc9l74hNuL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > How should this go upstream, i.e. are there dependencies? Shall I pick
> > the I2C patches or is it better if all goes via the crypto tree?
> >=20
> IMO it's better to go through the crypto tree.=C2=A0 There are dependenci=
es
> in the crypto part from the earlier series that was merged.

Ok, fine with me. I acked the I2C patches. Thanks for the heads up.


--5nOnx0Jc9l74hNuL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQvtbkACgkQFA3kzBSg
KbYilg//b/7oRyaFxSoYypW8qZWg9NazCHaTiYpl8oPfrkrDTH3KGB7/TdHX4zCt
lmVf9f0hZPJdOmvJk0SwmKNvcZUIgk/lEi2fxUAUaVPjRWM7qfh7Hn5OBSuXafRm
oJZ7rNgR2pT4rL5HwDn4sdLMQaVLAYR9TgxqKX9zjcA9yTsHidTs9WnlzzB9fwSi
k36Gw+AdUZDySzAr8GplP9n0BA4CUcJ2zNW5x3+3VJ/eM/Iq7aTiEDyC6z2sm5bM
G7DNfoXvIWzWFH8hp4/Nee8NemLNEIqw0STVKhhfRO9LnlMSZGTVktTywi4J/SVa
+xah/GFpZ1DNQQJ/Atgi2qv/tnK3X7uK3Wl3ZRMiS3gIxnqp79hP72NRxWYQMMbK
EygnaMvZgwZ/ulRoBVYnYFH0dP6CrItSqD99IMssuFYfX6sDUO7m52wsXFLcoGNr
PskEmTLtASyjG738ty77bjalo6oAFWAvCuRPY5KGMOjIP74452lpOhdC0BKyBi0B
gt9sD9uwx8/jxQK4zB1V9OZYTISxFG4A624O+CuhXH9qAq95JNYwHhPW92EXkcqC
BqgU2E7TelqVt4WfU3//4RMId0OAjmr0IkJJGXmQa8YFTpKjhUeSYSZytgTuPLf3
/DUxDn4iMQtQGfGvLiAh9vLtf0UwsVOHkyR65BFJg/g8JI0jIIg=
=GnBm
-----END PGP SIGNATURE-----

--5nOnx0Jc9l74hNuL--
