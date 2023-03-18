Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43FD66BF92E
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Mar 2023 10:09:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbjCRJJo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 18 Mar 2023 05:09:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbjCRJJn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 18 Mar 2023 05:09:43 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4436E532B5;
        Sat, 18 Mar 2023 02:09:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E387CB80E8E;
        Sat, 18 Mar 2023 09:09:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFBFEC433D2;
        Sat, 18 Mar 2023 09:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679130579;
        bh=XJM7bLjC4OnDoVUeihuHqQi5B/L/wn9z6qbuaPa9N9Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pYG+4jZLFWUkmj5opa9edpGSC6VszLhmAtAVy/BPtg6XbRX71w5vDKkIo87RAwbPi
         K+bydblwq347yN/3IW4kqPsqBgpLYdZQdLXB7XFax8PcQuGCzPXc40FfLzyiVYZCQl
         gctDTfmfr4B5pPUjGXcRy0+9E//2P1aP4l4GjM1a9yaaSI2gQVqS79PV1TFvRakxaw
         PRo3Aw9uFFcycO3GN9GW+n0q6NQP2NuH7n8bqTqrPAeiB7EaC4dfI91CZpw/7fnjA5
         Hqbfk9o009BD6ss4PQzc7lo0h5MBLnt9I4CsKVlTx9SBHc5iXGV3PPI9bOS1FtXdDb
         dRBfXX51M2V9Q==
Date:   Sat, 18 Mar 2023 10:09:36 +0100
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Ryan Chen <ryan_chen@aspeedtech.com>
Cc:     Andrew Jeffery <andrew@aj.id.au>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Message-ID: <20230318090936.qvqozqfskpe5lja7@intel.intel>
References: <20230226031321.3126756-1-ryan_chen@aspeedtech.com>
 <20230226031321.3126756-2-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230226031321.3126756-2-ryan_chen@aspeedtech.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Ryan,

On Sun, Feb 26, 2023 at 11:13:20AM +0800, Ryan Chen wrote:
> Add ast2600-i2cv2 compatible and aspeed,global-regs, aspeed,timeout
> aspeed,xfer-mode description for ast2600-i2cv2.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> index f597f73ccd87..75de3ce41cf5 100644
> --- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> @@ -49,6 +49,25 @@ properties:
>      description:
>        states that there is another master active on this bus
>  
> +  aspeed,timeout:
> +    type: boolean
> +    description: I2C bus timeout enable for master/slave mode

Finally you can proceed with this. Please remove "aspeed,timeout"
and use "i2c-scl-has-clk-low-timeout" instead.

Andi
