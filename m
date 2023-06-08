Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDDE6728861
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Jun 2023 21:27:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232068AbjFHT1D (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Jun 2023 15:27:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbjFHT1C (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Jun 2023 15:27:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3A3FA2;
        Thu,  8 Jun 2023 12:27:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 45F6C61864;
        Thu,  8 Jun 2023 19:27:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0824EC433D2;
        Thu,  8 Jun 2023 19:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686252420;
        bh=8k4zT0KQCjzNW6KkGWKsAklbqmnPbSRd1tQLhruj33w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nWY6UlWEMqGR6WcWfDmpqumLjQuwzeXaAKuShBZhpqPHUAzO0CeEFQ4HPVha43Ra1
         UM4pMwaeE+MvvedonmiUZpQTdKtdoEvxhgCxjgJjIb3Zg9SwTOIk7x9ZJvuYhu+S1q
         +PybQW05HwVkb4t3gInYsFnoj2F34DX0Jzbfz99K8Vk9sPBz32XKCSceWWTcYxrEwx
         ex/Zg1wTi086qJp1RgxrA5pLyG2RKmxX5NfxjCaynKkqvrTz3pFCDwCmaBMRjPW8/K
         0HUkjTPNDsYIyQlIxCrv8YkgEgLn2/A9pi0WcDf0IZTostECbW00mo6EXipFKJjc/S
         r6lwK4k7GvYzw==
Date:   Thu, 8 Jun 2023 21:26:57 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Md Sadre Alam <quic_mdalam@quicinc.com>
Cc:     loic.poulain@linaro.org, rfoss@kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_sjaganat@quicinc.com,
        quic_srichara@quicinc.com, quic_varada@quicinc.com
Subject: Re: [PATCH 3/5] i2c: qcom-cci:Use
 devm_platform_get_and_ioremap_resource()
Message-ID: <ZIIrgY1etR/pibIR@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Md Sadre Alam <quic_mdalam@quicinc.com>, loic.poulain@linaro.org,
        rfoss@kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_sjaganat@quicinc.com, quic_srichara@quicinc.com,
        quic_varada@quicinc.com
References: <20230306144522.15699-1-quic_mdalam@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="i1Olhwl0/rWh9QMV"
Content-Disposition: inline
In-Reply-To: <20230306144522.15699-1-quic_mdalam@quicinc.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--i1Olhwl0/rWh9QMV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 06, 2023 at 08:15:22PM +0530, Md Sadre Alam wrote:
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
>=20
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>

Applied to for-next, thanks! Also, thanks, Robert.


--i1Olhwl0/rWh9QMV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSCK3wACgkQFA3kzBSg
KbYZ8g//agXINN6K/ZpRv8Uy1vQBHL5MUhKBEi9Drc2K19hcBNVCgQuc1VAVjeSv
0r9SaGNaWmDXAGswBZbg+LuijycxUAa8JfcMvHD8RdRdce2Vtftx1NeR0ms+VbNx
zAOpTtLMDyuLFUBeErSHqv8AUoyVkK6b1Bl/2llZezV6GcXAEvizXVwKhbb3bNuL
an4mbyrCWUa6oFM0q/lh1rv1AojftPuvEzl5K4F5A/3dxaHpyyG3GMl3php4n01o
/wn/c2SGrWcLG6LRNHFCD9DubzUH4rAlNNaSBiUHAA24WuE+Qwd6GTahxevxRNkR
La535YlFm5PCxjdMYTfTPjgxBQl+jdBxKi8TY3GtDKEmqzHCBJ3dxNsuv8fio1CW
TzCtHwVYkz/D7UVJvCYNLYgPaLPdmged4Y97CllAggN/LZyWSKPCHJ0kv/c+Ey+s
5Xaql3W4LTF65ZYqAPbJ3jsa5R6EGGyU40LuH1NP+chiH4zQgaIwby3UNWbL8SPO
Azb3C4yZ45dnxILM4LuCFWnodWuY7OlWfO8E9TWoKF/jcAfkIXjMLt2y+qII11wO
nsGETZMZN+4N0wf0PZMd3Oaai6BUI2tTZHLmbCbQofMSTELMcC69tfmutzPMyJh/
wN0sLnLRgWBeUe7J8wD1NOGHoCDV6qDcTw1n7HKr76mSEJVXB1E=
=n51n
-----END PGP SIGNATURE-----

--i1Olhwl0/rWh9QMV--
