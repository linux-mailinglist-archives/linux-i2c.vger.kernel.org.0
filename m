Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12137786204
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Aug 2023 23:15:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236173AbjHWVPT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Aug 2023 17:15:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237089AbjHWVPP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Aug 2023 17:15:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B48C410DB;
        Wed, 23 Aug 2023 14:15:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 44F3862CD7;
        Wed, 23 Aug 2023 21:15:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0F13C433C8;
        Wed, 23 Aug 2023 21:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692825312;
        bh=6p7jWisia7k7c4+ZRFerIEwAGHg0/FJkDBrd7cTx/qg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WMTaLHZB4bfIzzALwIIv/m7YVOK76KFPQR3fFm1M1+WSpR4agkR2l91og18O59kte
         jWbRm+R1RJDwT+DDvJ13WU62xAhBi5RSqZP6JLE03IG2fRes3prW7GFrBZRDNi06DZ
         lceBl/eq7Xfq/IKPOqcjb+rkMLtW1oHW35GZSt99FsJAzTI5wsSNNzZ8K0ATOUWUK9
         TfrZqNfJFjcx4UsMOoEDHhX8pgV7ISz11o4khiEbGZHzDeqe99Fb4WK4ib032woB7d
         Iwe5fEmvCkP17sD78c/LxCKhTqQK4Za1W9JFTVnPt258X0Do9wfqovc+HxlDigWQgu
         S7Bh00xOcqXDg==
Date:   Wed, 23 Aug 2023 23:15:08 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     Peter Rosin <peda@axentia.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        naresh.solanki@9elements.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v15 1/4] dt-bindings: i2c: pca954x: Correct interrupt
 support
Message-ID: <ZOZ23CEnQ+Cus2wh@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Peter Rosin <peda@axentia.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        naresh.solanki@9elements.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230817071056.2125679-1-patrick.rudolph@9elements.com>
 <20230817071056.2125679-2-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="QjWMxxgOvY45Sisu"
Content-Disposition: inline
In-Reply-To: <20230817071056.2125679-2-patrick.rudolph@9elements.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--QjWMxxgOvY45Sisu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 17, 2023 at 09:10:50AM +0200, Patrick Rudolph wrote:
> Only some of the PCA954x compatible ICs have interrupt
> capability, but the binding advertises it on all ICs.
>=20
> Sync the dt-binding with the driver and only advertise it on:
>  - nxp,pca9542
>  - nxp,pca9543
>  - nxp,pca9544
>  - nxp,pca9545
>=20
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied to for-next, thanks!


--QjWMxxgOvY45Sisu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTmdtgACgkQFA3kzBSg
KbYxLRAAnsC8wwFNJ2nR/KwgwG4kknFatlxiMLNPAC9VpbCOTruDmeeQhHSFGkoF
l7jyvKAdCZ4RU2KBtoDCorgFR5LUYwlosPXJR8du51eCTSHs0qSgX7ZPvuAueA7D
uHMEn/uxjywm7rsnXwWFJKtA1hfgZwZ6+J+cZSHdkqUhFDzn3tNdG2xMWiJU42ht
UTCrpkNjjM03VsoFhtevDsxNW05FAI8JYl3Q12NEjNEVXzO7UOIQGQanwZI2VpDF
bqPuisfeevXlV1R731cpiOaRCm/xUZlPmKaDIx/xZp9852UXGcPmF3DBKY+PfAqN
MtYkaIviVQXSXs7OL3TxajnRhprHOpYvQta5yIrod1V2C9qlEPpAQNEh2Dqzhpdm
Q8WgzdpV6lvP8QIdrA85RQzGs7hoUVwtw7qmQR1YAXDMOEdJXt8FO7/QRym8vfL4
AwFcsYraDXN1/tESjWxBBj8ln2aMWI81axEQrGXdLxbj/eDXISvBtm+wzcOXyl1L
NxPmMCg4n2gB/4lbTScLUDmFk+Pk/vg9Fn79vs6KkuroSu94lwaappcTSp4eNe/M
lLcrcyZ56YTWIgMXTu0cfXS92yIf7uKbRC3syRbwjJinIKHTICBM53AU1FLBDlpt
GgfN5B028fji9tzrl7mkzo6O22FbNrfWk1CeyX3Xd4xAeSZw5LM=
=tgtZ
-----END PGP SIGNATURE-----

--QjWMxxgOvY45Sisu--
