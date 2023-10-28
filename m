Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FC057DA706
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Oct 2023 14:59:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbjJ1M7s (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 28 Oct 2023 08:59:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjJ1M7r (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 28 Oct 2023 08:59:47 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A1F9DE
        for <linux-i2c@vger.kernel.org>; Sat, 28 Oct 2023 05:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=date:from:to:cc:subject:message-id
        :references:mime-version:content-type:in-reply-to; s=k1; bh=X1xe
        cixL3cZMjvquWxqOWvQpLDopZGO2SN97cUPkz+w=; b=FprnfAgSDVIs3zUjfsdX
        PHvJC9E12UDQNt/SgkxiX+VVmMEt0/ef4KxGqqOvTrqFkpGTSOJKGn9nCEO5Ig4o
        KOB2z0PZO4crb1ESk9p1dhz1Z99D3yCkCEK8m8fzJPJco9vnDhn1Z0eyiVdXFFvJ
        LFEpiQWW6u45kZ/eYizY+GFfjvaDh2YSugOdy8tj0SSkumK8PNUHcDVbBCwuhi/r
        7PP3LZA8ymVZ03qksp/ah9+8HZDSz/4k/6mU+VUHATgVePnkrFymtN+8jrsGkD6j
        DVW59GooIaGZ/L8RBG9SZbUgj7UG/IM83N5ogTQFGZar+t+9C1YW/I3wW5moQ0MQ
        rw==
Received: (qmail 3563965 invoked from network); 28 Oct 2023 14:59:43 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Oct 2023 14:59:43 +0200
X-UD-Smtp-Session: l3s3148p1@W5z0YMYI7MJehhre
Date:   Sat, 28 Oct 2023 14:59:43 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add YAML file for i2c-demux-pinctrl
Message-ID: <ZT0Fv9gUGxIMdn89@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20231028122309.9867-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="RZ528d7M7H3zl72w"
Content-Disposition: inline
In-Reply-To: <20231028122309.9867-1-wsa+renesas@sang-engineering.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--RZ528d7M7H3zl72w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 28, 2023 at 02:23:08PM +0200, Wolfram Sang wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--RZ528d7M7H3zl72w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmU9Bb8ACgkQFA3kzBSg
KbYOSw/+LFyVxDxtFLpIw7ZQ/J7YZu/w44A1WkoxtHqOwWMMQaVxUWXxx/IQAIyN
Wb2RKHj4kx7GifZW5gHb54jn7eoqJSDrHFueiez71EHTCz9vMuxtLN7SgpEI6h+P
A9E7BiDmH5TBOPU/qjCn1OGYwh7dkIqiZN47R14TEPL1eGPhavQuRB90Usm/vsxI
W7/dJ26g8MvxeRUC3y4tzamgF2FEbNwvbK4Nj+GRqjv6UuZvUGmv4xPjIzZV6v3h
Z5LQ9Yz1eABVVeFKpbE2Y2tkEVbrySJIvyOfg9BBYb1ZaSc2aMc9NHvcUklFA3Ed
vB0jQwt+IJ5RKLoy9zU2Vg9oGOZUZeznHKb2+K5wKw5BQjhO2tEHaY2G2vnBPb6O
Dj/bNTt2BKeDftXPW/ispsBFkQXELx4raAUjDsHdlePSpG1fY7ImePJBQSoYhCm0
p21BTsRheE31t4bbv3c4oV6v07NQ8BeMBfQRkfr4wGV1vo2buxSOH1YZiDX9BoTF
UCGgNwcvVQAzHoBsMzlOZXnJAl8UYhPEqNv6d3ZpYZEaNQcjk0XVOejEn0HMlFoI
A7hsCXJ7sO1qTaPncCJobRCjzAeiqP68A48pMXlVxcXD1+FarsKgkQ7P+ZW2gf8X
bZpnK1S7HGJo7eQjgkS/s8MNUfDFqfYjwelti8wJEmGmp6O1Nrk=
=gBj5
-----END PGP SIGNATURE-----

--RZ528d7M7H3zl72w--
