Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 164C87A3531
	for <lists+linux-i2c@lfdr.de>; Sun, 17 Sep 2023 12:38:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235120AbjIQKiV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 17 Sep 2023 06:38:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232729AbjIQKht (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 17 Sep 2023 06:37:49 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CA58189;
        Sun, 17 Sep 2023 03:37:42 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AD33C433C7;
        Sun, 17 Sep 2023 10:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694947062;
        bh=4/Gw1SFTBjci8OQuJMKDefl9/7GmcrRv2LjfNFXEdd4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=secIg48vVa1OpmDXDivflir36SyP+d3WRXohoPWDtVq+yJ4PG52qthhvMSylNXA1k
         0G/GQ3kSFTJKZioI/4qM4j60uD11yxLiB306RxohDIZgRgXMMxn62QxF3Upb6wK3nl
         3XJugAbZ8zwVAQihdDkbfBlK2MGaNaWjBh1j1TOsS7n7PlbDJJdpPKRVbnbDPWWJuz
         5x6dM7LT/4kI01ND7SXwfO0ts092DX1U6rxyWPJtWIIyjZxxP2Nd4U51v6F4tJqOq1
         I6DEb3tw0DUaEpkIs2KKtvgl6H5ZB/lIgilqB79C1dijvzTjmWuO+6cqt5HICpYefO
         U5kqFaAfrcmgw==
Received: from disco-boy.misterjones.org ([217.182.43.188] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <maz@kernel.org>)
        id 1qhp9n-00Dh3t-91;
        Sun, 17 Sep 2023 11:37:39 +0100
MIME-Version: 1.0
Date:   Sun, 17 Sep 2023 11:37:38 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Wentong Wu <wentong.wu@intel.com>
Cc:     gregkh@linuxfoundation.org, arnd@arndb.de, mka@chromium.org,
        oneukum@suse.com, lee@kernel.org, wsa@kernel.org,
        kfting@nuvoton.com, broonie@kernel.org, linus.walleij@linaro.org,
        hdegoede@redhat.com, brgl@bgdev.pl, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        heikki.krogerus@linux.intel.com, andi.shyti@linux.intel.com,
        sakari.ailus@linux.intel.com, bartosz.golaszewski@linaro.org,
        srinivas.pandruvada@intel.com, zhifeng.wang@intel.com
Subject: Re: [PATCH v19 0/4] Add Intel LJCA device driver
In-Reply-To: <1694890416-14409-1-git-send-email-wentong.wu@intel.com>
References: <1694890416-14409-1-git-send-email-wentong.wu@intel.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <e0e40b3603525266d585a276f50a6879@kernel.org>
X-Sender: maz@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 217.182.43.188
X-SA-Exim-Rcpt-To: wentong.wu@intel.com, gregkh@linuxfoundation.org, arnd@arndb.de, mka@chromium.org, oneukum@suse.com, lee@kernel.org, wsa@kernel.org, kfting@nuvoton.com, broonie@kernel.org, linus.walleij@linaro.org, hdegoede@redhat.com, brgl@bgdev.pl, linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com, heikki.krogerus@linux.intel.com, andi.shyti@linux.intel.com, sakari.ailus@linux.intel.com, bartosz.golaszewski@linaro.org, srinivas.pandruvada@intel.com, zhifeng.wang@intel.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2023-09-16 19:53, Wentong Wu wrote:
> Add driver for Intel La Jolla Cove Adapter (LJCA) device. This
> IO-expander adds additional functions to the host system such
> as GPIO, I2C and SPI with USB host interface. We add 4 drivers
> to support this device: a USB driver, a GPIO chip driver, a I2C
> controller driver and a SPI controller driver.

Can I be a pain and ask you to limit the rate at which you
repost this series? You send it every other day, hence
actively discouraging people from reviewing it (why would
they, there's another version coming).

Once a week is a perfectly good rate, and would probably
lead to better results.

Alternatively, if you decide that you really want to keep
sending it that often, please drop me from the Cc list.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
