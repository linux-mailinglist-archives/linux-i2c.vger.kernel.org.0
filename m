Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B16216BA0FA
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Mar 2023 21:48:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbjCNUsK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Mar 2023 16:48:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjCNUsJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Mar 2023 16:48:09 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53ED53B65A;
        Tue, 14 Mar 2023 13:48:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id EC429B81BBB;
        Tue, 14 Mar 2023 20:48:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B4E0C433D2;
        Tue, 14 Mar 2023 20:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678826884;
        bh=mdx7eAyubjlsSQoZlSpDFH/CuAAnmkq0fpBmLxkAnuU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MxNETFfAcA5T8vRNnALkQbYkuImHFWe7NkzTNb7RmQzHm5Xb4yuB8qrWXxAGgIsJV
         VblJJQ7zuIpOmsoApqelrmRyZRuGD/puXqusqLeUT8SDFJTvmtDzoAT2i9JT+ADjUo
         Dc8NYgxsV7hQ2jBybpBvAde8bbBqxBX5g3foEl6sMgb2u45339nYa8adSfg471u5WN
         +T8RDS/wtFdbrS/uQFsTCimbHxWYok1/bWiTrO6TvZpvOKOF2OTqT6mFNbjcTeprzM
         E2yTsLp/K2cgFthyh0q/jP30wr3MKsyLT0S2Y46LQbgumzAT9etQaigpaqX1hES/3F
         qiNmk9jmtVqyg==
Date:   Tue, 14 Mar 2023 21:48:01 +0100
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v3 3/3] i2c: mpc: Use i2c-scl-clk-low-timeout-ms i2c
 property
Message-ID: <20230314204801.n46zgeke4efxemae@intel.intel>
References: <20230312233613.303408-1-andi.shyti@kernel.org>
 <20230312233613.303408-4-andi.shyti@kernel.org>
 <ec504c7d-66d4-a4b7-547e-7272e012cdf9@linaro.org>
 <20230314151608.nr7ft7spsbylqclo@intel.intel>
 <32777854-fbf6-dad2-ef54-1d1c04086f0b@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32777854-fbf6-dad2-ef54-1d1c04086f0b@alliedtelesis.co.nz>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Chris,

> >>> "fsl,timeout" is marked as deprecated and replaced by the
> >>> "i2c-scl-clk-low-timeout-ms" i2c property.
> >>>
> >>> Use this latter and, in case it is missing, for back
> >>> compatibility, check whether we still have "fsl,timeout" defined.
> >>>
> >>> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> >>> Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> >>> ---
> >>>   drivers/i2c/busses/i2c-mpc.c | 12 +++++++++++-
> >>>   1 file changed, 11 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
> >>> index 87e5c1725750..28f11e30ac50 100644
> >>> --- a/drivers/i2c/busses/i2c-mpc.c
> >>> +++ b/drivers/i2c/busses/i2c-mpc.c
> >>> @@ -843,8 +843,18 @@ static int fsl_i2c_probe(struct platform_device *op)
> >>>   			mpc_i2c_setup_8xxx(op->dev.of_node, i2c, clock);
> >>>   	}
> >>>   
> >>> +	/*
> >>> +	 * "fsl,timeout" has been marked as deprecated and, to maintain
> >>> +	 * backward compatibility, we will only look for it if
> >>> +	 * "i2c-scl-clk-low-timeout-ms" is not present.
> >>> +	 */
> >>>   	result = of_property_read_u32(op->dev.of_node,
> >>> -				      "fsl,timeout", &mpc_ops.timeout);
> >>> +				      "i2c-scl-clk-low-timeout-ms",
> >>> +				      &mpc_ops.timeout);
> >>> +	if (result == -EINVAL)
> >>> +		result = of_property_read_u32(op->dev.of_node,
> >>> +					      "fsl,timeout", &mpc_ops.timeout);
> >> Wasn't old property in us and new one is in ms?
> > Thanks, Krzysztof! Good catch!
> >
> > Chris, you are the only user of this property, as of now. Is it
> > OK if we keep it ms? I will send a proper patch to do the
> > conversion.
> >
> > To me it doesn't make much sense to have the timeout defined in
> > us as that's of the same order of the raising and falling time
> > of the clock. Any opinion?

> I think it'd be easier to stick to us as then the same code can be used 
> to probe both the old property and the new one. However I won't object 
> if you adjust for the us to ms conversion between handling the new 
> property vs the old one.

yeah... indeed it became quite ugly.

OK, I will just rename it from "i2c-scl-clk-low-timeout-ms" to
"i2c-scl-clk-low-timeout-us", respin the schema pull request and
leave everything as it is.

Thanks for your input, Chris!

Andi
