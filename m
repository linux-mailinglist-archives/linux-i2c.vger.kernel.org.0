Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A551248381
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Aug 2020 13:05:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726588AbgHRLFG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Aug 2020 07:05:06 -0400
Received: from mga05.intel.com ([192.55.52.43]:29176 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726535AbgHRLFF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 18 Aug 2020 07:05:05 -0400
IronPort-SDR: tgzYrrdWAWtAjZcyDV4E5ODOkcNxRSTPxEb6ST94KNqHLcinJdO5IBIvNJIRbh6KMA8BGTMndu
 K8wSbfFJrnOA==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="239705243"
X-IronPort-AV: E=Sophos;i="5.76,327,1592895600"; 
   d="scan'208";a="239705243"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2020 04:05:04 -0700
IronPort-SDR: Zyl1zkY136CnxKdCbyCD89FjESR6rtWsviP14MKhKzpsA2396TvId8tkG83uuM+d+03U/0/ztr
 7gO/W/YhD+Mw==
X-IronPort-AV: E=Sophos;i="5.76,327,1592895600"; 
   d="scan'208";a="278020960"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2020 04:05:01 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 461CE2064F; Tue, 18 Aug 2020 14:04:59 +0300 (EEST)
Date:   Tue, 18 Aug 2020 14:04:59 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Bingbu Cao <bingbu.cao@linux.intel.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Mani, Rajmohan" <rajmohan.mani@intel.com>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
Subject: Re: [PATCH v5 0/6] Support running driver's probe for a device
 powered off
Message-ID: <20200818110459.GR24582@paasikivi.fi.intel.com>
References: <20200810142747.12400-1-sakari.ailus@linux.intel.com>
 <5353041e-850f-05ad-3b20-35e91fc9501e@linux.intel.com>
 <CAAFQd5DbMMsxkJAkLm4kQ+cQ0ePG4ME492MxM3vwXws3H_bsTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAFQd5DbMMsxkJAkLm4kQ+cQ0ePG4ME492MxM3vwXws3H_bsTQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Tomasz, Bingbu,

On Fri, Aug 14, 2020 at 03:17:58PM +0200, Tomasz Figa wrote:
> On Fri, Aug 14, 2020 at 6:12 AM Bingbu Cao <bingbu.cao@linux.intel.com> wrote:
> >
> >
> >
> > On 8/10/20 10:27 PM, Sakari Ailus wrote:
> > > Hi all,
> > >
> > ...snip...
> > >
> > > The use case is such that there is a privacy LED next to an integrated
> > > user-facing laptop camera, and this LED is there to signal the user that
> > > the camera is recording a video or capturing images. That LED also happens
> > > to be wired to one of the power supplies of the camera, so whenever you
> > > power on the camera, the LED will be lit, whether images are captured from
> > > the camera --- or not. There's no way to implement this differently
> > > without additional software control (allowing of which is itself a
> > > hardware design decision) on most CSI-2-connected camera sensors as they
> > > simply have no pin to signal the camera streaming state.
> > >
> > > This is also what happens during driver probe: the camera will be powered
> > > on by the I²C subsystem calling dev_pm_domain_attach() and the device is
> > > already powered on when the driver's own probe function is called. To the
> > > user this visible during the boot process as a blink of the privacy LED,
> > > suggesting that the camera is recording without the user having used an
> > > application to do that. From the end user's point of view the behaviour is
> > > not expected and for someone unfamiliar with internal workings of a
> > > computer surely seems quite suspicious --- even if images are not being
> > > actually captured.
> > >
> > > I've tested these on linux-next master. They also apply to Wolfram's
> > > i2c/for-next branch, there's a patch that affects the I²C core changes
> > > here (see below). The patches apart from that apply to Bartosz's
> > > at24/for-next as well as Mauro's linux-media master branch.
> >
> > Sakari, we meet one issue - once the vcm sub-device registered, the user space
> > will try to open the VCM (I have not figure out who did that), it will also
> > trigger the acpi pm resume/suspend, as the VCM always shares same power rail
> > with camera sensor, so the privacy LED still has a blink.
> 
> It's not always the case, as on some designs there are multiple power
> rails to the sensor and one drives the LED, while the other drives the
> VCM. That said, it would be still good to solve it in either case.
> 
> Perhaps we need some more general discussion on the side effects of
> simply opening and querying a device. Most of V4L2 drivers these days
> are designed to avoid powering up the hardware until it's absolutely
> needed to do so. However, for non-streaming subdevs that are directly
> controlled by the userspace, like VCM, it's a common practice to power
> up on open and down on release. This is because they don't have a
> "streaming" state, so the driver has no way to determine when the
> power is needed. I wonder if there is a way to improve this.

Good question.

I think in this particular case the device could be powered on only when
there's an open file handle and current is applied on the coil (i.e. the
control's value is non-zero).

But in general case more IOCTLs would be needed. PM QoS framework could be
used for the purpose based on wakeup latency. I guess no-one has needed it
badly enough to implement the support? This would be actually a better
approach. In any case in the case of the lens it requires that the current
behaviour of powering on the device based on just open file handles would
have to change.

-- 
Kind regards,

Sakari Ailus
