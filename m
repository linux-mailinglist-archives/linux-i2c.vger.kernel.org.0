Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F28F551DB01
	for <lists+linux-i2c@lfdr.de>; Fri,  6 May 2022 16:45:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442441AbiEFOtS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 May 2022 10:49:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442386AbiEFOtH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 May 2022 10:49:07 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E671312AFF
        for <linux-i2c@vger.kernel.org>; Fri,  6 May 2022 07:45:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A589CB8358E
        for <linux-i2c@vger.kernel.org>; Fri,  6 May 2022 14:45:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A6B7C385A9;
        Fri,  6 May 2022 14:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651848321;
        bh=8GT1Ws5ZkAKhpHOrBAoFnmQT/pBGLsDQXzA94aqdYs4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gMPHIVavU3KY7liNMfEUHAoqsO46lh9FU3wYk3Y5I8esik7cjAAVeJ+2VZaoKuMN3
         VAvuQr3jLdLYqvprNKlmgbR4dB6HaI1Ny8luXi7C42H5cCMfxInnkMXVAjaObjXRy2
         3Roz850P1c1exzoNOgYz9XrmFEXyC6J/nB8WeCyessTucO8AbBkCZ3NK2k3U+rHHyj
         w9aKGOPO5djjg0X5A6vNn8KD1ElGd5fyA8wa3v/z/7kJLE6cPIWZUMvJ4KnnueRgvu
         DUSsHmG5OdvOGhJFjR+cXyFpAxHL9DYi4wJwH2emKn5f+HbYGuW4vj/jNR3k7Tonwn
         s+60kemd6fatQ==
Date:   Fri, 6 May 2022 16:45:17 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 1/2] i2c-tools: Use getopt
Message-ID: <YnU0fTi+Pa91sNyJ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>
References: <20220506160652.61d61aa6@endymion.delvare>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="m7/0Ts1B/KoasLLy"
Content-Disposition: inline
In-Reply-To: <20220506160652.61d61aa6@endymion.delvare>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--m7/0Ts1B/KoasLLy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


>  tools/i2cdetect.c |   23 ++++++++++-------------
>  tools/i2cdump.c   |   49 +++++++++++++++++++++++--------------------------
>  tools/i2cget.c    |   31 ++++++++++++++-----------------
>  tools/i2cset.c    |   45 +++++++++++++++++++--------------------------

Yeah, useful change for sure! Any chance to tackle i2ctransfer as well
while you are at it?


--m7/0Ts1B/KoasLLy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJ1NHkACgkQFA3kzBSg
KbZcfg/9EXtKiXV/2gwDAwVqdzMURqKif2Q3FY+k8/EzGI9kR1YS2w9XsnIRnwhS
VP57ml2SBa7RMyZV/Q9XgZ0Ut/fzLw5AC2wBKLtKAXAGpWFFc/RJ+jDTbM/EZA6A
Rl/6KJq5tG6JHKQolW9jBkYKZTxthQ4Xwe/Iz6g/7tLuP4fCPZW8iGlV9IkvBRfW
xH5uP+M3NxFUOpR9KJk1qvpbeaR0xewWp22nJFP1RmN+ttz2LKiTScTJ0OmeHWua
KyGECVbLBJkb8eAXaQjI7AE/Oo+FIloO8kKeVRCNe3GkOcQ0QyVl7GD0O9NUogbE
Jnsbl5qR6HW60uo3hknd4onjZTkWlCPDaislnDMSHKbvT3LKSn311a3vtCkniX5R
qaTjCEFM4hOVPALWxK4NJgytz96uWTJBAE/lZ/X8I80y/D2LAtfewsA5/9pMkgAf
thhYUFPyXLFUgIBj+PdF0i7kXoQTFRtigulWzkXQTgQAy7mq+CQe8fmkQ7+Fy6zN
e2up9zKEP0G4bDCyAqxcBjbzA+1sNLdunDZ8AhZNET47LbCOrsKR3xL6tySidM73
AXC7IV/eGNQaME8znd8n5Ogl+ZwqfBlh4FRCqjN6fZ2/qCMlNh0rf7sYtbhmMu6v
TV+9sAbOl0rnB0mAdY03QYaYjHq/DLYY/SQPp17K7Cf8mZusR00=
=9p6D
-----END PGP SIGNATURE-----

--m7/0Ts1B/KoasLLy--
