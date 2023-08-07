Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45AA4772889
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Aug 2023 17:04:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230167AbjHGPEU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Aug 2023 11:04:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230037AbjHGPET (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Aug 2023 11:04:19 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D448B170A;
        Mon,  7 Aug 2023 08:04:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6764361DBF;
        Mon,  7 Aug 2023 15:04:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 434CCC433C8;
        Mon,  7 Aug 2023 15:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691420656;
        bh=ip4N2FMJTy4bE5bhfRgyTzEpf6T8V5AZ0SMJRe7fDAA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GSHdRDajqZrI+wxVvG4T3XmSe8CM7rbo/e6sDbfFCjUi+mACcutXY1DcCJUZXkl6P
         o6rzSzh+K0jpjMXqTw2RwzjVIFNVq3UGJlshNiPo4aoq6u4FxPWW+wIRLCimNzpHSp
         Z7bpbiQ3owGve4H+nzh38vfm5AaAm2QBR7bkvM3VfPgXFLy5UzWx6pmxpqYonRpLFW
         googZHNcGz3E4+S55AU318AlTYCY+cs1DFanjnYa6a0ij1yPOJ2AQhmenKjc/IEn5R
         pGAo85awra3Hi0B4jBv5LjSmZvyZoRExlUEU3RZTrvoFNI1hp1N8gQ9irzqUtoiD0g
         RWct3W7+NMALw==
Date:   Mon, 7 Aug 2023 17:04:13 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
Subject: Re: [PATCH v1 9/9] i2c: designware: Fix spelling and other issues in
 the comments
Message-ID: <20230807150413.3nv75vlhm3z3aule@intel.intel>
References: <20230725143023.86325-1-andriy.shevchenko@linux.intel.com>
 <20230725143023.86325-10-andriy.shevchenko@linux.intel.com>
 <20230804214157.iaylzqcmpflx6x7j@intel.intel>
 <ZNEBqDamvHMMRqRw@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZNEBqDamvHMMRqRw@smile.fi.intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Aug 07, 2023 at 05:37:28PM +0300, Andy Shevchenko wrote:
> On Fri, Aug 04, 2023 at 11:41:57PM +0200, Andi Shyti wrote:
> 
> ...
> 
> > > @@ -210,12 +210,12 @@ static void psp_release_i2c_bus(void)
> > >  {
> > >  	mutex_lock(&psp_i2c_access_mutex);
> > >  
> > > -	/* Return early if mailbox was malfunctional */
> > > +	/* Return early if mailbox was malfunctioned */
> > 
> > I think "was malfunctioned" is not really correct... maybe "has
> > malfunctioned"? "is malfunctioning"?
> 
> I first stumbled over this, but than I read the function name...
> I guess they are correct. So I think I need to drop this hunk.

"malfunctional" actually doesn't exist as a word. I think this is
correct:

  "Return early if the mailbox is malfunctioning"

> ...
> 
> > > -		 * transfer supported by the driver (for 400KHz this is
> > > +		 * transfer supported by the driver (for 400kHz this is
> > 
> > what did you change here? :)
> 
> Proper units. k is the official SI prefix for KILO.

oh right! didn't see it :)

Thanks,
Andi
