Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F5672EAEAE
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Jan 2021 16:36:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728038AbhAEPgK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Jan 2021 10:36:10 -0500
Received: from www.zeus03.de ([194.117.254.33]:52888 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725917AbhAEPgK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 5 Jan 2021 10:36:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=XxxNQveMNbIa3vzg1OugDwpjLj9x
        mPwZ7MeTk1cwESg=; b=yTHHETen17P9ugTw2LJCxzX7lh4l37CIMbgtVeviI0KL
        tmRMNV7VJy621W9d6/dnDzX+mGvoGtdOZx/sTMzQ1lodTqAfPj3IagnO8LY4Z50/
        fCG7KN9nXXY10y+j/LMFOdjrYh2KL/SOmgPXWflwm4UAnkZmXBtYNC7k0Sb/NLo=
Received: (qmail 107747 invoked from network); 5 Jan 2021 16:35:28 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Jan 2021 16:35:28 +0100
X-UD-Smtp-Session: l3s3148p1@Rs3G9Ci4HOUgAwDPXyX1AEdA8SGgn5QT
Date:   Tue, 5 Jan 2021 16:35:28 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 2/4] i2c: rcar: optimize cacheline to minimize HW race
 condition
Message-ID: <20210105153528.GD1842@ninjato>
References: <20201223172154.34462-1-wsa+renesas@sang-engineering.com>
 <20201223172154.34462-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ieNMXl1Fr3cevapt"
Content-Disposition: inline
In-Reply-To: <20201223172154.34462-3-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ieNMXl1Fr3cevapt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 23, 2020 at 06:21:52PM +0100, Wolfram Sang wrote:
> 'flags' and 'io' are needed first, so they should be at the beginning of
> the private struct.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--ieNMXl1Fr3cevapt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/0h0AACgkQFA3kzBSg
KbYugg/+JEKCCTGpCv/Qm65bEkXTgVh8tSaT+2xyJPwSmYbx/K6Y32Z8Euu57IZG
8RNVKiorrciVUktxG2nxGq8EwHK0DPAfdUm7KfH7Zd8aFBf6nRDXwmXG15Fu7H30
k/acLNJ2byc8HUQ+0SYgs40HWtY5U4V2sKHL8JGjuwRSm5XhqMQPQjB9AbTjH9eV
moIcw4MUsUCDjxbiypDPjGqT/JidklkcD69VOJoEH/v8QfV3yFwF/9Gvwsj8QdMf
XrYZcE38Yqs4fSs2Gv4onmRyDQaUBKU3j7ZMpfqEDnd2xeFE97bgxVvaantoAlqV
ZyUliG6ux21NEE6wSOFldVUsKEYo6oadvtU7uNtegGn2UPJoV+g2CKfkbtAY9Kum
1W8I2rTDxUR4aPFKInXNtHDQClE4Qu0//d+cXTe3Uo5cbucm1qIglcCB/95O1M2W
IIkAqW5sfNZ3rTXNhrOKVUPzixpu0xrmht5doQTfwgXnlosbaKSwgmAjR4u8EyCE
ecWUCk9W57UunKkqwG/me3iCI8sXgFxt1Tnh02VRXH6u+W9FiNc4bp3Pz7zlZo3l
N+AvWJcwuUHxiXHWx1zTUIpwT8uwYsPV+MRMEgf/uRZv3eobD39OO+2w+ZuOKCJN
QMKy68tLw76qOO/GU0eyFdY+TpeamhmKAIonIvrxcZM6c1e9A4M=
=pcjj
-----END PGP SIGNATURE-----

--ieNMXl1Fr3cevapt--
