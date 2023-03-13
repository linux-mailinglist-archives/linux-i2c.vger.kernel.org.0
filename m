Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E576B6B71EE
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Mar 2023 10:02:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230508AbjCMJCo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Mar 2023 05:02:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230169AbjCMJCM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Mar 2023 05:02:12 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 373FAE076;
        Mon, 13 Mar 2023 01:58:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C3964B80DC8;
        Mon, 13 Mar 2023 08:58:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBBC0C4339B;
        Mon, 13 Mar 2023 08:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678697888;
        bh=B2JOWs/sNYNpQQN9MSZD14PHxXQ9aKQuirnw6OklYoY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=q9baDC9hJkEhL5/j18O8gFMYDhyAHPsVF+c2t4nXQM1UW54CiWumRtl9c8Mb1uguv
         RRedHsvpven1qEYXcW+0wuZguHQpLYuKiuRUJnbSPloWRgKEWhj6v6VRnQdoLcXXJs
         0hBq/rZ8Ut7mVtFL8RDZPKwGJ4nxQrFRbIdEvx/jKjTQ9RkTbNLx7bpBV0+tALJSAD
         bjLMEXogvOfLk+AAroairHTcD11tKhjAunhAm57nQAgWGgx+jw1sdIpaWuUyfkFgl/
         6/CIZxrUZAFYQSGFVsryL3AbosJA8ivsGmdryULnPnaykCZtY8ybtp3xxrcnKF+mAw
         b1AGx+NXVBY5g==
Date:   Mon, 13 Mar 2023 09:58:05 +0100
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
Subject: Re: [PATCH v3 3/3] i2c: mpc: Use i2c-scl-clk-low-timeout-ms i2c
 property
Message-ID: <20230313085805.sb7nl6362tcm2mvp@intel.intel>
References: <20230312233613.303408-1-andi.shyti@kernel.org>
 <20230312233613.303408-4-andi.shyti@kernel.org>
 <f3d6760d-f2cc-c725-d7fb-6056ee555b65@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3d6760d-f2cc-c725-d7fb-6056ee555b65@alliedtelesis.co.nz>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> On 13/03/23 12:36, Andi Shyti wrote:
> > "fsl,timeout" is marked as deprecated and replaced by the
> > "i2c-scl-clk-low-timeout-ms" i2c property.
> >
> > Use this latter and, in case it is missing, for back
> > compatibility, check whether we still have "fsl,timeout" defined.
> >
> > Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> > Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Gave the patches a spin on a P2041RDB so
> 
> Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Thanks, Chris!

Andi
