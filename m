Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C70C393698
	for <lists+linux-i2c@lfdr.de>; Thu, 27 May 2021 21:47:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235731AbhE0Tsh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 May 2021 15:48:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:58080 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235348AbhE0Tsh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 27 May 2021 15:48:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 48F606124C;
        Thu, 27 May 2021 19:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622144823;
        bh=7TxnJJnNtwAUGZlPXh3fsE0Uo6KwnuA5yZH8z0w+sjU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p9SqVy1QqWu0JV2zeKQ/gJlaS7FOcPgVN11Mx+qq+SpXvUCCTUU/QAo2svWSZr2Bd
         Chdw9cls7OUGp3k6MZawfXS5M2NltR+SbS4QgBiaoDnRyvHoeNexjCzkWMkdIUc+Mb
         vLabP1cXff/fLaFxHCFqfWA48zDMTuTruccKdpAEC5Aoo7w+WJzrygsc2L6cnKTi7j
         KQUpOnADIsvR6JJMxJ7RjpK7azQLK6TsacwPFPSkoULJLgjvbTtzqfzVc55pYwf86F
         OyOo8UkD+7bnaGzJj/qA9jw1eUy4LoPSThi6pcTwFByZ6XSwEl5zo64WUWWCtes17h
         vHcJf5UnfmJBw==
Date:   Thu, 27 May 2021 21:46:59 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Zev Weiss <zev@bewilderbeest.net>
Cc:     Brendan Higgins <brendanhiggins@google.com>,
        Joel Stanley <joel@jms.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Andrew Jeffery <andrew@aj.id.au>, linux-i2c@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: aspeed: disable additional device addresses on
 ast2[56]xx
Message-ID: <YK/3M94uwuLQNwbz@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Zev Weiss <zev@bewilderbeest.net>,
        Brendan Higgins <brendanhiggins@google.com>,
        Joel Stanley <joel@jms.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Andrew Jeffery <andrew@aj.id.au>, linux-i2c@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20210506205419.26294-1-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="JB9G8qcO/AQ7ihJy"
Content-Disposition: inline
In-Reply-To: <20210506205419.26294-1-zev@bewilderbeest.net>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--JB9G8qcO/AQ7ihJy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 06, 2021 at 03:54:19PM -0500, Zev Weiss wrote:
> The ast25xx and ast26xx have, respectively, two and three configurable
> slave device addresses to the ast24xx's one.  We only support using
> one at a time, but the others may come up in an indeterminate state
> depending on hardware/bootloader behavior, so we need to make sure we
> disable them so as to avoid ending up with phantom devices on the bus.
>=20
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>

Applied to for-next, thanks!


--JB9G8qcO/AQ7ihJy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCv9zMACgkQFA3kzBSg
KbYoaw/+K6TmK5yofJdaPXVDzkuK9GycZAqgbQp7fiCMVeCJi9sp4sZfOC/qJHDl
i+d/1nqKttII/RjpHvzcQDnzXK7Mx/KaolUoQGIRRUoXI5PT2Rsc1qjOGxswicee
ncF/nG2SKuKQoiFfEchL9/OWsKn8JysNhrGRsBpK8S2bINXajAHf/3NHSuIB8hT8
LHdFtx+P5yRB2t7NLwGx1OTv5keCUEpzVnuzYcYdvfwUcbcLgSaybvDmkjyx/LHv
xwFBvls6D24yd526D5kOfedxA2zZPnxfS5vYSnfL4Qsek21QSK28PuOtF4bbNHwp
wBddF4z3Ba1ZCmXp93FsH7HmzzB9X2gnQhOaK1lyf0Qd7UL1qJXsWoN0D38VAzG8
pvxotK7zbPcLU+9Jfu7I6p37ff64MVz66+nblGDjttSR767uic7jlL/Hgyim8V16
HeT5nrjHjJW7jeTLsDz8UZU3xzGNmZzpRTWreNm+TBJl9Kv7gPR5j1z3Z5cQ5jf8
MstxERJwFnMBlb1ma5PrQm7iyddy3cKyp+jKic0adN/tLwtl9mfwi/tQgEjsCw9m
O6AcGxtfwIFeysjtgI0DjZUo+IQii/o9CcUPmFu4xsOZSsWwISFimP+LwVZDx6MM
bgATzrQ0pKryV+AD4W8TP9XI42w2u7eSW/5NBRjkkJAZ+p5d6Bk=
=dwZ9
-----END PGP SIGNATURE-----

--JB9G8qcO/AQ7ihJy--
