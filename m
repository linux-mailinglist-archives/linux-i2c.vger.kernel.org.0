Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4EA17D9297
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Oct 2023 10:48:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345584AbjJ0Isn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Oct 2023 04:48:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345553AbjJ0Ism (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Oct 2023 04:48:42 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B6AF1B1;
        Fri, 27 Oct 2023 01:48:40 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF81CC433C8;
        Fri, 27 Oct 2023 08:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698396519;
        bh=4gPPdGhCdto05ss4qpu9JQl8aMvFhWkapoLbjn9yjFM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Cw6P7ESBsWvrI2g6iDkWkkzYUNZPgbq5ZxX8nw8f6MSZwR3BYvQNsU9BH9s4vplDc
         BUyx2GM1yP+dkttjCo+3GyT2FEaOu1l4LAPHCM90jAlcpJmQSBXomYMA79V+IK5cCK
         hwdpMkDbzpuzhLW/qcHjyX+7sh7gdwDFbnOAPN+2o+K02FLVCpSDklX6dZWrVA0h2x
         grMEVhFRBva0GkpNUAwuMSjJiGG7RHFqfA0EHTNhwGdwWz5u6Cw1EFgHx2HmUgEuel
         oUrJ5BVd+JOkOWjuUZGheIQVCdBsxTL1G0gv9k/d7UlQU73cBENmAneh9q/q8n/TS0
         Rn8O2iqGh3duA==
Date:   Fri, 27 Oct 2023 10:48:35 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     gregory.clement@bootlin.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] i2c: mv64xxx: add an optional bus-reset-gpios
 property
Message-ID: <20231027084835.yjfphaecm6h4kore@zenone.zhora.eu>
References: <20231027033104.1348921-1-chris.packham@alliedtelesis.co.nz>
 <20231027033104.1348921-3-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231027033104.1348921-3-chris.packham@alliedtelesis.co.nz>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Chris,

On Fri, Oct 27, 2023 at 04:31:04PM +1300, Chris Packham wrote:
> Some hardware designs have a GPIO used to control the reset of all the
> devices on and I2C bus. It's not possible for every child node to
> declare a reset-gpios property as only the first device probed would be
> able to successfully request it (the others will get -EBUSY). Represent
> this kind of hardware design by associating the bus-reset-gpios with the
> parent I2C bus. The reset line will be released prior to the child I2C
> devices being probed.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> Notes:
>     Changes in v5:
>     - Rename reset-gpios and reset-duration-us to bus-reset-gpios and
>       bus-reset-duration-us as requested by Wolfram

for such change you could have kept my r-b:

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Andi
