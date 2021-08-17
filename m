Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A37073EF4CA
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Aug 2021 23:20:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233400AbhHQVUp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Aug 2021 17:20:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230515AbhHQVUp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Aug 2021 17:20:45 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 749F2C061764;
        Tue, 17 Aug 2021 14:20:11 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E21A62C5;
        Tue, 17 Aug 2021 23:20:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1629235210;
        bh=h5ACte+IYkCtcopGlqXw02CqacNi0HiPaCVWx3i1Baw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wg+D7Whx7l0hPHEu5uotr47+W1S//1wOLYXYTpLJy53s5o1Cm8wiOl209zN7Nnpe3
         PrpEjpP+mhcS7wrOeL+aCYIhgb5Tm0BoQ/YtFyb1US3D7kqk0zhQ9+V84rStnvEcfJ
         o39SwTKp+bWLPwScnsFOD5Bv+Q9zmbBI17Ktt7PQ=
Date:   Wed, 18 Aug 2021 00:20:02 +0300
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
Message-ID: <YRwoAgie/mDDunn9@pendragon.ideasonboard.com>
References: <20210723183114.26017-3-laurent.pinchart@ideasonboard.com>
 <20210724000654.23168-1-laurent.pinchart@ideasonboard.com>
 <20210724154308.55afb03c@jic23-huawei>
 <YRwfpOuyVEstwsza@kunai>
 <YRwhej9Hz00qnvlQ@pendragon.ideasonboard.com>
 <YRwi62E4xYcMyyFi@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YRwi62E4xYcMyyFi@kunai>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Aug 17, 2021 at 10:58:19PM +0200, Wolfram Sang wrote:
> 
> > > Couldn't you use the "new" probe_new() callback instead which will drop
> > > the i2c_device_id? Kieran was interested in such conversions IIRC.
> > 
> > It's a bit unrelated to this patch, but I can add another patch to the
> > series.
> > 
> > While I have your attention, there's a question for you in the cover
> > letter :-) Could you please have a look ?
> 
> ? This was the answer to that question. Unless I misunderstood.

My point is that this patch shouldn't be needed. I'd like if the I2C
core could get the driver data from the i2c_device_id table instead of
duplicating it in the of_device_id. This isn't possible today as
i2c_match_id() doesn't have the fallback mechanism that OF matching has.

-- 
Regards,

Laurent Pinchart
