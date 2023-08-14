Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A533277BDCA
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Aug 2023 18:18:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231332AbjHNQSW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Aug 2023 12:18:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231825AbjHNQRz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Aug 2023 12:17:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 246AC1BD;
        Mon, 14 Aug 2023 09:17:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B5F6B63E1D;
        Mon, 14 Aug 2023 16:17:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BACEC433C7;
        Mon, 14 Aug 2023 16:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692029874;
        bh=R+JfylcDTKNSxp7M/N5Is0OsD+bt7b/rmBp9CTcJ+8c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eZg/p6XyNRoNiYPKWkkVIsZGnn+ehWk42rjMDvLNB1/UGjHN9m3qaazn7q0fookFQ
         7VzjnSZnTvGpth+LAPCeE0710QCQkhtqnP8CAmKLyw3vpoMoeZ0PIcb30FIhUjiDp3
         lMPBquJYsBXaJGL/CwTf6CQOCUpCI2vdEXOc5pE+RuKvdqAlAHOEOdDJycbZBMScfj
         dXQKWDJzL+hQxmn6EF5YOCMXHpavWsD6TeT9K+vHidwuSAR7QdekY7GA8jROd+ez6g
         j/8rvCj4HJ0H3feeTtR9Wq9ttI2KqKRSI9DnGy56eNhv0zImm0s1CNtOG2A9a57C4Q
         0J9iukyqV8c2Q==
Date:   Mon, 14 Aug 2023 18:17:48 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Chengfeng Ye <dg573847474@gmail.com>
Cc:     andi.shyti@kernel.org, rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: bcm-iproc: Fix bcm_iproc_i2c_isr deadlock issue
Message-ID: <ZNpTrFj2RoGhg4T9@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Chengfeng Ye <dg573847474@gmail.com>, andi.shyti@kernel.org,
        rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230707084941.28964-1-dg573847474@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lP44t/20Ow0y+TLX"
Content-Disposition: inline
In-Reply-To: <20230707084941.28964-1-dg573847474@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--lP44t/20Ow0y+TLX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 07, 2023 at 08:49:41AM +0000, Chengfeng Ye wrote:
> iproc_i2c_rd_reg() and iproc_i2c_wr_reg() are called from both
> interrupt context (e.g. bcm_iproc_i2c_isr) and process context
> (e.g. bcm_iproc_i2c_suspend). Therefore, interrupts should be
> disabled to avoid potential deadlock. To prevent this scenario,
> use spin_lock_irqsave().
>=20
> Fixes: 9a1038728037 ("i2c: iproc: add NIC I2C support")
> Signed-off-by: Chengfeng Ye <dg573847474@gmail.com>

Applied to for-current, thanks!


--lP44t/20Ow0y+TLX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTaU6wACgkQFA3kzBSg
KbaNKRAAtQ5yI2RX3kG1g6Nxx6xQk6u0UG8EvKyZsADukUZxn9ccsUZAuP4vjXOQ
RqqwODwaKhGtngnRhqOkbE2rRoNc6NT7YJqLtnWAznDpW2/HMdbDMsmVbybQ7TiL
uL+LLtT1HqhF24pZXo3XJZmFZI9W5/5ez3oGBgH0RhiSb/7znTX/bqHPpQnoYFHP
tk0NJ6HpiUqHYYjT9ogUBH07CfXgUfW1phYyPZICSGjGdK+wzVlsFLWCEXyVNh8E
hilzIQj3uz1PzuLty1VeJQpFhp+PDvtgZzh402iR/vn1wAELsFki/a5qGl5RQq5u
auNzbT8HGLLlAG8Dfcm9wIdJ64OWnfYKE3WIEptaIYwwDQKBoFyzdr63Au2ShupU
m3V+7he7urtUibjWe+ogWmLOVJEbXMOnCBhfsd5Zt/3uu3dqbnRnT5AWynLRuOKd
RmLuiDx4Ahfx8VRbJ+TpmPjckoVdX7xKUN/crkRpFPORtKRRXHGfshwQE9t4amY0
4QqAu/z44qHoWQ8BUb1OkZyxKcpdwMfIu5IbsjqszHYLG9zQztVuu9wuXDFwghtL
uVU4lQ62CjtzU41BeAKDxmlAZqt+3woZzsZwgXPkZVz5IuAh6st8CGizRno/SA+9
lXX0hZfjldqWMiXuG6grd6O80ZobZHq78CngCDXaBYB4FIHKmhM=
=zNjM
-----END PGP SIGNATURE-----

--lP44t/20Ow0y+TLX--
