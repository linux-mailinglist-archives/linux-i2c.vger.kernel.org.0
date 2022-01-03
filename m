Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E84A3482FA2
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jan 2022 10:50:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231376AbiACJus (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jan 2022 04:50:48 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:58404 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231354AbiACJur (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Jan 2022 04:50:47 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B593E61001
        for <linux-i2c@vger.kernel.org>; Mon,  3 Jan 2022 09:50:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49FFBC36AEE;
        Mon,  3 Jan 2022 09:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641203446;
        bh=A+F118C62C4UIaGEgchX2HIsNnTGpMWsFW5FalR7zUw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bmQHIQSXQ3cEYcjXHod3P5L3tONhocmMiZy0ouAy0hgDAaMq7QZuce48aHSC+SIwV
         3b2xq7ue20RNp2KgvRC1J7Anx21JQvuysjmdpuSGbHDkjlLb4rdUvPisjZfa57gkrX
         z+WR3ve4JIoRhcWJiAvJWCQMid5l/C3VsTlkScVjnn4jaOkhCSWBJuA+0V7YurA035
         27My4aNtHRrLvH+UAVM/fxvUuaP+WG7jVn0RuwE4ToaqcLTVX5yNfGbCwU7QjJ91et
         6FT6R0bCqEI94nWzoYduGIOZMuWV9+B+P19lnAd4wsU097CO7HPRFT6ntjl/CKltST
         uWkj16f6Qr/RA==
Date:   Mon, 3 Jan 2022 10:50:42 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Aurelien Jarno <aurelien@aurel32.net>
Cc:     linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH] i2c-detect: fix a typo argment -> argument
Message-ID: <YdLG8uthjaHO/k1g@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Aurelien Jarno <aurelien@aurel32.net>, linux-i2c@vger.kernel.org,
        Jean Delvare <jdelvare@suse.de>
References: <20211220202718.1380408-1-aurelien@aurel32.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OH6XD0tUskvqTOtN"
Content-Disposition: inline
In-Reply-To: <20211220202718.1380408-1-aurelien@aurel32.net>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--OH6XD0tUskvqTOtN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 20, 2021 at 09:27:18PM +0100, Aurelien Jarno wrote:
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>

Applied, thanks!


--OH6XD0tUskvqTOtN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHSxu0ACgkQFA3kzBSg
KbYESRAAo1Y9PRgOnAzOY3/ZjaBfEqG7DcYP7GjUGFIhKuTQsi0B68fQBHAvVJTN
34PmV9yQ7WxLofxiIRsaT0QAsMqzRJG28Fl4cThFEGhS3vgLyisit0gsyOQroGH4
FxG7JQw+2HsqVD6WTrrZlz4OoFiMphbqFDV8AUvy6W0vSejLmfJLNaSLezZluixa
HDQ5tCb9zfqljhTn1PjD8gAJnYmvNw0Ixy7FBshSJvLZRHXgrBLP+rX3zykX7DZ3
5zziT4QYUjPunIPFnUovu7OiQRPbbN3LNOzd28g4A/bdWFBEUmfyxvpYup/gGJMF
xYrOZfolZmf6OGBPSXhIhuYFUS9f/A51H3CsURQYTpvo27YF4l1PURN/QcT42n+Q
eb77vzFNDGt/wC0nvu/gLKMBpZuSvakLrTU1VSDwOhjPIR94lc/PZ53eZRG6VSec
y+mAIzn0ZJy9BOWP+F+fAjqx6QSe87agy13wPmTw6yTGEaCRQdRkxcXDYaoPBzu3
Abx/ZhQArI5ls/jG2/96tGME2n+7C0YZTY1yQqIDv3egmFM6jRBdO+LzIKHskIfw
0Cpmh0dLub5/1O9iHvQO4S30kJJvuEOgCSWhxin/ZMQkmFT288/5+DWHp1MIs8H2
5MrvGjWS5el8fCECFROnvYzylJ77O6X/6ih9VBWjXhI6gIfGc9k=
=bnz2
-----END PGP SIGNATURE-----

--OH6XD0tUskvqTOtN--
