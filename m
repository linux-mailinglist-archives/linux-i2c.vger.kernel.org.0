Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 950EE536626
	for <lists+linux-i2c@lfdr.de>; Fri, 27 May 2022 18:51:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351569AbiE0Qus (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 May 2022 12:50:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350778AbiE0Qus (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 May 2022 12:50:48 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B28F527E0;
        Fri, 27 May 2022 09:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653670247; x=1685206247;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5Zd5oXs4G2DMNG/uRxSGRYwoT2gZG7cDj4UtN+8pWG8=;
  b=IMoFM3dbkm2L5vdmkAIqR/7wtRdH1tFMREH/Z9N7X81NWLBuEdlwNKlM
   AWpaULE+LAwoUaIxscQsCkm7sp67v3FNfeN4KP/zrimXEdeklw6Lo5Q9b
   zS5YjZ9EdG0PmQYOV2g/cEftv2oNnCA8uE2E110uqPjR8eAQS/T7YODnW
   4XFe2MjqcFAox17RM9nSXcG4GuyxdfcqmAjuJklVrun/jpCOSs4clvRnU
   6hEqtaFPrzbr/0LA9IWDC7dktOFdRv8f2HloMCkFnxYIeJjxAfvyJCs8N
   K+brPJH/dUVov2iDgzJyzbTA48wGHEE/DsZSXJYGsswVDTRYnU9a5LkOO
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10360"; a="274253961"
X-IronPort-AV: E=Sophos;i="5.91,256,1647327600"; 
   d="scan'208";a="274253961"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2022 09:50:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,256,1647327600"; 
   d="scan'208";a="902635036"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 27 May 2022 09:50:43 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nudAh-0004wH-7T;
        Fri, 27 May 2022 16:50:43 +0000
Date:   Sat, 28 May 2022 00:50:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Eddie James <eajames@linux.ibm.com>, linux-i2c@vger.kernel.org
Cc:     kbuild-all@lists.01.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, wsa@kernel.org, peda@axentia.se,
        jic23@kernel.org, lars@metafoo.de, eajames@linux.ibm.com,
        miltonm@us.ibm.com, joel@jms.id.au
Subject: Re: [PATCH 1/2] i2c: core: Add mux root adapter operations
Message-ID: <202205280002.xJm7ad0Z-lkp@intel.com>
References: <20220526205334.64114-2-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220526205334.64114-2-eajames@linux.ibm.com>
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Eddie,

I love your patch! Perhaps something to improve:

[auto build test WARNING on wsa/i2c/for-next]
[also build test WARNING on jic23-iio/togreg linux/master linus/master v5.18 next-20220527]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Eddie-James/i2c-core-Add-mux-root-adapter-operations/20220527-050852
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
reproduce: make htmldocs

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> include/linux/i2c.h:858: warning: expecting prototype for i2c_unlock_deslect_bus(). Prototype was for i2c_unlock_deselect_bus() instead

vim +858 include/linux/i2c.h

   852	
   853	/**
   854	 * i2c_unlock_deslect_bus - Release exclusive access to the root I2C bus
   855	 * @adapter: Target I2C bus
   856	 */
   857	static inline void i2c_unlock_deselect_bus(struct i2c_adapter *adapter)
 > 858	{
   859		adapter->mux_root_ops->unlock_deselect(adapter);
   860	}
   861	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
