Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DB386CF2D6
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Mar 2023 21:14:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230184AbjC2TOp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Mar 2023 15:14:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230159AbjC2TOo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Mar 2023 15:14:44 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA9E2CD;
        Wed, 29 Mar 2023 12:14:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 95791B81F86;
        Wed, 29 Mar 2023 19:14:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCF2AC433D2;
        Wed, 29 Mar 2023 19:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680117281;
        bh=BxxOg2UUy/VqgwaaCXLo08etzNaqLvWrxnV1iQktj0g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WM7ARYivguJrJpqXBt2O9XAKEf3cPV6p+JUbjtQhZexTQBplI8gSj7duH9quRjDLn
         EHJW3PgPSoqhSvkw8EktX0WBeiJypZBEcIkKZEPrts0uohBkr4uzwUP4F8FQMC7zja
         sllEUUQ/7OBNY6JkvyFJvVzGomOHasKkM5gtRf4MP/C9Ox7/ophcov5V1fc/SI2xw3
         83VQzAZoLY47Ys1nnAaGerIyBVbSJENGfN9Z7yaP8A1WrSKrVi9e/ATZPZhZHG2p7A
         FJ6XTqM3lQho8Ln5gN0YyGnIboWoPqF1chWK1TniF/uszlGYPtA6FttHRD3/kP/tHC
         qFjrOkC3mODCw==
Date:   Wed, 29 Mar 2023 21:14:38 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Yang Li <yang.lee@linux.alibaba.com>
Cc:     michal.simek@xilinx.com, linux-arm-kernel@lists.infradead.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] i2c: xiic: Use
 devm_platform_get_and_ioremap_resource()
Message-ID: <ZCSOHk6EpZUerlgU@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Yang Li <yang.lee@linux.alibaba.com>, michal.simek@xilinx.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230316054325.108457-1-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OOiMFtwc4yfZTF7j"
Content-Disposition: inline
In-Reply-To: <20230316054325.108457-1-yang.lee@linux.alibaba.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--OOiMFtwc4yfZTF7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 16, 2023 at 01:43:25PM +0800, Yang Li wrote:
> According to commit 890cc39a8799 ("drivers: provide
> devm_platform_get_and_ioremap_resource()"), convert
> platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
>=20
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Applied to for-next, thanks!


--OOiMFtwc4yfZTF7j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQkjh4ACgkQFA3kzBSg
Kba5lg//dCJkO5ZlO4uDCFtTAAOGn9fEFjgCBwhk3BgKbXTU0O+DiYcqAVFvSVv2
q4X2Yb6u3Qxw96jMU6KQkOd0tIRFsdCWD0YUXfK49ikXB81O4+9YfeCsJh0cZkI4
8j7CapFTU7PMMvh/CJIgOK4ry3is3X43MmnHq9xZGM2bxVY9/Cs/rmE+aI+1KcOJ
ei91CgVVVbycEe/+R2sOApO6te+icppxDDOTb8c4gaaZOMZiTjBpCaFogTi9arlO
oQ2qnXRTOAtTVMwjut/O04/D+PuhILaPRUUXaEWLfXcd9A1BdUNU6OXStteBHqyu
pTJvdTX+OHsad1Y/N3ub0rpBTOAse1F0KS7KVtGEyWPYJg+XgSQPAfoI06FNZOP0
6b2Zua9LQOpKQk1m/OjCIv0MbdvPI9bnodG5xo57CrfgVuDMTaza69zuMCwSOJJJ
4kEy0QKCw6oMLfGk3DfPzfqngLuT8bX9iLetiGaDdSy7Fk3hrc0+CNEudv51W7hS
V/2JkFzKgqqZVOVT1/mDVf54vrfmJbE+gCzgFHFIqP7K3wH5E0nw0/1uvOEn/sR0
JsuFJluB2WE/7ElGsdZIaZDEHFtaUB9Qw+Voq4ZkWNpGa1g0pAbflWIJStG6omLm
zt6ES7qJ3Guh7Z1QyYSZ3ecNBQXvEKoEEp7UTDWysL1vqDZluOU=
=081D
-----END PGP SIGNATURE-----

--OOiMFtwc4yfZTF7j--
