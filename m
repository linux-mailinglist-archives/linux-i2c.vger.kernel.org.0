Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2DEC54DCAA
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jun 2022 10:18:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359622AbiFPIR5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Jun 2022 04:17:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbiFPIRz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Jun 2022 04:17:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51C2713CE7;
        Thu, 16 Jun 2022 01:17:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CE3BA61D29;
        Thu, 16 Jun 2022 08:17:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68449C34114;
        Thu, 16 Jun 2022 08:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655367473;
        bh=XoJ4+rFkSAX4O5qYIqK5h8B/dlR8CbRJGdER6wLYAg8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VeSUTIggYN810w8JCA1g7TGpTRWOa9WbH3c5dRxNFna+XrzdVydsFSgYQyONOaxEt
         w9W+YGVqVi/i8tGuiOpPx73ynWAJipXxXg6B70UfFGD4o/kjGwym+kW3V6qdOpoX+/
         NKI58usFqFmnOzEbhzrxEqpIxwWMB29P8vTmO93RP9bXrnJ3jJEes9IlSSUGHiXUBm
         11RkFhYK9BCSZxBfA9SRdLH3gLkRYA6Jt8ZJa1vPBoVG+PZmSF/BkBlKY08Wwd4dUh
         opgk7Xw5Ci5jvRY3svNJ7tfZHg7SyoAk0Ml2NRnaEDteGr21MNVqASZ7aahFB7W2cm
         W0NyF6YInU/wg==
Date:   Thu, 16 Jun 2022 09:17:46 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-doc@vger.kernel.org,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: efm32: remove bindings for deleted platform
Message-ID: <YqrnKtkm4Xdl8vTy@sirena.org.uk>
References: <20220615210720.6363-1-wsa@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gF7RWUCch1/TUW4O"
Content-Disposition: inline
In-Reply-To: <20220615210720.6363-1-wsa@kernel.org>
X-Cookie: Pass with care.
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--gF7RWUCch1/TUW4O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 15, 2022 at 11:07:19PM +0200, Wolfram Sang wrote:
> Commit cc6111375cec ("ARM: drop efm32 platform") removed the platform,
> so no need to still carry the bindings.

Acked-by: Mark Brown <broonie@kernel.org>

--gF7RWUCch1/TUW4O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKq5yoACgkQJNaLcl1U
h9D6Bgf9FsWZbqfrpPz05MqsAP5L5zXrH6+wVnlkfyL60hVYPRq4/YkegM0Ttbjm
uU+opIQjjzpOCx7uPPqovy+19nZ1WXEk7oL8yHmjp35I9wzEAflDpj2VhJqROabZ
hJSF+yEWSSh3mIhD4AkvMtz/Jo4unndHxzC/sRsRWdQJLVsX6d9etfXNHOPKVmc+
XNiD+z27IMfgqM5f6Ax1AziQwVKPMtu/FszTUWQt1UIPNLq2hv/R5MdF13of/gM6
gwwGJJuLTaPNhvHF0b1T8RdyyWzJnc3KPO5zED3DpHhKGDz6u8OBAHDrQXLQeeEc
aufEoFD8GNwShKIK9ai+ouZEkFscHQ==
=DN3x
-----END PGP SIGNATURE-----

--gF7RWUCch1/TUW4O--
