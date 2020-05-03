Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E5D21C2CB8
	for <lists+linux-i2c@lfdr.de>; Sun,  3 May 2020 15:29:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728467AbgECN3N (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 3 May 2020 09:29:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:46060 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728378AbgECN3N (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 3 May 2020 09:29:13 -0400
Received: from localhost (p54B33FBF.dip0.t-ipconnect.de [84.179.63.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B538020752;
        Sun,  3 May 2020 13:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588512552;
        bh=4JWSkq2cpw2BiP+K3FyaxSJGQXjScmAftWrqg7rnk0U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ncI0ibVX7g2+5ycsBniA1qkCTQNyqh8iKYA5g9e/xNfr4HnaUpBD099vKdhn7pGME
         6IdSJSIQegG79efK+SFITq4Defjn+ABBATGj37/P8H7mxcUIfUtydEI4OxLXP31CRP
         uCvDzwn2TkjePdkmMFF9UPEogPrdtgZj9te6QmPE=
Date:   Sun, 3 May 2020 15:29:06 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Aishwarya Ramakrishnan <aishwaryarj100@gmail.com>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: uniphier: Remove superfluous error message in
 uniphier_i2c_probe()
Message-ID: <20200503132906.GA32207@ninjato>
References: <20200503120847.13528-1-aishwaryarj100@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zhXaljGHf11kAtnf"
Content-Disposition: inline
In-Reply-To: <20200503120847.13528-1-aishwaryarj100@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 03, 2020 at 05:38:47PM +0530, Aishwarya Ramakrishnan wrote:
> The function platform_get_irq can log an error by itself.
> This omit a redundant message for exception handling in the
> calling function.
>=20
> Suggested by Coccinelle.
>=20
> Signed-off-by: Aishwarya Ramakrishnan <aishwaryarj100@gmail.com>

Please send only one patch for the whole I2C subsystem.


--zhXaljGHf11kAtnf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6uxx4ACgkQFA3kzBSg
KbZdtA//Y6lCK360CUvB9MxuvS/hhnxeaVtnqwL+5QEFQjabnOTw1EFXji4ihhAX
IBvWE6pLYag6SHHC3GN224jR6b5AS+8wLBGmy052fFCn5/DrphXupF7+wCgjZZVG
q5/i1XUlJeqwxLBGfQ8JuyBkfQhmSp1K0xUpcPZfT7eso/mE0L3ZJ3TskesoubWi
VKpelcUTuCJ3QgP9llXlwhMnbn4GQARDzThv4mdogCbfkh8t+YKUVMy9t9vo/BZ0
X7xRjBlFq7slq4Ua+Y/QWeTmyo7sj6IgG4KB23fUvouGqYzPXJnD/pAl/IOf8Q8b
/YLQSKD3lEs1V0zn/WaI1q+H+bd5qwJSk0wOVeL3UoCPJACVtWzJhTM8PJrm5i1+
Gt6YFZ9KFdRDB8rCR6J0bcuGYw85QZ+egAnrRz/0jy1dbx3NcYSlrEpgt9+jC5uN
reJTbrCKoG1EeWGqY6klbE67C8Fg+4uHLf4ipAMc/74BV3+YD4fXu/hYjERdjhWp
jADtF4tpkFw8mKQdv+r8auhVR8Gu2mcR6MFkZDbwStXpTAlvKZkfPUU6Ue/n//De
aASsTid88R9o5INCqIHNyisKSOwdlJlnX/WU5wTXYbvAeIoGa/Ay4ZETy2eBcFMM
9Fi81whNJNI6g9w1hgcT0MquELnDHiY3tiizj1yHeOn7o5MYQkA=
=gWoi
-----END PGP SIGNATURE-----

--zhXaljGHf11kAtnf--
