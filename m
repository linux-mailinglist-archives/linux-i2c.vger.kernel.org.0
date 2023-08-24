Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B6A97875DA
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Aug 2023 18:46:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241595AbjHXQpd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Aug 2023 12:45:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242710AbjHXQpD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Aug 2023 12:45:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1451010FF;
        Thu, 24 Aug 2023 09:45:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A520F673FF;
        Thu, 24 Aug 2023 16:45:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69300C433C7;
        Thu, 24 Aug 2023 16:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692895501;
        bh=ruQy74CDGQDtWmiM3DiOMnzTZGJk1xPZjefpFCtV6oE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jXGNJK7OUCl+uX94B2Y+EZrk2VCe+pRxW7m/+mZMo+NzPIGEhdjhDQ5/9PE8W+B69
         OwPk7Xk2Peald5YmZNBIM6MGPSXfXTJt9qx0RhIuCRZoiVyZ/nWkTa9tLQthlANttO
         NAibVa6A+4C+t7D+5nETQW4T+JT60vAYraRtVqP0sxRQXUEL/fRRu+H5dv9NEJIKYW
         j/DhlEi35tkaoLXiOzbXKQWMVIu4nRxGJzwCNFzdX3LGCjHrHDLyz1YSO3TLf6xz3F
         mfwPaQ3zgB5k2Vip7WN6kuDRQHnQvfi8MZATRYCb1Hk45Ng8jgaICJqkvRkJZhTRBt
         Oo7eJ16GRvV3A==
Date:   Thu, 24 Aug 2023 18:44:56 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Huangzheng Lai <Huangzheng.Lai@unisoc.com>
Cc:     Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        huangzheng lai <laihuangzheng@gmail.com>,
        Xiongpeng Wu <xiongpeng.wu@unisoc.com>
Subject: Re: [PATCH 0/8] i2c: sprd: Modification of UNIOC Platform IIC Driver
Message-ID: <20230824164456.cgg7dqz7rxarmzf6@intel.intel>
References: <20230817094520.21286-1-Huangzheng.Lai@unisoc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230817094520.21286-1-Huangzheng.Lai@unisoc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Orson,

On Thu, Aug 17, 2023 at 05:45:12PM +0800, Huangzheng Lai wrote:
> Recently, some bugs have been discovered during use, and patch3 
> and patch5-8 are bug fixes. Also, this patchset add new features: 
> patch1 allows IIC to use more frequencies for communication, 
> patch2 allows IIC to use 'reset framework' for reset, and patch4 allows 
> IIC controller to dynamically switch frequencies during use.
> 
> Huangzheng Lai (8):
>   i2c: sprd: Add configurations that support 1Mhz and 3.4Mhz frequencies
>   i2c: sprd: Add I2C driver to use 'reset framework' function
>   i2c: sprd: Use global variables to record IIC ack/nack status instead
>     of local variables
>   i2c: sprd: Add IIC controller driver to support dynamic switching of
>     400K/1M/3.4M frequency
>   i2c: sprd: Configure the enable bit of the IIC controller before each
>     transmission initiation
>   i2c: sprd: Add additional IIC control bit configuration to adapt to
>     the new IP version of the UNISOC platform
>   i2c: sprd: Set I2C_RX_ACK when clear irq
>   i2c: sprd: Increase the waiting time for IIC transmission to avoid
>     system crash issues

there are some changes here that require device knowledge... can
you please take a look here?

Andi
