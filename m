Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3834528344
	for <lists+linux-i2c@lfdr.de>; Mon, 16 May 2022 13:31:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243160AbiEPLbb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 May 2022 07:31:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243193AbiEPLbK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 May 2022 07:31:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04B88270E;
        Mon, 16 May 2022 04:31:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9AB2660FEB;
        Mon, 16 May 2022 11:31:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FD1DC385B8;
        Mon, 16 May 2022 11:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652700668;
        bh=ZUEmliErSd51RiMCP41XFunKKxEzgbyR6TU1VDmqeFg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OwHwwzsfSzLP0Uce40JHWVOXb60biukmdN90zMYRkS5G9tzrnmYjYUW7T9kRkPIAI
         vE2lIUrrlFNJBG4JrjnEs55gi5D5ycBEEl7YRix30Qqlkn23RtPftT0VwGey/IeNfm
         6eF2mgsVxQNwdNmLgkUGQiqhOVJHKmuLiX5pOE39dh3A6GVdOluffWB8cQ4ouVoRvu
         AEOtc5EOeJMvYJRv1hts3L6KpcRf8bvFSkhQSMRN2Qyb12RUUmQyB1YXEd1UpULbe6
         XV4wn3zHRRFRRhw4WaNrUhlB5Z4NhDLcL4mQe4tCWp2TCLvbS8IXNVfOsws8kkTZis
         L66BD/UsAC+jw==
Date:   Mon, 16 May 2022 17:01:04 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-i2c@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 4/7] dt-bindings: renesas,rcar-dmac: R-Car V3U is R-Car
 Gen4
Message-ID: <YoI1+HDb9Sr4mWmB@matsya>
References: <cover.1651497024.git.geert+renesas@glider.be>
 <e6e4cf701f3a43b061b9c3f7f0adc4d6addd4722.1651497024.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6e4cf701f3a43b061b9c3f7f0adc4d6addd4722.1651497024.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 02-05-22, 15:34, Geert Uytterhoeven wrote:
> Despite the name, R-Car V3U is the first member of the R-Car Gen4
> family.  Hence move its compatible value to the R-Car Gen4 section.

Applied, thanks

-- 
~Vinod
