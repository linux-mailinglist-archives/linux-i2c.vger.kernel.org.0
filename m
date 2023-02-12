Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E574C693A25
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Feb 2023 22:07:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229696AbjBLVHS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 12 Feb 2023 16:07:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbjBLVHR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 12 Feb 2023 16:07:17 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D97E1AB;
        Sun, 12 Feb 2023 13:07:17 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D8F8160DE2;
        Sun, 12 Feb 2023 21:07:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2244C433EF;
        Sun, 12 Feb 2023 21:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676236036;
        bh=7SVdiHNv8+lwAj+uOvgm8qR+PM7AsCeos5m9byo+F8E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H7P+J4oh4e59nuw5uocf2dU/8hrqY1Koh01Vm4cU51xldaR1r7WSn+j6L8rAjsD96
         /0hRTtQ4BfxBiJiamKMyMjxTbB+MwMVF5v7eo+wcQYDsriy9C+W6AXOj2s0j85Ay/Y
         g7SUs9UBIVvzIOEAysdodhm43KOndsyVjMSI6OEDh4A3vZ1eIU6p7nwfps1XrwqASi
         VWqyMEhfjYk7X9D/9ezdx28+YUyyTcVNI/RJtUhLfeKgm1Nshp/mZ29ZgBm34/vR9u
         AkNc9pQFnuGZ9WvZIBfg2NmNNLZUAaRbLaknPlqzKevypERACtM8V18FUQwi0+jQHP
         rLTvLxmmQFGJg==
Date:   Sun, 12 Feb 2023 22:07:12 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Alain Volmat <avolmat@me.com>
Cc:     Patrice Chotard <patrice.chotard@foss.st.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: st: use pm_sleep_ptr to avoid ifdef CONFIG_PM_SLEEP
Message-ID: <Y+lVANYNHSKyYWvs@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Alain Volmat <avolmat@me.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230206210324.65508-1-avolmat@me.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LAvzffcCjsK+nl2l"
Content-Disposition: inline
In-Reply-To: <20230206210324.65508-1-avolmat@me.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--LAvzffcCjsK+nl2l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 06, 2023 at 10:03:23PM +0100, Alain Volmat wrote:
> Rely on pm_sleep_ptr when setting the pm ops and get rid
> of the ifdef CONFIG_PM_SLEEP around suspend/resume functions.
>=20
> Signed-off-by: Alain Volmat <avolmat@me.com>

Applied to for-next, thanks!


--LAvzffcCjsK+nl2l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPpVQAACgkQFA3kzBSg
KbYCrw//e1a37vkRViTFQ1bMTElnLdIXjicbfAT5y5iVknvN8EV/HxTOeEeQpu5x
76f9afCOOAh9dQh8LRrXy1JbBxb66jtweiLtPA4zDAuInqiHjig5ogHvx927ShR8
E09yd9XqGslHIvYtJPa2y7wBgHkcFRCgZLvbod3Bo2ocVQFRPAiPSY5l1ItgFkoY
/3W2q3B01MXUjyW1mz0BgjP03sOw/iHJ3NX7HyEjHZy/2wZ0QXswg1R4wrn1vFeO
vNApVjr4zRU7K17t+d+2KlZ3Twrm0s8kb74QPxESvOJQjMFFNNxQrS2N4p41ohaK
aGcJs0DemIFsSXdrvKIqpul3ZW8QnofmFu462o6g7Szg9dZO44WWu5/xbvGCOtnr
r70cQfRB2AGhDx/rJNT9iig2hqsC8cOnVoghL7SY1LGvqqckkEtgiFEnJ9ifF3fF
Mp3qh1bC/gJOXWPxvMvHrAYYxSpDMHoFYBhkC/MbQzkr9Q1LCcFGut7gJdf/DkHk
OjMYymlK3d/0WE4xQ64ohcYNTUguz/PqAgJDii99+UaKNXHpiJSDMocw1XK3fxy2
a2Gu5PciTGgvTe55/MEAwvb33nChj05K7hU1qaw9C9wH8pz+VrONnmKVWWaoqnJ6
jj44dK6qBL0NCrBn6nngxdzjrvOoKyVJaKzRKUne0RiLm4x9hg0=
=TT5S
-----END PGP SIGNATURE-----

--LAvzffcCjsK+nl2l--
