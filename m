Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2A7877724F
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Aug 2023 10:11:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230153AbjHJILB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Aug 2023 04:11:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231837AbjHJILA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Aug 2023 04:11:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5E192136;
        Thu, 10 Aug 2023 01:10:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6D3B465236;
        Thu, 10 Aug 2023 08:10:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39D9DC433C7;
        Thu, 10 Aug 2023 08:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691655043;
        bh=pPtrMnD+a1HV9tVnWccuGoqbvbAmQI0mFVpSTDqunzk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PiJbYP3AfcmvS4dhCAbBYRrSXKLMBY1z9owaOJIubJq7IqLfgJHX0AUitRGtbNmQb
         nsaudgbmLifGG9ihxAfEP2P5HXlXxCzELDp4l7RS2hV4gcIcZqQ2Vgvlmq7EG+MkcD
         +VKtJXMK9kFrQAeMUuP3s6zqIhpKIzk+TBDhF5jAjrfplR3mztX+cGThE902/i/nB4
         hot3F370IagNSd975t+FVIA71gjEw2m38j56HhBiBpglmC7eSvC8t10U8nhsyP1VjD
         /od5y8Lrcljrc1VQuZtaqzQZ806yIlGN2xuKi0Ht6VU+PLV08DFJEA0BD5RbMYg/fe
         f9JGFVMex46EA==
Date:   Thu, 10 Aug 2023 10:10:40 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     "Liao, Chang" <liaochang1@huawei.com>
Cc:     florian.fainelli@broadcom.com, rjui@broadcom.com,
        sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        yangyicong@hisilicon.com, aisheng.dong@nxp.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, kblaiech@nvidia.com,
        asmaa@nvidia.com, loic.poulain@linaro.org, rfoss@kernel.org,
        ardb@kernel.org, gcherian@marvell.com, linux-i2c@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 9/9] i2c: synquacer: Use dev_err_probe in probe
 function
Message-ID: <20230810081040.xrhaa2beru52hxlu@intel.intel>
References: <20230808012954.1643834-1-liaochang1@huawei.com>
 <20230808012954.1643834-10-liaochang1@huawei.com>
 <20230809192117.h7rn6vwmvxdnkr2a@intel.intel>
 <46a39960-ad79-ca65-6b2b-ccaf982965f5@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <46a39960-ad79-ca65-6b2b-ccaf982965f5@huawei.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Liao,

On Thu, Aug 10, 2023 at 10:33:58AM +0800, Liao, Chang wrote:
> Hi Andi and Krzysztof,
> 
> 在 2023/8/10 3:21, Andi Shyti 写道:
> > Hi Liao,
> > 
> > On Tue, Aug 08, 2023 at 09:29:54AM +0800, Liao Chang wrote:
> >> Use the dev_err_probe function instead of dev_err in the probe function
> >> so that the printed messge includes the return value and also handles
> >> -EPROBE_DEFER nicely.
> >>
> >> Signed-off-by: Liao Chang <liaochang1@huawei.com>
> > 
> > After some discussions and time, I think it's right to r-b this
> > patch. If you agree more with Krzysztof, feel free to follow his
> > recommendation and send another version otherwise I will go ahead
> > and take this series in my branch. I do not really mind, both
> > arguments are valid.
> 
> I saw that Frank Li developed some new APIs that look like they would be very
> helpful for aligning the error messages of devm_request_irq in device probes.
> However, the patches have been pending for weeks and the author hasn't sent a
> new version. So I'm not planning to switch to the new APIs in this patch series,
> if there are no objections.
> 
> Do I need to resend a new revision to add your R-B at this patch?

no, no need. I'm also going to fix a typo in the commit message
(messge/message) that Markus has pointed out.

Thanks for this series of cleanups,
Andi

> Thanks.
> 
> > 
> > Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 
> > 
> > Thanks,
> > Andi
> 
> -- 
> BR
> Liao, Chang
