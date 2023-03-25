Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A6BD6C90E5
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Mar 2023 22:11:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbjCYVLx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 Mar 2023 17:11:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjCYVLw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 25 Mar 2023 17:11:52 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E048BBAE;
        Sat, 25 Mar 2023 14:11:51 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 30DA61C0AB2; Sat, 25 Mar 2023 22:11:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1679778710;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=xnTqiki8T3iai+PWCcp6RqylatZWC2EbVMPN+OweMAc=;
        b=H4pQaUj23/NDj4KCPyTfxa7KgjIVR2k7rPLzT2q+kVkdYjEjOkhkdFdJ7iYoFDgDRfthk6
        LqBcrN8gRsyvc6uj1Kmvuj9shfv9voK3VAKXfuJC0xQAHKdeF6g7prE0J5FlBRusZEnKRH
        RrVuBd/CeLdWgQLpIjRetioPo9yHezo=
Date:   Sat, 25 Mar 2023 22:11:49 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     matthias.bgg@gmail.com, qii.wang@mediatek.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jassisinghbrar@gmail.com,
        houlong.wei@mediatek.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v1 03/18] arm64: dts: mediatek: mt6795: xperia-m5: Enable
 Frequency Hopping
Message-ID: <ZB9jlTsEb0Clf1zu@duo.ucw.cz>
References: <20230324175456.219954-1-angelogioacchino.delregno@collabora.com>
 <20230324175456.219954-4-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="MWSEsw2ULXAy+rk4"
Content-Disposition: inline
In-Reply-To: <20230324175456.219954-4-angelogioacchino.delregno@collabora.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--MWSEsw2ULXAy+rk4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2023-03-24 18:54:41, AngeloGioacchino Del Regno wrote:
> Enable FHCTL with Spread Spectrum for MAINPLL, MPLL and MSDCPLL
> as found on the downstream kernel for this smartphone.
> Which one to enable, and at what SSC percentage, was found by
> dumping the debugging data from a running downstream kernel and
> checking the downstream code.

What advantages does this have? Lower EMI emissions?

Best regards,
							Pavel
							--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--MWSEsw2ULXAy+rk4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZB9jlQAKCRAw5/Bqldv6
8rUCAJ9aZSUig704fVpSKPDFjNbbTy1qsQCdGQuoDXEUMy/Us5cQaR2yWRfm+/s=
=X9R2
-----END PGP SIGNATURE-----

--MWSEsw2ULXAy+rk4--
