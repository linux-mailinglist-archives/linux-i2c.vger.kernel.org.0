Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E27787639B7
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jul 2023 16:58:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233966AbjGZO6e (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jul 2023 10:58:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234255AbjGZO6c (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Jul 2023 10:58:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B029D213A;
        Wed, 26 Jul 2023 07:58:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4CED961B0A;
        Wed, 26 Jul 2023 14:58:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C8F4C433C8;
        Wed, 26 Jul 2023 14:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690383506;
        bh=4wMA1U2sdxtxKn5ja+QnGHFus2ehfX1ZdTdGr8xna5w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=B8eTAymE5naWz+UXKsHwpimf+fkMywUqd5m5Rh3GM5KXDmvJffZChnvljLzkaS1uG
         dUx5CBAhuB8i6XXMpAY+yDOw2Hz3MZVvqe5N4t0xDSgTQOGaZgIKO10IQ7dVsZXYUS
         gRyxHgDjdFs6yPGLen+wSNI8jcCOXRsiyajBW3mSnFiwKw5fJcljgvfpqDRVwGy3YW
         CAEBGG4ts+mVR5+Ua+9Z6j+Euu7tOLzPAVFjnq6yl3jEayfgw72Jj4SmczvPSWMNZk
         f7Q8iLn0LStCkC5aphMylprtHnocRGrXUn4QLkUYZxfabCW1lLDbEd7Wu1rTrStqug
         m8lNAoQA9prhA==
Date:   Wed, 26 Jul 2023 16:58:23 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     carlos.song@nxp.com
Cc:     aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, xiaoning.wang@nxp.com,
        haibo.chen@nxp.com, linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] i2c: imx-lpi2c: return -EINVAL when i2c peripheral
 clk doesn't work
Message-ID: <20230726145823.y67dylomsgblaaww@intel.intel>
References: <20230726092238.3424116-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230726092238.3424116-1-carlos.song@nxp.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Carlos,

On Wed, Jul 26, 2023 at 05:22:38PM +0800, carlos.song@nxp.com wrote:
> From: Carlos Song <carlos.song@nxp.com>
> 
> On MX8X platforms, the default clock rate is 0 if without explicit
> clock setting in dts nodes. I2c can't work when i2c peripheral clk
> rate is 0.
> 
> Add a i2c peripheral clk rate check before configuring the clock
> register. When i2c peripheral clk rate is 0 and directly return
> -EINVAL.
> 
> Signed-off-by: Carlos Song <carlos.song@nxp.com>

you are missing here:

Acked-by: Dong Aisheng <Aisheng.dong@nxp.com>

You can also add:

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

(no need to resend)

Thanks!
Andi
