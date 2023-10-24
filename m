Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 846AE7D5D44
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Oct 2023 23:35:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234967AbjJXVfQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Oct 2023 17:35:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234965AbjJXVfP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Oct 2023 17:35:15 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EEADA3;
        Tue, 24 Oct 2023 14:35:13 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40079C433CC;
        Tue, 24 Oct 2023 21:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698183312;
        bh=OYMrgtsbM96I39I+nQPvvr1OsVZS1/s9XO0xNU5E+DI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=N3mXbTyHQZWcAaDxy4MnwkUz4X7nYsj1YuGMj2zaY1t+CNBhI7M/HQ7AkxaXE1UlI
         f1yN24qmxV0Gd9zFA/SaMXuUHfw1mEMFjDnfGWnesax/r51QQXOS+cBRrprxeGsQKI
         b2xI2f15qlxgo6pt7kGpVjd8VeqsoCMyN2inRkFJbvKy2gOuMIusIrMTStAZjpu/Lz
         zCmgP0/jE+Z9D/HVPDQNX+2I36FZoD9uEuR9AAbqUKR8xQqZdZBoiLBvggMkR3QnNt
         LmAFDg0uJ2X/nXgZ36uS5hDrnWk1ePD4tHRQ8WCSBvbpQ41g7P/orf54UNEfR10VK6
         JIqXlrjHNF8kg==
Date:   Tue, 24 Oct 2023 23:35:08 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Huangzheng Lai <Huangzheng.Lai@unisoc.com>
Cc:     Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        huangzheng lai <laihuangzheng@gmail.com>,
        Xiongpeng Wu <xiongpeng.wu@unisoc.com>
Subject: Re: [PATCH V2 5/7] i2c: sprd: Configure the enable bit of the I2C
 controller before each transmission initiation
Message-ID: <20231024213508.7hlkfpf52ebpohoh@zenone.zhora.eu>
References: <20231023081158.10654-1-Huangzheng.Lai@unisoc.com>
 <20231023081158.10654-6-Huangzheng.Lai@unisoc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023081158.10654-6-Huangzheng.Lai@unisoc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Oct 23, 2023 at 04:11:56PM +0800, Huangzheng Lai wrote:
> When a timeout exception occurs in the I2C driver, the I2C controller
> will be reset, and after resetting, control bits such as I2C_EN and
> I2C_INT_EN will be reset to 0, and the I2C master cannot initiate
> Transmission unless sprd_i2c_enable() is executed. To address this issue,
> this patch places sprd_i2c_enable() before each transmission initiation
> to ensure that the necessary control bits of the I2C controller are
> configured.

where is the timeout occurring? Is it a sporadic failure?

> Signed-off-by: Huangzheng Lai <Huangzheng.Lai@unisoc.com>

Would be nice if any from Orson, Boulin or Chunyan could take a
look here.

Andi
