Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AD3F39C149
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jun 2021 22:24:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231376AbhFDU0Y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Jun 2021 16:26:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:60044 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231330AbhFDU0Y (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 4 Jun 2021 16:26:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E5F85611AE;
        Fri,  4 Jun 2021 20:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622838277;
        bh=61I3hmP3XUh1Obq9MlMzvs0U63jKhNt0yiD0RDZ5uNc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NZDgwbTQqu7Rzfbzhc0RZ3loJWhRtGMa2ZEIhZv2yTkXzBcJq4h0x6MUUxmFO88wh
         E5Yr9obBVKNhMsK7QSWlqHiy0Lrr05UfkwVH39LXQdmVVdE/R5/q85q/eaiLv66yhl
         pgKpqHITIR+DxTK0JmACnyU8IaQTSIlPQDtsa7p4cnTpUcNW7CMZeczmNN/916Avp5
         YW7lhF9pQhQtncnQca6NvVPR+dBO3uVZ7cp1fET8k1LB/wNGQh8ClWDm6wjZ4auBzU
         GMbc3bFlp53KhLsjaSHTPgfbyY2f4+AOobRTJP/0huXm8ZvGSidZNHQibB7d3qEczq
         yOftFEsGER68g==
Date:   Fri, 4 Jun 2021 22:24:33 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Chris Brandt <chris.brandt@renesas.com>, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Add linux-renesas-soc to the Renesas I2C
 entries
Message-ID: <YLqMAakDTMa5+iGM@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Brandt <chris.brandt@renesas.com>, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <0449ef7469a14d8ea25df6b06b3f230cc95ebd7d.1622559592.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vP7uQtcQ2UDzMsf+"
Content-Disposition: inline
In-Reply-To: <0449ef7469a14d8ea25df6b06b3f230cc95ebd7d.1622559592.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--vP7uQtcQ2UDzMsf+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 01, 2021 at 05:03:54PM +0200, Geert Uytterhoeven wrote:
> The people on linux-renesas-soc are interested in changes to the Renesas
> I2C drivers and their DT bindings.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied to for-next, thanks!


--vP7uQtcQ2UDzMsf+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmC6i/wACgkQFA3kzBSg
KbZNjRAAhuhRMnRvqe3nUc6roPWR26C4vxfY5NgkjJPpWsJic640apt9UwmfY3Tm
aQtd0whOhPX7FBkxk2g3ixSp1zS2If7YGV6fgae72xLMeaGudau+ojMp0gTezQmQ
VMDFBJObgZuPLauPhWjSvJBR8DiFowNswToziBD7QbBt6MEZat3Wl6qS5Bu47xUA
D/9Lg85PkP8OiV0g+dQ51wRgscxF2gw1FFn4qAEWcnpREEsDBket3HbcWGVSktfS
i/QSQbMUxsHZ2kbC61bdiEi/mqf3Ko7AZ4sACjEfSr+fP0Wmrj0MjiatU0zjCbD2
IpOWDYkexjm9UlAE43fKfP9K0QWikG5BzHqqFCCtzlo+4BAmq+di6Je/hTOkSQnE
yNWWGoVIihjB0vSXc0UKmWLEsu5J8cWZDhdIpVS3yaah9PEbQcO0r0+0xydGrTCv
xHMiJcCHROMlOn9DmBJe+REkhOBUQx/QCqIngask1m2H/ZUyYMnRvUkz8WfdfiCK
L3CNSa5XzOSIyl4Zysd5YmKQeszLspiXhXqX70yh3MyAuCemelxFNUQhPz3BTfFr
umcbFcsFpj7k7YiORqnuy6bqlCKqI8pOi4eBz5f8tEyo4dWHLwwtxaSoFOeE4pPW
UZ9h1UUK7kbKChpk4x9g0hipZFExg0bpnFpuhCKxZ2D+0xhnaNs=
=Jv53
-----END PGP SIGNATURE-----

--vP7uQtcQ2UDzMsf+--
