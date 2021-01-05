Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A38F2EAEAC
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Jan 2021 16:36:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbhAEPgH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Jan 2021 10:36:07 -0500
Received: from www.zeus03.de ([194.117.254.33]:52872 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725917AbhAEPgG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 5 Jan 2021 10:36:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=xAkdORAnxEgxcSP3OlFuhDty4uh1
        H0Ew85hsHXyrIqo=; b=OgCketEGlrpGhsMejjUmP5c0sXR/T2B44Nf1Ihpf96yV
        nm+FBng4UjqzZf8T+PrZVt0fEh9UD5E8bLLy/dOmml75h7CYEIn8bIumJA7iiPFj
        S2n8blH++I1ykJX/eJLOVz8VBV7OY7O1XvWJ1mPn8EQqyGf/ccsuGHZC4zNKLko=
Received: (qmail 107696 invoked from network); 5 Jan 2021 16:35:24 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Jan 2021 16:35:24 +0100
X-UD-Smtp-Session: l3s3148p1@1w+H9Ci4GuUgAwDPXyX1AEdA8SGgn5QT
Date:   Tue, 5 Jan 2021 16:35:24 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 1/4] i2c: rcar: faster irq code to minimize HW race
 condition
Message-ID: <20210105153524.GC1842@ninjato>
References: <20201223172154.34462-1-wsa+renesas@sang-engineering.com>
 <20201223172154.34462-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="CblX+4bnyfN0pR09"
Content-Disposition: inline
In-Reply-To: <20201223172154.34462-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--CblX+4bnyfN0pR09
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 23, 2020 at 06:21:51PM +0100, Wolfram Sang wrote:
> To avoid the HW race condition on R-Car Gen2 and earlier, we need to
> write to ICMCR as soon as possible in the interrupt handler. We can
> improve this by writing a static value instead of masking out bits.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--CblX+4bnyfN0pR09
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/0hzsACgkQFA3kzBSg
KbaHUg//dJVqchy7kyRUZ0BxB89ZMluWMRx2O2zdMTscAuKnC/bAfQf1CI8uDKSL
eaSfTCAVyvbeATd0FmdGOvKPNB0A/5MVLmrSn9gjFVHxSObXANdZkx8tfxP9bdBJ
SF8r2AKGmgMG7qW6LDXm5K3vmyfhJZwXWMb5huU89VpFONkSB6/DJwT8r0N5lNly
GAZQROwMa4nQps3pnlpkP0SKO8L+6/MUnLF2Q6GMzK+bgXm+vWOOAavSSw1WRfRl
S+xZIYLG6c5UoO/QLC/QdZoTbZ+EkN4sHnUHobKHLo4FaE0IuATrtIR7G1ub2aFX
ARwkLLHmsPEYQtQN9va0rTi0iEV8amSNQetkurWTqAUjhwIeo0F5xW4TZUOvNXi7
pi94AQ8n7RMpthWR/gNbnl36g7bFx+faiH5KaT8iMl2IsJcrB9yz5S5lBg3CQjia
U1QIOGMnrJvnS/TItJH1DrcHZren4kl9CxvqvBMspRnd41t2P5oLJOu/2KSHVbsw
dWWot4oCnyvZWjsv5vgXnpx/+D7O73exi/r3klwp9Y2KIVAFaNEHq5duEZR97CQH
/i423HtoUtyZdQOZIWBWdQs7o5fgGP8zyN6LXxWjNtlSrBORELXNogUXgbi6RiRU
BpyDCi7jai9hmR8GBbSGW2EgwOLbcL++eKmzhNO8M0mkKVDAotM=
=yq4M
-----END PGP SIGNATURE-----

--CblX+4bnyfN0pR09--
