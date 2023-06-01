Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FF037196FC
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Jun 2023 11:31:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232266AbjFAJby (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Jun 2023 05:31:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229893AbjFAJbx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 1 Jun 2023 05:31:53 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6836799
        for <linux-i2c@vger.kernel.org>; Thu,  1 Jun 2023 02:31:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EC8A46427C
        for <linux-i2c@vger.kernel.org>; Thu,  1 Jun 2023 09:31:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 075B9C433D2;
        Thu,  1 Jun 2023 09:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685611911;
        bh=gpzMxDpaqaPJ9WGpNiwFniOVjvVz38WQSsWIhcnBXmc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=J868g49X/i5fcJico7qTKOcekGynhQSHuh7uPm7XK11npBzKbdFspFY5avb6XZXtx
         Z6eE+yjT6NE50/oDTj5/soUcn8NjNvv/uvfMeWBVJss3WpeDT0wiE3c9vbP9DeYBun
         Egj/pW9PQKBATK9tbYMp+NEFi22SnUxP+c2UBqs8tzJgANFGHM2a+FUkjOFnY15lOn
         XtlZUDER8aZVeVmso29oTHUzEHL5o2sajwpGj0nSa9gaGtTjJB9AIpC95dVgJ1A2ri
         ZKJtVWgOxE8KsXYf5/u99O/BgSXvG2LNIAMycZXtPVp+feUXMh6OCLWHkuRIg4xgxw
         He0wZn9kAXfcg==
Date:   Thu, 1 Jun 2023 11:31:48 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     HansHu-oc <HansHu-oc@zhaoxin.com>
Cc:     "jdelvare@suse.com" <jdelvare@suse.com>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "Cobe Chen(BJ-RD)" <CobeChen@zhaoxin.com>,
        "Tony W. Wang(XA-RD)" <TonyWWang@zhaoxin.com>
Subject: Re: [PATCH v2] i2c: add support for Zhaoxin I2C controller
Message-ID: <20230601093148.ycacijzq7ksbgqjy@intel.intel>
References: <3509ba04d98b4537ba3459407da43f62@zhaoxin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3509ba04d98b4537ba3459407da43f62@zhaoxin.com>
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> >> +static int zxi2c_wait_event(struct zxi2c *i2c, u8 event)
> >> +{
> >> +	int timeout;
> >> +
> >> +	timeout = wait_event_interruptible_timeout(i2c->waitq,
> >> +			i2c->event != 0,
> >> +			msecs_to_jiffies(ZXI2C_TIMEOUT));
> >> +
> >> +	if (i2c->event & event)
> >> +		return 0;
> >
> > is this valid even when "timeout == 0"?
> 
> Let's see the description of the value returned by wait_event_interruptible_timeout():
> https://elixir.bootlin.com/linux/v6.3.5/source/include/linux/wait.h#L525
>  * Returns:
>  * 0 if the @condition evaluated to %false after the @timeout elapsed,
>  * 1 if the @condition evaluated to %true after the @timeout elapsed,
>  * the remaining jiffies (at least 1) if the @condition evaluated
>  * to %true before the @timeout elapsed, or -%ERESTARTSYS if it was
>  * interrupted by a signal.

yes, I know, that's why I asked.

> So, "timeout == 0" and @condition evaluated to %true unlikely to happen at the same time.

unlikely is a very strong word and rearrangement is free. So,
based on what you copy pasted above, I would first put the
"timeout == 0" check and then the rest.

Andi
