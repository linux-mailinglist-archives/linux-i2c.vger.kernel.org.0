Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA1047754B3
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Aug 2023 10:02:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbjHIICi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Aug 2023 04:02:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229783AbjHIICi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Aug 2023 04:02:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 456B71FC2;
        Wed,  9 Aug 2023 01:02:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C4E966302E;
        Wed,  9 Aug 2023 08:02:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE382C433C7;
        Wed,  9 Aug 2023 08:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691568155;
        bh=RGgJ0entgYCUagS5IzNaQUQFxxpHtnwZKXcXxBX55aM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aWxue7mmxXai4i8fgyUFTZKxRBVv1/eUfvCc7lWWn2/v+T0dDw2LxQYk1uDpj2GDQ
         wtW15wbExemCPVVQ8H/QGuw6++ZOLgmYUTslvFmyB+t8FNEBur6NT49BuqXnHTt+2f
         8QMArWscV4SzexKiPmRaE5A+Ka2uaoVIRINY4mPczoVblhGYRDbLzUZU4bvQor8pdl
         VJyzGsoOQw39qCl3tZdUQfvqwrDY2TvEANwOOn1ZU5Ak71uN1As0sZtXpakY5AvmzQ
         rW0GVi3ZrJpmHN95yOcyyafSlIM6xKdow18d9xmcFwvRStX3sR7oEZy3LwVCaXptS3
         cGH26QCe8gBag==
Date:   Wed, 9 Aug 2023 10:02:32 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Liao Chang <liaochang1@huawei.com>, florian.fainelli@broadcom.com,
        rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, yangyicong@hisilicon.com,
        aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        kblaiech@nvidia.com, asmaa@nvidia.com, loic.poulain@linaro.org,
        rfoss@kernel.org, ardb@kernel.org, gcherian@marvell.com,
        linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 2/9] i2c: mlxbf: Use dev_err_probe in probe function
Message-ID: <20230809080232.ktoryciynfuhnmnk@intel.intel>
References: <20230808012954.1643834-1-liaochang1@huawei.com>
 <20230808012954.1643834-3-liaochang1@huawei.com>
 <a5b2f1a2-d509-0949-fc1d-929476c2618b@linaro.org>
 <20230808112907.4rnvmyha4v6cg5ds@intel.intel>
 <29e20953-5660-079e-2136-0962eec9cab5@linaro.org>
 <20230808114706.g27gy3rajqvjykce@intel.intel>
 <7698ce68-c393-d566-25b9-7b2a08dd8274@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7698ce68-c393-d566-25b9-7b2a08dd8274@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Aug 08, 2023 at 05:55:29PM +0200, Krzysztof Kozlowski wrote:
> On 08/08/2023 13:47, Andi Shyti wrote:
> > Hi Krzysztof,
> > 
> > On Tue, Aug 08, 2023 at 01:31:31PM +0200, Krzysztof Kozlowski wrote:
> >> On 08/08/2023 13:29, Andi Shyti wrote:
> >>> Hi Krzysztof,
> >>>
> >>> On Tue, Aug 08, 2023 at 10:36:40AM +0200, Krzysztof Kozlowski wrote:
> >>>> On 08/08/2023 03:29, Liao Chang wrote:
> >>>>> Use the dev_err_probe function instead of dev_err in the probe function
> >>>>> so that the printed messge includes the return value and also handles
> >>>>> -EPROBE_DEFER nicely.
> >>>>>
> >>>>> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> >>>>> Signed-off-by: Liao Chang <liaochang1@huawei.com>
> >>>>
> >>>> ...
> >>>>
> >>>>> @@ -2413,10 +2399,8 @@ static int mlxbf_i2c_probe(struct platform_device *pdev)
> >>>>>  	ret = devm_request_irq(dev, irq, mlxbf_i2c_irq,
> >>>>>  			       IRQF_SHARED | IRQF_PROBE_SHARED,
> >>>>>  			       dev_name(dev), priv);
> >>>>> -	if (ret < 0) {
> >>>>> -		dev_err(dev, "Cannot get irq %d\n", irq);
> >>>>> -		return ret;
> >>>>> -	}
> >>>>> +	if (ret < 0)
> >>>>> +		return dev_err_probe(dev, ret, "Cannot get irq %d\n", irq);
> >>>>
> >>>> I don't think this is needed:
> >>>> https://lore.kernel.org/all/20230721094641.77189-1-frank.li@vivo.com/
> >>>
> >>> Hmm, that's a bit borderline, I'd say. The change to
> >>
> >> What's borderline exactly? devm_request_threaded_irq_probe() is coming,
> >> right? If it is accepted this hunk is useless and soon should be
> >> replaced with proper one.
> > 
> > Such change is out of the scope of this series, there are two
> > options that I'd prefer (in the listed order):
> > 
> >  1. accept the patch as it is, this patch is not sent today the
> >     first time and at the current state it's correct.
> >  2. not accept a change on this line
> 
> The 2 is what I commented here. This change should not be made and
> instead we should just switch all such users to new API, because this is
> preferred for all error messages, when applicable and does not result in
> lost context. If there was no such API, sure, but we have this API coming.

To me the patch is correct... I am OK also with 2, but I find 1
more complete... let's say that it's a matter of taste?

> > Replacing devm_request_irq belongs to another series and,
> > besides, I don't want to ask Liao to hold on this series for such
> > trivialities.
> 
> So the comment about this redundant and unneeded change, thus switching
> to new API you call 'triviality' but a comment of yours of changing the
> tone of error message to 'please' is appropriate.
> https://lore.kernel.org/all/20230807231320.svssge6uymw3jiho@intel.intel/
> 
> That's double standards.

That was a joke, the review was somewhere else in my comment.

Thanks for your inputs,
Andi
