Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9992394767
	for <lists+linux-i2c@lfdr.de>; Fri, 28 May 2021 21:07:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbhE1TJH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 May 2021 15:09:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:33556 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229476AbhE1TJG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 May 2021 15:09:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD39C613E3;
        Fri, 28 May 2021 19:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622228851;
        bh=EvJaQnsE54Pm3sp3U27wVRm/L17tzpO62n58JVOjOhQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qqLUp7FrsSj/FiyZpnTGYU55Phj/G+FIi+Zk0qMAG1WNWmCNeIpf3RXyJfLVUrWlp
         FjRyCgJuHbv4Yy06gy1pTJu+HonZud9PBE9jUt6+yIdJITw4Bs3wnli7cdTFfpgYaE
         lVHZ6P02h28t5HQGnq2k5lWXg4b2493rTBlJv2QR7Qyh2fBI7ADfkv/eoayWYaNDuq
         3Wt0/kp7WoO08Qu2zgLwK9K5h79vnK1PMdweVapkNXEAaj+u9SqJa+9w0u6lpzsPl9
         F0E8iBzKtrfzF3RNazx4YW7WO5OD0UJaujv3spzk2kD96wcPjGLGEIIrq9p4gFVpGM
         g+oGem3s1lmsA==
Date:   Fri, 28 May 2021 21:07:28 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Hsin-Yi Wang <hsinyi@chromium.org>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Jean Delvare <khali@linux-fr.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v21 RESEND 3/4] i2c: mediatek: mt65xx: add optional
 vbus-supply
Message-ID: <YLE/cNRatNpf1uR1@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Jean Delvare <khali@linux-fr.org>, Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Arnd Bergmann <arnd@arndb.de>
References: <20210527075556.1709140-1-hsinyi@chromium.org>
 <20210527075556.1709140-4-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZcRFboOTKi9zYWgv"
Content-Disposition: inline
In-Reply-To: <20210527075556.1709140-4-hsinyi@chromium.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ZcRFboOTKi9zYWgv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 27, 2021 at 03:55:55PM +0800, Hsin-Yi Wang wrote:
> Add vbus-supply which provides power to SCL/SDA. Pass this regulator
> into core so it can be turned on/off for low power mode support.
>=20
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: Qii Wang <qii.wang@mediatek.com>

Applied to for-next, thanks!


--ZcRFboOTKi9zYWgv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCxP3AACgkQFA3kzBSg
KbbR1BAAhMpP42PeKOxHKScLjKzIM0yOV39wri2or4/lcv914rXi2+dcuYiNRML4
ktR1lAM9gOkghRGA+on+b3PQ3WN+N2HTH2IDlqXWF/NqDq35i6L1tDPXd5IUaP51
SVE0a6c+SHnTUKcDlCBvQxb17ra2NsR/m6TCMlUXHRoRZZQsiNkEqaxdnPjsFqbj
x/aLPmYmU3GohfEWEorfeLeZQjLGNmccAx67ATHvWjWgykdmLrSBH/4u3aEIXukH
XAPO5kuv5DbiKP5aQdu410hy0IEtS+GKM4eKb6YIK1EtxSgkxJVTzv+9rUqWglP7
nLtPEvqMrfJBs+sPhrIgE6auP7bG0OFNTmQjJpksv05XC3eboZpGJPwF5KjX/gzo
hZbTTrJPmLsMB3MN1oe3rzvA8MLrAdNbQ2O/uK29oVUzzNgcvZx59550DyIbIlz2
XL5zQNOqfKn1SrUzEalpFZReSu50PuYBS3qyBz6l+7eImXjDdF1c6083emLud72u
hIvrqDiYk9FzurLOnHlNCPrgKywZNwrFC2mpR4fZB8ehulIYr9x7Nieqfh9q8kbx
+06xFT7CDOQaqDSoNp3GCLW+LZJm5pwv3ggloS0DKl+yRexIV0klVFGN9AIiBhol
1bSigQvY6GhuI1lDVCQyEl45nDeO0xcltKgd4IvuBKOlJbsUI7U=
=4N0s
-----END PGP SIGNATURE-----

--ZcRFboOTKi9zYWgv--
