Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1F7741FA52
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Oct 2021 09:45:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232570AbhJBHqp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Oct 2021 03:46:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:43464 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232562AbhJBHqo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 2 Oct 2021 03:46:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B60B861AA9;
        Sat,  2 Oct 2021 07:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633160699;
        bh=wMshd2dpgvTl3OeHrNuDHL6xbuUSxuqKW6/dfPTDtIE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qU4s6M71/n+QRytCqkvMsc7cMX7dQ9CO6USQj1/eKczh17t4tn4Oryx6JnijoKMB5
         JeNJWECn9ZU95a4PMcWFEVyEbZIXJ6ykfy12zUJO7L7g5r9vKPcDilYHxWAO4aRPCZ
         WGbggl65GFki58RB7DJubYreCaYJT5ZxEP6A1TIYI9/yi5gtYcVdbwV6S4Oj/YFqAM
         0DJw9Uy523pM8X9doXb61dpwEhNF+/4ASLswyoC+fCXl7F6x8fJ5du+N7vKvDdLI0Z
         GYgI7FWi3+uoW25//TMz/YsJJ5Lvmk3Jwg0dxBlmkLXX8Lik0U6cetW2V0tqv34KtS
         lezc/PEYLRJgg==
Date:   Sat, 2 Oct 2021 09:44:55 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2 9/9] i2c: i801: Improve handling platform data for tco
 device
Message-ID: <YVgN9xLPSJAOqkz+@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
 <0e8188d1-e35c-162b-6657-b22e8034483c@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FCrkEQIamzyYpzYb"
Content-Disposition: inline
In-Reply-To: <0e8188d1-e35c-162b-6657-b22e8034483c@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--FCrkEQIamzyYpzYb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 06, 2021 at 11:18:40PM +0200, Heiner Kallweit wrote:
> The platform data structures are used in the respective i801_add_tco
> functions only. Therefore we can make the definitions local to these
> functions.
>=20
> Reviewed-by: Jean Delvare <jdelvare@suse.de>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Hmm, this doesn't apply on i2c/for-mergewindow. Did I miss a patch?


--FCrkEQIamzyYpzYb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFYDfcACgkQFA3kzBSg
Kba4VA//QBJ+qER7ItgciYsMncDXSMii5nSVtpV+gnh+E2kACjGthIWoB3xUOy1U
24tXc3QJ+UUEHZNG99KlSDZLyNIQXQGHy5v70oluESqb04n8x6+RKnqjFxui/d+g
3N/MBgP8xqOSaUTBZHM3xM2lQIL4BsFpl1/7X95g2Iyv+/6eO/uIg5KR7yYdNO4i
mIgKJa3c2J/xqSEFccFgAXr1tWtTiLpr4PWESH0KMihF25Xd9Sdc42IlVdRZud7B
75f/hn/WordSbxe59Bj6qB0JMLHb604UvFbcljwD9H119TTorxdYwlwnBIGDanXO
+nAaIc7ogFex081IqYDYNwQjrrejKqHib66C3mcSYfWp3Ls5O6/YBM/WdCFh+jIZ
J8Jzozl+ysm9S5ZaoBwvqr+xy65c3ptEOw3EydK2qVv6MsFfq7d98l6iDbjp4X27
u7gRKH4yfjNqr3JUVtCG3++Sr9OZHebMKhisRD9DCwGSHSH1RUsf9am07E4/gxqb
LCQxAtJXxZcNpmxyYSwhUCclQ66JOroW9BWeEMVnKpteqCArXzAagrjF8+BYyTLE
Y1mEL2W6qvGBX4+uZaD7x46q63KPGYRScD8AYRnIAsZulF6Lp4TAEt3poBdgDxPB
yVV2m6njqqCgMnpXsqABRb7c0IoMGQ3/OqDiGu80zflPlpqTe3I=
=tRC0
-----END PGP SIGNATURE-----

--FCrkEQIamzyYpzYb--
