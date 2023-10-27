Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3C417D8F9A
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Oct 2023 09:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234902AbjJ0HVV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Oct 2023 03:21:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232306AbjJ0HVU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Oct 2023 03:21:20 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA2E6194;
        Fri, 27 Oct 2023 00:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698391278; x=1729927278;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rxlH5HwmCqZqMfavoFfoGzozPhjQGaJre4NyNPdtwOc=;
  b=d/qH66dfNj839STjPsvi+5B/ZVbJO75+yt0XsYet5hkDw4DoDxYF98L4
   GuvCLHzN/THL9zQyJJXmyQIdgtp2S6ZbOLVsOESOravnBvh3wnXxvK7uS
   0HVVVpgqpcWkDc8rw1UFv3fYr3Y3OS4ifklFZn2o9K8xiRX8GKtDQgvPN
   1sQukPo2sr1LoshNh3STE/tCaQcp67hCginlKp+24deLKtCltjEQUsfG4
   9ftZ2tpImEvgnIUqJTKp2JtCpZ0Z2OXsh+e8yYh2/WG4koo4Np70XaoJL
   cPFR/Owh8ZZstXTlZ+3RCOUvov5vMAz9Y6qid3iJl5Y7zpwvdA1C3cKsS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="378093016"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="378093016"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 00:21:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="829886894"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="829886894"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 27 Oct 2023 00:21:14 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qwH9c-000Aak-2D;
        Fri, 27 Oct 2023 07:21:12 +0000
Date:   Fri, 27 Oct 2023 15:20:50 +0800
From:   kernel test robot <lkp@intel.com>
To:     Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     oe-kbuild-all@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>,
        linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver
 bindings
Message-ID: <202310271540.4uI1Fgxe-lkp@intel.com>
References: <20231026081514.3610343-2-Delphine_CC_Chiu@Wiwynn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231026081514.3610343-2-Delphine_CC_Chiu@Wiwynn.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Delphine,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on linus/master v6.6-rc7 next-20231026]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Delphine-CC-Chiu/dt-bindings-hwmon-Add-lltc-ltc4286-driver-bindings/20231026-161739
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20231026081514.3610343-2-Delphine_CC_Chiu%40Wiwynn.com
patch subject: [PATCH v2 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver bindings
reproduce: (https://download.01.org/0day-ci/archive/20231027/202310271540.4uI1Fgxe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310271540.4uI1Fgxe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/ltc4286.rst
>> MAINTAINERS:27681: WARNING: unknown document: ../devicetree/bindings/hwmon/ltc4286

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
