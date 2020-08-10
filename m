Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C48DB24045F
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Aug 2020 11:58:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbgHJJ6B (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Aug 2020 05:58:01 -0400
Received: from www.zeus03.de ([194.117.254.33]:57346 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726304AbgHJJ6B (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 10 Aug 2020 05:58:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=7lCaBRXk61rA3UjjaLLBA++an+NK
        H2RZs6vnZmpSXtU=; b=K7rXlZe7vn4lOGpPdFVTaNnLk4rNXomNG8IBObFfbPlQ
        eedE99r9EV1acngfzxIrVb8DczAGb7CONL+5v+t0UzP+lp5vB46izun0BVVBAJMJ
        rHxRjLsU8090EzzLzy7XoDaC/QHRjWxMCSisA9IPPV3MIVKqaur95LfzTOJMFLc=
Received: (qmail 245753 invoked from network); 10 Aug 2020 11:57:59 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Aug 2020 11:57:59 +0200
X-UD-Smtp-Session: l3s3148p1@PhtV/YKsZIwgAwDPXwSPAL7JJknG4hOy
Date:   Mon, 10 Aug 2020 11:57:59 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Daniel Stodden <daniel.stodden@gmail.com>
Subject: Re: [PATCH i2c-tools v2] i2ctransfer: add support for I2C_M_RECV_LEN
Message-ID: <20200810095759.GH1290@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org,
        Daniel Stodden <daniel.stodden@gmail.com>
References: <20200805221033.9136-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ik0NlRzMGhMnxrMX"
Content-Disposition: inline
In-Reply-To: <20200805221033.9136-1-wsa+renesas@sang-engineering.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ik0NlRzMGhMnxrMX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 06, 2020 at 12:10:33AM +0200, Wolfram Sang wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to master.


--ik0NlRzMGhMnxrMX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8xGicACgkQFA3kzBSg
KbZS3w//ZxrkJHYiirbRM5tUjJO99ILazrLdIumk6uLtCNO9MhZvWTu2xxvOgRAZ
pfnTtCO2uCIkVPUnVJnzl0CfJU/C88TRadSkZ56SADaZtWqFIpLVJXedk/1gnZJU
65zUq95cCC/vEM4f+OeOrgPha5qa6v9b0xEjRht9sUl9BYzcvXDJECFgBA0HMpzJ
DhSMYtg+BwZ/VI0gFnbcv7ZVtF2qxnRDvLyVlapBksN7dXZgk2fqeZoXRB3dimjK
QUIq3dpSXpPJx2O9ZXg8okGVnEXo8KmqaNXMjpbjKGt7GawN0p/rgQKje1c7ULZd
QsDfgh/s6wgbpb182JB5mNueGEwbGb1WWTNK5PxMdmFBOhhXZ4UyXUJPJJkLfFI0
k1ZHONyKGAt4jFnQ+VL1ctRTwjvMTa7XGEh+gq1IOG9ZXLt8LTAELYrDPzg7caOS
FmUNqoicqgqqpgWKT4P9UIFWkCAilO/f4ZxJEK4MRIKwPdaw15+bvnxmTsuh749U
vuCM6XIr5jHaH81gRrypWQEW1rbal9Blj6BngOQzqsO7CXv2yJwRf9zPLm30sd5j
57mXyxPhkqe+ee8UZHoe51vl4eH+v0avDT8XYDz9Ht3cd7/GmPxcuYZJoKDYVwqM
PGjYenzo2i0FEZyHvbO0JFdHgP+4u+iWIH2DRMgR88SipnGxd+E=
=M14/
-----END PGP SIGNATURE-----

--ik0NlRzMGhMnxrMX--
