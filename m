Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77D582977F8
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Oct 2020 22:02:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755042AbgJWUCk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Oct 2020 16:02:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:39616 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750752AbgJWUCk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 23 Oct 2020 16:02:40 -0400
Received: from localhost (p5b35db11.dip0.t-ipconnect.de [91.53.219.17])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5C6F920FC3;
        Fri, 23 Oct 2020 20:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603483359;
        bh=hDOEzAxi95sem2PmS9KZVDmchKA6xtzm/88DXdUooiw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FwezQFVQVyDr5A2On7/Xianed48bAS8BClnsEKjQEF5rFTdB9bUDAX6dKigGf5+nf
         O1HXQYVc63Ei0vCbEEJLiEdAjto/zryJzDpjbX3j/y/gi9DjHDpww6Ffgd4jFETEaq
         WlepcR46MPw5EswUs8/ag1N8myRCHuScU/nqODuM=
Date:   Fri, 23 Oct 2020 22:02:35 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-pm@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-serial@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: More whitespace clean-ups in schema files
Message-ID: <20201023200235.GA4473@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-pm@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-serial@vger.kernel.org, linux-usb@vger.kernel.org
References: <20201023192258.3126047-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline
In-Reply-To: <20201023192258.3126047-1-robh@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2020 at 02:22:58PM -0500, Rob Herring wrote:
> Clean-up incorrect indentation, extra spaces, and missing EOF newline in
> schema files. Most of the clean-ups are for list indentation which
> should always be 2 spaces more than the preceding keyword.
>=20
> Found with yamllint (now integrated into the checks).
>=20
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-i2c@vger.kernel.org
> Cc: linux-iio@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Cc: linux-mmc@vger.kernel.org
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-serial@vger.kernel.org
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Wolfram Sang <wsa@kernel.org> # for I2C


--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl+TNtcACgkQFA3kzBSg
KbZOdBAAkqpJEFfYvRRb1SGSzO/gUrubqUMa8fIlI3uJkjT7IeUC5fnw0hLY1MxJ
Cbfd4NNRvkk6E9yKwFo8kApquTQGdGpwcO9r0CiBa7hkbQgUbDKVvtBmjGSslFWs
0j0Vo+YnXMNHy5/Wm1f9ZJLUUiE+VZgFJcq4A4Vu4caF03uI0DUINEIYkllpitlB
2df2t4pMA5Hzy9BXd2LvhDIDp1CkyWqQ8gXiQ39xE3IzqU6PHe5g9nb0d2HH41Jf
qdI7CqNt+W1d20gSUA6xr2LesbmR0ZxdJ2Vhl99IiUR3VLXWvq4nuF3Y+12pYZoW
DJNroSrxWH8330Lhgqz/KWtZ/6XThDblaU0vXoP5svYMsCfaobu+g6mgRFCzVBRB
YFhUS0I8Vl5IxMWXjodFn2QtX8Ojc4Ip3DchF4Q2fYqkU8JGm1viFZb7OyCzMCok
1eBcR34Ba2ssrW98znmk7am1PSWWp8/X4odPTQBGamLSeq3iYKSZCCUPnTvR4RJu
4C19OWsUy3ILh65y/6CquGIbEVQP+HtACQlEU3JWsBSPfT+wfdazF8sZkTo1keoZ
tQxJw0DPlBMo5id9L9vahqoV8J7pncnzOonWyFr0AgHQ3V9DJV1ggVC/qD0rXEyx
jrzs0Ye/zKGIorZ8jxV6ggh/XpRNjEgM1g/5l+LT1mb7cY593Ao=
=P6je
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--
