Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8A491AF52E
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Apr 2020 23:39:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728097AbgDRVj2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 18 Apr 2020 17:39:28 -0400
Received: from sauhun.de ([88.99.104.3]:50678 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726734AbgDRVj2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 18 Apr 2020 17:39:28 -0400
Received: from localhost (p5486CFBC.dip0.t-ipconnect.de [84.134.207.188])
        by pokefinder.org (Postfix) with ESMTPSA id 4BBE22C1FB0;
        Sat, 18 Apr 2020 23:39:26 +0200 (CEST)
Date:   Sat, 18 Apr 2020 23:39:26 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     vkoul@kernel.org, robert.foss@linaro.org,
        bjorn.andersson@linaro.org, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Todor Tomov <todor.tomov@linaro.org>
Subject: Re: [PATCH v7 2/3] dt-bindings: i2c: Add binding for Qualcomm CCI
 I2C controller
Message-ID: <20200418213925.GC1293@ninjato>
References: <1586248382-9058-1-git-send-email-loic.poulain@linaro.org>
 <1586248382-9058-2-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ncSAzJYg3Aa9+CRW"
Content-Disposition: inline
In-Reply-To: <1586248382-9058-2-git-send-email-loic.poulain@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ncSAzJYg3Aa9+CRW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 07, 2020 at 10:33:01AM +0200, Loic Poulain wrote:
> From: Todor Tomov <todor.tomov@linaro.org>
>=20
> Add DT binding document for Qualcomm Camera Control Interface (CCI)
> I2C controller.
>=20
> Signed-off-by: Todor Tomov <todor.tomov@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Robert Foss <robert.foss@linaro.org>

Applied to for-next, thanks!


--ncSAzJYg3Aa9+CRW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6bc40ACgkQFA3kzBSg
KbYG8hAAlrNfLM9Bem/WQziYeQCLxN1OVvEUO6IQW62jBmrQw2kbGiegDpbMAIRa
sjq1XgPmwGSGTDvBAESYGUeNCM44EQRBhT4v4dSXS6CwoyE/T2o6Gg8CoZk3VnDc
PvOWeN0HJKJPWor1B3ffUZ/63B7xsmPYwNoPRpslpi6gw0ccvMeBjEWVfwkhGFHm
le/5gu/ikEIkSaAK+bddtSwPil7EoCwCfbIq6tW1HWbb5AXfqlh6Fvwya/6fZlGo
623f4ObaoOQk5vBbAlMM3Z4n2xNA26bHgScDArsbz5UMI66zmVrLOdiSQALVjLo6
BG+0VTC3U9j+oWs2modU9ozvleXnHNpvun70THPCqPziHZ/vScC8bgBAbj4p43j6
VA6LIbIitbLr+hz/xflTnMpRGYlZKfPZDrj7MxIscJ9RDNHXK/yNbLY3Ytc+LuHK
FElgtm0j9+2jE3rvTgqI/zk/jtFCdEEzWfNYNEXJs7V4J9o9c1jN+I+QPJ31Cqt0
jWKdYwQkrY9NfyD4HuHpQn9Dvtr8DdzSz35o6Y6bPGxIjik7qbIm6N0m1yUKf50f
0E6DMlBir4mWrT41GquNEJDp3QfH4yBNkEW7nlCx4FaiCL6wasZaXkMn6xgoluqs
os2eeHGP2nnjk1YAv7vpD68goW4cn/zc09HV44bmPd/vNQk83Z8=
=J3+f
-----END PGP SIGNATURE-----

--ncSAzJYg3Aa9+CRW--
