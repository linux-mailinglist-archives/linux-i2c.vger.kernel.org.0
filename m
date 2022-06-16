Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 490F954DFCB
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jun 2022 13:11:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232320AbiFPLLC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Jun 2022 07:11:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229748AbiFPLLB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Jun 2022 07:11:01 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD3425C86F;
        Thu, 16 Jun 2022 04:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655377860; x=1686913860;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8+NH6Ri5lpQfIS3/RPQfvg5J7ybyzEhikh7up91AaKE=;
  b=Hc9/BbKXdZTqs7KjqSKu+cGHAYnNeqRGmAC/WxCuLkOEtn1yWfNg5nWZ
   AF7AY2U73sjHiXx+9/BjdrkgnknAMGqOjNh4DiMMh/iazysoVXB6dwQ3M
   xQhAn2Ka0zlG+3HVWwX4N6uIRvTQ+wR91FymO4E0jvGJ+lae+NRC/ZMqo
   lf8cQzkmmjvYAftscTs5Q5DUfprbkFZeiCZSlFZOthoGv2j7byfc03jpZ
   62tdIvONp72exz+wC+0TPn7dHsiGGCtR5zdDH3/iCvMidUg91IXqRa6cl
   eLDAieAuNVSAQzZWSUA3WjinqYdfeaQTZiKelhd2HESOfZEQdZYPytEQx
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="262244491"
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; 
   d="scan'208";a="262244491"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2022 04:11:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; 
   d="scan'208";a="536413410"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 16 Jun 2022 04:10:57 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o1nOq-000OJd-Mv;
        Thu, 16 Jun 2022 11:10:56 +0000
Date:   Thu, 16 Jun 2022 19:10:53 +0800
From:   kernel test robot <lkp@intel.com>
To:     frank zago <frank@zago.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa-dev@sang-engineering.com>,
        Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     kbuild-all@lists.01.org
Subject: Re: [PATCH v6 3/4] i2c: ch341: add I2C MFD cell driver for the CH341
Message-ID: <202206161938.BiOHSAOi-lkp@intel.com>
References: <20220616013747.126051-4-frank@zago.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616013747.126051-4-frank@zago.net>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi frank,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on lee-mfd/for-mfd-next]
[also build test ERROR on brgl/gpio/for-next wsa/i2c/for-next linus/master v5.19-rc2 next-20220616]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/frank-zago/add-driver-for-the-WCH-CH341-in-I2C-GPIO-mode/20220616-094113
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
config: arc-buildonly-randconfig-r004-20220616 (https://download.01.org/0day-ci/archive/20220616/202206161938.BiOHSAOi-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/46c68aee86d34ee630272146a73ad7c3147bb094
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review frank-zago/add-driver-for-the-WCH-CH341-in-I2C-GPIO-mode/20220616-094113
        git checkout 46c68aee86d34ee630272146a73ad7c3147bb094
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "usb_bulk_msg" [drivers/i2c/busses/i2c-ch341.ko] undefined!
>> ERROR: modpost: "usb_deregister" [drivers/mfd/ch341-core.ko] undefined!
>> ERROR: modpost: "usb_register_driver" [drivers/mfd/ch341-core.ko] undefined!
>> ERROR: modpost: "usb_find_common_endpoints" [drivers/mfd/ch341-core.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_CH341
   Depends on HAS_IOMEM && USB
   Selected by
   - I2C_CH341 && I2C && HAS_IOMEM

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
