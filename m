Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC26F6C9143
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Mar 2023 23:27:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229730AbjCYW1L (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 Mar 2023 18:27:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjCYW1K (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 25 Mar 2023 18:27:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F79E7ECF;
        Sat, 25 Mar 2023 15:27:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7452560DB9;
        Sat, 25 Mar 2023 22:27:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42DA0C433D2;
        Sat, 25 Mar 2023 22:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1679783226;
        bh=Q1bKTClEuBaOpbRZAO3AJ33e5TyraS8c50q00hE8OrM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U+6nM9g0zg7W2kYLAN9MJ/gl+50xPyW1wq7KwPEk1OaOcaEUCfzrIEhb15Sy1taM/
         i5fnBonLNHyFVCgWHCvsLTFbKy2pp24iQVny7NtTIuhxEsL/WCQaVkKQl0oCln4g4U
         ewnEBpMoZW1VqyW9QPvp1ZtY8kTvH9zt2XIVkync=
Date:   Sat, 25 Mar 2023 23:27:03 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Ye Xiang <xiang.ye@intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
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
Subject: Re: [PATCH v7 1/6] usb: Add support for Intel LJCA device
Message-ID: <ZB91Nz52TEd34IST@kroah.com>
References: <20230325154711.2419569-1-xiang.ye@intel.com>
 <20230325154711.2419569-2-xiang.ye@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230325154711.2419569-2-xiang.ye@intel.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Mar 25, 2023 at 11:47:06PM +0800, Ye Xiang wrote:
> +static void ljca_aux_release(struct device *dev) {}

Sorry, but creating an empty release function just to shut the kernel up
is NOT how to properly do this, you all know better.  This is totally
broken.  The kernel was telling you what you had to do, don't think that
you are being smarter than it by doing this, otherwise we would have
never had the kernel spit out that error in the first place, right?

Now I will ask you to follow the proper Intel kernel review rules and
get proper approval for the patchset before submitting it to us again,
as basic things like this are not supposed to be caught by us, but by
your internal review process first.

good luck!

greg k-h
