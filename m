Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04A68F134A
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2019 11:07:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726755AbfKFKG5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Nov 2019 05:06:57 -0500
Received: from gofer.mess.org ([88.97.38.141]:45907 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725856AbfKFKG5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 6 Nov 2019 05:06:57 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 5EF88C635F; Wed,  6 Nov 2019 10:06:55 +0000 (GMT)
Date:   Wed, 6 Nov 2019 10:06:55 +0000
From:   Sean Young <sean@mess.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC PATCH 00/12] i2c: replace i2c_new_probed_device with an
 ERR_PTR variant
Message-ID: <20191106100655.GA2743@gofer.mess.org>
References: <20191106095033.25182-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191106095033.25182-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Nov 06, 2019 at 10:50:18AM +0100, Wolfram Sang wrote:
> From: Wolfram Sang <wsa@the-dreams.de>
> 
> In the on-going mission to let i2c_new_* calls return an ERR_PTR instead
> of NULL, here is a series converting i2c_new_probed_device(). A new
> function called i2c_new_scanned_device() is introduced with the new
> retval, but for now, a compatibility helper is provided until all users
> are converted. The rest of the patches convert all current in-tree
> users.
> 
> Note that these patches are RFC because I want feedback on the approach
> and hopefully collect acks on the driver conversions. If all goes well,
> I'll apply the first two patches for the next merge window. Then, once
> this dependency is upstream, I'll resend this series with all issues
> fixed and acks collected.

The patches to drivers/media/pci/* are all IR related which have touched
on/read over the years. So, for those:

Acked-by: Sean Young <sean@mess.org>

> 
> Core changes tested on a Renesas Salvator-XS board (R-Car M3-N), driver
> patches build tested by me and buildbot.
> 
> Wolfram Sang (12):
>   i2c: replace i2c_new_probed_device with an ERR_PTR variant
>   i2c: icy: convert to i2c_new_scanned_device
>   macintosh: convert to i2c_new_scanned_device
>   platform: chrome: convert to i2c_new_scanned_device
>   video: fbdev: matrox: convert to i2c_new_scanned_device
>   input: mouse: convert to i2c_new_scanned_device
>   media: pci: cx23885: convert to i2c_new_scanned_device
>   media: pci: cx88: convert to i2c_new_scanned_device
>   media: pci: bt8xx: convert to i2c_new_scanned_device
>   media: pci: cx18: convert to i2c_new_scanned_device
>   media: pci: ivtv: convert to i2c_new_scanned_device
>   media: v4l2-core: convert to i2c_new_scanned_device
> 
>  Documentation/i2c/instantiating-devices.rst | 10 ++++-----
>  Documentation/i2c/writing-clients.rst       |  8 +++----
>  drivers/i2c/busses/i2c-icy.c                |  8 +++----
>  drivers/i2c/i2c-core-base.c                 | 25 ++++++++++++++++-----
>  drivers/input/mouse/psmouse-smbus.c         |  8 ++++---
>  drivers/macintosh/therm_windtunnel.c        |  4 ++--
>  drivers/media/pci/bt8xx/bttv-input.c        |  6 ++---
>  drivers/media/pci/cx18/cx18-i2c.c           |  2 +-
>  drivers/media/pci/cx23885/cx23885-i2c.c     |  4 ++--
>  drivers/media/pci/cx88/cx88-input.c         |  2 +-
>  drivers/media/pci/ivtv/ivtv-i2c.c           |  6 ++---
>  drivers/media/pci/ivtv/ivtv-i2c.h           |  2 +-
>  drivers/media/v4l2-core/v4l2-i2c.c          | 10 ++++-----
>  drivers/platform/chrome/chromeos_laptop.c   | 18 ++++++++-------
>  drivers/video/fbdev/matrox/i2c-matroxfb.c   |  4 ++--
>  include/linux/i2c.h                         | 12 +++++++---
>  16 files changed, 76 insertions(+), 53 deletions(-)
> 
> -- 
> 2.20.1
