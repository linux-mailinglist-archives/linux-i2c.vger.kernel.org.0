Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 825EC6CF7BD
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Mar 2023 01:51:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230509AbjC2Xv3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Mar 2023 19:51:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231209AbjC2Xv2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Mar 2023 19:51:28 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA8C96A4B;
        Wed, 29 Mar 2023 16:51:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 77DD5B8254C;
        Wed, 29 Mar 2023 23:51:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ACFAC433D2;
        Wed, 29 Mar 2023 23:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680133872;
        bh=7ElFoE31725KSNz+HDjH2Kw8s9/BtuFeSmEahIQeCbM=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=kROvDFb7+tlRm4nqrKdYOylWlqz+yaimCEYYmrqPZQwHV2VcceJxzc9QtG72Vlmzn
         UqVb/JpQTRcO/TuFzTQXuiwUX6O9lMg4bEx/ktYh+M/hX8P+gl8Voa7TIMGubNZidh
         TSXwfUOfHEnCWV5ZpNKOpUSxF9FcNh2vzgH82KgREB3RF0O7hczieSomrwOCYHov3h
         ScA63tRWD735GDMYKJ8Fqj1JqNWsZVlmfodEbnoiIGIgA4na+yRBTGfGdGyJPone0u
         1f5ViufGQuyxhAm/QVPFrS5TXGdm9ER+BIMJDw75eUAHIQ/nFb8IWLf/4z+XOLIhVk
         jdQ2bGTyuscYw==
Date:   Thu, 30 Mar 2023 01:51:08 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v5 0/3] Add the clock stretching i2c property
Message-ID: <20230329235108.iwrk2m6ozsi3bsyh@intel.intel>
References: <20230317233338.424864-1-andi.shyti@kernel.org>
 <ZCSMQ223Org0nYCI@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZCSMQ223Org0nYCI@shikoro>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Wed, Mar 29, 2023 at 09:06:43PM +0200, Wolfram Sang wrote:
> 
> > The DTS schema has been applied in commit c83dd2cb836e ("schemas:
> > i2c: Add the clock stretching property").
> 
> Everyone, A general remark: If bindings for the dtschema are added,
> please include the linux-i2c mailing list. This binding is OK, but it
> would be good to have the discussion also here for additional input.

Thanks for letting me know. It's actually my mistake, as I didn't
check how to properly distribute the patch to all relevant
parties.

Regarding dtschema patches, they are typically submitted as
GitHub pull requests. How should I send it to the linux-i2c?
Should I also send it to the mailing list like any other patch?
(This might make the code review process somewhat confusing,
though).

Thanks,
Andi
