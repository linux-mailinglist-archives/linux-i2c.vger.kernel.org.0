Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B1765B5C8C
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Sep 2022 16:43:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbiILOnv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Sep 2022 10:43:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230300AbiILOn1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Sep 2022 10:43:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00E1E33E1C;
        Mon, 12 Sep 2022 07:43:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5700A61228;
        Mon, 12 Sep 2022 14:43:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 805E2C433D7;
        Mon, 12 Sep 2022 14:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662993785;
        bh=8q7sQRLBkr/aJNp2SqM4mFrliouu2o3pH/py04HNK7s=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=auqjrBeSmRH/Cw+BJ/MAfJBu6zvI0gNLvghEes5R+zkJ9nsO8HomqBJpfqwo2bePn
         NWJuPSF1zI6P2rosNFRO7wcMn/I2K8m8khTWs5v90zM+VXm9i51AUBCF9Il7y6h200
         ghL/LrxglqhTk1x0XLTGLBS8oE4X5hKJ0cI4tXKHGYATI3qi4xWzT1hCEenJldYKyq
         /jhQ3QlyWR0Ry3MtI7VqW21ZEjfpIbyH0h6odE/T9lwFm2S5LmfXiHgPiuvmMnx6MR
         C0jxhwqfyVm5GtHozaQ0gyY+3uMGRvxu3kH9MQQtS9b1dEaz2q4rzmvyhTGxoCZEcK
         tn/lTsrDQ8A8A==
Date:   Mon, 12 Sep 2022 15:43:03 +0100
From:   Jonathan Cameron <jic23@kernel.org>
To:     Matt Ranostay <matt.ranostay@konsulko.com>
Cc:     gupt21@gmail.com, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org, Matt Ranostay <matt@ranostay.org>
Subject: Re: [PATCH v2 0/5] HID: mcp2221: iio support and device resource
 management
Message-ID: <20220912154303.636a5150@jic23-huawei>
In-Reply-To: <20220911014048.64235-1-matt.ranostay@konsulko.com>
References: <20220911014048.64235-1-matt.ranostay@konsulko.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, 10 Sep 2022 18:40:43 -0700
Matt Ranostay <matt.ranostay@konsulko.com> wrote:

> From: Matt Ranostay <matt@ranostay.org>
> 
> This patchset is primarily to enable iio support for the MCP2221 HID driver,
> but requires several Kconfig changes and device resource management.
> 
> First attempt of this patchset is referenced here:
> 
> Link: https://lore.kernel.org/all/20220729154723.99947-1-matt.ranostay@konsulko.com/

Hi Matt,

Please resend v2 including cc for linux-iio.
Otherwise, unlikely to get relevant review.

Thanks,

Jonathan



> 
> Changes from v1:
> * Fixing various Kconfig recursive dependencies that appear with 'imply IIO'
> * Switch hid-mcp2221 driver to device managed resources for i2c support
> * Reworking patchset per advice on lore.kernel.org link above
> 
> Matt Ranostay (5):
>   i2c: muxes: ltc4306: fix future recursive dependencies
>   iio: addac: stx104: fix future recursive dependencies
>   iio: dac: fix future recursive dependencies
>   HID: mcp2221: switch i2c registration to devm functions
>   HID: mcp2221: add ADC/DAC support via iio subsystem
> 
>  drivers/hid/Kconfig       |   1 +
>  drivers/hid/hid-mcp2221.c | 196 ++++++++++++++++++++++++++++++++++++--
>  drivers/i2c/muxes/Kconfig |   2 +-
>  drivers/iio/addac/Kconfig |   3 +-
>  drivers/iio/dac/Kconfig   |   6 +-
>  5 files changed, 195 insertions(+), 13 deletions(-)
> 

