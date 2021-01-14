Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86A022F6B8E
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Jan 2021 20:55:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729023AbhANTyO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Jan 2021 14:54:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:35806 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728474AbhANTyO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 14 Jan 2021 14:54:14 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id CD9F323434;
        Thu, 14 Jan 2021 19:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610654013;
        bh=QAcJoaNexFGtpsK+E5UfZdcoKGp5+72FmTd9CfwI/PI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZDAZuJIfZtt6e8YKMNSUbiBid1AjVH95afv4rZYvBXRBUbb50M/zi+L5cQEceMxdx
         e8cwoDb5RNj+tJhv/oq1FjrfyJZ0oilGXXIxLnVp7XJB36qChbMmtf1sXphpYxSMkS
         pho+XJn5CMAU35xWdq3ASOdP/R+D9zbPHSoDu1eCvuFKaE8PaTUnYiOdTgq1Gezpvt
         utOQHPolukFpu0QFarnw1KowOHXe9ybbrHwOisuPylTocqlwo2FeLoPSVvWcZEmaqW
         0EQFkOJcP4RgTOWKdNFOrxB0rhgKdQ3DuA200j+Nrrc648BNo0u7b+lLVRfhA0pVXu
         ev6geUPTPepiQ==
Date:   Thu, 14 Jan 2021 20:53:30 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Evan Green <evgreen@chromium.org>, Peter Rosin <peda@axentia.se>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [RESEND PATCH v3 2/2] i2c: i2c-mux-gpio: Enable this driver in
 ACPI land
Message-ID: <20210114195330.GA16693@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Evan Green <evgreen@chromium.org>, Peter Rosin <peda@axentia.se>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20201118234025.376412-1-evgreen@chromium.org>
 <20201118153951.RESEND.v3.2.Idef164c23d326f5e5edecfc5d3eb2a68fcf18be1@changeid>
 <CAHp75VdtwyCj7emc7Bk87q7kMQA0sSX81-aK-fMq4qTfTF-c_g@mail.gmail.com>
 <CAE=gft4OW7_pWfco4+kY65tbUGUDzXXDfsVMCP8MN93inVem4A@mail.gmail.com>
 <20210105102505.GG2000@ninjato>
 <CAE=gft42nQECU9Sn9yC-o8+VE9EDoRgLmqVR0Uwma+vBTiEh-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="k+w/mQv8wyuph6w0"
Content-Disposition: inline
In-Reply-To: <CAE=gft42nQECU9Sn9yC-o8+VE9EDoRgLmqVR0Uwma+vBTiEh-Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> Can this be accepted as-is, or should I resend?

Peter, can you have a look here as well?


--k+w/mQv8wyuph6w0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAAoTUACgkQFA3kzBSg
Kbblng//anh30fEErHflSTsYgu7x0KVirh/l8S6kCSGmgQ8NK/6pGl5ObEUOnyRV
7hh7DZxkrYagROyxb0UzKr8dc7+rT3Z00vZORrxHFAT3DfLSaKwXhgejSNBr3DGW
prFyynxQZZXEdOvEWyaRYODDpdR8B0eGW4sVvy2lJTUdeEl2BZkiTaV1cRMIG+qK
TpkaQywaXpOD6qLv86Tmt/jAKYyhulSjGINyBfu20Ivf6rZmBXblqSrvK+RClASx
rDiiluow2psKlU9DGCHYG0xoQ6QScG9OK0bHGcGB4UpQnHsmX9g3h9cVW/EpNurK
HIxN28oKoZLMYSItTlpZZ07s4nR6JutQOKRPx2n9Vh6SXnOaH+XulDFMVCa9c6Nt
dh6KWzmdCcdtjVFgVI3Hbw13BA/4MZJeYtDzTQYSzPFX66xydpLVW3YbgxyUUaMU
aUzSH8IgS5B23DpUaC7FSj0MOEKzWIYm3eF6YDKN+x7kq5QrSCkijOon2uFE1FzF
nzfE+X5SToDfZm9AN6vcJE2ytOuWf8USLxFaOyAGLwxjB/oe2CKtky00Tb5xM+TP
G9t+vz/IEqVzz2TUnphSS8ZytWLmUJtYxipKtez83OwBlj1cj8tqf2XYaep0alBA
8lyxSphEd/ke3LWYCK33I45BL+0NezaiJYIXZSB4Z7dx+rS8XYA=
=mq6m
-----END PGP SIGNATURE-----

--k+w/mQv8wyuph6w0--
