Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E98D7D5D58
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Oct 2023 23:40:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230458AbjJXVkb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Oct 2023 17:40:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344272AbjJXVka (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Oct 2023 17:40:30 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03401A6;
        Tue, 24 Oct 2023 14:40:29 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FC3EC433C8;
        Tue, 24 Oct 2023 21:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698183628;
        bh=F4moDtJBsvM9k5YRWcGiZLJiEXlG4reTo0D2QY0C0dg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oosxYUuzADM8NPpyDf8JiuQjauehWEnVJjvBPI+XZbNdM6cP66MQ8UcicQ4XfXAur
         j5i1meCrUH73sGd/0LE7t3kgZthIEtHRfAx5dSbVMY5anlaYejy5drPA4xt0v2zagM
         VskR+wBh3JvCaC26F5NQiQroCoBXDYPd5t0pkosfmJACpJR+DNI2L1rEMK0FjuSs/X
         YEOG0hdgStFnvEVJ/GqaqjGyTIa6LgsPGBX6Mzb8fv3W0NUfLwT/D4ABOBsItZwY/f
         mMeA+mDDpMtfP8/X0os0lOV7ABxTqul/CGv+n0t9JT/nzzyaoclgXJZKKIRpQhOPK+
         6F6hwk4SKQlVA==
Date:   Tue, 24 Oct 2023 23:40:25 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Huangzheng Lai <Huangzheng.Lai@unisoc.com>
Cc:     Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        huangzheng lai <laihuangzheng@gmail.com>,
        Xiongpeng Wu <xiongpeng.wu@unisoc.com>
Subject: Re: [PATCH V2 0/7] i2c: sprd: Modification of UNISOC Platform I2C
 Driver
Message-ID: <20231024214025.rfix4tzqzxlazbgh@zenone.zhora.eu>
References: <20231023081158.10654-1-Huangzheng.Lai@unisoc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023081158.10654-1-Huangzheng.Lai@unisoc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Huangzheng,

could you please use the [PATCH RESEND...] prefix when sending
the patch as it is?

Thanks,
Andi

On Mon, Oct 23, 2023 at 04:11:51PM +0800, Huangzheng Lai wrote:
> Recently, some bugs have been discovered during use, patch3 and 
> patch5-6 are bug fixes. Also, this patchset add new features:
> patch1 allows I2C to use more frequencies for communication,
> patch2 allows I2C to use 'reset framework' for reset, and patch4 allows
> I2C controller to dynamically switch frequencies during use.
> 
> change in V2
> -Using 'I2C' instead of 'IIC' in the patch set.
> -Using imperative form in patch subject.
> -Use 'switch case' instead of 'else if' in PATCH 1/7.
> -Modify if (i2c_dev->rst != NULL) to if (i2c_dev->rst) in PATCH 2/7.
> -Modify some dev_err() to dev_warn() or dev_dbg().
> -Clear i2c_dev->ack_flag in sprd_i2c_clear_ack() in PATCH 3/7.
> -Modify the indentation format of the code in PATCH 4/7.
> -Move sprd_i2c_enable() above its caller in PATCH 5/7.
> -Remove 'Set I2C_RX_ACK when clear irq' commit.
> -Add Fixes tags. 
> 
> Huangzheng Lai (7):
>   i2c: sprd: Add configurations that support 1Mhz and 3.4Mhz frequencies
>   i2c: sprd: Add I2C driver to use 'reset framework' function
>   i2c: sprd: Use global variables to record I2C ack/nack status instead
>     of local variables
>   i2c: sprd: Add I2C controller driver to support dynamic switching of
>     400K/1M/3.4M frequency
>   i2c: sprd: Configure the enable bit of the I2C controller before each
>     transmission initiation
>   i2c: sprd: Increase the waiting time for I2C transmission to avoid
>     system crash issues
>   i2c: sprd: Add I2C_NACK_EN and I2C_TRANS_EN control bits
> 
>  drivers/i2c/busses/i2c-sprd.c | 166 ++++++++++++++++++++++------------
>  1 file changed, 106 insertions(+), 60 deletions(-)
> 
> -- 
> 2.17.1
> 
