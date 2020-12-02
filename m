Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C8902CC0BC
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Dec 2020 16:24:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729081AbgLBPXf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Dec 2020 10:23:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:55540 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728326AbgLBPXf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Dec 2020 10:23:35 -0500
Date:   Wed, 2 Dec 2020 16:22:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606922574;
        bh=5grNeSKTu2eXs7fsdiyHN6USwgd6uSEQjV3Fff/CI2E=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=qwesW3Nah9lApwjZLcj7BwFjr58RPIAX6R6b7Fb6NFORv3XZVf6jf9bm2lXjCtxLC
         4bdZu4gqdg4IALJn+rLL5ft+Ofbl7Dc7+1BH7dsCQfF7RRYeodAI4VDi2FZgWkblHB
         zvN/xpWW6H4JxFcijL77LhtqQK6MWm6m+sK/L2TU=
From:   Wolfram Sang <wsa@kernel.org>
To:     Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
Cc:     gregory.clement@bootlin.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i2c: mv64xxx: Add bus error recovery
Message-ID: <20201202152251.GD874@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>,
        gregory.clement@bootlin.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200826223516.29737-1-mark.tomlinson@alliedtelesis.co.nz>
 <20201008122534.GB897@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hOcCNbCCxyk/YU74"
Content-Disposition: inline
In-Reply-To: <20201008122534.GB897@ninjato>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--hOcCNbCCxyk/YU74
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> So, applied to for-next, thanks!

I am very sorry. Due to my mistake, this patch got lost. I reapplied it
now. Sorry again!



--hOcCNbCCxyk/YU74
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/HsUsACgkQFA3kzBSg
KbaBqBAAtUfN7tr8Uf2yoru/2j2bpc6ZzQXG4A7senOxKp3yMt3MQ8zPOIYoYlXV
3o3HCLvqRZA3kwz1h6n8vEqEVhYOqfbq5heQ7/rpc29gnq03GRzwoMq2vw0RPlEs
HN8Ne3oR0NncEOqIp5B5YBKlQWvKjUwI+Aw5p4ZPy5jX45KBPBRu58jNfgCbRMhF
VQiFDiAqLqTGcKn1zi15Pmp56xIck6H+7zHmRbKJ851TP0DJCLfdCbYKq/6KGnqb
lCUJ7wZ374iH7rrBmghGTtname8eZbWYz4as5upeRVhHTnJMhUuohBzm9kLn8N/O
03HYpo4dcjTeQ8sjQTOZcWWtdDa55YR2dDgQ+OVDqiSdw35Qhw+FwR4utiae+7V6
g0cMaXO1Lr6mRnI7EOGyAgsm7xIwquTHoOT/kmh+gDVqlkxU8Oud/G0ecssYSm/W
YEgWBviiCcE3/wvfrbnmFXaArl3FQxKuM/lYvUZaXULCJA0zrnSPP2LhtvZC2wvW
hLrDiSVRQrBpHVDbzO9uP+j+Pm2g956wUhxab/i+tixacuKZaH8zB2a7eRbCcwzz
sRBaMHGJB1K/PtfHqioPWlu4AwP9eNYF0JG26UYJrJHldmSEFkWY9y0HeL5LG9W/
P+OYEvI6mTeiDitwnx7oD1cVefvwZhvEcq8tvvZZra5FSXtcHB8=
=T4SG
-----END PGP SIGNATURE-----

--hOcCNbCCxyk/YU74--
