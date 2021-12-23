Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6181347E487
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Dec 2021 15:30:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348823AbhLWOaA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Dec 2021 09:30:00 -0500
Received: from mga04.intel.com ([192.55.52.120]:8793 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243798AbhLWOaA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 23 Dec 2021 09:30:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640269800; x=1671805800;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=QgiqzqoLdDwIHdsBcXClaRLXFp65YpRzRfnS77nX1/I=;
  b=dH2hTHjrAxnRrCjrYouG531iE1xg4HRCGH7LIzScGmQ52n/hbIHIo6I5
   JFDcnG7VpopVX7jaFA+HyHvIlYLCKPCoBHFAkmp/8gUM1j+HWbjsA/rp0
   1qHAYab3AysI7w95d1ct434C3mzy01wdZDd+X4XB/dudc5NYKesufmG1M
   X7wg2SQhaR0s7IQhDzeWuaDwQKhZD6dI3eOTHHKBX/1Pqwp7Zw0zO4P4/
   PA/zkev3IWDG84MBnFQMwDGYeX+uLGAiQuX5bNJocgzvAendnwQdskx1l
   i/zfHL6C0RTgjKeF3Ej6Ho6yEg+HCrLoVkNeh4LQnhEYtoMnJaRqPijKR
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="239589060"
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; 
   d="scan'208";a="239589060"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2021 06:29:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; 
   d="scan'208";a="617503584"
Received: from mylly.fi.intel.com (HELO [10.237.72.50]) ([10.237.72.50])
  by orsmga004.jf.intel.com with ESMTP; 23 Dec 2021 06:29:57 -0800
Message-ID: <443785f5-323e-e36f-7a10-12d03140e6b0@linux.intel.com>
Date:   Thu, 23 Dec 2021 16:29:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.0
Subject: Re: [RFC 1/2] i2c: designware: Add missing locks
Content-Language: en-US
To:     Jan Dabros <jsd@semihalf.com>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Cc:     andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        wsa@kernel.org, rrangel@chromium.org, mw@semihalf.com,
        jaz@semihalf.com, upstream@semihalf.com
References: <20211222094558.2098791-1-jsd@semihalf.com>
 <20211222094558.2098791-2-jsd@semihalf.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20211222094558.2098791-2-jsd@semihalf.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 12/22/21 11:45, Jan Dabros wrote:
> All accesses to controller's registers should be protected on
> probe, disable and xfer paths. This is needed for i2c bus controllers
> that are shared with but not controlled by kernel.
> 
> Signed-off-by: Jan Dabros <jsd@semihalf.com>
> ---
>   drivers/i2c/busses/i2c-designware-common.c | 12 ++++++++++++
>   drivers/i2c/busses/i2c-designware-master.c |  6 ++++++
>   2 files changed, 18 insertions(+)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
