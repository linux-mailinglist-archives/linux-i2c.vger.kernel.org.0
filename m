Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D63BB6E3B30
	for <lists+linux-i2c@lfdr.de>; Sun, 16 Apr 2023 20:28:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbjDPS2V (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 16 Apr 2023 14:28:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbjDPS2U (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 16 Apr 2023 14:28:20 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C260ACF;
        Sun, 16 Apr 2023 11:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681669697; x=1713205697;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JUaVSMN4jxKQn5Wyon3D7LnPF8v/8d+WlReXjKzRqGI=;
  b=PncbUtZBvj7Xx6AJadnHYqpALv4ufQXpwH021NpZUnQUrXbkJviVqGH9
   wy5QmpKMbl/7j0s+7H7UYNWcEufh5oahAqlXnrJ3l5/KrGybxBufIVBSQ
   ul/JDXl6aCopBKG/DOlfJTvnD5wAxdslVVIkf0sMdnFa78GMU3X4o0YFF
   ziV76G61nVFICULCVHzHeQs5oZEDBebA2wz1y2UiRZQcBbMflnGU/fUVC
   XuTv/KDJOu6um6qVjXuv/e0TiDM8XNXwBoeKRYVtGSEsMo33WI+zcSOHp
   uWU0FMM8SxluYwJfR7fnVJX4slYtkagqZO1DQghDax6WRHSLwoLepyXJP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="333546473"
X-IronPort-AV: E=Sophos;i="5.99,202,1677571200"; 
   d="scan'208";a="333546473"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2023 11:28:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="723037690"
X-IronPort-AV: E=Sophos;i="5.99,202,1677571200"; 
   d="scan'208";a="723037690"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 16 Apr 2023 11:28:13 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1po76i-000bnX-2m;
        Sun, 16 Apr 2023 18:28:12 +0000
Date:   Mon, 17 Apr 2023 02:28:08 +0800
From:   kernel test robot <lkp@intel.com>
To:     Shuai Jiang <d202180596@hust.edu.cn>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        hust-os-kernel-patches@googlegroups.com,
        Shuai Jiang <d202180596@hust.edu.cn>
Subject: Re: [PATCH] Subject: drivers:i2c:busses:i2c-qup.c: Add missing
 unwind goto in qup_i2c_probe()
Message-ID: <202304170236.7BwOMXCa-lkp@intel.com>
References: <20230416164146.7750-1-d202180596@hust.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230416164146.7750-1-d202180596@hust.edu.cn>
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

Hi Shuai,

kernel test robot noticed the following build warnings:

[auto build test WARNING on wsa/i2c/for-next]
[also build test WARNING on linus/master v6.3-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shuai-Jiang/Subject-drivers-i2c-busses-i2c-qup-c-Add-missing-unwind-goto-in-qup_i2c_probe/20230417-004243
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
patch link:    https://lore.kernel.org/r/20230416164146.7750-1-d202180596%40hust.edu.cn
patch subject: [PATCH] Subject: drivers:i2c:busses:i2c-qup.c: Add missing unwind goto in qup_i2c_probe()
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230417/202304170236.7BwOMXCa-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2f61e419c04ee41517d9543a5c6a97e3e392cd5e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Shuai-Jiang/Subject-drivers-i2c-busses-i2c-qup-c-Add-missing-unwind-goto-in-qup_i2c_probe/20230417-004243
        git checkout 2f61e419c04ee41517d9543a5c6a97e3e392cd5e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/i2c/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304170236.7BwOMXCa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/i2c/busses/i2c-qup.c: In function 'qup_i2c_probe':
>> drivers/i2c/busses/i2c-qup.c:1760:9: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
    1760 |         if (IS_ERR(qup->base))
         |         ^~
   drivers/i2c/busses/i2c-qup.c:1762:17: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
    1762 |                 ret = PTR_ERR(qup->base);
         |                 ^~~
   drivers/i2c/busses/i2c-qup.c:1766:9: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
    1766 |         if (qup->irq < 0)
         |         ^~
   drivers/i2c/busses/i2c-qup.c:1768:17: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
    1768 |                 ret = PTR_ERR(qup->irq);
         |                 ^~~
>> drivers/i2c/busses/i2c-qup.c:1768:34: warning: passing argument 1 of 'PTR_ERR' makes pointer from integer without a cast [-Wint-conversion]
    1768 |                 ret = PTR_ERR(qup->irq);
         |                               ~~~^~~~~
         |                                  |
         |                                  int
   In file included from include/linux/kernfs.h:9,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/of.h:17,
                    from include/linux/irqdomain.h:36,
                    from include/linux/acpi.h:13,
                    from drivers/i2c/busses/i2c-qup.c:8:
   include/linux/err.h:29:61: note: expected 'const void *' but argument is of type 'int'
      29 | static inline long __must_check PTR_ERR(__force const void *ptr)
         |                                                 ~~~~~~~~~~~~^~~


vim +/if +1760 drivers/i2c/busses/i2c-qup.c

902a91a02bdf02 Austin Christ   2018-05-10  1656  
10c5a8425968f8 Bjorn Andersson 2014-03-13  1657  static int qup_i2c_probe(struct platform_device *pdev)
10c5a8425968f8 Bjorn Andersson 2014-03-13  1658  {
10c5a8425968f8 Bjorn Andersson 2014-03-13  1659  	static const int blk_sizes[] = {4, 16, 32};
10c5a8425968f8 Bjorn Andersson 2014-03-13  1660  	struct qup_i2c_dev *qup;
10c5a8425968f8 Bjorn Andersson 2014-03-13  1661  	unsigned long one_bit_t;
10c5a8425968f8 Bjorn Andersson 2014-03-13  1662  	u32 io_mode, hw_ver, size;
10c5a8425968f8 Bjorn Andersson 2014-03-13  1663  	int ret, fs_div, hs_div;
515da746983bc6 Naveen Kaje     2016-10-11  1664  	u32 src_clk_freq = DEFAULT_SRC_CLK;
515da746983bc6 Naveen Kaje     2016-10-11  1665  	u32 clk_freq = DEFAULT_CLK_FREQ;
9cedf3b2f09946 Sricharan R     2016-02-22  1666  	int blocks;
7545c7dba169c4 Abhishek Sahu   2018-03-12  1667  	bool is_qup_v1;
10c5a8425968f8 Bjorn Andersson 2014-03-13  1668  
10c5a8425968f8 Bjorn Andersson 2014-03-13  1669  	qup = devm_kzalloc(&pdev->dev, sizeof(*qup), GFP_KERNEL);
10c5a8425968f8 Bjorn Andersson 2014-03-13  1670  	if (!qup)
10c5a8425968f8 Bjorn Andersson 2014-03-13  1671  		return -ENOMEM;
10c5a8425968f8 Bjorn Andersson 2014-03-13  1672  
10c5a8425968f8 Bjorn Andersson 2014-03-13  1673  	qup->dev = &pdev->dev;
10c5a8425968f8 Bjorn Andersson 2014-03-13  1674  	init_completion(&qup->xfer);
10c5a8425968f8 Bjorn Andersson 2014-03-13  1675  	platform_set_drvdata(pdev, qup);
10c5a8425968f8 Bjorn Andersson 2014-03-13  1676  
d9f52281bc09bd Austin Christ   2018-05-10  1677  	if (scl_freq) {
d9f52281bc09bd Austin Christ   2018-05-10  1678  		dev_notice(qup->dev, "Using override frequency of %u\n", scl_freq);
d9f52281bc09bd Austin Christ   2018-05-10  1679  		clk_freq = scl_freq;
d9f52281bc09bd Austin Christ   2018-05-10  1680  	} else {
515da746983bc6 Naveen Kaje     2016-10-11  1681  		ret = device_property_read_u32(qup->dev, "clock-frequency", &clk_freq);
515da746983bc6 Naveen Kaje     2016-10-11  1682  		if (ret) {
515da746983bc6 Naveen Kaje     2016-10-11  1683  			dev_notice(qup->dev, "using default clock-frequency %d",
515da746983bc6 Naveen Kaje     2016-10-11  1684  				DEFAULT_CLK_FREQ);
515da746983bc6 Naveen Kaje     2016-10-11  1685  		}
d9f52281bc09bd Austin Christ   2018-05-10  1686  	}
10c5a8425968f8 Bjorn Andersson 2014-03-13  1687  
191424bb6166f6 Sricharan R     2016-01-19  1688  	if (of_device_is_compatible(pdev->dev.of_node, "qcom,i2c-qup-v1.1.1")) {
191424bb6166f6 Sricharan R     2016-01-19  1689  		qup->adap.algo = &qup_i2c_algo;
191424bb6166f6 Sricharan R     2016-01-19  1690  		qup->adap.quirks = &qup_i2c_quirks;
7545c7dba169c4 Abhishek Sahu   2018-03-12  1691  		is_qup_v1 = true;
191424bb6166f6 Sricharan R     2016-01-19  1692  	} else {
191424bb6166f6 Sricharan R     2016-01-19  1693  		qup->adap.algo = &qup_i2c_algo_v2;
de82bb43185558 Wolfram Sang    2018-07-23  1694  		qup->adap.quirks = &qup_i2c_quirks_v2;
7545c7dba169c4 Abhishek Sahu   2018-03-12  1695  		is_qup_v1 = false;
902a91a02bdf02 Austin Christ   2018-05-10  1696  		if (acpi_match_device(qup_i2c_acpi_match, qup->dev))
902a91a02bdf02 Austin Christ   2018-05-10  1697  			goto nodma;
902a91a02bdf02 Austin Christ   2018-05-10  1698  		else
9cedf3b2f09946 Sricharan R     2016-02-22  1699  			ret = qup_i2c_req_dma(qup);
9cedf3b2f09946 Sricharan R     2016-02-22  1700  
9cedf3b2f09946 Sricharan R     2016-02-22  1701  		if (ret == -EPROBE_DEFER)
9cedf3b2f09946 Sricharan R     2016-02-22  1702  			goto fail_dma;
9cedf3b2f09946 Sricharan R     2016-02-22  1703  		else if (ret != 0)
9cedf3b2f09946 Sricharan R     2016-02-22  1704  			goto nodma;
9cedf3b2f09946 Sricharan R     2016-02-22  1705  
6f2f0f6465acbd Abhishek Sahu   2018-03-12  1706  		qup->max_xfer_sg_len = (MX_BLOCKS << 1);
6f2f0f6465acbd Abhishek Sahu   2018-03-12  1707  		blocks = (MX_DMA_BLOCKS << 1) + 1;
a86854d0c599b3 Kees Cook       2018-06-12  1708  		qup->btx.sg = devm_kcalloc(&pdev->dev,
a86854d0c599b3 Kees Cook       2018-06-12  1709  					   blocks, sizeof(*qup->btx.sg),
9cedf3b2f09946 Sricharan R     2016-02-22  1710  					   GFP_KERNEL);
9cedf3b2f09946 Sricharan R     2016-02-22  1711  		if (!qup->btx.sg) {
9cedf3b2f09946 Sricharan R     2016-02-22  1712  			ret = -ENOMEM;
9cedf3b2f09946 Sricharan R     2016-02-22  1713  			goto fail_dma;
9cedf3b2f09946 Sricharan R     2016-02-22  1714  		}
9cedf3b2f09946 Sricharan R     2016-02-22  1715  		sg_init_table(qup->btx.sg, blocks);
9cedf3b2f09946 Sricharan R     2016-02-22  1716  
a86854d0c599b3 Kees Cook       2018-06-12  1717  		qup->brx.sg = devm_kcalloc(&pdev->dev,
a86854d0c599b3 Kees Cook       2018-06-12  1718  					   blocks, sizeof(*qup->brx.sg),
9cedf3b2f09946 Sricharan R     2016-02-22  1719  					   GFP_KERNEL);
9cedf3b2f09946 Sricharan R     2016-02-22  1720  		if (!qup->brx.sg) {
9cedf3b2f09946 Sricharan R     2016-02-22  1721  			ret = -ENOMEM;
9cedf3b2f09946 Sricharan R     2016-02-22  1722  			goto fail_dma;
9cedf3b2f09946 Sricharan R     2016-02-22  1723  		}
9cedf3b2f09946 Sricharan R     2016-02-22  1724  		sg_init_table(qup->brx.sg, blocks);
9cedf3b2f09946 Sricharan R     2016-02-22  1725  
9cedf3b2f09946 Sricharan R     2016-02-22  1726  		/* 2 tag bytes for each block + 5 for start, stop tags */
9cedf3b2f09946 Sricharan R     2016-02-22  1727  		size = blocks * 2 + 5;
9cedf3b2f09946 Sricharan R     2016-02-22  1728  
685983f4decc5f Sricharan R     2016-06-10  1729  		qup->start_tag.start = devm_kzalloc(&pdev->dev,
685983f4decc5f Sricharan R     2016-06-10  1730  						    size, GFP_KERNEL);
9cedf3b2f09946 Sricharan R     2016-02-22  1731  		if (!qup->start_tag.start) {
9cedf3b2f09946 Sricharan R     2016-02-22  1732  			ret = -ENOMEM;
9cedf3b2f09946 Sricharan R     2016-02-22  1733  			goto fail_dma;
9cedf3b2f09946 Sricharan R     2016-02-22  1734  		}
9cedf3b2f09946 Sricharan R     2016-02-22  1735  
685983f4decc5f Sricharan R     2016-06-10  1736  		qup->brx.tag.start = devm_kzalloc(&pdev->dev, 2, GFP_KERNEL);
9cedf3b2f09946 Sricharan R     2016-02-22  1737  		if (!qup->brx.tag.start) {
9cedf3b2f09946 Sricharan R     2016-02-22  1738  			ret = -ENOMEM;
9cedf3b2f09946 Sricharan R     2016-02-22  1739  			goto fail_dma;
191424bb6166f6 Sricharan R     2016-01-19  1740  		}
191424bb6166f6 Sricharan R     2016-01-19  1741  
685983f4decc5f Sricharan R     2016-06-10  1742  		qup->btx.tag.start = devm_kzalloc(&pdev->dev, 2, GFP_KERNEL);
9cedf3b2f09946 Sricharan R     2016-02-22  1743  		if (!qup->btx.tag.start) {
9cedf3b2f09946 Sricharan R     2016-02-22  1744  			ret = -ENOMEM;
9cedf3b2f09946 Sricharan R     2016-02-22  1745  			goto fail_dma;
9cedf3b2f09946 Sricharan R     2016-02-22  1746  		}
9cedf3b2f09946 Sricharan R     2016-02-22  1747  		qup->is_dma = true;
9cedf3b2f09946 Sricharan R     2016-02-22  1748  	}
9cedf3b2f09946 Sricharan R     2016-02-22  1749  
9cedf3b2f09946 Sricharan R     2016-02-22  1750  nodma:
109b8c42b7e28d Austin Christ   2018-05-10  1751  	/* We support frequencies up to FAST Mode Plus (1MHz) */
90224e6468e15d Andy Shevchenko 2020-03-24  1752  	if (!clk_freq || clk_freq > I2C_MAX_FAST_MODE_PLUS_FREQ) {
10c5a8425968f8 Bjorn Andersson 2014-03-13  1753  		dev_err(qup->dev, "clock frequency not supported %d\n",
10c5a8425968f8 Bjorn Andersson 2014-03-13  1754  			clk_freq);
2f61e419c04ee4 Shuai Jiang     2023-04-17  1755  		ret = -EINVAL;
2f61e419c04ee4 Shuai Jiang     2023-04-17  1756  		goto fail_dma;
10c5a8425968f8 Bjorn Andersson 2014-03-13  1757  	}
10c5a8425968f8 Bjorn Andersson 2014-03-13  1758  
e0442d76213981 Dejin Zheng     2020-04-09  1759  	qup->base = devm_platform_ioremap_resource(pdev, 0);
10c5a8425968f8 Bjorn Andersson 2014-03-13 @1760  	if (IS_ERR(qup->base))
2f61e419c04ee4 Shuai Jiang     2023-04-17  1761  		dev_err(qup->dev, "Could not get qup_i2c_dev base ptr\n");
2f61e419c04ee4 Shuai Jiang     2023-04-17  1762  		ret = PTR_ERR(qup->base);
2f61e419c04ee4 Shuai Jiang     2023-04-17  1763  		goto fail_dma;
10c5a8425968f8 Bjorn Andersson 2014-03-13  1764  
10c5a8425968f8 Bjorn Andersson 2014-03-13  1765  	qup->irq = platform_get_irq(pdev, 0);
e42688ed5cf593 Dejin Zheng     2020-04-16  1766  	if (qup->irq < 0)
2f61e419c04ee4 Shuai Jiang     2023-04-17  1767  		dev_err(qup->dev, "qup_i2c_dev irq ptr less than zero\n");
2f61e419c04ee4 Shuai Jiang     2023-04-17 @1768  		ret = PTR_ERR(qup->irq);
2f61e419c04ee4 Shuai Jiang     2023-04-17  1769  		goto fail_dma;
10c5a8425968f8 Bjorn Andersson 2014-03-13  1770  
515da746983bc6 Naveen Kaje     2016-10-11  1771  	if (has_acpi_companion(qup->dev)) {
515da746983bc6 Naveen Kaje     2016-10-11  1772  		ret = device_property_read_u32(qup->dev,
515da746983bc6 Naveen Kaje     2016-10-11  1773  				"src-clock-hz", &src_clk_freq);
515da746983bc6 Naveen Kaje     2016-10-11  1774  		if (ret) {
515da746983bc6 Naveen Kaje     2016-10-11  1775  			dev_notice(qup->dev, "using default src-clock-hz %d",
515da746983bc6 Naveen Kaje     2016-10-11  1776  				DEFAULT_SRC_CLK);
515da746983bc6 Naveen Kaje     2016-10-11  1777  		}
515da746983bc6 Naveen Kaje     2016-10-11  1778  		ACPI_COMPANION_SET(&qup->adap.dev, ACPI_COMPANION(qup->dev));
515da746983bc6 Naveen Kaje     2016-10-11  1779  	} else {
10c5a8425968f8 Bjorn Andersson 2014-03-13  1780  		qup->clk = devm_clk_get(qup->dev, "core");
10c5a8425968f8 Bjorn Andersson 2014-03-13  1781  		if (IS_ERR(qup->clk)) {
10c5a8425968f8 Bjorn Andersson 2014-03-13  1782  			dev_err(qup->dev, "Could not get core clock\n");
2f61e419c04ee4 Shuai Jiang     2023-04-17  1783  			ret = PTR_ERR(qup->clk);
2f61e419c04ee4 Shuai Jiang     2023-04-17  1784  			goto fail_dma;
10c5a8425968f8 Bjorn Andersson 2014-03-13  1785  		}
10c5a8425968f8 Bjorn Andersson 2014-03-13  1786  
10c5a8425968f8 Bjorn Andersson 2014-03-13  1787  		qup->pclk = devm_clk_get(qup->dev, "iface");
10c5a8425968f8 Bjorn Andersson 2014-03-13  1788  		if (IS_ERR(qup->pclk)) {
10c5a8425968f8 Bjorn Andersson 2014-03-13  1789  			dev_err(qup->dev, "Could not get iface clock\n");
2f61e419c04ee4 Shuai Jiang     2023-04-17  1790  			ret = PTR_ERR(qup->pclk);
2f61e419c04ee4 Shuai Jiang     2023-04-17  1791  			goto fail_dma;
10c5a8425968f8 Bjorn Andersson 2014-03-13  1792  		}
10c5a8425968f8 Bjorn Andersson 2014-03-13  1793  		qup_i2c_enable_clocks(qup);
515da746983bc6 Naveen Kaje     2016-10-11  1794  		src_clk_freq = clk_get_rate(qup->clk);
515da746983bc6 Naveen Kaje     2016-10-11  1795  	}
10c5a8425968f8 Bjorn Andersson 2014-03-13  1796  
10c5a8425968f8 Bjorn Andersson 2014-03-13  1797  	/*
10c5a8425968f8 Bjorn Andersson 2014-03-13  1798  	 * Bootloaders might leave a pending interrupt on certain QUP's,
10c5a8425968f8 Bjorn Andersson 2014-03-13  1799  	 * so we reset the core before registering for interrupts.
10c5a8425968f8 Bjorn Andersson 2014-03-13  1800  	 */
10c5a8425968f8 Bjorn Andersson 2014-03-13  1801  	writel(1, qup->base + QUP_SW_RESET);
10c5a8425968f8 Bjorn Andersson 2014-03-13  1802  	ret = qup_i2c_poll_state_valid(qup);
10c5a8425968f8 Bjorn Andersson 2014-03-13  1803  	if (ret)
10c5a8425968f8 Bjorn Andersson 2014-03-13  1804  		goto fail;
10c5a8425968f8 Bjorn Andersson 2014-03-13  1805  
10c5a8425968f8 Bjorn Andersson 2014-03-13  1806  	ret = devm_request_irq(qup->dev, qup->irq, qup_i2c_interrupt,
5fe058b04d017a Tian Tao        2021-03-19  1807  			       IRQF_TRIGGER_HIGH | IRQF_NO_AUTOEN,
5fe058b04d017a Tian Tao        2021-03-19  1808  			       "i2c_qup", qup);
10c5a8425968f8 Bjorn Andersson 2014-03-13  1809  	if (ret) {
10c5a8425968f8 Bjorn Andersson 2014-03-13  1810  		dev_err(qup->dev, "Request %d IRQ failed\n", qup->irq);
10c5a8425968f8 Bjorn Andersson 2014-03-13  1811  		goto fail;
10c5a8425968f8 Bjorn Andersson 2014-03-13  1812  	}
10c5a8425968f8 Bjorn Andersson 2014-03-13  1813  
10c5a8425968f8 Bjorn Andersson 2014-03-13  1814  	hw_ver = readl(qup->base + QUP_HW_VERSION);
10c5a8425968f8 Bjorn Andersson 2014-03-13  1815  	dev_dbg(qup->dev, "Revision %x\n", hw_ver);
10c5a8425968f8 Bjorn Andersson 2014-03-13  1816  
10c5a8425968f8 Bjorn Andersson 2014-03-13  1817  	io_mode = readl(qup->base + QUP_IO_MODE);
10c5a8425968f8 Bjorn Andersson 2014-03-13  1818  
10c5a8425968f8 Bjorn Andersson 2014-03-13  1819  	/*
10c5a8425968f8 Bjorn Andersson 2014-03-13  1820  	 * The block/fifo size w.r.t. 'actual data' is 1/2 due to 'tag'
10c5a8425968f8 Bjorn Andersson 2014-03-13  1821  	 * associated with each byte written/received
10c5a8425968f8 Bjorn Andersson 2014-03-13  1822  	 */
10c5a8425968f8 Bjorn Andersson 2014-03-13  1823  	size = QUP_OUTPUT_BLOCK_SIZE(io_mode);
3cf357dfb40b4a Pramod Gurav    2014-08-06  1824  	if (size >= ARRAY_SIZE(blk_sizes)) {
3cf357dfb40b4a Pramod Gurav    2014-08-06  1825  		ret = -EIO;
3cf357dfb40b4a Pramod Gurav    2014-08-06  1826  		goto fail;
3cf357dfb40b4a Pramod Gurav    2014-08-06  1827  	}
7545c7dba169c4 Abhishek Sahu   2018-03-12  1828  	qup->out_blk_sz = blk_sizes[size];
10c5a8425968f8 Bjorn Andersson 2014-03-13  1829  
10c5a8425968f8 Bjorn Andersson 2014-03-13  1830  	size = QUP_INPUT_BLOCK_SIZE(io_mode);
3cf357dfb40b4a Pramod Gurav    2014-08-06  1831  	if (size >= ARRAY_SIZE(blk_sizes)) {
3cf357dfb40b4a Pramod Gurav    2014-08-06  1832  		ret = -EIO;
3cf357dfb40b4a Pramod Gurav    2014-08-06  1833  		goto fail;
3cf357dfb40b4a Pramod Gurav    2014-08-06  1834  	}
7545c7dba169c4 Abhishek Sahu   2018-03-12  1835  	qup->in_blk_sz = blk_sizes[size];
7545c7dba169c4 Abhishek Sahu   2018-03-12  1836  
7545c7dba169c4 Abhishek Sahu   2018-03-12  1837  	if (is_qup_v1) {
7545c7dba169c4 Abhishek Sahu   2018-03-12  1838  		/*
7545c7dba169c4 Abhishek Sahu   2018-03-12  1839  		 * in QUP v1, QUP_CONFIG uses N as 15 i.e 16 bits constitutes a
7545c7dba169c4 Abhishek Sahu   2018-03-12  1840  		 * single transfer but the block size is in bytes so divide the
7545c7dba169c4 Abhishek Sahu   2018-03-12  1841  		 * in_blk_sz and out_blk_sz by 2
7545c7dba169c4 Abhishek Sahu   2018-03-12  1842  		 */
7545c7dba169c4 Abhishek Sahu   2018-03-12  1843  		qup->in_blk_sz /= 2;
7545c7dba169c4 Abhishek Sahu   2018-03-12  1844  		qup->out_blk_sz /= 2;
7545c7dba169c4 Abhishek Sahu   2018-03-12  1845  		qup->write_tx_fifo = qup_i2c_write_tx_fifo_v1;
7545c7dba169c4 Abhishek Sahu   2018-03-12  1846  		qup->read_rx_fifo = qup_i2c_read_rx_fifo_v1;
7545c7dba169c4 Abhishek Sahu   2018-03-12  1847  		qup->write_rx_tags = qup_i2c_write_rx_tags_v1;
7545c7dba169c4 Abhishek Sahu   2018-03-12  1848  	} else {
7545c7dba169c4 Abhishek Sahu   2018-03-12  1849  		qup->write_tx_fifo = qup_i2c_write_tx_fifo_v2;
7545c7dba169c4 Abhishek Sahu   2018-03-12  1850  		qup->read_rx_fifo = qup_i2c_read_rx_fifo_v2;
7545c7dba169c4 Abhishek Sahu   2018-03-12  1851  		qup->write_rx_tags = qup_i2c_write_rx_tags_v2;
7545c7dba169c4 Abhishek Sahu   2018-03-12  1852  	}
10c5a8425968f8 Bjorn Andersson 2014-03-13  1853  
10c5a8425968f8 Bjorn Andersson 2014-03-13  1854  	size = QUP_OUTPUT_FIFO_SIZE(io_mode);
10c5a8425968f8 Bjorn Andersson 2014-03-13  1855  	qup->out_fifo_sz = qup->out_blk_sz * (2 << size);
10c5a8425968f8 Bjorn Andersson 2014-03-13  1856  
10c5a8425968f8 Bjorn Andersson 2014-03-13  1857  	size = QUP_INPUT_FIFO_SIZE(io_mode);
10c5a8425968f8 Bjorn Andersson 2014-03-13  1858  	qup->in_fifo_sz = qup->in_blk_sz * (2 << size);
10c5a8425968f8 Bjorn Andersson 2014-03-13  1859  
10c5a8425968f8 Bjorn Andersson 2014-03-13  1860  	hs_div = 3;
90224e6468e15d Andy Shevchenko 2020-03-24  1861  	if (clk_freq <= I2C_MAX_STANDARD_MODE_FREQ) {
71fbafcc45fed7 Austin Christ   2018-05-10  1862  		fs_div = ((src_clk_freq / clk_freq) / 2) - 3;
10c5a8425968f8 Bjorn Andersson 2014-03-13  1863  		qup->clk_ctl = (hs_div << 8) | (fs_div & 0xff);
71fbafcc45fed7 Austin Christ   2018-05-10  1864  	} else {
71fbafcc45fed7 Austin Christ   2018-05-10  1865  		/* 33%/66% duty cycle */
71fbafcc45fed7 Austin Christ   2018-05-10  1866  		fs_div = ((src_clk_freq / clk_freq) - 6) * 2 / 3;
71fbafcc45fed7 Austin Christ   2018-05-10  1867  		qup->clk_ctl = ((fs_div / 2) << 16) | (hs_div << 8) | (fs_div & 0xff);
71fbafcc45fed7 Austin Christ   2018-05-10  1868  	}
10c5a8425968f8 Bjorn Andersson 2014-03-13  1869  
10c5a8425968f8 Bjorn Andersson 2014-03-13  1870  	/*
10c5a8425968f8 Bjorn Andersson 2014-03-13  1871  	 * Time it takes for a byte to be clocked out on the bus.
10c5a8425968f8 Bjorn Andersson 2014-03-13  1872  	 * Each byte takes 9 clock cycles (8 bits + 1 ack).
10c5a8425968f8 Bjorn Andersson 2014-03-13  1873  	 */
10c5a8425968f8 Bjorn Andersson 2014-03-13  1874  	one_bit_t = (USEC_PER_SEC / clk_freq) + 1;
10c5a8425968f8 Bjorn Andersson 2014-03-13  1875  	qup->one_byte_t = one_bit_t * 9;
ecb6e1e5f43520 Abhishek Sahu   2018-03-12  1876  	qup->xfer_timeout = TOUT_MIN * HZ +
6f2f0f6465acbd Abhishek Sahu   2018-03-12  1877  		usecs_to_jiffies(MX_DMA_TX_RX_LEN * qup->one_byte_t);
10c5a8425968f8 Bjorn Andersson 2014-03-13  1878  
10c5a8425968f8 Bjorn Andersson 2014-03-13  1879  	dev_dbg(qup->dev, "IN:block:%d, fifo:%d, OUT:block:%d, fifo:%d\n",
10c5a8425968f8 Bjorn Andersson 2014-03-13  1880  		qup->in_blk_sz, qup->in_fifo_sz,
10c5a8425968f8 Bjorn Andersson 2014-03-13  1881  		qup->out_blk_sz, qup->out_fifo_sz);
10c5a8425968f8 Bjorn Andersson 2014-03-13  1882  
10c5a8425968f8 Bjorn Andersson 2014-03-13  1883  	i2c_set_adapdata(&qup->adap, qup);
10c5a8425968f8 Bjorn Andersson 2014-03-13  1884  	qup->adap.dev.parent = qup->dev;
10c5a8425968f8 Bjorn Andersson 2014-03-13  1885  	qup->adap.dev.of_node = pdev->dev.of_node;
9cedf3b2f09946 Sricharan R     2016-02-22  1886  	qup->is_last = true;
f74187932d30e4 Sricharan R     2016-01-19  1887  
ea1558ce149d28 Wolfram Sang    2022-08-11  1888  	strscpy(qup->adap.name, "QUP I2C adapter", sizeof(qup->adap.name));
10c5a8425968f8 Bjorn Andersson 2014-03-13  1889  
10c5a8425968f8 Bjorn Andersson 2014-03-13  1890  	pm_runtime_set_autosuspend_delay(qup->dev, MSEC_PER_SEC);
10c5a8425968f8 Bjorn Andersson 2014-03-13  1891  	pm_runtime_use_autosuspend(qup->dev);
10c5a8425968f8 Bjorn Andersson 2014-03-13  1892  	pm_runtime_set_active(qup->dev);
10c5a8425968f8 Bjorn Andersson 2014-03-13  1893  	pm_runtime_enable(qup->dev);
86b59bbfae2a89 Andy Gross      2014-09-29  1894  
86b59bbfae2a89 Andy Gross      2014-09-29  1895  	ret = i2c_add_adapter(&qup->adap);
86b59bbfae2a89 Andy Gross      2014-09-29  1896  	if (ret)
86b59bbfae2a89 Andy Gross      2014-09-29  1897  		goto fail_runtime;
86b59bbfae2a89 Andy Gross      2014-09-29  1898  
10c5a8425968f8 Bjorn Andersson 2014-03-13  1899  	return 0;
10c5a8425968f8 Bjorn Andersson 2014-03-13  1900  
86b59bbfae2a89 Andy Gross      2014-09-29  1901  fail_runtime:
86b59bbfae2a89 Andy Gross      2014-09-29  1902  	pm_runtime_disable(qup->dev);
86b59bbfae2a89 Andy Gross      2014-09-29  1903  	pm_runtime_set_suspended(qup->dev);
10c5a8425968f8 Bjorn Andersson 2014-03-13  1904  fail:
10c5a8425968f8 Bjorn Andersson 2014-03-13  1905  	qup_i2c_disable_clocks(qup);
9cedf3b2f09946 Sricharan R     2016-02-22  1906  fail_dma:
9cedf3b2f09946 Sricharan R     2016-02-22  1907  	if (qup->btx.dma)
9cedf3b2f09946 Sricharan R     2016-02-22  1908  		dma_release_channel(qup->btx.dma);
9cedf3b2f09946 Sricharan R     2016-02-22  1909  	if (qup->brx.dma)
9cedf3b2f09946 Sricharan R     2016-02-22  1910  		dma_release_channel(qup->brx.dma);
10c5a8425968f8 Bjorn Andersson 2014-03-13  1911  	return ret;
10c5a8425968f8 Bjorn Andersson 2014-03-13  1912  }
10c5a8425968f8 Bjorn Andersson 2014-03-13  1913  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
