Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E36D06BF4EF
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Mar 2023 23:13:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229932AbjCQWNj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Mar 2023 18:13:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbjCQWNi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Mar 2023 18:13:38 -0400
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B14B532A8;
        Fri, 17 Mar 2023 15:13:36 -0700 (PDT)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 2EF9720002;
        Fri, 17 Mar 2023 22:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1679091214;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=eqxKutKiqW8yb2sPT5I6IOs38EHv69itxPuXft2vTRA=;
        b=AbsH0TjoP6YcpQsD+UJ+eJekzztouvgcCeWA2NlIs0pjV7MpzkjbqVA48XdcBYQLK8f8IV
        g38lBx8f21+94whY7EBbNXB4OT9l/XbjfPrfUR+UQrElDTAd82JqXq1qm0q2HF4VeoCVxg
        hXjnzuYZ3sK7S6HiY8aYU8zOHwAaK/SFn77zRqWcv8c5ADq+RCcR8He/Ac9vc7eHhV7bXS
        /jL+O67DQidklXIf5le3d3+atjpZfiCs8TaLVtuFlhFcDFAFThDSxbmXfd7Iqbvbk8qxly
        XNFCVknlDusaQbfgP0m/5Cn5nAkwGekIz3Vn+eCEArSWqT8H+mDLsaLqx0H8cw==
Date:   Fri, 17 Mar 2023 23:13:32 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>
Cc:     Conor Dooley <conor.dooley@microchip.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        linux-clk@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>,
        linux-kernel@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        linux-i2c@vger.kernel.org,
        Daire McNamara <daire.mcnamara@microchip.com>
Subject: Re: (subset) [PATCH v1 4/5] rtc: mpfs: convert
 SOC_MICROCHIP_POLARFIRE to ARCH_MICROCHIP_POLARFIRE
Message-ID: <167909119653.115559.4747292512289955247.b4-ty@bootlin.com>
References: <20230309204452.969574-1-conor@kernel.org>
 <20230309204452.969574-5-conor@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230309204452.969574-5-conor@kernel.org>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On Thu, 09 Mar 2023 20:44:51 +0000, Conor Dooley wrote:
> As part of converting RISC-V SOC_FOO symbols to ARCH_FOO to match the
> use of such symbols on other architectures, convert the Microchip FPGA
> RTC driver to use the new symbol.
> 
> 

Applied, thanks!

[4/5] rtc: mpfs: convert SOC_MICROCHIP_POLARFIRE to ARCH_MICROCHIP_POLARFIRE
      commit: f12f0c7da37c58da92bd4a6bdc469df7e0b2da5e

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
