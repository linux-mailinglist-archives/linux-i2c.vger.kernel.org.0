Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 513C6576DE1
	for <lists+linux-i2c@lfdr.de>; Sat, 16 Jul 2022 14:25:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231700AbiGPMZJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 16 Jul 2022 08:25:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbiGPMZJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 16 Jul 2022 08:25:09 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACCD51A3BC;
        Sat, 16 Jul 2022 05:25:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 655DCB80187;
        Sat, 16 Jul 2022 12:25:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 490FBC34114;
        Sat, 16 Jul 2022 12:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657974306;
        bh=b73l71pfnctP3sh0f5boOKGEDg8OKCQBQOgeRaAVgNc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iW0CN0q4wN/okmwYfRluhoDdZYpd5Y6pNUH5aP58Qaae1FlVkDwPCfKpPgIWYYxrU
         EtTR4Vm5ndWS0ZA+5QNKeAzT2NjbvwBpc5N0NACj9DucAn31jITzzQeAKBFdqpm5b9
         yEf8MMtAKfHNc/XiUWDdn5DBzBgc5/o3GmJCGNDJDuy8ynHcS3M4M1/74r39zxqX/s
         4k9QLbHlJYex4LHxYzxdbtApCQLfxUpKyV+EMhQrz+UwrTKSnVncw2KyZnJMew+A95
         UCTfRJDvgcY3CXXx1IqvFlLhAdz0CwrOjtwFdqKr7Drr/pNT8dex3c7LrYnX5mWUu4
         YNNGH0ItxHH2w==
Date:   Sat, 16 Jul 2022 14:25:01 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Alain Volmat <alain.volmat@foss.st.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        pierre-yves.mordret@foss.st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@foss.st.com, amelie.delaunay@foss.st.com
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: st,stm32-i2c: add entry for
 stm32mp13
Message-ID: <YtKuHdUjtBvqagfT@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Alain Volmat <alain.volmat@foss.st.com>, robh+dt@kernel.org,
        mark.rutland@arm.com, pierre-yves.mordret@foss.st.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@foss.st.com, amelie.delaunay@foss.st.com
References: <20220707074402.2429786-1-alain.volmat@foss.st.com>
 <20220707074402.2429786-2-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="XpthpirdDmCJyjsk"
Content-Disposition: inline
In-Reply-To: <20220707074402.2429786-2-alain.volmat@foss.st.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--XpthpirdDmCJyjsk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 07, 2022 at 09:44:01AM +0200, Alain Volmat wrote:
> Add the new compatible for the stm32mp13.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

Applied to for-next, thanks!


--XpthpirdDmCJyjsk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLSrh0ACgkQFA3kzBSg
Kba3jA/9GtapGevKUWhLHwFzzZUXb1n9jcmDm79L2zwP6UeNj6q+N5X3ELVst0BG
QaX0t6+JrvgxqDJteIx38X6UsCfxXW6I1RLJKqSRthuGa47YImufQrk0RFitTwXA
ybUB+Q3o58vOEIFcRE0AGM2NXhK/9+hUxzzDEtLK5BOkVu3U3bduSOzGDFpbSL+Z
M78hijbwnahYBXrZqRbzF+HZhWjw65+E5HIuEfPBpzOW1aHrCol5AjPziVNhKKt6
15oE/k7k5Zeb+pKD+G/kQENM3yqN0OjFh9tElb+Xj1cFRO43x0gVsqLgBABCB6bq
d0BZ4I0pan5IAkFhcBmslbdMmA6R6rLTifOm4MGF8A8LWAXwPVBqFaMjWgJEpE60
SzWioUyTm3poCHEN5r0XKxMz7qvbfnNZQY3D+YLtR2pNsU6unLblVs5A59sFC4Gu
y34tmmtF3oXvIi+9oQdeifo/t8fKd+hsRfIGYQv7/iI42IsD+9kKL+QeT6bQy81D
dZEsUQREkzNok/yjEa1LbWM26aGexztubystFdR3Ol2iPlBc5se1BuvTvJM+zPBz
jAi6jqWJ69+EBAuVHfGGc/a2v5o0c2b2bwrel1vbXvQ0L1qBzuJ6Dbw9Aqc9qcoy
6CGRGLRWWSBj9Sn7ObY6UNjg46KvSm45V1r27dHaayKGmco6EB4=
=zQzc
-----END PGP SIGNATURE-----

--XpthpirdDmCJyjsk--
