Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 724A1464055
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Nov 2021 22:37:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344028AbhK3Vk0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Nov 2021 16:40:26 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:51820 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344057AbhK3VkX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Nov 2021 16:40:23 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 88857B81CDD;
        Tue, 30 Nov 2021 21:37:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB1C1C53FC7;
        Tue, 30 Nov 2021 21:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638308221;
        bh=MZMyEnMSvEk8R5TGwwDHjwcmN8HW9IXH8UDHhjIr0ao=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=c9RqmnK9oiIGvjJ5a9bFvTeAObgU1/rE8hqiXR5o8teGb01SmQ+oHeh19ypv8QUkF
         7KXVB2jVSv4GOoGEn7/gUAcutKjVxAvA2WwQwr5rh2t72C7DiCWdJRW+BYb+rHBSKf
         UyqbghqTIr+M7FBnPQmeOjTLCxENg75NIHR7P9YamT/J6xBTJv83ywaHM6ixY5caoy
         vVpoY7md5Ncm7lo8SzHAwYFqNCoMuMsfGs11gbki+ZI68C49WDZla6s0OHeu36iPjF
         rEUqvi7iTn5lJvsR292lRbYKtt2unHJAhJyzlkkubPa73YTKMcB27lk5PY0iWW6Izx
         J0+epgFxPn7Ew==
Date:   Tue, 30 Nov 2021 22:36:58 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "moderated list:ARM/Rockchip SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC support" 
        <linux-rockchip@lists.infradead.org>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [RESEND PATCH] i2c: rk3x: Handle a spurious start completion
 interrupt flag
Message-ID: <YaaZejhnqHa/nlYI@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20210924111528.2924251-1-megous@megous.com>
 <YaSfZxtYtV+SfJqL@kunai>
 <20211130155443.sbvpirzj6moikxl2@core>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Lz55wWF51uLbNsJl"
Content-Disposition: inline
In-Reply-To: <20211130155443.sbvpirzj6moikxl2@core>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Lz55wWF51uLbNsJl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Spurious interupt happens in both modes.

Thanks for the detailed explanation!


--Lz55wWF51uLbNsJl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGmmXoACgkQFA3kzBSg
KbYtFBAAkT42AT46O5Tr1IZfV+kaz0A0tROXvUJpREPcg/T9BmAOVf9DGBum9vCV
UKLEEvLJzhYaNzftddVxThxKUy8szPMElaos1rYMRwev9VPgk/GcNl8/ldAS5JRN
6ZePQC8OucKFmv3LeR0pcD7Q1deBl14kPS7THgE3zhI9Zd7IqKM5VD/ljdZtw46u
8L5I9AoVzdklzcpwUzBRF8+uxkliuyJ3TNXM5AVURt6pEmmCTw3v+JsaxKTokH8B
NCgDWtwei8TCAzfWiTxKs9gBTw9lngECv/9YkmlmDIA28lIAZWQzwlAkKidXjWoX
Qu5fKsZrOco9c1nRe0iHMCraOhC0tAt4jLvH/1R129PHVE+N3bAeINTcwe+V+RqG
bmNReFVYJZxiABWHxZBzUj5pqologdGiP2U08sbeGnENOlV9mzlPbjC2Oj57HjXG
vpfdfg5jqAJE3rD43feRKaFBLnjVQOYdmYY96EMzLGtBCXOXr7sfBnaMKkgSfnXb
zNVM5XpBNa08TodMXHIhMiqVfRmAtL1BdIcfcne/o7vzO8ZxFHhm+TnsZCA470R6
umBk2wZg9AqUdxbmemiO4Vpoh4dfQIUkfnaUs8OnJmjxRmySKz5oo3Wz+qWEmsVm
u0JdXcI6oBkIDMuRL1ataDAM74h8BwEXf9gaz3CTksTd00WZAMg=
=AEvi
-----END PGP SIGNATURE-----

--Lz55wWF51uLbNsJl--
