Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF4D66E1289
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Apr 2023 18:41:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230173AbjDMQlH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Apr 2023 12:41:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229647AbjDMQlF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Apr 2023 12:41:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 347E1AD28;
        Thu, 13 Apr 2023 09:40:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BA66D64015;
        Thu, 13 Apr 2023 16:40:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF6EAC433D2;
        Thu, 13 Apr 2023 16:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681404058;
        bh=vGGwL9n4j9XBfhQxXlt7x2mowxQu7Cn68mznFVTPEG4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Q4qbU++oL30gleJ1QlYq4GTotO8Lmvh6YytyVZCcRuR5s3IjDvF3uWhOhIyZLz/Mx
         wNd7acKvpf6+VIvor+hSln8Y4FrVW9d1nIvQnXbfPBQUxMVCBJ+7QO72f7X0wSJRJu
         s7BRD23eXgNPfOlzP0GFAVepvej/hRbj2YUmduUwJOEV2xFb0uTTiS1ZGiYljdi/l7
         YDKnY9pDZEIE6CqO06G9fMrAwli+1ERQOSXOuvSsh2RwjycGzlsV+vIEtDWPJLmdQW
         WCDJh+XnseI+rFyIqP5h0mmKBGBiM9ZGcMr+4Wvg9rxtIpZo/BX+ARRALfPBV1tS72
         8G89xntCCgHyg==
Date:   Thu, 13 Apr 2023 18:40:53 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Daniel Golle <daniel@makrotopia.org>
Cc:     linux-i2c@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sam Shih <sam.shih@mediatek.com>
Subject: Re: [PATCH v3 2/2] i2c: mediatek: add support for MT7981 SoC
Message-ID: <ZDgwlY2kR9CCRV4h@sai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Daniel Golle <daniel@makrotopia.org>, linux-i2c@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sam Shih <sam.shih@mediatek.com>
References: <cover.1680857025.git.daniel@makrotopia.org>
 <7b5c6ba8da51ea6145fb71815a2f65a9e1d341c1.1680857025.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SUToNKZpPJbTqz61"
Content-Disposition: inline
In-Reply-To: <7b5c6ba8da51ea6145fb71815a2f65a9e1d341c1.1680857025.git.daniel@makrotopia.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--SUToNKZpPJbTqz61
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 10, 2023 at 05:19:38PM +0100, Daniel Golle wrote:
> Add support for the I2C units found in the MediaTek MT7981 and MT7988
> SoCs. Just like other recent MediaTek I2C units that also uses v3
> register offsets (which differ from v2 only by OFFSET_SLAVE_ADDR being
> 0x94 instead of 0x4).
>=20
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Applied to for-next, thanks!


--SUToNKZpPJbTqz61
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQ4MJUACgkQFA3kzBSg
KbZdHBAAjyez1DTIsDARrKzP/UbWCGoQjGTYY7501ZMxXITGsLlJbWBUic04H0Bg
lQSbfeGUjbr2hE11zUxTyNN05JfrmaLuyHJzRnIyew3h0c1Hvj60Z6o5C1fPKaCY
SO9Y+q3+vwU93/qitrfsv263+se3N90bjlZy9VBZy8hZqCRkEHRpQtUIoKbqIpds
FVLazo5j/C/dY9J02Hti+Tdc7VcE8BOynIzRFuNVHD3aKFylPsBkYBllO407OSY1
VaPWsz9gYUgssfaRx+b68r+Ao/lT6Dsr/lKuUDXHAUqK6gcSl2X+6L6CKSQgnyZ+
Pfv+kSi/YfZmmiHT2Ym6o1AfO+vBh1tULOqWkkRYrFGy6gnWHxNGqaSUT4qKaJL6
hHfra1uVuk6jiJbJw8AuAQJV2homfAaiy3IBSN//hkmEon5yAlxZaKdpy4ujX6/l
QUR7QmJKDzNiqRnh40OrICT5J8LDJaiMwedvM1Ru4yuAz0qhEnANYLbsdvIHMVfR
QJDP1fX9Pxui8TpZbS3ixThB35WLuz6fG6SntT8jIG6xO636d7LNFhIUVlprHxDn
gUHMePhVPqcKWSAYSApp1qgSwOJRgcWMAiTMDVYVIFmcWgul66ynlVM0613plwco
7wzfMvgh2HtW3vT1iCz0WI7E8AcJkiIIGtCSvfWcSVNw4SJTj70=
=5gZL
-----END PGP SIGNATURE-----

--SUToNKZpPJbTqz61--
