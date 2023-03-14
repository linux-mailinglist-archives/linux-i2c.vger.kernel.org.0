Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF7496B9819
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Mar 2023 15:36:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231407AbjCNOgd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Mar 2023 10:36:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231286AbjCNOg3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Mar 2023 10:36:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25346A1FCB;
        Tue, 14 Mar 2023 07:36:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B46D9617B3;
        Tue, 14 Mar 2023 14:36:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D464C4339B;
        Tue, 14 Mar 2023 14:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678804587;
        bh=1KOIUg/c4x1Y731O96Vc4ctZpyAHpv9PVjnCx+8hBfQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vIWkDzmtYN4G2jq2zVFtvA+iU2TNpFGfFQjV73Hp5jbDEj2Zy1292f0FEktn7jtT9
         XdaepO+CUBsbgH1Yfkjvh3HkV3jZYsW+3cpx7O9jSNc4D3jb0xY7yDR3GijOgRAUeT
         gMfwj6kM0FTNSAiZ0hTfJoS5KaWU1INIHh+Be5EFgICyX7oHCyKMk89bnx6XnkYLsq
         Xzok03y7wX7n9B5zNJvX811AMnEpriTLaNJuVjzJeE2PJJnnMZJWyntfqi2H+AXDzd
         ieHlNK4lni3a4sOCFkxtVGsIry/nxeNfKtJBL1it9doDPBr69LZ8clkiKj8AFqPPdK
         PoNRRpu8oEcqQ==
Date:   Tue, 14 Mar 2023 15:36:23 +0100
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: i2c: mpc: Mark "fsl,timeout" as
 deprecated
Message-ID: <20230314143623.gkbs2htdcw4gue6c@intel.intel>
References: <20230312233613.303408-1-andi.shyti@kernel.org>
 <20230312233613.303408-2-andi.shyti@kernel.org>
 <49f0b7d9-475d-898d-29d2-7e7cdf07cb0b@linaro.org>
 <06468199-b7cf-113f-b8b7-89c196842538@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06468199-b7cf-113f-b8b7-89c196842538@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Mar 14, 2023 at 03:22:19PM +0100, Krzysztof Kozlowski wrote:
> On 14/03/2023 15:21, Krzysztof Kozlowski wrote:
> > On 13/03/2023 00:36, Andi Shyti wrote:
> >> Now we have the i2c-scl-clk-low-timeout-ms property defined in
> >> the i2c schema.
> >>
> >> Mark "fsl,timeout" as deprecated and update the example.
> >>
> >> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> >> ---
> >>  Documentation/devicetree/bindings/i2c/i2c-mpc.yaml | 3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> > 
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ...
> 
> and unreviewed. Are you sure these are using same units? Old code used us.
> 
> Your example:
> 	i2c-scl-clk-low-timeout-ms = <10000>;
> 
> 10s timeout?

ops!

I will keep it ms, if anyone doesn't have anything against. The
clock stretching goes in order of milliseconds and in any case
doesn't need to be precisely that, as long as it's longer.

I don't see any need for it to be us... if it 12500us, let it be
13ms.

I will update the example.

Can I keep your r-b with:

	i2c-scl-clk-low-timeout-ms = <10>;

?

Thanks for noticing it, it would have been a wacky mistake,
Andi
