Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBAC36CF303
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Mar 2023 21:20:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbjC2TUZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Mar 2023 15:20:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbjC2TUY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Mar 2023 15:20:24 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 653D7CD;
        Wed, 29 Mar 2023 12:20:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id CCFC2CE203F;
        Wed, 29 Mar 2023 19:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D720C433EF;
        Wed, 29 Mar 2023 19:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680117620;
        bh=zxUdS6x70bXxHp+LpWOEwRUsuM0jXMnYbrJmytRDx2c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ANeZTHfskWwHRXECZQ1jalC1ZrldxttXyFMXm4KJ/8lJBtXsBhVCbLj1/DiKiM4Tl
         c4e1HpYmMLaFqL83AJxq1VIs0AS+xjDwUPSgIuRcFEhu1u7pSegHQbJy0PBF7P0paZ
         L3+Lj9du9Aa7Upbx2DzLsV6hLRkdT+NY2P8W/dLcXGFTK4Pa7phPVGbFLA806I8kf5
         5diPmV9PthgjDQZzwpB58Ma5n6I7kNEgO5kkJ0Het7P/9DTsbn5gmCV9HS0cHN6bmY
         ozNJ1+QHJrkLuxF+QltMdCL6DAN/4mDgbYKmePfM+ccwiOoMZ3u+I7i7Hpm0Eu1QpH
         1e7stoN7dqfjA==
Date:   Wed, 29 Mar 2023 21:20:17 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     ye.xingchen@zte.com.cn
Cc:     kdasu.kdev@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        f.fainelli@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: brcmstb: use devm_platform_ioremap_resource_byname()
Message-ID: <ZCSPcaEo5UTNqHsD@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, ye.xingchen@zte.com.cn,
        kdasu.kdev@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        f.fainelli@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <202303211944063761253@zte.com.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="U2prXR+fQOg+6R2M"
Content-Disposition: inline
In-Reply-To: <202303211944063761253@zte.com.cn>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--U2prXR+fQOg+6R2M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 21, 2023 at 07:44:06PM +0800, ye.xingchen@zte.com.cn wrote:
> From: Ye Xingchen <ye.xingchen@zte.com.cn>
>=20
> Convert platform_get_resource_byname(),devm_ioremap_resource() to a single
> call to devm_platform_ioremap_resource_byname(), as this is exactly what
> this function does.
>=20
> Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>

Applied to for-next, thanks!


--U2prXR+fQOg+6R2M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQkj3AACgkQFA3kzBSg
KbY7cw//bgfY6lokYylgDKF+dtqrjhOlMJ5i4I5LnEqB0kvA/H9fmdviRExgNncx
7VjA9fS9/LnfawSos3G/0iizTvwv1NLgEPO1yH/tTapA+iOsE0r7jRSLkzstOkNU
wWHXvbxDHVw5OWi9uTQtP7BXyFyhST6FddO6+tUhtHsdLQDbv2VIiYXBcPE9WM5p
C8TJSPS5Vwe4sbxyRrmVgTxgraa9JkewOd4p+3DALR/hfTuGvOe4NWVuadkJNthN
SaGCb0eDyD0Ukh7HXVSC6CXWvVm+drPwuZ/HojZFpKtukJJanjH4B8FXGU8Hp5L9
atBMDh3mKZ+GLDjCx1DgX4j2Tr6cwglKxuyen18Hkg56OsddWdDdybKn4QxzK4FW
AD6xLDvVKZ4D6IF/lKLt6UhVeFudG1mFPFsULUPABeun7RYCLyt8SL7DQMwI1n2i
ACMCQ5R4yiO1NzgjsvRrGIUNKzGWxxikLIbBvmNiAeREugvLjnAkEfDH0/PCHChx
Ud6SB0WWC3Vquol/mgX4CAhDMcCuo1dutmfJTmt34dt1RHtoAYWWeRaIQ+3tpRdz
EeXeRA3OLTu2/KnrrF/W1Hjy2lPLNn5J+C1cY/HmxrqsronURQGBqklO25AMiGQ1
7nti8AtBYRiCEsPalz2g160walS6DbU2fmnQM1cWddJflck7oDs=
=I62Y
-----END PGP SIGNATURE-----

--U2prXR+fQOg+6R2M--
