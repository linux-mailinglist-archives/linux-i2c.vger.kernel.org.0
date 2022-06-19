Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 834BF550A05
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Jun 2022 13:08:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235672AbiFSLIj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 19 Jun 2022 07:08:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236094AbiFSLIc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 19 Jun 2022 07:08:32 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CA07DF59;
        Sun, 19 Jun 2022 04:08:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 52BC2B80D04;
        Sun, 19 Jun 2022 11:08:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CEC8C341C5;
        Sun, 19 Jun 2022 11:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655636909;
        bh=r0eHl5T8qa2L+zG+relhLMONLPxqjmQb6p32ATsNTsM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=u2sbnCBWgF7JGV+1uNb2Hbcc8UgtYTGGvBgkkX2fRluSIzNUbl9pMM7ZPGsQg8egf
         Ae35XFeXjyoqYDVX97lFyxPiCrEY2rUVyqcTorhBaZJPuVyOozJ0+reJ8A5PFcBrCQ
         tVi+D38AY7NG81ZJSa6vkm7JbC+22n3Fuxa4opSPUs5/cQRuesZw/T+SJabxl7d+VN
         jYNshPk5nrV+KKz0vJqOryFjVh8vueuhL0XIhf5Z6KCaTkQ3KOYDGsnXsv68LjQ1ZC
         d//KNv5SaXo2F3hJF60C2DjTI8JxqJXHzJkedGs9ovni+N9EsWH4sC9NjynRCWBPtY
         dWlBA9fL6M4JQ==
Date:   Sun, 19 Jun 2022 13:08:25 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Conor.Dooley@microchip.com
Cc:     lijessen2016@gmail.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, root@laptop-706cegjt.localdomain
Subject: Re: [PATCH] Print some info into ring-buffer during loading
Message-ID: <Yq8DqWEdEEkrAm6H@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, Conor.Dooley@microchip.com,
        lijessen2016@gmail.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, root@laptop-706cegjt.localdomain
References: <20220619083207.749-1-root@LAPTOP-706CEGJT.localdomain>
 <9b94e885-be5f-3548-67ed-d79c6e7c22e0@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+tZoRn68RQG9HbRR"
Content-Disposition: inline
In-Reply-To: <9b94e885-be5f-3548-67ed-d79c6e7c22e0@microchip.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--+tZoRn68RQG9HbRR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Hey Jessen Li/Jason-Lee,
> (I hope one of those is your name, sorry if it isn't - just feels weird
> addressing a username like "root" haha.

I'd think sending this patch out was unintentional?


--+tZoRn68RQG9HbRR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKvA6UACgkQFA3kzBSg
KbZmyA/8CIrpyfD2WhTKsGHX99fCeOrddgRcnmQu2h21G8q35G4Zl+o9gCg7za3N
ZgiO2yPCeVed4cDmEHC8tMx6bVCp9HP7FGs61lfiUf1nBCn/LwXJ0r4B1rvlV6Wn
eHX5IT6LP5yi/G5WvdIrgg7Wtnqtdhyf5Nvl7N1ne+yQn1iGkLzIOFRZvoCjT61k
xIgSVJvV00ElR+pzIADCtyI+r7sOzLqNa033j2M6ttC88ZQvtkulXBpS/CAhX0xz
5zXrk/Ird7fWfKZIYPGVlOtDiXMyKpC5xw2stDDMAuS82gfyZ2RGhU7nSdgeFzq4
DpXGeARuQxa2/EkhBKrJQmYsO1POL0WAa6Bn1W8CwhdLCqVcif7Yo0AohScsFhuT
IC8dCJQ1cpPk/6Xv5Ly/xpzqTRB457w6TQDjx72e43Tdd0QC9f3KRoB0Nk0xQqkz
dojMPptnYB09c80xt/IswcfELHVesgPCnIMi/GGp09JA+0jLpt2uM2h4mwgY7etI
dWS6AbSIylTSmYfWO5PxXrG7qg7nLfj/aPeWn1rSvQTlr/X2g6i4Bqwp+YMo4hzX
2Qyq/GtjyNkSrKSg2EcHeNRf+KusJuKOeDC3rN4Zzvj76lFO4IV1eeaGypxxPwFp
iwvpK/ovkYDtmbqluwZWolft/ZUJsiGI7toRp1QPqwPlzO5TdD8=
=P3Me
-----END PGP SIGNATURE-----

--+tZoRn68RQG9HbRR--
