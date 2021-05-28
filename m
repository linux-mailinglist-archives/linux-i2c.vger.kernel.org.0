Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 121CC393EEF
	for <lists+linux-i2c@lfdr.de>; Fri, 28 May 2021 10:45:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234853AbhE1Iqs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 May 2021 04:46:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:52390 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229950AbhE1Iqp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 May 2021 04:46:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5AB1F611C9;
        Fri, 28 May 2021 08:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622191511;
        bh=fYFdn5ho2n99MVPxiMhhhKy0DgjzCUHcDvcXXBsKMAo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rD90WhtIzLQqd8GvZeAoEFShBhZWR8gc7anxDpfCHaM0DHHNfbcMtSp/flwUD9VGA
         hQ9kWYK+CX321+68amQtPF7Titq7z233XZ/FAKonkoZMtJwfCEJ7xRPl5GEyNC5C0K
         InPfD96jr2eL4AUZz7yYVQo7nQhDvZvfvALc9GKhta/N2qfxgNTgWomqjJokPVg9er
         nOVTn46db5Z1XAKhwMTvK3LzxqZMVJG4CEmVXvOQ63gW8q5GsLFdPFF0IDFY94/ZEn
         Y/uVBwj43l1Lct4IVX+nEGp49d+hsjKrx+VtKAZxHyV3GGyELKUAWJhKFNUeeFBn0k
         011NFAS0eu7JQ==
Date:   Fri, 28 May 2021 10:45:08 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Lee Jones <lee.jones@linaro.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 0/6] dt-bindings: Convert mux bindings to schema
Message-ID: <YLCtlG7covuCWbC4@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Lee Jones <lee.jones@linaro.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-i2c@vger.kernel.org
References: <20210526184839.2937899-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="YXYTR02+Qna+X+fE"
Content-Disposition: inline
In-Reply-To: <20210526184839.2937899-1-robh@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--YXYTR02+Qna+X+fE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 26, 2021 at 01:48:33PM -0500, Rob Herring wrote:
> This series converts the mux-controller and some i2c mux bindings to DT
> schema. This was a rabbit hole of trying to fix undocumented (by schema)
> compatibles (enabled by setting DT_CHECKER_FLAGS=-m). So this is mux
> bindings, and then a few others that are used in the mux binding
> examples.

So, I assume this should all go via your tree? That would be fine with
me. Maybe Peter has some more comments, but for the procedure, here is
my ack for the I2C parts of this series:

Acked-by: Wolfram Sang <wsa@kernel.org>


--YXYTR02+Qna+X+fE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCwrZMACgkQFA3kzBSg
KbYt8g//Sw66JcxkYVCJKtd/5gih0ig5lS13n8KG59L2DTU0FBQkGRUM4j+FmgFD
FtVbRsL3DI2Wh67F0488tfz8l0osF4CxtAwgS7oBmqrIR4dUkG2iwghRyKRb7ONF
AMuPU84GKO32fBLjb1Vq2R+I/VgXfFeu/SIPsbzX7lOyYsGlSQU2f8TajxTa37xd
HUx9dwfvPnrSqQSEMVLB3BLNzrBRimGcJDmul6bcYhCDh0of2uK1z6z7XHkGBqw/
T/W62//sm9MAfmj60mGaDkFOMfJPzuanwzD9TKTJYBDQ/ZQZse5tnzqAPSFEO8KN
6YJgkhimHg1KhXAydjEFld7FrUqr/upYzUSPv1EloMQp30ZtwOsXQLpNrApGg7R2
JxJx+nrX6S6Vo7wxHYCeL7JE3zadFZXX5BV3ypguP9SEAW+nwe2VjU7GOqPCmiF0
HvJCGrfwwUsgoxP5L2vVBS7SdkOtAtV1duhCNC63J9zjcpD2GzaCYkpQrnrIrsHs
apDb5LwNmOjy2B4wbnM490CgMdnrivEPebkKjHn8G62UGtqZZt1PBxrBG3AQkmnZ
ALMrB0S4sSzgvDBrmHBv+5KLdjMSL3ucS66oyG6R1+iPz6ITT/kefMWcYViL5Kms
NIGG3AgLlGC97ZgdBOCaboFMbt3JRAZm+pj7Ipob6qVb6o2AI9M=
=8rsM
-----END PGP SIGNATURE-----

--YXYTR02+Qna+X+fE--
