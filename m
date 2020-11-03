Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 197A82A5506
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Nov 2020 22:16:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730794AbgKCVQG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Nov 2020 16:16:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:53300 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388423AbgKCVLc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 3 Nov 2020 16:11:32 -0500
Received: from localhost (p5486c89f.dip0.t-ipconnect.de [84.134.200.159])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A9D7B207BC;
        Tue,  3 Nov 2020 21:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604437891;
        bh=CP4CcVYGwLAuKW0InrArv7u2uP3dgV+GP26YB2JQaTo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s5RQJj11L+Lccv3UkvxIF/sh+5XJgeUsQF1xOAtGPKVTTPYBUtO15E6hgxZ21CpWB
         NZuvkVhyc+Lir1EkBOACcJt6FSd2IiRNgnxdsVQkiPP4QaEj/Tk8qkgqSbj83x1T6M
         OTay9PzzQAFQarMumAslccvAO1D56KvWWEa+mjBg=
Date:   Tue, 3 Nov 2020 22:11:26 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Cc:     linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-i2c@vger.kernel.org, peter@korsgaard.com, andrew@lunn.ch,
        paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Subject: Re: [PATCH v4 1/1] i2c: ocores: fix polling mode workaround on
 FU540-C000 SoC
Message-ID: <20201103211126.GF1583@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Sagar Shrikant Kadam <sagar.kadam@sifive.com>,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-i2c@vger.kernel.org, peter@korsgaard.com, andrew@lunn.ch,
        paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
References: <1603291814-240377-1-git-send-email-sagar.kadam@sifive.com>
 <1603291814-240377-2-git-send-email-sagar.kadam@sifive.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Y/WcH0a6A93yCHGr"
Content-Disposition: inline
In-Reply-To: <1603291814-240377-2-git-send-email-sagar.kadam@sifive.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Y/WcH0a6A93yCHGr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2020 at 07:50:14AM -0700, Sagar Shrikant Kadam wrote:
> The FU540-C000 has a broken IRQ and support was added earlier
> so that it will operate in polling mode, but seems to work only
> in case interrupts property is missing from the i2c0 dt-node.
> This should not be the case and the driver should handle polling
> mode with the interrupt property present in i2c0 node of the
> device tree.
> So check if it's the FU540-C000 soc and enable polling mode master
> xfers, as the IRQ for this chip is broken.
>=20
> Fixes commit c45d4ba86731 ("i2c: ocores: add polling mode workaround
> for Sifive FU540-C000 SoC")
>=20
> Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>

Applied to for-next, thanks!


--Y/WcH0a6A93yCHGr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl+hx3oACgkQFA3kzBSg
KbbKIRAAmB6/sKtZ7WE4OQbGRQft8f+GgZMLuc1AT810RO/vUmKK7QIfNzdGNhVT
C2tgYQq4TvK05D/lldsDakeow8HfI1DmrOR2L2h2orzNmKaq913NAh1T8ezTtsBE
V74PwyqTp78V95uDvH1nW7ms//l0VGMZ3VPPkqR1ob8kwI1Oc7U8/yBbINuNGnKG
NhEpTcw5Ajvnf1hooWceZ9bKZrPZSbSf8dpTtiV6RllK1h3LdDogTNEFP8eeN/qY
wi3J648pO1y6iwUVIb1+nkZDR96snSHCg0FP6JjjpEi9e1TlSfXAyx7UqlL3FjcT
AzueDgAPbjj1ym7IRDN0BGVtzKEHpHFeVZqNt5OTlnuXBKn4UXN7eMd7xCFjZ48u
FNKkQLAId2WEZ08it1R9cJShdJSqq65gegs1FlYXrTS4fuVGLlFKUEDplk2NPVhp
KcWr/Hs9GG4uq7bFqt2X/v2v5hfGtDJ0Qa50hSYZ5Xqyu5NR0AKfzLMhIX94x0uW
gOfplo8UCK57UtB/c2P7NXTSRnXoDBz1cMiWRgMsUfBXVGxUGvVZ+lMw7R7LRnRj
wCfXDgytTWVW6Yzkp05tpnUkAJzN85o4olfdHouct0P7IJ3bjq+yThFV6Vvet4p8
f3hWLBHzbQBR0KGz1l/qtIaH4iYg3sxl74KEx1GB5VE5zp0NELg=
=LLzu
-----END PGP SIGNATURE-----

--Y/WcH0a6A93yCHGr--
