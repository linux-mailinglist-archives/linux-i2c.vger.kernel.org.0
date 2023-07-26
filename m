Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96290763098
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jul 2023 10:56:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233435AbjGZI4X (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jul 2023 04:56:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232670AbjGZIzh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Jul 2023 04:55:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B8734689;
        Wed, 26 Jul 2023 01:49:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E420361874;
        Wed, 26 Jul 2023 08:48:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA1DEC433C7;
        Wed, 26 Jul 2023 08:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1690361300;
        bh=TVkm71Dj8e6ZNnwjoIIRsgr0o73kkDOfdDDGNd/kDBU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SyVWd+uTTovinaUIsKyOKRWsGKy/aLlm2Gr/MJvvS4WfCf6sK8/jBKlvkNxs5W7HP
         WvRM0Wa9pGKgHFSre3z/gWuyTgrF6WknjGkRSfjsy/p3lrwDA6dUdX+nWG/cw1UXx7
         rzwXalMlJ582UPLADRhbsG/xCLp3uJhZRpjWwLvs=
Date:   Wed, 26 Jul 2023 10:48:17 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc:     Oleksii_Moisieiev@epam.com, herbert@gondor.apana.org.au,
        davem@davemloft.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        alexandre.torgue@foss.st.com, vkoul@kernel.org, jic23@kernel.org,
        olivier.moysan@foss.st.com, arnaud.pouliquen@foss.st.com,
        mchehab@kernel.org, fabrice.gasnier@foss.st.com,
        andi.shyti@kernel.org, ulf.hansson@linaro.org, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, hugues.fruchet@foss.st.com,
        lee@kernel.org, will@kernel.org, catalin.marinas@arm.com,
        arnd@kernel.org, richardcochran@gmail.com,
        Frank Rowand <frowand.list@gmail.com>,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
        netdev@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [IGNORE][PATCH v3 01/11] dt-bindings: Document common device
 controller bindings
Message-ID: <2023072605-removed-pacemaker-faff@gregkh>
References: <20230726083810.232100-1-gatien.chevallier@foss.st.com>
 <20230726083810.232100-2-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230726083810.232100-2-gatien.chevallier@foss.st.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jul 26, 2023 at 10:38:00AM +0200, Gatien Chevallier wrote:
> From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
> 
> Introducing of the common device controller bindings for the controller
> provider and consumer devices. Those bindings are intended to allow
> divided system on chip into muliple domains, that can be used to
> configure hardware permissions.
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> ---
>  .../feature-domain-controller.yaml            | 84 +++++++++++++++++++
>  1 file changed, 84 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/feature-controllers/feature-domain-controller.yaml

What is the [IGNORE] prefix for?

