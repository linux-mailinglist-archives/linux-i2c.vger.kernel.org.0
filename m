Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CB806BA1CD
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Mar 2023 23:08:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231189AbjCNWIF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Mar 2023 18:08:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231187AbjCNWIA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Mar 2023 18:08:00 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C02E2ED5A;
        Tue, 14 Mar 2023 15:07:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 06E4AB81BC3;
        Tue, 14 Mar 2023 22:07:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E55B9C433EF;
        Tue, 14 Mar 2023 22:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678831669;
        bh=D2OfKd7jJbUKN1BPwkUjrhkE9yzy/vHcXXz8xIVsUgQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hKz7xW++iuimRym7qhWdVUIgoX5aI2ImBPPphyCjxJW6O3iltNbzpKZKJ7yXtnZ5B
         CuEuavLuvcIXhj2+uNmjJBzFmogP9FEtoww4dpDdq3kxCd9qw0B1RKy4RbrgBo+MiW
         GHEOhzsB7KlaF1R2BiR2EGyjdqk8Ph95xbj3VVUVgYiZMUarqr+fqJOTGjBS+3eyOT
         CuNs1jnUM1XlOrqL1mtcDymQyZORF/t+Mecv8pdLj+5woB7tJVqL13XElg7R2Dwauk
         zXs7LSX0QCDVJZadEkaujTsJdxP9suYhEiKCr/7+pV11YROQin2/JED4VACHceQmKb
         7ifD5rDpGTD2w==
Date:   Tue, 14 Mar 2023 23:07:46 +0100
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v4 3/3] i2c: mpc: Use i2c-scl-clk-low-timeout-ms i2c
 property
Message-ID: <20230314220746.nplw4q6kdpzcll4a@intel.intel>
References: <20230314215612.23741-1-andi.shyti@kernel.org>
 <20230314215612.23741-4-andi.shyti@kernel.org>
 <326adcc5-a9d1-d8dc-70b8-56d8f80d4d41@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <326adcc5-a9d1-d8dc-70b8-56d8f80d4d41@alliedtelesis.co.nz>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> Just to be a pain the subject line still says "ms"

I have changed hundreds of /ms/us/ in this last half an hour...
of course I forgot some :)

There is also one in the comment.

Thanks for spotting it, Chris!

Andi

> On 15/03/23 10:56, Andi Shyti wrote:
> > "fsl,timeout" is marked as deprecated and replaced by the
> > "i2c-scl-clk-low-timeout-us" i2c property.
> >
> > Use this latter and, in case it is missing, for back
> > compatibility, check whether we still have "fsl,timeout" defined.
> >
> > Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> > Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> > Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> > ---
> >   drivers/i2c/busses/i2c-mpc.c | 12 +++++++++++-
> >   1 file changed, 11 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
> > index 87e5c1725750f..e8798f9c23fcc 100644
> > --- a/drivers/i2c/busses/i2c-mpc.c
> > +++ b/drivers/i2c/busses/i2c-mpc.c
> > @@ -843,8 +843,18 @@ static int fsl_i2c_probe(struct platform_device *op)
> >   			mpc_i2c_setup_8xxx(op->dev.of_node, i2c, clock);
> >   	}
> >   
> > +	/*
> > +	 * "fsl,timeout" has been marked as deprecated and, to maintain
> > +	 * backward compatibility, we will only look for it if
> > +	 * "i2c-scl-clk-low-timeout-ms" is not present.
> > +	 */
> >   	result = of_property_read_u32(op->dev.of_node,
> > -				      "fsl,timeout", &mpc_ops.timeout);
> > +				      "i2c-scl-clk-low-timeout-us",
> > +				      &mpc_ops.timeout);
> > +	if (result == -EINVAL)
> > +		result = of_property_read_u32(op->dev.of_node,
> > +					      "fsl,timeout", &mpc_ops.timeout);
> > +
> >   	if (!result) {
> >   		mpc_ops.timeout *= HZ / 1000000;
> >   		if (mpc_ops.timeout < 5)
