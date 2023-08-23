Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DDB8786209
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Aug 2023 23:16:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237180AbjHWVPw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Aug 2023 17:15:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237188AbjHWVPc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Aug 2023 17:15:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2E5610DA;
        Wed, 23 Aug 2023 14:15:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2D36D62208;
        Wed, 23 Aug 2023 21:15:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1EA9C433C7;
        Wed, 23 Aug 2023 21:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692825329;
        bh=IcpUDL+AZsElMu1Q8aXNP6o+Fagisx2ohUPc5dgBBvc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=W3pNZ+sJ1sJv3RjS0s7Y33dnG5lBWmLuhlD+PrtxQSl0JLQIKzzBDi7IkOj2E/vhK
         fGQ7L4zB16ZVMt3VbFX5gk80pxeqETuN1qXt5IZ3Rd1AV6RDDQM+991OZDX5lG21sv
         5lRiAsq9tZmyjZciB3Lmg/YNOQQoZIIAftLbzunG5cGdhl2DcIrlz358wkm79KQfFm
         wyUF5HElco8JN5CxEPCtadR29bzi21HUT+6SB/6vkg1/Ri6QI8UdAL9gERUN/IDVWC
         pO4XX5eV66R6ofBCsOX8Xa0O4Zd3iWKa9BjixIEBWmC7k1tkiCNsXuDSqp+BJvZyLV
         uAUGaKdEMeNEg==
Date:   Wed, 23 Aug 2023 23:15:25 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     Peter Rosin <peda@axentia.se>, naresh.solanki@9elements.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v15 3/4] i2c: muxes: pca954x: Add MAX735x/MAX736x support
Message-ID: <ZOZ27dnU0fAoMp3s@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Peter Rosin <peda@axentia.se>, naresh.solanki@9elements.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230817071056.2125679-1-patrick.rudolph@9elements.com>
 <20230817071056.2125679-4-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fyHrRlVQjHV3Dqqi"
Content-Disposition: inline
In-Reply-To: <20230817071056.2125679-4-patrick.rudolph@9elements.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--fyHrRlVQjHV3Dqqi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 17, 2023 at 09:10:52AM +0200, Patrick Rudolph wrote:
> Add support for the following Maxim chips using the existing PCA954x
> driver:
> - MAX7356
> - MAX7357
> - MAX7358
> - MAX7367
> - MAX7368
> - MAX7369
>=20
> All added Maxim chips behave like the PCA954x, where a single SMBUS byte
> write selects up to 8 channels to be bridged to the primary bus.
>=20
> While the MAX7357/MAX7358 have interrupt support, they don't act as
> interrupt controller like the PCA9545 does. Thus don't enable IRQ support
> and handle them like the PCA9548.
>=20
> Tested using the MAX7357.
>=20
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>

Applied to for-next, thanks!


--fyHrRlVQjHV3Dqqi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTmdu0ACgkQFA3kzBSg
KbZ3Kw//dDD3DIEV2jrCj8Qq5j2ByBaa43gEkg2Db4QIPb3bsXqC1PA/Ns/QmOp4
2Q8PJ0xqqtgwSqm7uxbT/MWQM0dsgbOcC7s4Wqs6aYbA5aKBMN4EaACi/e1NxJUF
bgCLwupfdOSIiRhRObF1dBAFA+cSfHFTEx3tIYtrWig7dcZ80sPcBFuUSff1eJQ9
ea2FxUiPMQbcckUczFq722ir+iOn1NLXxrFKFkbl51B859d+E9dCICfbac6t8sZm
OueG+iF1QT4O9h2Bi3uAiezxN6o0V99hWcmYXdLGJY5PJU57ERpuOCq6jLba4Jq3
hqjHEGlI1m/6zrLrrOmvuHA/Tn9023w1HI2n5brPnYJDqDFu5VFrvzXADD9ySMm+
FvmjegD3BOWCER/dmNCd2X6hAFGntU9TL8MElMymPnOfIJT3nzAMfYk/woDo4dSv
sUMfRP2pAzHPLt791Op/ZbffmvhaGnRshQwA1d0SfaTsuBX/reBJzrfUdr3yqwuH
OVTe9WGqaRNjsVKd04+p5h1QEDc1HRfdBk2HYmlfiKq7BM3WOszJdMDVUm2dSBDH
FRAMvyqNzL9/U1ePuuSH2ODTk3xvUFzRdS0QXrF4T1M4UFfqwOEChHCwH1TprDWN
SQepICrW0AXuNB26EwJXZlUvqRwJNcI/zzZivrTRoXSYixO/GE0=
=GoVi
-----END PGP SIGNATURE-----

--fyHrRlVQjHV3Dqqi--
