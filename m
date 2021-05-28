Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FD2E393FCF
	for <lists+linux-i2c@lfdr.de>; Fri, 28 May 2021 11:23:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234520AbhE1JYn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 May 2021 05:24:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:50940 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230205AbhE1JYn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 May 2021 05:24:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 57F896127A;
        Fri, 28 May 2021 09:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622193789;
        bh=MjONBw7wRUJTyBcaMGUBEu7fsH8mQc/WqqIXCP5czV8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ddzvog6ftfvS2jFuWUTZJrqBMCMsIQ5RnXMAX6ZXWdl51PumQv/6ac+tiArzNG1D0
         9bwz/Dl/oOt8qKaRnVbtm6zy66cgCK0aC9YH5Ms8IM1H8gWpKWiCimtYDl/oING8zw
         pRaZkn2OymFwpH7QTMdutQlXEalGJ8+iJFbnStSY+Ry72u40qrQHwjYLiyBICaca7s
         /HvE8CuONVPdZw+e33Iu1yxoQ8WamgS7EAsoH+GIHTlCezJh2sJcXLJhZrrPXBLBKV
         AycmSI+1TlaZurn+JlgyFmZXQL4UKAhsLnIfQvKHkF3zTIRGtAcsRefW2Bsi0huYZ8
         QQCx8meKaYA6A==
Date:   Fri, 28 May 2021 11:23:06 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        devicetree@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
        Rob Herring <robh+dt@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com,
        Florian Fainelli <f.fainelli@gmail.com>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Scott Branden <sbranden@broadcom.com>
Subject: Re: [PATCH] dt-bindings: i2c: brcm,iproc-i2c: convert to the
 json-schema
Message-ID: <YLC2en7Mj7kurlCd@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        devicetree@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
        Rob Herring <robh+dt@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com,
        Florian Fainelli <f.fainelli@gmail.com>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Scott Branden <sbranden@broadcom.com>
References: <20210512160750.15183-1-zajec5@gmail.com>
 <1620844516.523024.204087.nullmailer@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="sU1nzSdQCIUU5nt7"
Content-Disposition: inline
In-Reply-To: <1620844516.523024.204087.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--sU1nzSdQCIUU5nt7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rob,

> My bot found errors running 'make DT_CHECKER_FLAGS=3D-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>=20
> yamllint warnings/errors:
>=20
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/i2c/brcm,iproc-i2c.example.dt.yaml:0:0:=
 /example-0/i2c@18008000/wm8750@1a: failed to match any schema with compati=
ble: ['wlf,wm8750']

A generic question:

So sound/wm8750.txt was not converted yet. However, if this conversion
is fine otherwise, I'd vote to apply it nonetheless because it is one
conversion less to do then. Alternatively, we could change the example
to include a simple EEPROM which has an already converted binding doc.

What is the procedure here?

All the best and thanks for your work!

   Wolfram


--sU1nzSdQCIUU5nt7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCwtnYACgkQFA3kzBSg
KbY50g//Z/96gKh+DxM8IicUGujbkEgNAgF6V5iKIFkGtFN83AvfB1uoCcF1vGts
oSnOdiyYqtFbQi+6rWYqsApEYwywKBdeLNOLvFHMgC9dvbl+pw6Q0URFsl7IvXab
RWIJFv5FakRdGLRHqE0i2zWkKFjxzuyj32inqpx2HXHF2tQ4UpZnH11lD/oIJqul
WKG+5fuWNVwjd8hqTca+3fQNyZzOlPyk815JNR5ZUVd3vZ5U+IymIQBc9q0KudgQ
K5GfP85dVk28vMxzuM5eih6hnCmkaD1WCKeclroesPFIbLnm4LhUANLpMn/lIaEZ
pfAQoi5NBciVG65up8vFJ6onGBCGh+TsEn05djsJjO2y2qRzpAlz/sGEb/UpyegM
ZhzSQmvOLn5Ic3PRqCM0ZzGj2UgIglo+rb6wP34j3j4TlTPqpOEsu+hGHuou9+7p
kP5T9APqYxFmtW/5RHQVxnEjxVxt+7jxSHrfNuVj+iJOiS6epcIWzo28RXna/Cei
h+Yf03aRWCIx6B64VO6921qJzgROcSgpSSS62EB2xFHHrpzjGzHOLuf58eukjGyb
NbekCRn6ttQrRAdbxXfnGWX+egDLpvxMKvHPbbFqBtHqZRhLOr47LcO/3/PHEs++
lBLL+2fqKn0VsvGrPhi6U/pOghA27HdmOJ7jrkj6bGyb1gpFCSE=
=Ylob
-----END PGP SIGNATURE-----

--sU1nzSdQCIUU5nt7--
