Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FA6539C14F
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jun 2021 22:27:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229913AbhFDU3S (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Jun 2021 16:29:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:33920 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229854AbhFDU3S (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 4 Jun 2021 16:29:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C3E97613B3;
        Fri,  4 Jun 2021 20:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622838451;
        bh=tp7EhaUIA7dhDqX73gUiMeFFSwmwo5qsAN0c2GLR7/8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=J495APYqeMvGak7VjrnfXTx+O0ofgIzrHbyPJ+K5eDQGpv0IfD586Ub0mUgRKUdZm
         QcgNb+5o90ApgmlCFc1Q7KGqa6lwLRlbadNabGKYC2gYmf5PA/ypxf5duJ6TsqhmTS
         wO+lIPQ+eZ/sgsIVJgtZZObY2oHNQAf3Y69zERxDPzneJ2qoq2/ztUChMXbJ0Lhlkr
         o9jjNcfjrXzh64tYGYr8m6uy88tLY4YQFupsFZU0rS2b6eBlWyeTGTQzZwp0/ZyOrm
         K0anXq+trFoxq3HvQcW7xm+ZZdMmvKCrEOWwq50cv6k5R89yXNKRQtleBo/o5mL0gN
         G2S30JmqCG/lg==
Date:   Fri, 4 Jun 2021 22:27:28 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H . Peter Anvin" <hpa@zytor.com>, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, x86@kernel.org,
        linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: i2c: ce4100: Replace "ti,pcf8575" by
 "nxp,pcf8575"
Message-ID: <YLqMsCPSCvisGyGF@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H . Peter Anvin" <hpa@zytor.com>, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, x86@kernel.org,
        linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <cover.1622560799.git.geert+renesas@glider.be>
 <9b560b7f5ded90430c989a211f2aee009aefc595.1622560799.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="a1L18+0qYibZ0Ie5"
Content-Disposition: inline
In-Reply-To: <9b560b7f5ded90430c989a211f2aee009aefc595.1622560799.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--a1L18+0qYibZ0Ie5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 01, 2021 at 05:25:44PM +0200, Geert Uytterhoeven wrote:
> The TI part is equivalent to the NXP part, and its compatible value is
> not documented in the DT bindings.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

I'd think I pick this individually? Or shall it all go via some tree?


--a1L18+0qYibZ0Ie5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmC6jLAACgkQFA3kzBSg
KbZdLg//fOeXpGmmYSRKOE1z3+qSZbfwj/LBOY9Attl8FsAI1y38e8bXXHP3kaEs
pIaBx0M+gFM3HPb9effIwDAkxPVzuWxTDHq3Ux9EJdbPA4ZIopF5k+7CNQmr93an
JamaH5NzzCJy/gRDtq1oGMs58RIEkuLw59XmTIhI1ZlZsACf/FlVuU1jn6hBKe6G
/AYC9+mwqIaZnFhQGCUpf4k2S5fG8yo0cm1h/YHJHlvceIYixH6aR+7DHtgurXqP
s0hGiAOrGnTTShOL055kg9USVL+84Nhauih9k/E74weXUkiN9tiF7wJU1KVqmGnI
Jnne2N6Kk5kG7pT2EgeWDKQWH5TUjZbRPziN/k+N4a2aItFN84crBZOFxBlIsS5P
+8g0dVK2tUfzOkAiXI7kV9Z878vNzfrXCH0epsgJ8Eayw1ZDq98qKsi9AdpdGzTw
BVDPrI3kyG/RYGuAfJ8Jb67aR75v9+7pytQRlhy1NvKJ4dkoeV8E41LI3Yj/Gr17
I+12ME5xXMQPYJQscRz5L8m0mUgbvEb0sNABUwgiiaenDUtWAPCMMwGNYLkNo17Q
Hdh/ZTHbNpDKzqUQe2HpAeNEwu8/DCrKJS8n9g8+Nf2Rn3yaUQ3KxbuGdbhDWb3k
9hIaOgdvuDcp1xqfP7HQz+QqI9064vN9KQGpb/IFFqDmP5XiE/E=
=a4Z4
-----END PGP SIGNATURE-----

--a1L18+0qYibZ0Ie5--
