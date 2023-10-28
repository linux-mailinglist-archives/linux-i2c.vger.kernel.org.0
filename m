Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3157DA515
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Oct 2023 05:55:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233040AbjJ1DzR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Oct 2023 23:55:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjJ1DzQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Oct 2023 23:55:16 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05F7E10A;
        Fri, 27 Oct 2023 20:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698465313; x=1730001313;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qDzqr30MeOgL/N0BmqbgF3J5CqRGi7sdwxlhCyhEzw0=;
  b=VciHVq8RNen2+p7pTeAZVSrT5C23q0LpdTIE1eiy4TTxsGHJlSp5KEUX
   wFc0tSjLIie1AvNoqubw2dj0C9hFP9QPBwOsXnHYEsVv01/hKvNn3kNQJ
   afoMGpZTcJ0VF1aM8ygwPI2XkmUCYzuvv7//jdY751+ihxOyiVEWM078c
   pusvIVOwsB0wF/ChCRcZwJnL+6Df5bv8idsJF86uX6H2JBrm7WIaYM3XV
   YO5/2tcYZ59QaUovp3lDOoFgGiTBnkJaZO7Pv7iN1nG7TCoQOxjPhVeKy
   K/zQktFjuMP3NMZ6xZ5qdOnT8dRGEa1ELbC0oadLwrI4vzwmPvkh1QeY2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="676147"
X-IronPort-AV: E=Sophos;i="6.03,258,1694761200"; 
   d="scan'208";a="676147"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 20:55:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="933283132"
X-IronPort-AV: E=Sophos;i="6.03,258,1694761200"; 
   d="scan'208";a="933283132"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 Oct 2023 20:55:08 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qwaPi-000BSd-2O;
        Sat, 28 Oct 2023 03:55:06 +0000
Date:   Sat, 28 Oct 2023 11:54:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     oe-kbuild-all@lists.linux.dev, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: pmbus: Add ltc4286 driver
Message-ID: <202310281159.Y11xKbmu-lkp@intel.com>
References: <20231026081514.3610343-3-Delphine_CC_Chiu@Wiwynn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231026081514.3610343-3-Delphine_CC_Chiu@Wiwynn.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Delphine,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on linus/master v6.6-rc7 next-20231027]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Delphine-CC-Chiu/dt-bindings-hwmon-Add-lltc-ltc4286-driver-bindings/20231026-161739
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20231026081514.3610343-3-Delphine_CC_Chiu%40Wiwynn.com
patch subject: [PATCH v2 2/2] hwmon: pmbus: Add ltc4286 driver
reproduce: (https://download.01.org/0day-ci/archive/20231028/202310281159.Y11xKbmu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310281159.Y11xKbmu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/hwmon/ltc4286.rst: WARNING: document isn't included in any toctree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
