Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D115477EBE
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Dec 2021 22:27:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236975AbhLPV1i (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Dec 2021 16:27:38 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:34322 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236943AbhLPV1i (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Dec 2021 16:27:38 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D4B80B82647;
        Thu, 16 Dec 2021 21:27:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC3ADC36AE2;
        Thu, 16 Dec 2021 21:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639690055;
        bh=pKM53rkOhJMnvKB9zo6bgmg+3fPyM92dkJeoZNFz93w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f/e8s/I1vShbyoIoWFX7pBbXOkYiUUaI5Zm8x665JhFRxft06nKQvjJWtLElBwnKs
         fIO1bH1W2If+CtadgWeZmwcJTa7hRplGTC9X5gc+oWJmOlJ3Ky+5y3C4SjRdYJo/aW
         1YcPtLHI8S77lQEWocICVY07uZUqqrO06djZNNyd2OKiftS097jQr+puTlvljspzUe
         GqrYhNGpXKgMHhQb1beA54ij921KXe0+KAHb2j2yw+lYzerfqA/6Yvhx6nMeTvovmq
         fSP/P2DQb8UeIvWtwCbFsvnL5+F8j2xLTGEngK/qGSs51FdgHQMykerY8gtUJ4iFRh
         w8Gq4qqOHe00w==
Date:   Thu, 16 Dec 2021 22:27:32 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Rayn Chen <rayn_chen@aspeedtech.com>,
        devicetree@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: aspeed: Drop stray '#interrupt-cells'
Message-ID: <YbuvRPcjRY5Y06vi@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
        Rayn Chen <rayn_chen@aspeedtech.com>, devicetree@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
References: <20211206174237.2298580-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="l5K4g4+9dpQAuWMg"
Content-Disposition: inline
In-Reply-To: <20211206174237.2298580-1-robh@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--l5K4g4+9dpQAuWMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 06, 2021 at 11:42:37AM -0600, Rob Herring wrote:
> '#interrupt-cells' is not documented which causes a warning when
> 'unevaluatedProperties' is implemented. Unless the I2C controller is
> also an interrupt controller, '#interrupt-cells' is not valid. This
> doesn't appear to be the case from the driver, so just remove it from
> the example.
>=20
> Cc: Brendan Higgins <brendanhiggins@google.com>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Rayn Chen <rayn_chen@aspeedtech.com>
> Cc: linux-i2c@vger.kernel.org
> Cc: openbmc@lists.ozlabs.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-aspeed@lists.ozlabs.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Applied to for-next, thanks!


--l5K4g4+9dpQAuWMg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmG7r0QACgkQFA3kzBSg
KbbyQA/7B2deteOtnwmeqCT1aEFkmDE8vuQqAIyP9S/wcEb4Zz5QNq31qsl7O1Sf
PfP8bcD4w3ivIP6nAw/TQN6R2ofiiPKYZxWjZSzhy0E3ZP5/Mvhy1SaBmgEkSgsP
Tnw1FNZzQVtzGaVvaMtgm3EYeyBm1FYXOhgoszGFaHzd8nFYOHvorddDModiCF5N
0phMhilsdI3d6RyI+FHUQITeHmTLFniBc3Kj66d0y4MVBHBc23pMWVUQCnDJfPmj
L5AmHRNCioTs+reOKYdUjTdtv9OsjG+FcLit8hrFnruw35WpUy2zA2ltvsIVhkPx
nTB+2cNUk+YwIx1hGQ6t6fJ299GR6k+Z+89dp7YZrT5g6XQ0TjJX45BMi3Gt7T2d
2noiO3Yhz/zvGs1bu/+4rj9Xzz/JzSqKNpA5K6JC9iKTu9hj/UsZY32OmbLgb11x
MnD2VKqJztDYH8qMFKq6RKKYC/8K/lKO600ir5HFeeWN0tnwTrtFeiNlM/VbVfEk
YA4VBOlxZ4fXiyeBUpP1Fev3RtJaRuAG4ruDxXh9cQCyGpADE6GTtgOfU3q3gl/l
0F9XFkXNqBDr+6iKTJIcW4D64eGIB1QStmknWsd+ZrrznJp179NoylB4NN2oiCoL
zDP3oWkXUNmlMa9e4NORmA4DCqvbAEb+Y9T5UTm0QEax1T//jHM=
=2kfu
-----END PGP SIGNATURE-----

--l5K4g4+9dpQAuWMg--
