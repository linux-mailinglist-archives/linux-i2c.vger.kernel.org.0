Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B6FB76BF5E
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Aug 2023 23:38:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232314AbjHAVi1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Aug 2023 17:38:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbjHAVi0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Aug 2023 17:38:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 772211FFE;
        Tue,  1 Aug 2023 14:38:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 047CA61729;
        Tue,  1 Aug 2023 21:38:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5C38C433C7;
        Tue,  1 Aug 2023 21:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690925903;
        bh=ADa1+iTR0hYXnlYYFNGNMhg7NNISNtzlV/jyzDJD1Ek=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=omgzPgc+/CfYwc/ZThQM9Klr2USqU4p0RGuSSXTTrAKySXrgVsIGcdEa187BH/tn7
         ktB01JqOSOaxdyul2xtuluW3O5PknAtmPoZlao7qVbziAJ/kAOUaAWwNr+ZFOL6DVF
         /vqmE3S4rx5P+6AAHvBOsSXJw2rze8l7wVZwOkBgBlYe3milgwFTXSv+1HsOPw4T7F
         TNg7Vpp/VNYMVPJaybT1wZCBZ8sZSJT9yuXsykc4iGglxWhYHSdQItbMOm2++Yd5OP
         DkTt/zys63NVMVZQgCi9TxGTTD28yhY4cfzSHsZr/zgRtSESMhmXwAcy6isn88Vh+a
         E+3X5hOPqL3rw==
Date:   Tue, 1 Aug 2023 23:38:20 +0200
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
Subject: Re: [PATCH 5/9] i2c: qcom-cci: Use dev_err_probe in probe function
Message-ID: <20230801213820.vyecp2njdfojrgqn@intel.intel>
References: <20230728013148.1720978-1-liaochang1@huawei.com>
 <20230728013148.1720978-6-liaochang1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728013148.1720978-6-liaochang1@huawei.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Liao,

On Fri, Jul 28, 2023 at 09:31:44AM +0800, Liao Chang wrote:
> Use the dev_err_probe function instead of dev_err in the probe function
> so that the printed messge includes the return value and also handles
> -EPROBE_DEFER nicely.
> 
> Signed-off-by: Liao Chang <liaochang1@huawei.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi
