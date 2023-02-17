Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97FB269B4DE
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Feb 2023 22:40:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbjBQVkZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Feb 2023 16:40:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjBQVkY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Feb 2023 16:40:24 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AD4E604CA
        for <linux-i2c@vger.kernel.org>; Fri, 17 Feb 2023 13:40:24 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BF86B6202A
        for <linux-i2c@vger.kernel.org>; Fri, 17 Feb 2023 21:40:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F859C433D2;
        Fri, 17 Feb 2023 21:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676670023;
        bh=YWA7RyNbFbKJH4a9TxmahW73lcaTGhCDcsVHysy2dOs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=A/jBOASStAI3Eh8JLIKpUco9OjeFVFwg6AOw30857eK/DiLceVmPx9ds5SSdYOECf
         G/jsFM7dQw0aSRsWCtwqAbaqdfEH/FcmA7yu8rs2f3n4nTxcGk4KhiIsFePYeYKZnw
         Le7WecXIKalxIRdGNEAcnjMhGtB5DtUyvJU/A1t99sUxgfOM4gRTW4yajSOhExUbZB
         7sqWuT3A20VwwAUZ8vAFFxa4TKIW+IuG3kCNltg/DFgrNyBwnnVJHoOnMmsT7NCI4r
         zUNVLOpV6/nkzwPMqdLoPM8H1tZ+FWX1pXHZVnr+oMox4crYGaRl99i8MsU4VqG4kA
         RXsftAgLXeLbQ==
Date:   Fri, 17 Feb 2023 22:40:19 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v3 1/6] i2c: i801: Add i801_simple_transaction(),
 complementing i801_block_transaction()
Message-ID: <Y+/tzUBPzZB/+3Sh@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>
References: <20230216170830.206f0bb9@endymion.delvare>
 <20230216171030.176905a0@endymion.delvare>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZeG34/7uJ/XvwBG6"
Content-Disposition: inline
In-Reply-To: <20230216171030.176905a0@endymion.delvare>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ZeG34/7uJ/XvwBG6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 16, 2023 at 05:10:30PM +0100, Jean Delvare wrote:
> From: Heiner Kallweit <hkallweit1@gmail.com>
>=20
> Factor out non-block pre/post processing to a new function
> i801_simple_transaction(), complementing existing function
> i801_block_transaction(). This makes i801_access() better readable.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> Reviewed-by: Jean Delvare <jdelvare@suse.de>

Applied to for-next, thanks!


--ZeG34/7uJ/XvwBG6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPv9EMACgkQFA3kzBSg
KbZqrg/+O5fi5LrGcpNjR22AKFfK04kTcE3uHqNrSKGw6/HHouU8XclgF2fJ16El
C5mODtR1xRHxanKlCsdHkUw6v7ZWwhVh/R6Kfalls9XBGakK8E66Ooqpo28G5Vah
iBYQ3illeBKyiVUL4Hr2eOjx7HCYrLtQUNSFIC7yPUyYtZj4UmkSG0IfJbsDCT+t
RjNV2OCqSP9bj2v5uJeF3K032TexPwjIvw6+Pym59BfgX9lJekv6AUieBwPyj6i0
jLPurOTkaSzQN7QzXGMvjwl+QkhxKEqyIAsdjPcNw7/yq9Sw5X6hNIHFODyPglWl
X9JLo830clJOqRrbDoLpRu07eS7zodlD19TwYb2nt+VzfZ+jf+ZHbCELmf+c5F4q
nT2eTSpHk8B7b7qA4cjNcHGqdGIHiHvme46ooY/Z0yn50wY2IWiZFjftPZwXEzav
g8sfjB8cF75AQgW01eIBk8xtEx+fMFo/YCOdM9FhV6hJDWG7qQ2sTEQTYZh+87ex
ilye9SqNicfXElcPDfjvgUMJGJh00tPMVjNEEFDHlXH86uUGJuPyVYorwMtUr1My
48mx2UH+NZAkMeNFNkgfZTCHOJX3M5d0EdYntlAcus/5ULAKRXr0VKd2dB3wjD+7
MJ1t2ZUquqzRj+ZvjhkRMix5OMGIShBl04H5lJXZGPgrAttcyLE=
=pTpB
-----END PGP SIGNATURE-----

--ZeG34/7uJ/XvwBG6--
