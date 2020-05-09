Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5E461CBC2C
	for <lists+linux-i2c@lfdr.de>; Sat,  9 May 2020 03:43:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728479AbgEIBnu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 May 2020 21:43:50 -0400
Received: from mga06.intel.com ([134.134.136.31]:24455 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727828AbgEIBnu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 8 May 2020 21:43:50 -0400
IronPort-SDR: d/aoST5NKhX9HnV0S+LxemdyYOMCvUzPhkWcixnUIG9EZcSGQQuRWpCGDkh1gh+v19xplFA/ta
 5BAAU0T515kw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2020 18:43:49 -0700
IronPort-SDR: Z4AYreD5FeKgEnoa8BVAW8CCsJ6EmRz22AyYCY0b4l061PnyXVuF2fJcxipWCDuRAumfktbybe
 KuYfS9ZhpaHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,369,1583222400"; 
   d="scan'208";a="252107554"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 08 May 2020 18:43:48 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jXEWp-000GcZ-Dk; Sat, 09 May 2020 09:43:47 +0800
Date:   Sat, 9 May 2020 09:43:30 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Matthew Blecker <matthewb@chromium.org>,
        Wolfram Sang <wsa-dev@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     kbuild-all@lists.01.org, Matthew Blecker <matthewb@chromium.org>
Subject: Re: [PATCH 1/1] i2c: Add i2c-pseudo driver for userspace I2C
 adapters.
Message-ID: <202005090940.DjgfwRg4%lkp@intel.com>
References: <20200507230513.246804-2-matthewb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200507230513.246804-2-matthewb@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Matthew,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on wsa/i2c/for-next]
[also build test WARNING on v5.7-rc4 next-20200508]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Matthew-Blecker/i2c-Add-i2c-pseudo-driver-for-userspace-I2C-adapters/20200509-011221
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


coccinelle warnings: (new ones prefixed by >>)

>> drivers/i2c/i2c-pseudo.c:2897:8-15: WARNING opportunity for memdup_user
--
>> drivers/i2c/i2c-pseudo.c:2206:1-17: ERROR: i2cp_fileops: .read() can deadlock .write(); change nonseekable_open -> stream_open to fix.

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
