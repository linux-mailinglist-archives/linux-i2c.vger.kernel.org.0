Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72D4F24441B
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Aug 2020 06:13:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbgHNEMy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Aug 2020 00:12:54 -0400
Received: from mga05.intel.com ([192.55.52.43]:5357 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725989AbgHNEMx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 14 Aug 2020 00:12:53 -0400
IronPort-SDR: IRW1bLfrj70Um1n/PfwYBPHwNketQy8NiPSEwm9Yo6L0p5Wz7AmlyVkn6hXY856qH31c/LLhW7
 e1X7PuKc7E7Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="239187274"
X-IronPort-AV: E=Sophos;i="5.76,310,1592895600"; 
   d="scan'208";a="239187274"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2020 21:12:51 -0700
IronPort-SDR: j4WTcdDJiAbV6JLYG0YDoKEtwkNNygEDyanQWK+d3YFITCeCaszJ1q0Tls2xxKo5z55O5Yv4B1
 UkUBJAGLU0XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,310,1592895600"; 
   d="scan'208";a="318760365"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.196]) ([10.238.232.196])
  by fmsmga004.fm.intel.com with ESMTP; 13 Aug 2020 21:12:47 -0700
Subject: Re: [PATCH v5 0/6] Support running driver's probe for a device
 powered off
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rajmohan.mani@intel.com, Tomasz Figa <tfiga@chromium.org>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
References: <20200810142747.12400-1-sakari.ailus@linux.intel.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <5353041e-850f-05ad-3b20-35e91fc9501e@linux.intel.com>
Date:   Fri, 14 Aug 2020 12:11:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200810142747.12400-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 8/10/20 10:27 PM, Sakari Ailus wrote:
> Hi all,
> 
...snip...
> 
> The use case is such that there is a privacy LED next to an integrated
> user-facing laptop camera, and this LED is there to signal the user that
> the camera is recording a video or capturing images. That LED also happens
> to be wired to one of the power supplies of the camera, so whenever you
> power on the camera, the LED will be lit, whether images are captured from
> the camera --- or not. There's no way to implement this differently
> without additional software control (allowing of which is itself a
> hardware design decision) on most CSI-2-connected camera sensors as they
> simply have no pin to signal the camera streaming state.
> 
> This is also what happens during driver probe: the camera will be powered
> on by the I²C subsystem calling dev_pm_domain_attach() and the device is
> already powered on when the driver's own probe function is called. To the
> user this visible during the boot process as a blink of the privacy LED,
> suggesting that the camera is recording without the user having used an
> application to do that. From the end user's point of view the behaviour is
> not expected and for someone unfamiliar with internal workings of a
> computer surely seems quite suspicious --- even if images are not being
> actually captured.
> 
> I've tested these on linux-next master. They also apply to Wolfram's
> i2c/for-next branch, there's a patch that affects the I²C core changes
> here (see below). The patches apart from that apply to Bartosz's
> at24/for-next as well as Mauro's linux-media master branch.

Sakari, we meet one issue - once the vcm sub-device registered, the user space
will try to open the VCM (I have not figure out who did that), it will also
trigger the acpi pm resume/suspend, as the VCM always shares same power rail
with camera sensor, so the privacy LED still has a blink.

> 
...snip...
-- 
Best regards,
Bingbu Cao
