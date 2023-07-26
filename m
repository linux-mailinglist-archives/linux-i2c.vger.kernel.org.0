Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C64307635E7
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jul 2023 14:13:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233776AbjGZMNH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jul 2023 08:13:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233804AbjGZMNA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Jul 2023 08:13:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3B0D1739;
        Wed, 26 Jul 2023 05:12:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2CC1A61ACC;
        Wed, 26 Jul 2023 12:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73356C433C8;
        Wed, 26 Jul 2023 12:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690373578;
        bh=Ke8AONnAOWupVgvu9a1rrtccA5xWjVMePJQxM8Ht3Kc=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=gYrqFr8wvj2MJmmwmwf8M6I8rekTV9+bxmW2rqLD55Qm7Z/X+3fqo2oPfopkxdlCi
         n241AQBCMxM7eFrih3i3Sbv5AKj0bq28ozziIAExFd7E/RXMMNS1aKn+yJARtnBmU4
         FfN14X79faCpLGre6x+vnvwoxjIsG/L/ooLw+V13rcjVx7tIPmq/1O2zG9aawBpzTf
         uhcvPI4MEqZ0fNFaHRBAISQWggi8tN88wV4MzFoUqwVN0pOsQ3BgyiTak4/MrtL+0t
         6GpQd+/9rUTZVGi45edSMIe9j4qSBoulHPW7gK71wysfs2CSJoMHtELswVidt7IBP2
         x+DypAIC/tqTg==
Received: (nullmailer pid 1182938 invoked by uid 1000);
        Wed, 26 Jul 2023 12:12:54 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc:     linux-mmc@vger.kernel.org, gregkh@linuxfoundation.org,
        lee@kernel.org, catalin.marinas@arm.com, jic23@kernel.org,
        hugues.fruchet@foss.st.com, richardcochran@gmail.com,
        will@kernel.org, arnd@kernel.org, davem@davemloft.net,
        Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Oleksii_Moisieiev@epam.com, linux-phy@lists.infradead.org,
        linux-crypto@vger.kernel.org, kuba@kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
        vkoul@kernel.org, linux-arm-kernel@lists.infradead.org,
        edumazet@google.com, devicetree@vger.kernel.org,
        linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-stm32@st-md-mailman.stormreply.com,
        herbert@gondor.apana.org.au, linux-i2c@vger.kernel.org,
        alexandre.torgue@foss.st.com, mchehab@kernel.org,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        ulf.hansson@linaro.org, netdev@vger.kernel.org,
        andi.shyti@kernel.org, olivier.moysan@foss.st.com,
        linux-serial@vger.kernel.org, pabeni@redhat.com,
        arnaud.pouliquen@foss.st.com, dmaengine@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-media@vger.kernel.org,
        conor+dt@kernel.org, fabrice.gasnier@foss.st.com
In-Reply-To: <20230726083810.232100-2-gatien.chevallier@foss.st.com>
References: <20230726083810.232100-1-gatien.chevallier@foss.st.com>
 <20230726083810.232100-2-gatien.chevallier@foss.st.com>
Message-Id: <169037357425.1182922.8121576517266921442.robh@kernel.org>
Subject: Re: [IGNORE][PATCH v3 01/11] dt-bindings: Document common device
 controller bindings
Date:   Wed, 26 Jul 2023 06:12:54 -0600
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On Wed, 26 Jul 2023 10:38:00 +0200, Gatien Chevallier wrote:
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
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/feature-controllers/feature-domain-controller.yaml: title: 'Generic Domain Controller bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230726083810.232100-2-gatien.chevallier@foss.st.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

