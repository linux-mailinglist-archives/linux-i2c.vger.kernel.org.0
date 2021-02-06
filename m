Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD0BC3118A5
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Feb 2021 03:44:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231139AbhBFCnQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 Feb 2021 21:43:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230110AbhBFCil (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 5 Feb 2021 21:38:41 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EF03C03326A;
        Fri,  5 Feb 2021 16:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=+ki+EFl/WrIsWbKRBevt5fPDWwKi1CJ9stHU3UVX1R8=; b=taOVumLO2GIni4YawGywwRtBYO
        NchH7GPRkUu+oioh4zUnzQLz1qVqJkZ75Je3+xCAVPCj+DnJhio9GLXFGSgoQTTljwUxXYfqNBsLh
        a0kad225Oieqhttojck6wzgP1Ihj7Ak+qRClGfXpMtH3texyGrv2TQViid/k13Rt4el2RXnMvUZhI
        BJjMj/NRFASA8kJwcjyI+8Lj+OxoIqNs1v8poCvg8zhvTwNAAIFH+6SPzc708xECXUoACfwKqsZpX
        dVOn3x1COqfbLDQqd8CLY+0xZVHptYXorlADw8Ml/Pl2P/sGGCvY+I49gjjrZreQGOZeLHbVcYXXE
        lrJBG1WA==;
Received: from [2601:1c0:6280:3f0::aec2]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1l8Bu9-0005FZ-A1; Sat, 06 Feb 2021 00:56:53 +0000
Subject: Re: [PATCH v10 3/7] Documentation: ACPI: Document _DSE object usage
 for enum power state
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rajmohan.mani@intel.com, Tomasz Figa <tfiga@chromium.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        linux-media@vger.kernel.org
References: <20210205132505.20173-1-sakari.ailus@linux.intel.com>
 <20210205132505.20173-4-sakari.ailus@linux.intel.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <4894ef52-71f5-c651-c45b-4788f0e24162@infradead.org>
Date:   Fri, 5 Feb 2021 16:56:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210205132505.20173-4-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2/5/21 5:25 AM, Sakari Ailus wrote:
> Document the use of the _DSE object for setting desirable power state
> during probe.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Tomasz Figa <tfiga@chromium.org>
> ---
>  Documentation/firmware-guide/acpi/index.rst   |  1 +
>  .../firmware-guide/acpi/low-power-probe.rst   | 69 +++++++++++++++++++
>  2 files changed, 70 insertions(+)
>  create mode 100644 Documentation/firmware-guide/acpi/low-power-probe.rst
> 

> diff --git a/Documentation/firmware-guide/acpi/low-power-probe.rst b/Documentation/firmware-guide/acpi/low-power-probe.rst
> new file mode 100644
> index 0000000000000..b96804d959a6c
> --- /dev/null
> +++ b/Documentation/firmware-guide/acpi/low-power-probe.rst
> @@ -0,0 +1,69 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +======================================
> +Probing I²C devices in low power state
> +======================================
> +
> +Introduction
> +============
> +
> +In some cases it may be preferred to leave certain devices powered off for the
> +entire system bootup if powering on these devices has adverse side effects,
> +beyond just powering on the said device.
> +
> +How it works
> +============
>

Hi,

Please don't use ============ underlines for all section levels.
Here is what Documentation/doc-guide/sphinx.rst says:

Specific guidelines for the kernel documentation
------------------------------------------------

Here are some specific guidelines for the kernel documentation:

* Please don't go overboard with reStructuredText markup. Keep it
  simple. For the most part the documentation should be plain text with
  just enough consistency in formatting that it can be converted to
  other formats.

* Please keep the formatting changes minimal when converting existing
  documentation to reStructuredText.

* Also update the content, not just the formatting, when converting
  documentation.

* Please stick to this order of heading adornments:

  1. ``=`` with overline for document title::

       ==============
       Document title
       ==============

  2. ``=`` for chapters::

       Chapters
       ========

  3. ``-`` for sections::

       Section
       -------

  4. ``~`` for subsections::

       Subsection
       ~~~~~~~~~~

  Although RST doesn't mandate a specific order ("Rather than imposing a fixed
  number and order of section title adornment styles, the order enforced will be
  the order as encountered."), having the higher levels the same overall makes
  it easier to follow the documents.



thanks.
-- 
~Randy

