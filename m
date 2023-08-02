Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C08D76C4D2
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Aug 2023 07:25:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230047AbjHBFZc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Aug 2023 01:25:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbjHBFZb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Aug 2023 01:25:31 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C54DC6;
        Tue,  1 Aug 2023 22:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690953930; x=1722489930;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KAPIjXPsyd2+dxyh95yYELxeX74TE9+C+IdpV0dwcYI=;
  b=SMTkY1qMzP0JKzOfF2qS02jPcaZu/eJ6lbU8TdmEy7muPuNL57V+h0ZY
   HDRriDCpcGkbA1dksWhEMeq4teui+5UT9/4/dILur2UA7T2bXxxJ0/Jtg
   J+z6gDRn2TKpo25PlNRBMY8QhlJ+mp2OlUNYhpS5NITtS6OrdoqQzWAYT
   pmLqEtZjCfQkfGjCP6kZfGiEFoNrzgUq1rQR4hDMJTwCKoSSrMEFQH0X5
   g5ACkThlQOk1mFVR8Y25/KlmtNK24S1nao04Gn47vTio5AdH9Zd0zzMeK
   BQivJN104nfNnTAS6a0lnSMaXSxVflh0e9/wRa2arVG+ejb6p4/9CTK5g
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="372215580"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="372215580"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 22:25:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="758611295"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="758611295"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 01 Aug 2023 22:25:11 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qR4MA-0000tX-2p;
        Wed, 02 Aug 2023 05:25:10 +0000
Date:   Wed, 2 Aug 2023 13:25:02 +0800
From:   kernel test robot <lkp@intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Wolfram Sang <wsa-dev@sang-engineering.com>
Cc:     oe-kbuild-all@lists.linux.dev,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 2/2] i2c: Add i2c_device_get_match_data() callback
Message-ID: <202308021316.lB5HzyKZ-lkp@intel.com>
References: <20230801170318.82682-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230801170318.82682-3-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Biju,

kernel test robot noticed the following build warnings:

[auto build test WARNING on wsa/i2c/for-next]
[also build test WARNING on driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus linus/master v6.5-rc4 next-20230801]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Biju-Das/drivers-fwnode-Extend-device_get_match_data-to-struct-bus_type/20230802-010931
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
patch link:    https://lore.kernel.org/r/20230801170318.82682-3-biju.das.jz%40bp.renesas.com
patch subject: [PATCH v3 2/2] i2c: Add i2c_device_get_match_data() callback
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230802/202308021316.lB5HzyKZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230802/202308021316.lB5HzyKZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308021316.lB5HzyKZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/uapi/linux/fb.h:6,
                    from include/linux/fb.h:7,
                    from include/linux/vga_switcheroo.h:34,
                    from sound/pci/hda/hda_intel.c:52:
   include/linux/i2c.h:1038:2: error: redefinition of 'i2c_of_match_device'
    1038 | *i2c_of_match_device(const struct of_device_id *matches,
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/i2c.h:1031:2: note: previous definition of 'i2c_of_match_device' with type 'const struct of_device_id *(const struct of_device_id *, struct i2c_client *)'
    1031 | *i2c_of_match_device(const struct of_device_id *matches,
         |  ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/container_of.h:5,
                    from include/linux/kernel.h:21,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/current.h:10,
                    from include/linux/sched.h:12,
                    from include/linux/delay.h:23,
                    from sound/pci/hda/hda_intel.c:23:
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:231:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     231 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:56:59: note: in expansion of macro '__must_be_array'
      56 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:517:20: note: in expansion of macro 'ARRAY_SIZE'
     517 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:501:9: note: in expansion of macro 'module_param_array_named'
     501 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/hda/hda_intel.c:125:1: note: in expansion of macro 'module_param_array'
     125 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
>> sound/pci/hda/hda_intel.c:104:12: warning: 'index' defined but not used [-Wunused-variable]
     104 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;
         |            ^~~~~


vim +/index +104 sound/pci/hda/hda_intel.c

33124929a23c5b5 Takashi Iwai      2014-06-26  102  
^1da177e4c3f415 Linus Torvalds    2005-04-16  103  
5aba4f8ec72b2b8 Takashi Iwai      2008-01-07 @104  static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;
5aba4f8ec72b2b8 Takashi Iwai      2008-01-07  105  static char *id[SNDRV_CARDS] = SNDRV_DEFAULT_STR;
a67ff6a54095e27 Rusty Russell     2011-12-15  106  static bool enable[SNDRV_CARDS] = SNDRV_DEFAULT_ENABLE_PNP;
5aba4f8ec72b2b8 Takashi Iwai      2008-01-07  107  static char *model[SNDRV_CARDS];
1dac6695c683c66 Takashi Iwai      2012-09-13  108  static int position_fix[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS-1)] = -1};
5c0d7bc103dd1ae Takashi Iwai      2008-06-10  109  static int bdl_pos_adj[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS-1)] = -1};
5aba4f8ec72b2b8 Takashi Iwai      2008-01-07  110  static int probe_mask[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS-1)] = -1};
d4d9cd0338892e7 Takashi Iwai      2008-12-19  111  static int probe_only[SNDRV_CARDS];
26a6cb6cca225f6 David Henningsson 2012-10-09  112  static int jackpoll_ms[SNDRV_CARDS];
41438f1314b0f6f Takashi Iwai      2017-01-12  113  static int single_cmd = -1;
71623855e20c3fe Takashi Iwai      2009-09-28  114  static int enable_msi = -1;
4ea6fbc8eb23c3a Takashi Iwai      2009-06-17  115  #ifdef CONFIG_SND_HDA_PATCH_LOADER
4ea6fbc8eb23c3a Takashi Iwai      2009-06-17  116  static char *patch[SNDRV_CARDS];
4ea6fbc8eb23c3a Takashi Iwai      2009-06-17  117  #endif
2dca0bba70ce3c2 Jaroslav Kysela   2009-11-13  118  #ifdef CONFIG_SND_HDA_INPUT_BEEP
0920c9b4c4d8960 Takashi Iwai      2012-07-03  119  static bool beep_mode[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS-1)] =
2dca0bba70ce3c2 Jaroslav Kysela   2009-11-13  120  					CONFIG_SND_HDA_INPUT_BEEP_MODE};
2dca0bba70ce3c2 Jaroslav Kysela   2009-11-13  121  #endif
7fba6aea4472f01 Takashi Iwai      2020-01-09  122  static bool dmic_detect = 1;
d045bceff5a904b Jaroslav Kysela   2023-02-02  123  static bool ctl_dev_id = IS_ENABLED(CONFIG_SND_HDA_CTL_DEV_ID) ? 1 : 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  124  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
