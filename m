Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE834762074
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jul 2023 19:49:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231574AbjGYRte (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jul 2023 13:49:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230408AbjGYRtc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jul 2023 13:49:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA79CF7;
        Tue, 25 Jul 2023 10:49:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5BDA761852;
        Tue, 25 Jul 2023 17:49:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C4F6C433C8;
        Tue, 25 Jul 2023 17:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690307369;
        bh=w7dbONTIy2Co3mAFj/AcsnLbCERRs5c4tblF0g/VRPU=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=qRmvy9rHWcDnpixwhpi8DTuQcPdUyIZr5ZNx9ydG3F5boc73mSyEcLxTRGyRsCrB3
         vClccnArnxXoaiGAgIdoaS2+TOFRAoqZK63Wk0bXfrXFknhfb+CydSPKk0rOsuu3hH
         TLEWzXb38mM81F0bbsLAvvpzt0taCiE7A8213w6F+7Ut1V3wYK9UY5byb1RK9gdLLH
         A8/Iy7F8eWp47Q1Fq/3T9a96ynyIDqiSA2oI0PcsUAwZGhiXzTUnrxDNnd0AH129MP
         pymfYyEwQoff+K9nqQse31QUqBocLgoqy3MvVJHBF8sdscLUh2TInqE0lKi9416xVB
         K25mir6FU0ktQ==
Received: (nullmailer pid 3497934 invoked by uid 1000);
        Tue, 25 Jul 2023 17:49:25 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc:     kuba@kernel.org, will@kernel.org, linux-serial@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
        linux-spi@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
        lee@kernel.org, robh+dt@kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, arnaud.pouliquen@foss.st.com,
        Oleksii_Moisieiev@epam.com, arnd@kernel.org,
        hugues.fruchet@foss.st.com, ulf.hansson@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jic23@kernel.org, alexandre.torgue@foss.st.com, pabeni@redhat.com,
        andi.shyti@kernel.org, netdev@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
        edumazet@google.com, vkoul@kernel.org, dmaengine@vger.kernel.org,
        catalin.marinas@arm.com, herbert@gondor.apana.org.au,
        fabrice.gasnier@foss.st.com, mchehab@kernel.org,
        linux-iio@vger.kernel.org, richardcochran@gmail.com,
        davem@davemloft.net, conor+dt@kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
        linux-crypto@vger.kernel.org, linux-i2c@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, olivier.moysan@foss.st.com
In-Reply-To: <20230725164104.273965-2-gatien.chevallier@foss.st.com>
References: <20230725164104.273965-1-gatien.chevallier@foss.st.com>
 <20230725164104.273965-2-gatien.chevallier@foss.st.com>
Message-Id: <169030736341.3497818.1740404012211043486.robh@kernel.org>
Subject: Re: [IGNORE][PATCH v2 01/11] dt-bindings: Document common device
 controller bindings
Date:   Tue, 25 Jul 2023 11:49:25 -0600
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On Tue, 25 Jul 2023 18:40:54 +0200, Gatien Chevallier wrote:
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230725164104.273965-2-gatien.chevallier@foss.st.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

