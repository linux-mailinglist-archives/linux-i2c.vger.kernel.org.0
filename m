Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6039E78DF2D
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Aug 2023 22:14:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232248AbjH3TxA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 30 Aug 2023 15:53:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231927AbjH3Twf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 30 Aug 2023 15:52:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D816659F76;
        Wed, 30 Aug 2023 12:20:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 27652649CA;
        Wed, 30 Aug 2023 19:19:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D77CAC433C8;
        Wed, 30 Aug 2023 19:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693423139;
        bh=DQehdTj1zGLksZp0kH4qhiZqixjDifmmemA/25jnu/k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IpF2BjCs2PIj9Ct0u35NKMNrn09TpMuu6e/wZuJS2cC2da0YnsBlhfNChW9jqSzsx
         ExtuqwcwbNTAGnrwC47fIwc8g3SL1VE1thytKlwXp97GlAPJIH+E2o+1aRxJW1wxos
         0LVrRinXcXTZThoXIv8n2ZbPROs+r6vCN7/oHCWOiMR1Q//9qKiVcW/+8LTBx0FR4C
         Xek1XSTFznkJD7ehJCFQC5RX7d0tq5O1OpuFHFw30Vyhj1i+QW5CJql4vNibs6cpYj
         SePwub2fCA3qmUqDbtP4zHS0nkJ8yUIty9OQj2Wg3LQVbeRqhoBSvxobSkrwGxNLTI
         AA//rMHYe1zvw==
Date:   Wed, 30 Aug 2023 21:18:55 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc:     linux-pci@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/8] I2C: ali15x3: Do PCI error checks on own line
Message-ID: <ZO+WH2LLkyM0PdM0@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        linux-pci@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230827133705.12991-1-ilpo.jarvinen@linux.intel.com>
 <20230827133705.12991-6-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="35KUKm7IdQwcja9I"
Content-Disposition: inline
In-Reply-To: <20230827133705.12991-6-ilpo.jarvinen@linux.intel.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--35KUKm7IdQwcja9I
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 27, 2023 at 04:37:02PM +0300, Ilpo J=C3=A4rvinen wrote:
> Instead of if conditions with line splits, use the usual error handling
> pattern with a separate variable to improve readability.
>=20
> No functional changes intended.
>=20
> Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

Applied to for-next, thanks!


--35KUKm7IdQwcja9I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTvlh8ACgkQFA3kzBSg
KbYSXg//c8OcU6ixBEjPBdpYLtGQnTnzVraWKC3vVbipNSoeU9+vw7tN/m4YM3uv
n0DUSlkmDGzmuxvxlXKDjINy8urJI2UbhhNCdSjgPz8PjdCLg2vqijPNFGcVNX7A
DE9D6kBfb2hFlIlDYpmqBos9c6U4zgA31ypTD3K5bziVgyAS6PqK20qtes0jHqH6
nD+HcKyNeMjborf6tnDQo2UPJNQlOo2KZXFD4kLBS4xqLcquGqDkueEjWi1CUX+H
m16Ehqg2yo4eZ7PtrdCFBYBnK4uc51E81CKrws7pkBsUFdsuvXOQcfCz4c9zWK+9
fES0hJx/NZbgs3JxJw5dLgwXufZcYCmw0v1k5ED8Mh5exyVuM1fFQMf+h0ytmEfz
jPtbXw3bAJTHbutX8Bt5QK5tPEowM5LFReJkTXVRNN280ofFK+4kHUj8CIxkL2Iq
65Fj+VEsDIQzKxHa6aefYS9ZTSGQrYMWokX1TwfP2StFNPSubbwyQF1fHmSfxyde
57dO8pMBoCkq8r3ttv66lfAtv9IX73olx7OPUHelNax0qToRZErAXzVv37DB2CIQ
o9O3QN2XZ/5kBaGrHj3TW5xFwHRg4YFOZ3Jvkrrl6Ak5O9rQhU4EWsOMJwra7YcN
Bj1BRSFYRBiuXjGfEWIuHmj1blZCob5/PN3V2Y8Demli+2ZbX3Y=
=osT3
-----END PGP SIGNATURE-----

--35KUKm7IdQwcja9I--
