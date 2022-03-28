Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 366E74E9246
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Mar 2022 12:04:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233683AbiC1KGK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Mar 2022 06:06:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233834AbiC1KGJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Mar 2022 06:06:09 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09ED4656E;
        Mon, 28 Mar 2022 03:04:26 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C7DA79BC;
        Mon, 28 Mar 2022 12:04:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1648461865;
        bh=tMK+R9kj1Lsag9DOJO+ldf5okh290gG3kRXbCJfVZn0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=m5mXdWlWSz78+D4U+hhr9L4SP50EgSlTMjA6DrHaNVrQuMjPzM0XJ65IngZAXrMne
         xl3nva2CQFt+muTiDkZGWjgjMjriAsa/IlPdIEOFS93oD26Z2N0gYpV4tHyRfZCBBr
         j4LDFEeIp9xSeNf+B6nDd0jMyBcachnAouTWytOA=
Date:   Mon, 28 Mar 2022 13:04:23 +0300
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
Message-ID: <YkGIJ5MQoZ7RN6Y5@pendragon.ideasonboard.com>
References: <20210723183114.26017-3-laurent.pinchart@ideasonboard.com>
 <20210724000654.23168-1-laurent.pinchart@ideasonboard.com>
 <20210724154308.55afb03c@jic23-huawei>
 <YRwfpOuyVEstwsza@kunai>
 <YRwhej9Hz00qnvlQ@pendragon.ideasonboard.com>
 <YRwi62E4xYcMyyFi@kunai>
 <YRwoAgie/mDDunn9@pendragon.ideasonboard.com>
 <YkF99t+NlO+IKMXg@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YkF99t+NlO+IKMXg@ninjato>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Mar 28, 2022 at 11:20:54AM +0200, Wolfram Sang wrote:
> 
> > My point is that this patch shouldn't be needed. I'd like if the I2C
> > core could get the driver data from the i2c_device_id table instead of
> > duplicating it in the of_device_id. This isn't possible today as
> > i2c_match_id() doesn't have the fallback mechanism that OF matching has.
> 
> I think the proper fix would be naming the I2C client after the actually
> matched compatible property, and not after the first one? I am a bit
> afraid of regressions when we change that, however...

That would be the right way indeed. I have the same concern regarding
regressions though. Is it worth a try to see what could break ?

-- 
Regards,

Laurent Pinchart
