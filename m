Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 695C276BF68
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Aug 2023 23:41:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230342AbjHAVlg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Aug 2023 17:41:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232120AbjHAVlf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Aug 2023 17:41:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 854851726;
        Tue,  1 Aug 2023 14:41:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 242586170A;
        Tue,  1 Aug 2023 21:41:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12F2DC433C7;
        Tue,  1 Aug 2023 21:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690926093;
        bh=k/5viSm7Km0rIa9duT4xU0XbNaVd6tQQN2OOzlOXBno=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Pgt/no8/Qd8V88rBs/90NUvltejScxtBLQGrnGixjJkDo+/ih6jdyNUjhThVuEOUv
         +6a++coZGMGk3ssNjvbKpMeIS2vAo871xskfD5PP+ojVCOD6BFmXPNBo3BZpwiH6KE
         x8XsGowaJODRD61gQsI+LYoaaufh8mKirQnf9hz91+dZ2XjRSns3YftbQWfvnP13e/
         0Ki/DJUVl1DTmx6I8Co/Xvm1mHyK/FM1p0e1oEf3qALzoWjCvpPe5hp+hzsBsqfU/a
         MwbPp2UrXdDrRQHenHPWIhwP3+/7DbOVLmhK1n99qq0Sv43xD5jmgB+PHpzTBORXJO
         R6JBeGUUKV+mw==
Date:   Tue, 1 Aug 2023 23:41:28 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Liao Chang <liaochang1@huawei.com>
Cc:     florian.fainelli@broadcom.com, rjui@broadcom.com,
        sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        yangyicong@hisilicon.com, aisheng.dong@nxp.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, kblaiech@nvidia.com,
        asmaa@nvidia.com, loic.poulain@linaro.org, rfoss@kernel.org,
        ardb@kernel.org, gcherian@marvell.com, linux-i2c@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 7/9] i2c: dln2: Use dev_err_probe in probe function
Message-ID: <20230801214128.3ksccmuevxm5cnkr@intel.intel>
References: <20230728013148.1720978-1-liaochang1@huawei.com>
 <20230728013148.1720978-8-liaochang1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728013148.1720978-8-liaochang1@huawei.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Liao,

On Fri, Jul 28, 2023 at 09:31:46AM +0800, Liao Chang wrote:
> Use the dev_err_probe function instead of dev_err in the probe function
> so that the printed messge includes the return value and also handles
> -EPROBE_DEFER nicely.
> 
> Signed-off-by: Liao Chang <liaochang1@huawei.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi
