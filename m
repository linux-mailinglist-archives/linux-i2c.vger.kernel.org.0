Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5BB66E45FD
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Apr 2023 13:04:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231128AbjDQLEI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Apr 2023 07:04:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230391AbjDQLD4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Apr 2023 07:03:56 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3E0DD8;
        Mon, 17 Apr 2023 04:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681729378; x=1713265378;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nskN3+3aY62Sps5EKjkYwMD5AXkHIjQ/ugdoImiwsxs=;
  b=HXNno1Z3PvAb2BNs4DJ+ozk/s6pfzIsZaXP1MrNkvlaZ09zQr8vIpeGU
   2o1J2mfYJbLUKuSs1IP5W0csaW5CT+0hNbZRx8TSAsmaf/VAzjgQxlaLz
   jiKfJMqfCeoBSr4l1GUcCH//fDfF/lVJpfkEp+QFa6maGknZsATQDoFAl
   1D71EmYd7AGM1pEXP98+oNhe90+ZU/lJEG1MayT5GoIYWnwvZStG0TrZX
   lowtAwNSz+rPWxliVLb/xssXPP0Ij9DYvRB0XBG0U/c3ocn1eMEOhrl6e
   0pyYwhL0p+9bNUD+E321X4AQlVuKCs4YKm/VY8TM3WiYY9SlE4LM6FKNf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="333657531"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; 
   d="scan'208";a="333657531"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 04:02:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="693208944"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; 
   d="scan'208";a="693208944"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 17 Apr 2023 04:02:42 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1poMd7-000cIt-35;
        Mon, 17 Apr 2023 11:02:41 +0000
Date:   Mon, 17 Apr 2023 19:02:29 +0800
From:   kernel test robot <lkp@intel.com>
To:     Shuai Jiang <d202180596@hust.edu.cn>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        hust-os-kernel-patches@googlegroups.com,
        Shuai Jiang <d202180596@hust.edu.cn>
Subject: Re: [PATCH] Subject: drivers:i2c:busses:i2c-qup.c: Add missing
 unwind goto in qup_i2c_probe()
Message-ID: <202304171850.t2PGRDnv-lkp@intel.com>
References: <20230416164146.7750-1-d202180596@hust.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230416164146.7750-1-d202180596@hust.edu.cn>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Shuai,

kernel test robot noticed the following build errors:

[auto build test ERROR on wsa/i2c/for-next]
[also build test ERROR on linus/master v6.3-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shuai-Jiang/Subject-drivers-i2c-busses-i2c-qup-c-Add-missing-unwind-goto-in-qup_i2c_probe/20230417-004243
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
patch link:    https://lore.kernel.org/r/20230416164146.7750-1-d202180596%40hust.edu.cn
patch subject: [PATCH] Subject: drivers:i2c:busses:i2c-qup.c: Add missing unwind goto in qup_i2c_probe()
config: powerpc-randconfig-r032-20230416 (https://download.01.org/0day-ci/archive/20230417/202304171850.t2PGRDnv-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 9638da200e00bd069e6dd63604e14cbafede9324)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/2f61e419c04ee41517d9543a5c6a97e3e392cd5e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Shuai-Jiang/Subject-drivers-i2c-busses-i2c-qup-c-Add-missing-unwind-goto-in-qup_i2c_probe/20230417-004243
        git checkout 2f61e419c04ee41517d9543a5c6a97e3e392cd5e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/i2c/busses/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304171850.t2PGRDnv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-qup.c:1768:17: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'const void *' [-Wint-conversion]
                   ret = PTR_ERR(qup->irq);
                                 ^~~~~~~~
   include/linux/err.h:29:61: note: passing argument to parameter 'ptr' here
   static inline long __must_check PTR_ERR(__force const void *ptr)
                                                               ^
   1 error generated.


vim +1768 drivers/i2c/busses/i2c-qup.c

  1656	
  1657	static int qup_i2c_probe(struct platform_device *pdev)
  1658	{
  1659		static const int blk_sizes[] = {4, 16, 32};
  1660		struct qup_i2c_dev *qup;
  1661		unsigned long one_bit_t;
  1662		u32 io_mode, hw_ver, size;
  1663		int ret, fs_div, hs_div;
  1664		u32 src_clk_freq = DEFAULT_SRC_CLK;
  1665		u32 clk_freq = DEFAULT_CLK_FREQ;
  1666		int blocks;
  1667		bool is_qup_v1;
  1668	
  1669		qup = devm_kzalloc(&pdev->dev, sizeof(*qup), GFP_KERNEL);
  1670		if (!qup)
  1671			return -ENOMEM;
  1672	
  1673		qup->dev = &pdev->dev;
  1674		init_completion(&qup->xfer);
  1675		platform_set_drvdata(pdev, qup);
  1676	
  1677		if (scl_freq) {
  1678			dev_notice(qup->dev, "Using override frequency of %u\n", scl_freq);
  1679			clk_freq = scl_freq;
  1680		} else {
  1681			ret = device_property_read_u32(qup->dev, "clock-frequency", &clk_freq);
  1682			if (ret) {
  1683				dev_notice(qup->dev, "using default clock-frequency %d",
  1684					DEFAULT_CLK_FREQ);
  1685			}
  1686		}
  1687	
  1688		if (of_device_is_compatible(pdev->dev.of_node, "qcom,i2c-qup-v1.1.1")) {
  1689			qup->adap.algo = &qup_i2c_algo;
  1690			qup->adap.quirks = &qup_i2c_quirks;
  1691			is_qup_v1 = true;
  1692		} else {
  1693			qup->adap.algo = &qup_i2c_algo_v2;
  1694			qup->adap.quirks = &qup_i2c_quirks_v2;
  1695			is_qup_v1 = false;
  1696			if (acpi_match_device(qup_i2c_acpi_match, qup->dev))
  1697				goto nodma;
  1698			else
  1699				ret = qup_i2c_req_dma(qup);
  1700	
  1701			if (ret == -EPROBE_DEFER)
  1702				goto fail_dma;
  1703			else if (ret != 0)
  1704				goto nodma;
  1705	
  1706			qup->max_xfer_sg_len = (MX_BLOCKS << 1);
  1707			blocks = (MX_DMA_BLOCKS << 1) + 1;
  1708			qup->btx.sg = devm_kcalloc(&pdev->dev,
  1709						   blocks, sizeof(*qup->btx.sg),
  1710						   GFP_KERNEL);
  1711			if (!qup->btx.sg) {
  1712				ret = -ENOMEM;
  1713				goto fail_dma;
  1714			}
  1715			sg_init_table(qup->btx.sg, blocks);
  1716	
  1717			qup->brx.sg = devm_kcalloc(&pdev->dev,
  1718						   blocks, sizeof(*qup->brx.sg),
  1719						   GFP_KERNEL);
  1720			if (!qup->brx.sg) {
  1721				ret = -ENOMEM;
  1722				goto fail_dma;
  1723			}
  1724			sg_init_table(qup->brx.sg, blocks);
  1725	
  1726			/* 2 tag bytes for each block + 5 for start, stop tags */
  1727			size = blocks * 2 + 5;
  1728	
  1729			qup->start_tag.start = devm_kzalloc(&pdev->dev,
  1730							    size, GFP_KERNEL);
  1731			if (!qup->start_tag.start) {
  1732				ret = -ENOMEM;
  1733				goto fail_dma;
  1734			}
  1735	
  1736			qup->brx.tag.start = devm_kzalloc(&pdev->dev, 2, GFP_KERNEL);
  1737			if (!qup->brx.tag.start) {
  1738				ret = -ENOMEM;
  1739				goto fail_dma;
  1740			}
  1741	
  1742			qup->btx.tag.start = devm_kzalloc(&pdev->dev, 2, GFP_KERNEL);
  1743			if (!qup->btx.tag.start) {
  1744				ret = -ENOMEM;
  1745				goto fail_dma;
  1746			}
  1747			qup->is_dma = true;
  1748		}
  1749	
  1750	nodma:
  1751		/* We support frequencies up to FAST Mode Plus (1MHz) */
  1752		if (!clk_freq || clk_freq > I2C_MAX_FAST_MODE_PLUS_FREQ) {
  1753			dev_err(qup->dev, "clock frequency not supported %d\n",
  1754				clk_freq);
  1755			ret = -EINVAL;
  1756			goto fail_dma;
  1757		}
  1758	
  1759		qup->base = devm_platform_ioremap_resource(pdev, 0);
  1760		if (IS_ERR(qup->base))
  1761			dev_err(qup->dev, "Could not get qup_i2c_dev base ptr\n");
  1762			ret = PTR_ERR(qup->base);
  1763			goto fail_dma;
  1764	
  1765		qup->irq = platform_get_irq(pdev, 0);
  1766		if (qup->irq < 0)
  1767			dev_err(qup->dev, "qup_i2c_dev irq ptr less than zero\n");
> 1768			ret = PTR_ERR(qup->irq);
  1769			goto fail_dma;
  1770	
  1771		if (has_acpi_companion(qup->dev)) {
  1772			ret = device_property_read_u32(qup->dev,
  1773					"src-clock-hz", &src_clk_freq);
  1774			if (ret) {
  1775				dev_notice(qup->dev, "using default src-clock-hz %d",
  1776					DEFAULT_SRC_CLK);
  1777			}
  1778			ACPI_COMPANION_SET(&qup->adap.dev, ACPI_COMPANION(qup->dev));
  1779		} else {
  1780			qup->clk = devm_clk_get(qup->dev, "core");
  1781			if (IS_ERR(qup->clk)) {
  1782				dev_err(qup->dev, "Could not get core clock\n");
  1783				ret = PTR_ERR(qup->clk);
  1784				goto fail_dma;
  1785			}
  1786	
  1787			qup->pclk = devm_clk_get(qup->dev, "iface");
  1788			if (IS_ERR(qup->pclk)) {
  1789				dev_err(qup->dev, "Could not get iface clock\n");
  1790				ret = PTR_ERR(qup->pclk);
  1791				goto fail_dma;
  1792			}
  1793			qup_i2c_enable_clocks(qup);
  1794			src_clk_freq = clk_get_rate(qup->clk);
  1795		}
  1796	
  1797		/*
  1798		 * Bootloaders might leave a pending interrupt on certain QUP's,
  1799		 * so we reset the core before registering for interrupts.
  1800		 */
  1801		writel(1, qup->base + QUP_SW_RESET);
  1802		ret = qup_i2c_poll_state_valid(qup);
  1803		if (ret)
  1804			goto fail;
  1805	
  1806		ret = devm_request_irq(qup->dev, qup->irq, qup_i2c_interrupt,
  1807				       IRQF_TRIGGER_HIGH | IRQF_NO_AUTOEN,
  1808				       "i2c_qup", qup);
  1809		if (ret) {
  1810			dev_err(qup->dev, "Request %d IRQ failed\n", qup->irq);
  1811			goto fail;
  1812		}
  1813	
  1814		hw_ver = readl(qup->base + QUP_HW_VERSION);
  1815		dev_dbg(qup->dev, "Revision %x\n", hw_ver);
  1816	
  1817		io_mode = readl(qup->base + QUP_IO_MODE);
  1818	
  1819		/*
  1820		 * The block/fifo size w.r.t. 'actual data' is 1/2 due to 'tag'
  1821		 * associated with each byte written/received
  1822		 */
  1823		size = QUP_OUTPUT_BLOCK_SIZE(io_mode);
  1824		if (size >= ARRAY_SIZE(blk_sizes)) {
  1825			ret = -EIO;
  1826			goto fail;
  1827		}
  1828		qup->out_blk_sz = blk_sizes[size];
  1829	
  1830		size = QUP_INPUT_BLOCK_SIZE(io_mode);
  1831		if (size >= ARRAY_SIZE(blk_sizes)) {
  1832			ret = -EIO;
  1833			goto fail;
  1834		}
  1835		qup->in_blk_sz = blk_sizes[size];
  1836	
  1837		if (is_qup_v1) {
  1838			/*
  1839			 * in QUP v1, QUP_CONFIG uses N as 15 i.e 16 bits constitutes a
  1840			 * single transfer but the block size is in bytes so divide the
  1841			 * in_blk_sz and out_blk_sz by 2
  1842			 */
  1843			qup->in_blk_sz /= 2;
  1844			qup->out_blk_sz /= 2;
  1845			qup->write_tx_fifo = qup_i2c_write_tx_fifo_v1;
  1846			qup->read_rx_fifo = qup_i2c_read_rx_fifo_v1;
  1847			qup->write_rx_tags = qup_i2c_write_rx_tags_v1;
  1848		} else {
  1849			qup->write_tx_fifo = qup_i2c_write_tx_fifo_v2;
  1850			qup->read_rx_fifo = qup_i2c_read_rx_fifo_v2;
  1851			qup->write_rx_tags = qup_i2c_write_rx_tags_v2;
  1852		}
  1853	
  1854		size = QUP_OUTPUT_FIFO_SIZE(io_mode);
  1855		qup->out_fifo_sz = qup->out_blk_sz * (2 << size);
  1856	
  1857		size = QUP_INPUT_FIFO_SIZE(io_mode);
  1858		qup->in_fifo_sz = qup->in_blk_sz * (2 << size);
  1859	
  1860		hs_div = 3;
  1861		if (clk_freq <= I2C_MAX_STANDARD_MODE_FREQ) {
  1862			fs_div = ((src_clk_freq / clk_freq) / 2) - 3;
  1863			qup->clk_ctl = (hs_div << 8) | (fs_div & 0xff);
  1864		} else {
  1865			/* 33%/66% duty cycle */
  1866			fs_div = ((src_clk_freq / clk_freq) - 6) * 2 / 3;
  1867			qup->clk_ctl = ((fs_div / 2) << 16) | (hs_div << 8) | (fs_div & 0xff);
  1868		}
  1869	
  1870		/*
  1871		 * Time it takes for a byte to be clocked out on the bus.
  1872		 * Each byte takes 9 clock cycles (8 bits + 1 ack).
  1873		 */
  1874		one_bit_t = (USEC_PER_SEC / clk_freq) + 1;
  1875		qup->one_byte_t = one_bit_t * 9;
  1876		qup->xfer_timeout = TOUT_MIN * HZ +
  1877			usecs_to_jiffies(MX_DMA_TX_RX_LEN * qup->one_byte_t);
  1878	
  1879		dev_dbg(qup->dev, "IN:block:%d, fifo:%d, OUT:block:%d, fifo:%d\n",
  1880			qup->in_blk_sz, qup->in_fifo_sz,
  1881			qup->out_blk_sz, qup->out_fifo_sz);
  1882	
  1883		i2c_set_adapdata(&qup->adap, qup);
  1884		qup->adap.dev.parent = qup->dev;
  1885		qup->adap.dev.of_node = pdev->dev.of_node;
  1886		qup->is_last = true;
  1887	
  1888		strscpy(qup->adap.name, "QUP I2C adapter", sizeof(qup->adap.name));
  1889	
  1890		pm_runtime_set_autosuspend_delay(qup->dev, MSEC_PER_SEC);
  1891		pm_runtime_use_autosuspend(qup->dev);
  1892		pm_runtime_set_active(qup->dev);
  1893		pm_runtime_enable(qup->dev);
  1894	
  1895		ret = i2c_add_adapter(&qup->adap);
  1896		if (ret)
  1897			goto fail_runtime;
  1898	
  1899		return 0;
  1900	
  1901	fail_runtime:
  1902		pm_runtime_disable(qup->dev);
  1903		pm_runtime_set_suspended(qup->dev);
  1904	fail:
  1905		qup_i2c_disable_clocks(qup);
  1906	fail_dma:
  1907		if (qup->btx.dma)
  1908			dma_release_channel(qup->btx.dma);
  1909		if (qup->brx.dma)
  1910			dma_release_channel(qup->brx.dma);
  1911		return ret;
  1912	}
  1913	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
