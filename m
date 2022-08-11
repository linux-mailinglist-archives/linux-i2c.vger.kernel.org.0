Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09C9B5907FE
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Aug 2022 23:23:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236171AbiHKVXU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Aug 2022 17:23:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235762AbiHKVXT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Aug 2022 17:23:19 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADFB29C238;
        Thu, 11 Aug 2022 14:23:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6D202B822A1;
        Thu, 11 Aug 2022 21:23:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 593F0C433C1;
        Thu, 11 Aug 2022 21:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660252996;
        bh=u8kZRYE/w+MJF0q0wRQA8iUI96Wq7HTWYiGRq8vXua4=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=lLerq+wCtiguJz5nhf405qO8WaKfBtaTO7ryIDMBsyIPGU8FOCC/TgLEAq7CWMyEo
         T4KvKRjTLcmOMVkBbbUT+IRaht7ZMLQmKFySYAhJG3EK6VQDT0YhEtwyXfTL9kgSd9
         RnfkQlqgqNrDZ/o7oDCXtn/YY/MOAX/tnmMrphi6r2URlknL4ilNQvyHmQhhE9sH+Z
         N26NWxmYgY9js3E6Ul1yS4TcJL+BrTKHSUNK0QOkLgA+O3wYqH6+lg3vTorLpDo6Qe
         bOxKRt8PQPqb0OaD3/tj8srwoMWb2r6jdom7WJ3oXXMKP7YMMkqxPiqUHTpxH8d725
         d0xGUSRpK6hHQ==
Date:   Thu, 11 Aug 2022 23:23:12 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     luca.ceresoli@bootlin.com, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/9] docs: i2c: i2c-sysfs: improve wording
Message-ID: <YvVzQMvjb89kiNLZ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, luca.ceresoli@bootlin.com,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
References: <20220808141708.1021103-1-luca.ceresoli@bootlin.com>
 <20220808141708.1021103-9-luca.ceresoli@bootlin.com>
 <YvVxE9jLNJZ0NWtd@shikoro>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hKPG94ov7AJuX9tk"
Content-Disposition: inline
In-Reply-To: <YvVxE9jLNJZ0NWtd@shikoro>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--hKPG94ov7AJuX9tk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Does 'confusion' have a plural? I think singular is better here.

I took the liberty to fix it myself so we can have the patch in rc1
already. I hope this is fine with you.


--hKPG94ov7AJuX9tk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmL1c0AACgkQFA3kzBSg
KbZPKQ//UXkuKxHiZKIjpk6IhAwUNBc5fVouE1R11xxr9pmGKerDGPuVQY+r/sBL
3kdhO0mNVmmo0GxEDrqL+wHxobk0Nm7q8j01vgSFuJKFAqc2trsMUNlnLTWl3se8
hXkok2FqiKaN3MLBv+33upg1Q68BWhJI1EH2LBm8LXoLu9N+JuLXGpAY0SE7IDZH
kH93E/Z5LIHnDdbU9Bx/NjcVRt/3o1Yhmuh0w5sj3ANks+h+vRbJ/5O9uWckOmh9
zV5EoKJwNXb/o+FJi4Ul6CpPu6yFiMhEj8JcKdiFvhJTlPBGBI/JrELTiidJZ/3z
KJ6wTyAdp1KnPWJLT1Oz//4xIr6mrTexZO2i1o0nzGtYW/6VP73K6JbKqPVs+weL
rKC+/BIfJqC6teqg2HGSpDlIhDVsvx/SXDDN83cY7MDyXr6G/GzaXZcH7HTvQvZg
HCCLrkpTxbFrK3ZwIpm8XFMklXg3Aa9EWNoaWShrZm1umYo10hu3wsd0x875kL+V
a/lpvz/mNRZbwAvuAjSMoq+PEyLaCdMjaQlIGKNvR0iWklWP9UEBF2dw4C3aYpEy
Nshl9/rGHItXs92oiQtZeY2Tt1ZbbZHiKVJI+hMOmZE+CO86DxmykVjP+uOyZJQ2
z6RneF7UGkn07hte6lQUra8IsMyPPP8IxS9DT5C3fBP9SFZAM/k=
=3/a0
-----END PGP SIGNATURE-----

--hKPG94ov7AJuX9tk--
