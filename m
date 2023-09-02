Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06FFE79091D
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Sep 2023 20:20:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230403AbjIBSUG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Sep 2023 14:20:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjIBSUF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 2 Sep 2023 14:20:05 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5693AE42;
        Sat,  2 Sep 2023 11:20:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 6B291CE2612;
        Sat,  2 Sep 2023 18:20:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 326C6C433C7;
        Sat,  2 Sep 2023 18:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693678798;
        bh=kSTXJu2LifPnDFtaEshhrHis7F+Xq8ko8qhmrLR+JoY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QgN0tdB1N0LEcFOfjA9UW/MBCwry31mHEJf74GWgF9jD9pK6ui5AF0LTAVt3uqyJi
         0H1tW5LMt80DnjhPIHGQD/5p4HeUG9FTC1oVyfaUR2hMMO+awcepnUFFtKvo9YpNI0
         j06+ZoY0K3BbjeKX3JD8MTybS6RzcNP4wZ7hUyjVudZS/ZPt8VCcY7kXQiIMu1u8O1
         FmM6Fk2IbfT7YmRLGQZQX13Su2lUffuN6Hajpyc6wh0vAu4otlBlQ064wR7RbJ63tE
         dZyRDdpC5DnoirHEmXjm1ch15lOj7W1CLbGmQl+VwUu+JQHyGU2wxB7PLIaPWGhuh4
         HuzO+Hwd5nLnQ==
Date:   Sat, 2 Sep 2023 20:19:54 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Wentong Wu <wentong.wu@intel.com>
Cc:     gregkh@linuxfoundation.org, arnd@arndb.de, mka@chromium.org,
        oneukum@suse.com, lee@kernel.org, wsa@kernel.org,
        kfting@nuvoton.com, broonie@kernel.org, linus.walleij@linaro.org,
        maz@kernel.org, brgl@bgdev.pl, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        heikki.krogerus@linux.intel.com, andi.shyti@linux.intel.com,
        sakari.ailus@linux.intel.com, bartosz.golaszewski@linaro.org,
        srinivas.pandruvada@intel.com, zhifeng.wang@intel.com
Subject: Re: [PATCH v12 2/4] i2c: Add support for Intel LJCA USB I2C driver
Message-ID: <20230902181954.xgdth4flatyn6cip@zenone.zhora.eu>
References: <1693546577-17824-1-git-send-email-wentong.wu@intel.com>
 <1693546577-17824-3-git-send-email-wentong.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1693546577-17824-3-git-send-email-wentong.wu@intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

[...]

> +	if (ret < 0 || ret < sizeof(*r_packet)) {
> +		dev_dbg(&ljca_i2c->adap.dev,
> +			"i2c stop failed ret: %d id: %d\n",
> +			ret, w_packet->id);
> +		return;
> +	}

your comment here has been addressed. This commit depends on
the first patch how do we get this in?

Thanks,
Andi
