Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 358396BD9A0
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Mar 2023 20:57:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbjCPT5S (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Mar 2023 15:57:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbjCPT5R (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Mar 2023 15:57:17 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1AF1B9502;
        Thu, 16 Mar 2023 12:56:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6539BB82346;
        Thu, 16 Mar 2023 19:56:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65BB3C433D2;
        Thu, 16 Mar 2023 19:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678996585;
        bh=Mjf/KOZq0pMQaPecTwlIVOhjm3xmKHBctWt8QlLAcHc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=F8Ktkl4li+H+BQcTVPzIZ4gDRSy0viZroe8cQ0NMtigOoqSBfULZ1Qc8ttdNt55EK
         veK5RsBcVhhfiU4YK1If2w4nj8cZC+JwWCagbY/0xq/K4qZH/jNaY12hyOJOB8HUMo
         M2ZlEtZf2zWH3cFBv02XSmIb2Cd5sH6pJsGcQrrRfUHivtbWn0K4VaSamYjqa3J46V
         7kHDzq+BmNPjzIp5CdQLP2VPMMWPQIRM2B+tNcwO0FA3s1td9fIPomkN1TFC6t+/tC
         T2XZ5OmZNoYqBXKfFeR88gxWmJlIcqWpy2Fvr82SomCkVlYULxZVwhOPeArFsJm2L/
         5FWGREUZ83rWQ==
Date:   Thu, 16 Mar 2023 20:56:21 +0100
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
Subject: Re: [PATCH 2/5] i2c: owl: drop of_match_ptr for ID table
Message-ID: <ZBN0ZfrNlf7OvhBP@shikoro>
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
 <20230311111658.251951-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="XGyxLH46S7knRnsx"
Content-Disposition: inline
In-Reply-To: <20230311111658.251951-2-krzysztof.kozlowski@linaro.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--XGyxLH46S7knRnsx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 11, 2023 at 12:16:55PM +0100, Krzysztof Kozlowski wrote:
> The driver can match only via the DT table so the table should be always
> used and the of_match_ptr does not have any sense (this also allows ACPI
> matching via PRP0001, even though it might not be relevant here).
>=20
>   drivers/i2c/busses/i2c-owl.c:510:34: error: =E2=80=98owl_i2c_of_match=
=E2=80=99 defined but not used [-Werror=3Dunused-const-variable=3D]
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied to for-next, thanks!


--XGyxLH46S7knRnsx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQTdGUACgkQFA3kzBSg
KbboYA//Z5E08lbBDwpJ6X1vQt8t3Z2sDrHAfPePOJDVRBs0Npo+1i7Vemp2/AJX
RpRq7CjTyxrzi/NVHBAoUi0vT91RNVtqvLcxy3hLQ+REdLdNub+90blP0nFmp0Bj
cGSyDIZD3HQBBVAJqCKuQMcB8wd0eCdx3GzEjkWUHWS8iyRIOTRH6ucdOpwyoy1s
1qkc6zbB+ZReGZ5ULiLO4qOH4LWoLX/i44O/BTcvoqN2Ulel+x29rGSVxmopX5ua
L91VWKMdFaAvZ2xIbw9jc+esWJbZT8YOBecavdgTaFnB6fqNgkXPuyoK3PLiFCHh
Fvnl8KxFMuHZh7Cuf8bMywY62Ru7iIruDkUSVMTCYs7n4Gu7fZD8pozyxum3J0DG
wVwZuPZufXXO3WZpGlLUda8gqINkJVoS3ewTViAl5JLfm/CTsnesnYwcoHjApgR6
y9jIHq8K6/vzUhUjsUbe5hNMKlpMAQlyIUNgiEyXcIf14qxPpDeoMN47gJVS1aTI
/ADxL+JSzuq6yfFaRW7CgaLiVpEy5uU/qpH7H3+EQmxkNsXr1ia/fGbuaTA/rPZJ
N17o73EN7ue1VfhuLFXsNPSOvczHBnblwR27rjNMGwbIpWXYI1zX7AANFwOWY+Q6
MpoJZiQucgdQHlCv/qxiPQD2u+ru6OYth8Q/HAI668MquQQ5i0w=
=vj+r
-----END PGP SIGNATURE-----

--XGyxLH46S7knRnsx--
