Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64F126194BC
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Nov 2022 11:45:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229779AbiKDKpQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Nov 2022 06:45:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbiKDKpP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Nov 2022 06:45:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 782A02654F;
        Fri,  4 Nov 2022 03:45:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1FC6C6210B;
        Fri,  4 Nov 2022 10:45:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FDE6C433D6;
        Fri,  4 Nov 2022 10:45:11 +0000 (UTC)
Message-ID: <52532fda-6863-6658-4ad5-a4dbc2607a1c@xs4all.nl>
Date:   Fri, 4 Nov 2022 11:45:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v3 0/2] Digiteq Automotive MGB4 driver
Content-Language: en-US
To:     tumic@gpxsee.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, Lizhi Hou <lizhi.hou@amd.com>,
        =?UTF-8?Q?Martin_T=c5=afma?= <martin.tuma@digiteqautomotive.com>
References: <20221018140338.7080-1-tumic@gpxsee.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20221018140338.7080-1-tumic@gpxsee.org>
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
> Hi,
> This series of patches adds a driver for the Digiteq Automotive MGB4 grabber
> card. MGB4 is a modular frame grabber PCIe card for automotive video interfaces
> (FPD-Link and GMSL for now). It is based on a Xilinx FPGA and uses their
> XDMA IP core for DMA transfers. Additionally, Xilinx I2C and SPI IP cores
> which already have drivers in linux are used in the design.
> 
> The driver is a quite standard v4l2 driver, with one exception - there are
> a lot of sysfs options that may/must be set before opening the v4l2 device
> to adapt the card on a specific signal (see mgb4.rst for details)
> as the card must be able to work with various signal sources (or displays)
> that can not be auto-detected.
> 
> I have run the driver through the v4l2-compliance test suite for both the
> input and the output and the results look fine to me (I can provide the
> output if required).

Please do! Did you use the latest v4l2-compliance code from the v4l-utils
git repo? Distros tend to have a too-old version.

Regards,

	Hans

> 
> The patch requires the new XDMA v8 driver from Xilinx/AMD from the dmaengine
> mailing list to compile/work:
> https://www.spinics.net/lists/dmaengine/msg31476.html
> 
> 
> Changes in v3:
> * Rebased the DMA transfers part to use the new XDMA driver from Xilinx/AMD
> 
> Changes in v2:
> * Completely rewritten the original Xilinx's XDMA driver to meet kernel code
>   standards.
> * Added all required "to" and "cc" mail addresses.
> 
> Martin Tůma (2):
>   i2c: xiic: Added platform module alias for the xiic I2C driver
>   Added Digiteq Automotive MGB4 driver
> 
>  Documentation/admin-guide/media/mgb4.rst      | 342 ++++++++
>  .../admin-guide/media/pci-cardlist.rst        |   1 +
>  .../admin-guide/media/v4l-drivers.rst         |   1 +
>  MAINTAINERS                                   |   7 +
>  drivers/i2c/busses/i2c-xiic.c                 |   1 +
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
>  30 files changed, 4832 insertions(+)
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

