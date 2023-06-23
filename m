Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6929473B736
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Jun 2023 14:29:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbjFWM3q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Jun 2023 08:29:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231243AbjFWM3o (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Jun 2023 08:29:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E982E1B3
        for <linux-i2c@vger.kernel.org>; Fri, 23 Jun 2023 05:29:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 63AD161A32
        for <linux-i2c@vger.kernel.org>; Fri, 23 Jun 2023 12:29:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F47BC433C0;
        Fri, 23 Jun 2023 12:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687523382;
        bh=e0eyX37aT8G6FHuvZ+h22VGBy/5lOsYn4yT8YuJOyyE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tWGsDsGAQr3K4P7/bU5jKw5gFPdUEZkJAqfSkcckYts4rEouni+J1xiegEM6eafWG
         43FmLdZPS6ZQpqDl37l2/NoglzSDfbYaWnqXKgLOibXJTcOCIDnqb1GhBC7xeRcvIl
         5KgoFHv+BRSHO+vvUSkCjAsQvLWHmIj0nvLGZNz/rEgD1qDLXbJpRm16dY3W1oQvv/
         23JMyW1hNi8ABxsag6Z8g4PIoJ3ZjmBKreXe9YmbkRcprUqtrxTHH2oMGngLtM+JTp
         I8IiCuRMayJ1AYVDq3rEIrxH9cJe/yR5D6d7cvvv87imof21tou8S4e7nPuhtmMu7V
         qp74ubSucbTVg==
Date:   Fri, 23 Jun 2023 14:29:38 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH 04/15] i2c: busses: exynos5: Use devm_clk_get_enabled()
Message-ID: <ZJWQMkEKD1Agh5Pp@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
References: <20230611225702.891856-1-andi.shyti@kernel.org>
 <20230611225702.891856-5-andi.shyti@kernel.org>
 <ZJVuDEa/7IBwAusj@shikoro>
 <20230623114803.rvzxjb7iatr6jlvu@intel.intel>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gn17Xd8Mhjb0nQg2"
Content-Disposition: inline
In-Reply-To: <20230623114803.rvzxjb7iatr6jlvu@intel.intel>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--gn17Xd8Mhjb0nQg2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I don't know why there is just unprepare() and not
> disable_unprepare() in this function.

To save power, some drivers disable the clock by default (after some
init in probe) and only enable it when a transaction is on-going. If
they do everything right(tm), they may only need to unprepare the clock
in remove. I don't know the details about the exynos driver, though.


--gn17Xd8Mhjb0nQg2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSVkC8ACgkQFA3kzBSg
KbbyZw/9HKHOco94qbt8HZYSYvZGxW5sPbihN0Vq1tnoy9y6e2vxpKOkDY0X5vE7
XjFtwc+1Bx6Jk2hlLgxgP95+7jadJqMbLsEgc9kNQjdeT9JDfR36EEyaXMphTpjH
V7fEfTiIhWjogBDuwX/7wEA07jvMgOFlx9qI3FkT6BX1M/72IOmsRzmy37KkMu66
sI37EjgVaUIjA/d59H7in0f9ojcbY/xqTtqwuWMTL1Tdzxt9wZCsa9LRr9pJ2OBS
T8HbRDdFXdldE4wUr8NUMZkzJNzUt4/MD5XLfi0XRUs5LbXS87anLgJfjdtDud/E
gpp+VZ+pjRv8HfI+3qCD2xZFvjAhW7Fk6+PNKPqivCgIDSbPA0/4ftRkrSNEKB0g
ML1YtAnXQWn5J5AIvYpgPsYnHVxMtircOQxg8w2I+5OQUO31yC0RNoeCUZ0bf1UO
w4OG64HHMk6zhhCKn34tAaBRgi35msFLeRJFgSahcADwlaz3en7WB346BBsHMueC
WioE6U/y7j+Ya7H1hjObn+qShChcIvgESvFO8zh7CwbiAP3Sir6uCrXtMbcrVCLU
dvz+D21yP97ZRLRXw+/x/YzZe773eYss3rLiQyUy7S98LesI0cY/CdMe0rh1ZBWM
PoW79tMk6S/o6qhiHKi2TU3uEhNRtjgW0xQGV1g0B8nE/b4yMzs=
=wFzO
-----END PGP SIGNATURE-----

--gn17Xd8Mhjb0nQg2--
