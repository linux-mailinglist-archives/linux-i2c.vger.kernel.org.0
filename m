Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 925932C8BA4
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Nov 2020 18:48:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729017AbgK3RsS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 12:48:18 -0500
Received: from mga09.intel.com ([134.134.136.24]:15591 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728094AbgK3RsR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 30 Nov 2020 12:48:17 -0500
IronPort-SDR: QrOPhAa/Xcw62STWpapgt3Lzz2JIxf/8WW5mx025VqyU1F6H9bqQgNNeUP4003egqTgmqxegQd
 XkmVvR0nZO/g==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="172835844"
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; 
   d="scan'208";a="172835844"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 09:46:36 -0800
IronPort-SDR: 0gWEOAtT3hCJ/igFKg3kPsUTCbjLPEsM/hI0bt7n3+UZ5GDi3eJcjp79JHB3LwQppjdF50yPkK
 mEz/H3IzhhlQ==
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; 
   d="scan'208";a="372579354"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 09:46:27 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kjnGq-00B6AE-OF; Mon, 30 Nov 2020 19:47:28 +0200
Date:   Mon, 30 Nov 2020 19:47:28 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Daniel Scally <djrscally@gmail.com>, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-media@vger.kernel.org,
        devel@acpica.org, rjw@rjwysocki.net, lenb@kernel.org,
        gregkh@linuxfoundation.org, mika.westerberg@linux.intel.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        wsa@kernel.org, yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        robert.moore@intel.com, erik.kaneda@intel.com, pmladek@suse.com,
        rostedt@goodmis.org, sergey.senozhatsky@gmail.com,
        linux@rasmusvillemoes.dk, kieran.bingham+renesas@ideasonboard.com,
        jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com
Subject: Re: [PATCH 06/18] software_node: amend
 software_node_unregister_node_group() to perform unregistration of array in
 reverse order to be consistent with software_node_unregister_nodes()
Message-ID: <20201130174728.GR4077@smile.fi.intel.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-7-djrscally@gmail.com>
 <20201130161716.GJ14465@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201130161716.GJ14465@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Nov 30, 2020 at 06:17:16PM +0200, Laurent Pinchart wrote:
> Hi Daniel,
> 
> Thank you for the patch.
> 
> The subject line is very long. We try to keep it within a 72 characters
> limit in the kernel. That can be a challenge sometimes, and expections
> can be accepted, but this one is reaaaally long.
> 
> (The same comment holds for other patches in the series)

+1.

> On Mon, Nov 30, 2020 at 01:31:17PM +0000, Daniel Scally wrote:
> > To maintain consistency with software_node_unregister_nodes(), reverse
> > the order in which the software_node_unregister_node_group() function
> > unregisters nodes.
> > 
> > Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Signed-off-by: Daniel Scally <djrscally@gmail.com>
> 
> I"d squash this with the previous patch to avoid introducing an
> inconsistency.

It's different to previous. It touches not complementary API, but different
one. However, I would follow your comment about documenting the behaviour of
these two APIs as well…

-- 
With Best Regards,
Andy Shevchenko


