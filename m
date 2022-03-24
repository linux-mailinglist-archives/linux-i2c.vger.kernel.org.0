Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 321624E6B37
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Mar 2022 00:26:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345524AbiCXX1c (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Mar 2022 19:27:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235762AbiCXX1c (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Mar 2022 19:27:32 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8876A9955;
        Thu, 24 Mar 2022 16:25:59 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9860659E;
        Fri, 25 Mar 2022 00:25:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1648164357;
        bh=7MlZmGOM4m0TaAfCbi0FQLVMapWDI73df16HdwL9rf8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aFf2+797gOj0PUOHjNHjar/MCVZZdPr1Q+dDM0TnrK91NNFKJCjAUWcs6ZEdn3WfJ
         owpchdp4jMFfTgHJd1RzuZnXgiQx2ynbRFByB1Jg8SDKnphs7OhjfjmNqHtXJ0dtXV
         6cRM5WgRGr+xel+6MGnmTXseHOadUc7oLecRMe5o=
Date:   Fri, 25 Mar 2022 01:25:55 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Sean Nyekjaer <sean@geanix.com>, devicetree@vger.kernel.org,
        Jose Cazarin <joseespiriki@gmail.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1.1 2/2] iio: dac: dac5571: Fix chip id detection for OF
 devices
Message-ID: <Yjz+A74H+l9RiDAR@pendragon.ideasonboard.com>
References: <20210723183114.26017-3-laurent.pinchart@ideasonboard.com>
 <20210724000654.23168-1-laurent.pinchart@ideasonboard.com>
 <20210724154308.55afb03c@jic23-huawei>
 <YRwfpOuyVEstwsza@kunai>
 <YRwhej9Hz00qnvlQ@pendragon.ideasonboard.com>
 <YRwi62E4xYcMyyFi@kunai>
 <YRwoAgie/mDDunn9@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YRwoAgie/mDDunn9@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Wed, Aug 18, 2021 at 12:20:03AM +0300, Laurent Pinchart wrote:
> On Tue, Aug 17, 2021 at 10:58:19PM +0200, Wolfram Sang wrote:
> > 
> > > > Couldn't you use the "new" probe_new() callback instead which will drop
> > > > the i2c_device_id? Kieran was interested in such conversions IIRC.
> > > 
> > > It's a bit unrelated to this patch, but I can add another patch to the
> > > series.
> > > 
> > > While I have your attention, there's a question for you in the cover
> > > letter :-) Could you please have a look ?
> > 
> > ? This was the answer to that question. Unless I misunderstood.
> 
> My point is that this patch shouldn't be needed. I'd like if the I2C
> core could get the driver data from the i2c_device_id table instead of
> duplicating it in the of_device_id. This isn't possible today as
> i2c_match_id() doesn't have the fallback mechanism that OF matching has.

Any thought on this ?

-- 
Regards,

Laurent Pinchart
