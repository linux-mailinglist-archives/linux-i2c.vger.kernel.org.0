Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B050588AA8
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Aug 2022 12:37:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232663AbiHCKhi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Aug 2022 06:37:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229925AbiHCKhh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 3 Aug 2022 06:37:37 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA8CB659F;
        Wed,  3 Aug 2022 03:37:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 749DEB8211D;
        Wed,  3 Aug 2022 10:37:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EBF3C433C1;
        Wed,  3 Aug 2022 10:37:30 +0000 (UTC)
Message-ID: <3d74de7b-80c7-bd6d-c677-3c4232c148fb@xs4all.nl>
Date:   Wed, 3 Aug 2022 12:37:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 0/5] Add the cat24c208 EDID EEPROM driver + new EDID
 capability
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Erling Ljunggren <hljunggr@cisco.com>, linux-media@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20220803075850.1196988-1-hljunggr@cisco.com>
 <Yuo8d+16SREwT9J8@pendragon.ideasonboard.com>
 <89d3b85c-2407-164f-57c7-d13ea0f3799c@xs4all.nl>
 <Yuo+9EUJytfOJenN@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <Yuo+9EUJytfOJenN@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Laurent,

On 03/08/2022 11:25, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Wed, Aug 03, 2022 at 11:19:31AM +0200, Hans Verkuil wrote:
>> On 03/08/2022 11:14, Laurent Pinchart wrote:
>>> Hi Erling,
>>>
>>> (CC'ing the linux-i2c mailing list and Srinivas, the maintainer of the
>>> nvmem framework)
>>>
>>> Thank you for the patches.
>>>
>>> On Wed, Aug 03, 2022 at 09:58:45AM +0200, Erling Ljunggren wrote:
>>>> This series adds support for the standalone cat24c208 EDID EEPROM i2c device.
>>>> Usually EDID support is part of an HDMI receiver, but this is a standalone EEPROM.
>>>>
>>>> Note that EEPROMs for EDIDs are not regular EEPROM devices, these are dual port
>>>> devices that follow the VESA E-DDC standard.
>>>>
>>>> Since this is a standalone device that does not capture any video a new
>>>> V4L2_CAP_EDID_MEMORY capability is introduced to represent such devices.
>>>> Note that such a device doesn't have to be an EEPROM, it can also be
>>>> implemented using a microcontroller, for example. Hence the use of the generic
>>>> word 'MEMORY'.
>>>
>>> Why can't this be exposed as a nvmem device, like other types of eeproms
>>> here ?
>>
>> Because it isn't. Same discussion I had with Andy: it's not a regular eeprom but
>> a dedicated eeprom for EDIDs. And we have support for that already in V4L2. It's
>> specific to receivers as well, so the only subsystem it belongs to is V4L2.
> 
> Why does that matter ? It's still an NVMEM device that stores 512 bytes
> of data, even if the I2C interface to read/write it is different than
> other types of standard EEPROMs.

EDID support is already present in various HDMI receivers (e.g. adv7604). We have
the API for that (VIDIOC_G/S_EDID). The only difference is that for those HDMI
receivers the EDID is in volatile memory and is integrated into the receiver.

Regardless of the underlying implementation (integrated into an HDMI receiver,
a standalone eeprom, or even implemented with a microcontroller), these devices
are dedicated to storing an EDID and are hooked up to the DDC lines of an HDMI
input (or even to multiple HDMI inputs, as supported by the adv7604).

Changing an EDID typically requires additional work such as toggling the hotplug
detect pin, and (if CEC is supported) updating the physical address of the CEC
adapter. While that is not (yet) supported in this driver, it is something that
we might add later.

None of this is good fit for a nvmem driver. The key feature is that this is for
EDIDs. Whether it is implemented as volatile or non-volatile memory is irrelevant,
the relevant feature is that it stores an EDID and is able (if needed) to take care
of HPD toggling and CEC physical addresses.

Perhaps if we add support for e.g. toggling an HPD pin (even though it is not needed
yet for our use-case), it would become more obvious that this not a nvmem device?

Comparing this driver with adv7604 I see that it would make sense to also validate
the EDID (the physical address in particular). Adding that would also more clearly
tie it to the v4l2 subsystem.

V4L2 has all the infrastructure for EDIDs, both in the kernel and in userspace, so
it really does not make sense to go for nvmem, just because it happens to be an
eeprom.

Regards,

	Hans

> 
>> See the discussion I had with Andy on this:
>>
>> https://patchwork.linuxtv.org/project/linux-media/patch/20220728114050.2400475-5-hljunggr@cisco.com/
>>
>>>> The new capability uses the free bit 0x00000008. But we are running out of
>>>> capability bits: only 0x40000000 and 0x00000008 are free at the moment.
>>>>
>>>> There is one other capability V4L2_CAP_ASYNCIO (0x02000000) that is not used
>>>> at all, it was never implemented. Wouldn't it be better to define
>>>> V4L2_CAP_ASYNCIO to 0, mark it as obsolete, and instead reuse it for this
>>>> V4L2_CAP_EDID_MEMORY capability?
>>>>
>>>> v2:
>>>>  - fix dt binding example
>>>>  - rename i2c client variables in data struct
>>>>  - fix include: of_device.h -> mod_devicetable.h
>>>>  - Sorted makefile
>>>>  - used define EDID_OFFSET_EXT_FLAG instead of magic number
>>>>  - removed of_match_ptr
>>>>  - added bus_info
>>>>  - remove unneeded headers
>>>>  - add depends on OF to Kconfig
>>>>
>>>> Erling Ljunggren (4):
>>>>   media: videodev2.h: add V4L2_CAP_EDID_MEMORY
>>>>   media: docs: Add V4L2_CAP_EDID_MEMORY
>>>>   dt-bindings: media: add cat24c208 bindings
>>>>   media: v4l2-dev: handle V4L2_CAP_EDID_MEMORY
>>>>
>>>> Jonathan Selnes (1):
>>>>   media: i2c: cat24c208: driver for the cat24c208 EDID EEPROM
>>>>
>>>>  .../bindings/media/i2c/onnn,cat24c208.yaml    |  40 ++
>>>>  .../userspace-api/media/v4l/biblio.rst        |  11 +
>>>>  .../media/v4l/vidioc-querycap.rst             |   7 +
>>>>  .../media/videodev2.h.rst.exceptions          |   1 +
>>>>  MAINTAINERS                                   |   7 +
>>>>  drivers/media/i2c/Kconfig                     |   9 +
>>>>  drivers/media/i2c/Makefile                    |   1 +
>>>>  drivers/media/i2c/cat24c208.c                 | 421 ++++++++++++++++++
>>>>  drivers/media/v4l2-core/v4l2-dev.c            |   8 +
>>>>  include/uapi/linux/videodev2.h                |   1 +
>>>>  10 files changed, 506 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,cat24c208.yaml
>>>>  create mode 100644 drivers/media/i2c/cat24c208.c
> 
