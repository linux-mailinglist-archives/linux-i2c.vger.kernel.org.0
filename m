Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A21A948517
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2019 16:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbfFQOQr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Jun 2019 10:16:47 -0400
Received: from mx2.suse.de ([195.135.220.15]:47064 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726005AbfFQOQr (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 17 Jun 2019 10:16:47 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 336A5AD24;
        Mon, 17 Jun 2019 14:16:46 +0000 (UTC)
Date:   Mon, 17 Jun 2019 16:16:44 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Pali =?UTF-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v1 2/3] i2c: i801: Use match_string() helper to simplify
 the code
Message-ID: <20190617161644.781a1940@endymion>
In-Reply-To: <20190613164529.63482-2-andriy.shevchenko@linux.intel.com>
References: <20190613164529.63482-1-andriy.shevchenko@linux.intel.com>
        <20190613164529.63482-2-andriy.shevchenko@linux.intel.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

On Thu, 13 Jun 2019 19:45:28 +0300, Andy Shevchenko wrote:
> match_string() returns the array index of a matching string.
> Use it instead of the open-coded implementation.

Nice, I didn't know about this utility function.

Don't we need to include <linux/string.h> though? Or is it another
undocumented exception?

-- 
Jean Delvare
SUSE L3 Support
