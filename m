Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD812770A30
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Aug 2023 23:00:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230008AbjHDVAG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Aug 2023 17:00:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbjHDVAB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Aug 2023 17:00:01 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06D42E46;
        Fri,  4 Aug 2023 14:00:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8FC1A62038;
        Fri,  4 Aug 2023 20:59:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76322C433C7;
        Fri,  4 Aug 2023 20:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691182799;
        bh=MRN7hsUUqN2dL3ZC0r/+K5FHLU73Mu39souTu9sMlK8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=a42GYlEGJqyCrN7vqU8W7WOCjrwAgY2GoUcf5Zvi8VMfFuJ0Qn+QnZIZoTdjsPJQ6
         cdrxo91iDBsiMvlC8JrI1JDV4H/vgTqLM8TZMAJ951WlX8oY03YL/Il+n4rTOPBv7+
         HCcDNngAp6fmxWlJqAEzeGr2iImg3p2DCZyS/3XVj3JDZt/5pRVIoJMge7qC3JWh4V
         R0c2aHgtd3vCFD7Y+dcz3BVpQfEeIzOFbVCgsKXJHEkM0GM6iVtlW6L3P/cBrwUovw
         KUPoIyvoACLsoGHoCQLLnIqnhWDwG3t5XSxq5hfyqgdND3U2Jij4L1TSLMZBhMbzBr
         zTqgrOYRzD1uw==
Date:   Fri, 4 Aug 2023 22:59:56 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
Subject: Re: [PATCH v1 4/9] i2c: designware: Propagate firmware node
Message-ID: <20230804205956.uuna4c76ww64z3zm@intel.intel>
References: <20230725143023.86325-1-andriy.shevchenko@linux.intel.com>
 <20230725143023.86325-5-andriy.shevchenko@linux.intel.com>
 <f0e0c31e-ad5e-c3ae-945e-c2af0d68beab@linux.intel.com>
 <ZMgU9Jm4u37D+70Y@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZMgU9Jm4u37D+70Y@smile.fi.intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

On Mon, Jul 31, 2023 at 11:09:24PM +0300, Andy Shevchenko wrote:
> On Fri, Jul 28, 2023 at 03:25:58PM +0300, Jarkko Nikula wrote:
> > On 7/25/23 17:30, Andy Shevchenko wrote:
> > > Propagate firmware node by using a specific API call, i.e. device_set_node().
> 
> ...
> 
> > > +	device_set_node(&dev->adapter.dev, dev_fwnode(dev->dev));
> > 
> > Would this be better to put in the same place where ACPI_COMPANION_SET() is
> > removed like below? I'd keep this static inline function in the header file
> > as simple as possible. All extra code might invite adding even more.
> 
> We come again to the duplication and prone to deviation code, I wouldn't like
> to go this way. The idea of this call is to unify and avoid mistakes, like
> updating only in ACPI or DT (or any new one if happens in the future) case
> and leaving the second one unconsidered.

it's anyway an inline function becoming a bit too fat. Can't we
make it not inline?

> That said, I would rather drop this patch until i2c core will take this
> once for all (may be never in the reasonable future :-).

Which patch are you referring to that should be taken into i2c
core?

Andi
