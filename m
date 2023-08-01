Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9E6476BF65
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Aug 2023 23:40:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232508AbjHAVkd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Aug 2023 17:40:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231725AbjHAVkb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Aug 2023 17:40:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31579172B;
        Tue,  1 Aug 2023 14:40:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C4D5E61729;
        Tue,  1 Aug 2023 21:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE649C433C7;
        Tue,  1 Aug 2023 21:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690926030;
        bh=0Ix43j7jhgbKiD4hMLNiYt5Wj1CPlhdOwJfn9xQ2Qlo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QYDXJsj8aSS5ow8lSLZ7mxzEUAkghnixEvd7RQR0f42GyJzeUcS6TGVTCRzN4xGN6
         wSBQdUnbmUDLlv8MXVNf5yIyOFiv+TmWBIraClGyQFVnvitfHp+JMLH6JWlPw3oh3x
         tyr8hHWimBSBPG1BzsWtnLV54O////V2ESbLGUJb3vMM4CYByPqOB0fCSYgn8P8XhT
         65N6kkoAjYGdSOhlK9tkJjcshqVe80isM+241YEW28q9b0MC7dv0Z9DLQAF+g2VEdy
         0yjrn3lip0buh+iE6uJtt52VgUZ+hl8g1la9Af9UyCqipjdPQfY8Yb07HfhuqDVZBd
         gYMSaSADMwlDw==
Date:   Tue, 1 Aug 2023 23:40:27 +0200
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
Subject: Re: [PATCH 6/9] i2c: pxa: Use dev_err_probe in probe function
Message-ID: <20230801214027.ziitl3m5h36dahkb@intel.intel>
References: <20230728013148.1720978-1-liaochang1@huawei.com>
 <20230728013148.1720978-7-liaochang1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728013148.1720978-7-liaochang1@huawei.com>
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

On Fri, Jul 28, 2023 at 09:31:45AM +0800, Liao Chang wrote:
> Use the dev_err_probe function instead of dev_err in the probe function
> so that the printed messge includes the return value and also handles
> -EPROBE_DEFER nicely.
> 
> Signed-off-by: Liao Chang <liaochang1@huawei.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi
