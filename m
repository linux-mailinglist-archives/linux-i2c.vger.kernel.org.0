Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2BB45EA5E1
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Sep 2022 14:24:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237013AbiIZMYB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Sep 2022 08:24:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239566AbiIZMXm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Sep 2022 08:23:42 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6261F5B0;
        Mon, 26 Sep 2022 04:05:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id E2E71CE112D;
        Mon, 26 Sep 2022 10:52:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32D4DC433C1;
        Mon, 26 Sep 2022 10:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664189535;
        bh=wnYhs7jAUggU0dbfucW6KJWaoydP5RmbozPnNwY8epU=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=CD3ZTcXW9aimUzQSaE4M4AQ9fGvDSYokYn2Ron18UZhxRdAcOyJtHKLax2WZ62KPy
         SsaWp7sD6zD2DxFZEGKI5SFPB1cCI5x9JbLZTHSrjMGSxkllED95bD4WXjDGW2roHj
         De2peKL9PfXtu2guEEfOJvUkYt7jQWChDkKjTtBsoDGWh/BjaXI+BhJN8Zx4QbU6cI
         rNt5v7LsktXCndHyTK/zuVFVU9WsUh13bI2Cb/YBx0Ce/riwynw0BHhV2HHTswGyM2
         UlS9PaPg68cdloiBd+v7P2oS/bZt4zquL2K2gWKINe/hXI9WuHe79XPLNJyi7+b+9h
         Yt+VCkjjlbpZw==
Message-ID: <55f7b60c-85a2-5950-731a-1b578e27ae0d@kernel.org>
Date:   Mon, 26 Sep 2022 12:52:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH RFC i2c-master] i2c: microchip: pci1xxxx: Load I2C driver
 for I2C endpoint of pci1xxxx switch
Content-Language: en-US
To:     Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        wsa@kernel.org
Cc:     andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
        robh@kernel.org, semen.protsenko@linaro.org, sven@svenpeter.dev,
        jsd@semihalf.com, rafal@milecki.pl, olof@lixom.net, arnd@arndb.de,
        UNGLinuxDriver@microchip.com
References: <20220926082642.2578447-1-tharunkumar.pasumarthi@microchip.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220926082642.2578447-1-tharunkumar.pasumarthi@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-9.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 26/09/2022 10:26, Tharun Kumar P wrote:
> Microchip PCI1XXXX is an unmanaged PCIe3.1a Switch for Consumer,
> Industrial and Automotive applications. This switch has multiple
> downstream ports. In one of the Switch's Downstream port, there
> is a peripheral endpoint which supports I2C functionality. The I2C
> function in the endpoint operates at 100KHz, 400KHz and 1 MHz and
> has buffer depth of 128 bytes.
> This series of patches provides the I2C controller driver for the
> I2C endpoint of the switch.
> 
> Signed-off-by: Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>
> ---

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  Do not Cc unrelated people.

Best regards,
Krzysztof

