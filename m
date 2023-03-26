Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A8826C95E1
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Mar 2023 17:02:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230206AbjCZPCd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Mar 2023 11:02:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbjCZPCc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 26 Mar 2023 11:02:32 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDAE3213F;
        Sun, 26 Mar 2023 08:02:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 63BDBB80CA7;
        Sun, 26 Mar 2023 15:02:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E9C1C433EF;
        Sun, 26 Mar 2023 15:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679842949;
        bh=dAwvdcQMLX/kWoENcNEUlS6j4GfV4F+aixjK1o/KG2c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SbLh6N52ir1TPrCLXQAX49pYULRuQwiAduLhNvemmudEBnqU8dTkmn6UNeYMiGiTj
         37TA0apD+tYxDxiL6JJwvLQANkmLoGNEDDhbiPWTcqEEayUsLl/ulWg0ee4o2GF2LF
         6UYPEXLfQJpbtFOsSMfQv/Y94ixQY2lR4LdLfzaizWDBYTQyfSLk4X7kJg+nU4JMTs
         8QKluaXKXJH6CK8BlaeGBC6T2pw3l91NB/nDYjoyT+uQMZXTpBH/Fjnf8TOmbEc6Ie
         Ks2f1g2u5QK7Lzl+uV6X/P2+CLCkGu8icfz9T3Z3J2sgvl7DlsYKeRWV4ePviPzdFo
         99H0AAKFvtDEQ==
Date:   Sun, 26 Mar 2023 17:02:25 +0200
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
Subject: Re: [PATCH v6 1/6] usb: Add support for Intel LJCA device
Message-ID: <20230326150225.p5m4fxcwmhwdmtd3@intel.intel>
References: <20230323172113.1231050-1-xiang.ye@intel.com>
 <20230323172113.1231050-2-xiang.ye@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230323172113.1231050-2-xiang.ye@intel.com>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Ye,

> +static void ljca_read_complete(struct urb *urb)
> +{
> +	struct ljca_msg *header = urb->transfer_buffer;
> +	struct ljca_dev *dev = urb->context;
> +	int len = urb->actual_length;
> +	int ret;
> +
> +	WARN_ON_ONCE(!dev);
> +	WARN_ON_ONCE(!header);

WARN_* macros should be used when we can recover from that
condition, while we are running straight to a NULL pointer
dereference.

If !dev or !header is not a warning but a "bug", so either you
make sure we don't go ahead or remove the check.

The rest looks fairly good,
Andi
