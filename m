Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E7954EA44B
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Mar 2022 02:48:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231421AbiC2AqK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Mar 2022 20:46:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231536AbiC2AqJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Mar 2022 20:46:09 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8B9125C4E;
        Mon, 28 Mar 2022 17:44:26 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2FC772F7;
        Tue, 29 Mar 2022 02:44:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1648514664;
        bh=i5iRhPBwnmnl9B4ceK9gfhmqBCY0o1t5TCQ4wN7LXYE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tI4Uiff+S8txeE5+xP6JQO/hHwktDe1ZN0w+aWVSE3KZNmdub1lERECURI0h7omBJ
         kSNb5G+88c++DnvEnDhPWSDFAyVtojXPBV/GYAexpHmRd1xB7M+W/W8XsGvPfqndOo
         1GFdAmAQT1LrGZLKrbqvrN62ntkLHPTUTIf9zKwQ=
Date:   Tue, 29 Mar 2022 03:44:21 +0300
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
Message-ID: <YkJWZQJ2f2tyS6sH@pendragon.ideasonboard.com>
References: <20210723183114.26017-3-laurent.pinchart@ideasonboard.com>
 <20210724000654.23168-1-laurent.pinchart@ideasonboard.com>
 <20210724154308.55afb03c@jic23-huawei>
 <YRwfpOuyVEstwsza@kunai>
 <YRwhej9Hz00qnvlQ@pendragon.ideasonboard.com>
 <YRwi62E4xYcMyyFi@kunai>
 <YRwoAgie/mDDunn9@pendragon.ideasonboard.com>
 <YkF99t+NlO+IKMXg@ninjato>
 <YkGIJ5MQoZ7RN6Y5@pendragon.ideasonboard.com>
 <YkGogxobUcRddA4L@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YkGogxobUcRddA4L@ninjato>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Mon, Mar 28, 2022 at 02:22:27PM +0200, Wolfram Sang wrote:
> 
> > > I think the proper fix would be naming the I2C client after the actually
> > > matched compatible property, and not after the first one? I am a bit
> > > afraid of regressions when we change that, however...
> > 
> > That would be the right way indeed. I have the same concern regarding
> > regressions though. Is it worth a try to see what could break ?
> 
> Sure! Only problem: Patches welcome(tm) or I put it on my to-do-list(tm)
> ;)

I've had a look, but it seems to be problematic. The name of the client
is set in i2c_new_client_device(), way before we match with a driver.
The name is used in the uevent sent to userspace, so changing it
afterwards is likely not a good idea.

-- 
Regards,

Laurent Pinchart
