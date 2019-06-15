Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93C17470B5
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Jun 2019 17:11:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbfFOPL1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 15 Jun 2019 11:11:27 -0400
Received: from mx2.suse.de ([195.135.220.15]:33628 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725944AbfFOPL1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 15 Jun 2019 11:11:27 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 6B2A5ADE0;
        Sat, 15 Jun 2019 15:11:26 +0000 (UTC)
Date:   Sat, 15 Jun 2019 17:11:24 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Pali =?UTF-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v1 3/3] i2c: i801: Remove linux/init.h and sort headers
Message-ID: <20190615171124.6992ffd4@endymion>
In-Reply-To: <20190614144743.GP9224@smile.fi.intel.com>
References: <20190613164529.63482-1-andriy.shevchenko@linux.intel.com>
        <20190613164529.63482-3-andriy.shevchenko@linux.intel.com>
        <20190614163041.13d5ee68@endymion>
        <20190614144743.GP9224@smile.fi.intel.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 14 Jun 2019 17:47:43 +0300, Andy Shevchenko wrote:
> On Fri, Jun 14, 2019 at 04:30:41PM +0200, Jean Delvare wrote:
> > In my books, you should never rely on a header including for you
> > another header you need. Is there a reason for not following that
> > principle here?  
> 
> init.h vs. module.h is a special case. Otherwise I agree with you.

Why? Where is this documented?

-- 
Jean Delvare
SUSE L3 Support
