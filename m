Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9471476D854
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Aug 2023 22:02:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231911AbjHBUCY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Aug 2023 16:02:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231616AbjHBUCT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Aug 2023 16:02:19 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F18D2103;
        Wed,  2 Aug 2023 13:02:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2CBBE61AE0;
        Wed,  2 Aug 2023 20:02:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E190BC433C7;
        Wed,  2 Aug 2023 20:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691006537;
        bh=To4qV8uagUTfxBX0+FvsF8yldldpPIgLm37jKxynVdA=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=BvOQGBGz2AfowOxx/aG1f/XwgCsLT0mhPw8iigA9XzXY7aHjoYzUpVmFzbtY0R2jj
         2mZUBc4U+wptdIQp4EPOvKKTSTIoUwkABWxw+p8+x8NRmmm+B7NEjMmdNFbimbNicl
         37LiYs0rPll477nZoVsGB2qbyQ6W3BxSOZ/L1xwW+QyjQ/LaEnAoHj/uiitEg2rfMt
         bLkz+S2FD/1e5oFXgmX4Z5J4uX3emJLHDc1tVwDdu5SQKMhejN10UCojzhRDUVhCgs
         fKKBxQnxDw5WeHQxK8V1kYwlnfbljsdRSpIzUo6DI4YzOEeoKQduyeMAFNARRKKfSV
         o5qVlByGa7WWA==
From:   Andi Shyti <andi.shyti@kernel.org>
To:     aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, carlos.song@nxp.com
Cc:     xiaoning.wang@nxp.com, haibo.chen@nxp.com, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20230726092238.3424116-1-carlos.song@nxp.com>
References: <20230726092238.3424116-1-carlos.song@nxp.com>
Subject: Re: [PATCH v5] i2c: imx-lpi2c: return -EINVAL when i2c peripheral
 clk doesn't work
Message-Id: <169100653443.1957828.8137836216322906699.b4-ty@kernel.org>
Date:   Wed, 02 Aug 2023 22:02:14 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

On Wed, 26 Jul 2023 17:22:38 +0800, carlos.song@nxp.com wrote:
> On MX8X platforms, the default clock rate is 0 if without explicit
> clock setting in dts nodes. I2c can't work when i2c peripheral clk
> rate is 0.
> 
> Add a i2c peripheral clk rate check before configuring the clock
> register. When i2c peripheral clk rate is 0 and directly return
> -EINVAL.
> 
> [...]

Applied to i2c/andi-for-current on

https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Please note that this patch may still undergo further evaluation
and the final decision will be made in collaboration with
Wolfram.

Thank you,
Andi

Patches applied
===============
[1/1] i2c: imx-lpi2c: return -EINVAL when i2c peripheral clk doesn't work
      commit: a83c167c8210a9f289e867bbc084174252f7433f

