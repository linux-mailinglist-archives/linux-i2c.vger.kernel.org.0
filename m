Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D215545A454
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Nov 2021 15:01:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234779AbhKWOEx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Nov 2021 09:04:53 -0500
Received: from mga05.intel.com ([192.55.52.43]:61993 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234163AbhKWOEv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 23 Nov 2021 09:04:51 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10176"; a="321256822"
X-IronPort-AV: E=Sophos;i="5.87,257,1631602800"; 
   d="scan'208";a="321256822"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2021 06:01:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,257,1631602800"; 
   d="scan'208";a="571072733"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 23 Nov 2021 06:01:39 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mpWMd-0001v2-3I; Tue, 23 Nov 2021 14:01:39 +0000
Date:   Tue, 23 Nov 2021 22:00:54 +0800
From:   kernel test robot <lkp@intel.com>
To:     Akhil R <akhilrajeev@nvidia.com>, andy.shevchenko@gmail.com,
        christian.koenig@amd.com, digetx@gmail.com,
        dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
        ldewangan@nvidia.com, linaro-mm-sig@lists.linaro.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     kbuild-all@lists.01.org
Subject: Re: [PATCH v2] i2c: tegra: Add ACPI support
Message-ID: <202111232153.mpoejDRV-lkp@intel.com>
References: <1637651753-5067-1-git-send-email-akhilrajeev@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1637651753-5067-1-git-send-email-akhilrajeev@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Akhil,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on tegra/for-next]
[also build test ERROR on v5.16-rc2 next-20211123]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Akhil-R/i2c-tegra-Add-ACPI-support/20211123-151636
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for-next
config: m68k-randconfig-r011-20211123 (https://download.01.org/0day-ci/archive/20211123/202111232153.mpoejDRV-lkp@intel.com/config.gz)
compiler: m68k-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/dec174be801f41a9e42f4381c59c2357c25e40fb
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Akhil-R/i2c-tegra-Add-ACPI-support/20211123-151636
        git checkout dec174be801f41a9e42f4381c59c2357c25e40fb
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross ARCH=m68k 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/i2c/busses/i2c-tegra.c: In function 'tegra_i2c_init':
>> drivers/i2c/busses/i2c-tegra.c:623:23: error: implicit declaration of function 'acpi_has_method'; did you mean 'acpi_has_watchdog'? [-Werror=implicit-function-declaration]
     623 |         if (handle && acpi_has_method(handle, "_RST"))
         |                       ^~~~~~~~~~~~~~~
         |                       acpi_has_watchdog
   cc1: some warnings being treated as errors


vim +623 drivers/i2c/busses/i2c-tegra.c

   608	
   609	static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
   610	{
   611		u32 val, clk_divisor, clk_multiplier, tsu_thd, tlow, thigh, non_hs_mode;
   612		acpi_handle handle = ACPI_HANDLE(i2c_dev->dev);
   613		int err;
   614	
   615		/*
   616		 * The reset shouldn't ever fail in practice. The failure will be a
   617		 * sign of a severe problem that needs to be resolved. Still we don't
   618		 * want to fail the initialization completely because this may break
   619		 * kernel boot up since voltage regulators use I2C. Hence, we will
   620		 * emit a noisy warning on error, which won't stay unnoticed and
   621		 * won't hose machine entirely.
   622		 */
 > 623		if (handle && acpi_has_method(handle, "_RST"))
   624			err = (acpi_evaluate_object(handle, "_RST", NULL, NULL));
   625		else
   626			err = reset_control_reset(i2c_dev->rst);
   627	
   628		WARN_ON_ONCE(err);
   629	
   630		if (i2c_dev->is_dvc)
   631			tegra_dvc_init(i2c_dev);
   632	
   633		val = I2C_CNFG_NEW_MASTER_FSM | I2C_CNFG_PACKET_MODE_EN |
   634		      FIELD_PREP(I2C_CNFG_DEBOUNCE_CNT, 2);
   635	
   636		if (i2c_dev->hw->has_multi_master_mode)
   637			val |= I2C_CNFG_MULTI_MASTER_MODE;
   638	
   639		i2c_writel(i2c_dev, val, I2C_CNFG);
   640		i2c_writel(i2c_dev, 0, I2C_INT_MASK);
   641	
   642		if (i2c_dev->is_vi)
   643			tegra_i2c_vi_init(i2c_dev);
   644	
   645		switch (i2c_dev->bus_clk_rate) {
   646		case I2C_MAX_STANDARD_MODE_FREQ + 1 ... I2C_MAX_FAST_MODE_PLUS_FREQ:
   647		default:
   648			tlow = i2c_dev->hw->tlow_fast_fastplus_mode;
   649			thigh = i2c_dev->hw->thigh_fast_fastplus_mode;
   650			tsu_thd = i2c_dev->hw->setup_hold_time_fast_fast_plus_mode;
   651	
   652			if (i2c_dev->bus_clk_rate > I2C_MAX_FAST_MODE_FREQ)
   653				non_hs_mode = i2c_dev->hw->clk_divisor_fast_plus_mode;
   654			else
   655				non_hs_mode = i2c_dev->hw->clk_divisor_fast_mode;
   656			break;
   657	
   658		case 0 ... I2C_MAX_STANDARD_MODE_FREQ:
   659			tlow = i2c_dev->hw->tlow_std_mode;
   660			thigh = i2c_dev->hw->thigh_std_mode;
   661			tsu_thd = i2c_dev->hw->setup_hold_time_std_mode;
   662			non_hs_mode = i2c_dev->hw->clk_divisor_std_mode;
   663			break;
   664		}
   665	
   666		/* make sure clock divisor programmed correctly */
   667		clk_divisor = FIELD_PREP(I2C_CLK_DIVISOR_HSMODE,
   668					 i2c_dev->hw->clk_divisor_hs_mode) |
   669			      FIELD_PREP(I2C_CLK_DIVISOR_STD_FAST_MODE, non_hs_mode);
   670		i2c_writel(i2c_dev, clk_divisor, I2C_CLK_DIVISOR);
   671	
   672		if (i2c_dev->hw->has_interface_timing_reg) {
   673			val = FIELD_PREP(I2C_INTERFACE_TIMING_THIGH, thigh) |
   674			      FIELD_PREP(I2C_INTERFACE_TIMING_TLOW, tlow);
   675			i2c_writel(i2c_dev, val, I2C_INTERFACE_TIMING_0);
   676		}
   677	
   678		/*
   679		 * Configure setup and hold times only when tsu_thd is non-zero.
   680		 * Otherwise, preserve the chip default values.
   681		 */
   682		if (i2c_dev->hw->has_interface_timing_reg && tsu_thd)
   683			i2c_writel(i2c_dev, tsu_thd, I2C_INTERFACE_TIMING_1);
   684	
   685		clk_multiplier = (tlow + thigh + 2) * (non_hs_mode + 1);
   686	
   687		err = clk_set_rate(i2c_dev->div_clk,
   688				   i2c_dev->bus_clk_rate * clk_multiplier);
   689		if (err) {
   690			dev_err(i2c_dev->dev, "failed to set div-clk rate: %d\n", err);
   691			return err;
   692		}
   693	
   694		if (!i2c_dev->is_dvc && !i2c_dev->is_vi) {
   695			u32 sl_cfg = i2c_readl(i2c_dev, I2C_SL_CNFG);
   696	
   697			sl_cfg |= I2C_SL_CNFG_NACK | I2C_SL_CNFG_NEWSL;
   698			i2c_writel(i2c_dev, sl_cfg, I2C_SL_CNFG);
   699			i2c_writel(i2c_dev, 0xfc, I2C_SL_ADDR1);
   700			i2c_writel(i2c_dev, 0x00, I2C_SL_ADDR2);
   701		}
   702	
   703		err = tegra_i2c_flush_fifos(i2c_dev);
   704		if (err)
   705			return err;
   706	
   707		if (i2c_dev->multimaster_mode && i2c_dev->hw->has_slcg_override_reg)
   708			i2c_writel(i2c_dev, I2C_MST_CORE_CLKEN_OVR, I2C_CLKEN_OVERRIDE);
   709	
   710		err = tegra_i2c_wait_for_config_load(i2c_dev);
   711		if (err)
   712			return err;
   713	
   714		return 0;
   715	}
   716	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
