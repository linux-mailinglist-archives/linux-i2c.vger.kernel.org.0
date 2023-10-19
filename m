Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 892A17D0117
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Oct 2023 20:01:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235505AbjJSSB2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Oct 2023 14:01:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232935AbjJSSB1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Oct 2023 14:01:27 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CEEA11D;
        Thu, 19 Oct 2023 11:01:25 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA7D6C433C7;
        Thu, 19 Oct 2023 18:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1697738485;
        bh=1Nzo1DkDeze8wKnS+Dv2NUZ4cNNCYVQmoIZRdnIYbLc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xD2uc9x0nKongkA+Is7lawjr/sWbSTsJpQ3A4MYI8BheIQA96F7ZUBW14RUrHJNsK
         NbT2dF4HRtDeBMIqvSJPmje18SdRzL2JtfOw1efQXV0GjCCKVwqGHOhuJ6DYMefSuN
         mfmDOoJvtjY/cblWFXh3sAYiRWJDtfQ4rPcH+igM=
Date:   Thu, 19 Oct 2023 20:01:22 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Herve Codina <herve.codina@bootlin.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Peter Rosin <peda@axentia.se>,
        Stephen Warren <swarren@nvidia.com>,
        Rob Herring <robh@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Allan Nielsen <allan.nielsen@microchip.com>,
        Horatiu Vultur <horatiu.vultur@microchip.com>,
        Steen Hegelund <steen.hegelund@microchip.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 1/3] i2c: muxes: i2c-mux-pinctrl: Use
 of_get_i2c_adapter_by_node()
Message-ID: <2023101912-managing-perfectly-69fd@gregkh>
References: <20231019101017.425284-1-herve.codina@bootlin.com>
 <20231019101017.425284-2-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019101017.425284-2-herve.codina@bootlin.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Oct 19, 2023 at 12:10:14PM +0200, Herve Codina wrote:
> i2c-mux-pinctrl uses the pair of_find_i2c_adapter_by_node() /
> i2c_put_adapter(). These pair alone is not correct to properly lock the
> I2C parent adapter.
> 
> Indeed, i2c_put_adapter() decrements the module refcount while
> of_find_i2c_adapter_by_node() does not increment it. This leads to an
> underflow of the parent module refcount.
> 
> Use the dedicated function, of_get_i2c_adapter_by_node(), to handle
> correctly the module refcount.
> 
> Fixes: c4aee3e1b0de ("i2c: mux: pinctrl: remove platform_data")
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Acked-by: Peter Rosin <peda@axentia.se>
> ---
>  drivers/i2c/muxes/i2c-mux-pinctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
