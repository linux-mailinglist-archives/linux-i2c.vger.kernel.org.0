Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DF75774299
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Aug 2023 19:47:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234967AbjHHRqw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Aug 2023 13:46:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231401AbjHHRpo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Aug 2023 13:45:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E84D25EF8;
        Tue,  8 Aug 2023 09:20:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AE2C8624D3;
        Tue,  8 Aug 2023 11:29:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E544CC433C8;
        Tue,  8 Aug 2023 11:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691494151;
        bh=tZ2FF4o+MYOJ/APB5kJLCZ4WhH/ohRGQPmwD8tUh38s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gv+GVG688C7zwn2+rfsZcGjS5xGzK3cwXlM3qNCwnQ4lhJckfRV4W4mhWVnDbTzxZ
         83RU5YMfPiyBnatstdz2ZQZbkRIN7eAPpbYrN0CGWJABiYp7naSI2hfk8MMnN6p55V
         VyUeufF2pjJlokIwR3SeIs/+UuX1x8kM1tfd/hm+aGE2xVNEsIpnuzRvmAZpKurmzS
         4PS8AWBRExG4NLeKSCFq1jOh/iy7Kd6T5YTa6NigkQhUyKORzfD2gpNSULnyJYQhtY
         /lYTHbjM6QTcxq1MhO5b4mMTzqn0ze04jRuEIjdftrUrxnygNI+RYd2YHUofSbYR8a
         KhNgGL2R8POkQ==
Date:   Tue, 8 Aug 2023 13:29:07 +0200
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
Message-ID: <20230808112907.4rnvmyha4v6cg5ds@intel.intel>
References: <20230808012954.1643834-1-liaochang1@huawei.com>
 <20230808012954.1643834-3-liaochang1@huawei.com>
 <a5b2f1a2-d509-0949-fc1d-929476c2618b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5b2f1a2-d509-0949-fc1d-929476c2618b@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Krzysztof,

On Tue, Aug 08, 2023 at 10:36:40AM +0200, Krzysztof Kozlowski wrote:
> On 08/08/2023 03:29, Liao Chang wrote:
> > Use the dev_err_probe function instead of dev_err in the probe function
> > so that the printed messge includes the return value and also handles
> > -EPROBE_DEFER nicely.
> > 
> > Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> > Signed-off-by: Liao Chang <liaochang1@huawei.com>
> 
> ...
> 
> > @@ -2413,10 +2399,8 @@ static int mlxbf_i2c_probe(struct platform_device *pdev)
> >  	ret = devm_request_irq(dev, irq, mlxbf_i2c_irq,
> >  			       IRQF_SHARED | IRQF_PROBE_SHARED,
> >  			       dev_name(dev), priv);
> > -	if (ret < 0) {
> > -		dev_err(dev, "Cannot get irq %d\n", irq);
> > -		return ret;
> > -	}
> > +	if (ret < 0)
> > +		return dev_err_probe(dev, ret, "Cannot get irq %d\n", irq);
> 
> I don't think this is needed:
> https://lore.kernel.org/all/20230721094641.77189-1-frank.li@vivo.com/

Hmm, that's a bit borderline, I'd say. The change to
devm_request_irq/devm_request_threaded_irq_probe seems like
something for another series. But for now, I think I'll accept
this as it is since it fits within the scope of this current
series.

Andi
