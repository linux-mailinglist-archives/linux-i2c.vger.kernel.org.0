Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5146785A25
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Aug 2023 16:14:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236158AbjHWOO5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Aug 2023 10:14:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236129AbjHWOO4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Aug 2023 10:14:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2C10E50;
        Wed, 23 Aug 2023 07:14:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8B8BE62998;
        Wed, 23 Aug 2023 14:14:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3736C433C7;
        Wed, 23 Aug 2023 14:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692800093;
        bh=FcQpQd6uewg0sBGOD/RtwggJkKVvr3suvpM7zaZCh7w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Tav08oUOHXxmNuObw8pAmnvjJKWEHYYBvPOnYmFqaBzijKtmoGiT2Vm40pFM3Cbtv
         1Dve2eHnVvwibUb9/+R1jKRfs1EtggdBv7NSjrCshvAUHfAkjFIIa0tw5BJGr4/FYL
         FbQ6tn7J407iofwmv0V0fkzY/RSjXVI0Pw1gdgw+JDeKjIcYITetJKil/hsykXUIYZ
         MBMnK6DHHMigXCKQK95M2Xs61pYmhhKV8VvWJ99uru6DjOCM6991A8vAYAijHp6eOS
         s2zpCkOTuifd3UbSX1HSHqhMSahNpzmBBHP9SP9sxSNfPxnTsTLYZcTPLcjl9y6KYZ
         MULUv1lDiN0Fg==
Date:   Wed, 23 Aug 2023 16:14:48 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     Peter Rosin <peda@axentia.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        naresh.solanki@9elements.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [v16 1/4] dt-bindings: i2c: pca954x: Correct interrupt support
Message-ID: <20230823141448.qdc4h3hulwmasiar@intel.intel>
References: <20230821062027.2631725-1-patrick.rudolph@9elements.com>
 <20230821062027.2631725-2-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230821062027.2631725-2-patrick.rudolph@9elements.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Patrick,

On Mon, Aug 21, 2023 at 08:20:21AM +0200, Patrick Rudolph wrote:
> Only some of the PCA954x compatible ICs have interrupt
> capability, but the binding advertises it on all ICs.
> 
> Sync the dt-binding with the driver and only advertise it on:
>  - nxp,pca9542
>  - nxp,pca9543
>  - nxp,pca9544
>  - nxp,pca9545
> 
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

you forgot:

Acked-by: Peter Rosin <peda@axentia.se>

Adding it for b4 and patchwork.

Thanks,
Andi
