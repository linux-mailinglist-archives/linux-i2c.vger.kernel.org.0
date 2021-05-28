Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B384C394774
	for <lists+linux-i2c@lfdr.de>; Fri, 28 May 2021 21:13:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbhE1TOk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 May 2021 15:14:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:34196 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229492AbhE1TOj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 May 2021 15:14:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E068A611CA;
        Fri, 28 May 2021 19:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622229184;
        bh=COmxgjuku9XvlvbbEmPsZkZDJTSf/3D/bVi/9RhXpWg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EZ8z7VGn9gh09OqnsDqGF98tr8F70Mbp/rol1kJq9cN/x9bnUH3YNeFDhi88XGeNy
         jgDah8bX/frxXiKp2G6BEIE0avQsMfCuxpw9VqL05LUh7IrxVrY1EQBCrOmbLF1Tcm
         87nXmbMH0llOaguQL4WVSWmCAltW5718r8e+zAA1O1CLMez+oWOgR4/kd9yxo8XdMq
         Pyi5ly57BoyDEyb00WO/j/qVJ38vO3qRmpQVrXUaQYSRT4LDYsi940QEINDpPF/lRc
         i9QNLVNFW6RARr/snhGwfA9dOyLUdx/hbyDE96vZisC6IigNmg/5z6HIEUZgljcKce
         bE9UEquWLBQGQ==
Date:   Fri, 28 May 2021 21:13:01 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2cdetect: Sort the bus list by number
Message-ID: <YLFAvU91IMWyQJmn@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>
References: <20210527100703.71519bbe@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="WW0OppqLcXPRm23U"
Content-Disposition: inline
In-Reply-To: <20210527100703.71519bbe@endymion>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--WW0OppqLcXPRm23U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 27, 2021 at 10:07:03AM +0200, Jean Delvare wrote:
> The bus list (option -l) will be easier to read once sorted, as
> typically this will group the buses by driver.
>=20
> Signed-off-by: Jean Delvare <jdelvare@suse.de>

I like it!

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--WW0OppqLcXPRm23U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCxQL0ACgkQFA3kzBSg
KbYkphAAnPv15OES7yjTybPlIBI8ab5tT4cc/Wvaon4pziGNgV8xvSiIqrokKyTe
GxWyTa9zLYbRYzeyLBT4dThLuQkgjrwl3M1ppf6YuIgmYgN8eApXCuZGJ0FgGZ/S
ZEMvU88+jnaMHBeF1KkVQrL0U58xXvq7xTRFz4c/UcmmRBY6ps4K4nAuk6BSzmJ0
5GVHP9YwBcTpkpT+3d9rNvzVlbCU3KBdXsPnScO424wpewuHRxGfJuI5Zi+5FaLK
kYgi3VuwtESlXmLf9WWq17xEjvDX0RDdiTN73RY4mMsaKpb/ENEjx+E9JHTGKWdR
wX7/mv5Pgxi8UlcgfegnslXuHIgSj35U0EdAVJfC17xsLghaVVdN3DboszcBb2ss
2Qo1YMk4ckuGTryf7y/LntIDqSRHDLAHR6cf33IUx4u9w0Cptx0Rnf8XD5YJL9hx
2UxdvdyeonwjTmdMBWRjx+5YN02GmR8NaHKelmFmpZTTaiH5QXrgMjUytF63Dgrm
s55hkNrAXMo3AtVmAwySEcQPEUCHxrfeB2NYs5AHpY9jrHl0hS5jJQFmg4LglJeP
JyXA6o96v9RaUMN9jUqyxoqerUI+XfUvOHPyHCshnt4pk9Z/HUwSAzHXhIQODxps
H1N7gRgMM8cDAJqe4ZW+DSfEK762H+g2b6BcdEwHmFqBdR27htY=
=y2BO
-----END PGP SIGNATURE-----

--WW0OppqLcXPRm23U--
