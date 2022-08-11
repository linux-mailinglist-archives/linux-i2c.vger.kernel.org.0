Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39F6E590791
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Aug 2022 22:51:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbiHKUve (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Aug 2022 16:51:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235509AbiHKUvd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Aug 2022 16:51:33 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A34972BB24;
        Thu, 11 Aug 2022 13:51:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id A27DACE23B2;
        Thu, 11 Aug 2022 20:51:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37064C433C1;
        Thu, 11 Aug 2022 20:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660251089;
        bh=TkV5AzP0uES5xoP0Fw+zKILw/vgrbwyi2v4auwyAIS0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CtazE2Jxwb3zaxYaRTpa/ckKhwwIrDmE5M3cKUj5Gjhm+S3INV+t4vr9pqXPvjO7O
         YNN81Ed9CR26v7m5s86Ado2vU9vllMGFLT9rFK+gT/cyxkHzunqVsITpw6bzfwNJNU
         4AASrNs/DNqYE0Y2sMFhWCm7Cx3qExYvtEEdbA0It6dl4sSWoRebpcguzB5f2kc+dy
         r1NwDUFFbQdu/aDkH6a9iVt+pmaS5LoZv/XCz7N3JcacWNxEr7laSm8uMeO9jIORQe
         5OlmgrhiHLJrdCwTJjaTaPmBMO/xwQ4wkWSDNoM7nuHgmF17C340FFFIobzbsTaSmv
         myvuSI29an26w==
Date:   Thu, 11 Aug 2022 22:51:22 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Chris Pringle <chris.pringle@phabrix.com>
Cc:     Michael.Brunner@kontron.com, ingmar.klein@kontron.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: kempld: Support ACPI I2C device declaration
Message-ID: <YvVryhRO6QZ7HTCS@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Chris Pringle <chris.pringle@phabrix.com>,
        Michael.Brunner@kontron.com, ingmar.klein@kontron.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220811082141.1428977-1-chris.pringle@phabrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8pF7oldnOthk2mdU"
Content-Disposition: inline
In-Reply-To: <20220811082141.1428977-1-chris.pringle@phabrix.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--8pF7oldnOthk2mdU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 11, 2022 at 09:21:41AM +0100, Chris Pringle wrote:
> Adds an ACPI companion to the KEMPLD I2C driver so that it correctly
> detects any I2C devices nested under the KEMPLD's ACPI node (SBRG.CPLD).
>=20
> This allows I2C devices attached to the KEMPLD I2C adapter to be declared
> and instantiated via ACPI.
>=20
> Signed-off-by: Chris Pringle <chris.pringle@phabrix.com>

Applied to for-current, thanks!


--8pF7oldnOthk2mdU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmL1a8QACgkQFA3kzBSg
KbZikA/8DUNcF+Ul8iL8g2sS42XX+F4G1S+bZKZ9oZG1lljyUWZcVv0hpVj5May0
ceMvnuYjsOLBwjNO4F53QaY4hXjGa77kgzXWfGmi00fSY3Izm7IO5Q4eNtqv6oB0
QkxiScyfTvfKeEY9/H5SFCsLKiGxziWRN1qQQVQ/MF6FxsAwYUzABYLcWDZcOOaP
3Upx8U25j6YprZJdmZ0SgYdP3DvIaQhuA0guNAmlVMpeMUzQnSl0njSFZsGsNJc/
2LNPYUex94VLv/K7mIC1AhKasBOJKn2vlrjMIHo6QuPssYsGVXN+fw0V8Rlb0yyw
wfpKzcsoD2JL6aRK9KLcUKriEwB4Nnkrgf7XNjmI1gtLRgYifZOWDhjx/51Rtjnn
RrIMvTbgMMKdZVyY4YbR/ksn9FB4zMFkYR/Os8KCGVj+qJPvKNU9mRdx32Q2+meN
VSEqzRMj2N53zeDtuResJLPElJH7IvU+lkq8eAAvyDcogxGQ/YAY5AOrrbxSMi+a
olEduwY43rOwptrja5VQByGUfeaWp49tx28K3EdrwFdS78rg5JEl0gOGeN+FuDKL
YHuEebzLggSYgYNrcs3sI9yk8Ioij90sZ07IZmXhrOyWnUm3Hu/IsRL6Eum4/78o
hJmGkQJ03/awp0AoqymV5ZwmxsI8ofCnx2LgIaTnx7xvxEH7E6w=
=a5AI
-----END PGP SIGNATURE-----

--8pF7oldnOthk2mdU--
