Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 163BF6CF28C
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Mar 2023 20:56:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbjC2S4Z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Mar 2023 14:56:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjC2S4Z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Mar 2023 14:56:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9F505596;
        Wed, 29 Mar 2023 11:56:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 44D5061DFD;
        Wed, 29 Mar 2023 18:56:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3C43C433EF;
        Wed, 29 Mar 2023 18:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680116183;
        bh=HXlnVpI10yQIlEcYw/mudHsZ3gXy/LNv7OlOgGzlvCo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=r/n82JskLDsHJbUZu12GBUcu2gGix2fz4sd2X2x8w3ULvNZQRqKRpbDq0nlKOJgVV
         BBrwo8WjpC/zMHLgNhVvCBGtBG5mV7oWgpmplQXpiPR9zlnsHWhlnNneFZ/mYSB5LP
         kCfgzLip3XW8d9ePuehIM2ksgOtZ/LLKhP7SWZE+FsbxvUnaNX74tv72hDFyw+jjOk
         AkDF2qFdpm7Osm8uWaycdhOOwMnuxCYFTTVkEYHctB9rbTmtDpDg38HCHwAlONSXpG
         X4R19AIXsE0RhmcqGR4V7nt6mc9RygRaC0fi+9XUnbRh2FpmlmhWr6dETstzqk9AGe
         /e7iHwpTArQ5A==
Date:   Wed, 29 Mar 2023 20:56:17 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Qii Wang <qii.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-i2c@vger.kernel.org, chrome-platform@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-actions@lists.infradead.org
Subject: Re: [PATCH 5/5] i2c: synquacer: mark OF related data as maybe unused
Message-ID: <ZCSJ0WL3qAPOSCfW@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Qii Wang <qii.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>, linux-i2c@vger.kernel.org,
        chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-actions@lists.infradead.org
References: <20230311111658.251951-1-krzysztof.kozlowski@linaro.org>
 <20230311111658.251951-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wsPfoFfi6QwaQ03k"
Content-Disposition: inline
In-Reply-To: <20230311111658.251951-5-krzysztof.kozlowski@linaro.org>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wsPfoFfi6QwaQ03k
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 11, 2023 at 12:16:58PM +0100, Krzysztof Kozlowski wrote:
> The driver can be compile tested with !CONFIG_OF making certain data
> unused:
>=20
>   drivers/i2c/busses/i2c-synquacer.c:632:34: error: =E2=80=98synquacer_i2=
c_dt_ids=E2=80=99 defined but not used [-Werror=3Dunused-const-variable=3D]
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied to for-next, thanks!


--wsPfoFfi6QwaQ03k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQkic0ACgkQFA3kzBSg
KbaUqA//SXKPTQPt3ontC5GZ3AJxvRMP8lq7ZRcBKhzmpMscUAWUAKevZaX8TyIr
oclg1mI+fV2fSttmp3tTN/Wvwh0rh3XKwFQKOQxg4QSQ5+hbDVEMM6oVEHuEWIcC
qPC82bB5uPuyHIEjODENEVlv1918Vfovu+pr9ubFCnIJNR5FIFEyir80CoSCT+a4
LTRldEcdnpZtNZ6FT8VHEnjIEAlEtNlXywmaF3MhJYHwWXM+pvz9w7W04gBpHkUp
VF2EgQmOglALnYi2sb8lXh3OH/Y8RoeWqZmAv6Mb2rxYiA6VCd9xAjFnNbA0zmNF
UNC/lhKzkCvRT1B7TxHep89KaIic0LclyNRmQiHbCrv9GIGdsESLi7efzJMTVhst
QvLVcjpAr42mYRQ6usrZFKFcyQvsZENStfZgMcZwz85dpt78UNowMXudBflg2YQl
LNBFMh1GruspQ/3NhG+xHyt5T4G6w22XBHivcOpOga6LIp9qSskv01nf0iDmvrwM
QKouUwsKFN9cSojtKwRHX0rKmyAJlVjdZq1JAlSHBR9Pfqa8UrLO0XLgxV9FpiA8
fuM3sSMIh2iswPQLyR/wIWotpfgQumP1dE8ePZeypQ3XPDvTpFfuJ4YUJ2jLaX3Y
PLILL559KYCpGgw/53UPdWTdyMp3JAofEL0Bwsqc7VVuqTLgYTU=
=TgSi
-----END PGP SIGNATURE-----

--wsPfoFfi6QwaQ03k--
