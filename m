Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8AAA6BD9A2
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Mar 2023 20:57:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229516AbjCPT5Z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Mar 2023 15:57:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229617AbjCPT5W (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Mar 2023 15:57:22 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7646BAD18;
        Thu, 16 Mar 2023 12:56:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 74C8DCE1E65;
        Thu, 16 Mar 2023 19:56:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36125C4339E;
        Thu, 16 Mar 2023 19:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678996593;
        bh=FjeRS+GUqcasumeqOw3zjV7lK1bI7k7/Hp9EIdfabys=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Eio5cQ/zqDLPE6/XVa6WTcbwNtK/j7T5AfhlG2ky6ZpLdl0UwIPyvQXod7lBeKWQu
         tIvVHJB2x3l7/l1ze8n6Kn3vot6YlBWrMiLqVOeXA6dJBYyg2CpIafH8zEquTyRbY3
         4I1s8DHvRR8Gtzso8fRR9r3Inpl25rpliVS2txcxX91QKUEfwjU/7e4+/rKMSZVolP
         CuLCwgEMbKlh84YDfyGF0XKA6s9R/kUQQUzAQ+k0yEWhahAxUcrhA6wcrK/rpDKbpG
         SZROrcAhBlu2Z3FeEG2x5rMzg36G4oP4ZgCxfPrH6+Jq04kozxHxbVyYhO2AXwZv6n
         CZolY5XVV9N/g==
Date:   Thu, 16 Mar 2023 20:56:30 +0100
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
Subject: Re: [PATCH 4/5] i2c: cros-ec-tunnel: Mark ACPI and OF related data
 as maybe unused
Message-ID: <ZBN0bsPpAj9KKf0v@shikoro>
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
 <20230311111658.251951-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NPOuvBlA3xuTK4qO"
Content-Disposition: inline
In-Reply-To: <20230311111658.251951-4-krzysztof.kozlowski@linaro.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--NPOuvBlA3xuTK4qO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 11, 2023 at 12:16:57PM +0100, Krzysztof Kozlowski wrote:
> The driver can be compile tested with !CONFIG_OF or !CONFIG_ACPI making
> certain data unused:
>=20
>   drivers/i2c/busses/i2c-cros-ec-tunnel.c:295:34: error: =E2=80=98cros_ec=
_i2c_of_match=E2=80=99 defined but not used [-Werror=3Dunused-const-variabl=
e=3D]
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied to for-next, thanks!


--NPOuvBlA3xuTK4qO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQTdG4ACgkQFA3kzBSg
KbZUJA/+JrUEht5HB7GAzwM81ZXqE5QvGi66MxVAr4lAwp+QJGCEDswnvZQ1ZHld
prFBkMgmWnfCdmmUycQ1jE0qlj0ddLansZNQ8xgLMaEhQPwnVKSVbtuo5GeLOf7e
yne/7/QYZds1eAPvkiLirbeeJ/cySkyfdqIkQjdMlLhNrhBADPD7QXoGlGHmxQI0
pSQg3zwHxfsUv6vlIpa1DGa8Kxqy7C88kjTOXMjMZIv4YE2A6ejFDKofiwlZUvoj
ygLrcmtPGY7WwrAOuanemyprTlGzsTocCGVgFb/Qtgv/EsW+mihmK+HNAutPwc8r
f6S7eiXCrp1Hh7AZfuC30OYE8Yz1GXGP1voAKrtJepVl449KuNtfwJCEyY5K29kL
eY2EqIe7KZodmZFgouk9NsThf/E+DnSxXuuPlbq5o5zwycBMxVF7rfa8Tw9fTe8q
bWgVLpJnF4NGC6bm+OIHMPPdjNqL9MYFh2cV5GgDXjsh5JPPfAJavvaNuQXy0WdO
Gc/5NKKTWUa7dCm7J+8qI9znH2GDP4VtfQkywj0PpemWRNfwPLFXHOrnXABjAATD
K+8A7pH48l3H4j6wU/AOo/zcAHOTAU0Fb1e4IUTx80RIL25cP1xY7mX9agxB0Puv
JzJuHu0VVLxBumer+SxpZblUmFAtk1Yf2oKBJeJ9994AOp3D41M=
=Vfz1
-----END PGP SIGNATURE-----

--NPOuvBlA3xuTK4qO--
