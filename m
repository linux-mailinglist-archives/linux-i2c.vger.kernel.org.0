Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFC946B98CD
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Mar 2023 16:16:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231649AbjCNPQm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Mar 2023 11:16:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231690AbjCNPQg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Mar 2023 11:16:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64192AE127;
        Tue, 14 Mar 2023 08:16:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6E1C46173A;
        Tue, 14 Mar 2023 15:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53A0DC433D2;
        Tue, 14 Mar 2023 15:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678806971;
        bh=LC9u85dUU8550CufO7/v5UCO6gesZWa+DCdtnoP1OG4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DeY4mMsdTKU2Ew2nx4CIH0I99WCMvFpWyhuyHsThPDaQ2r+eUwPi2TCDdBK4cCIh1
         tnh0s7ckac8Aw8VzRi5S5TZl++vRaHi5PDCg81ZxBErFRIQwInAVR3LSYmfxY0eTx7
         ODXIdrob/00x5LHBjX2EykTQR//mPPMb/2LSMfHBrvxcmqi0YJHHMqVu75xKP4ValY
         KJ1D/AwRf6sljSALnDJRvGHn+FbJPny14l9rfBSl52qPCESdmxj10iYlX4X+B7J3iE
         6N0qFvYJ7EISHy9Y7lDv5czjIm/8h5BSMRN32c6dyUsI+s9U9k7M7sD7iN27EswWXL
         jjnnfqYe+QXGA==
Date:   Tue, 14 Mar 2023 16:16:08 +0100
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v3 3/3] i2c: mpc: Use i2c-scl-clk-low-timeout-ms i2c
 property
Message-ID: <20230314151608.nr7ft7spsbylqclo@intel.intel>
References: <20230312233613.303408-1-andi.shyti@kernel.org>
 <20230312233613.303408-4-andi.shyti@kernel.org>
 <ec504c7d-66d4-a4b7-547e-7272e012cdf9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec504c7d-66d4-a4b7-547e-7272e012cdf9@linaro.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Tue, Mar 14, 2023 at 03:22:52PM +0100, Krzysztof Kozlowski wrote:
> On 13/03/2023 00:36, Andi Shyti wrote:
> > "fsl,timeout" is marked as deprecated and replaced by the
> > "i2c-scl-clk-low-timeout-ms" i2c property.
> > 
> > Use this latter and, in case it is missing, for back
> > compatibility, check whether we still have "fsl,timeout" defined.
> > 
> > Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> > Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> > ---
> >  drivers/i2c/busses/i2c-mpc.c | 12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
> > index 87e5c1725750..28f11e30ac50 100644
> > --- a/drivers/i2c/busses/i2c-mpc.c
> > +++ b/drivers/i2c/busses/i2c-mpc.c
> > @@ -843,8 +843,18 @@ static int fsl_i2c_probe(struct platform_device *op)
> >  			mpc_i2c_setup_8xxx(op->dev.of_node, i2c, clock);
> >  	}
> >  
> > +	/*
> > +	 * "fsl,timeout" has been marked as deprecated and, to maintain
> > +	 * backward compatibility, we will only look for it if
> > +	 * "i2c-scl-clk-low-timeout-ms" is not present.
> > +	 */
> >  	result = of_property_read_u32(op->dev.of_node,
> > -				      "fsl,timeout", &mpc_ops.timeout);
> > +				      "i2c-scl-clk-low-timeout-ms",
> > +				      &mpc_ops.timeout);
> > +	if (result == -EINVAL)
> > +		result = of_property_read_u32(op->dev.of_node,
> > +					      "fsl,timeout", &mpc_ops.timeout);
> 
> Wasn't old property in us and new one is in ms?

Thanks, Krzysztof! Good catch!

Chris, you are the only user of this property, as of now. Is it
OK if we keep it ms? I will send a proper patch to do the
conversion.

To me it doesn't make much sense to have the timeout defined in
us as that's of the same order of the raising and falling time
of the clock. Any opinion?

Andi
