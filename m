Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 308AD54D5CC
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jun 2022 02:10:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235625AbiFPAJD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jun 2022 20:09:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235816AbiFPAJC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Jun 2022 20:09:02 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 037651FCC2;
        Wed, 15 Jun 2022 17:09:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BBE79B821FC;
        Thu, 16 Jun 2022 00:09:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54D98C3411A;
        Thu, 16 Jun 2022 00:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655338139;
        bh=wtlUHiZlC3SUdEQN3Rfj+UOSKVqFZS2A6++v8c130c0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=F2coanyyY8iiPTStEnPd2GoZIyQBQyr5+6UhR3KlakugOmK27viqYtONRq72eXaLV
         48vKFYvEuTjEFrdDYIZ4XoQcTx74+fbXI9gXt1Dho4F3Zc7TChOxI5gOnaiWfkV1NS
         +zOSZPOsoHnUjvaJQ6Dm7XeP+xHefcO7O7nhNR0UFYBo1s7hIkUthfKblYVxnPefK2
         veFr35mEiKjTCKn7XGBu2IbaVMt+7yErBC7G87mUVyJYA3mN3GsLiJWC7Fuo5yui0N
         l73C39ilNUE51nNgFeZRDsX6UeSKrg2dm8IMjH24bc1+20q9vt4F2iRz/hT+KjjQyg
         0qLZ5uANvny9A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220615210720.6363-1-wsa@kernel.org>
References: <20220615210720.6363-1-wsa@kernel.org>
Subject: Re: [PATCH] dt-bindings: efm32: remove bindings for deleted platform
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Uwe =?utf-8?q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Wolfram Sang <wsa@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org
To:     Wolfram Sang <wsa@kernel.org>, linux-doc@vger.kernel.org
Date:   Wed, 15 Jun 2022 17:08:57 -0700
User-Agent: alot/0.10
Message-Id: <20220616000859.54D98C3411A@smtp.kernel.org>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Quoting Wolfram Sang (2022-06-15 14:07:19)
> Commit cc6111375cec ("ARM: drop efm32 platform") removed the platform,
> so no need to still carry the bindings.
>=20
> Signed-off-by: Wolfram Sang <wsa@kernel.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
