Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2944D750CAE
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jul 2023 17:37:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233664AbjGLPhn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jul 2023 11:37:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233645AbjGLPhd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Jul 2023 11:37:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5038110C4;
        Wed, 12 Jul 2023 08:37:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D8E9E6184D;
        Wed, 12 Jul 2023 15:37:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86031C433C7;
        Wed, 12 Jul 2023 15:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689176250;
        bh=/rImqzulXKRfkZ/2PvcjAfGhsT5mBHXh7fIeELRAHq4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aS+qC40oBHhr4HUomy7QXm6JnstU+NnwjKHkpPp5DfD/UihbFNucaE3AAmPesf3cw
         pQElWNpLPjXTUSckGfMRWjhMKdk++nE+iDoEEZfTw9E5of4HHUjB4iM6lGiflIPv3z
         s+lUqSBO7SPsCgP+JEgvwlYsdeDXaVscbtjQbYbtyhZTCDT7dH/t5dKUbHZstGyGzB
         xBIh1pUyteEvVAzdy/QuSHPyDh6fr3XYaKt1kHpgsKEg3hwv7CIpVS36/FvKUE+RvY
         lz/X0qdiJ2j539rk9MjR5YzVHll6Pf7xkJZ0p10gaRR4yhYexGx6HpyKOu8ryjrfuh
         TnDzknz7TFzVQ==
Date:   Wed, 12 Jul 2023 17:37:26 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Yangtao Li <frank.li@vivo.com>
Cc:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/11] i2c: at91: Use
 devm_platform_get_and_ioremap_resource()
Message-ID: <20230712153726.tcx7haylb3jqpm2y@intel.intel>
References: <20230710063351.17490-1-frank.li@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230710063351.17490-1-frank.li@vivo.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Yangtao,

On Mon, Jul 10, 2023 at 02:33:40PM +0800, Yangtao Li wrote:
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi
