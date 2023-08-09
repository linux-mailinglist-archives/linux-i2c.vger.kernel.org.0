Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D33877688E
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Aug 2023 21:22:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233670AbjHITW0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Aug 2023 15:22:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233732AbjHITVp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Aug 2023 15:21:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56226449A;
        Wed,  9 Aug 2023 12:21:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5CA2764630;
        Wed,  9 Aug 2023 19:21:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35967C433C7;
        Wed,  9 Aug 2023 19:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691608885;
        bh=TiIG4S1nRqWeK6cqm2dQQ3PwFd9Ye8wKZqV8Kz/6D1A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fxaAkJN6WLJh+Tva2wUZFiB1cm3V6vzphmIuOpvtEQryz0sznmqQ4JKSoOFL4nljq
         NYyZFoWNZDLzi2lWbFXw5CsVaHQXB20ynXMbmM6XQ+boVSIAHcLdY12naARz7tXLNW
         xYmN//vwASWRG+4/UOynp7bMoyTw7ykwLy2prtyrUesejsgz8YTyknDiKeuUIZXH6q
         1frE0XLQnSWn+hfv68zXyGdoVscaOC2XLPkvj4TFOhJYZxb+EuC/bPoBxRHTpVmRMD
         LEJkrxl2noWV5WKeusZg6rBGVKDsMwy918P72Lpk72Ds5Wsspf9VpkoiQOM4gezNu9
         W0sCpQtPZBIsQ==
Date:   Wed, 9 Aug 2023 21:21:17 +0200
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
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 9/9] i2c: synquacer: Use dev_err_probe in probe
 function
Message-ID: <20230809192117.h7rn6vwmvxdnkr2a@intel.intel>
References: <20230808012954.1643834-1-liaochang1@huawei.com>
 <20230808012954.1643834-10-liaochang1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230808012954.1643834-10-liaochang1@huawei.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Liao,

On Tue, Aug 08, 2023 at 09:29:54AM +0800, Liao Chang wrote:
> Use the dev_err_probe function instead of dev_err in the probe function
> so that the printed messge includes the return value and also handles
> -EPROBE_DEFER nicely.
> 
> Signed-off-by: Liao Chang <liaochang1@huawei.com>

After some discussions and time, I think it's right to r-b this
patch. If you agree more with Krzysztof, feel free to follow his
recommendation and send another version otherwise I will go ahead
and take this series in my branch. I do not really mind, both
arguments are valid.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Thanks,
Andi
