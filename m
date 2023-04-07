Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7E8E6DA8CD
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Apr 2023 08:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232887AbjDGGR6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Apr 2023 02:17:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbjDGGR5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Apr 2023 02:17:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F458A24F;
        Thu,  6 Apr 2023 23:17:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DA64460F88;
        Fri,  7 Apr 2023 06:17:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B61BAC433EF;
        Fri,  7 Apr 2023 06:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680848273;
        bh=p1VARxwFMANJ/MatMWMTSFRKCzACydohZU2fVqaCbac=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ePtlZrqg5lBcMAItZ3g4R/AusIqU0L+NcIuymuLkapHs27BuVzAuy5wz4yy60nSto
         rHBf13allNCNLWAvMmHTZuu7GijaaU9Ymqh0ceFxDxWvT5OdOQHJT1SNnklJW8SbCd
         iScF4Jvfjxteb8BsHjhQDxCR12VxZxk+kkSwYYfih7WfSPHdXvVMHa+U924jRMC8hZ
         ONGzqQP5IBgvuo9QuQe9yGaBXkjkkhe29GrlwlaG9qdFz66Zw3yung2GLv98zHcDUU
         XkfH9+X4Xxd3YzMKNLzuuTeOZtp85MFX3xdh3jGQaFTG2WxnGZ21yU9rwi/kvaFWPb
         35Sw6NGRsgOZg==
Date:   Fri, 7 Apr 2023 08:17:49 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, Held Felix <Felix.Held@amd.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Mark Hasemeyer <markhas@chromium.org>,
        Grzegorz Bernacki <gjb@semihalf.com>
Subject: Re: [PATCH v8 6/6] i2c: designware: Add doorbell support for
 Mendocino
Message-ID: <ZC+1jcwDZXd5+2gD@sai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, Held Felix <Felix.Held@amd.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Mark Hasemeyer <markhas@chromium.org>,
        Grzegorz Bernacki <gjb@semihalf.com>
References: <20230403183216.3493-1-mario.limonciello@amd.com>
 <20230403183216.3493-7-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Ubg16lMSRvqDL1S7"
Content-Disposition: inline
In-Reply-To: <20230403183216.3493-7-mario.limonciello@amd.com>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Ubg16lMSRvqDL1S7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 03, 2023 at 01:32:15PM -0500, Mario Limonciello wrote:
> Mendocino and later platform don't use the platform feature mailbox for
> communication for I2C arbitration, they rely upon ringing a doorbell.
>=20
> Detect the platform by the device ID of the root port and choose the
> appropriate method.
>=20
> Link: https://lore.kernel.org/linux-i2c/20220916131854.687371-3-jsd@semih=
alf.com/
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Reviewed-by: Mark Hasemeyer <markhas@chromium.org>
> Tested-by: Mark Hasemeyer <markhas@chromium.org>

Acked-by: Wolfram Sang <wsa@kernel.org>


--Ubg16lMSRvqDL1S7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQvtY0ACgkQFA3kzBSg
KbZOYA/+Pq4Uhkrds9W8Ehtm/+4wS/PLcjOr4z6GNgiCquzrCjqOJWDdU1gQCJlS
DP+fMRlki4vlZWrlAYckab+GP9DzvLzY3JjZGL0tDE8MnyW+YKP5lH7GVRnaGcMU
rvSlAto4eqsxv9RLYwZFYn9IRvqFeY/53YXhzmtF6WD6eCv5gBAPUnwNZdx8cOwV
YqNQduxOKj8IsgzC9B6WipVHK6veYMWE/6J0WOieSA6cPSqulF4Jk4bbYZ0mTTLE
l6rFo4yTsjXb9N9DACscwaug20vYPXatkZFcfbzcJgkOe3RKWK0j0GFzUZ8HbQGE
hhM9NZw8Sr9D60ESpPuU8t80GderzFwh8/HpFRcjy4O038tBbjnvxrwCvUGPZQOd
y34bgnWA1P02p5llb7nwkvtU8nRjSQ+22j62M6CKXPJ5YM5u2gG+gf6Cg77DSRfG
MDIi0h1R+avZAiQl2AZjf4Nbos398ULcWCQ0ujSMrX6ASEnkyAOQHua0yX1ctBSD
MATat0rHFhANYXfmuhsxhRghsjKaZyfnCvydM9aDwVtY4wxfDQYPpwx/GbPis1Pe
4/T1LeOTHmgzuC1onk8As/YbR2b74Jq5/VzCKAKLDB+4J9PbHC6LMbIq5mjt+O9v
Za90rajrsvmXyYs82/ng1qfOhu45Fa4YhVAa0u+HXjHls+BflaA=
=WuL4
-----END PGP SIGNATURE-----

--Ubg16lMSRvqDL1S7--
