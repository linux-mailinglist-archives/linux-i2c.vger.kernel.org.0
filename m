Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC3C548ADAD
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jan 2022 13:35:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239999AbiAKMfu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Jan 2022 07:35:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238836AbiAKMfu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 Jan 2022 07:35:50 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A17AC06173F;
        Tue, 11 Jan 2022 04:35:50 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 21C76B81A40;
        Tue, 11 Jan 2022 12:35:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3358EC36AE3;
        Tue, 11 Jan 2022 12:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641904547;
        bh=GO/szbmELDFw8N+MgQtTrbzGUFSfmQgPaTGmU3ddDWw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CWvg4Z/dFVxcWVUAFZdNOF87HhOCbVfGObLbvjPmDdjOSAQxn/LtxHQaQqfuMy6dR
         zxrPHYtqD0T53XO/0gNJH35TnuxrmmhNxma/edFcKpDMA+ythaX6SuE6Nh8JbNxzGO
         9LlI6cx1w2NNg3Uh4HoxxOKW023Ul/nCh1Jyg3HGIeMP06JoFX6tScvf9QhA63xCTh
         v58qp7hPWwkdDec1aCYGiuV9dJ+sZmpz4So4Iw/QW186UoVZl6U8ZLYB3bSofG5Dz8
         6O9Ad2X24e5CzvvakJELoHrXBdGsS9eYq1M3x6eH9pV9nVhgV7HMAZPJ5aC9QESVvh
         TQkfky/4N/TMg==
Date:   Tue, 11 Jan 2022 13:35:40 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Miroslav =?utf-8?Q?Bend=C3=ADk?= <miroslav.bendik@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        Mario Limonciello <superm1@gmail.com>,
        Andrew Duggan <aduggan@synaptics.com>
Subject: Re: Wrong piix4_smbus address / slow trackpoint on Thinkpad P14s gen
 2 (AMD)
Message-ID: <Yd15nIpHgnkRTp64@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Miroslav =?utf-8?Q?Bend=C3=ADk?= <miroslav.bendik@gmail.com>,
        linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        Mario Limonciello <superm1@gmail.com>,
        Andrew Duggan <aduggan@synaptics.com>
References: <CAPoEpV0ZSidL6aMXvB6LN1uS-3CUHS4ggT8RwFgmkzzCiYJ-XQ@mail.gmail.com>
 <5fc2c68d-a9df-402a-58b5-fdd531f86b55@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+HdZKm6gajalGUaA"
Content-Disposition: inline
In-Reply-To: <5fc2c68d-a9df-402a-58b5-fdd531f86b55@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--+HdZKm6gajalGUaA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Summary of synaptics_intertouch problem on Thinkpad with Ryzen 5850U:

A pity the threads are a bit mixed, but some more information about
previous attempts can be found in this thread:

https://lore.kernel.org/r/42c83ec8-bbac-85e2-9ab5-87e59a679f95@redhat.com

> Problem with wrong base address is fixed using this patch:
> https://lore.kernel.org/all/20210715221828.244536-1-Terry.Bowman@amd.com/

This patch is under discussion again.


--+HdZKm6gajalGUaA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHdeZgACgkQFA3kzBSg
KbZlJA/+KBw0X+sTXV37AMv9K6E6qnSsZyh9YaY5zXauioOl8/OdoVwXG8HUP/S5
h4eEOoJUX1vnFt8ZOietm9dd7wREf5EIuTjAX1Zi8UGe5kl5+IR7vb9JwWagbQ6o
J3tvnND3e+1wSNPadhgzUe0QOrdnskkOBvTlWdzCbVgUCWVwDGHrdT+NS7xcKd3u
H1nggc5TkPOceZd/kT/ihn0gfI//P/t+QuoHRVNx6GECaULwoNDjt5v9eg1ziFN4
KJciA8GUg5/W2dJfC4R+52z3nP1r1T3+yiXZHcuRo2IBnTEfDbwQF9Gs6SJ8b4BO
MpBzekCX0JtxRUEqGcimde1sFqxp3QO26cB0Nm6i8zBa5L8K/YyIknixjlMCRX5W
vLz6a2Ccno7jg3RfhL4kftzI8SxmlxypuOjb1GcDrCAziiq2uhqCV8qXVjy0wecZ
mPB0b2VDYDLI82isqWr8vjWrB4PlahDvC1MFxthuNl6dWM9Q1ykzBC0JAn8Zi05X
BO5vRlwgobWSwx+147JzkpepxPpe1N3aQCFFJx1gxjUEvQxqd9m1IUvNTGJl1TiK
Q/GEkuKj+xTT0e10geAK5qTJM/+A4gcnKun9HBFmZPQw94wti8/T6EVYiKtjZYs6
Ctx9in5gTR0qvvQ2BWrkDXEkKeYVLl9eywhU4k0O3YjBOwwHL6w=
=8o2s
-----END PGP SIGNATURE-----

--+HdZKm6gajalGUaA--
