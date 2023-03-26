Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE2EA6C9617
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Mar 2023 17:18:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232495AbjCZPSb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Mar 2023 11:18:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbjCZPSa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 26 Mar 2023 11:18:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 587A43A9A;
        Sun, 26 Mar 2023 08:18:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CE8B860EF4;
        Sun, 26 Mar 2023 15:18:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A22AC433D2;
        Sun, 26 Mar 2023 15:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679843908;
        bh=dRkbT8k8JB54wN8VkwpYOPGFzgXukJhwGApsL5yVy9o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ov+xIDwSXwTRXWLvbjMQFoPbc9q+DEtq1iNSymFSye3vh46PJ8xXeNz4/afDbfUNU
         C6Uwkc6tcmuuYzk++JcQkfrNNrcv0xGPG4wyUyBlpkHVCkseKzIPIFnZnhAw9ARIJC
         bYBl6UO26nQY4KjYnVYrqiT3/jnpBjnmBf+3DLCwNA5NZCvRRn6nEgYYSVYCUfgwH9
         Ny+X8Y3fwJGtIYPUafe3UmLYgbyupH1BBy8o90WImg/qsWfYQNnnmJ56khaNYSl5FO
         /CXLzqvyj/u/g2A8yugn2M9cavNlrazLb8Bbs763MBtEyo2S38Q2/2wygBaM0b2tyG
         G7YFAIiDu8akA==
Date:   Sun, 26 Mar 2023 17:18:23 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Ye Xiang <xiang.ye@intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
        srinivas.pandruvada@intel.com, heikki.krogerus@linux.intel.com,
        andriy.shevchenko@linux.intel.com, sakari.ailus@linux.intel.com,
        zhifeng.wang@intel.com, wentong.wu@intel.com, lixu.zhang@intel.com
Subject: Re: [PATCH v6 2/6] usb: ljca: Add transport interfaces for
 sub-module drivers
Message-ID: <20230326151823.vrmboykkzwhfbmpz@intel.intel>
References: <20230323172113.1231050-1-xiang.ye@intel.com>
 <20230323172113.1231050-3-xiang.ye@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230323172113.1231050-3-xiang.ye@intel.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Ye,

On Fri, Mar 24, 2023 at 01:21:09AM +0800, Ye Xiang wrote:
> This patch adds the transport interfaces for various LJCA

please, here and in the other patches, keep using the imperative
form, as in the subject.

> sub-module drivers to communicate with LJCA hardware. The
> sub-module of LJCA can use ljca_transfer() to issue a transfer
> between host and hardware. And ljca_register_event_cb is exported
> to LJCA sub-module drivers for hardware event subscription.
> 
> Signed-off-by: Ye Xiang <xiang.ye@intel.com>
> ---
>  drivers/usb/misc/ljca.c  | 47 ++++++++++++++++++++++++++++
>  include/linux/usb/ljca.h | 66 ++++++++++++++++++++++++++++++++++++++++

Why havne't you added this in the previous patch?

>  2 files changed, 113 insertions(+)

[...]

> +/**
> + * typedef ljca_event_cb_t - event callback function signature
> + *
> + * @context: the execution context of who registered this callback
> + * @cmd: the command from device for this event
> + * @evt_data: the event data payload
> + * @len: the event data payload length
> + *
> + * The callback function is called in interrupt context and the data payload is
> + * only valid during the call. If the user needs later access of the data, it
> + * must copy it.
> + */
> +typedef void (*ljca_event_cb_t)(void *context, u8 cmd, const void *evt_data, int len);

I'm not very enthusiastic about this typedef here. Is it
providing a real improvement? As far as I can see it's used only
in one occasion.

I don't have a strong opinion on this, though.

Andi
