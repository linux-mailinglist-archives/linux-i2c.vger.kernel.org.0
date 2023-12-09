Return-Path: <linux-i2c+bounces-701-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B6480B250
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Dec 2023 07:19:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CFE31B20BDA
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Dec 2023 06:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E13C51867;
	Sat,  9 Dec 2023 06:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tbi/11CZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38DAB10F1
	for <linux-i2c@vger.kernel.org>; Fri,  8 Dec 2023 22:19:23 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a1ceae92ab6so376414066b.0
        for <linux-i2c@vger.kernel.org>; Fri, 08 Dec 2023 22:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702102761; x=1702707561; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SE7qvLJHOG+EjB/v+XYAGFxHzb2Bo2sb6+6iqnqa0TI=;
        b=tbi/11CZnD8fPho+Zqp7NVh1WJeHQ+x9svCbyu0YG5XCl+NFpgTOKBTBbGbMAFHp9e
         nEObgfbJFf/bk4v3ejjtf6fFKo4Hmp5Atvj3MTeTboNSk+stoOuGjofORcl0a/6YjFyu
         lfqrccAscQTrlDiV3OVprdoXApyCxkVs0zCetvGFAzCooQXmw7AQwl6MxNl3Is/gK3Th
         W2OMyuJH0aZAwcmg+f10G5a92hyXrXHahEZqE+S9szhiL5AuxoSKgMR2B3NMyNA0xibA
         ttJarGfc+MG2xZJ3Q2JIer4DrB1vW0sPD14y1k8cghAHZRp2g1BsOgDn8vbwrF6Tvt9h
         1D+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702102761; x=1702707561;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SE7qvLJHOG+EjB/v+XYAGFxHzb2Bo2sb6+6iqnqa0TI=;
        b=OZgFZxW9bHqMzNPbDhOo5UkDOcw/9qgc6IBPsV7tRtckJ52YtJlMqSFwsDbTVjjIt0
         RYX+YSQsL3yXUtwFoAugO4OJIPw+Veqn9ODrwrSzebzRLDNasQsYvrfJPwBQ9MRRr4wG
         +VQRwoCQ38qzdWuQPI7LBxdAes3j2s58OJ7KLY8ChiSvpa9B3uUf5oKAMSA2fHW9ENG2
         j5htTLfZaM49mAKWy6nhXxrKJpSPPfBa/c3j8fK9CfuoBiNjY8HQyH5XzdJWgxuGNXXT
         rzPac4wC5sIlhTWO/AdTyN6gAtkdi7leqrz3TR9w99jQZnIdAYjZdVrEvzxm6kKEJ3Oq
         l+xw==
X-Gm-Message-State: AOJu0YwpyFe36dJ7pccPTD/PRL2fRlWJBG3FLKfI4enaqUAOmwdCAaKD
	9xOdkFjXP9mBd7fTFYf3aI84mQ==
X-Google-Smtp-Source: AGHT+IEqBZL2ACU3gMuYM+N8dFy5XASza0/wIWAeVDw1TjQLoXeFyGk/R12dl1sVOytAbzHuWpNXdA==
X-Received: by 2002:a17:907:7b82:b0:a1a:f475:2ebf with SMTP id ne2-20020a1709077b8200b00a1af4752ebfmr624004ejc.59.1702102761631;
        Fri, 08 Dec 2023 22:19:21 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id le9-20020a170907170900b00a1e2aa3d090sm1796632ejc.206.2023.12.08.22.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 22:19:21 -0800 (PST)
Date: Sat, 9 Dec 2023 09:19:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Elad Nachman <enachman@marvell.com>,
	gregory.clement@bootlin.com, andi.shyti@kernel.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, enachman@marvell.com,
	cyuval@marvell.com
Subject: Re: [PATCH v2 1/1] i2c: busses: i2c-mv64xxx: fix arb-loss i2c lock
Message-ID: <ae4bc7f8-2a20-494d-bf93-48f0bdd7562a@suswa.mountain>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231207165027.2628302-2-enachman@marvell.com>

Hi Elad,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Elad-Nachman/i2c-busses-i2c-mv64xxx-fix-arb-loss-i2c-lock/20231208-005406
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
patch link:    https://lore.kernel.org/r/20231207165027.2628302-2-enachman%40marvell.com
patch subject: [PATCH v2 1/1] i2c: busses: i2c-mv64xxx: fix arb-loss i2c lock
config: csky-randconfig-r081-20231208 (https://download.01.org/0day-ci/archive/20231208/202312081920.oIwWca3H-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231208/202312081920.oIwWca3H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202312081920.oIwWca3H-lkp@intel.com/

smatch warnings:
drivers/i2c/busses/i2c-mv64xxx.c:440 mv64xxx_i2c_do_action() error: uninitialized symbol 'ret'.

vim +/ret +440 drivers/i2c/busses/i2c-mv64xxx.c

^1da177e4c3f41 Linus Torvalds      2005-04-16  368  static void
^1da177e4c3f41 Linus Torvalds      2005-04-16  369  mv64xxx_i2c_do_action(struct mv64xxx_i2c_data *drv_data)
^1da177e4c3f41 Linus Torvalds      2005-04-16  370  {
8ea9d334890b12 Elad Nachman        2023-12-07  371  	struct pinctrl *pc;
8ea9d334890b12 Elad Nachman        2023-12-07  372  	int i, ret;
8ea9d334890b12 Elad Nachman        2023-12-07  373  
^1da177e4c3f41 Linus Torvalds      2005-04-16  374  	switch(drv_data->action) {
eda6bee6c7e67b Rodolfo Giometti    2010-11-26  375  	case MV64XXX_I2C_ACTION_SEND_RESTART:
4243fa0bad551b Russell King        2013-05-16  376  		/* We should only get here if we have further messages */
4243fa0bad551b Russell King        2013-05-16  377  		BUG_ON(drv_data->num_msgs == 0);
4243fa0bad551b Russell King        2013-05-16  378  
930ab3d403ae43 Gregory CLEMENT     2013-08-22  379  		drv_data->msgs++;
930ab3d403ae43 Gregory CLEMENT     2013-08-22  380  		drv_data->num_msgs--;
4c5b38e881b1a9 Wolfram Sang        2014-02-13  381  		mv64xxx_i2c_send_start(drv_data);
4243fa0bad551b Russell King        2013-05-16  382  
c1d15b68aab86f Gregory CLEMENT     2013-08-22  383  		if (drv_data->errata_delay)
c1d15b68aab86f Gregory CLEMENT     2013-08-22  384  			udelay(5);
c1d15b68aab86f Gregory CLEMENT     2013-08-22  385  
4243fa0bad551b Russell King        2013-05-16  386  		/*
4243fa0bad551b Russell King        2013-05-16  387  		 * We're never at the start of the message here, and by this
4243fa0bad551b Russell King        2013-05-16  388  		 * time it's already too late to do any protocol mangling.
4243fa0bad551b Russell King        2013-05-16  389  		 * Thankfully, do not advertise support for that feature.
4243fa0bad551b Russell King        2013-05-16  390  		 */
4243fa0bad551b Russell King        2013-05-16  391  		drv_data->send_stop = drv_data->num_msgs == 1;
eda6bee6c7e67b Rodolfo Giometti    2010-11-26  392  		break;
eda6bee6c7e67b Rodolfo Giometti    2010-11-26  393  
^1da177e4c3f41 Linus Torvalds      2005-04-16  394  	case MV64XXX_I2C_ACTION_CONTINUE:
^1da177e4c3f41 Linus Torvalds      2005-04-16  395  		writel(drv_data->cntl_bits,
004e8ed7cc67f4 Maxime Ripard       2013-06-12  396  			drv_data->reg_base + drv_data->reg_offsets.control);
^1da177e4c3f41 Linus Torvalds      2005-04-16  397  		break;
^1da177e4c3f41 Linus Torvalds      2005-04-16  398  
^1da177e4c3f41 Linus Torvalds      2005-04-16  399  	case MV64XXX_I2C_ACTION_SEND_ADDR_1:
^1da177e4c3f41 Linus Torvalds      2005-04-16  400  		writel(drv_data->addr1,
004e8ed7cc67f4 Maxime Ripard       2013-06-12  401  			drv_data->reg_base + drv_data->reg_offsets.data);
^1da177e4c3f41 Linus Torvalds      2005-04-16  402  		writel(drv_data->cntl_bits,
004e8ed7cc67f4 Maxime Ripard       2013-06-12  403  			drv_data->reg_base + drv_data->reg_offsets.control);
^1da177e4c3f41 Linus Torvalds      2005-04-16  404  		break;
^1da177e4c3f41 Linus Torvalds      2005-04-16  405  
^1da177e4c3f41 Linus Torvalds      2005-04-16  406  	case MV64XXX_I2C_ACTION_SEND_ADDR_2:
^1da177e4c3f41 Linus Torvalds      2005-04-16  407  		writel(drv_data->addr2,
004e8ed7cc67f4 Maxime Ripard       2013-06-12  408  			drv_data->reg_base + drv_data->reg_offsets.data);
^1da177e4c3f41 Linus Torvalds      2005-04-16  409  		writel(drv_data->cntl_bits,
004e8ed7cc67f4 Maxime Ripard       2013-06-12  410  			drv_data->reg_base + drv_data->reg_offsets.control);
^1da177e4c3f41 Linus Torvalds      2005-04-16  411  		break;
^1da177e4c3f41 Linus Torvalds      2005-04-16  412  
^1da177e4c3f41 Linus Torvalds      2005-04-16  413  	case MV64XXX_I2C_ACTION_SEND_DATA:
^1da177e4c3f41 Linus Torvalds      2005-04-16  414  		writel(drv_data->msg->buf[drv_data->byte_posn++],
004e8ed7cc67f4 Maxime Ripard       2013-06-12  415  			drv_data->reg_base + drv_data->reg_offsets.data);
^1da177e4c3f41 Linus Torvalds      2005-04-16  416  		writel(drv_data->cntl_bits,
004e8ed7cc67f4 Maxime Ripard       2013-06-12  417  			drv_data->reg_base + drv_data->reg_offsets.control);
^1da177e4c3f41 Linus Torvalds      2005-04-16  418  		break;
^1da177e4c3f41 Linus Torvalds      2005-04-16  419  
^1da177e4c3f41 Linus Torvalds      2005-04-16  420  	case MV64XXX_I2C_ACTION_RCV_DATA:
^1da177e4c3f41 Linus Torvalds      2005-04-16  421  		drv_data->msg->buf[drv_data->byte_posn++] =
004e8ed7cc67f4 Maxime Ripard       2013-06-12  422  			readl(drv_data->reg_base + drv_data->reg_offsets.data);
^1da177e4c3f41 Linus Torvalds      2005-04-16  423  		writel(drv_data->cntl_bits,
004e8ed7cc67f4 Maxime Ripard       2013-06-12  424  			drv_data->reg_base + drv_data->reg_offsets.control);
^1da177e4c3f41 Linus Torvalds      2005-04-16  425  		break;
^1da177e4c3f41 Linus Torvalds      2005-04-16  426  
8ea9d334890b12 Elad Nachman        2023-12-07  427  	case MV64XXX_I2C_ACTION_UNLOCK_BUS:
8ea9d334890b12 Elad Nachman        2023-12-07  428  		if (!drv_data->soft_reset)
8ea9d334890b12 Elad Nachman        2023-12-07  429  			break;
8ea9d334890b12 Elad Nachman        2023-12-07  430  
8ea9d334890b12 Elad Nachman        2023-12-07  431  		pc = devm_pinctrl_get(drv_data->adapter.dev.parent);
8ea9d334890b12 Elad Nachman        2023-12-07  432  		if (IS_ERR(pc)) {
8ea9d334890b12 Elad Nachman        2023-12-07  433  			dev_err(&drv_data->adapter.dev,
8ea9d334890b12 Elad Nachman        2023-12-07  434  				"failed to get pinctrl for bus unlock!\n");
8ea9d334890b12 Elad Nachman        2023-12-07  435  			break;
8ea9d334890b12 Elad Nachman        2023-12-07  436  		}
8ea9d334890b12 Elad Nachman        2023-12-07  437  
8ea9d334890b12 Elad Nachman        2023-12-07  438  		/* Change i2c MPPs state to act as GPIOs: */
8ea9d334890b12 Elad Nachman        2023-12-07  439  		if (pinctrl_select_state(pc, drv_data->i2c_gpio_state) >= 0) {
8ea9d334890b12 Elad Nachman        2023-12-07 @440  			if (!ret) {
                                                                            ^^^^
"ret" isn't ever initialized.

8ea9d334890b12 Elad Nachman        2023-12-07  441  				/*
8ea9d334890b12 Elad Nachman        2023-12-07  442  				 * Toggle i2c scl (serial clock) 10 times.
8ea9d334890b12 Elad Nachman        2023-12-07  443  				 * 10 clocks are enough to transfer a full
8ea9d334890b12 Elad Nachman        2023-12-07  444  				 * byte plus extra as seen from tests with
8ea9d334890b12 Elad Nachman        2023-12-07  445  				 * Ubiquity SFP module causing the issue.
8ea9d334890b12 Elad Nachman        2023-12-07  446  				 * This allows the slave that occupies
8ea9d334890b12 Elad Nachman        2023-12-07  447  				 * the bus to transmit its remaining data,
8ea9d334890b12 Elad Nachman        2023-12-07  448  				 * so it can release the i2c bus:
8ea9d334890b12 Elad Nachman        2023-12-07  449  				 */
8ea9d334890b12 Elad Nachman        2023-12-07  450  				for (i = 0; i < 10; i++) {
8ea9d334890b12 Elad Nachman        2023-12-07  451  					gpio_set_value(drv_data->scl_gpio, 1);
8ea9d334890b12 Elad Nachman        2023-12-07  452  					udelay(100);
8ea9d334890b12 Elad Nachman        2023-12-07  453  					gpio_set_value(drv_data->scl_gpio, 0);
8ea9d334890b12 Elad Nachman        2023-12-07  454  				};
8ea9d334890b12 Elad Nachman        2023-12-07  455  			}
8ea9d334890b12 Elad Nachman        2023-12-07  456  
8ea9d334890b12 Elad Nachman        2023-12-07  457  			/* restore i2c pin state to MPPs: */
8ea9d334890b12 Elad Nachman        2023-12-07  458  			pinctrl_select_state(pc, drv_data->i2c_mpp_state);
8ea9d334890b12 Elad Nachman        2023-12-07  459  		}
8ea9d334890b12 Elad Nachman        2023-12-07  460  
8ea9d334890b12 Elad Nachman        2023-12-07  461  		/*
8ea9d334890b12 Elad Nachman        2023-12-07  462  		 * Trigger controller soft reset
8ea9d334890b12 Elad Nachman        2023-12-07  463  		 * This register is write only, with none of the bits defined.
8ea9d334890b12 Elad Nachman        2023-12-07  464  		 * So any value will do.
8ea9d334890b12 Elad Nachman        2023-12-07  465  		 * 0x1 just seems more intuitive than 0x0 ...
8ea9d334890b12 Elad Nachman        2023-12-07  466  		 */
8ea9d334890b12 Elad Nachman        2023-12-07  467  		writel(0x1, drv_data->reg_base + drv_data->reg_offsets.soft_reset);
8ea9d334890b12 Elad Nachman        2023-12-07  468  		/* wait for i2c controller to complete reset: */
8ea9d334890b12 Elad Nachman        2023-12-07  469  		udelay(100);
8ea9d334890b12 Elad Nachman        2023-12-07  470  		/*
8ea9d334890b12 Elad Nachman        2023-12-07  471  		 * need to proceed to the data stop condition generation clause.
8ea9d334890b12 Elad Nachman        2023-12-07  472  		 * This is needed after clock toggling to put the i2c slave
8ea9d334890b12 Elad Nachman        2023-12-07  473  		 * in the correct state.
8ea9d334890b12 Elad Nachman        2023-12-07  474  		 */
8ea9d334890b12 Elad Nachman        2023-12-07  475  		fallthrough;
8ea9d334890b12 Elad Nachman        2023-12-07  476  
^1da177e4c3f41 Linus Torvalds      2005-04-16  477  	case MV64XXX_I2C_ACTION_RCV_DATA_STOP:
^1da177e4c3f41 Linus Torvalds      2005-04-16  478  		drv_data->msg->buf[drv_data->byte_posn++] =
004e8ed7cc67f4 Maxime Ripard       2013-06-12  479  			readl(drv_data->reg_base + drv_data->reg_offsets.data);
544a8d75f3d6e6 Chris Morgan        2022-03-30  480  		if (!drv_data->atomic)
^1da177e4c3f41 Linus Torvalds      2005-04-16  481  			drv_data->cntl_bits &= ~MV64XXX_I2C_REG_CONTROL_INTEN;
^1da177e4c3f41 Linus Torvalds      2005-04-16  482  		writel(drv_data->cntl_bits | MV64XXX_I2C_REG_CONTROL_STOP,
004e8ed7cc67f4 Maxime Ripard       2013-06-12  483  			drv_data->reg_base + drv_data->reg_offsets.control);
^1da177e4c3f41 Linus Torvalds      2005-04-16  484  		drv_data->block = 0;
c1d15b68aab86f Gregory CLEMENT     2013-08-22  485  		if (drv_data->errata_delay)
c1d15b68aab86f Gregory CLEMENT     2013-08-22  486  			udelay(5);
c1d15b68aab86f Gregory CLEMENT     2013-08-22  487  
d295a86eab200b Russell King        2013-05-16  488  		wake_up(&drv_data->waitq);
^1da177e4c3f41 Linus Torvalds      2005-04-16  489  		break;
^1da177e4c3f41 Linus Torvalds      2005-04-16  490  
^1da177e4c3f41 Linus Torvalds      2005-04-16  491  	case MV64XXX_I2C_ACTION_INVALID:
^1da177e4c3f41 Linus Torvalds      2005-04-16  492  	default:
^1da177e4c3f41 Linus Torvalds      2005-04-16  493  		dev_err(&drv_data->adapter.dev,
^1da177e4c3f41 Linus Torvalds      2005-04-16  494  			"mv64xxx_i2c_do_action: Invalid action: %d\n",
^1da177e4c3f41 Linus Torvalds      2005-04-16  495  			drv_data->action);
^1da177e4c3f41 Linus Torvalds      2005-04-16  496  		drv_data->rc = -EIO;
4db7e1786db505 Gustavo A. R. Silva 2020-07-21  497  		fallthrough;
^1da177e4c3f41 Linus Torvalds      2005-04-16  498  	case MV64XXX_I2C_ACTION_SEND_STOP:
544a8d75f3d6e6 Chris Morgan        2022-03-30  499  		if (!drv_data->atomic)
^1da177e4c3f41 Linus Torvalds      2005-04-16  500  			drv_data->cntl_bits &= ~MV64XXX_I2C_REG_CONTROL_INTEN;
^1da177e4c3f41 Linus Torvalds      2005-04-16  501  		writel(drv_data->cntl_bits | MV64XXX_I2C_REG_CONTROL_STOP,
004e8ed7cc67f4 Maxime Ripard       2013-06-12  502  			drv_data->reg_base + drv_data->reg_offsets.control);
^1da177e4c3f41 Linus Torvalds      2005-04-16  503  		drv_data->block = 0;
d295a86eab200b Russell King        2013-05-16  504  		wake_up(&drv_data->waitq);
^1da177e4c3f41 Linus Torvalds      2005-04-16  505  		break;
00d8689b85a7bb Thomas Petazzoni    2014-12-11  506  	}
00d8689b85a7bb Thomas Petazzoni    2014-12-11  507  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


