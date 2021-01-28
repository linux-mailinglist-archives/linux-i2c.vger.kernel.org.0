Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEDFD3074E7
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Jan 2021 12:36:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbhA1Leh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Jan 2021 06:34:37 -0500
Received: from www.zeus03.de ([194.117.254.33]:37386 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229732AbhA1Lef (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 28 Jan 2021 06:34:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=4nkTSdX8buaWv7lbqgJ40NcnkFhn
        gDq+Zq/RII6X8Kk=; b=FTjz0NmVSV5diIDhFRu6lYsbxtj+ynwAUZfE+PFdRafl
        RNQn90ClIjslDmhHNMFVvgDgyDyrVGAKJXtGNaH+liacXkLFPy6YEK+gP1sNVFR5
        5XTQ4hTmfC130A2O4gheF6bH6ko3LyKw9zi/G//wk/GaBohK2qioX7iOziHU6MU=
Received: (qmail 213322 invoked from network); 28 Jan 2021 12:33:54 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Jan 2021 12:33:54 +0100
X-UD-Smtp-Session: l3s3148p1@k1cuQ/S5YJcgAwDPXyX1AEdA8SGgn5QT
Date:   Thu, 28 Jan 2021 12:33:53 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: eeprom: at24: Document ROHM BR24G01
Message-ID: <20210128113353.GN963@ninjato>
References: <20210128111343.2295888-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="K4LMwn8CgX2KMboP"
Content-Disposition: inline
In-Reply-To: <20210128111343.2295888-1-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--K4LMwn8CgX2KMboP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 28, 2021 at 12:13:43PM +0100, Geert Uytterhoeven wrote:
> Document the compatible value for the ROHM Semiconductor BR24G01 I2C bus
> EEPROM.

What is the difference between those two? Could one also be the fallback
of the other (just in the highly unlikely case we need "generic" Rohm
handling somewhen)?


--K4LMwn8CgX2KMboP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmASoR0ACgkQFA3kzBSg
KbZBcg/+IXP5We7pj3OSpMQOfmL8u7yoScPVq83buQF05zrO+dcnr/Pz2kc9zeLQ
Z/2sjMYnP5qVFMXh3PP2RUolFh394o6z762Ny6JKSRnTMy/0eEtiUzHEhdJNz8wt
WJKz3WYrrxneM3wDMB/m9w98K6EkWJQHVBvGddkX896Z1aoDG3hBBSELszSR4+ot
4F2P6LSZSWEFnkTXGJBdC9msU0yW2UqvIHyWmsFTbcFz8XbpHiF0jKW/yuB3Y3Fs
sQ/QiCv+BbNkuMyvHBz/3ddp1KVI7lH0wto67gdfEBHapUN9vjWXb2VONQBG+fzZ
VBDObtW9eajJ0pF1KT0RIDtorZq46p7VqmROVSFHd94oJKEsZRfCwiTM2pxvCzol
j+IPtOVimz7PkMfplANsHRUzWdpFY/BjeRuLVav9otgaEVrqioY/fHgBhUgfrnos
U1B3hPdwJPeBs2gosSGBva9di6P3IRtGPVGGtDVxuRTyfLh/zvNMJxoDyOj+GSst
zZRLbYrJTMD5LcXhQ0nmYkj30AKQUvqS2ubrAEAIq+JpvAwcBLxQp9+fpAB8H79q
y1yjLUYyJ53m+98Ua6cU/QwuYqcZKpOu6ZVxVc1oYkjHidvUw2WLGoh3b3ZrMefb
5+uBQbXclaX7U/4ZDneLn3Hi1BpwH2M8YcjmdQjXpALXI6LRNjw=
=kZc2
-----END PGP SIGNATURE-----

--K4LMwn8CgX2KMboP--
