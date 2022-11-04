Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D985619536
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Nov 2022 12:15:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231171AbiKDLPI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Nov 2022 07:15:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbiKDLPG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Nov 2022 07:15:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08D24279;
        Fri,  4 Nov 2022 04:15:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6BA5D62152;
        Fri,  4 Nov 2022 11:15:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A798FC433D6;
        Fri,  4 Nov 2022 11:14:58 +0000 (UTC)
Message-ID: <4ec93bdd-8b3d-2e3c-a7d7-7f3cd12520e7@xs4all.nl>
Date:   Fri, 4 Nov 2022 12:14:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To:     tumic@gpxsee.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, Lizhi Hou <lizhi.hou@amd.com>,
        =?UTF-8?Q?Martin_T=c5=afma?= <martin.tuma@digiteqautomotive.com>
References: <20221018140338.7080-1-tumic@gpxsee.org>
 <20221018140338.7080-3-tumic@gpxsee.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v3 2/2] Added Digiteq Automotive MGB4 driver
In-Reply-To: <20221018140338.7080-3-tumic@gpxsee.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 18/10/2022 16:03, tumic@gpxsee.org wrote:
> From: Martin Tůma <martin.tuma@digiteqautomotive.com>
> 
> Digiteq Automotive MGB4 is a modular frame grabber PCIe card for automotive
> video interfaces. As for now, two modules - FPD-Link and GMSL - are
> available and supported by the driver. The card has two inputs and two
> outputs (FPD-Link only).
> 
> In addition to the video interfaces it also provides a trigger signal
> interface and a MTD interface for FPGA firmware upload.
> 
> Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
> ---
>  Documentation/admin-guide/media/mgb4.rst      | 342 ++++++++
>  .../admin-guide/media/pci-cardlist.rst        |   1 +
>  .../admin-guide/media/v4l-drivers.rst         |   1 +
>  MAINTAINERS                                   |   7 +
>  drivers/media/pci/Kconfig                     |   1 +
>  drivers/media/pci/Makefile                    |   1 +
>  drivers/media/pci/mgb4/Kconfig                |  17 +
>  drivers/media/pci/mgb4/Makefile               |   6 +
>  drivers/media/pci/mgb4/mgb4_cmt.c             | 243 ++++++
>  drivers/media/pci/mgb4/mgb4_cmt.h             |  16 +
>  drivers/media/pci/mgb4/mgb4_core.c            | 628 +++++++++++++++
>  drivers/media/pci/mgb4/mgb4_core.h            |  65 ++
>  drivers/media/pci/mgb4/mgb4_dma.c             | 120 +++
>  drivers/media/pci/mgb4/mgb4_dma.h             |  18 +
>  drivers/media/pci/mgb4/mgb4_i2c.c             | 139 ++++
>  drivers/media/pci/mgb4/mgb4_i2c.h             |  35 +
>  drivers/media/pci/mgb4/mgb4_io.h              |  36 +
>  drivers/media/pci/mgb4/mgb4_regs.c            |  30 +
>  drivers/media/pci/mgb4/mgb4_regs.h            |  35 +
>  drivers/media/pci/mgb4/mgb4_sysfs.h           |  18 +
>  drivers/media/pci/mgb4/mgb4_sysfs_in.c        | 750 ++++++++++++++++++
>  drivers/media/pci/mgb4/mgb4_sysfs_out.c       | 734 +++++++++++++++++
>  drivers/media/pci/mgb4/mgb4_sysfs_pci.c       |  83 ++
>  drivers/media/pci/mgb4/mgb4_trigger.c         | 203 +++++
>  drivers/media/pci/mgb4/mgb4_trigger.h         |   8 +
>  drivers/media/pci/mgb4/mgb4_vin.c             | 665 ++++++++++++++++
>  drivers/media/pci/mgb4/mgb4_vin.h             |  64 ++
>  drivers/media/pci/mgb4/mgb4_vout.c            | 507 ++++++++++++
>  drivers/media/pci/mgb4/mgb4_vout.h            |  58 ++
>  29 files changed, 4831 insertions(+)
>  create mode 100644 Documentation/admin-guide/media/mgb4.rst
>  create mode 100644 drivers/media/pci/mgb4/Kconfig
>  create mode 100644 drivers/media/pci/mgb4/Makefile
>  create mode 100644 drivers/media/pci/mgb4/mgb4_cmt.c
>  create mode 100644 drivers/media/pci/mgb4/mgb4_cmt.h
>  create mode 100644 drivers/media/pci/mgb4/mgb4_core.c
>  create mode 100644 drivers/media/pci/mgb4/mgb4_core.h
>  create mode 100644 drivers/media/pci/mgb4/mgb4_dma.c
>  create mode 100644 drivers/media/pci/mgb4/mgb4_dma.h
>  create mode 100644 drivers/media/pci/mgb4/mgb4_i2c.c
>  create mode 100644 drivers/media/pci/mgb4/mgb4_i2c.h
>  create mode 100644 drivers/media/pci/mgb4/mgb4_io.h
>  create mode 100644 drivers/media/pci/mgb4/mgb4_regs.c
>  create mode 100644 drivers/media/pci/mgb4/mgb4_regs.h
>  create mode 100644 drivers/media/pci/mgb4/mgb4_sysfs.h
>  create mode 100644 drivers/media/pci/mgb4/mgb4_sysfs_in.c
>  create mode 100644 drivers/media/pci/mgb4/mgb4_sysfs_out.c
>  create mode 100644 drivers/media/pci/mgb4/mgb4_sysfs_pci.c
>  create mode 100644 drivers/media/pci/mgb4/mgb4_trigger.c
>  create mode 100644 drivers/media/pci/mgb4/mgb4_trigger.h
>  create mode 100644 drivers/media/pci/mgb4/mgb4_vin.c
>  create mode 100644 drivers/media/pci/mgb4/mgb4_vin.h
>  create mode 100644 drivers/media/pci/mgb4/mgb4_vout.c
>  create mode 100644 drivers/media/pci/mgb4/mgb4_vout.h
> 
> diff --git a/Documentation/admin-guide/media/mgb4.rst b/Documentation/admin-guide/media/mgb4.rst
> new file mode 100644
> index 000000000000..fa9966a53b96
> --- /dev/null
> +++ b/Documentation/admin-guide/media/mgb4.rst
> @@ -0,0 +1,342 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +====================
> +mgb4 sysfs interface
> +====================
> +
> +The mgb4 driver provides a sysfs interface, that is used to configure video
> +stream related parameters (some of them must be set properly before the v4l2
> +device can be opened) and obtain the video device/stream status.
> +
> +There are two types of parameters - global / PCI card related, found under
> +``/sys/class/video4linux/videoX/device`` and module specific found under
> +``/sys/class/video4linux/videoX``.
> +
> +
> +Global (PCI card) parameters
> +============================
> +
> +**module_type** (R):
> +    Module type.
> +
> +    | 0 - No module present
> +    | 1 - FPDL3
> +    | 2 - GMSL
> +
> +**module_version** (R):
> +    Module version number. Zero in case of a missing module.
> +
> +**fw_type** (R):
> +    Firmware type.
> +
> +    | 1 - FPDL3
> +    | 2 - GMSL
> +
> +**fw_version** (R):
> +    Firmware version number.
> +
> +**serial_number** (R):
> +    Card serial number. The format is::
> +
> +        PRODUCT-REVISION-SERIES-SERIAL
> +
> +    where each component is a 8b number.
> +
> +**temperature** (R):
> +    FPGA core temperature in Celsius degree.
> +
> +Common FPDL3/GMSL input parameters
> +==================================
> +
> +**input_id** (R):
> +    Input number ID, zero based.
> +
> +**oldi_lane_width** (RW):
> +    Number of deserializer output lanes.
> +
> +    | 0 - single
> +    | 1 - dual
> +
> +**color_mapping** (RW):
> +    Mapping of the incoming bits in the signal to the colour bits of the pixels.
> +
> +    | 0 - OLDI/JEIDA
> +    | 1 - SPWG/VESA
> +
> +**link_status** (R):
> +    Video link status. If the link is locked, chips are properly connected and
> +    communicating at the same speed and protocol. The link can be locked without
> +    an active video stream.
> +
> +    | 0 - unlocked
> +    | 1 - locked
> +
> +**stream_status** (R):
> +    Video stream status. A stream is detected if the link is locked, the input
> +    pixel clock is running and the DE signal is moving.
> +
> +    | 0 - not detected
> +    | 1 - detected
> +
> +**vsync_status** (R):
> +    The type of VSYNC pulses as detected by the video format detector.
> +
> +    | 0 - active low
> +    | 1 - active high
> +    | 2 - not available
> +
> +**hsync_status** (R):
> +    The type of HSYNC pulses as detected by the video format detector.
> +
> +    | 0 - active low
> +    | 1 - active high
> +    | 2 - not available
> +
> +**vsync_gap_length** (RW):
> +    If the incoming video signal does not contain synchronization VSYNC and
> +    HSYNC pulses, these must be generated internally in the FPGA to achieve
> +    the correct frame ordering. This value indicates, how many "empty" pixels
> +    (pixels with deasserted Data Enable signal) are necessary to generate the
> +    internal VSYNC pulse.
> +
> +**hsync_gap_length** (RW):
> +    If the incoming video signal does not contain synchronization VSYNC and
> +    HSYNC pulses, these must be generated internally in the FPGA to achieve
> +    the correct frame ordering. This value indicates, how many "empty" pixels
> +    (pixels with deasserted Data Enable signal) are necessary to generate the
> +    internal HSYNC pulse. The value must be greater than 1 and smaller than
> +    vsync_gap_length.
> +
> +**pclk_frequency** (R):
> +    Input pixel clock frequency in kHz.
> +
> +    *Note: The frequency_range parameter must be set properly first to get
> +    a valid frequency here.*
> +
> +**hsync_width** (R):
> +    Width of the HSYNC signal in PCLK clock ticks.
> +
> +**vsync_width** (R):
> +    Width of the VSYNC signal in PCLK clock ticks.
> +
> +**hback_porch** (R):
> +    Number of PCLK pulses between deassertion of the HSYNC signal and the first
> +    valid pixel in the video line (marked by DE=1).
> +
> +**hfront_porch** (R):
> +    Number of PCLK pulses between the end of the last valid pixel in the video
> +    line (marked by DE=1) and assertion of the HSYNC signal.
> +
> +**vback_porch** (R):
> +    Number of video lines between deassertion of the VSYNC signal and the video
> +    line with the first valid pixel (marked by DE=1).
> +
> +**vfront_porch** (R):
> +    Number of video lines between the end of the last valid pixel line (marked
> +    by DE=1) and assertion of the VSYNC signal.
> +
> +**frequency_range** (RW)
> +    PLL frequency range of the OLDI input clock generator. The PLL frequency is
> +    derived from the Pixel Clock Frequency (PCLK) and is equal to PCLK if
> +    oldi_lane_width is set to "single" and PCLK/2 if oldi_lane_width is set to
> +    "dual".
> +
> +    | 0 - PLL < 50MHz
> +    | 1 - PLL >= 50MHz
> +
> +    *Note: This parameter can not be changed while the input v4l2 device is
> +    open.*
> +
> +**alignment** (RW)
> +    Pixel line alignment. Sets the pixel line alignment in bytes of the frame
> +    buffers provided via the v4l2 interface. The number must be a power of 2.
> +
> +    *Note: This parameter can not be changed while the input v4l2 device is
> +    open.*
> +
> +Common FPDL3/GMSL output parameters
> +===================================
> +
> +**output_id** (R):
> +    Output number ID, zero based.
> +
> +**video_source** (RW):
> +    Output video source. If set to 0 or 1, the source is the corresponding card
> +    input and the v4l2 output devices are disabled. If set to 2 or 3, the source
> +    is the corresponding v4l2 video output device.
> +
> +    | 0 - input 0
> +    | 1 - input 1
> +    | 2 - v4l2 output 0
> +    | 3 - v4l2 output 1
> +
> +    *Note: This parameter can not be changed while ANY of the input/output v4l2
> +    devices is open.*
> +
> +**display_width** (RW):
> +    Display width. There is no autodetection of the connected display, so the
> +    propper value must be set before the start of streaming.
> +
> +    *Note: This parameter can not be changed while the output v4l2 device is
> +    open.*
> +
> +**display_height** (RW):
> +    Display height. There is no autodetection of the connected display, so the
> +    propper value must be set before the start of streaming.
> +
> +    *Note: This parameter can not be changed while the output v4l2 device is
> +    open.*
> +
> +**frame_rate** (RW):
> +    Output video frame rate in frames per second.
> +
> +**hsync_polarity** (RW):
> +    HSYNC signal polarity.
> +
> +    | 0 - active low
> +    | 1 - active high
> +
> +**vsync_polarity** (RW):
> +    VSYNC signal polarity.
> +
> +    | 0 - active low
> +    | 1 - active high
> +
> +**de_polarity** (RW):
> +    DE signal polarity.
> +
> +    | 0 - active low
> +    | 1 - active high
> +
> +**pclk_frequency** (RW):
> +    Output pixel clock frequency. Allowed values are between 25000-190000(kHz)
> +    and there is a non-linear stepping between two consecutive allowed
> +    frequencies. The driver finds the nearest allowed frequency to the given
> +    value and sets it. When reading this property, you get the exact
> +    frequency set by the driver.
> +
> +    *Note: This parameter can not be changed while the output v4l2 device is
> +    open.*
> +
> +**hsync_width** (RW):
> +    Width of the HSYNC signal in PCLK clock ticks.
> +
> +**vsync_width** (RW):
> +    Width of the VSYNC signal in PCLK clock ticks.
> +
> +**hback_porch** (RW):
> +    Number of PCLK pulses between deassertion of the HSYNC signal and the first
> +    valid pixel in the video line (marked by DE=1).
> +
> +**hfront_porch** (RW):
> +    Number of PCLK pulses between the end of the last valid pixel in the video
> +    line (marked by DE=1) and assertion of the HSYNC signal.
> +
> +**vback_porch** (RW):
> +    Number of video lines between deassertion of the VSYNC signal and the video
> +    line with the first valid pixel (marked by DE=1).
> +
> +**vfront_porch** (RW):
> +    Number of video lines between the end of the last valid pixel line (marked
> +    by DE=1) and assertion of the VSYNC signal.
> +
> +**alignment** (RW)
> +    Pixel line alignment. Sets the pixel line alignment in bytes of the frame
> +    buffers provided via the v4l2 interface. The number must be a power of 2.
> +
> +    *Note: This parameter can not be changed while the output v4l2 device is
> +    open.*
> +
> +    *Note: This parameter can not be changed when loopback mode is active
> +    (video_source is 0 or 1). When loopback mode is enabled, the alignment is
> +    automatically set to the alignment of the input device.*
> +
> +FPDL3 specific input parameters
> +===============================
> +
> +**fpdl3_input_width** (RW):
> +    Number of deserializer input lines.
> +
> +    | 0 - auto
> +    | 1 - single
> +    | 2 - dual
> +
> +FPDL3 specific output parameters
> +================================
> +
> +**fpdl3_output_width** (RW):
> +    Number of serializer output lines.
> +
> +    | 0 - auto
> +    | 1 - single
> +    | 2 - dual
> +
> +GMSL specific input parameters
> +==============================
> +
> +**gmsl_mode** (RW):
> +    GMSL speed mode.
> +
> +    | 0 - 12Gb/s
> +    | 1 - 6Gb/s
> +    | 2 - 3Gb/s
> +    | 3 - 1.5Gb/s
> +
> +**gmsl_stream_id** (RW):
> +    The GMSL multi-stream contains up to four video streams. This parameter
> +    selects which stream is captured by the video input. The value is the
> +    zero-based index of the stream.
> +
> +    *Note: This parameter can not be changed while the input v4l2 device is
> +    open.*
> +
> +**gmsl_fec** (RW):
> +    GMSL Forward Error Correction (FEC).
> +
> +    | 0 - disabled
> +    | 1 - enabled
> +
> +
> +====================
> +mgb4 mtd partitions
> +====================
> +
> +The mgb4 driver creates a MTD device with two partitions:
> + - mgb4-fw.X - FPGA firmware.
> + - mgb4-data.X - Factory settings, e.g. card serial number.
> +
> +The *mgb4-fw* partition is writable and is used for FW updates, *mgb4-data* is
> +read-only. The *X* attached to the partition name represents the card number.
> +Depending on the CONFIG_MTD_PARTITIONED_MASTER kernel configuration, you may
> +also have a third partition named *mgb4-flash* available in the system. This
> +partition represents the whole, unpartitioned, card's FLASH memory and one should
> +not fiddle with it...
> +
> +====================
> +mgb4 iio (triggers)
> +====================
> +
> +The mgb4 driver creates an Industrial I/O (IIO) device that provides trigger and
> +signal level status capability. The following scan elements are available:
> +
> +**activity**:
> +	The trigger levels and pending status.
> +
> +	| bit 1 - trigger 1 pending
> +	| bit 2 - trigger 2 pending
> +	| bit 5 - trigger 1 level
> +	| bit 6 - trigger 2 level
> +
> +**timestamp**:
> +	The trigger event timestamp.
> +
> +The iio device can operate either in "raw" mode where you can fetch the signal
> +levels (activity bits 5 and 6) using sysfs access or in triggered buffer mode.
> +In the triggered buffer mode you can follow the signal level changes (activity
> +bits 1 and 2) using the iio device in /dev. If you enable the timestamps, you
> +will also get the exact trigger event time that can be matched to a video frame
> +(every mgb4 video frame has a timestamp with the same clock source).
> +
> +*Note: although the activity sample always contains all the status bits, it makes
> +no sense to get the pending bits in raw mode or the level bits in the triggered
> +buffer mode - the values do not represent valid data in such case.*
> diff --git a/Documentation/admin-guide/media/pci-cardlist.rst b/Documentation/admin-guide/media/pci-cardlist.rst
> index f4d670e632f8..220f12c0bc37 100644
> --- a/Documentation/admin-guide/media/pci-cardlist.rst
> +++ b/Documentation/admin-guide/media/pci-cardlist.rst
> @@ -78,6 +78,7 @@ ivtv              Conexant cx23416/cx23415 MPEG encoder/decoder
>  ivtvfb            Conexant cx23415 framebuffer
>  mantis            MANTIS based cards
>  meye              Sony Vaio Picturebook Motion Eye
> +mgb4              Digiteq Automotive MGB4 frame grabber
>  mxb               Siemens-Nixdorf 'Multimedia eXtension Board'
>  netup-unidvb      NetUP Universal DVB card
>  ngene             Micronas nGene
> diff --git a/Documentation/admin-guide/media/v4l-drivers.rst b/Documentation/admin-guide/media/v4l-drivers.rst
> index 9c7ebe2ca3bd..96b2d662ace0 100644
> --- a/Documentation/admin-guide/media/v4l-drivers.rst
> +++ b/Documentation/admin-guide/media/v4l-drivers.rst
> @@ -20,6 +20,7 @@ Video4Linux (V4L) driver-specific documentation
>  	ipu3
>  	ivtv
>  	meye
> +	mgb4
>  	omap3isp
>  	omap4_camera
>  	philips
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 07938eab80dd..0e3564888649 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6092,6 +6092,13 @@ L:	linux-gpio@vger.kernel.org
>  S:	Maintained
>  F:	drivers/gpio/gpio-gpio-mm.c
>  
> +DIGITEQ AUTOMOTIVE MGB4 V4L2 DRIVER
> +M:	Martin Tuma <martin.tuma@digiteqautomotive.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/admin-guide/media/mgb4.rst
> +F:	drivers/media/pci/mgb4/
> +
>  DIOLAN U2C-12 I2C DRIVER
>  M:	Guenter Roeck <linux@roeck-us.net>
>  L:	linux-i2c@vger.kernel.org
> diff --git a/drivers/media/pci/Kconfig b/drivers/media/pci/Kconfig
> index dff0b450f387..072543b32337 100644
> --- a/drivers/media/pci/Kconfig
> +++ b/drivers/media/pci/Kconfig
> @@ -13,6 +13,7 @@ if MEDIA_PCI_SUPPORT
>  if MEDIA_CAMERA_SUPPORT
>  	comment "Media capture support"
>  
> +source "drivers/media/pci/mgb4/Kconfig"
>  source "drivers/media/pci/solo6x10/Kconfig"
>  source "drivers/media/pci/sta2x11/Kconfig"
>  source "drivers/media/pci/tw5864/Kconfig"
> diff --git a/drivers/media/pci/Makefile b/drivers/media/pci/Makefile
> index 8f887a8a7f17..e2942a2ab2fc 100644
> --- a/drivers/media/pci/Makefile
> +++ b/drivers/media/pci/Makefile
> @@ -30,6 +30,7 @@ obj-$(CONFIG_VIDEO_CX25821) += cx25821/
>  obj-$(CONFIG_VIDEO_CX88) += cx88/
>  obj-$(CONFIG_VIDEO_DT3155) += dt3155/
>  obj-$(CONFIG_VIDEO_IVTV) += ivtv/
> +obj-$(CONFIG_VIDEO_MGB4) += mgb4/
>  obj-$(CONFIG_VIDEO_SAA7134) += saa7134/
>  obj-$(CONFIG_VIDEO_SAA7164) += saa7164/
>  obj-$(CONFIG_VIDEO_SOLO6X10) += solo6x10/
> diff --git a/drivers/media/pci/mgb4/Kconfig b/drivers/media/pci/mgb4/Kconfig
> new file mode 100644
> index 000000000000..13fad15a434c
> --- /dev/null
> +++ b/drivers/media/pci/mgb4/Kconfig
> @@ -0,0 +1,17 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config VIDEO_MGB4
> +	tristate "Digiteq Automotive MGB4 support"
> +	depends on VIDEO_DEV && PCI && I2C && DMADEVICES && SPI && MTD && IIO
> +	select VIDEOBUF2_DMA_SG
> +	select IIO_BUFFER
> +	select IIO_TRIGGERED_BUFFER
> +	select I2C_XILINX
> +	select SPI_XILINX
> +	select MTD_SPI_NOR
> +	select XILINX_XDMA
> +	help
> +	  This is a video4linux driver for Digiteq Automotive MGB4 grabber
> +	  cards.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called mgb4.
> diff --git a/drivers/media/pci/mgb4/Makefile b/drivers/media/pci/mgb4/Makefile
> new file mode 100644
> index 000000000000..e92ead18bed0
> --- /dev/null
> +++ b/drivers/media/pci/mgb4/Makefile
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0
> +mgb4-objs	:= mgb4_regs.o mgb4_core.o mgb4_vin.o mgb4_vout.o \
> +               mgb4_sysfs_pci.o mgb4_sysfs_in.o mgb4_sysfs_out.o \
> +               mgb4_i2c.o mgb4_cmt.o mgb4_trigger.o mgb4_dma.o
> +
> +obj-$(CONFIG_VIDEO_MGB4) += mgb4.o
> diff --git a/drivers/media/pci/mgb4/mgb4_cmt.c b/drivers/media/pci/mgb4/mgb4_cmt.c
> new file mode 100644
> index 000000000000..3ec394e46bd0
> --- /dev/null
> +++ b/drivers/media/pci/mgb4/mgb4_cmt.c
> @@ -0,0 +1,243 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2021-2022 Digiteq Automotive
> + *     author: Martin Tuma <martin.tuma@digiteqautomotive.com>
> + */
> +
> +#include <linux/types.h>
> +#include <linux/kernel.h>
> +#include "mgb4_core.h"
> +#include "mgb4_cmt.h"
> +

Erm, what is CMT and where do the values in the tables below come from?

> +static const uint16_t cmt_vals_out[][15] = {
> +	{0x1208, 0x0000, 0x171C, 0x0000, 0x1E38, 0x0000, 0x11C7, 0x0000, 0x1041, 0x01BC, 0x7C01, 0x7DE9, 0xFFFF, 0x9900, 0x8100, },
> +	{0x11C7, 0x0000, 0x1619, 0x0080, 0x1C71, 0x0000, 0x130D, 0x0080, 0x0041, 0x0090, 0x7C01, 0x7DE9, 0xFFFF, 0x1100, 0x9000, },
> +	{0x11C7, 0x0000, 0x1619, 0x0080, 0x1C71, 0x0000, 0x165A, 0x0080, 0x0082, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x1000, 0x9000, },
> +	{0x11C7, 0x0000, 0x1619, 0x0080, 0x1C71, 0x0000, 0x1187, 0x0080, 0x1041, 0x01EE, 0x7C01, 0x7DE9, 0xFFFF, 0x9900, 0x8100, },
> +	{0x1186, 0x0000, 0x1555, 0x0000, 0x1AAA, 0x0000, 0x1451, 0x0000, 0x0042, 0x0013, 0x7C01, 0x7DE9, 0xFFFF, 0x0900, 0x1000, },
> +	{0x11C7, 0x0000, 0x1619, 0x0080, 0x1C71, 0x0000, 0x134E, 0x0080, 0x0041, 0x005E, 0x7C01, 0x7DE9, 0xFFFF, 0x0900, 0x1000, },
> +	{0x1145, 0x0000, 0x1452, 0x0080, 0x18E3, 0x0000, 0x1619, 0x0080, 0x0083, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x1000, 0x9000, },
> +	{0x1145, 0x0000, 0x1452, 0x0080, 0x18E3, 0x0000, 0x179E, 0x0000, 0x00C3, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x0800, 0x1000, },
> +	{0x1145, 0x0000, 0x1452, 0x0080, 0x18E3, 0x0000, 0x179F, 0x0080, 0x00C3, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x0800, 0x1000, },
> +	{0x1145, 0x0000, 0x1452, 0x0080, 0x18E3, 0x0000, 0x17DF, 0x0000, 0x00C3, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x1000, 0x8800, },
> +	{0x1145, 0x0000, 0x1452, 0x0080, 0x18E3, 0x0000, 0x128B, 0x0080, 0x0041, 0x00DB, 0x7C01, 0x7DE9, 0xFFFF, 0x9000, 0x0100, },
> +	{0x1186, 0x0000, 0x1555, 0x0000, 0x1AAA, 0x0000, 0x1820, 0x0000, 0x0083, 0x00FA, 0x7DE9, 0x7DE8, 0xFFFF, 0x0900, 0x9000, },
> +	{0x1186, 0x0000, 0x1555, 0x0000, 0x1AAA, 0x0000, 0x1187, 0x0080, 0x1041, 0x01EE, 0x7C01, 0x7DE9, 0xFFFF, 0x9900, 0x8100, },
> +	{0x1104, 0x0000, 0x138E, 0x0000, 0x171C, 0x0000, 0x169B, 0x0080, 0x00C3, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x1800, 0x0100, },
> +	{0x1145, 0x0000, 0x1452, 0x0080, 0x18E3, 0x0000, 0x171C, 0x0000, 0x0083, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x1100, 0x1800, },
> +	{0x1186, 0x0000, 0x1555, 0x0000, 0x1AAA, 0x0000, 0x1515, 0x0080, 0x0042, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x0900, 0x1000, },
> +	{0x1104, 0x0000, 0x138E, 0x0000, 0x171C, 0x0000, 0x1493, 0x0080, 0x0082, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x0900, 0x1000, },
> +	{0x1145, 0x0000, 0x1452, 0x0080, 0x18E3, 0x0000, 0x15D8, 0x0080, 0x0082, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x1900, 0x0100, },
> +	{0x1104, 0x0000, 0x138E, 0x0000, 0x171C, 0x0000, 0x124A, 0x0080, 0x0041, 0x010D, 0x7C01, 0x7DE9, 0xFFFF, 0x9000, 0x0100, },
> +	{0x1104, 0x0000, 0x138E, 0x0000, 0x171C, 0x0000, 0x175D, 0x0000, 0x00C3, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x0800, 0x1000, },
> +	{0x1145, 0x0000, 0x1452, 0x0080, 0x18E3, 0x0000, 0x1619, 0x0080, 0x0082, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x1000, 0x9000, },
> +	{0x1145, 0x0000, 0x1452, 0x0080, 0x18E3, 0x0000, 0x17DF, 0x0000, 0x0083, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x1000, 0x8800, },
> +	{0x1145, 0x0000, 0x1452, 0x0080, 0x18E3, 0x0000, 0x17E0, 0x0080, 0x0083, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x0900, 0x9000, },
> +	{0x1145, 0x0000, 0x1452, 0x0080, 0x18E3, 0x0000, 0x1820, 0x0000, 0x0083, 0x00FA, 0x7DE9, 0x7DE8, 0xFFFF, 0x0900, 0x9000, },
> +	{0x1104, 0x0000, 0x138E, 0x0000, 0x171C, 0x0000, 0x13D0, 0x0080, 0x0042, 0x002C, 0x7C01, 0x7DE9, 0xFFFF, 0x0900, 0x1000, },
> +	{0x1104, 0x0000, 0x138E, 0x0000, 0x171C, 0x0000, 0x128B, 0x0080, 0x0041, 0x00DB, 0x7C01, 0x7DE9, 0xFFFF, 0x9000, 0x0100, },
> +	{0x1104, 0x0000, 0x138E, 0x0000, 0x171C, 0x0000, 0x1820, 0x0000, 0x00C3, 0x00FA, 0x7DE9, 0x7DE8, 0xFFFF, 0x0900, 0x9000, },
> +	{0x1145, 0x0000, 0x1452, 0x0080, 0x18E3, 0x0000, 0x134E, 0x0080, 0x0041, 0x005E, 0x7C01, 0x7DE9, 0xFFFF, 0x0900, 0x1000, },
> +	{0x1145, 0x0000, 0x1452, 0x0080, 0x18E3, 0x0000, 0x1515, 0x0080, 0x0042, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x0900, 0x1000, },
> +	{0x10C3, 0x0000, 0x128B, 0x0080, 0x1555, 0x0000, 0x175D, 0x0000, 0x00C4, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x0800, 0x1000, },
> +	{0x1145, 0x0000, 0x1452, 0x0080, 0x18E3, 0x0000, 0x11C7, 0x0000, 0x1041, 0x01BC, 0x7C01, 0x7DE9, 0xFFFF, 0x9900, 0x8100, },
> +	{0x10C3, 0x0000, 0x128B, 0x0080, 0x1555, 0x0000, 0x1209, 0x0080, 0x0041, 0x013F, 0x7C01, 0x7DE9, 0xFFFF, 0x9900, 0x1100, },
> +	{0x10C3, 0x0000, 0x128B, 0x0080, 0x1555, 0x0000, 0x1556, 0x0080, 0x0083, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x0800, 0x8000, },
> +	{0x10C3, 0x0000, 0x128B, 0x0080, 0x1555, 0x0000, 0x179F, 0x0080, 0x00C4, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x0800, 0x1000, },
> +	{0x1104, 0x0000, 0x138E, 0x0000, 0x171C, 0x0000, 0x15D8, 0x0080, 0x0082, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x1900, 0x0100, },
> +	{0x10C3, 0x0000, 0x128B, 0x0080, 0x1555, 0x0000, 0x1105, 0x0080, 0x1041, 0x01E8, 0x6401, 0x65E9, 0xFFFF, 0x9800, 0x1100, },
> +	{0x10C3, 0x0000, 0x128B, 0x0080, 0x1555, 0x0000, 0x1820, 0x0000, 0x00C4, 0x00FA, 0x7DE9, 0x7DE8, 0xFFFF, 0x0900, 0x9000, },
> +	{0x1104, 0x0000, 0x138E, 0x0000, 0x171C, 0x0000, 0x1493, 0x0080, 0x0042, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x0900, 0x1000, },
> +	{0x10C3, 0x0000, 0x128B, 0x0080, 0x1555, 0x0000, 0x138E, 0x0000, 0x0042, 0x005E, 0x7C01, 0x7DE9, 0xFFFF, 0x0900, 0x1000, },
> +	{0x1104, 0x0000, 0x138E, 0x0000, 0x171C, 0x0000, 0x17E0, 0x0080, 0x0083, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x0900, 0x9000, },
> +	{0x1104, 0x0000, 0x138E, 0x0000, 0x171C, 0x0000, 0x165A, 0x0080, 0x0082, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x1000, 0x9000, },
> +	{0x10C3, 0x0000, 0x128B, 0x0080, 0x1555, 0x0000, 0x175D, 0x0000, 0x00C3, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x0800, 0x1000, },
> +	{0x1104, 0x0000, 0x138E, 0x0000, 0x171C, 0x0000, 0x1187, 0x0080, 0x1041, 0x01EE, 0x7C01, 0x7DE9, 0xFFFF, 0x9900, 0x8100, },
> +	{0x10C3, 0x0000, 0x128B, 0x0080, 0x1555, 0x0000, 0x175E, 0x0080, 0x00C3, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x0800, 0x1000, },
> +	{0x10C3, 0x0000, 0x128B, 0x0080, 0x1555, 0x0000, 0x179E, 0x0000, 0x00C3, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x0800, 0x1000, },
> +	{0x1104, 0x0000, 0x138E, 0x0000, 0x171C, 0x0000, 0x134E, 0x0080, 0x0041, 0x005E, 0x7C01, 0x7DE9, 0xFFFF, 0x0900, 0x1000, },
> +	{0x10C3, 0x0000, 0x128B, 0x0080, 0x1555, 0x0000, 0x165A, 0x0080, 0x0083, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x1000, 0x9000, },
> +	{0x1104, 0x0000, 0x138E, 0x0000, 0x171C, 0x0000, 0x16DC, 0x0080, 0x0082, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x1100, 0x1800, },
> +	{0x10C3, 0x0000, 0x128B, 0x0080, 0x1555, 0x0000, 0x169A, 0x0000, 0x0083, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x1000, 0x9000, },
> +	{0x1104, 0x0000, 0x138E, 0x0000, 0x171C, 0x0000, 0x11C7, 0x0000, 0x1041, 0x01BC, 0x7C01, 0x7DE9, 0xFFFF, 0x9900, 0x8100, },
> +	{0x10C3, 0x0000, 0x128B, 0x0080, 0x1555, 0x0000, 0x169B, 0x0080, 0x0083, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x1800, 0x0100, },
> +	{0x1104, 0x0000, 0x138E, 0x0000, 0x171C, 0x0000, 0x171D, 0x0080, 0x0082, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x1100, 0x1800, },
> +	{0x10C3, 0x0000, 0x128B, 0x0080, 0x1555, 0x0000, 0x16DB, 0x0000, 0x0083, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x1800, 0x0100, },
> +	{0x10C3, 0x0000, 0x128B, 0x0080, 0x1555, 0x0000, 0x1146, 0x0080, 0x1041, 0x0184, 0x7C01, 0x7DE9, 0xFFFF, 0x9900, 0x8100, },
> +	{0x10C3, 0x0000, 0x128B, 0x0080, 0x1555, 0x0000, 0x171C, 0x0000, 0x0083, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x1100, 0x1800, },
> +	{0x10C3, 0x0000, 0x128B, 0x0080, 0x1555, 0x0000, 0x1451, 0x0000, 0x0042, 0x0013, 0x7C01, 0x7DE9, 0xFFFF, 0x0900, 0x1000, },
> +	{0x10C3, 0x0000, 0x128B, 0x0080, 0x1555, 0x0000, 0x171D, 0x0080, 0x0083, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x1100, 0x1800, },
> +	{0x10C3, 0x0000, 0x128B, 0x0080, 0x1555, 0x0000, 0x175D, 0x0000, 0x0083, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x0800, 0x1000, },
> +	{0x10C3, 0x0000, 0x128B, 0x0080, 0x1555, 0x0000, 0x1452, 0x0080, 0x0042, 0x0013, 0x7C01, 0x7DE9, 0xFFFF, 0x0900, 0x1000, },
> +	{0x10C3, 0x0000, 0x128B, 0x0080, 0x1555, 0x0000, 0x15D8, 0x0080, 0x0082, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x1900, 0x0100, },
> +	{0x1082, 0x0000, 0x11C7, 0x0000, 0x138E, 0x0000, 0x1104, 0x0000, 0x1041, 0x01E8, 0x5801, 0x59E9, 0xFFFF, 0x9900, 0x0900, },
> +	{0x10C3, 0x0000, 0x128B, 0x0080, 0x1555, 0x0000, 0x179F, 0x0080, 0x0083, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x0800, 0x1000, },
> +	{0x1082, 0x0000, 0x11C7, 0x0000, 0x138E, 0x0000, 0x1515, 0x0080, 0x0083, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x0900, 0x1000, },
> +	{0x10C3, 0x0000, 0x128B, 0x0080, 0x1555, 0x0000, 0x17DF, 0x0000, 0x0083, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x1000, 0x8800, },
> +	{0x1082, 0x0000, 0x11C7, 0x0000, 0x138E, 0x0000, 0x1659, 0x0000, 0x00C3, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x1000, 0x9000, },
> +	{0x1082, 0x0000, 0x11C7, 0x0000, 0x138E, 0x0000, 0x1555, 0x0000, 0x0083, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x0800, 0x8000, },
> +	{0x10C3, 0x0000, 0x128B, 0x0080, 0x1555, 0x0000, 0x14D3, 0x0000, 0x0042, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x0900, 0x1000, },
> +	{0x10C3, 0x0000, 0x128B, 0x0080, 0x1555, 0x0000, 0x1820, 0x0000, 0x0083, 0x00FA, 0x7DE9, 0x7DE8, 0xFFFF, 0x0900, 0x9000, },
> +	{0x1082, 0x0000, 0x11C7, 0x0000, 0x138E, 0x0000, 0x1556, 0x0080, 0x0083, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x0800, 0x8000, },
> +	{0x10C3, 0x0000, 0x128B, 0x0080, 0x1555, 0x0000, 0x1187, 0x0080, 0x1041, 0x01EE, 0x7C01, 0x7DE9, 0xFFFF, 0x9900, 0x8100, },
> +	{0x1082, 0x0000, 0x11C7, 0x0000, 0x138E, 0x0000, 0x1452, 0x0080, 0x0082, 0x0013, 0x7C01, 0x7DE9, 0xFFFF, 0x0900, 0x1000, },
> +	{0x1082, 0x0000, 0x11C7, 0x0000, 0x138E, 0x0000, 0x169B, 0x0080, 0x00C3, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x1800, 0x0100, },
> +	{0x10C3, 0x0000, 0x128B, 0x0080, 0x1555, 0x0000, 0x1514, 0x0000, 0x0042, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x0900, 0x1000, },
> +	{0x1082, 0x0000, 0x11C7, 0x0000, 0x138E, 0x0000, 0x17E0, 0x0080, 0x00C4, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x0900, 0x9000, },
> +	{0x10C3, 0x0000, 0x128B, 0x0080, 0x1555, 0x0000, 0x1515, 0x0080, 0x0042, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x0900, 0x1000, },
> +	{0x10C3, 0x0000, 0x128B, 0x0080, 0x1555, 0x0000, 0x16DC, 0x0080, 0x0082, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x1100, 0x1800, },
> +	{0x1082, 0x0000, 0x11C7, 0x0000, 0x138E, 0x0000, 0x1493, 0x0080, 0x0082, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x0900, 0x1000, },
> +	{0x1082, 0x0000, 0x11C7, 0x0000, 0x138E, 0x0000, 0x171C, 0x0000, 0x00C3, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x1100, 0x1800, },
> +	{0x1082, 0x0000, 0x11C7, 0x0000, 0x138E, 0x0000, 0x15D8, 0x0080, 0x0083, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x1900, 0x0100, },
> +	{0x1082, 0x0000, 0x11C7, 0x0000, 0x138E, 0x0000, 0x171D, 0x0080, 0x00C3, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x1100, 0x1800, },
> +	{0x1082, 0x0000, 0x11C7, 0x0000, 0x138E, 0x0000, 0x1618, 0x0000, 0x0083, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x1900, 0x0100, },
> +	{0x1082, 0x0000, 0x11C7, 0x0000, 0x138E, 0x0000, 0x175D, 0x0000, 0x00C3, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x0800, 0x1000, },
> +	{0x1082, 0x0000, 0x11C7, 0x0000, 0x138E, 0x0000, 0x14D4, 0x0080, 0x0082, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x0900, 0x1000, },
> +	{0x1082, 0x0000, 0x11C7, 0x0000, 0x138E, 0x0000, 0x1619, 0x0080, 0x0083, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x1000, 0x9000, },
> +	{0x1082, 0x0000, 0x11C7, 0x0000, 0x138E, 0x0000, 0x179E, 0x0000, 0x00C3, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x0800, 0x1000, },
> +	{0x1082, 0x0000, 0x11C7, 0x0000, 0x138E, 0x0000, 0x179F, 0x0080, 0x00C3, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x0800, 0x1000, },
> +	{0x1082, 0x0000, 0x11C7, 0x0000, 0x138E, 0x0000, 0x1515, 0x0080, 0x0082, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x0900, 0x1000, },
> +	{0x1082, 0x0000, 0x11C7, 0x0000, 0x138E, 0x0000, 0x13D0, 0x0080, 0x0042, 0x002C, 0x7C01, 0x7DE9, 0xFFFF, 0x0900, 0x1000, },
> +	{0x1082, 0x0000, 0x11C7, 0x0000, 0x138E, 0x0000, 0x169A, 0x0000, 0x0083, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x1000, 0x9000, },
> +	{0x1082, 0x0000, 0x11C7, 0x0000, 0x138E, 0x0000, 0x128B, 0x0080, 0x0041, 0x00DB, 0x7C01, 0x7DE9, 0xFFFF, 0x9000, 0x0100, },
> +	{0x1082, 0x0000, 0x11C7, 0x0000, 0x138E, 0x0000, 0x169B, 0x0080, 0x0083, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x1800, 0x0100, },
> +	{0x1082, 0x0000, 0x11C7, 0x0000, 0x138E, 0x0000, 0x1820, 0x0000, 0x00C3, 0x00FA, 0x7DE9, 0x7DE8, 0xFFFF, 0x0900, 0x9000, },
> +	{0x1082, 0x0000, 0x11C7, 0x0000, 0x138E, 0x0000, 0x1556, 0x0080, 0x0082, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x0800, 0x8000, },
> +	{0x1082, 0x0000, 0x11C7, 0x0000, 0x138E, 0x0000, 0x16DB, 0x0000, 0x0083, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x1800, 0x0100, },
> +	{0x1082, 0x0000, 0x11C7, 0x0000, 0x138E, 0x0000, 0x1411, 0x0080, 0x0042, 0x002C, 0x7C01, 0x7DE9, 0xFFFF, 0x0900, 0x1000, },
> +	{0x1082, 0x0000, 0x11C7, 0x0000, 0x138E, 0x0000, 0x171C, 0x0000, 0x0083, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x1100, 0x1800, },
> +	{0x1082, 0x0000, 0x11C7, 0x0000, 0x138E, 0x0000, 0x1597, 0x0080, 0x0082, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x0800, 0x8000, },
> +	{0x1082, 0x0000, 0x11C7, 0x0000, 0x138E, 0x0000, 0x1451, 0x0000, 0x0042, 0x0013, 0x7C01, 0x7DE9, 0xFFFF, 0x0900, 0x1000, },
> +	{0x1082, 0x0000, 0x11C7, 0x0000, 0x138E, 0x0000, 0x171D, 0x0080, 0x0083, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x1100, 0x1800, },
> +	{0x1082, 0x0000, 0x11C7, 0x0000, 0x138E, 0x0000, 0x12CC, 0x0080, 0x0041, 0x00A9, 0x7C01, 0x7DE9, 0xFFFF, 0x1100, 0x9000, },
> +	{0x1082, 0x0000, 0x11C7, 0x0000, 0x138E, 0x0000, 0x175D, 0x0000, 0x0083, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x0800, 0x1000, },
> +	{0x1082, 0x0000, 0x11C7, 0x0000, 0x138E, 0x0000, 0x1452, 0x0080, 0x0042, 0x0013, 0x7C01, 0x7DE9, 0xFFFF, 0x0900, 0x1000, },
> +	{0x1082, 0x0000, 0x11C7, 0x0000, 0x138E, 0x0000, 0x15D8, 0x0080, 0x0082, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x1900, 0x0100, },
> +	{0x1082, 0x0000, 0x11C7, 0x0000, 0x138E, 0x0000, 0x175E, 0x0080, 0x0083, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x0800, 0x1000, },
> +	{0x1082, 0x0000, 0x11C7, 0x0000, 0x138E, 0x0000, 0x1492, 0x0000, 0x0042, 0x0013, 0x7C01, 0x7DE9, 0xFFFF, 0x0900, 0x1000, },
> +	{0x1082, 0x0000, 0x11C7, 0x0000, 0x138E, 0x0000, 0x179F, 0x0080, 0x0083, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x0800, 0x1000, },
> +	{0x1082, 0x0000, 0x11C7, 0x0000, 0x138E, 0x0000, 0x1619, 0x0080, 0x0082, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x1000, 0x9000, },
> +	{0x1082, 0x0000, 0x11C7, 0x0000, 0x138E, 0x0000, 0x1493, 0x0080, 0x0042, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x0900, 0x1000, },
> +	{0x1082, 0x0000, 0x11C7, 0x0000, 0x138E, 0x0000, 0x17DF, 0x0000, 0x0083, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x1000, 0x8800, },
> +	{0x1082, 0x0000, 0x11C7, 0x0000, 0x138E, 0x0000, 0x130D, 0x0080, 0x0041, 0x0090, 0x7C01, 0x7DE9, 0xFFFF, 0x1100, 0x9000, },
> +	{0x1082, 0x0000, 0x11C7, 0x0000, 0x138E, 0x0000, 0x17E0, 0x0080, 0x0083, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x0900, 0x9000, },
> +	{0x1082, 0x0000, 0x11C7, 0x0000, 0x138E, 0x0000, 0x14D3, 0x0000, 0x0042, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x0900, 0x1000, },
> +	{0x1082, 0x0000, 0x11C7, 0x0000, 0x138E, 0x0000, 0x165A, 0x0080, 0x0082, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x1000, 0x9000, },
> +	{0x1082, 0x0000, 0x11C7, 0x0000, 0x138E, 0x0000, 0x1820, 0x0000, 0x0083, 0x00FA, 0x7DE9, 0x7DE8, 0xFFFF, 0x0900, 0x9000, },
> +	{0x1082, 0x0000, 0x11C7, 0x0000, 0x138E, 0x0000, 0x14D4, 0x0080, 0x0042, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x0900, 0x1000, },
> +	{0x1082, 0x0000, 0x11C7, 0x0000, 0x138E, 0x0000, 0x169B, 0x0080, 0x0082, 0x00FA, 0x7C01, 0x7DE9, 0xFFFF, 0x1800, 0x0100, },
> +};
> +
> +static const uint16_t cmt_vals_in[][13] = {
> +	{0x1082, 0x0000, 0x5104, 0x0000, 0x11C7, 0x0000, 0x1041, 0x02BC, 0x7C01, 0xFFE9, 0x9900, 0x9908, 0x8100},
> +	{0x1104, 0x0000, 0x9208, 0x0000, 0x138E, 0x0000, 0x1041, 0x015E, 0x7C01, 0xFFE9, 0x0100, 0x0908, 0x1000},
> +};
> +
> +static const uint32_t cmt_addrs_out[][15] = {
> +	{0x420, 0x424, 0x428, 0x42C, 0x430, 0x434, 0x450, 0x454, 0x458, 0x460, 0x464, 0x468, 0x4A0, 0x538, 0x53C},
> +	{0x620, 0x624, 0x628, 0x62C, 0x630, 0x634, 0x650, 0x654, 0x658, 0x660, 0x664, 0x668, 0x6A0, 0x738, 0x73C},
> +};
> +
> +static const uint32_t cmt_addrs_in[][13] = {
> +	{0x020, 0x024, 0x028, 0x02C, 0x050, 0x054, 0x058, 0x060, 0x064, 0x068, 0x0A0, 0x138, 0x13C},
> +	{0x220, 0x224, 0x228, 0x22C, 0x250, 0x254, 0x258, 0x260, 0x264, 0x268, 0x2A0, 0x338, 0x33C},
> +};
> +
> +static const uint32_t cmt_freq[] = {
> +	25000, 25510, 26020, 26530, 26983, 27551, 28000, 28570,
> +	29046, 29522, 30000, 30476, 30952, 31546, 32000, 32539,
> +	33035, 33571, 33928, 34522, 35000, 35428, 36000, 36571,
> +	36904, 37500, 38093, 38571, 39047, 39453, 40000, 40476,
> +	40952, 41494, 41964, 42857, 43535, 44047, 44444, 45000,
> +	45535, 46029, 46428, 46823, 47617, 48214, 48571, 49107,
> +	49523, 50000, 50476, 50892, 51428, 52380, 53333, 53967,
> +	54285, 55238, 55555, 55952, 57142, 58095, 58571, 59047,
> +	59521, 60000, 60316, 60952, 61428, 61904, 62500, 63092,
> +	63491, 64282, 65078, 65476, 66071, 66664, 67142, 67854,
> +	68571, 69044, 69642, 70000, 71425, 72616, 73214, 73808,
> +	74285, 75000, 75714, 76187, 76785, 77142, 78570, 80000,
> +	80357, 80951, 81428, 82142, 82857, 83332, 83928, 84285,
> +	85713, 87142, 87500, 88094, 88571, 89285, 90000, 90475,
> +	91071, 91428, 92856, 94642,
> +};
> +
> +
> +static size_t freq_srch(u32 key, const u32 *array, size_t size)
> +{
> +	int l = 0;
> +	int r = size - 1;
> +	int m;
> +
> +	while (l <= r) {
> +		m = (l + r) / 2;
> +		if (array[m] < key)
> +			l = m + 1;
> +		else if (array[m] > key)
> +			r = m - 1;
> +		else
> +			return m;
> +	}
> +
> +	if (r < 0 || l > size - 1)
> +		return m;
> +	else
> +		return (abs(key - array[l]) < abs(key - array[r])) ? l : r;
> +}
> +
> +
> +u32 mgb4_cmt_set_vout(struct mgb4_vout_dev *voutdev, unsigned int freq)
> +{
> +	const uint16_t *reg_set;
> +	const uint32_t *addr;
> +	u32 config;
> +	size_t i, index;
> +
> +	index = freq_srch(freq, cmt_freq, ARRAY_SIZE(cmt_freq));
> +	addr = cmt_addrs_out[voutdev->config->id];
> +	reg_set = cmt_vals_out[index];
> +
> +	config = mgb4_read_reg(&voutdev->mgbdev->video, voutdev->config->regs.config);
> +
> +	mgb4_write_reg(&voutdev->mgbdev->video, voutdev->config->regs.config,
> +	  0x1 | (config & ~0x3));
> +
> +	for (i = 0; i < ARRAY_SIZE(cmt_addrs_out[0]); i++)
> +		mgb4_write_reg(&voutdev->mgbdev->cmt, addr[i], reg_set[i]);
> +
> +	mgb4_mask_reg(&voutdev->mgbdev->video, voutdev->config->regs.config,
> +	  0x100, 0x100);
> +	mgb4_mask_reg(&voutdev->mgbdev->video, voutdev->config->regs.config,
> +	  0x100, 0x0);
> +
> +	mgb4_write_reg(&voutdev->mgbdev->video, voutdev->config->regs.config,
> +	  config & ~0x1);
> +
> +	return cmt_freq[index];
> +}

I'm pretty certain that you didn't run 'checkpatch.pl --strict' over this patch.
Please do so for v4!

> +
> +void mgb4_cmt_set_vin(struct mgb4_vin_dev *vindev, unsigned int freq_range)
> +{
> +	const uint16_t *reg_set;
> +	const uint32_t *addr;
> +	u32 config;
> +	size_t i;
> +
> +	addr = cmt_addrs_in[vindev->config->id];
> +	reg_set = cmt_vals_in[freq_range];
> +
> +	config = mgb4_read_reg(&vindev->mgbdev->video, vindev->config->regs.config);
> +
> +	mgb4_write_reg(&vindev->mgbdev->video, vindev->config->regs.config,
> +	  0x1 | (config & ~0x3));
> +
> +	for (i = 0; i < ARRAY_SIZE(cmt_addrs_in[0]); i++)
> +		mgb4_write_reg(&vindev->mgbdev->cmt, addr[i], reg_set[i]);
> +
> +	mgb4_mask_reg(&vindev->mgbdev->video, vindev->config->regs.config,
> +	  0x1000, 0x1000);
> +	mgb4_mask_reg(&vindev->mgbdev->video, vindev->config->regs.config,
> +	  0x1000, 0x0);
> +
> +	mgb4_write_reg(&vindev->mgbdev->video, vindev->config->regs.config,
> +	  config & ~0x1);
> +}
> diff --git a/drivers/media/pci/mgb4/mgb4_cmt.h b/drivers/media/pci/mgb4/mgb4_cmt.h
> new file mode 100644
> index 000000000000..353966654c95
> --- /dev/null
> +++ b/drivers/media/pci/mgb4/mgb4_cmt.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2021-2022 Digiteq Automotive
> + *     author: Martin Tuma <martin.tuma@digiteqautomotive.com>
> + */
> +
> +#ifndef __MGB4_CMT_H__
> +#define __MGB4_CMT_H__
> +
> +#include "mgb4_vout.h"
> +#include "mgb4_vin.h"
> +
> +u32 mgb4_cmt_set_vout(struct mgb4_vout_dev *voutdev, unsigned int freq);
> +void mgb4_cmt_set_vin(struct mgb4_vin_dev *vindev, unsigned int freq_range);
> +
> +#endif
> diff --git a/drivers/media/pci/mgb4/mgb4_core.c b/drivers/media/pci/mgb4/mgb4_core.c
> new file mode 100644
> index 000000000000..8aa548c79f5f
> --- /dev/null
> +++ b/drivers/media/pci/mgb4/mgb4_core.c
> @@ -0,0 +1,628 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * This is the driver for the MGB4 video grabber card by Digiteq Automotive.
> + *
> + * Copyright (C) 2021-2022 Digiteq Automotive
> + *     author: Martin Tuma <martin.tuma@digiteqautomotive.com>
> + */
> +
> +#include <linux/types.h>
> +#include <linux/version.h>
> +#include <linux/module.h>
> +#include <linux/pci.h>
> +#include <linux/platform_device.h>
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/clkdev.h>
> +#include <linux/i2c.h>
> +#include <linux/delay.h>
> +#include <linux/dma/amd_xdma.h>
> +#include <linux/platform_data/amd_xdma.h>
> +#include <linux/spi/xilinx_spi.h>
> +#include <linux/mtd/mtd.h>
> +#include "mgb4_dma.h"
> +#include "mgb4_i2c.h"
> +#include "mgb4_sysfs.h"
> +#include "mgb4_vout.h"
> +#include "mgb4_vin.h"
> +#include "mgb4_trigger.h"
> +#include "mgb4_core.h"
> +
> +
> +#define MGB4_USER_IRQS 16
> +
> +static int flashid;
> +
> +static struct xdma_chan_info h2c_chan_info = {
> +	.dir = DMA_MEM_TO_DEV,
> +};
> +
> +static struct xdma_chan_info c2h_chan_info = {
> +	.dir = DMA_DEV_TO_MEM,
> +};
> +
> +static struct xspi_platform_data spi_platform_data = {
> +	.num_chipselect = 1,
> +	.bits_per_word = 8
> +};
> +
> +static const struct i2c_board_info extender_info = {
> +	I2C_BOARD_INFO("extender", 0x21)
> +};
> +
> +static int match_i2c_adap(struct device *dev, void *data)
> +{
> +	return (i2c_verify_adapter(dev) != NULL);
> +}
> +
> +static struct i2c_adapter *get_i2c_adap(struct platform_device *pdev)
> +{
> +	struct device *dev;
> +	int i;
> +
> +	for (i = 0; i < 10; i++) {
> +		msleep(100);
> +		mutex_lock(&pdev->dev.mutex);
> +		dev = device_find_child(&pdev->dev, NULL, match_i2c_adap);
> +		mutex_unlock(&pdev->dev.mutex);
> +		if (dev)
> +			return to_i2c_adapter(dev);
> +	}
> +
> +	return NULL;
> +}
> +
> +static int match_spi_adap(struct device *dev, void *data)
> +{
> +	return (to_spi_device(dev) != NULL);
> +}
> +
> +static struct spi_master *get_spi_adap(struct platform_device *pdev)
> +{
> +	struct device *dev;
> +	int i;
> +
> +	for (i = 0; i < 10; i++) {
> +		msleep(100);
> +		mutex_lock(&pdev->dev.mutex);
> +		dev = device_find_child(&pdev->dev, NULL, match_spi_adap);
> +		mutex_unlock(&pdev->dev.mutex);
> +		if (dev)
> +			return container_of(dev, struct spi_master, dev);
> +	}
> +
> +	return NULL;
> +}
> +
> +static int init_spi(struct mgb4_dev *mgbdev)
> +{
> +	struct resource spi_resources[] = {
> +		{
> +			.start	= 0x400,
> +			.end	= 0x47f,
> +			.flags	= IORESOURCE_MEM,
> +			.name	= "io-memory",
> +		},
> +		{
> +			.start	= 14,
> +			.end	= 14,
> +			.flags	= IORESOURCE_IRQ,
> +			.name	= "irq",
> +		},
> +	};
> +	struct spi_board_info spi_info = {
> +		.max_speed_hz = 10000000,
> +		.modalias = "m25p80",
> +		.chip_select = 0,
> +		.mode = SPI_MODE_3,
> +	};
> +	struct pci_dev *pdev = mgbdev->pdev;
> +	struct device *dev = &pdev->dev;
> +	struct spi_master *master;
> +	struct spi_device *spi_dev;
> +	u32 irq;
> +	int rv, id;
> +	resource_size_t mapbase = pci_resource_start(pdev, MGB4_MGB4_BAR_ID);
> +
> +	irq = xdma_get_user_irq(mgbdev->xdev, 14);
> +	xdma_enable_user_irq(mgbdev->xdev, irq);
> +
> +	spi_resources[0].parent = &pdev->resource[MGB4_MGB4_BAR_ID];
> +	spi_resources[0].start += mapbase;
> +	spi_resources[0].end += mapbase;
> +	spi_resources[1].start = irq;
> +	spi_resources[1].end = irq;
> +
> +	id = pci_dev_id(pdev);
> +	mgbdev->spi_pdev = platform_device_register_resndata(dev, "xilinx_spi",
> +		id, spi_resources, ARRAY_SIZE(spi_resources), &spi_platform_data,
> +		sizeof(spi_platform_data));
> +	if (IS_ERR(mgbdev->spi_pdev)) {
> +		dev_err(dev, "failed to register SPI device\n");
> +		return PTR_ERR(mgbdev->spi_pdev);
> +	}
> +
> +	master = get_spi_adap(mgbdev->spi_pdev);
> +	if (!master) {
> +		dev_err(dev, "failed to get SPI adapter\n");
> +		rv = -EINVAL;
> +		goto err_pdev;
> +	}
> +
> +	snprintf(mgbdev->fw_part_name, sizeof(mgbdev->fw_part_name), "mgb4-fw.%d",
> +	  flashid);
> +	mgbdev->partitions[0].name = mgbdev->fw_part_name;
> +	mgbdev->partitions[0].size = 0x400000;
> +	mgbdev->partitions[0].offset = 0x400000;
> +	mgbdev->partitions[0].mask_flags = 0;
> +
> +	snprintf(mgbdev->data_part_name, sizeof(mgbdev->data_part_name),
> +	  "mgb4-data.%d", flashid);
> +	mgbdev->partitions[1].name = mgbdev->data_part_name;
> +	mgbdev->partitions[1].size = 0x10000;
> +	mgbdev->partitions[1].offset = 0xFF0000;
> +	mgbdev->partitions[1].mask_flags = MTD_CAP_NORFLASH;
> +
> +	snprintf(mgbdev->flash_name, sizeof(mgbdev->flash_name), "mgb4-flash.%d",
> +	  flashid);
> +	mgbdev->flash_data.name = mgbdev->flash_name;
> +	mgbdev->flash_data.parts = mgbdev->partitions;
> +	mgbdev->flash_data.nr_parts = ARRAY_SIZE(mgbdev->partitions);
> +	mgbdev->flash_data.type = "spi-nor";
> +
> +	spi_info.platform_data = &(mgbdev->flash_data);
> +
> +	spi_dev = spi_new_device(master, &spi_info);
> +	put_device(&master->dev);
> +	if (!spi_dev) {
> +		dev_err(dev, "failed to create MTD device\n");
> +		rv = -EINVAL;
> +		goto err_pdev;
> +	}
> +
> +	return 0;
> +
> +err_pdev:
> +	platform_device_unregister(mgbdev->spi_pdev);
> +
> +	return rv;
> +}
> +
> +static void free_spi(struct mgb4_dev *mgbdev)
> +{
> +	platform_device_unregister(mgbdev->spi_pdev);
> +}
> +
> +static int init_i2c(struct mgb4_dev *mgbdev)
> +{
> +	struct resource i2c_resources[] = {
> +		{
> +			.start	= 0x200,
> +			.end	= 0x3ff,
> +			.flags	= IORESOURCE_MEM,
> +			.name	= "io-memory",
> +		},
> +		{
> +			.start	= 15,
> +			.end	= 15,
> +			.flags	= IORESOURCE_IRQ,
> +			.name	= "irq",
> +		},
> +	};
> +	struct pci_dev *pdev = mgbdev->pdev;
> +	struct device *dev = &pdev->dev;
> +	char clk_name[16];
> +	u32 irq;
> +	int rv, id;
> +	resource_size_t mapbase = pci_resource_start(pdev, MGB4_MGB4_BAR_ID);
> +
> +	irq = xdma_get_user_irq(mgbdev->xdev, 15);
> +	xdma_enable_user_irq(mgbdev->xdev, irq);
> +
> +	i2c_resources[0].parent = &pdev->resource[MGB4_MGB4_BAR_ID];
> +	i2c_resources[0].start += mapbase;
> +	i2c_resources[0].end += mapbase;
> +	i2c_resources[1].start = irq;
> +	i2c_resources[1].end = irq;
> +
> +	id = pci_dev_id(pdev);
> +
> +	// create dummy clock required by the xiic-i2c adapter
> +	snprintf(clk_name, sizeof(clk_name), "xiic-i2c.%d", id);
> +	mgbdev->i2c_clk = clk_hw_register_fixed_rate(NULL, clk_name, NULL, 0, 125000000);
> +	if (IS_ERR(mgbdev->i2c_clk)) {
> +		dev_err(dev, "failed to register I2C clock\n");
> +		return PTR_ERR(mgbdev->i2c_clk);
> +	}
> +	mgbdev->i2c_cl = clkdev_hw_create(mgbdev->i2c_clk, NULL, "xiic-i2c.%d", id);
> +	if (!mgbdev->i2c_cl) {
> +		dev_err(dev, "failed to register I2C clockdev\n");
> +		rv = -ENOMEM;
> +		goto err_clk;
> +	}
> +
> +	mgbdev->i2c_pdev = platform_device_register_resndata(dev, "xiic-i2c",
> +		id, i2c_resources, ARRAY_SIZE(i2c_resources), NULL, 0);
> +	if (IS_ERR(mgbdev->i2c_pdev)) {
> +		dev_err(dev, "failed to register I2C device\n");
> +		rv = PTR_ERR(mgbdev->i2c_pdev);
> +		goto err_clkdev;
> +	}
> +
> +	mgbdev->i2c_adap = get_i2c_adap(mgbdev->i2c_pdev);
> +	if (!mgbdev->i2c_adap) {
> +		dev_err(dev, "failed to get I2C adapter\n");
> +		rv = -EINVAL;
> +		goto err_pdev;
> +	}
> +
> +	mutex_init(&mgbdev->i2c_lock);
> +
> +	return 0;
> +
> +err_pdev:
> +	platform_device_unregister(mgbdev->i2c_pdev);
> +err_clkdev:
> +	clkdev_drop(mgbdev->i2c_cl);
> +err_clk:
> +	clk_hw_unregister(mgbdev->i2c_clk);
> +
> +	return rv;
> +}
> +
> +static void free_i2c(struct mgb4_dev *mgbdev)
> +{
> +	put_device(&mgbdev->i2c_adap->dev);
> +	platform_device_unregister(mgbdev->i2c_pdev);
> +	clkdev_drop(mgbdev->i2c_cl);
> +	clk_hw_unregister(mgbdev->i2c_clk);
> +}
> +
> +static int init_sysfs(struct pci_dev *pdev)
> +{
> +	struct device_attribute **attr, **eattr;
> +	int rv;
> +
> +	for (attr = mgb4_pci_attrs; *attr; attr++) {
> +		rv = device_create_file(&pdev->dev, *attr);
> +		if (rv < 0)
> +			goto err_file;
> +	}
> +
> +	return 0;
> +
> +err_file:
> +	for (eattr = mgb4_pci_attrs; eattr != attr; eattr++)
> +		device_remove_file(&pdev->dev, *eattr);
> +
> +	return rv;
> +}
> +
> +static void free_sysfs(struct pci_dev *pdev)
> +{
> +	struct device_attribute **attr;
> +
> +	for (attr = mgb4_pci_attrs; *attr; attr++)
> +		device_remove_file(&pdev->dev, *attr);
> +}
> +
> +static int get_serial_number(struct mgb4_dev *mgbdev)
> +{
> +	struct device *dev = &mgbdev->pdev->dev;
> +	struct mtd_info *mtd;
> +	size_t rs;
> +	int rv;
> +
> +	mgbdev->serial_number = 0;
> +
> +	mtd = get_mtd_device_nm(mgbdev->data_part_name);
> +	if (IS_ERR(mtd)) {
> +		dev_warn(dev, "failed to get data MTD device\n");
> +		return -ENOENT;
> +	}
> +	rv = mtd_read(mtd, 0, sizeof(mgbdev->serial_number), &rs,
> +	  (u_char *)&mgbdev->serial_number);
> +	put_mtd_device(mtd);
> +	if (rv < 0 || rs != sizeof(mgbdev->serial_number)) {
> +		dev_warn(dev, "error reading MTD device\n");
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +static int get_module_version(struct mgb4_dev *mgbdev)
> +{
> +	struct device *dev = &mgbdev->pdev->dev;
> +	struct mgb4_i2c_client extender;
> +	s32 version;
> +	u32 fw_version;
> +	int rv;
> +
> +	rv = mgb4_i2c_init(&extender, mgbdev->i2c_adap, &extender_info, 8);
> +	if (rv < 0) {
> +		dev_err(dev, "failed to create extender I2C device\n");
> +		return rv;
> +	}
> +	version = mgb4_i2c_read_byte(&extender, 0x00);
> +	mgb4_i2c_free(&extender);
> +	if (version < 0) {
> +		dev_err(dev, "error reading module version\n");
> +		return -EIO;
> +	}
> +
> +	mgbdev->module_version = ~((u32)version) & 0xff;
> +	if (!(MGB4_IS_FPDL3(mgbdev) || MGB4_IS_GMSL(mgbdev))) {
> +		dev_err(dev, "unknown module type\n");
> +		return -EINVAL;
> +	}
> +	fw_version = mgb4_read_reg(&mgbdev->video, 0xC4);
> +	if (fw_version >> 24 != mgbdev->module_version >> 4) {
> +		dev_err(dev, "module/firmware type mismatch\n");
> +		return -EINVAL;
> +	}
> +
> +	dev_info(dev, "%s module detected\n",
> +		 MGB4_IS_FPDL3(mgbdev) ? "FPDL3" : "GMSL");
> +
> +	return 0;
> +}
> +
> +static int map_regs(struct pci_dev *pdev, struct resource *res,
> +		    struct mgb4_regs *regs)
> +{
> +	int rv;
> +	resource_size_t mapbase = pci_resource_start(pdev, MGB4_MGB4_BAR_ID);
> +
> +	res->start += mapbase;
> +	res->end += mapbase;
> +
> +	rv = mgb4_regs_map(res, regs);
> +	if (rv < 0) {
> +		dev_err(&pdev->dev, "failed to map %s registers\n", res->name);
> +		return rv;
> +	}
> +
> +	return 0;
> +}
> +
> +static int init_xdma(struct mgb4_dev *mgbdev)
> +{
> +	struct xdma_platdata data;
> +	struct resource res[2] = { 0 };
> +	struct dma_slave_map *map;
> +	struct pci_dev *pdev = mgbdev->pdev;
> +	struct device *dev = &pdev->dev;
> +	int i;
> +
> +	res[0].start = pci_resource_start(pdev, MGB4_XDMA_BAR_ID);
> +	res[0].end = pci_resource_end(pdev, MGB4_XDMA_BAR_ID);
> +	res[0].flags = IORESOURCE_MEM;
> +	res[0].parent = &pdev->resource[MGB4_XDMA_BAR_ID];
> +	res[1].start = pci_irq_vector(pdev, 0);
> +	res[1].end = res[1].start + MGB4_VIN_DEVICES + MGB4_VOUT_DEVICES
> +		     + MGB4_USER_IRQS - 1;
> +	res[1].flags = IORESOURCE_IRQ;
> +
> +	data.max_dma_channels = MGB4_VIN_DEVICES + MGB4_VOUT_DEVICES;
> +	data.device_map = mgbdev->slave_map;
> +	data.device_map_cnt = MGB4_VIN_DEVICES + MGB4_VOUT_DEVICES;
> +
> +	for (i = 0; i < MGB4_VIN_DEVICES; i++) {
> +		sprintf(mgbdev->channel_names[i], "c2h%d", i);
> +		map = &data.device_map[i];
> +		map->slave = mgbdev->channel_names[i];
> +		map->devname = dev_name(dev);
> +		map->param = XDMA_FILTER_PARAM(&c2h_chan_info);
> +	}
> +	for (i = 0; i < MGB4_VOUT_DEVICES; i++) {
> +		sprintf(mgbdev->channel_names[i + MGB4_VIN_DEVICES], "h2c%d", i);
> +		map = &data.device_map[i + MGB4_VIN_DEVICES];
> +		map->slave = mgbdev->channel_names[i + MGB4_VIN_DEVICES];
> +		map->devname = dev_name(dev);
> +		map->param = XDMA_FILTER_PARAM(&h2c_chan_info);
> +	}
> +
> +	mgbdev->xdev = platform_device_register_resndata(
> +		dev, "xdma", PLATFORM_DEVID_AUTO, res, 2, &data, sizeof(data));
> +	if (IS_ERR(mgbdev->xdev)) {
> +		dev_err(dev, "failed to register XDMA device\n");
> +		return PTR_ERR(mgbdev->xdev);
> +	}
> +
> +	return 0;
> +}
> +
> +static void free_xdma(struct mgb4_dev *mgbdev)
> +{
> +	platform_device_unregister(mgbdev->xdev);
> +}
> +
> +static int mgb4_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> +{
> +	int i, rv;
> +	struct mgb4_dev *mgbdev;
> +	struct resource video = {
> +		.start	= 0x0,
> +		.end	= 0x100,
> +		.flags	= IORESOURCE_MEM,
> +		.name	= "mgb4-video",
> +	};
> +	struct resource cmt = {
> +		.start	= 0x1000,
> +		.end	= 0x1800,
> +		.flags	= IORESOURCE_MEM,
> +		.name	= "mgb4-cmt",
> +	};
> +	int irqs = pci_msix_vec_count(pdev);
> +
> +
> +	mgbdev = kzalloc(sizeof(*mgbdev), GFP_KERNEL);
> +	if (!mgbdev)
> +		return -ENOMEM;
> +
> +	mgbdev->pdev = pdev;
> +	pci_set_drvdata(pdev, mgbdev);
> +
> +	/* PCIe related stuff */
> +	rv = pci_enable_device(pdev);
> +	if (rv) {
> +		dev_err(&pdev->dev, "error enabling PCI device\n");
> +		goto err_mgbdev;
> +	}
> +
> +	rv = pcie_capability_set_word(pdev, PCI_EXP_DEVCTL, PCI_EXP_DEVCTL_RELAX_EN);
> +	if (rv)
> +		dev_warn(&pdev->dev, "error enabling PCIe relaxed ordering\n");
> +	rv = pcie_capability_set_word(pdev, PCI_EXP_DEVCTL, PCI_EXP_DEVCTL_EXT_TAG);
> +	if (rv)
> +		dev_warn(&pdev->dev, "error enabling PCIe extended tag field\n");
> +	rv = pcie_set_readrq(pdev, 512);
> +	if (rv)
> +		dev_warn(&pdev->dev, "error setting PCIe max. memory read size\n");
> +	pci_set_master(pdev);
> +
> +	rv = pci_alloc_irq_vectors(pdev, irqs, irqs, PCI_IRQ_MSIX);
> +	if (rv < 0) {
> +		dev_err(&pdev->dev, "error allocating MSI-X IRQs\n");
> +		goto err_enable_pci;
> +	}
> +
> +	rv = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
> +	if (rv) {
> +		dev_err(&pdev->dev, "error setting DMA mask\n");
> +		goto err_enable_pci;
> +	}
> +
> +	/* DMA + IRQ engine */
> +	rv = init_xdma(mgbdev);
> +	if (rv)
> +		goto err_alloc_irq;
> +	rv = mgb4_dma_channel_init(mgbdev);
> +	if (rv)
> +		goto err_dma_chan;
> +
> +	/* mgb4 video registers */
> +	rv = map_regs(pdev, &video, &mgbdev->video);
> +	if (rv < 0)
> +		goto err_dma_chan;
> +	/* mgb4 cmt registers */
> +	rv = map_regs(pdev, &cmt, &mgbdev->cmt);
> +	if (rv < 0)
> +		goto err_video_regs;
> +
> +	/* SPI FLASH */
> +	rv = init_spi(mgbdev);
> +	if (rv < 0)
> +		goto err_cmt_regs;
> +
> +	/* I2C controller */
> +	rv = init_i2c(mgbdev);
> +	if (rv < 0)
> +		goto err_spi;
> +
> +	/* PCI card related sysfs attributes */
> +	rv = init_sysfs(pdev);
> +	if (rv < 0)
> +		goto err_i2c;
> +
> +	/* Get card serial number. On systems without MTD flash support we may
> +	 * get an error thus ignore the return value. An invalid serial number
> +	 * should not break anything...
> +	 */
> +	if (get_serial_number(mgbdev) < 0)
> +		dev_warn(&pdev->dev, "error reading card serial number\n");
> +
> +	/* Get module type. If no valid module is found, skip the video device
> +	 * creation part but do not exit with error to allow flashing the card.
> +	 */
> +	rv = get_module_version(mgbdev);
> +	if (rv < 0)
> +		goto exit;
> +
> +	/* Video input v4l2 devices */
> +	for (i = 0; i < MGB4_VIN_DEVICES; i++)
> +		mgbdev->vin[i] = mgb4_vin_create(mgbdev, i);
> +
> +	/* Video output v4l2 devices */
> +	for (i = 0; i < MGB4_VOUT_DEVICES; i++)
> +		mgbdev->vout[i] = mgb4_vout_create(mgbdev, i);
> +
> +	/* Triggers */
> +	mgbdev->indio_dev = mgb4_trigger_create(mgbdev);
> +
> +exit:
> +	flashid++;
> +
> +	return 0;
> +
> +err_i2c:
> +	free_i2c(mgbdev);
> +err_spi:
> +	free_spi(mgbdev);
> +err_cmt_regs:
> +	mgb4_regs_free(&mgbdev->cmt);
> +err_video_regs:
> +	mgb4_regs_free(&mgbdev->video);
> +err_dma_chan:
> +	mgb4_dma_channel_free(mgbdev);
> +	free_xdma(mgbdev);
> +err_alloc_irq:
> +	pci_disable_msix(pdev);
> +err_enable_pci:
> +	pci_disable_device(pdev);
> +err_mgbdev:
> +	kfree(mgbdev);
> +
> +	return rv;
> +}
> +
> +static void mgb4_remove(struct pci_dev *pdev)
> +{
> +	struct mgb4_dev *mgbdev = pci_get_drvdata(pdev);
> +	int i;
> +
> +	if (mgbdev->indio_dev)
> +		mgb4_trigger_free(mgbdev->indio_dev);
> +
> +	for (i = 0; i < MGB4_VOUT_DEVICES; i++)
> +		if (mgbdev->vout[i])
> +			mgb4_vout_free(mgbdev->vout[i]);
> +	for (i = 0; i < MGB4_VIN_DEVICES; i++)
> +		if (mgbdev->vin[i])
> +			mgb4_vin_free(mgbdev->vin[i]);
> +
> +	free_sysfs(mgbdev->pdev);
> +	free_spi(mgbdev);
> +	free_i2c(mgbdev);
> +	mgb4_regs_free(&mgbdev->video);
> +	mgb4_regs_free(&mgbdev->cmt);
> +
> +	mgb4_dma_channel_free(mgbdev);
> +	free_xdma(mgbdev);
> +
> +	pci_disable_msix(mgbdev->pdev);
> +	pci_disable_device(mgbdev->pdev);
> +
> +	kfree(mgbdev);
> +}
> +
> +static const struct pci_device_id mgb4_pci_ids[] = {
> +	{ PCI_DEVICE(0x1ed8, 0x0101), },
> +	{ 0, }
> +};
> +MODULE_DEVICE_TABLE(pci, mgb4_pci_ids);
> +
> +static struct pci_driver mgb4_pci_driver = {
> +	.name = KBUILD_MODNAME,
> +	.id_table = mgb4_pci_ids,
> +	.probe = mgb4_probe,
> +	.remove = mgb4_remove,
> +};
> +
> +module_pci_driver(mgb4_pci_driver);
> +
> +MODULE_AUTHOR("Digiteq Automotive s.r.o.");
> +MODULE_DESCRIPTION("Digiteq Automotive MGB4 Driver");
> +MODULE_LICENSE("GPL");
> +MODULE_SOFTDEP("pre: platform:xiic-i2c platform:xilinx_spi spi-nor");
> diff --git a/drivers/media/pci/mgb4/mgb4_core.h b/drivers/media/pci/mgb4/mgb4_core.h
> new file mode 100644
> index 000000000000..9bd881c7e29d
> --- /dev/null
> +++ b/drivers/media/pci/mgb4/mgb4_core.h
> @@ -0,0 +1,65 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2021-2022 Digiteq Automotive
> + *     author: Martin Tuma <martin.tuma@digiteqautomotive.com>
> + */
> +
> +#ifndef __MGB4_CORE_H__
> +#define __MGB4_CORE_H__
> +
> +#include <linux/spi/flash.h>
> +#include <linux/mtd/partitions.h>
> +#include <linux/mutex.h>
> +#include <linux/dmaengine.h>
> +#include "mgb4_regs.h"
> +
> +#define MGB4_VIN_DEVICES  2
> +#define MGB4_VOUT_DEVICES 2
> +
> +#define MGB4_MGB4_BAR_ID  0
> +#define MGB4_XDMA_BAR_ID  1
> +
> +#define MGB4_IS_GMSL(mgbdev) \
> +	((mgbdev)->module_version >> 4 == 2)
> +#define MGB4_IS_FPDL3(mgbdev) \
> +	((mgbdev)->module_version >> 4 == 1)
> +
> +struct mgb4_dma_channel {
> +	struct dma_chan *chan;
> +	struct completion req_compl;
> +};
> +
> +struct mgb4_dev {
> +	struct pci_dev *pdev;
> +	struct platform_device *xdev;
> +	struct mgb4_vin_dev *vin[MGB4_VIN_DEVICES];
> +	struct mgb4_vout_dev *vout[MGB4_VOUT_DEVICES];
> +
> +	struct mgb4_dma_channel c2h_chan[MGB4_VIN_DEVICES];
> +	struct mgb4_dma_channel h2c_chan[MGB4_VOUT_DEVICES];
> +	struct dma_slave_map slave_map[MGB4_VIN_DEVICES + MGB4_VOUT_DEVICES];
> +
> +	struct mgb4_regs video;
> +	struct mgb4_regs cmt;
> +
> +	struct clk_hw *i2c_clk;
> +	struct clk_lookup *i2c_cl;
> +	struct platform_device *i2c_pdev;
> +	struct i2c_adapter *i2c_adap;
> +	struct mutex i2c_lock;
> +
> +	struct platform_device *spi_pdev;
> +	struct flash_platform_data flash_data;
> +	struct mtd_partition partitions[2];
> +	char flash_name[16];
> +	char fw_part_name[16];
> +	char data_part_name[16];
> +	char channel_names[MGB4_VIN_DEVICES + MGB4_VOUT_DEVICES][16];
> +
> +	struct iio_dev *indio_dev;
> +
> +	u8 module_version;
> +	u32 serial_number;
> +};
> +
> +#endif
> diff --git a/drivers/media/pci/mgb4/mgb4_dma.c b/drivers/media/pci/mgb4/mgb4_dma.c
> new file mode 100644
> index 000000000000..b8ca7587747e
> --- /dev/null
> +++ b/drivers/media/pci/mgb4/mgb4_dma.c
> @@ -0,0 +1,120 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2021-2022 Digiteq Automotive
> + *     author: Martin Tuma <martin.tuma@digiteqautomotive.com>
> + */
> +
> +#include <linux/pci.h>
> +#include <linux/dma-direction.h>
> +#include "mgb4_core.h"
> +#include "mgb4_dma.h"
> +
> +static void chan_irq(void *param)
> +{
> +	struct mgb4_dma_channel *chan = param;
> +
> +	complete(&chan->req_compl);
> +}
> +
> +int mgb4_dma_transfer(struct mgb4_dev *mgbdev, u32 channel, bool write,
> +		      u64 paddr, struct sg_table *sgt)
> +{
> +	struct dma_slave_config cfg;
> +	struct mgb4_dma_channel *chan;
> +	struct dma_async_tx_descriptor *tx;
> +	struct pci_dev *pdev = mgbdev->pdev;
> +	int ret;
> +
> +	memset(&cfg, 0, sizeof(cfg));
> +
> +	if (write) {
> +		cfg.direction = DMA_MEM_TO_DEV;
> +		cfg.dst_addr = paddr;
> +		cfg.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
> +		chan = &mgbdev->h2c_chan[channel];
> +	} else {
> +		cfg.direction = DMA_DEV_TO_MEM;
> +		cfg.src_addr = paddr;
> +		cfg.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
> +		chan = &mgbdev->c2h_chan[channel];
> +	}
> +
> +	ret = dmaengine_slave_config(chan->chan, &cfg);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to config dma: %d\n", ret);
> +		return ret;
> +	}
> +
> +	tx = dmaengine_prep_slave_sg(chan->chan, sgt->sgl, sgt->nents,
> +				     cfg.direction, 0);
> +	if (!tx) {
> +		dev_err(&pdev->dev, "failed to prep slave sg\n");
> +		return -EIO;
> +	}
> +
> +	tx->callback = chan_irq;
> +	tx->callback_param = chan;
> +
> +	ret = dma_submit_error(dmaengine_submit(tx));
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to submit sg\n");
> +		return -EIO;
> +	}
> +
> +	dma_async_issue_pending(chan->chan);
> +
> +	if (!wait_for_completion_timeout(&chan->req_compl,
> +					 msecs_to_jiffies(10000))) {
> +		dev_err(&pdev->dev, "dma timeout\n");
> +		dmaengine_terminate_sync(chan->chan);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +int mgb4_dma_channel_init(struct mgb4_dev *mgbdev)
> +{
> +	int i, ret;
> +	char name[16];
> +	struct pci_dev *pdev = mgbdev->pdev;
> +
> +	for (i = 0; i < MGB4_VIN_DEVICES; i++) {
> +		sprintf(name, "c2h%d", i);
> +		mgbdev->c2h_chan[i].chan = dma_request_chan(&pdev->dev, name);
> +		if (IS_ERR(mgbdev->c2h_chan[i].chan)) {
> +			dev_err(&pdev->dev, "failed to initialize %s", name);
> +			ret = PTR_ERR(mgbdev->c2h_chan[i].chan);
> +			mgbdev->c2h_chan[i].chan = NULL;
> +			return ret;
> +		}
> +		init_completion(&mgbdev->c2h_chan[i].req_compl);
> +	}
> +	for (i = 0; i < MGB4_VOUT_DEVICES; i++) {
> +		sprintf(name, "h2c%d", i);
> +		mgbdev->h2c_chan[i].chan = dma_request_chan(&pdev->dev, name);
> +		if (IS_ERR(mgbdev->h2c_chan[i].chan)) {
> +			dev_err(&pdev->dev, "failed to initialize %s", name);
> +			ret = PTR_ERR(mgbdev->h2c_chan[i].chan);
> +			mgbdev->h2c_chan[i].chan = NULL;
> +			return ret;
> +		}
> +		init_completion(&mgbdev->h2c_chan[i].req_compl);
> +	}
> +
> +	return 0;
> +}
> +
> +void mgb4_dma_channel_free(struct mgb4_dev *mgbdev)
> +{
> +	int i;
> +
> +	for (i = 0; i < MGB4_VIN_DEVICES; i++) {
> +		if (mgbdev->c2h_chan[i].chan)
> +			dma_release_channel(mgbdev->c2h_chan[i].chan);
> +	}
> +	for (i = 0; i < MGB4_VOUT_DEVICES; i++) {
> +		if (mgbdev->h2c_chan[i].chan)
> +			dma_release_channel(mgbdev->h2c_chan[i].chan);
> +	}
> +}
> diff --git a/drivers/media/pci/mgb4/mgb4_dma.h b/drivers/media/pci/mgb4/mgb4_dma.h
> new file mode 100644
> index 000000000000..443e2a11b055
> --- /dev/null
> +++ b/drivers/media/pci/mgb4/mgb4_dma.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2021-2022 Digiteq Automotive
> + *     author: Martin Tuma <martin.tuma@digiteqautomotive.com>
> + */
> +
> +#ifndef __MGB4_DMA_H__
> +#define __MGB4_DMA_H__
> +
> +#include "mgb4_core.h"
> +
> +extern int mgb4_dma_channel_init(struct mgb4_dev *mgbdev);
> +extern void mgb4_dma_channel_free(struct mgb4_dev *mgbdev);
> +
> +extern int mgb4_dma_transfer(struct mgb4_dev *mgbdev, u32 channel, bool write,
> +			     u64 paddr, struct sg_table *sgt);
> +
> +#endif
> diff --git a/drivers/media/pci/mgb4/mgb4_i2c.c b/drivers/media/pci/mgb4/mgb4_i2c.c
> new file mode 100644
> index 000000000000..536dc34b7f82
> --- /dev/null
> +++ b/drivers/media/pci/mgb4/mgb4_i2c.c
> @@ -0,0 +1,139 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2021-2022 Digiteq Automotive
> + *     author: Martin Tuma <martin.tuma@digiteqautomotive.com>
> + */
> +
> +#include <linux/version.h>
> +#include "mgb4_i2c.h"
> +
> +static int read_r16(struct i2c_client *client, u16 reg, u8 *val, int len)
> +{
> +	int ret;
> +	u8 buf[2];
> +	struct i2c_msg msg[2] = {
> +		{
> +			.addr = client->addr,
> +			.flags = 0,
> +			.len = 2,
> +			.buf = buf,
> +		}, {
> +			.addr = client->addr,
> +			.flags = I2C_M_RD,
> +			.len = len,
> +			.buf = val,
> +		}
> +	};
> +
> +	buf[0] = (reg >> 8) & 0xff;
> +	buf[1] = (reg >> 0) & 0xff;
> +
> +	ret = i2c_transfer(client->adapter, msg, 2);
> +	if (ret < 0)
> +		return ret;
> +	else if (ret != 2)
> +		return -EREMOTEIO;
> +	else
> +		return 0;
> +}
> +
> +static int write_r16(struct i2c_client *client, u16 reg, const u8 *val, int len)
> +{
> +	int ret;
> +	u8 buf[4];
> +	struct i2c_msg msg[1] = {
> +		{
> +			.addr = client->addr,
> +			.flags = 0,
> +			.len = 2 + len,
> +			.buf = buf,
> +		}
> +	};
> +
> +	if (2 + len > sizeof(buf))
> +		return -EINVAL;
> +
> +	buf[0] = (reg >> 8) & 0xff;
> +	buf[1] = (reg >> 0) & 0xff;
> +	memcpy(&buf[2], val, len);
> +
> +	ret = i2c_transfer(client->adapter, msg, 1);
> +	if (ret < 0)
> +		return ret;
> +	else if (ret != 1)
> +		return -EREMOTEIO;
> +	else
> +		return 0;
> +}
> +
> +
> +int mgb4_i2c_init(struct mgb4_i2c_client *client, struct i2c_adapter *adap,
> +		  struct i2c_board_info const *info, int addr_size)
> +{
> +	client->client = i2c_new_client_device(adap, info);
> +	if (IS_ERR(client->client))
> +		return PTR_ERR(client->client);
> +
> +	client->addr_size = addr_size;
> +
> +	return 0;
> +}
> +
> +void mgb4_i2c_free(struct mgb4_i2c_client *client)
> +{
> +	i2c_unregister_device(client->client);
> +}
> +
> +
> +s32 mgb4_i2c_read_byte(struct mgb4_i2c_client *client, u16 reg)
> +{
> +	int ret;
> +	u8 b;
> +
> +	if (client->addr_size == 8)
> +		return i2c_smbus_read_byte_data(client->client, reg);
> +
> +	ret = read_r16(client->client, reg, &b, 1);
> +	if (ret < 0)
> +		return ret;
> +
> +	return (s32)b;
> +}
> +
> +s32 mgb4_i2c_write_byte(struct mgb4_i2c_client *client, u16 reg, u8 val)
> +{
> +	if (client->addr_size == 8)
> +		return i2c_smbus_write_byte_data(client->client, reg, val);
> +	else
> +		return write_r16(client->client, reg, &val, 1);
> +}
> +
> +s32 mgb4_i2c_mask_byte(struct mgb4_i2c_client *client, u16 reg, u8 mask, u8 val)
> +{
> +	s32 ret;
> +
> +	if (mask != 0xFF) {
> +		ret = mgb4_i2c_read_byte(client, reg);
> +		if (ret < 0)
> +			return ret;
> +		val |= (u8)ret & ~mask;
> +	}
> +
> +	return mgb4_i2c_write_byte(client, reg, val);
> +}
> +
> +int mgb4_i2c_configure(struct mgb4_i2c_client *client,
> +		       const struct mgb4_i2c_kv *values, size_t count)
> +{
> +	size_t i;
> +	s32 res;
> +
> +	for (i = 0; i < count; i++) {
> +		res = mgb4_i2c_mask_byte(client, values[i].reg, values[i].mask,
> +		  values[i].val);
> +		if (res < 0)
> +			return res;
> +	}
> +
> +	return 0;
> +}
> diff --git a/drivers/media/pci/mgb4/mgb4_i2c.h b/drivers/media/pci/mgb4/mgb4_i2c.h
> new file mode 100644
> index 000000000000..e5003927509f
> --- /dev/null
> +++ b/drivers/media/pci/mgb4/mgb4_i2c.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2021-2022 Digiteq Automotive
> + *     author: Martin Tuma <martin.tuma@digiteqautomotive.com>
> + */
> +
> +#ifndef __MGB4_I2C_H__
> +#define __MGB4_I2C_H__
> +
> +#include <linux/i2c.h>
> +
> +struct mgb4_i2c_client {
> +	struct i2c_client *client;
> +	int addr_size;
> +};
> +
> +struct mgb4_i2c_kv {
> +	u16 reg;
> +	u8 mask;
> +	u8 val;
> +};
> +
> +extern int mgb4_i2c_init(struct mgb4_i2c_client *client, struct i2c_adapter *adap,
> +			 struct i2c_board_info const *info, int addr_size);
> +extern void mgb4_i2c_free(struct mgb4_i2c_client *client);
> +
> +extern s32 mgb4_i2c_read_byte(struct mgb4_i2c_client *client, u16 reg);
> +extern s32 mgb4_i2c_write_byte(struct mgb4_i2c_client *client, u16 reg, u8 val);
> +extern s32 mgb4_i2c_mask_byte(struct mgb4_i2c_client *client, u16 reg, u8 mask,
> +			      u8 val);
> +
> +extern int mgb4_i2c_configure(struct mgb4_i2c_client *client,
> +			      const struct mgb4_i2c_kv *values, size_t count);
> +
> +#endif
> diff --git a/drivers/media/pci/mgb4/mgb4_io.h b/drivers/media/pci/mgb4/mgb4_io.h
> new file mode 100644
> index 000000000000..dff92065f2c0
> --- /dev/null
> +++ b/drivers/media/pci/mgb4/mgb4_io.h
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2021-2022 Digiteq Automotive
> + *     author: Martin Tuma <martin.tuma@digiteqautomotive.com>
> + */
> +
> +#ifndef __MGB4_IO_H__
> +#define __MGB4_IO_H__
> +
> +#include <media/v4l2-dev.h>
> +
> +#ifndef VFL_TYPE_GRABBER
> +#define VFL_TYPE_GRABBER VFL_TYPE_VIDEO
> +#endif
> +
> +#define ERR_NO_REG        0xFFFFFFFE
> +#define ERR_QUEUE_TIMEOUT 0xFFFFFFFD
> +#define ERR_QUEUE_EMPTY   0xFFFFFFFC
> +#define ERR_QUEUE_FULL    0xFFFFFFFB
> +
> +#define BYTESPERLINE(width, alignment) \
> +	(((((width) * 4) - 1) | ((alignment) - 1)) + 1)
> +#define PADDING(width, alignment) \
> +	((BYTESPERLINE((width), (alignment)) - ((width) * 4)) / 4)
> +
> +struct frame_buffer {
> +	struct vb2_v4l2_buffer vb;
> +	struct list_head list;
> +};
> +
> +extern inline struct frame_buffer *to_frame_buffer(struct vb2_v4l2_buffer *vbuf)
> +{
> +	return container_of(vbuf, struct frame_buffer, vb);
> +}
> +
> +#endif
> diff --git a/drivers/media/pci/mgb4/mgb4_regs.c b/drivers/media/pci/mgb4/mgb4_regs.c
> new file mode 100644
> index 000000000000..53d4e4503a74
> --- /dev/null
> +++ b/drivers/media/pci/mgb4/mgb4_regs.c
> @@ -0,0 +1,30 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2021-2022 Digiteq Automotive
> + *     author: Martin Tuma <martin.tuma@digiteqautomotive.com>
> + */
> +
> +#include <linux/ioport.h>
> +#include "mgb4_regs.h"
> +
> +int mgb4_regs_map(struct resource *res, struct mgb4_regs *regs)
> +{
> +	regs->mapbase = res->start;
> +	regs->mapsize = res->end - res->start;
> +
> +	if (!request_mem_region(regs->mapbase, regs->mapsize, res->name))
> +		return -EINVAL;
> +	regs->membase = ioremap(regs->mapbase, regs->mapsize);
> +	if (!regs->membase) {
> +		release_mem_region(regs->mapbase, regs->mapsize);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +void mgb4_regs_free(struct mgb4_regs *regs)
> +{
> +	iounmap(regs->membase);
> +	release_mem_region(regs->mapbase, regs->mapsize);
> +}
> diff --git a/drivers/media/pci/mgb4/mgb4_regs.h b/drivers/media/pci/mgb4/mgb4_regs.h
> new file mode 100644
> index 000000000000..1cc16941ea45
> --- /dev/null
> +++ b/drivers/media/pci/mgb4/mgb4_regs.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2021-2022 Digiteq Automotive
> + *     author: Martin Tuma <martin.tuma@digiteqautomotive.com>
> + */
> +
> +#ifndef __MGB4_REGS_H__
> +#define __MGB4_REGS_H__
> +
> +#include <linux/io.h>
> +
> +struct mgb4_regs {
> +	resource_size_t mapbase;
> +	resource_size_t mapsize;
> +	void __iomem *membase;
> +};
> +
> +#define mgb4_write_reg(regs, offset, val) \
> +	iowrite32(val, (regs)->membase + (offset))
> +#define  mgb4_read_reg(regs, offset) \
> +	ioread32((regs)->membase + (offset))
> +
> +static inline void mgb4_mask_reg(struct mgb4_regs *regs, u32 reg, u32 mask,
> +				 u32 val)
> +{
> +	u32 ret = mgb4_read_reg(regs, reg);
> +
> +	val |= ret & ~mask;
> +	mgb4_write_reg(regs, reg, val);
> +}
> +
> +extern int mgb4_regs_map(struct resource *res, struct mgb4_regs *regs);
> +extern void mgb4_regs_free(struct mgb4_regs *regs);
> +
> +#endif
> diff --git a/drivers/media/pci/mgb4/mgb4_sysfs.h b/drivers/media/pci/mgb4/mgb4_sysfs.h
> new file mode 100644
> index 000000000000..2b42a8ba37f7
> --- /dev/null
> +++ b/drivers/media/pci/mgb4/mgb4_sysfs.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2021-2022 Digiteq Automotive
> + *     author: Martin Tuma <martin.tuma@digiteqautomotive.com>
> + */
> +
> +#ifndef __MGB4_SYSFS_H__
> +#define __MGB4_SYSFS_H__
> +
> +#include <linux/sysfs.h>
> +
> +extern struct device_attribute *mgb4_pci_attrs[];
> +extern struct device_attribute *mgb4_fpdl3_in_attrs[];
> +extern struct device_attribute *mgb4_gmsl_in_attrs[];
> +extern struct device_attribute *mgb4_fpdl3_out_attrs[];
> +extern struct device_attribute *mgb4_gmsl_out_attrs[];
> +
> +#endif
> diff --git a/drivers/media/pci/mgb4/mgb4_sysfs_in.c b/drivers/media/pci/mgb4/mgb4_sysfs_in.c
> new file mode 100644
> index 000000000000..fc024393c7ba
> --- /dev/null
> +++ b/drivers/media/pci/mgb4/mgb4_sysfs_in.c
> @@ -0,0 +1,750 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2021-2022 Digiteq Automotive
> + *     author: Martin Tuma <martin.tuma@digiteqautomotive.com>
> + */
> +
> +#include <linux/device.h>
> +#include "mgb4_core.h"
> +#include "mgb4_i2c.h"
> +#include "mgb4_vin.h"
> +#include "mgb4_cmt.h"
> +#include "mgb4_sysfs.h"
> +
> +/* Common for both FPDL3 and GMSL */
> +
> +static ssize_t read_input_id(struct device *dev,
> +			     struct device_attribute *attr, char *buf)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vin_dev *vindev = video_get_drvdata(vdev);
> +
> +	return sprintf(buf, "%d\n", vindev->config->id);
> +}
> +
> +static ssize_t read_oldi_lane_width(struct device *dev,
> +				    struct device_attribute *attr, char *buf)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vin_dev *vindev = video_get_drvdata(vdev);
> +	u16 i2c_reg;
> +	u8 i2c_mask, i2c_single_val, i2c_dual_val;
> +	u32 config;
> +	int ret;
> +
> +	i2c_reg = MGB4_IS_GMSL(vindev->mgbdev) ? 0x1CE : 0x49;
> +	i2c_mask = MGB4_IS_GMSL(vindev->mgbdev) ? 0x0E : 0x03;
> +	i2c_single_val = MGB4_IS_GMSL(vindev->mgbdev) ? 0x00 : 0x02;
> +	i2c_dual_val = MGB4_IS_GMSL(vindev->mgbdev) ? 0x0E : 0x00;
> +
> +	mutex_lock(&vindev->mgbdev->i2c_lock);
> +	ret = mgb4_i2c_read_byte(&vindev->deser, i2c_reg);
> +	mutex_unlock(&vindev->mgbdev->i2c_lock);
> +	if (ret < 0)
> +		return -EIO;
> +
> +	config = mgb4_read_reg(&vindev->mgbdev->video, vindev->config->regs.config);
> +
> +	if (((config & (1U<<9)) && ((ret & i2c_mask) != i2c_dual_val))
> +	  || (!(config & (1U<<9)) && ((ret & i2c_mask) != i2c_single_val))) {
> +		dev_err(dev, "I2C/FPGA register value mismatch\n");
> +		return -EINVAL;
> +	}
> +
> +	return sprintf(buf, "%s\n", config & (1U<<9) ? "1" : "0");
> +}
> +
> +static ssize_t write_oldi_lane_width(struct device *dev,
> +				     struct device_attribute *attr,
> +				     const char *buf, size_t count)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vin_dev *vindev = video_get_drvdata(vdev);
> +	u32 fpga_data;
> +	u16 i2c_reg;
> +	u8 i2c_mask, i2c_data;
> +	unsigned long val;
> +	int ret;
> +
> +	ret = kstrtoul(buf, 10, &val);
> +	if (ret)
> +		return ret;
> +
> +	switch (val) {
> +	case 0: /* single */
> +		fpga_data = 0;
> +		i2c_data = MGB4_IS_GMSL(vindev->mgbdev) ? 0x00 : 0x02;
> +		break;
> +	case 1: /* dual */
> +		fpga_data = 1U<<9;
> +		i2c_data = MGB4_IS_GMSL(vindev->mgbdev) ? 0x0E : 0x00;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	i2c_reg = MGB4_IS_GMSL(vindev->mgbdev) ? 0x1CE : 0x49;
> +	i2c_mask = MGB4_IS_GMSL(vindev->mgbdev) ? 0x0E : 0x03;
> +
> +	mutex_lock(&vindev->mgbdev->i2c_lock);
> +	ret = mgb4_i2c_mask_byte(&vindev->deser, i2c_reg, i2c_mask, i2c_data);
> +	mutex_unlock(&vindev->mgbdev->i2c_lock);
> +	if (ret < 0)
> +		return -EIO;
> +	mgb4_mask_reg(&vindev->mgbdev->video, vindev->config->regs.config, 1U<<9,
> +	  fpga_data);
> +	if (MGB4_IS_GMSL(vindev->mgbdev)) {
> +		/* reset input link */
> +		mutex_lock(&vindev->mgbdev->i2c_lock);
> +		ret = mgb4_i2c_mask_byte(&vindev->deser, 0x10, 1U<<5, 1U<<5);
> +		mutex_unlock(&vindev->mgbdev->i2c_lock);
> +		if (ret < 0)
> +			return -EIO;
> +	}
> +
> +	return count;
> +}
> +
> +static ssize_t read_color_mapping(struct device *dev,
> +				  struct device_attribute *attr, char *buf)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vin_dev *vindev = video_get_drvdata(vdev);
> +	u32 config = mgb4_read_reg(&vindev->mgbdev->video,
> +	  vindev->config->regs.config);
> +
> +	return sprintf(buf, "%s\n", config & (1U<<8) ? "0" : "1");
> +}
> +
> +static ssize_t write_color_mapping(struct device *dev,
> +				   struct device_attribute *attr,
> +				   const char *buf, size_t count)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vin_dev *vindev = video_get_drvdata(vdev);
> +	u32 fpga_data;
> +	unsigned long val;
> +	int ret;
> +
> +	ret = kstrtoul(buf, 10, &val);
> +	if (ret)
> +		return ret;
> +
> +	switch (val) {
> +	case 0: /* OLDI/JEIDA */
> +		fpga_data = (1U<<8);
> +		break;
> +	case 1: /* SPWG/VESA */
> +		fpga_data = 0;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	mgb4_mask_reg(&vindev->mgbdev->video, vindev->config->regs.config, 1U<<8,
> +	  fpga_data);
> +
> +	return count;
> +}
> +
> +static ssize_t read_link_status(struct device *dev, struct device_attribute *attr,
> +				char *buf)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vin_dev *vindev = video_get_drvdata(vdev);
> +	u32 status = mgb4_read_reg(&vindev->mgbdev->video, vindev->config->regs.status);
> +
> +	return sprintf(buf, "%s\n", status & (1U<<2) ? "1" : "0");
> +}
> +
> +static ssize_t read_stream_status(struct device *dev, struct device_attribute *attr,
> +				  char *buf)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vin_dev *vindev = video_get_drvdata(vdev);
> +	u32 status = mgb4_read_reg(&vindev->mgbdev->video, vindev->config->regs.status);
> +
> +	return sprintf(buf, "%s\n", ((status & (1<<14)) && (status & (1<<2))
> +	  && (status & (3<<9))) ? "1" : "0");
> +}
> +
> +static ssize_t read_hsync_status(struct device *dev, struct device_attribute *attr,
> +				 char *buf)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vin_dev *vindev = video_get_drvdata(vdev);
> +	u32 status = mgb4_read_reg(&vindev->mgbdev->video, vindev->config->regs.status);
> +	u32 res;
> +
> +	if (!(status & (1U<<11)))
> +		res = 0x02; // not available
> +	else if (status & (1U<<12))
> +		res = 0x01; // active high
> +	else
> +		res = 0x00; // active low
> +
> +	return sprintf(buf, "%u\n", res);
> +}
> +
> +static ssize_t read_vsync_status(struct device *dev, struct device_attribute *attr,
> +				 char *buf)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vin_dev *vindev = video_get_drvdata(vdev);
> +	u32 status = mgb4_read_reg(&vindev->mgbdev->video, vindev->config->regs.status);
> +	u32 res;
> +
> +	if (!(status & (1U<<11)))
> +		res = 0x02; // not available
> +	else if (status & (1U<<13))
> +		res = 0x01; // active high
> +	else
> +		res = 0x00; // active low
> +
> +	return sprintf(buf, "%u\n", res);
> +}
> +
> +static ssize_t read_hsync_gap(struct device *dev, struct device_attribute *attr,
> +			      char *buf)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vin_dev *vindev = video_get_drvdata(vdev);
> +	u32 sync = mgb4_read_reg(&vindev->mgbdev->video, vindev->config->regs.sync);
> +
> +	return sprintf(buf, "%u\n", sync >> 16);
> +}
> +
> +static ssize_t write_hsync_gap(struct device *dev,
> +			       struct device_attribute *attr, const char *buf,
> +			       size_t count)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vin_dev *vindev = video_get_drvdata(vdev);
> +	unsigned long val;
> +	int ret;
> +
> +	ret = kstrtoul(buf, 10, &val);
> +	if (ret)
> +		return ret;
> +	if (val > 0xFFFF)
> +		return -EINVAL;
> +
> +	mgb4_mask_reg(&vindev->mgbdev->video, vindev->config->regs.sync, 0xFFFF0000,
> +	  val << 16);
> +
> +	return count;
> +}
> +
> +static ssize_t read_vsync_gap(struct device *dev, struct device_attribute *attr,
> +			      char *buf)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vin_dev *vindev = video_get_drvdata(vdev);
> +	u32 sync = mgb4_read_reg(&vindev->mgbdev->video, vindev->config->regs.sync);
> +
> +	return sprintf(buf, "%u\n", sync & 0xFFFF);
> +}
> +
> +static ssize_t write_vsync_gap(struct device *dev,
> +			       struct device_attribute *attr, const char *buf,
> +			       size_t count)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vin_dev *vindev = video_get_drvdata(vdev);
> +	unsigned long val;
> +	int ret;
> +
> +	ret = kstrtoul(buf, 10, &val);
> +	if (ret)
> +		return ret;
> +	if (val > 0xFFFF)
> +		return -EINVAL;
> +
> +	mgb4_mask_reg(&vindev->mgbdev->video, vindev->config->regs.sync, 0xFFFF, val);
> +
> +	return count;
> +}
> +
> +static ssize_t read_pclk_frequency(struct device *dev,
> +				   struct device_attribute *attr, char *buf)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vin_dev *vindev = video_get_drvdata(vdev);
> +	u32 freq = mgb4_read_reg(&vindev->mgbdev->video, vindev->config->regs.pclk);
> +
> +	return sprintf(buf, "%u\n", freq);
> +}
> +
> +static ssize_t read_hsync_width(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vin_dev *vindev = video_get_drvdata(vdev);
> +	u32 sig = mgb4_read_reg(&vindev->mgbdev->video, vindev->config->regs.signal);
> +
> +	return sprintf(buf, "%u\n", (sig & 0x00FF0000) >> 16);
> +}
> +
> +static ssize_t read_vsync_width(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vin_dev *vindev = video_get_drvdata(vdev);
> +	u32 sig = mgb4_read_reg(&vindev->mgbdev->video, vindev->config->regs.signal2);
> +
> +	return sprintf(buf, "%u\n", (sig & 0x00FF0000) >> 16);
> +}
> +
> +static ssize_t read_hback_porch(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vin_dev *vindev = video_get_drvdata(vdev);
> +	u32 sig = mgb4_read_reg(&vindev->mgbdev->video, vindev->config->regs.signal);
> +
> +	return sprintf(buf, "%u\n", (sig & 0x0000FF00) >> 8);
> +}
> +
> +static ssize_t read_hfront_porch(struct device *dev,
> +				 struct device_attribute *attr, char *buf)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vin_dev *vindev = video_get_drvdata(vdev);
> +	u32 sig = mgb4_read_reg(&vindev->mgbdev->video, vindev->config->regs.signal);
> +
> +	return sprintf(buf, "%u\n", (sig & 0x000000FF));
> +}
> +
> +static ssize_t read_vback_porch(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vin_dev *vindev = video_get_drvdata(vdev);
> +	u32 sig = mgb4_read_reg(&vindev->mgbdev->video, vindev->config->regs.signal2);
> +
> +	return sprintf(buf, "%u\n", (sig & 0x0000FF00) >> 8);
> +}
> +
> +static ssize_t read_vfront_porch(struct device *dev,
> +				 struct device_attribute *attr, char *buf)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vin_dev *vindev = video_get_drvdata(vdev);
> +	u32 sig = mgb4_read_reg(&vindev->mgbdev->video, vindev->config->regs.signal2);
> +
> +	return sprintf(buf, "%u\n", (sig & 0x000000FF));
> +}
> +
> +static ssize_t read_frequency_range(struct device *dev,
> +				    struct device_attribute *attr, char *buf)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vin_dev *vindev = video_get_drvdata(vdev);
> +
> +	return sprintf(buf, "%d\n", vindev->freq_range);
> +}
> +
> +static ssize_t write_frequency_range(struct device *dev,
> +				     struct device_attribute *attr,
> +				     const char *buf, size_t count)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vin_dev *vindev = video_get_drvdata(vdev);
> +	unsigned long val, flags;
> +	int ret;
> +
> +	ret = kstrtoul(buf, 10, &val);
> +	if (ret)
> +		return ret;
> +	if (val > 1)
> +		return -EINVAL;
> +
> +	spin_lock_irqsave(&(vindev->vdev.fh_lock), flags);
> +	if (!list_empty(&(vindev->vdev.fh_list))) {
> +		spin_unlock_irqrestore(&(vindev->vdev.fh_lock), flags);
> +		return -EBUSY;
> +	}
> +
> +	mgb4_cmt_set_vin(vindev, val);
> +	vindev->freq_range = val;
> +
> +	spin_unlock_irqrestore(&(vindev->vdev.fh_lock), flags);
> +
> +	return count;
> +}
> +
> +static ssize_t read_alignment(struct device *dev,
> +			      struct device_attribute *attr, char *buf)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vin_dev *vindev = video_get_drvdata(vdev);
> +
> +	return sprintf(buf, "%d\n", vindev->alignment);
> +}
> +
> +static ssize_t write_alignment(struct device *dev,
> +			       struct device_attribute *attr, const char *buf,
> +			       size_t count)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vin_dev *vindev = video_get_drvdata(vdev);
> +	unsigned long val, flags;
> +	int ret;
> +
> +	ret = kstrtoul(buf, 10, &val);
> +	if (ret)
> +		return ret;
> +	if (!val || (val & (val - 1)))
> +		return -EINVAL;
> +
> +	spin_lock_irqsave(&(vindev->vdev.fh_lock), flags);
> +	if (!list_empty(&(vindev->vdev.fh_list))) {
> +		spin_unlock_irqrestore(&(vindev->vdev.fh_lock), flags);
> +		return -EBUSY;
> +	}
> +
> +	vindev->alignment = val;
> +
> +	spin_unlock_irqrestore(&(vindev->vdev.fh_lock), flags);
> +
> +	return count;
> +}
> +
> +/* FPDL3 only */
> +
> +static ssize_t read_fpdl3_input_width(struct device *dev,
> +				      struct device_attribute *attr, char *buf)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vin_dev *vindev = video_get_drvdata(vdev);
> +	s32 ret;
> +
> +	mutex_lock(&vindev->mgbdev->i2c_lock);
> +	ret = mgb4_i2c_read_byte(&vindev->deser, 0x34);
> +	mutex_unlock(&vindev->mgbdev->i2c_lock);
> +	if (ret < 0)
> +		return -EIO;
> +
> +	switch ((u8)ret & 0x18) {
> +	case 0:
> +		return sprintf(buf, "0\n");
> +	case 0x10:
> +		return sprintf(buf, "1\n");
> +	case 0x08:
> +		return sprintf(buf, "2\n");
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static ssize_t write_fpdl3_input_width(struct device *dev,
> +				       struct device_attribute *attr,
> +				       const char *buf, size_t count)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vin_dev *vindev = video_get_drvdata(vdev);
> +	u8 i2c_data;
> +	unsigned long val;
> +	int ret;
> +
> +	ret = kstrtoul(buf, 10, &val);
> +	if (ret)
> +		return ret;
> +
> +	switch (val) {
> +	case 0: /* auto */
> +		i2c_data = 0x00;
> +		break;
> +	case 1: /* single */
> +		i2c_data = 0x10;
> +		break;
> +	case 2: /* dual */
> +		i2c_data = 0x08;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	mutex_lock(&vindev->mgbdev->i2c_lock);
> +	ret = mgb4_i2c_mask_byte(&vindev->deser, 0x34, 0x18, i2c_data);
> +	mutex_unlock(&vindev->mgbdev->i2c_lock);
> +	if (ret < 0)
> +		return -EIO;
> +
> +	return count;
> +}
> +
> +
> +/* GMSL only */
> +
> +static ssize_t read_gmsl_mode(struct device *dev,
> +			      struct device_attribute *attr, char *buf)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vin_dev *vindev = video_get_drvdata(vdev);
> +	s32 r1, r300, r3;
> +
> +	mutex_lock(&vindev->mgbdev->i2c_lock);
> +	r1 = mgb4_i2c_read_byte(&vindev->deser, 0x01);
> +	r300 = mgb4_i2c_read_byte(&vindev->deser, 0x300);
> +	r3 = mgb4_i2c_read_byte(&vindev->deser, 0x03);
> +	mutex_unlock(&vindev->mgbdev->i2c_lock);
> +	if (r1 < 0 || r300 < 0 || r3 < 0)
> +		return -EIO;
> +
> +	if ((r1 & 0x03) == 0x03 && (r300 & 0x0C) == 0x0C && (r3 & 0xC0) == 0xC0)
> +		return sprintf(buf, "0\n");
> +	else if ((r1 & 0x03) == 0x02 && (r300 & 0x0C) == 0x08 && (r3 & 0xC0) == 0x00)
> +		return sprintf(buf, "1\n");
> +	else if ((r1 & 0x03) == 0x01 && (r300 & 0x0C) == 0x04 && (r3 & 0xC0) == 0x00)
> +		return sprintf(buf, "2\n");
> +	else if ((r1 & 0x03) == 0x00 && (r300 & 0x0C) == 0x00 && (r3 & 0xC0) == 0x00)
> +		return sprintf(buf, "3\n");
> +	else
> +		return -EINVAL;
> +}
> +
> +static ssize_t write_gmsl_mode(struct device *dev,
> +			       struct device_attribute *attr, const char *buf,
> +			       size_t count)
> +{
> +	static const struct mgb4_i2c_kv G12[] = {
> +		{0x01, 0x03, 0x03}, {0x300, 0x0C, 0x0C}, {0x03, 0xC0, 0xC0}};
> +	static const struct mgb4_i2c_kv G6[] = {
> +		{0x01, 0x03, 0x02}, {0x300, 0x0C, 0x08}, {0x03, 0xC0, 0x00}};
> +	static const struct mgb4_i2c_kv G3[] = {
> +		{0x01, 0x03, 0x01}, {0x300, 0x0C, 0x04}, {0x03, 0xC0, 0x00}};
> +	static const struct mgb4_i2c_kv G1[] = {
> +		{0x01, 0x03, 0x00}, {0x300, 0x0C, 0x00}, {0x03, 0xC0, 0x00}};
> +	static const struct mgb4_i2c_kv reset[] = {
> +		{0x10, 1U<<5, 1U<<5}, {0x300, 1U<<6, 1U<<6}};
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vin_dev *vindev = video_get_drvdata(vdev);
> +	const struct mgb4_i2c_kv *values;
> +	unsigned long val;
> +	int ret;
> +
> +	ret = kstrtoul(buf, 10, &val);
> +	if (ret)
> +		return ret;
> +
> +	switch (val) {
> +	case 0: /* 12Gb/s */
> +		values = G12;
> +		break;
> +	case 1: /* 6Gb/s */
> +		values = G6;
> +		break;
> +	case 2: /* 3Gb/s */
> +		values = G3;
> +		break;
> +	case 3: /* 1.5Gb/s */
> +		values = G1;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	mutex_lock(&vindev->mgbdev->i2c_lock);
> +	ret = mgb4_i2c_configure(&vindev->deser, values, 3);
> +	ret |= mgb4_i2c_configure(&vindev->deser, reset, 2);
> +	mutex_unlock(&vindev->mgbdev->i2c_lock);
> +	if (ret < 0)
> +		return -EIO;
> +
> +	return count;
> +}
> +
> +static ssize_t read_gmsl_stream_id(struct device *dev,
> +				   struct device_attribute *attr, char *buf)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vin_dev *vindev = video_get_drvdata(vdev);
> +	s32 ret;
> +
> +	mutex_lock(&vindev->mgbdev->i2c_lock);
> +	ret = mgb4_i2c_read_byte(&vindev->deser, 0xA0);
> +	mutex_unlock(&vindev->mgbdev->i2c_lock);
> +	if (ret < 0)
> +		return -EIO;
> +
> +	return sprintf(buf, "%d\n", ret & 0x03);
> +}
> +
> +static ssize_t write_gmsl_stream_id(struct device *dev,
> +				    struct device_attribute *attr,
> +				    const char *buf, size_t count)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vin_dev *vindev = video_get_drvdata(vdev);
> +	unsigned long val, flags;
> +	int ret;
> +
> +	ret = kstrtoul(buf, 10, &val);
> +	if (ret)
> +		return ret;
> +	if (val > 3)
> +		return -EINVAL;
> +
> +	spin_lock_irqsave(&(vindev->vdev.fh_lock), flags);
> +	ret = list_empty(&(vindev->vdev.fh_list));
> +	spin_unlock_irqrestore(&(vindev->vdev.fh_lock), flags);
> +	if (!ret)
> +		return -EBUSY;
> +
> +	/* Formaly, there is a race condition here as the change should be formaly
> +	 * done under the spinlock, but we only want to prevent a resolution change
> +	 * where possible. However, resolution changes can happen anyway and the
> +	 * driver can handle them (they only break the image, not the system).
> +	 *
> +	 * So instead of trying to workaround the spinlock - mgb4_i2c_mask_byte()
> +	 * does sleep - we simply let the rare race condition happen...
> +	 */
> +	mutex_lock(&vindev->mgbdev->i2c_lock);
> +	ret = mgb4_i2c_mask_byte(&vindev->deser, 0xA0, 0x03, (u8)val);
> +	mutex_unlock(&vindev->mgbdev->i2c_lock);
> +	if (ret < 0)
> +		return -EIO;
> +
> +	return count;
> +}
> +
> +static ssize_t read_gmsl_fec(struct device *dev, struct device_attribute *attr,
> +			     char *buf)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vin_dev *vindev = video_get_drvdata(vdev);
> +	s32 r3e0, r308;
> +
> +	mutex_lock(&vindev->mgbdev->i2c_lock);
> +	r3e0 = mgb4_i2c_read_byte(&vindev->deser, 0x3E0);
> +	r308 = mgb4_i2c_read_byte(&vindev->deser, 0x308);
> +	mutex_unlock(&vindev->mgbdev->i2c_lock);
> +	if (r3e0 < 0 || r308 < 0)
> +		return -EIO;
> +
> +	if ((r3e0 & 0x07) == 0x00 && (r308 & 0x01) == 0x00)
> +		return sprintf(buf, "0\n");
> +	else if ((r3e0 & 0x07) == 0x07 && (r308 & 0x01) == 0x01)
> +		return sprintf(buf, "1\n");
> +	else
> +		return -EINVAL;
> +}
> +
> +static ssize_t write_gmsl_fec(struct device *dev, struct device_attribute *attr,
> +			      const char *buf, size_t count)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vin_dev *vindev = video_get_drvdata(vdev);
> +	static const struct mgb4_i2c_kv enable[] = {
> +		{0x3E0, 0x07, 0x07}, {0x308, 0x01, 0x01}};
> +	static const struct mgb4_i2c_kv disable[] = {
> +		{0x3E0, 0x07, 0x00}, {0x308, 0x01, 0x00}};
> +	static const struct mgb4_i2c_kv reset[] = {
> +		{0x10, 1U<<5, 1U<<5}, {0x300, 1U<<6, 1U<<6}};
> +	const struct mgb4_i2c_kv *values;
> +	unsigned long val;
> +	int ret;
> +
> +	ret = kstrtoul(buf, 10, &val);
> +	if (ret)
> +		return ret;
> +
> +	switch (val) {
> +	case 0: /* disabled */
> +		values = disable;
> +		break;
> +	case 1: /* enabled */
> +		values = enable;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	mutex_lock(&vindev->mgbdev->i2c_lock);
> +	ret = mgb4_i2c_configure(&vindev->deser, values, 2);
> +	ret |= mgb4_i2c_configure(&vindev->deser, reset, 2);
> +	mutex_unlock(&vindev->mgbdev->i2c_lock);
> +	if (ret < 0)
> +		return -EIO;
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR(input_id, 0444, read_input_id, NULL);
> +static DEVICE_ATTR(oldi_lane_width, 0644, read_oldi_lane_width,
> +		   write_oldi_lane_width);
> +static DEVICE_ATTR(color_mapping, 0644, read_color_mapping,
> +		   write_color_mapping);
> +static DEVICE_ATTR(link_status, 0444, read_link_status, NULL);
> +static DEVICE_ATTR(stream_status, 0444, read_stream_status, NULL);
> +static DEVICE_ATTR(hsync_status, 0444, read_hsync_status, NULL);
> +static DEVICE_ATTR(vsync_status, 0444, read_vsync_status, NULL);
> +static DEVICE_ATTR(hsync_gap_length, 0644, read_hsync_gap, write_hsync_gap);
> +static DEVICE_ATTR(vsync_gap_length, 0644, read_vsync_gap, write_vsync_gap);
> +static DEVICE_ATTR(pclk_frequency, 0444, read_pclk_frequency, NULL);
> +static DEVICE_ATTR(hsync_width, 0444, read_hsync_width, NULL);
> +static DEVICE_ATTR(vsync_width, 0444, read_vsync_width, NULL);
> +static DEVICE_ATTR(hback_porch, 0444, read_hback_porch, NULL);
> +static DEVICE_ATTR(hfront_porch, 0444, read_hfront_porch, NULL);
> +static DEVICE_ATTR(vback_porch, 0444, read_vback_porch, NULL);
> +static DEVICE_ATTR(vfront_porch, 0444, read_vfront_porch, NULL);
> +static DEVICE_ATTR(frequency_range, 0644, read_frequency_range,
> +		   write_frequency_range);
> +static DEVICE_ATTR(alignment, 0644, read_alignment, write_alignment);
> +
> +static DEVICE_ATTR(fpdl3_input_width, 0644, read_fpdl3_input_width,
> +		   write_fpdl3_input_width);
> +
> +static DEVICE_ATTR(gmsl_mode, 0644, read_gmsl_mode, write_gmsl_mode);
> +static DEVICE_ATTR(gmsl_stream_id, 0644, read_gmsl_stream_id,
> +		   write_gmsl_stream_id);
> +static DEVICE_ATTR(gmsl_fec, 0644, read_gmsl_fec, write_gmsl_fec);
> +
> +struct device_attribute *mgb4_fpdl3_in_attrs[] = {
> +	&dev_attr_input_id,
> +	&dev_attr_link_status,
> +	&dev_attr_stream_status,
> +	&dev_attr_hsync_status,
> +	&dev_attr_vsync_status,
> +	&dev_attr_oldi_lane_width,
> +	&dev_attr_color_mapping,
> +	&dev_attr_hsync_gap_length,
> +	&dev_attr_vsync_gap_length,
> +	&dev_attr_pclk_frequency,
> +	&dev_attr_hsync_width,
> +	&dev_attr_vsync_width,
> +	&dev_attr_hback_porch,
> +	&dev_attr_hfront_porch,
> +	&dev_attr_vback_porch,
> +	&dev_attr_vfront_porch,
> +	&dev_attr_frequency_range,
> +	&dev_attr_alignment,
> +	&dev_attr_fpdl3_input_width,
> +	NULL
> +};
> +
> +struct device_attribute *mgb4_gmsl_in_attrs[] = {
> +	&dev_attr_input_id,
> +	&dev_attr_link_status,
> +	&dev_attr_stream_status,
> +	&dev_attr_hsync_status,
> +	&dev_attr_vsync_status,
> +	&dev_attr_oldi_lane_width,
> +	&dev_attr_color_mapping,
> +	&dev_attr_hsync_gap_length,
> +	&dev_attr_vsync_gap_length,
> +	&dev_attr_pclk_frequency,
> +	&dev_attr_hsync_width,
> +	&dev_attr_vsync_width,
> +	&dev_attr_hback_porch,
> +	&dev_attr_hfront_porch,
> +	&dev_attr_vback_porch,
> +	&dev_attr_vfront_porch,
> +	&dev_attr_frequency_range,
> +	&dev_attr_alignment,
> +	&dev_attr_gmsl_mode,
> +	&dev_attr_gmsl_stream_id,
> +	&dev_attr_gmsl_fec,
> +	NULL
> +};
> diff --git a/drivers/media/pci/mgb4/mgb4_sysfs_out.c b/drivers/media/pci/mgb4/mgb4_sysfs_out.c
> new file mode 100644
> index 000000000000..be80b635d1d7
> --- /dev/null
> +++ b/drivers/media/pci/mgb4/mgb4_sysfs_out.c
> @@ -0,0 +1,734 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2021-2022 Digiteq Automotive
> + *     author: Martin Tuma <martin.tuma@digiteqautomotive.com>
> + */
> +
> +#include <linux/device.h>
> +#include "mgb4_core.h"
> +#include "mgb4_i2c.h"
> +#include "mgb4_vout.h"
> +#include "mgb4_vin.h"
> +#include "mgb4_cmt.h"
> +#include "mgb4_sysfs.h"
> +
> +static int loopin_cnt(struct mgb4_vin_dev *vindev)
> +{
> +	struct mgb4_vout_dev *voutdev;
> +	u32 config;
> +	int i, cnt = 0;
> +
> +	for (i = 0; i < MGB4_VOUT_DEVICES; i++) {
> +		voutdev = vindev->mgbdev->vout[i];
> +		if (!voutdev)
> +			continue;
> +
> +		config = mgb4_read_reg(&voutdev->mgbdev->video,
> +		  voutdev->config->regs.config);
> +		if ((config & 0xc) >> 2 == vindev->config->id)
> +			cnt++;
> +	}
> +
> +	return cnt;
> +}
> +
> +
> +/* Common for both FPDL3 and GMSL */
> +
> +static ssize_t read_output_id(struct device *dev,
> +			      struct device_attribute *attr, char *buf)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vout_dev *voutdev = video_get_drvdata(vdev);
> +
> +	return sprintf(buf, "%d\n", voutdev->config->id);
> +}
> +
> +static ssize_t read_video_source(struct device *dev,
> +				 struct device_attribute *attr, char *buf)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vout_dev *voutdev = video_get_drvdata(vdev);
> +	u32 config = mgb4_read_reg(&voutdev->mgbdev->video,
> +	  voutdev->config->regs.config);
> +
> +	return sprintf(buf, "%u\n", (config & 0xc) >> 2);
> +}
> +
> +static ssize_t write_video_source(struct device *dev,
> +				  struct device_attribute *attr,
> +				  const char *buf, size_t count)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vout_dev *voutdev = video_get_drvdata(vdev);
> +	struct mgb4_dev *mgbdev = voutdev->mgbdev;
> +	struct mgb4_vin_dev *loopin_new = 0, *loopin_old = 0;
> +	unsigned long val;
> +	unsigned long flags_in[MGB4_VIN_DEVICES], flags_out[MGB4_VOUT_DEVICES];
> +	ssize_t ret;
> +	u32 config;
> +	int i;
> +
> +
> +	memset(flags_in, 0, sizeof(flags_in));
> +	memset(flags_out, 0, sizeof(flags_out));
> +
> +	ret = kstrtoul(buf, 10, &val);
> +	if (ret)
> +		return ret;
> +	if (val > 3)
> +		return -EINVAL;
> +
> +	for (i = 0; i < MGB4_VIN_DEVICES; i++)
> +		if (mgbdev->vin[i])
> +			spin_lock_irqsave(&(mgbdev->vin[i]->vdev.fh_lock), flags_in[i]);
> +	for (i = 0; i < MGB4_VOUT_DEVICES; i++)
> +		if (mgbdev->vout[i])
> +			spin_lock_irqsave(&(mgbdev->vout[i]->vdev.fh_lock), flags_out[i]);
> +
> +	ret = -EBUSY;
> +	for (i = 0; i < MGB4_VIN_DEVICES; i++)
> +		if (mgbdev->vin[i] && !list_empty(&(mgbdev->vin[i]->vdev.fh_list)))
> +			goto error;
> +	for (i = 0; i < MGB4_VOUT_DEVICES; i++)
> +		if (mgbdev->vout[i] && !list_empty(&(mgbdev->vout[i]->vdev.fh_list)))
> +			goto error;
> +
> +	config = mgb4_read_reg(&mgbdev->video, voutdev->config->regs.config);
> +
> +	if (((config & 0xc) >> 2) < MGB4_VIN_DEVICES)
> +		loopin_old = mgbdev->vin[(config & 0xc) >> 2];
> +	if (val < MGB4_VIN_DEVICES)
> +		loopin_new = mgbdev->vin[val];
> +	if (loopin_old && loopin_cnt(loopin_old) == 1)
> +		mgb4_mask_reg(&mgbdev->video, loopin_old->config->regs.config, 0x2, 0x0);
> +	if (loopin_new)
> +		mgb4_mask_reg(&mgbdev->video, loopin_new->config->regs.config, 0x2, 0x2);
> +
> +	if (val == voutdev->config->id + MGB4_VIN_DEVICES)
> +		mgb4_write_reg(&mgbdev->video, voutdev->config->regs.config,
> +		  config & ~(1<<1));
> +	else
> +		mgb4_write_reg(&mgbdev->video, voutdev->config->regs.config,
> +		  config | (1U<<1));
> +
> +	mgb4_mask_reg(&mgbdev->video, voutdev->config->regs.config, 0xc, val << 2);
> +
> +	ret = count;
> +
> +error:
> +	for (i = MGB4_VOUT_DEVICES - 1; i >= 0; i--)
> +		if (mgbdev->vout[i])
> +			spin_unlock_irqrestore(&(mgbdev->vout[i]->vdev.fh_lock), flags_out[i]);
> +	for (i = MGB4_VIN_DEVICES - 1; i >= 0; i--)
> +		if (mgbdev->vin[i])
> +			spin_unlock_irqrestore(&(mgbdev->vin[i]->vdev.fh_lock), flags_in[i]);
> +
> +	return ret;
> +}
> +
> +static ssize_t read_display_width(struct device *dev,
> +				  struct device_attribute *attr, char *buf)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vout_dev *voutdev = video_get_drvdata(vdev);
> +	u32 config = mgb4_read_reg(&voutdev->mgbdev->video,
> +	  voutdev->config->regs.resolution);
> +
> +	return sprintf(buf, "%u\n", config >> 16);
> +}
> +
> +static ssize_t write_display_width(struct device *dev,
> +				   struct device_attribute *attr,
> +				   const char *buf, size_t count)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vout_dev *voutdev = video_get_drvdata(vdev);
> +	unsigned long val, flags;
> +	int ret, busy;
> +
> +	ret = kstrtoul(buf, 10, &val);
> +	if (ret)
> +		return ret;
> +	if (val > 0xFFFF)
> +		return -EINVAL;
> +
> +	spin_lock_irqsave(&(voutdev->vdev.fh_lock), flags);
> +	busy = !list_empty(&(voutdev->vdev.fh_list));
> +	if (busy) {
> +		spin_unlock_irqrestore(&(voutdev->vdev.fh_lock), flags);
> +		return -EBUSY;
> +	}
> +
> +	mgb4_mask_reg(&voutdev->mgbdev->video, voutdev->config->regs.resolution,
> +	  0xFFFF0000, val << 16);
> +
> +	spin_unlock_irqrestore(&(voutdev->vdev.fh_lock), flags);
> +
> +	return count;
> +}
> +
> +static ssize_t read_display_height(struct device *dev,
> +				   struct device_attribute *attr, char *buf)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vout_dev *voutdev = video_get_drvdata(vdev);
> +	u32 config = mgb4_read_reg(&voutdev->mgbdev->video,
> +	  voutdev->config->regs.resolution);
> +
> +	return sprintf(buf, "%u\n", config & 0xFFFF);
> +}
> +
> +static ssize_t write_display_height(struct device *dev,
> +				    struct device_attribute *attr,
> +				    const char *buf, size_t count)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vout_dev *voutdev = video_get_drvdata(vdev);
> +	unsigned long val, flags;
> +	int ret, busy;
> +
> +	ret = kstrtoul(buf, 10, &val);
> +	if (ret)
> +		return ret;
> +	if (val > 0xFFFF)
> +		return -EINVAL;
> +
> +	spin_lock_irqsave(&(voutdev->vdev.fh_lock), flags);
> +	busy = !list_empty(&(voutdev->vdev.fh_list));
> +	if (busy) {
> +		spin_unlock_irqrestore(&(voutdev->vdev.fh_lock), flags);
> +		return -EBUSY;
> +	}
> +
> +	mgb4_mask_reg(&voutdev->mgbdev->video, voutdev->config->regs.resolution,
> +	  0xFFFF, val);
> +
> +	spin_unlock_irqrestore(&(voutdev->vdev.fh_lock), flags);
> +
> +	return count;
> +}
> +
> +static ssize_t read_frame_rate(struct device *dev,
> +			       struct device_attribute *attr, char *buf)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vout_dev *voutdev = video_get_drvdata(vdev);
> +	u32 period = mgb4_read_reg(&voutdev->mgbdev->video,
> +	  voutdev->config->regs.frame_period);
> +
> +	return sprintf(buf, "%u\n", 125000000 / period);
> +}
> +
> +static ssize_t write_frame_rate(struct device *dev,
> +				struct device_attribute *attr, const char *buf,
> +				size_t count)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vout_dev *voutdev = video_get_drvdata(vdev);
> +	unsigned long val;
> +	int ret;
> +
> +	ret = kstrtoul(buf, 10, &val);
> +	if (ret)
> +		return ret;
> +
> +	mgb4_write_reg(&voutdev->mgbdev->video, voutdev->config->regs.frame_period,
> +	  125000000 / val);
> +
> +	return count;
> +}
> +
> +static ssize_t read_hsync_width(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vout_dev *voutdev = video_get_drvdata(vdev);
> +	u32 sig = mgb4_read_reg(&voutdev->mgbdev->video, voutdev->config->regs.hsync);
> +
> +	return sprintf(buf, "%u\n", (sig & 0x00FF0000) >> 16);
> +}
> +
> +static ssize_t write_hsync_width(struct device *dev,
> +				 struct device_attribute *attr, const char *buf,
> +				 size_t count)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vout_dev *voutdev = video_get_drvdata(vdev);
> +	unsigned long val;
> +	int ret;
> +
> +	ret = kstrtoul(buf, 10, &val);
> +	if (ret)
> +		return ret;
> +	if (val > 0xFF)
> +		return -EINVAL;
> +
> +	mgb4_mask_reg(&voutdev->mgbdev->video, voutdev->config->regs.hsync,
> +	  0x00FF0000, val << 16);
> +
> +	return count;
> +}
> +
> +static ssize_t read_vsync_width(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vout_dev *voutdev = video_get_drvdata(vdev);
> +	u32 sig = mgb4_read_reg(&voutdev->mgbdev->video, voutdev->config->regs.vsync);
> +
> +	return sprintf(buf, "%u\n", (sig & 0x00FF0000) >> 16);
> +}
> +
> +static ssize_t write_vsync_width(struct device *dev,
> +				 struct device_attribute *attr, const char *buf,
> +				 size_t count)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vout_dev *voutdev = video_get_drvdata(vdev);
> +	unsigned long val;
> +	int ret;
> +
> +	ret = kstrtoul(buf, 10, &val);
> +	if (ret)
> +		return ret;
> +	if (val > 0xFF)
> +		return -EINVAL;
> +
> +	mgb4_mask_reg(&voutdev->mgbdev->video, voutdev->config->regs.vsync,
> +	  0x00FF0000, val << 16);
> +
> +	return count;
> +}
> +
> +static ssize_t read_hback_porch(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vout_dev *voutdev = video_get_drvdata(vdev);
> +	u32 sig = mgb4_read_reg(&voutdev->mgbdev->video, voutdev->config->regs.hsync);
> +
> +	return sprintf(buf, "%u\n", (sig & 0x0000FF00) >> 8);
> +}
> +
> +static ssize_t write_hback_porch(struct device *dev,
> +				 struct device_attribute *attr, const char *buf,
> +				 size_t count)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vout_dev *voutdev = video_get_drvdata(vdev);
> +	unsigned long val;
> +	int ret;
> +
> +	ret = kstrtoul(buf, 10, &val);
> +	if (ret)
> +		return ret;
> +	if (val > 0xFF)
> +		return -EINVAL;
> +
> +	mgb4_mask_reg(&voutdev->mgbdev->video, voutdev->config->regs.hsync,
> +	  0x0000FF00, val << 8);
> +
> +	return count;
> +}
> +
> +static ssize_t read_vback_porch(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vout_dev *voutdev = video_get_drvdata(vdev);
> +	u32 sig = mgb4_read_reg(&voutdev->mgbdev->video, voutdev->config->regs.vsync);
> +
> +	return sprintf(buf, "%u\n", (sig & 0x0000FF00) >> 8);
> +}
> +
> +static ssize_t write_vback_porch(struct device *dev,
> +				 struct device_attribute *attr, const char *buf,
> +				 size_t count)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vout_dev *voutdev = video_get_drvdata(vdev);
> +	unsigned long val;
> +	int ret;
> +
> +	ret = kstrtoul(buf, 10, &val);
> +	if (ret)
> +		return ret;
> +	if (val > 0xFF)
> +		return -EINVAL;
> +
> +	mgb4_mask_reg(&voutdev->mgbdev->video, voutdev->config->regs.vsync,
> +	  0x0000FF00, val << 8);
> +
> +	return count;
> +}
> +
> +static ssize_t read_hfront_porch(struct device *dev,
> +				 struct device_attribute *attr, char *buf)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vout_dev *voutdev = video_get_drvdata(vdev);
> +	u32 sig = mgb4_read_reg(&voutdev->mgbdev->video, voutdev->config->regs.hsync);
> +
> +	return sprintf(buf, "%u\n", (sig & 0x000000FF));
> +}
> +
> +static ssize_t write_hfront_porch(struct device *dev,
> +				  struct device_attribute *attr,
> +				  const char *buf, size_t count)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vout_dev *voutdev = video_get_drvdata(vdev);
> +	unsigned long val;
> +	int ret;
> +
> +	ret = kstrtoul(buf, 10, &val);
> +	if (ret)
> +		return ret;
> +	if (val > 0xFF)
> +		return -EINVAL;
> +
> +	mgb4_mask_reg(&voutdev->mgbdev->video, voutdev->config->regs.hsync,
> +	  0x000000FF, val);
> +
> +	return count;
> +}
> +
> +static ssize_t read_vfront_porch(struct device *dev,
> +				 struct device_attribute *attr, char *buf)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vout_dev *voutdev = video_get_drvdata(vdev);
> +	u32 sig = mgb4_read_reg(&voutdev->mgbdev->video, voutdev->config->regs.vsync);
> +
> +	return sprintf(buf, "%u\n", (sig & 0x000000FF));
> +}
> +
> +static ssize_t write_vfront_porch(struct device *dev,
> +				  struct device_attribute *attr, const char *buf,
> +				  size_t count)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vout_dev *voutdev = video_get_drvdata(vdev);
> +	unsigned long val;
> +	int ret;
> +
> +	ret = kstrtoul(buf, 10, &val);
> +	if (ret)
> +		return ret;
> +	if (val > 0xFF)
> +		return -EINVAL;
> +
> +	mgb4_mask_reg(&voutdev->mgbdev->video, voutdev->config->regs.vsync,
> +	  0x000000FF, val);
> +
> +	return count;
> +}
> +
> +static ssize_t read_alignment(struct device *dev,
> +			      struct device_attribute *attr, char *buf)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vout_dev *voutdev = video_get_drvdata(vdev);
> +
> +	return sprintf(buf, "%d\n", voutdev->alignment);
> +}
> +
> +static ssize_t write_alignment(struct device *dev,
> +			       struct device_attribute *attr, const char *buf,
> +			       size_t count)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vout_dev *voutdev = video_get_drvdata(vdev);
> +	unsigned long val, flags;
> +	u32 config;
> +	int ret;
> +
> +	ret = kstrtoul(buf, 10, &val);
> +	if (ret)
> +		return ret;
> +	if (!val || (val & (val - 1)))
> +		return -EINVAL;
> +
> +	spin_lock_irqsave(&(voutdev->vdev.fh_lock), flags);
> +	if (!list_empty(&(voutdev->vdev.fh_list))) {
> +		spin_unlock_irqrestore(&(voutdev->vdev.fh_lock), flags);
> +		return -EBUSY;
> +	}
> +	/* Do not allow the change if loopback is active */
> +	config = mgb4_read_reg(&voutdev->mgbdev->video, voutdev->config->regs.config);
> +	if (((config & 0xc) >> 2) < 2) {
> +		spin_unlock_irqrestore(&(voutdev->vdev.fh_lock), flags);
> +		return -EPERM;
> +	}
> +
> +	voutdev->alignment = val;
> +
> +	spin_unlock_irqrestore(&(voutdev->vdev.fh_lock), flags);
> +
> +	return count;
> +}
> +
> +/* FPDL3 only */
> +
> +static ssize_t read_hsync_polarity(struct device *dev,
> +				   struct device_attribute *attr, char *buf)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vout_dev *voutdev = video_get_drvdata(vdev);
> +	u32 config = mgb4_read_reg(&voutdev->mgbdev->video,
> +	  voutdev->config->regs.hsync);
> +
> +	return sprintf(buf, "%u\n", (config & (1<<31)) >> 31);
> +}
> +
> +static ssize_t write_hsync_polarity(struct device *dev,
> +				    struct device_attribute *attr,
> +				    const char *buf, size_t count)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vout_dev *voutdev = video_get_drvdata(vdev);
> +	unsigned long val;
> +	int ret;
> +
> +	ret = kstrtoul(buf, 10, &val);
> +	if (ret)
> +		return ret;
> +	if (val > 1)
> +		return -EINVAL;
> +
> +	mgb4_mask_reg(&voutdev->mgbdev->video, voutdev->config->regs.hsync, (1<<31),
> +	  val << 31);
> +
> +	return count;
> +}
> +
> +static ssize_t read_vsync_polarity(struct device *dev,
> +				   struct device_attribute *attr, char *buf)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vout_dev *voutdev = video_get_drvdata(vdev);
> +	u32 config = mgb4_read_reg(&voutdev->mgbdev->video,
> +	  voutdev->config->regs.vsync);
> +
> +	return sprintf(buf, "%u\n", (config & (1<<31)) >> 31);
> +}
> +
> +static ssize_t write_vsync_polarity(struct device *dev,
> +				    struct device_attribute *attr,
> +				    const char *buf, size_t count)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vout_dev *voutdev = video_get_drvdata(vdev);
> +	unsigned long val;
> +	int ret;
> +
> +	ret = kstrtoul(buf, 10, &val);
> +	if (ret)
> +		return ret;
> +	if (val > 1)
> +		return -EINVAL;
> +
> +	mgb4_mask_reg(&voutdev->mgbdev->video, voutdev->config->regs.vsync, (1<<31),
> +	  val << 31);
> +
> +	return count;
> +}
> +
> +static ssize_t read_de_polarity(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vout_dev *voutdev = video_get_drvdata(vdev);
> +	u32 config = mgb4_read_reg(&voutdev->mgbdev->video,
> +	  voutdev->config->regs.vsync);
> +
> +	return sprintf(buf, "%u\n", (config & (1<<30)) >> 30);
> +}
> +
> +static ssize_t write_de_polarity(struct device *dev,
> +				 struct device_attribute *attr, const char *buf,
> +				 size_t count)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vout_dev *voutdev = video_get_drvdata(vdev);
> +	unsigned long val;
> +	int ret;
> +
> +	ret = kstrtoul(buf, 10, &val);
> +	if (ret)
> +		return ret;
> +	if (val > 1)
> +		return -EINVAL;
> +
> +	mgb4_mask_reg(&voutdev->mgbdev->video, voutdev->config->regs.vsync, (1<<30),
> +	  val << 30);
> +
> +	return count;
> +}
> +
> +static ssize_t read_fpdl3_output_width(struct device *dev,
> +				       struct device_attribute *attr, char *buf)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vout_dev *voutdev = video_get_drvdata(vdev);
> +	s32 ret;
> +
> +	mutex_lock(&voutdev->mgbdev->i2c_lock);
> +	ret = mgb4_i2c_read_byte(&voutdev->ser, 0x5B);
> +	mutex_unlock(&voutdev->mgbdev->i2c_lock);
> +	if (ret < 0)
> +		return -EIO;
> +
> +	switch ((u8)ret & 0x03) {
> +	case 0:
> +		return sprintf(buf, "0\n");
> +	case 1:
> +		return sprintf(buf, "1\n");
> +	case 3:
> +		return sprintf(buf, "2\n");
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static ssize_t write_fpdl3_output_width(struct device *dev,
> +					struct device_attribute *attr,
> +					const char *buf, size_t count)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vout_dev *voutdev = video_get_drvdata(vdev);
> +	u8 i2c_data;
> +	unsigned long val;
> +	int ret;
> +
> +	ret = kstrtoul(buf, 10, &val);
> +	if (ret)
> +		return ret;
> +
> +	switch (val) {
> +	case 0: /* auto */
> +		i2c_data = 0x00;
> +		break;
> +	case 1: /* single */
> +		i2c_data = 0x01;
> +		break;
> +	case 2: /* dual */
> +		i2c_data = 0x03;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	mutex_lock(&voutdev->mgbdev->i2c_lock);
> +	ret = mgb4_i2c_mask_byte(&voutdev->ser, 0x5B, 0x03, i2c_data);
> +	mutex_unlock(&voutdev->mgbdev->i2c_lock);
> +	if (ret < 0)
> +		return -EIO;
> +
> +	return count;
> +}
> +
> +static ssize_t read_pclk_frequency(struct device *dev,
> +				   struct device_attribute *attr, char *buf)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vout_dev *voutdev = video_get_drvdata(vdev);
> +
> +	return sprintf(buf, "%u\n", voutdev->freq);
> +}
> +
> +static ssize_t write_pclk_frequency(struct device *dev,
> +				    struct device_attribute *attr,
> +				    const char *buf, size_t count)
> +{
> +	struct video_device *vdev = to_video_device(dev);
> +	struct mgb4_vout_dev *voutdev = video_get_drvdata(vdev);
> +	unsigned long val, flags;
> +	int ret, busy;
> +	unsigned int dp;
> +
> +	ret = kstrtoul(buf, 10, &val);
> +	if (ret)
> +		return ret;
> +
> +	spin_lock_irqsave(&(voutdev->vdev.fh_lock), flags);
> +	busy = !list_empty(&(voutdev->vdev.fh_list));
> +	if (busy) {
> +		spin_unlock_irqrestore(&(voutdev->vdev.fh_lock), flags);
> +		return -EBUSY;
> +	}
> +
> +	dp = (val > 50000) ? 1 : 0;
> +	voutdev->freq = mgb4_cmt_set_vout(voutdev, val >> dp) << dp;
> +
> +	spin_unlock_irqrestore(&(voutdev->vdev.fh_lock), flags);
> +
> +	mgb4_mask_reg(&voutdev->mgbdev->video, voutdev->config->regs.config,
> +	  0x10, dp << 4);
> +	mutex_lock(&voutdev->mgbdev->i2c_lock);
> +	ret = mgb4_i2c_mask_byte(&voutdev->ser, 0x4F, 1<<6, ((~dp)&1)<<6);
> +	mutex_unlock(&voutdev->mgbdev->i2c_lock);
> +	if (ret < 0)
> +		return -EIO;
> +
> +	return count;
> +}
> +
> +
> +static DEVICE_ATTR(output_id, 0444, read_output_id, NULL);
> +static DEVICE_ATTR(video_source, 0644, read_video_source, write_video_source);
> +static DEVICE_ATTR(display_width, 0644, read_display_width,
> +		   write_display_width);
> +static DEVICE_ATTR(display_height, 0644, read_display_height,
> +		   write_display_height);
> +static DEVICE_ATTR(frame_rate, 0644, read_frame_rate, write_frame_rate);
> +static DEVICE_ATTR(hsync_polarity, 0644, read_hsync_polarity,
> +		   write_hsync_polarity);
> +static DEVICE_ATTR(vsync_polarity, 0644, read_vsync_polarity,
> +		   write_vsync_polarity);
> +static DEVICE_ATTR(de_polarity, 0644, read_de_polarity,
> +		   write_de_polarity);
> +static DEVICE_ATTR(pclk_frequency, 0644, read_pclk_frequency,
> +		   write_pclk_frequency);
> +static DEVICE_ATTR(hsync_width, 0644, read_hsync_width, write_hsync_width);
> +static DEVICE_ATTR(vsync_width, 0644, read_vsync_width, write_vsync_width);
> +static DEVICE_ATTR(hback_porch, 0644, read_hback_porch, write_hback_porch);
> +static DEVICE_ATTR(hfront_porch, 0644, read_hfront_porch, write_hfront_porch);
> +static DEVICE_ATTR(vback_porch, 0644, read_vback_porch, write_vback_porch);
> +static DEVICE_ATTR(vfront_porch, 0644, read_vfront_porch, write_vfront_porch);
> +static DEVICE_ATTR(alignment, 0644, read_alignment, write_alignment);
> +
> +static DEVICE_ATTR(fpdl3_output_width, 0644, read_fpdl3_output_width,
> +		   write_fpdl3_output_width);
> +
> +
> +struct device_attribute *mgb4_fpdl3_out_attrs[] = {
> +	&dev_attr_output_id,
> +	&dev_attr_video_source,
> +	&dev_attr_display_width,
> +	&dev_attr_display_height,
> +	&dev_attr_frame_rate,
> +	&dev_attr_hsync_polarity,
> +	&dev_attr_vsync_polarity,
> +	&dev_attr_de_polarity,
> +	&dev_attr_pclk_frequency,
> +	&dev_attr_hsync_width,
> +	&dev_attr_vsync_width,
> +	&dev_attr_hback_porch,
> +	&dev_attr_hfront_porch,
> +	&dev_attr_vback_porch,
> +	&dev_attr_vfront_porch,
> +	&dev_attr_alignment,
> +	&dev_attr_fpdl3_output_width,
> +	NULL
> +};
> +
> +struct device_attribute *mgb4_gmsl_out_attrs[] = {
> +	&dev_attr_output_id,
> +	&dev_attr_video_source,
> +	&dev_attr_display_width,
> +	&dev_attr_display_height,
> +	&dev_attr_frame_rate,
> +	NULL
> +};
> diff --git a/drivers/media/pci/mgb4/mgb4_sysfs_pci.c b/drivers/media/pci/mgb4/mgb4_sysfs_pci.c
> new file mode 100644
> index 000000000000..a7f59cd9cfc9
> --- /dev/null
> +++ b/drivers/media/pci/mgb4/mgb4_sysfs_pci.c
> @@ -0,0 +1,83 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2021-2022 Digiteq Automotive
> + *     author: Martin Tuma <martin.tuma@digiteqautomotive.com>
> + */
> +
> +#include <linux/device.h>
> +#include "mgb4_core.h"
> +#include "mgb4_sysfs.h"
> +
> +static ssize_t read_module_version(struct device *dev,
> +				   struct device_attribute *attr, char *buf)
> +{
> +	struct mgb4_dev *mgbdev = dev_get_drvdata(dev);
> +
> +	return sprintf(buf, "%u\n", mgbdev->module_version & 0x0F);
> +}
> +
> +static ssize_t read_module_type(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	struct mgb4_dev *mgbdev = dev_get_drvdata(dev);
> +
> +	return sprintf(buf, "%u\n", mgbdev->module_version >> 4);
> +}
> +
> +static ssize_t read_fw_version(struct device *dev,
> +			       struct device_attribute *attr, char *buf)
> +{
> +	struct mgb4_dev *mgbdev = dev_get_drvdata(dev);
> +	u32 config = mgb4_read_reg(&mgbdev->video, 0xC4);
> +
> +	return sprintf(buf, "%u\n", config & 0xFFFF);
> +}
> +
> +static ssize_t read_fw_type(struct device *dev,
> +			    struct device_attribute *attr, char *buf)
> +{
> +	struct mgb4_dev *mgbdev = dev_get_drvdata(dev);
> +	u32 config = mgb4_read_reg(&mgbdev->video, 0xC4);
> +
> +	return sprintf(buf, "%u\n", config >> 24);
> +}
> +
> +static ssize_t read_serial_number(struct device *dev,
> +				  struct device_attribute *attr, char *buf)
> +{
> +	struct mgb4_dev *mgbdev = dev_get_drvdata(dev);
> +	u32 sn = mgbdev->serial_number;
> +
> +	return sprintf(buf, "%03d-%03d-%03d-%03d\n", sn >> 24, (sn >> 16) & 0xFF,
> +	  (sn >> 8) & 0xFF, sn & 0xFF);
> +}
> +
> +static ssize_t read_temperature(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	struct mgb4_dev *mgbdev = dev_get_drvdata(dev);
> +	u32 val10, val;
> +
> +	val  = mgb4_read_reg(&mgbdev->video, 0xD0);
> +	val10 = ((((val >> 20) & 0xFFF) * 503975) - 1118822400) / 409600;
> +
> +	return sprintf(buf, "%u\n", ((val10 % 10) > 4)
> +	  ? (val10 / 10) + 1 : val10 / 10);
> +}
> +
> +static DEVICE_ATTR(module_version, 0444, read_module_version, NULL);
> +static DEVICE_ATTR(module_type, 0444, read_module_type, NULL);
> +static DEVICE_ATTR(fw_version, 0444, read_fw_version, NULL);
> +static DEVICE_ATTR(fw_type, 0444, read_fw_type, NULL);
> +static DEVICE_ATTR(serial_number, 0444, read_serial_number, NULL);
> +static DEVICE_ATTR(temperature, 0444, read_temperature, NULL);
> +
> +struct device_attribute *mgb4_pci_attrs[] = {
> +	&dev_attr_module_type,
> +	&dev_attr_module_version,
> +	&dev_attr_fw_type,
> +	&dev_attr_fw_version,
> +	&dev_attr_serial_number,
> +	&dev_attr_temperature,
> +	NULL
> +};
> diff --git a/drivers/media/pci/mgb4/mgb4_trigger.c b/drivers/media/pci/mgb4/mgb4_trigger.c
> new file mode 100644
> index 000000000000..607ca33104c2
> --- /dev/null
> +++ b/drivers/media/pci/mgb4/mgb4_trigger.c
> @@ -0,0 +1,203 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2021-2022 Digiteq Automotive
> + *     author: Martin Tuma <martin.tuma@digiteqautomotive.com>
> + */
> +
> +#include <linux/version.h>
> +#include <linux/iio/iio.h>
> +#include <linux/iio/buffer.h>
> +#include <linux/iio/trigger.h>
> +#include <linux/iio/trigger_consumer.h>
> +#include <linux/iio/triggered_buffer.h>
> +#include <linux/pci.h>
> +#include <linux/dma/amd_xdma.h>
> +#include "mgb4_core.h"
> +#include "mgb4_trigger.h"
> +
> +struct trigger_data {
> +	struct mgb4_dev *mgbdev;
> +	struct iio_trigger *trig;
> +};
> +
> +static int trigger_read_raw(struct iio_dev *indio_dev,
> +			    struct iio_chan_spec const *chan, int *val,
> +			    int *val2, long mask)
> +{
> +	struct trigger_data *st = iio_priv(indio_dev);
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		if (iio_buffer_enabled(indio_dev))
> +			return -EBUSY;
> +		*val = mgb4_read_reg(&st->mgbdev->video, 0xA0);
> +
> +		return IIO_VAL_INT;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static int trigger_set_state(struct iio_trigger *trig, bool state)
> +{
> +	struct iio_dev *indio_dev = iio_trigger_get_drvdata(trig);
> +	struct trigger_data *st = iio_priv(indio_dev);
> +	int irq = xdma_get_user_irq(st->mgbdev->xdev, 11);
> +
> +	if (state)
> +		xdma_enable_user_irq(st->mgbdev->xdev, irq);
> +	else
> +		xdma_disable_user_irq(st->mgbdev->xdev, irq);
> +
> +	return 0;
> +}
> +
> +static const struct iio_trigger_ops trigger_ops = {
> +	.set_trigger_state = &trigger_set_state,
> +};
> +
> +static const struct iio_info trigger_info = {
> +	.read_raw         = trigger_read_raw,
> +};
> +
> +#define TRIGGER_CHANNEL(_si) {                    \
> +	.type = IIO_ACTIVITY,                         \
> +	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW), \
> +	.scan_index = _si,                            \
> +	.scan_type = {                                \
> +		.sign = 'u',                              \
> +		.realbits = 32,                           \
> +		.storagebits = 32,                        \
> +		.shift = 0,                               \
> +		.endianness = IIO_CPU                     \
> +	},                                            \
> +}
> +
> +static const struct iio_chan_spec trigger_channels[] = {
> +	TRIGGER_CHANNEL(0),
> +	IIO_CHAN_SOFT_TIMESTAMP(1),
> +};
> +
> +static irqreturn_t trigger_handler(int irq, void *p)
> +{
> +	struct iio_poll_func *pf = p;
> +	struct iio_dev *indio_dev = pf->indio_dev;
> +	struct trigger_data *st = iio_priv(indio_dev);
> +	struct {
> +		u32 data;
> +		s64 ts __aligned(8);
> +	} scan;
> +
> +	scan.data = mgb4_read_reg(&st->mgbdev->video, 0xA0);
> +	mgb4_write_reg(&st->mgbdev->video, 0xA0, scan.data);
> +
> +	iio_push_to_buffers_with_timestamp(indio_dev, &scan, pf->timestamp);
> +	iio_trigger_notify_done(indio_dev->trig);
> +
> +	mgb4_write_reg(&st->mgbdev->video, 0xB4, 1U<<11);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int probe_trigger(struct iio_dev *indio_dev, int irq)
> +{
> +	int ret;
> +	struct trigger_data *st = iio_priv(indio_dev);
> +
> +	st->trig = iio_trigger_alloc(&st->mgbdev->pdev->dev, "%s-dev%d",
> +	  indio_dev->name, iio_device_id(indio_dev));
> +	if (!st->trig)
> +		return -ENOMEM;
> +
> +	ret = request_irq(irq, &iio_trigger_generic_data_rdy_poll,
> +	 0, "mgb4-trigger", st->trig);
> +	if (ret)
> +		goto error_free_trig;
> +
> +	st->trig->ops = &trigger_ops;
> +	iio_trigger_set_drvdata(st->trig, indio_dev);
> +	ret = iio_trigger_register(st->trig);
> +	if (ret)
> +		goto error_free_irq;
> +
> +	indio_dev->trig = iio_trigger_get(st->trig);
> +
> +	return 0;
> +
> +error_free_irq:
> +	free_irq(irq, st->trig);
> +error_free_trig:
> +	iio_trigger_free(st->trig);
> +
> +	return ret;
> +}
> +
> +static void remove_trigger(struct iio_dev *indio_dev, int irq)
> +{
> +	struct trigger_data *st = iio_priv(indio_dev);
> +
> +	iio_trigger_unregister(st->trig);
> +	free_irq(irq, st->trig);
> +	iio_trigger_free(st->trig);
> +}
> +
> +struct iio_dev *mgb4_trigger_create(struct mgb4_dev *mgbdev)
> +{
> +	struct iio_dev *indio_dev;
> +	struct trigger_data *data;
> +	struct pci_dev *pdev = mgbdev->pdev;
> +	struct device *dev = &pdev->dev;
> +	int rv, irq;
> +
> +	indio_dev = iio_device_alloc(dev, sizeof(*data));
> +	if (!indio_dev)
> +		return NULL;
> +
> +	indio_dev->info = &trigger_info;
> +	indio_dev->name = "mgb4";
> +	indio_dev->modes = INDIO_DIRECT_MODE;
> +	indio_dev->channels = trigger_channels;
> +	indio_dev->num_channels = ARRAY_SIZE(trigger_channels);
> +
> +	data = iio_priv(indio_dev);
> +	data->mgbdev = mgbdev;
> +
> +	irq = xdma_get_user_irq(mgbdev->xdev, 11);
> +	rv = probe_trigger(indio_dev, irq);
> +	if (rv < 0) {
> +		dev_err(dev, "iio triggered setup failed\n");
> +		goto error_alloc;
> +	}
> +	rv = iio_triggered_buffer_setup(indio_dev, &iio_pollfunc_store_time,
> +	  trigger_handler, NULL);
> +	if (rv < 0) {
> +		dev_err(dev, "iio triggered buffer setup failed\n");
> +		goto error_trigger;
> +	}
> +	rv = iio_device_register(indio_dev);
> +	if (rv < 0) {
> +		dev_err(dev, "iio device register failed\n");
> +		goto error_buffer;
> +	}
> +
> +	return indio_dev;
> +
> +error_buffer:
> +	iio_triggered_buffer_cleanup(indio_dev);
> +error_trigger:
> +	remove_trigger(indio_dev, irq);
> +error_alloc:
> +	iio_device_free(indio_dev);
> +
> +	return NULL;
> +}
> +
> +void mgb4_trigger_free(struct iio_dev *indio_dev)
> +{
> +	struct trigger_data *st = iio_priv(indio_dev);
> +
> +	iio_device_unregister(indio_dev);
> +	iio_triggered_buffer_cleanup(indio_dev);
> +	remove_trigger(indio_dev, xdma_get_user_irq(st->mgbdev->xdev, 11));
> +	iio_device_free(indio_dev);
> +}
> diff --git a/drivers/media/pci/mgb4/mgb4_trigger.h b/drivers/media/pci/mgb4/mgb4_trigger.h
> new file mode 100644
> index 000000000000..9e6a651817d5
> --- /dev/null
> +++ b/drivers/media/pci/mgb4/mgb4_trigger.h
> @@ -0,0 +1,8 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2021-2022 Digiteq Automotive
> + *     author: Martin Tuma <martin.tuma@digiteqautomotive.com>
> + */
> +
> +extern struct iio_dev *mgb4_trigger_create(struct mgb4_dev *mgbdev);
> +extern void mgb4_trigger_free(struct iio_dev *indio_dev);
> diff --git a/drivers/media/pci/mgb4/mgb4_vin.c b/drivers/media/pci/mgb4/mgb4_vin.c
> new file mode 100644
> index 000000000000..82aa656d21ea
> --- /dev/null
> +++ b/drivers/media/pci/mgb4/mgb4_vin.c
> @@ -0,0 +1,665 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2021-2022 Digiteq Automotive
> + *     author: Martin Tuma <martin.tuma@digiteqautomotive.com>
> + */
> +
> +#include <linux/pci.h>
> +#include <linux/workqueue.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/videobuf2-v4l2.h>
> +#include <media/videobuf2-dma-sg.h>
> +#include <linux/dma/amd_xdma.h>
> +#include "mgb4_core.h"
> +#include "mgb4_dma.h"
> +#include "mgb4_sysfs.h"
> +#include "mgb4_io.h"
> +#include "mgb4_vout.h"
> +#include "mgb4_vin.h"
> +
> +static const struct mgb4_vin_config vin_cfg[] = {
> +	{0, 0, 0, 6, {0x10, 0x00, 0x04, 0x08, 0x1C, 0x14, 0x18, 0x20, 0x24, 0x28}},
> +	{1, 1, 1, 7, {0x40, 0x30, 0x34, 0x38, 0x4C, 0x44, 0x48, 0x50, 0x54, 0x58}}
> +};
> +
> +static const struct i2c_board_info fpdl3_deser_info[] = {
> +	{I2C_BOARD_INFO("deserializer1", 0x36)},
> +	{I2C_BOARD_INFO("deserializer2", 0x38)},
> +};
> +static const struct i2c_board_info gmsl_deser_info[] = {
> +	{I2C_BOARD_INFO("deserializer1", 0x4C)},
> +	{I2C_BOARD_INFO("deserializer2", 0x2A)},
> +};
> +
> +static const struct mgb4_i2c_kv fpdl3_i2c[] = {
> +	{0x06, 0xFF, 0x04}, {0x07, 0xFF, 0x01}, {0x45, 0xFF, 0xE8},
> +	{0x49, 0xFF, 0x00}, {0x34, 0xFF, 0x00}, {0x23, 0xFF, 0x00}
> +};
> +
> +static const struct mgb4_i2c_kv gmsl_i2c[] = {
> +	{0x01, 0x03, 0x03}, {0x300, 0x0C, 0x0C}, {0x03, 0xC0, 0xC0},
> +	{0x1CE, 0x0E, 0x0E}, {0x11, 0x05, 0x00}, {0x05, 0xC0, 0x40},
> +	{0x307, 0x0F, 0x00}, {0xA0, 0x03, 0x00}, {0x3E0, 0x07, 0x07},
> +	{0x308, 0x01, 0x01}, {0x10, 0x20, 0x20}, {0x300, 0x40, 0x40}
> +};
> +
> +
> +static struct mgb4_vout_dev *loopback_dev(struct mgb4_vin_dev *vindev, int i)
> +{
> +	struct mgb4_vout_dev *voutdev;
> +	u32 config;
> +
> +	voutdev = vindev->mgbdev->vout[i];
> +	if (!voutdev)
> +		return NULL;
> +
> +	config = mgb4_read_reg(&voutdev->mgbdev->video, voutdev->config->regs.config);
> +	if ((config & 0xc) >> 2 == vindev->config->id)
> +		return voutdev;
> +
> +	return NULL;
> +}
> +
> +static int loopback_active(struct mgb4_vin_dev *vindev)
> +{
> +	int i;
> +
> +	for (i = 0; i < MGB4_VOUT_DEVICES; i++)
> +		if (loopback_dev(vindev, i))
> +			return 1;
> +
> +	return 0;
> +}
> +
> +static void set_loopback_padding(struct mgb4_vin_dev *vindev, u32 padding)
> +{
> +	struct mgb4_regs *video = &vindev->mgbdev->video;
> +	struct mgb4_vout_dev *voutdev;
> +	int i;
> +
> +	for (i = 0; i < MGB4_VOUT_DEVICES; i++) {
> +		voutdev = loopback_dev(vindev, i);
> +		if (voutdev)
> +			mgb4_write_reg(video, voutdev->config->regs.padding, padding);
> +	}
> +}
> +
> +static void return_all_buffers(struct mgb4_vin_dev *vindev,
> +			       enum vb2_buffer_state state)
> +{
> +	struct frame_buffer *buf, *node;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&vindev->qlock, flags);
> +	list_for_each_entry_safe(buf, node, &vindev->buf_list, list) {
> +		vb2_buffer_done(&buf->vb.vb2_buf, state);
> +		list_del(&buf->list);
> +	}
> +	spin_unlock_irqrestore(&vindev->qlock, flags);
> +}
> +
> +static int queue_setup(struct vb2_queue *q, unsigned int *nbuffers,
> +		       unsigned int *nplanes, unsigned int sizes[],
> +		       struct device *alloc_devs[])
> +{
> +	struct mgb4_vin_dev *vindev = vb2_get_drv_priv(q);
> +	unsigned int size = BYTESPERLINE(vindev->width, vindev->alignment)
> +	  * vindev->height;
> +
> +	if (*nbuffers < 2)
> +		*nbuffers = 2;
> +
> +	if (*nplanes)
> +		return sizes[0] < size ? -EINVAL : 0;
> +	*nplanes = 1;
> +	sizes[0] = size;
> +
> +	return 0;
> +}
> +
> +static int buffer_init(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +	struct frame_buffer *buf = to_frame_buffer(vbuf);
> +
> +	INIT_LIST_HEAD(&buf->list);
> +
> +	return 0;
> +}
> +
> +static int buffer_prepare(struct vb2_buffer *vb)
> +{
> +	struct mgb4_vin_dev *vindev = vb2_get_drv_priv(vb->vb2_queue);
> +	struct device *dev = &vindev->mgbdev->pdev->dev;
> +	unsigned int size = BYTESPERLINE(vindev->width, vindev->alignment)
> +	  * vindev->height;
> +
> +	if (vb2_plane_size(vb, 0) < size) {
> +		dev_err(dev, "buffer too small (%lu < %u)\n",
> +			vb2_plane_size(vb, 0), size);
> +		return -EINVAL;
> +	}
> +
> +	vb2_set_plane_payload(vb, 0, size);
> +
> +	return 0;
> +}
> +
> +static void buffer_queue(struct vb2_buffer *vb)
> +{
> +	struct mgb4_vin_dev *vindev = vb2_get_drv_priv(vb->vb2_queue);
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +	struct frame_buffer *buf = to_frame_buffer(vbuf);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&vindev->qlock, flags);
> +	list_add_tail(&buf->list, &vindev->buf_list);
> +	spin_unlock_irqrestore(&vindev->qlock, flags);
> +}
> +
> +static void stop_streaming(struct vb2_queue *vq)
> +{
> +	struct mgb4_vin_dev *vindev = vb2_get_drv_priv(vq);
> +	int irq = xdma_get_user_irq(vindev->mgbdev->xdev, vindev->config->vin_irq);
> +
> +	xdma_disable_user_irq(vindev->mgbdev->xdev, irq);
> +
> +	if (!loopback_active(vindev))
> +		mgb4_mask_reg(&vindev->mgbdev->video, vindev->config->regs.config,
> +		  0x2, 0x0);
> +
> +	cancel_work_sync(&vindev->dma_work);
> +	return_all_buffers(vindev, VB2_BUF_STATE_ERROR);
> +}
> +
> +static int start_streaming(struct vb2_queue *vq, unsigned int count)
> +{
> +	struct mgb4_vin_dev *vindev = vb2_get_drv_priv(vq);
> +	u32 resolution = mgb4_read_reg(&vindev->mgbdev->video,
> +	  vindev->config->regs.resolution);
> +	int irq = xdma_get_user_irq(vindev->mgbdev->xdev, vindev->config->vin_irq);
> +
> +	if ((vindev->width != (resolution >> 16))
> +	  || (vindev->height != (resolution & 0xFFFF))) {
> +		return_all_buffers(vindev, VB2_BUF_STATE_ERROR);

If start_streaming fails, then all buffers need to be returned to STATE_QUEUED,
not STATE_ERROR.

> +		return -EIO;
> +	}
> +
> +	vindev->sequence = 0;
> +
> +	if (!loopback_active(vindev))
> +		mgb4_mask_reg(&vindev->mgbdev->video, vindev->config->regs.config,
> +		  0x2, 0x2);
> +
> +	xdma_enable_user_irq(vindev->mgbdev->xdev, irq);
> +
> +	return 0;
> +}
> +
> +static const struct vb2_ops queue_ops = {
> +	.queue_setup = queue_setup,
> +	.buf_init = buffer_init,
> +	.buf_prepare = buffer_prepare,
> +	.buf_queue = buffer_queue,
> +	.start_streaming = start_streaming,
> +	.stop_streaming = stop_streaming,
> +	.wait_prepare = vb2_ops_wait_prepare,
> +	.wait_finish = vb2_ops_wait_finish
> +};
> +
> +static int fh_open(struct file *file)
> +{
> +	struct mgb4_vin_dev *vindev = video_drvdata(file);
> +	struct mgb4_regs *video = &vindev->mgbdev->video;
> +	u32 resolution, padding;
> +	int ret, irq;
> +
> +	ret = v4l2_fh_open(file);
> +	if (ret)
> +		return ret;
> +
> +	resolution = mgb4_read_reg(video, vindev->config->regs.resolution);
> +	if (resolution >= ERR_NO_REG)
> +		goto error;
> +
> +	vindev->width = resolution >> 16;
> +	vindev->height = resolution & 0xFFFF;
> +	if (!vindev->width || !vindev->height)
> +		goto error;
> +
> +	irq = xdma_get_user_irq(vindev->mgbdev->xdev, vindev->config->err_irq);
> +	xdma_enable_user_irq(vindev->mgbdev->xdev, irq);
> +
> +	vindev->period = mgb4_read_reg(video, vindev->config->regs.frame_period);
> +
> +	padding = PADDING(vindev->width, vindev->alignment);
> +	mgb4_write_reg(video, vindev->config->regs.padding, padding);
> +	set_loopback_padding(vindev, padding);

This doesn't look right. Just opening a video device shouldn't cause
any state changes, and that's what it looks is happening here.

I.e., if I just want to query the device (v4l2-ctl --all), then that
shouldn't not change anything.

> +
> +	return 0;
> +
> +error:
> +	v4l2_fh_release(file);
> +	return -EIO;
> +}
> +
> +static int fh_release(struct file *file)
> +{
> +	struct mgb4_vin_dev *vindev = video_drvdata(file);
> +	struct mgb4_regs *video = &vindev->mgbdev->video;
> +	int irq = xdma_get_user_irq(vindev->mgbdev->xdev, vindev->config->err_irq);
> +
> +	xdma_disable_user_irq(vindev->mgbdev->xdev, irq);
> +
> +	mgb4_write_reg(video, vindev->config->regs.padding, 0);
> +	set_loopback_padding(vindev, 0);
> +
> +	return vb2_fop_release(file);
> +}

This looks wrong too: if I am streaming video, then in another shell
I call 'v4l2-ctl -D' then when v4l2-ctl closes the video device this will disable
the user irq, presumably stopping the video streaming.

> +
> +static const struct v4l2_file_operations video_fops = {
> +	.owner = THIS_MODULE,
> +	.open = fh_open,
> +	.release = fh_release,
> +	.unlocked_ioctl = video_ioctl2,
> +	.read = vb2_fop_read,
> +	.mmap = vb2_fop_mmap,
> +	.poll = vb2_fop_poll,
> +};
> +
> +static int vidioc_querycap(struct file *file, void *priv,
> +			   struct v4l2_capability *cap)
> +{
> +	struct mgb4_vin_dev *vindev = video_drvdata(file);
> +
> +	strscpy(cap->driver, KBUILD_MODNAME, sizeof(cap->driver));
> +	strscpy(cap->card, "MGB4 PCIe Card", sizeof(cap->card));
> +	snprintf(cap->bus_info, sizeof(cap->bus_info), "PCI:%s",
> +	  pci_name(vindev->mgbdev->pdev));

No need to set bus_info, recently the v4l2-core added support for
that. See v4l_querycap in v4l2-ioctl.c.

> +
> +	return 0;
> +}
> +
> +static int vidioc_enum_fmt(struct file *file, void *priv,
> +			   struct v4l2_fmtdesc *f)
> +{
> +	if (f->index != 0)
> +		return -EINVAL;
> +
> +	f->pixelformat = V4L2_PIX_FMT_ABGR32;
> +
> +	return 0;
> +}
> +
> +static int vidioc_enum_frameintervals(struct file *file, void *priv,
> +				      struct v4l2_frmivalenum *ival)
> +{
> +	struct mgb4_vin_dev *vindev = video_drvdata(file);
> +
> +	if (ival->index != 0)
> +		return -EINVAL;
> +	if (ival->pixel_format != V4L2_PIX_FMT_ABGR32)
> +		return -EINVAL;
> +	if (ival->width != vindev->width || ival->height != vindev->height)
> +		return -EINVAL;
> +
> +	ival->type = V4L2_FRMIVAL_TYPE_DISCRETE;
> +	ival->discrete.numerator = vindev->period;
> +	ival->discrete.denominator = 125000000;
> +
> +	return 0;
> +}
> +
> +static int vidioc_fmt(struct file *file, void *priv, struct v4l2_format *f)
> +{
> +	struct mgb4_vin_dev *vindev = video_drvdata(file);
> +
> +	f->fmt.pix.pixelformat = V4L2_PIX_FMT_ABGR32;
> +	f->fmt.pix.width = vindev->width;
> +	f->fmt.pix.height = vindev->height;
> +	f->fmt.pix.field = V4L2_FIELD_NONE;
> +	f->fmt.pix.colorspace = V4L2_COLORSPACE_RAW;
> +	f->fmt.pix.bytesperline = BYTESPERLINE(vindev->width, vindev->alignment);
> +	f->fmt.pix.sizeimage = f->fmt.pix.bytesperline * f->fmt.pix.height;
> +
> +	return 0;
> +}
> +
> +static int vidioc_enum_input(struct file *file, void *priv,
> +			     struct v4l2_input *i)
> +{
> +	if (i->index != 0)
> +		return -EINVAL;
> +
> +	i->type = V4L2_INPUT_TYPE_CAMERA;
> +	strscpy(i->name, "MGB4", sizeof(i->name));
> +
> +	return 0;
> +}
> +
> +static int vidioc_enum_framesizes(struct file *file, void *fh,
> +				  struct v4l2_frmsizeenum *fsize)
> +{
> +	struct mgb4_vin_dev *vindev = video_drvdata(file);
> +
> +	if (fsize->index != 0 || fsize->pixel_format != V4L2_PIX_FMT_ABGR32)
> +		return -EINVAL;
> +
> +	fsize->discrete.width = vindev->width;
> +	fsize->discrete.height = vindev->height;
> +	fsize->type = V4L2_FRMSIZE_TYPE_DISCRETE;
> +
> +	return 0;
> +}
> +
> +static int vidioc_s_input(struct file *file, void *priv, unsigned int i)
> +{
> +	return (i == 0) ? 0 : -EINVAL;
> +}
> +
> +static int vidioc_g_input(struct file *file, void *priv, unsigned int *i)
> +{
> +	*i = 0;
> +	return 0;
> +}
> +
> +static int vidioc_queryctrl(struct file *file, void *priv,
> +			    struct v4l2_queryctrl *qc)
> +{
> +	return -EINVAL;
> +}

Huh? Why is this needed?

> +
> +static int vidioc_parm(struct file *file, void *priv,
> +			 struct v4l2_streamparm *parm)
> +{
> +	struct mgb4_vin_dev *vindev = video_drvdata(file);
> +	struct v4l2_fract timeperframe = {
> +		.numerator = vindev->period,
> +		.denominator = 125000000,
> +	};
> +
> +	if (parm->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
> +		return -EINVAL;
> +
> +	parm->parm.capture.readbuffers = 2;
> +	parm->parm.capture.capability = V4L2_CAP_TIMEPERFRAME;
> +	parm->parm.capture.timeperframe = timeperframe;
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_ioctl_ops video_ioctl_ops = {
> +	.vidioc_querycap = vidioc_querycap,
> +	.vidioc_enum_fmt_vid_cap = vidioc_enum_fmt,
> +	.vidioc_try_fmt_vid_cap = vidioc_fmt,
> +	.vidioc_s_fmt_vid_cap = vidioc_fmt,
> +	.vidioc_g_fmt_vid_cap = vidioc_fmt,
> +	.vidioc_enum_framesizes = vidioc_enum_framesizes,
> +	.vidioc_enum_frameintervals = vidioc_enum_frameintervals,
> +	.vidioc_enum_input = vidioc_enum_input,
> +	.vidioc_g_input = vidioc_g_input,
> +	.vidioc_s_input = vidioc_s_input,
> +	.vidioc_queryctrl = vidioc_queryctrl,
> +	.vidioc_reqbufs = vb2_ioctl_reqbufs,
> +	.vidioc_create_bufs = vb2_ioctl_create_bufs,
> +	.vidioc_querybuf = vb2_ioctl_querybuf,
> +	.vidioc_qbuf = vb2_ioctl_qbuf,
> +	.vidioc_dqbuf = vb2_ioctl_dqbuf,

I'm missing vidioc_prepare_buf.

> +	.vidioc_expbuf = vb2_ioctl_expbuf,
> +	.vidioc_streamon = vb2_ioctl_streamon,
> +	.vidioc_streamoff = vb2_ioctl_streamoff,
> +	.vidioc_g_parm = vidioc_parm,
> +	.vidioc_s_parm = vidioc_parm
> +};
> +
> +static void dma_transfer(struct work_struct *work)
> +{
> +	struct mgb4_vin_dev *vindev = container_of(work, struct mgb4_vin_dev, dma_work);
> +	struct device *dev = &vindev->mgbdev->pdev->dev;
> +	struct frame_buffer *buf = 0;
> +	unsigned long flags;
> +	u32 addr;
> +
> +
> +	spin_lock_irqsave(&vindev->qlock, flags);
> +	if (!list_empty(&vindev->buf_list)) {
> +		buf = list_first_entry(&vindev->buf_list, struct frame_buffer, list);
> +		list_del_init(vindev->buf_list.next);
> +	}
> +	spin_unlock_irqrestore(&vindev->qlock, flags);
> +
> +	if (!buf)
> +		return;
> +
> +
> +	addr = mgb4_read_reg(&vindev->mgbdev->video, vindev->config->regs.address);
> +	if (addr >= ERR_QUEUE_FULL) {
> +		dev_warn(dev, "frame queue error (%d)\n", (int)addr);
> +		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
> +		return;
> +	}
> +
> +	if (mgb4_dma_transfer(vindev->mgbdev, vindev->config->dma_channel,
> +	  false, addr, vb2_dma_sg_plane_desc(&buf->vb.vb2_buf, 0)) < 0) {
> +		dev_warn(dev, "DMA transfer error\n");
> +		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
> +	} else {
> +		buf->vb.vb2_buf.timestamp = ktime_get_ns();
> +		buf->vb.sequence = vindev->sequence++;
> +		buf->vb.field = V4L2_FIELD_NONE;
> +		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
> +	}
> +}
> +
> +static irqreturn_t vin_handler(int irq, void *ctx)
> +{
> +	struct mgb4_vin_dev *vindev = (struct mgb4_vin_dev *)ctx;
> +
> +	schedule_work(&vindev->dma_work);
> +
> +	mgb4_write_reg(&vindev->mgbdev->video, 0xB4, 1U<<vindev->config->vin_irq);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t err_handler(int irq, void *ctx)
> +{
> +	struct mgb4_vin_dev *vindev = (struct mgb4_vin_dev *)ctx;
> +	struct device *dev = &vindev->mgbdev->pdev->dev;
> +	struct vb2_queue *vq = &(vindev->queue);
> +
> +	u32 resolution = mgb4_read_reg(&vindev->mgbdev->video,
> +	  vindev->config->regs.resolution);
> +
> +	if ((vindev->width != (resolution >> 16))
> +	  || (vindev->height != (resolution & 0xFFFF))) {
> +		dev_warn(dev, "stream changed (%ux%u -> %ux%u)\n",
> +			 vindev->width, vindev->height, resolution>>16,
> +			 resolution & 0xFFFF);
> +
> +		if (vb2_is_streaming(vq)) {
> +			return_all_buffers(vindev, VB2_BUF_STATE_ERROR);
> +			vb2_queue_error(vq);
> +		}
> +	}
> +
> +	mgb4_write_reg(&vindev->mgbdev->video, 0xB4, 1U<<vindev->config->err_irq);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int deser_init(struct mgb4_vin_dev *vindev, int id)
> +{
> +	int rv, addr_size;
> +	size_t values_count;
> +	const struct mgb4_i2c_kv *values;
> +	const struct i2c_board_info *info;
> +	struct device *dev = &vindev->mgbdev->pdev->dev;
> +
> +
> +	if (MGB4_IS_GMSL(vindev->mgbdev)) {
> +		info = &gmsl_deser_info[id];
> +		addr_size = 16;
> +		values = gmsl_i2c;
> +		values_count = ARRAY_SIZE(gmsl_i2c);
> +	} else {
> +		info = &fpdl3_deser_info[id];
> +		addr_size = 8;
> +		values = fpdl3_i2c;
> +		values_count = ARRAY_SIZE(fpdl3_i2c);
> +	}
> +
> +	rv = mgb4_i2c_init(&vindev->deser, vindev->mgbdev->i2c_adap, info, addr_size);
> +	if (rv < 0) {
> +		dev_err(dev, "failed to create deserializer\n");
> +		return rv;
> +	}
> +	rv = mgb4_i2c_configure(&vindev->deser, values, values_count);
> +	if (rv < 0) {
> +		dev_err(dev, "failed to configure deserializer\n");
> +		goto err_i2c_dev;
> +	}
> +
> +	return 0;
> +
> +err_i2c_dev:
> +	mgb4_i2c_free(&vindev->deser);
> +
> +	return rv;
> +}
> +
> +struct mgb4_vin_dev *mgb4_vin_create(struct mgb4_dev *mgbdev, int id)
> +{
> +	int rv;
> +	struct device_attribute **attr, **module_attr;
> +	struct mgb4_vin_dev *vindev;
> +	struct pci_dev *pdev = mgbdev->pdev;
> +	struct device *dev = &pdev->dev;
> +	int vin_irq, err_irq;
> +
> +	vindev = kzalloc(sizeof(struct mgb4_vin_dev), GFP_KERNEL);
> +	if (!vindev)
> +		return NULL;
> +
> +	vindev->mgbdev = mgbdev;
> +	vindev->config = &(vin_cfg[id]);
> +
> +	/* Frame queue*/
> +	INIT_LIST_HEAD(&vindev->buf_list);
> +	spin_lock_init(&vindev->qlock);
> +
> +	/* DMA transfer stuff */
> +	INIT_WORK(&vindev->dma_work, dma_transfer);
> +
> +	/* IRQ callback */
> +	vin_irq = xdma_get_user_irq(mgbdev->xdev, vindev->config->vin_irq);
> +	rv = request_irq(vin_irq, vin_handler, 0, "mgb4-vin", vindev);
> +	if (rv) {
> +		dev_err(dev, "failed to register vin irq handler\n");
> +		goto err_alloc;
> +	}
> +	/* Error IRQ callback */
> +	err_irq = xdma_get_user_irq(mgbdev->xdev, vindev->config->err_irq);
> +	rv = request_irq(err_irq, err_handler, 0, "mgb4-err", vindev);
> +	if (rv) {
> +		dev_err(dev, "failed to register err irq handler\n");
> +		goto err_vin_irq;
> +	}
> +
> +	/* V4L2 */
> +	rv = v4l2_device_register(dev, &vindev->v4l2dev);
> +	if (rv) {
> +		dev_err(dev, "failed to register v4l2 device\n");
> +		goto err_err_irq;
> +	}
> +
> +	mutex_init(&vindev->lock);
> +
> +	vindev->queue.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> +	vindev->queue.io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF | VB2_READ;

Please drop USERPTR: it's not something modern drivers should enable.

> +	vindev->queue.buf_struct_size = sizeof(struct frame_buffer);
> +	vindev->queue.ops = &queue_ops;
> +	vindev->queue.mem_ops = &vb2_dma_sg_memops;
> +	vindev->queue.gfp_flags = GFP_DMA32;

Is the DMA indeed only 32 bits? It's a bit unexpected.

> +	vindev->queue.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> +	vindev->queue.min_buffers_needed = 2;
> +	vindev->queue.drv_priv = vindev;
> +	vindev->queue.lock = &vindev->lock;
> +	vindev->queue.dev = dev;
> +	rv = vb2_queue_init(&vindev->queue);
> +	if (rv) {
> +		dev_err(dev, "failed to initialize vb2 queue\n");
> +		goto err_v4l2_dev;
> +	}
> +
> +	snprintf(vindev->vdev.name, sizeof(vindev->vdev.name), "mgb4-in%d", id+1);
> +	vindev->vdev.device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_READWRITE
> +	  | V4L2_CAP_STREAMING;
> +	vindev->vdev.fops = &video_fops;
> +	vindev->vdev.ioctl_ops = &video_ioctl_ops;
> +	vindev->vdev.release = video_device_release_empty;
> +	vindev->vdev.v4l2_dev = &vindev->v4l2dev;
> +	vindev->vdev.lock = &vindev->lock;
> +	vindev->vdev.queue = &vindev->queue;
> +	video_set_drvdata(&vindev->vdev, vindev);
> +
> +	rv = video_register_device(&vindev->vdev, VFL_TYPE_GRABBER, -1);
> +	if (rv) {
> +		dev_err(dev, "failed to register video device\n");
> +		goto err_v4l2_dev;
> +	}
> +
> +	/* Deserializer */
> +	rv = deser_init(vindev, id);
> +	if (rv)
> +		goto err_video_dev;
> +
> +	/* Set FPGA regs to comply with the deserializer state */
> +	mgb4_mask_reg(&vindev->mgbdev->video, vindev->config->regs.config,
> +	  1U<<9, 1U<<9);
> +
> +	/* Module sysfs attributes */
> +	vindev->alignment = 1;
> +	module_attr = MGB4_IS_GMSL(mgbdev)
> +	  ? mgb4_gmsl_in_attrs : mgb4_fpdl3_in_attrs;
> +	for (attr = module_attr; *attr; attr++)
> +		device_create_file(&vindev->vdev.dev, *attr);
> +
> +	return vindev;
> +
> +err_video_dev:
> +	video_unregister_device(&vindev->vdev);
> +err_v4l2_dev:
> +	v4l2_device_unregister(&vindev->v4l2dev);
> +err_err_irq:
> +	free_irq(err_irq, vindev);
> +err_vin_irq:
> +	free_irq(vin_irq, vindev);
> +err_alloc:
> +	kfree(vindev);
> +
> +	return NULL;
> +}
> +
> +void mgb4_vin_free(struct mgb4_vin_dev *vindev)
> +{
> +	struct device_attribute **attr, **module_attr;
> +	int vin_irq = xdma_get_user_irq(vindev->mgbdev->xdev,
> +					vindev->config->vin_irq);
> +	int err_irq = xdma_get_user_irq(vindev->mgbdev->xdev,
> +					vindev->config->err_irq);
> +
> +	free_irq(vin_irq, vindev);
> +	free_irq(err_irq, vindev);
> +
> +	module_attr = MGB4_IS_GMSL(vindev->mgbdev)
> +	  ? mgb4_gmsl_in_attrs : mgb4_fpdl3_in_attrs;
> +	for (attr = module_attr; *attr; attr++)
> +		device_remove_file(&vindev->vdev.dev, *attr);
> +
> +	mgb4_i2c_free(&vindev->deser);
> +	video_unregister_device(&vindev->vdev);
> +	v4l2_device_unregister(&vindev->v4l2dev);
> +
> +	kfree(vindev);
> +}
> diff --git a/drivers/media/pci/mgb4/mgb4_vin.h b/drivers/media/pci/mgb4/mgb4_vin.h
> new file mode 100644
> index 000000000000..4b01b61c3f90
> --- /dev/null
> +++ b/drivers/media/pci/mgb4/mgb4_vin.h
> @@ -0,0 +1,64 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2021-2022 Digiteq Automotive
> + *     author: Martin Tuma <martin.tuma@digiteqautomotive.com>
> + */
> +
> +#ifndef __MGB4_VIN_H__
> +#define __MGB4_VIN_H__
> +
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-dev.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/videobuf2-core.h>
> +#include "mgb4_i2c.h"
> +
> +struct mgb4_vin_regs {
> +	u32 address;
> +	u32 config;
> +	u32 status;
> +	u32 resolution;
> +	u32 frame_period;
> +	u32 sync;
> +	u32 pclk;
> +	u32 signal;
> +	u32 signal2;
> +	u32 padding;
> +};
> +
> +struct mgb4_vin_config {
> +	int id;
> +	int dma_channel;
> +	int vin_irq;
> +	int err_irq;
> +	struct mgb4_vin_regs regs;
> +};
> +
> +struct mgb4_vin_dev {
> +	struct mgb4_dev *mgbdev;
> +	struct v4l2_device v4l2dev;
> +	struct video_device vdev;
> +	struct vb2_queue queue;
> +	struct mutex lock;
> +
> +	spinlock_t qlock;
> +	struct list_head buf_list;
> +	struct work_struct dma_work;
> +
> +	unsigned int sequence;
> +
> +	u32 width;
> +	u32 height;
> +	u32 period;
> +	u32 freq_range;
> +	u32 alignment;
> +
> +	struct mgb4_i2c_client deser;
> +
> +	const struct mgb4_vin_config *config;
> +};
> +
> +extern struct mgb4_vin_dev *mgb4_vin_create(struct mgb4_dev *mgbdev, int id);
> +extern void mgb4_vin_free(struct mgb4_vin_dev *vindev);
> +
> +#endif
> diff --git a/drivers/media/pci/mgb4/mgb4_vout.c b/drivers/media/pci/mgb4/mgb4_vout.c
> new file mode 100644
> index 000000000000..542ff059c67f
> --- /dev/null
> +++ b/drivers/media/pci/mgb4/mgb4_vout.c
> @@ -0,0 +1,507 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2021-2022 Digiteq Automotive
> + *     author: Martin Tuma <martin.tuma@digiteqautomotive.com>
> + */
> +
> +#include <linux/pci.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/videobuf2-v4l2.h>
> +#include <media/videobuf2-dma-sg.h>
> +#include <linux/dma/amd_xdma.h>
> +#include "mgb4_core.h"
> +#include "mgb4_dma.h"
> +#include "mgb4_sysfs.h"
> +#include "mgb4_io.h"
> +#include "mgb4_vout.h"
> +
> +#define DEFAULT_WIDTH     1280
> +#define DEFAULT_HEIGHT    640
> +#define DEFAULT_PERIOD    (125000000 / 60)
> +
> +static const struct mgb4_vout_config vout_cfg[] = {
> +	{0, 0, 8, {0x78, 0x60, 0x64, 0x68, 0x74, 0x6C, 0x70, 0x7c}},
> +	{1, 1, 9, {0x98, 0x80, 0x84, 0x88, 0x94, 0x8c, 0x90, 0x9c}}
> +};
> +
> +static const struct i2c_board_info fpdl3_ser_info[] = {
> +	{I2C_BOARD_INFO("serializer1", 0x14)},
> +	{I2C_BOARD_INFO("serializer2", 0x16)},
> +};
> +
> +static const struct mgb4_i2c_kv fpdl3_i2c[] = {
> +	{0x05, 0xFF, 0x04}, {0x06, 0xFF, 0x01}, {0xC2, 0xFF, 0x80}
> +};
> +
> +static int queue_setup(struct vb2_queue *q, unsigned int *nbuffers,
> +		       unsigned int *nplanes, unsigned int sizes[],
> +		       struct device *alloc_devs[])
> +{
> +	struct mgb4_vout_dev *voutdev = vb2_get_drv_priv(q);
> +	unsigned long size = BYTESPERLINE(voutdev->width, voutdev->alignment)
> +	  * voutdev->height;
> +
> +	if (*nbuffers < 2)
> +		*nbuffers = 2;
> +
> +	if (*nplanes)
> +		return sizes[0] < size ? -EINVAL : 0;
> +	*nplanes = 1;
> +	sizes[0] = size;
> +
> +	return 0;
> +}
> +
> +static int buffer_init(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +	struct frame_buffer *buf = to_frame_buffer(vbuf);
> +
> +	INIT_LIST_HEAD(&buf->list);
> +
> +	return 0;
> +}
> +
> +static int buffer_prepare(struct vb2_buffer *vb)
> +{
> +	struct mgb4_vout_dev *voutdev = vb2_get_drv_priv(vb->vb2_queue);
> +	struct device *dev = &voutdev->mgbdev->pdev->dev;
> +	unsigned long size = BYTESPERLINE(voutdev->width, voutdev->alignment)
> +	  * voutdev->height;
> +
> +	if (vb2_plane_size(vb, 0) < size) {
> +		dev_err(dev, "buffer too small (%lu < %lu)\n",
> +			vb2_plane_size(vb, 0), size);
> +		return -EINVAL;
> +	}
> +
> +	vb2_set_plane_payload(vb, 0, size);
> +
> +	return 0;
> +}
> +
> +static void buffer_queue(struct vb2_buffer *vb)
> +{
> +	struct mgb4_vout_dev *vindev = vb2_get_drv_priv(vb->vb2_queue);
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +	struct frame_buffer *buf = to_frame_buffer(vbuf);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&vindev->qlock, flags);
> +	list_add_tail(&buf->list, &vindev->buf_list);
> +	spin_unlock_irqrestore(&vindev->qlock, flags);
> +}
> +
> +static void stop_streaming(struct vb2_queue *vq)
> +{
> +	struct mgb4_vout_dev *voutdev = vb2_get_drv_priv(vq);
> +	struct frame_buffer *buf, *node;
> +	int irq = xdma_get_user_irq(voutdev->mgbdev->xdev, voutdev->config->irq);
> +	unsigned long flags;
> +
> +	xdma_disable_user_irq(voutdev->mgbdev->xdev, irq);
> +
> +	cancel_work_sync(&voutdev->dma_work);
> +
> +	mgb4_mask_reg(&voutdev->mgbdev->video, voutdev->config->regs.config,
> +	  0x2, 0x0);
> +
> +	spin_lock_irqsave(&voutdev->qlock, flags);
> +	list_for_each_entry_safe(buf, node, &voutdev->buf_list, list) {
> +		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
> +		list_del(&buf->list);
> +	}
> +	spin_unlock_irqrestore(&voutdev->qlock, flags);
> +}
> +
> +static int start_streaming(struct vb2_queue *vq, unsigned int count)
> +{
> +	struct mgb4_vout_dev *voutdev = vb2_get_drv_priv(vq);
> +	struct device *dev = &voutdev->mgbdev->pdev->dev;
> +	struct frame_buffer *buf = 0;
> +	struct mgb4_regs *video = &voutdev->mgbdev->video;
> +	int irq = xdma_get_user_irq(voutdev->mgbdev->xdev, voutdev->config->irq);
> +	u32 addr;
> +
> +	mgb4_mask_reg(video, voutdev->config->regs.config, 0x2, 0x2);
> +
> +	addr = mgb4_read_reg(video, voutdev->config->regs.address);
> +	if (addr >= ERR_QUEUE_FULL) {
> +		dev_err(dev, "frame queue error (%d)\n", (int)addr);

You must return queued buffers with STATE_QUEUED on error in start_streaming().
Same as for the capture devices.

> +		return -EIO;
> +	}
> +
> +	if (!list_empty(&voutdev->buf_list)) {
> +		buf = list_first_entry(&voutdev->buf_list, struct frame_buffer, list);
> +		list_del_init(voutdev->buf_list.next);
> +	}
> +	if (!buf) {
> +		dev_err(dev, "empty v4l2 queue\n");

You can set min_buffers_needed to 1 if you need at least one buffer before
start_streaming should be called.

> +		return -EIO;
> +	}
> +
> +	if (mgb4_dma_transfer(voutdev->mgbdev, voutdev->config->dma_channel,
> +	  true, addr, vb2_dma_sg_plane_desc(&buf->vb.vb2_buf, 0)) < 0) {
> +		dev_warn(dev, "DMA transfer error\n");
> +		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
> +	} else {
> +		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
> +	}
> +
> +	xdma_enable_user_irq(voutdev->mgbdev->xdev, irq);
> +
> +	return 0;
> +}
> +
> +static const struct vb2_ops queue_ops = {
> +	.queue_setup = queue_setup,
> +	.buf_init = buffer_init,
> +	.buf_prepare = buffer_prepare,
> +	.buf_queue = buffer_queue,
> +	.start_streaming = start_streaming,
> +	.stop_streaming = stop_streaming,
> +	.wait_prepare = vb2_ops_wait_prepare,
> +	.wait_finish = vb2_ops_wait_finish
> +};
> +
> +
> +static int vidioc_querycap(struct file *file, void *priv,
> +			   struct v4l2_capability *cap)
> +{
> +	struct mgb4_vout_dev *voutdev = video_drvdata(file);
> +
> +	strscpy(cap->driver, KBUILD_MODNAME, sizeof(cap->driver));
> +	strscpy(cap->card, "MGB4 PCIe Card", sizeof(cap->card));
> +	snprintf(cap->bus_info, sizeof(cap->bus_info), "PCI:%s",
> +	  pci_name(voutdev->mgbdev->pdev));

Can be dropped.

> +
> +	return 0;
> +}
> +
> +
> +static int vidioc_enum_fmt(struct file *file, void *priv,
> +			   struct v4l2_fmtdesc *f)
> +{
> +	if (f->index != 0)
> +		return -EINVAL;
> +
> +	f->pixelformat = V4L2_PIX_FMT_ABGR32;
> +
> +	return 0;
> +}
> +
> +static int vidioc_fmt(struct file *file, void *priv, struct v4l2_format *f)
> +{
> +	struct mgb4_vout_dev *voutdev = video_drvdata(file);
> +
> +	f->fmt.pix.pixelformat = V4L2_PIX_FMT_ABGR32;
> +	f->fmt.pix.width = voutdev->width;
> +	f->fmt.pix.height = voutdev->height;
> +	f->fmt.pix.field = V4L2_FIELD_NONE;
> +	f->fmt.pix.colorspace = V4L2_COLORSPACE_RAW;
> +	f->fmt.pix.bytesperline = BYTESPERLINE(voutdev->width, voutdev->alignment);
> +	f->fmt.pix.sizeimage = f->fmt.pix.width * 4 * f->fmt.pix.height;
> +
> +	return 0;
> +}
> +
> +static int vidioc_g_output(struct file *file, void *priv, unsigned int *i)
> +{
> +	*i = 0;
> +	return 0;
> +}
> +
> +static int vidioc_s_output(struct file *file, void *priv, unsigned int i)
> +{
> +	return i ? -EINVAL : 0;
> +}
> +
> +static int vidioc_enum_output(struct file *file, void *priv, struct v4l2_output *out)
> +{
> +	if (out->index != 0)
> +		return -EINVAL;
> +
> +	out->type = V4L2_OUTPUT_TYPE_ANALOG;
> +	strscpy(out->name, "MGB4", sizeof(out->name));
> +
> +	return 0;
> +}
> +
> +static int vidioc_queryctrl(struct file *file, void *priv,
> +			    struct v4l2_queryctrl *qc)
> +{
> +	return -EINVAL;
> +}

Huh?

> +
> +static const struct v4l2_ioctl_ops video_ioctl_ops = {
> +	.vidioc_querycap = vidioc_querycap,
> +	.vidioc_enum_fmt_vid_out = vidioc_enum_fmt,
> +	.vidioc_try_fmt_vid_out = vidioc_fmt,
> +	.vidioc_s_fmt_vid_out = vidioc_fmt,
> +	.vidioc_g_fmt_vid_out = vidioc_fmt,
> +	.vidioc_enum_output = vidioc_enum_output,
> +	.vidioc_g_output = vidioc_g_output,
> +	.vidioc_s_output = vidioc_s_output,
> +	.vidioc_queryctrl = vidioc_queryctrl,
> +	.vidioc_reqbufs = vb2_ioctl_reqbufs,
> +	.vidioc_create_bufs = vb2_ioctl_create_bufs,
> +	.vidioc_querybuf = vb2_ioctl_querybuf,
> +	.vidioc_qbuf = vb2_ioctl_qbuf,
> +	.vidioc_dqbuf = vb2_ioctl_dqbuf,

Missing vidioc_prepare_buf.

> +	.vidioc_expbuf = vb2_ioctl_expbuf,
> +	.vidioc_streamon = vb2_ioctl_streamon,
> +	.vidioc_streamoff = vb2_ioctl_streamoff,
> +};
> +
> +static int fh_open(struct file *file)
> +{
> +	struct mgb4_vout_dev *voutdev = video_drvdata(file);
> +	struct mgb4_regs *video = &voutdev->mgbdev->video;
> +	u32 config, resolution;
> +	int ret;
> +
> +	ret = v4l2_fh_open(file);
> +	if (ret)
> +		return ret;
> +
> +	config = mgb4_read_reg(video, voutdev->config->regs.config);
> +	if ((config & 0xc) >> 2 != voutdev->config->id + MGB4_VIN_DEVICES)
> +		goto error;
> +
> +	resolution = mgb4_read_reg(video, voutdev->config->regs.resolution);
> +	voutdev->width = resolution >> 16;
> +	voutdev->height = resolution & 0xFFFF;
> +
> +	mgb4_write_reg(video, voutdev->config->regs.padding,
> +	  PADDING(voutdev->width, voutdev->alignment));

Same as for input: opening a video device appears to have a side-effect.

> +
> +	return 0;
> +
> +error:
> +	v4l2_fh_release(file);
> +	return -EBUSY;
> +}
> +
> +static const struct v4l2_file_operations video_fops = {
> +	.owner = THIS_MODULE,
> +	.open = fh_open,
> +	.release = vb2_fop_release,
> +	.unlocked_ioctl = video_ioctl2,
> +	.write = vb2_fop_write,
> +	.mmap = vb2_fop_mmap,
> +	.poll = vb2_fop_poll,
> +};
> +
> +static void dma_transfer(struct work_struct *work)
> +{
> +	struct mgb4_vout_dev *voutdev = container_of(work, struct mgb4_vout_dev,
> +	  dma_work);
> +	struct device *dev = &voutdev->mgbdev->pdev->dev;
> +	struct frame_buffer *buf = 0;
> +	unsigned long flags;
> +	u32 addr;
> +
> +	spin_lock_irqsave(&voutdev->qlock, flags);
> +	if (!list_empty(&voutdev->buf_list)) {
> +		buf = list_first_entry(&voutdev->buf_list, struct frame_buffer, list);
> +		list_del_init(voutdev->buf_list.next);
> +	}
> +	spin_unlock_irqrestore(&voutdev->qlock, flags);
> +
> +	if (!buf)
> +		return;
> +
> +	addr = mgb4_read_reg(&voutdev->mgbdev->video, voutdev->config->regs.address);
> +	if (addr >= ERR_QUEUE_FULL) {
> +		dev_warn(dev, "frame queue error (%d)\n", (int)addr);
> +		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
> +		return;
> +	}
> +
> +	if (mgb4_dma_transfer(voutdev->mgbdev, voutdev->config->dma_channel,
> +	  true, addr, vb2_dma_sg_plane_desc(&buf->vb.vb2_buf, 0)) < 0) {
> +		dev_warn(dev, "DMA transfer error\n");
> +		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
> +	} else {
> +		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
> +	}
> +}
> +
> +static irqreturn_t handler(int irq, void *ctx)
> +{
> +	struct mgb4_vout_dev *voutdev = (struct mgb4_vout_dev *)ctx;
> +
> +	schedule_work(&voutdev->dma_work);
> +
> +	mgb4_write_reg(&voutdev->mgbdev->video, 0xB4, 1U<<voutdev->config->irq);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int ser_init(struct mgb4_vout_dev *voutdev, int id)
> +{
> +	int rv, addr_size;
> +	size_t values_count;
> +	const struct mgb4_i2c_kv *values;
> +	const struct i2c_board_info *info;
> +	struct device *dev = &voutdev->mgbdev->pdev->dev;
> +
> +
> +	if (MGB4_IS_GMSL(voutdev->mgbdev))
> +		return 0;
> +
> +	info = &fpdl3_ser_info[id];
> +	addr_size = 8;
> +	values = fpdl3_i2c;
> +	values_count = ARRAY_SIZE(fpdl3_i2c);
> +
> +	rv = mgb4_i2c_init(&voutdev->ser, voutdev->mgbdev->i2c_adap, info, addr_size);
> +	if (rv < 0) {
> +		dev_err(dev, "failed to create serializer\n");
> +		return rv;
> +	}
> +	rv = mgb4_i2c_configure(&voutdev->ser, values, values_count);
> +	if (rv < 0) {
> +		dev_err(dev, "failed to configure serializer\n");
> +		goto err_i2c_dev;
> +	}
> +
> +	return 0;
> +
> +err_i2c_dev:
> +	mgb4_i2c_free(&voutdev->ser);
> +
> +	return rv;
> +}
> +
> +struct mgb4_vout_dev *mgb4_vout_create(struct mgb4_dev *mgbdev, int id)
> +{
> +	int rv, irq;
> +	struct device_attribute **attr, **module_attr;
> +	struct mgb4_vout_dev *voutdev;
> +	struct mgb4_regs *video;
> +	struct pci_dev *pdev = mgbdev->pdev;
> +	struct device *dev = &pdev->dev;
> +
> +	voutdev = kzalloc(sizeof(struct mgb4_vout_dev), GFP_KERNEL);
> +	if (!voutdev)
> +		return NULL;
> +
> +	voutdev->mgbdev = mgbdev;
> +	voutdev->config = &(vout_cfg[id]);
> +	video = &voutdev->mgbdev->video;
> +
> +	/* Frame queue*/
> +	INIT_LIST_HEAD(&voutdev->buf_list);
> +	spin_lock_init(&voutdev->qlock);
> +
> +	/* DMA transfer stuff */
> +	INIT_WORK(&voutdev->dma_work, dma_transfer);
> +
> +	/* IRQ callback */
> +	irq = xdma_get_user_irq(mgbdev->xdev, voutdev->config->irq);
> +	rv = request_irq(irq, handler, 0, "mgb4-vout", voutdev);
> +	if (rv) {
> +		dev_err(dev, "failed to register irq handler\n");
> +		goto err_alloc;
> +	}
> +
> +	/* V4L2 */
> +	rv = v4l2_device_register(dev, &voutdev->v4l2dev);
> +	if (rv) {
> +		dev_err(dev, "failed to register v4l2 device\n");
> +		goto err_irq;
> +	}
> +
> +	mutex_init(&voutdev->lock);
> +
> +	voutdev->queue.type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
> +	voutdev->queue.io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF | VB2_WRITE;

Drop USERPTR.

General note (both for video capture and output): while it does doesn't hurt to
support read() or write(), it is unusual in modern drivers, and since read/write
support involves a memcpy for each buffer, it is also quite inefficient.

You might want to drop support for that.

> +	voutdev->queue.buf_struct_size = sizeof(struct frame_buffer);
> +	voutdev->queue.ops = &queue_ops;
> +	voutdev->queue.mem_ops = &vb2_dma_sg_memops;
> +	voutdev->queue.gfp_flags = GFP_DMA32;
> +	voutdev->queue.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> +	voutdev->queue.min_buffers_needed = 2;

Ah, you set this already. Then the check in start_streaming of whether there
is a buffer queued can be dropped.

> +	voutdev->queue.drv_priv = voutdev;
> +	voutdev->queue.lock = &voutdev->lock;
> +	voutdev->queue.dev = dev;
> +	rv = vb2_queue_init(&voutdev->queue);
> +	if (rv) {
> +		dev_err(dev, "failed to initialize vb2 queue\n");
> +		goto err_v4l2_dev;
> +	}
> +
> +	snprintf(voutdev->vdev.name, sizeof(voutdev->vdev.name), "mgb4-out%d", id+1);
> +	voutdev->vdev.device_caps = V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_READWRITE
> +	  | V4L2_CAP_STREAMING;
> +	voutdev->vdev.vfl_dir = VFL_DIR_TX;
> +	voutdev->vdev.fops = &video_fops;
> +	voutdev->vdev.ioctl_ops = &video_ioctl_ops;
> +	voutdev->vdev.release = video_device_release_empty;
> +	voutdev->vdev.v4l2_dev = &voutdev->v4l2dev;
> +	voutdev->vdev.lock = &voutdev->lock;
> +	voutdev->vdev.queue = &voutdev->queue;
> +	video_set_drvdata(&voutdev->vdev, voutdev);
> +
> +	rv = video_register_device(&voutdev->vdev, VFL_TYPE_GRABBER, -1);
> +	if (rv) {
> +		dev_err(dev, "failed to register video device\n");
> +		goto err_v4l2_dev;
> +	}
> +
> +	/* Serializer */
> +	rv = ser_init(voutdev, id);
> +	if (rv)
> +		goto err_video_dev;
> +
> +	/* Set the FPGA registers default values */
> +	mgb4_mask_reg(video, voutdev->config->regs.config, 0xc,
> +	  (voutdev->config->id + MGB4_VIN_DEVICES) << 2);
> +	mgb4_write_reg(video, voutdev->config->regs.resolution,
> +	  (DEFAULT_WIDTH << 16) | DEFAULT_HEIGHT);
> +	mgb4_write_reg(video, voutdev->config->regs.frame_period,
> +	  DEFAULT_PERIOD);
> +
> +	/* Module sysfs attributes */
> +	voutdev->alignment = 1;
> +	module_attr = MGB4_IS_GMSL(mgbdev)
> +	  ? mgb4_gmsl_out_attrs : mgb4_fpdl3_out_attrs;
> +	for (attr = module_attr; *attr; attr++)
> +		device_create_file(&voutdev->vdev.dev, *attr);
> +
> +	/* Set the output frequency according to the FPGA defaults */
> +	voutdev->freq = 70000;
> +
> +	return voutdev;
> +
> +err_video_dev:
> +	video_unregister_device(&voutdev->vdev);
> +err_v4l2_dev:
> +	v4l2_device_unregister(&voutdev->v4l2dev);
> +err_irq:
> +	free_irq(irq, voutdev);
> +err_alloc:
> +	kfree(voutdev);
> +
> +	return NULL;
> +}
> +
> +void mgb4_vout_free(struct mgb4_vout_dev *voutdev)
> +{
> +	struct device_attribute **attr, **module_attr;
> +	int irq = xdma_get_user_irq(voutdev->mgbdev->xdev, voutdev->config->irq);
> +
> +	free_irq(irq, voutdev);
> +
> +	module_attr = MGB4_IS_GMSL(voutdev->mgbdev)
> +	  ? mgb4_gmsl_out_attrs : mgb4_fpdl3_out_attrs;
> +	for (attr = module_attr; *attr; attr++)
> +		device_remove_file(&voutdev->vdev.dev, *attr);
> +
> +	mgb4_i2c_free(&voutdev->ser);
> +	video_unregister_device(&voutdev->vdev);
> +	v4l2_device_unregister(&voutdev->v4l2dev);
> +
> +	kfree(voutdev);
> +}
> diff --git a/drivers/media/pci/mgb4/mgb4_vout.h b/drivers/media/pci/mgb4/mgb4_vout.h
> new file mode 100644
> index 000000000000..902b6b8deb21
> --- /dev/null
> +++ b/drivers/media/pci/mgb4/mgb4_vout.h
> @@ -0,0 +1,58 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2021-2022 Digiteq Automotive
> + *     author: Martin Tuma <martin.tuma@digiteqautomotive.com>
> + */
> +
> +#ifndef __MGB4_VOUT_H__
> +#define __MGB4_VOUT_H__
> +
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-dev.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/videobuf2-core.h>
> +#include "mgb4_i2c.h"
> +
> +struct mgb4_vout_regs {
> +	u32 address;
> +	u32 config;
> +	u32 status;
> +	u32 resolution;
> +	u32 frame_period;
> +	u32 hsync;
> +	u32 vsync;
> +	u32 padding;
> +};
> +
> +struct mgb4_vout_config {
> +	int id;
> +	int dma_channel;
> +	int irq;
> +	struct mgb4_vout_regs regs;
> +};
> +
> +struct mgb4_vout_dev {
> +	struct mgb4_dev *mgbdev;
> +	struct v4l2_device v4l2dev;
> +	struct video_device vdev;
> +	struct vb2_queue queue;
> +	struct mutex lock;
> +
> +	spinlock_t qlock;
> +	struct list_head buf_list;
> +	struct work_struct dma_work;
> +
> +	u32 width;
> +	u32 height;
> +	u32 freq;
> +	u32 alignment;
> +
> +	struct mgb4_i2c_client ser;
> +
> +	const struct mgb4_vout_config *config;
> +};
> +
> +extern struct mgb4_vout_dev *mgb4_vout_create(struct mgb4_dev *mgbdev, int id);
> +extern void mgb4_vout_free(struct mgb4_vout_dev *voutdev);
> +
> +#endif

General note: add some comments at the top of each source explaining what
it does.

Regards,

	Hans
