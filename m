Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C39C96F27C5
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Apr 2023 07:52:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231730AbjD3Fwn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Apr 2023 01:52:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbjD3Fwm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 30 Apr 2023 01:52:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03096199F;
        Sat, 29 Apr 2023 22:52:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8870860EDE;
        Sun, 30 Apr 2023 05:52:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80F46C433EF;
        Sun, 30 Apr 2023 05:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682833960;
        bh=PMlnQiVYB4113XidIzefJsbcXRdXVcE260NK61WHuS0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Hms2rY6Mhwb3fka21wkcs6bk4XsC4buqMFUhR0Qu+NHJQ365Zk/eowbfVp9vl68OS
         JGQ/ls6J6kxEjXQ5p88W3uxsjVToojahIwoIflHtVsZRBWQ/89YgLhWpT3WtlG4JF+
         alkLNNySHB+7vOPazueuZ8iso8s1OAWcJUvLpgWLxZliEqiizFj6DqopmIQkv50ciM
         q5bsMuQvAFjBcYF12Smhzcarw28bxGyqJcBtpuwQz41jcMrZ7OE/FN0keb93/3PGCI
         JLRVNpt2bKWAgWR90+gumpnvNKBxlzvy7avc4F0MZjR/ucI9O1M6LMBJgT6f+y8Wb/
         LWe4VnOgZKwww==
Date:   Sun, 30 Apr 2023 07:52:37 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Reid Tonking <reidt@ti.com>
Cc:     tony@atomide.com, aaro.koskinen@iki.fi, jmkrzyszt@gmail.com,
        vigneshr@ti.com, linux-omap@vger.kernel.org,
        linux-i2c@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] i2c: omap: Fix standard mode false ACK readings
Message-ID: <ZE4CJRqaRcAlmzs5@sai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Reid Tonking <reidt@ti.com>, tony@atomide.com, aaro.koskinen@iki.fi,
        jmkrzyszt@gmail.com, vigneshr@ti.com, linux-omap@vger.kernel.org,
        linux-i2c@vger.kernel.org, stable@vger.kernel.org
References: <20230426194956.689756-1-reidt@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="JnTPZRscbTs8iG12"
Content-Disposition: inline
In-Reply-To: <20230426194956.689756-1-reidt@ti.com>
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--JnTPZRscbTs8iG12
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 26, 2023 at 02:49:56PM -0500, Reid Tonking wrote:
> Using standard mode, rare false ACK responses were appearing with
> i2cdetect tool. This was happening due to NACK interrupt triggering
> ISR thread before register access interrupt was ready. Removing the
> NACK interrupt's ability to trigger ISR thread lets register access
> ready interrupt do this instead.
>=20
> Cc: <stable@vger.kernel.org> # v3.7+
> Fixes: 3b2f8f82dad7 ("i2c: omap: switch to threaded IRQ support")
> Signed-off-by: Reid Tonking <reidt@ti.com>

Applied to for-current, thanks!


--JnTPZRscbTs8iG12
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmROAiUACgkQFA3kzBSg
KbbVwRAAn2yZcKdi9prUx+4PLnkSU1QCdT4oFUFlXf4Zx9f7G9GzyOC6lu3BJ3d5
V5BRoWCU1PHbfFBxOPhiUGG44pqGKgLCrkt5P0yuPV8gUp8MOpDpv4lLdYDrkkzd
OxFEtgnheNs3fRMk1aqBfThVFCKxRAoGEgyKhKddw0c04Z82jLwbRDX/Rsmx+uCf
iA8FG3+VC5+mZLorsEYLfQgCs7fCpwntpo1CTyMUJcEr+jJYoDSkd7MGcRufeF/Z
VKC0suJsfO3QNMhe+3FlAhsRd2pMayuLHVHJ4NxFRq2D6+i9R5f641rifgUi6r9H
cD4br7D6hdqRxZOVNgN8xe8a1sxKWdgyaQwhU32hvovdDiHOGs29XG/E/Y/s7sTE
wEJkoIv/l6j8NC7XrYCxwRO+FCasM+JIDe4HSzvIvVkYeoskVgWhv1AJSWRHwK/U
TYG2Kb/93AOe/+88m2t5dQVKplzCXHQEPsqgAlNvrJCCKlkZFaErkXKK7X679ZjZ
iDeU5wqtjqjhUX6xtwKiYm7byQoHCgLHfVnUeY+ENZx9Ah6IXw0PE50aDBFFlmQJ
AZwvs21eeVJSzhpB5md9MdKFK1UIQJUVWCLanLRlxX5CTX9q1hlac66qK90LjaAA
zmkz/9JZ4EAhJbQwFiatsgcRai4UXFKmEEugu380nrU7+t+zImE=
=GVYx
-----END PGP SIGNATURE-----

--JnTPZRscbTs8iG12--
