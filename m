Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C25AB75E4C9
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Jul 2023 22:23:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbjGWUXL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 23 Jul 2023 16:23:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjGWUXL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 23 Jul 2023 16:23:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BED099;
        Sun, 23 Jul 2023 13:23:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id ED5D060E97;
        Sun, 23 Jul 2023 20:23:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9F82C433C8;
        Sun, 23 Jul 2023 20:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690143789;
        bh=DwAAkH1bLGE7cpqCch+5dExh9p0ZRfTwJ135THXy71U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mOr372tQOdIdEbWTTTAJ/Sx91nnZMLl82Fjrbr2LQx+srOoEiKrlkpMkpabyVy+Zd
         qKrtD9vkeqQEqSCzef3WaOwOET5m8uKWZjVxMhZTTEvc899XqDs1k6crHojJly5lRn
         nljfGxE6VNPQae1sI8vVbKZjphYTI/i5iKI8qxCnpxp2HXVlYBwL2TU2IEa1Ke5HbV
         RD8oOannaaMwvkdmBVwbk6o8CkIgr9Gd8QihucmoKDGKf1zfsUPCBEvQW1EzC+MTB6
         IjawUbpPNQGZ5iMPSNkDXUF1KwubiN4YzVkLxLJVuKJ7x01V/Vvh51hv1lk2dRNIEG
         XxXQOL68kPttg==
Date:   Sun, 23 Jul 2023 22:23:06 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Peter Rosin <peda@axentia.se>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: i2c: nxp,pca9541: convert to DT schema
Message-ID: <20230723202306.67mbnekcehf7p2sv@intel.intel>
References: <20230722095710.17496-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230722095710.17496-1-krzysztof.kozlowski@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Krzysztof,

On Sat, Jul 22, 2023 at 11:57:09AM +0200, Krzysztof Kozlowski wrote:
> Convert the bindings for NXP PCA9541 I2C bus master selector to DT
> schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Andi Shyti <andi.shyti@kernel.org> 

Andi
