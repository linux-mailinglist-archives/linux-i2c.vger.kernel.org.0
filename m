Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DBA63735A4
	for <lists+linux-i2c@lfdr.de>; Wed,  5 May 2021 09:33:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231544AbhEEHeZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 May 2021 03:34:25 -0400
Received: from www.zeus03.de ([194.117.254.33]:56664 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231279AbhEEHeZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 5 May 2021 03:34:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=n+2Vkq69Ma0baKgAusTP+dM7AsG4
        s/PvcQYkwjGihNI=; b=yL6xSahmqNq86F+/Td2b6qqDiBPHcc3zdYK4E1HCzSye
        xpZNp7SS6WmZZhdQrgKIPIRf0SO0DTwqHq6L93SoMqhDMvk69KVNGz84zUV1iPje
        DuKtes8ny+nupsPvwMjabJrZDdCJkdJi0N/j3RADOyRpCKR3DvUNLQDnWow7jWc=
Received: (qmail 1683845 invoked from network); 5 May 2021 09:33:28 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 May 2021 09:33:28 +0200
X-UD-Smtp-Session: l3s3148p1@4WfuNZDB+KIgAwDPXwRNAK21Lx9NnZcs
Date:   Wed, 5 May 2021 09:33:27 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFC 4/6] dt-bindings: i2c: renesas,iic: Convert to
 json-schema
Message-ID: <20210505073327.GE1009@ninjato>
References: <cover.1620138454.git.geert+renesas@glider.be>
 <ecfaf6be5e8c285db2bcc823bb1dd89931fa5c29.1620138454.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OZkY3AIuv2LYvjdk"
Content-Disposition: inline
In-Reply-To: <ecfaf6be5e8c285db2bcc823bb1dd89931fa5c29.1620138454.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--OZkY3AIuv2LYvjdk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Possible alternative interpretations of the note are:
>   - Only IIC3 has the automatic transmission registers.  But the
>     automatic transmission feature is not useful as the SoCs lack DVFS
>     support.

I immediately thought "yeah, this is it", but had to do some resarch
where my assumption comes from. I found it in older H2 datasheets
(v0.9). Here in 56.1:

"Automatic transmission for PMIC control: The IIC3 module of the R-Car
H2 and M2 supports automatic data transmission under PMIC control
(DVFS)."

Or table 56.8:

"Registers of IIC Command for Automatic Transmission Mode (IIC3 only)
[R-CarH2, M2, and V2H]"


This all is a strong indication for IIC3 only. Which SoCs that have is
still confusing. Table 56.8 mentions V2H but 56.1 doesn't. Then again, I
could imagine that V2H has it but simply DVFS is not advertised for V2H.
And in the later documents, DVFS advertisement was removed for H2 and M2
as well.

(PS: sorry for replying to the "wrong" thread, I accidently deleted the
"correct" one)


--OZkY3AIuv2LYvjdk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCSSkcACgkQFA3kzBSg
KbbANA/+M9SYVRW57FmBoC9xEcS/fuRxt4P8tSuDsj64qIcNSST9GzEj4HhEfvop
X4n/p7SSrxPXHlmtKjdtnTlS8415uWFngrkADW7p9BggZhswcth058YEeSSvsjmM
HmjQhWGLSOsJyAL3SO1MMRK6QpYfZz/lUjMX1XHV/199SFUpJid8hhlf6BMEI0TA
5h0EC5Dx1wa34A+Jk1HJOkc52Zw2U1dr8CE48kDv1alPy7J88KFtzrYgPDIU3mfa
mbiCGbhZqbK9veZpV0LZijTajphNOpZWkx6srtgpqGearOfYdMBQV/JJKMVAxaaa
d8O8zTI1uCKZmyPzr6zU2AbX0XMOQhZOXlfDDUSz79ggeVVT5yKkUeQWl0IvxjJl
rIpO+baAFZyUD8+oNV4IYPTrIQiRoLFxQojtfZeKyo5sAUlNW8akHeeHOW27o6Bk
e6hk9nSRUH9I8fFlaPo1Lqcyv8jqV8mrWdkLeP1q3Nak7/W+fD9pS+G7ZmRkTKWk
hbtUvDzf4F7GvdkzBlMWvREF/d9tqAA4PrWzPBYNfjdba/FWxy4V7TzV+ap3/Kkl
lTnCb/iQtze1dk3du9pubzBTniDWW5hquHryjKpERXX6ZWRs610YYeIvU4joryO/
kjAZcRDY78rld4ZHNnmlGEUukiqQF9ypijm1gXVg6YcPKIb4ncc=
=CfDC
-----END PGP SIGNATURE-----

--OZkY3AIuv2LYvjdk--
