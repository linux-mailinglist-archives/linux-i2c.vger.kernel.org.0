Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CECE0588959
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Aug 2022 11:25:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237301AbiHCJZT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Aug 2022 05:25:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236025AbiHCJZS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 3 Aug 2022 05:25:18 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 406A82674;
        Wed,  3 Aug 2022 02:25:16 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B4E6B8B;
        Wed,  3 Aug 2022 11:25:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1659518714;
        bh=dyE6uiB3BtyzQ6Hvm5r5nNTXWHiJXfJFudNL10VeLLY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KKj0EUOYj9TneTLv1Ut9+6WsnKF6EHWxuLpgZJhC2XkGEN94anQg4os1pRDD99oqP
         /qIP2DUwtZIcKQ5G/Y28GsGbLzeqvWq50Ci++ld8NQLzdldeqEZyvI0C5oOC7+6ZO5
         cUzjubjjNcs2xJ+qsNPJEfTk2zD6SyTozTfFne8I=
Date:   Wed, 3 Aug 2022 12:25:08 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Erling Ljunggren <hljunggr@cisco.com>, linux-media@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 0/5] Add the cat24c208 EDID EEPROM driver + new EDID
 capability
Message-ID: <Yuo+9EUJytfOJenN@pendragon.ideasonboard.com>
References: <20220803075850.1196988-1-hljunggr@cisco.com>
 <Yuo8d+16SREwT9J8@pendragon.ideasonboard.com>
 <89d3b85c-2407-164f-57c7-d13ea0f3799c@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <89d3b85c-2407-164f-57c7-d13ea0f3799c@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Hans,

On Wed, Aug 03, 2022 at 11:19:31AM +0200, Hans Verkuil wrote:
> On 03/08/2022 11:14, Laurent Pinchart wrote:
> > Hi Erling,
> > 
> > (CC'ing the linux-i2c mailing list and Srinivas, the maintainer of the
> > nvmem framework)
> > 
> > Thank you for the patches.
> > 
> > On Wed, Aug 03, 2022 at 09:58:45AM +0200, Erling Ljunggren wrote:
> >> This series adds support for the standalone cat24c208 EDID EEPROM i2c device.
> >> Usually EDID support is part of an HDMI receiver, but this is a standalone EEPROM.
> >>
> >> Note that EEPROMs for EDIDs are not regular EEPROM devices, these are dual port
> >> devices that follow the VESA E-DDC standard.
> >>
> >> Since this is a standalone device that does not capture any video a new
> >> V4L2_CAP_EDID_MEMORY capability is introduced to represent such devices.
> >> Note that such a device doesn't have to be an EEPROM, it can also be
> >> implemented using a microcontroller, for example. Hence the use of the generic
> >> word 'MEMORY'.
> > 
> > Why can't this be exposed as a nvmem device, like other types of eeproms
> > here ?
> 
> Because it isn't. Same discussion I had with Andy: it's not a regular eeprom but
> a dedicated eeprom for EDIDs. And we have support for that already in V4L2. It's
> specific to receivers as well, so the only subsystem it belongs to is V4L2.

Why does that matter ? It's still an NVMEM device that stores 512 bytes
of data, even if the I2C interface to read/write it is different than
other types of standard EEPROMs.

> See the discussion I had with Andy on this:
> 
> https://patchwork.linuxtv.org/project/linux-media/patch/20220728114050.2400475-5-hljunggr@cisco.com/
> 
> >> The new capability uses the free bit 0x00000008. But we are running out of
> >> capability bits: only 0x40000000 and 0x00000008 are free at the moment.
> >>
> >> There is one other capability V4L2_CAP_ASYNCIO (0x02000000) that is not used
> >> at all, it was never implemented. Wouldn't it be better to define
> >> V4L2_CAP_ASYNCIO to 0, mark it as obsolete, and instead reuse it for this
> >> V4L2_CAP_EDID_MEMORY capability?
> >>
> >> v2:
> >>  - fix dt binding example
> >>  - rename i2c client variables in data struct
> >>  - fix include: of_device.h -> mod_devicetable.h
> >>  - Sorted makefile
> >>  - used define EDID_OFFSET_EXT_FLAG instead of magic number
> >>  - removed of_match_ptr
> >>  - added bus_info
> >>  - remove unneeded headers
> >>  - add depends on OF to Kconfig
> >>
> >> Erling Ljunggren (4):
> >>   media: videodev2.h: add V4L2_CAP_EDID_MEMORY
> >>   media: docs: Add V4L2_CAP_EDID_MEMORY
> >>   dt-bindings: media: add cat24c208 bindings
> >>   media: v4l2-dev: handle V4L2_CAP_EDID_MEMORY
> >>
> >> Jonathan Selnes (1):
> >>   media: i2c: cat24c208: driver for the cat24c208 EDID EEPROM
> >>
> >>  .../bindings/media/i2c/onnn,cat24c208.yaml    |  40 ++
> >>  .../userspace-api/media/v4l/biblio.rst        |  11 +
> >>  .../media/v4l/vidioc-querycap.rst             |   7 +
> >>  .../media/videodev2.h.rst.exceptions          |   1 +
> >>  MAINTAINERS                                   |   7 +
> >>  drivers/media/i2c/Kconfig                     |   9 +
> >>  drivers/media/i2c/Makefile                    |   1 +
> >>  drivers/media/i2c/cat24c208.c                 | 421 ++++++++++++++++++
> >>  drivers/media/v4l2-core/v4l2-dev.c            |   8 +
> >>  include/uapi/linux/videodev2.h                |   1 +
> >>  10 files changed, 506 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,cat24c208.yaml
> >>  create mode 100644 drivers/media/i2c/cat24c208.c

-- 
Regards,

Laurent Pinchart
