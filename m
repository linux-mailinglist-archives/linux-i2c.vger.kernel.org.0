Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02B59459F98
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Nov 2021 10:55:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234660AbhKWJ6r (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Nov 2021 04:58:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:35324 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234586AbhKWJ6r (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 23 Nov 2021 04:58:47 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A2D936102A;
        Tue, 23 Nov 2021 09:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637661339;
        bh=+tTbMqdp9bphFdpPEdZGDL5DJ5WACwaBAztcNSup48E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pHtA17IyA4/3EXR39rUX5vn6pXOurmzCtqyieIhR8XBIGr6vucwiaclWUJvxZob/M
         xfAfUy+6AtuxfYtVR9yY1NxeUsTRx9Dkin5dBc5NCWM7AkbPxOo1Z+hDtrcizSl/iG
         ybf1PW3w0XMaggG+OT/ur++oFt9FpHahWuPFnndu4Wl4uYHDMIxsQT2TkLWhVPmSXt
         ZFGy+GDk1MfI8kZS8DHgtQIYSjaaRoyBhdSUeVVCqlmi68uPLZbfyy23vZk9OCZju9
         ARm9Zcoy5twBM7/3Bb2aWB+M5n/OlV9+XfSwqRTWqfOn1hXutrQrB+Gz4NT53JInim
         mpUYpdoajjH6Q==
Date:   Tue, 23 Nov 2021 10:55:35 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Vincent Whitchurch <vincent.whitchurch@axis.com>,
        jie.deng@intel.com, conghui.chen@intel.com, mst@redhat.com,
        virtualization@lists.linux-foundation.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@axis.com
Subject: Re: [PATCH v2 1/2] i2c: virtio: disable timeout handling
Message-ID: <YZy6l9fVxsslgm3S@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        jie.deng@intel.com, conghui.chen@intel.com, mst@redhat.com,
        virtualization@lists.linux-foundation.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@axis.com
References: <20211111160412.11980-1-vincent.whitchurch@axis.com>
 <20211111160412.11980-2-vincent.whitchurch@axis.com>
 <YZy5xVU4XHEaz+EL@kunai>
 <20211123095428.ke63esylaldgrfus@vireshk-i7>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="RkaydGM8SG+O3hEZ"
Content-Disposition: inline
In-Reply-To: <20211123095428.ke63esylaldgrfus@vireshk-i7>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--RkaydGM8SG+O3hEZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Thanks, I completely forgot replying to the last email from Vincent.

His reasoning was convincing me :)

> Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>

Thanks, I added it.


--RkaydGM8SG+O3hEZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGcupcACgkQFA3kzBSg
KbZhZw//aKcVKzQnp1BSB6XMRxa0f0PFlqLmMwlqAmC2dl5qfvUDJKSpnIqJ4vmh
2wHcA8o8CP9UbVv2gHSFO1bgBdYd1p134PnaULosb8qPRTUUW8G9w3HaufOP4iel
75QUTuue77JCt7aQgnZh7Ac237zXOuo5FLieY4WNqodW31lEoihHoC1URWUJ5eGt
xO0wTelJfkVJ8NEdPKpNkjjqYfaFH/6EqP8cRozucbOHPye19B0RGK19FhFnkIB7
Zv+BJCO9j6BtwKT6eVVI1h3+aiOTin5j3lfna4yqtvabzODg6LusCEXufnp3PFIq
jhNPMcfMi/X9zon4tbLjVyE9FNLTGqNP+GlPFrsaOwJdUlIU3ZV15oBK337CeMPN
EaqWOnKz39QG/HxrESxaVzv7txZuKXDtpZlc4mniUAVb6le7Wy4MHkaXgY1UCfMV
dN4G3ADUuAzcgrOD4FcVWwiBIkkpyAEdVaXD9rH/KJCYrlIFMKNtJfWp/ooR4Wzn
c/gkBfwPFJGY7qmAFyVc2xoXvZRJNKvmY36oMguLHkf6A8DeBTEIvU8wnAE+zkzU
BSJydEYO4tOn5O9pvXVWrd/7WjYKsix6lk0ah8HSvmGO7SpiluK3VrBcYFjFYeD7
57AEcNg+kTtHkWdw5f+V68nKpSZIqJ2d96OWvlA788sNrjHERKU=
=VRCy
-----END PGP SIGNATURE-----

--RkaydGM8SG+O3hEZ--
