Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CD2416A177
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2020 10:14:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728531AbgBXJOB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Feb 2020 04:14:01 -0500
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:36500
        "EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727581AbgBXJOA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Feb 2020 04:14:00 -0500
X-IronPort-AV: E=Sophos;i="5.70,479,1574118000"; 
   d="scan'208";a="340198529"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Feb 2020 10:13:57 +0100
Date:   Mon, 24 Feb 2020 10:13:52 +0100 (CET)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: julia@hadrien
To:     Stefan Schaeckeler <schaecsn@gmx.net>
cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Lutomirski <luto@kernel.org>, kbuild-all@lists.01.org
Subject: Re: [PATCH 1/1] i2c: imc: Add support for Intel iMC SMBus host
 controller. (fwd)
Message-ID: <alpine.DEB.2.21.2002241012330.2936@hadrien>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,

Devm-allocated data should not be kfreed.  The label probe_out_free does
not look necessary.

julia

---------- Forwarded message ----------
Date: Mon, 24 Feb 2020 11:49:07 +0800
From: kbuild test robot <lkp@intel.com>
To: kbuild@lists.01.org
Cc: Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [PATCH 1/1] i2c: imc: Add support for Intel iMC SMBus host
    controller.

CC: kbuild-all@lists.01.org
In-Reply-To: <1582498270-50674-2-git-send-email-schaecsn@gmx.net>
References: <1582498270-50674-2-git-send-email-schaecsn@gmx.net>
TO: Stefan Schaeckeler <schaecsn@gmx.net>
CC: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>

Hi Stefan,

I love your patch! Perhaps something to improve:

[auto build test WARNING on wsa/i2c/for-next]
[also build test WARNING on linux/master linus/master v5.6-rc2 next-20200221]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Stefan-Schaeckeler/i2c-imc-Add-support-for-Intel-iMC-SMBus-host-controller/20200224-065435
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>

>> drivers/i2c/busses/i2c-imc.c:447:1-6: WARNING: invalid free of devm_ allocated data

# https://github.com/0day-ci/linux/commit/d7855ea60367262eb4f8252da00de63a0b546234
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout d7855ea60367262eb4f8252da00de63a0b546234
vim +447 drivers/i2c/busses/i2c-imc.c

d7855ea6036726 Stefan Schaeckeler 2020-02-23  382
d7855ea6036726 Stefan Schaeckeler 2020-02-23  383  static int imc_probe(struct pci_dev *dev, const struct pci_device_id *id)
d7855ea6036726 Stefan Schaeckeler 2020-02-23  384  {
d7855ea6036726 Stefan Schaeckeler 2020-02-23  385  	int i, j, err;
d7855ea6036726 Stefan Schaeckeler 2020-02-23  386  	struct imc_priv *priv;
d7855ea6036726 Stefan Schaeckeler 2020-02-23  387  	struct pci_dev *sad;  /* System Address Decoder */
d7855ea6036726 Stefan Schaeckeler 2020-02-23  388  	u32 sadcntl;
d7855ea6036726 Stefan Schaeckeler 2020-02-23  389
d7855ea6036726 Stefan Schaeckeler 2020-02-23  390  	/* Sanity check. This device is always at 0x13.0 */
d7855ea6036726 Stefan Schaeckeler 2020-02-23  391  	if (dev->devfn != PCI_DEVFN(0x13, 0))
d7855ea6036726 Stefan Schaeckeler 2020-02-23  392  		return -ENODEV;
d7855ea6036726 Stefan Schaeckeler 2020-02-23  393
d7855ea6036726 Stefan Schaeckeler 2020-02-23  394  	priv = devm_kzalloc(&dev->dev, sizeof(*priv), GFP_KERNEL);
d7855ea6036726 Stefan Schaeckeler 2020-02-23  395  	if (!priv)
d7855ea6036726 Stefan Schaeckeler 2020-02-23  396  		return -ENOMEM;
d7855ea6036726 Stefan Schaeckeler 2020-02-23  397  	priv->pci_dev = dev;
d7855ea6036726 Stefan Schaeckeler 2020-02-23  398  	pci_set_drvdata(dev, priv);
d7855ea6036726 Stefan Schaeckeler 2020-02-23  399
d7855ea6036726 Stefan Schaeckeler 2020-02-23  400  	/*
d7855ea6036726 Stefan Schaeckeler 2020-02-23  401  	 * From sad, we learn the local node id of the socket.
d7855ea6036726 Stefan Schaeckeler 2020-02-23  402  	 *
d7855ea6036726 Stefan Schaeckeler 2020-02-23  403  	 * The socket will not change at runtime and so we throw away sad.
d7855ea6036726 Stefan Schaeckeler 2020-02-23  404  	 */
d7855ea6036726 Stefan Schaeckeler 2020-02-23  405  	sad = imc_get_related_device(dev->bus, PCI_DEVFN(0x0f, 5),
d7855ea6036726 Stefan Schaeckeler 2020-02-23  406  				     PCI_DEVICE_ID_INTEL_BROADWELL_IMC_SAD);
d7855ea6036726 Stefan Schaeckeler 2020-02-23  407  	if (!sad) {
d7855ea6036726 Stefan Schaeckeler 2020-02-23  408  		err = -ENODEV;
d7855ea6036726 Stefan Schaeckeler 2020-02-23  409  		goto probe_out_free;
d7855ea6036726 Stefan Schaeckeler 2020-02-23  410  	}
d7855ea6036726 Stefan Schaeckeler 2020-02-23  411  	pci_read_config_dword(sad, SADCNTL, &sadcntl);
d7855ea6036726 Stefan Schaeckeler 2020-02-23  412  	pci_dev_put(sad);
d7855ea6036726 Stefan Schaeckeler 2020-02-23  413
d7855ea6036726 Stefan Schaeckeler 2020-02-23  414  	/*
d7855ea6036726 Stefan Schaeckeler 2020-02-23  415  	 * From pcu, we access the CLTT polling interval.
d7855ea6036726 Stefan Schaeckeler 2020-02-23  416  	 *
d7855ea6036726 Stefan Schaeckeler 2020-02-23  417  	 * The polling interval is set by BIOS. We assume it will not change at
d7855ea6036726 Stefan Schaeckeler 2020-02-23  418  	 * runtime and cache the initial value.
d7855ea6036726 Stefan Schaeckeler 2020-02-23  419  	 */
d7855ea6036726 Stefan Schaeckeler 2020-02-23  420  	priv->pcu.pci_dev = imc_get_related_device(dev->bus, PCI_DEVFN(0x1e, 1),
d7855ea6036726 Stefan Schaeckeler 2020-02-23  421  					 PCI_DEVICE_ID_INTEL_BROADWELL_IMC_PCU);
d7855ea6036726 Stefan Schaeckeler 2020-02-23  422  	if (!priv->pcu.pci_dev) {
d7855ea6036726 Stefan Schaeckeler 2020-02-23  423  		err = -ENODEV;
d7855ea6036726 Stefan Schaeckeler 2020-02-23  424  		goto probe_out_free;
d7855ea6036726 Stefan Schaeckeler 2020-02-23  425  	}
d7855ea6036726 Stefan Schaeckeler 2020-02-23  426  	pci_read_config_dword(priv->pcu.pci_dev, TSODCNTL,
d7855ea6036726 Stefan Schaeckeler 2020-02-23  427  			      &priv->pcu.tsod_polling_interval);
d7855ea6036726 Stefan Schaeckeler 2020-02-23  428
d7855ea6036726 Stefan Schaeckeler 2020-02-23  429  	mutex_init(&priv->pcu.mutex);
d7855ea6036726 Stefan Schaeckeler 2020-02-23  430
d7855ea6036726 Stefan Schaeckeler 2020-02-23  431  	for (i = 0; i < 2; i++) {
d7855ea6036726 Stefan Schaeckeler 2020-02-23  432  		err = imc_init_channelpair(priv, i,
d7855ea6036726 Stefan Schaeckeler 2020-02-23  433  					   sadcntl & SADCNTL_LOCAL_NODEID_MASK);
d7855ea6036726 Stefan Schaeckeler 2020-02-23  434  		if (err)
d7855ea6036726 Stefan Schaeckeler 2020-02-23  435  			goto probe_out_free_channelpair;
d7855ea6036726 Stefan Schaeckeler 2020-02-23  436  	}
d7855ea6036726 Stefan Schaeckeler 2020-02-23  437
d7855ea6036726 Stefan Schaeckeler 2020-02-23  438  	return 0;
d7855ea6036726 Stefan Schaeckeler 2020-02-23  439
d7855ea6036726 Stefan Schaeckeler 2020-02-23  440  probe_out_free_channelpair:
d7855ea6036726 Stefan Schaeckeler 2020-02-23  441  	for (j = 0; j < i; j++)
d7855ea6036726 Stefan Schaeckeler 2020-02-23  442  		imc_free_channelpair(priv, j);
d7855ea6036726 Stefan Schaeckeler 2020-02-23  443
d7855ea6036726 Stefan Schaeckeler 2020-02-23  444  	mutex_destroy(&priv->pcu.mutex);
d7855ea6036726 Stefan Schaeckeler 2020-02-23  445
d7855ea6036726 Stefan Schaeckeler 2020-02-23  446  probe_out_free:
d7855ea6036726 Stefan Schaeckeler 2020-02-23 @447  	kfree(priv);
d7855ea6036726 Stefan Schaeckeler 2020-02-23  448  	return err;
d7855ea6036726 Stefan Schaeckeler 2020-02-23  449  }
d7855ea6036726 Stefan Schaeckeler 2020-02-23  450

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
