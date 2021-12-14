Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFBE7474332
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Dec 2021 14:13:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234263AbhLNNNM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Dec 2021 08:13:12 -0500
Received: from mga14.intel.com ([192.55.52.115]:22569 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231987AbhLNNNL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 14 Dec 2021 08:13:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639487591; x=1671023591;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cKuC4qjaDrbTudzsGa+8AQuPQgCmf8HxmSCVf6uTmxY=;
  b=UqNbvh9zW9oVG++WTx+ovGxbLQLp+dgEoxJW+4WJRRFEdX6gNCdDclll
   Oq6b119p3K3rQTwi+kkFUub5QZDAGeK52QmF+S8vTiEj8FUOPf0kVx9qW
   6VY5YiHirGpnS3Wfaqx4DigbkZTpaMVhnVkQGi91jAA+h0Nz8c79qIs9g
   giUWaBeHQ/5x/lArRKnRA0uLXjm5BTbf5BztcuVMQRlSvAByOkRdPppYv
   9Nl+jVCCwW15o+GQjZIt/9fmW4kbsUtWJcfm1BUJdsOaIJltLf18qxscv
   FAlmQd5iq1P7ufdBHOQ2FMp090XFuBrhDKHRgfuJ8qIeFyKApABQRGjkm
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="239196587"
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; 
   d="scan'208";a="239196587"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2021 05:13:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; 
   d="scan'208";a="463790490"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 14 Dec 2021 05:13:09 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mx7cC-0000L4-Lu; Tue, 14 Dec 2021 13:13:08 +0000
Date:   Tue, 14 Dec 2021 21:12:27 +0800
From:   kernel test robot <lkp@intel.com>
To:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Peter Rosin <peda@axentia.se>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] i2c-mux-pca954x: Add regulator support
Message-ID: <202112142101.s4i5cHhd-lkp@intel.com>
References: <20211214095021.572799-4-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211214095021.572799-4-patrick.rudolph@9elements.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Patrick,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on wsa/i2c/for-next]
[also build test WARNING on robh/for-next linux/master linus/master v5.16-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Patrick-Rudolph/dt-bindings-i2c-Update-PCA954x/20211214-175258
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
config: riscv-randconfig-r042-20211214 (https://download.01.org/0day-ci/archive/20211214/202112142101.s4i5cHhd-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2ddb6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/3498c52eb6aec09c78a3f07cdcb042897960f8ef
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Patrick-Rudolph/dt-bindings-i2c-Update-PCA954x/20211214-175258
        git checkout 3498c52eb6aec09c78a3f07cdcb042897960f8ef
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/i2c/muxes/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/i2c/muxes/i2c-mux-pca954x.c:502:58: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
                   dev_warn(dev, "Failed to get regulator for vcc: %d\n", ret);
                                                                          ^~~
   include/linux/dev_printk.h:146:70: note: expanded from macro 'dev_warn'
           dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                               ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                       ^~~~~~~~~~~
   drivers/i2c/muxes/i2c-mux-pca954x.c:483:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   1 warning generated.


vim +/ret +502 drivers/i2c/muxes/i2c-mux-pca954x.c

   470	
   471	/*
   472	 * I2C init/probing/exit functions
   473	 */
   474	static int pca954x_probe(struct i2c_client *client,
   475				 const struct i2c_device_id *id)
   476	{
   477		struct i2c_adapter *adap = client->adapter;
   478		struct device *dev = &client->dev;
   479		struct gpio_desc *gpio;
   480		struct i2c_mux_core *muxc;
   481		struct pca954x *data;
   482		int num;
   483		int ret;
   484	
   485		if (!i2c_check_functionality(adap, I2C_FUNC_SMBUS_BYTE))
   486			return -ENODEV;
   487	
   488		muxc = i2c_mux_alloc(adap, dev, PCA954X_MAX_NCHANS, sizeof(*data), 0,
   489				     pca954x_select_chan, pca954x_deselect_mux);
   490		if (!muxc)
   491			return -ENOMEM;
   492	
   493		data = i2c_mux_priv(muxc);
   494	
   495		i2c_set_clientdata(client, muxc);
   496		data->client = client;
   497	
   498		data->supply = devm_regulator_get(dev, "vcc");
   499		if (IS_ERR(data->supply)) {
   500			if ((PTR_ERR(data->supply) == -EPROBE_DEFER))
   501				return -EPROBE_DEFER;
 > 502			dev_warn(dev, "Failed to get regulator for vcc: %d\n", ret);
   503		} else {
   504			ret = regulator_enable(data->supply);
   505			if (ret) {
   506				dev_err(dev, "Failed to enable regulator vcc\n");
   507				return ret;
   508			}
   509		}
   510	
   511		/* Reset the mux if a reset GPIO is specified. */
   512		gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
   513		if (IS_ERR(gpio)) {
   514			ret = PTR_ERR(gpio);
   515			goto fail_cleanup;
   516		}
   517		if (gpio) {
   518			udelay(1);
   519			gpiod_set_value_cansleep(gpio, 0);
   520			/* Give the chip some time to recover. */
   521			udelay(1);
   522		}
   523	
   524		data->chip = device_get_match_data(dev);
   525		if (!data->chip)
   526			data->chip = &chips[id->driver_data];
   527	
   528		if (data->chip->id.manufacturer_id != I2C_DEVICE_ID_NONE) {
   529			struct i2c_device_identity id;
   530	
   531			ret = i2c_get_device_id(client, &id);
   532			if (ret && ret != -EOPNOTSUPP)
   533				goto fail_cleanup;
   534	
   535			if (!ret &&
   536			    (id.manufacturer_id != data->chip->id.manufacturer_id ||
   537			     id.part_id != data->chip->id.part_id)) {
   538				dev_warn(dev, "unexpected device id %03x-%03x-%x\n",
   539					 id.manufacturer_id, id.part_id,
   540					 id.die_revision);
   541				ret = -ENODEV;
   542				goto fail_cleanup;
   543			}
   544		}
   545	
   546		data->idle_state = MUX_IDLE_AS_IS;
   547		if (device_property_read_u32(dev, "idle-state", &data->idle_state)) {
   548			if (device_property_read_bool(dev, "i2c-mux-idle-disconnect"))
   549				data->idle_state = MUX_IDLE_DISCONNECT;
   550		}
   551	
   552		/*
   553		 * Write the mux register at addr to verify
   554		 * that the mux is in fact present. This also
   555		 * initializes the mux to a channel
   556		 * or disconnected state.
   557		 */
   558		ret = pca954x_init(client, data);
   559		if (ret < 0) {
   560			dev_warn(dev, "probe failed\n");
   561			ret = -ENODEV;
   562			goto fail_cleanup;
   563		}
   564	
   565		ret = pca954x_irq_setup(muxc);
   566		if (ret)
   567			goto fail_cleanup;
   568	
   569		/* Now create an adapter for each channel */
   570		for (num = 0; num < data->chip->nchans; num++) {
   571			ret = i2c_mux_add_adapter(muxc, 0, num, 0);
   572			if (ret)
   573				goto fail_cleanup;
   574		}
   575	
   576		if (data->irq) {
   577			ret = devm_request_threaded_irq(dev, data->client->irq,
   578							NULL, pca954x_irq_handler,
   579							IRQF_ONESHOT | IRQF_SHARED,
   580							"pca954x", data);
   581			if (ret)
   582				goto fail_cleanup;
   583		}
   584	
   585		/*
   586		 * The attr probably isn't going to be needed in most cases,
   587		 * so don't fail completely on error.
   588		 */
   589		device_create_file(dev, &dev_attr_idle_state);
   590	
   591		dev_info(dev, "registered %d multiplexed busses for I2C %s %s\n",
   592			 num, data->chip->muxtype == pca954x_ismux
   593					? "mux" : "switch", client->name);
   594	
   595		return 0;
   596	
   597	fail_cleanup:
   598		pca954x_cleanup(muxc);
   599		return ret;
   600	}
   601	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
