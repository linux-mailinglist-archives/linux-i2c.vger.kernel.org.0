Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 851807DAE21
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Oct 2023 21:04:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230239AbjJ2UE3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 29 Oct 2023 16:04:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbjJ2UE2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 29 Oct 2023 16:04:28 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 293E7C0
        for <linux-i2c@vger.kernel.org>; Sun, 29 Oct 2023 13:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=date:from:to:cc:subject:message-id
        :references:mime-version:content-type:in-reply-to; s=k1; bh=TwHK
        +0TEdqGdc5LUmitRS4VVDWpLZQ4S7DAZO1sdpFU=; b=FOqlnEixn52OUlb8sedF
        B7a+AInJIGr4u9tQOzAY5Vr0qiaNqDnzRuYXKCwVNt7QVshjnQCSgaJMgJFm64ok
        NVdZ6g3Vqg6T6/0rxUcqDZaHFg3YSaF6wymw5HJ9nK7YnXTmIjormlzRGQlSS9os
        eTBh6/A8WKv7GCdcsDJkSRvhF6G1jcw5MDBflo6Ix133236MOGSUTg4A7RRb/wwi
        UX+I3tlCHA8yTRgb6zBCFCc4LB0Uj1yvA5jU1tU3dlySuApf3mKRWo5L9GSz+2UW
        AHZGoUr98I6f9qib7xDgDXMAuqpog7kWEjJP5Eolo1e3JmmMz14feAKZUIag75V4
        Xg==
Received: (qmail 3895427 invoked from network); 29 Oct 2023 21:04:24 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Oct 2023 21:04:24 +0100
X-UD-Smtp-Session: l3s3148p1@lOWQbeAI8JBehhre
Date:   Sun, 29 Oct 2023 21:04:23 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] Documentation: i2c: add fault code for not
 supporting 10 bit addresses
Message-ID: <ZT66x18kb9HxeOuR@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20231029194143.22512-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wHtGf4yi1nZHgJbN"
Content-Disposition: inline
In-Reply-To: <20231029194143.22512-1-wsa+renesas@sang-engineering.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wHtGf4yi1nZHgJbN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 29, 2023 at 08:41:43PM +0100, Wolfram Sang wrote:
> Document the specific fault code when 10 bit addresses cannot be
> supported. It is used for years, only the documentation slipped through
> the cracks.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--wHtGf4yi1nZHgJbN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmU+usMACgkQFA3kzBSg
KbYoxw/+LJ0T/BTHMv3+u+eLdpP2cH4OfoCGaqeSm8cQiyRECGSXKxV4FSkTavd+
wPckghaoiEvBapMRtjYZgm8S7R3AUghD/ZfP45Gtn0U5O2eRXzQDHmXV7Ai68tea
g1pdZg2jBMml6mZXl61SBawl4Vpiy6periDHYPJep8FbuP0PA3S48RmmybVCfKYc
r07SLma6yWZjJpioQCNL3APl+ks9L+Ri+7gSqRkbX1x6/uZIeTf4rp7vi0mDApzu
tPJ3YiqHk0XAXldSMz1piTA/Wr9aY728YpqeVIsF0VIYc9o8C7dE9v2Aa6AdqiXT
k82SmLKKI2Ucc/3DqkOVptNez+E6kLwlEBXKyinLgPmviYhheqlojoLM4EVWPt/E
gWMrKMTBGL4uweLl9s2eFzQF3XKa9SHntDfOlvXdv/eVO+5CzdIOksCvYsA9judB
8QLNeeaX8z4K2IaOxk3PRQt3jI3GUjD1MDKStmQWTC5AJM5rtK5+kgux6Sa46q3f
xIx+pu+MpNPXHsHhjoFovDZ3dZ6NQ4yB3uVNEbRfM4D2Ur/wKM1sFYGb8zjeJnyS
0j/3b6ETnS5uX2F+3H5p17H/70hkrD49zgWJEMLZ55B7//KKAA928jipKJWNSKJR
kGRiaHNoF28kb3kapQADJZQlQFQH49Tl5aZRVEKiCe7M1umr1eo=
=VEle
-----END PGP SIGNATURE-----

--wHtGf4yi1nZHgJbN--
