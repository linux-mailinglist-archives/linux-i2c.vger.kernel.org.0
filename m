Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2CCC358EF2
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Apr 2021 23:04:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232345AbhDHVFC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Apr 2021 17:05:02 -0400
Received: from www.zeus03.de ([194.117.254.33]:40076 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232091AbhDHVFC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 8 Apr 2021 17:05:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=ovBeahlRqKjMMHa59CW1uGJ6EkEk
        GylxsFWpV1E+xgM=; b=bzCg8J0rfS5C3EGZGSHtcMF7vY1D8cZefdRwrXEUThIl
        55GFy3x6m8AhZYKdlA0qPxeBfKcgJgvECN+BgduNo1ahDsWGa/4eb8uTTtq7eB7R
        icE9nNZW+LYkyTQLqxGIptkT/y0qqJg4cc+C31izaBChOWX9Cy/tqREuKygxTK4=
Received: (qmail 3540080 invoked from network); 8 Apr 2021 23:04:48 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Apr 2021 23:04:48 +0200
X-UD-Smtp-Session: l3s3148p1@17TPZXy/wKogAwDPXwtCANgT45yqa4/R
Date:   Thu, 8 Apr 2021 23:04:48 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Sergey Shtylyov <s.shtylyov@omprussia.ru>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: rcar: add IRQ check
Message-ID: <20210408210448.GG1900@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Sergey Shtylyov <s.shtylyov@omprussia.ru>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <8a05ea84-28e6-4d76-4f6d-55fb0a0cdf24@omprussia.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="TdkiTnkLhLQllcMS"
Content-Disposition: inline
In-Reply-To: <8a05ea84-28e6-4d76-4f6d-55fb0a0cdf24@omprussia.ru>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--TdkiTnkLhLQllcMS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +	priv->irq = ret = platform_get_irq(pdev, 0);

Please no double assignments. Otherwise good catch!


--TdkiTnkLhLQllcMS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBvb/AACgkQFA3kzBSg
KbYeUxAApaiJNsj/Gs9lB/s1DS98QnR7+WABdfZ5z+0HQhWgr4+EJmN1mMhs0NRB
jh7Vy+x+db20nhX+mXAAaCXVyN0M/NcVoIawrJr4GVX68PnY+Vuc5J9lMvm/8tQq
isMg11utO6Xo8BZX2K393V3d5SrziL+LZWYh7G5gWImRJNGs1wf0rmZcRoflsw5S
AnnfV/2yIZuWSgdfhW0dE9L0OzqSXX7Rcjbjhb7jY/hSooNWLVJ/+ZzmklgKFFJV
l9y+7ttSG/hFmSLk7CbLWItzVmxsMX9Bw0r7Pw8HjNk3znDo5xfhXcYN3BJSrkdZ
+v8+wyiSe3NqapA/S4A3RAkk3nNBcq4UnV90SPsREJ6IwdHb+bcY+1XPUmv82pbf
3RSUE6/FsNAJBECbR/YxPIe2beo5cAHK8k5kK6j3JCu7qu5r3t00ne0D7UNtSBYH
5sTxzTi+4MfVr8Y5UTf/qBz3YCBaiRZS9iNOQoGio8XO2bVcUFqrCMIVu4f8HCv9
O4q3ViL1XtePhOJZxSpl18aq76dABa3T3zJQv+Tf71ZYe2J1uKqCeRA5XamB8x6n
YWr+D326xntFvy1r0alIWYtkRVg4D6fZ2M5SyO/oQUSH++o0CnOCBIKgXYZ6lmQQ
AGDEBhpvK/+7lertGGZn8qSJWsRXtFg7LwUDF3TV82TPSX7ZjNE=
=pivQ
-----END PGP SIGNATURE-----

--TdkiTnkLhLQllcMS--
