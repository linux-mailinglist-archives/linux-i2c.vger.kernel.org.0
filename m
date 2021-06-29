Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1120E3B6EA7
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Jun 2021 09:20:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232268AbhF2HWT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Jun 2021 03:22:19 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:49034 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232213AbhF2HWT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Jun 2021 03:22:19 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15T7BWev006085;
        Tue, 29 Jun 2021 07:19:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=ZWMTaiOyC9PmFlVZIZTQfCfE/BnTRsHOg4xNPZ81rXQ=;
 b=f3Zcu0MC0oOXzM00NIvZxwkzlVRQ6DyQE5tiEDq0PKCWxic+lljAI8X1rND+w4GHYY5c
 PDDG/ZAZVeeHtQ0iDeZlPFti7IJKeKArq8DbGcJyUsHt4FMaglm9+BJPYT+86PZ5O5py
 09+/2fQzU1AjEh5JNbiNBZF+/mnxXRmqleYq7+ETb6mJk5oLAEsP4/lAadb9t2sJBzMT
 RBh52MJo35JDG5RaEt95/JblVpBQ44AEUns6Y+QqufeOt1W3PREuOO8s8+fkjZ4OQkDC
 i3vL3nyfz8ee/xNqagnPFel7A+cLybA11JLUEkzPcMbidB5RdjjFRNAX6dwVythcrVhr SQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 39fpu2gptk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 29 Jun 2021 07:19:42 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15T7A2LQ150106;
        Tue, 29 Jun 2021 07:19:41 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3030.oracle.com with ESMTP id 39dt9e74g5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 29 Jun 2021 07:19:41 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15T7H3PV174814;
        Tue, 29 Jun 2021 07:19:40 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3030.oracle.com with ESMTP id 39dt9e74fk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 29 Jun 2021 07:19:40 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
        by aserv0121.oracle.com (8.14.4/8.14.4) with ESMTP id 15T7JdDA028437;
        Tue, 29 Jun 2021 07:19:39 GMT
Received: from kadam (/102.222.70.252)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 29 Jun 2021 00:19:37 -0700
Date:   Tue, 29 Jun 2021 10:19:30 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     kbuild@lists.01.org, Sergey Shtylyov <s.shtylyov@omp.ru>,
        linux-i2c@vger.kernel.org
Cc:     lkp@intel.com, kbuild-all@lists.01.org
Subject: [kbuild] Re: [PATCH 3/5] i2c: pmcmsp: fix-IRQ-check
Message-ID: <202106290431.ob2uIr6K-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <31a2d0c2-8069-6a73-ef7e-40e1146d5c56@omp.ru>
Message-ID-Hash: PEJTIJHEBPLZJG3CLPQGI2ECDQ2OVAMG
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: -MTG_3AcYrAp8uRleF9hnQexRpYTkD0i
X-Proofpoint-ORIG-GUID: -MTG_3AcYrAp8uRleF9hnQexRpYTkD0i
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Sergey,

url:    https://github.com/0day-ci/linux/commits/Sergey-Shtylyov/Correctly-handle-plaform_get_irq-s-result-in-the-i2C-drivers/20210624-050805 
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git  i2c/for-next
config: microblaze-randconfig-m031-20210628 (attached as .config)
compiler: microblaze-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/i2c/busses/i2c-pmcmsp.c:355 pmcmsptwi_probe() warn: 'pmcmsptwi_data.iobase' not released on lines: 296.
drivers/i2c/busses/i2c-pmcmsp.c:355 pmcmsptwi_probe() warn: 'res->start' not released on lines: 296.

vim +355 drivers/i2c/busses/i2c-pmcmsp.c

0b255e927d47b5 Bill Pemberton      2012-11-27  261  static int pmcmsptwi_probe(struct platform_device *pldev)
1b144df1d7d69d Marc St-Jean        2007-07-12  262  {
1b144df1d7d69d Marc St-Jean        2007-07-12  263  	struct resource *res;
1b144df1d7d69d Marc St-Jean        2007-07-12  264  	int rc = -ENODEV;
1b144df1d7d69d Marc St-Jean        2007-07-12  265  
1b144df1d7d69d Marc St-Jean        2007-07-12  266  	/* get the static platform resources */
1b144df1d7d69d Marc St-Jean        2007-07-12  267  	res = platform_get_resource(pldev, IORESOURCE_MEM, 0);
1b144df1d7d69d Marc St-Jean        2007-07-12  268  	if (!res) {
1b144df1d7d69d Marc St-Jean        2007-07-12  269  		dev_err(&pldev->dev, "IOMEM resource not found\n");
1b144df1d7d69d Marc St-Jean        2007-07-12  270  		goto ret_err;
1b144df1d7d69d Marc St-Jean        2007-07-12  271  	}
1b144df1d7d69d Marc St-Jean        2007-07-12  272  
1b144df1d7d69d Marc St-Jean        2007-07-12  273  	/* reserve the memory region */
c6ffddea36dd57 Linus Walleij       2009-06-14  274  	if (!request_mem_region(res->start, resource_size(res),
1b144df1d7d69d Marc St-Jean        2007-07-12  275  				pldev->name)) {
1b144df1d7d69d Marc St-Jean        2007-07-12  276  		dev_err(&pldev->dev,
066e6e805d4af2 Krzysztof Kozlowski 2020-01-15  277  			"Unable to get memory/io address region %pap\n",
066e6e805d4af2 Krzysztof Kozlowski 2020-01-15  278  			&res->start);
1b144df1d7d69d Marc St-Jean        2007-07-12  279  		rc = -EBUSY;
1b144df1d7d69d Marc St-Jean        2007-07-12  280  		goto ret_err;
1b144df1d7d69d Marc St-Jean        2007-07-12  281  	}
1b144df1d7d69d Marc St-Jean        2007-07-12  282  
1b144df1d7d69d Marc St-Jean        2007-07-12  283  	/* remap the memory */
4bdc0d676a6431 Christoph Hellwig   2020-01-06  284  	pmcmsptwi_data.iobase = ioremap(res->start,
c6ffddea36dd57 Linus Walleij       2009-06-14  285  						resource_size(res));
1b144df1d7d69d Marc St-Jean        2007-07-12  286  	if (!pmcmsptwi_data.iobase) {
1b144df1d7d69d Marc St-Jean        2007-07-12  287  		dev_err(&pldev->dev,
066e6e805d4af2 Krzysztof Kozlowski 2020-01-15  288  			"Unable to ioremap address %pap\n", &res->start);
1b144df1d7d69d Marc St-Jean        2007-07-12  289  		rc = -EIO;
1b144df1d7d69d Marc St-Jean        2007-07-12  290  		goto ret_unreserve;
1b144df1d7d69d Marc St-Jean        2007-07-12  291  	}
1b144df1d7d69d Marc St-Jean        2007-07-12  292  
1b144df1d7d69d Marc St-Jean        2007-07-12  293  	/* request the irq */
fa227704e6a1e0 Sergey Shtylyov     2021-06-23  294  	rc = platform_get_irq(pldev, 0);
fa227704e6a1e0 Sergey Shtylyov     2021-06-23  295  	if (rc == -EPROBE_DEFER)
fa227704e6a1e0 Sergey Shtylyov     2021-06-23  296  		return rc;

Need to clean up the ioremap() and the request_mem_region().

fa227704e6a1e0 Sergey Shtylyov     2021-06-23  297  	if (rc <= 0) {
fa227704e6a1e0 Sergey Shtylyov     2021-06-23  298  		pmcmsptwi_data.irq = 0;
fa227704e6a1e0 Sergey Shtylyov     2021-06-23  299  	} else {
fa227704e6a1e0 Sergey Shtylyov     2021-06-23  300  		pmcmsptwi_data.irq = rc;
1b144df1d7d69d Marc St-Jean        2007-07-12  301  		rc = request_irq(pmcmsptwi_data.irq, &pmcmsptwi_interrupt,
d38a0149e8a11c Theodore Ts'o       2012-07-17  302  				 IRQF_SHARED, pldev->name, &pmcmsptwi_data);
1b144df1d7d69d Marc St-Jean        2007-07-12  303  		if (rc == 0) {
1b144df1d7d69d Marc St-Jean        2007-07-12  304  			/*
1b144df1d7d69d Marc St-Jean        2007-07-12  305  			 * Enable 'DONE' interrupt only.
1b144df1d7d69d Marc St-Jean        2007-07-12  306  			 *
1b144df1d7d69d Marc St-Jean        2007-07-12  307  			 * If you enable all interrupts, you will get one on
1b144df1d7d69d Marc St-Jean        2007-07-12  308  			 * error and another when the operation completes.
1b144df1d7d69d Marc St-Jean        2007-07-12  309  			 * This way you only have to handle one interrupt,
1b144df1d7d69d Marc St-Jean        2007-07-12  310  			 * but you can still check all result flags.
1b144df1d7d69d Marc St-Jean        2007-07-12  311  			 */
1b144df1d7d69d Marc St-Jean        2007-07-12  312  			pmcmsptwi_writel(MSP_TWI_INT_STS_DONE,
1b144df1d7d69d Marc St-Jean        2007-07-12  313  					pmcmsptwi_data.iobase +
1b144df1d7d69d Marc St-Jean        2007-07-12  314  					MSP_TWI_INT_MSK_REG_OFFSET);
1b144df1d7d69d Marc St-Jean        2007-07-12  315  		} else {
1b144df1d7d69d Marc St-Jean        2007-07-12  316  			dev_warn(&pldev->dev,
1b144df1d7d69d Marc St-Jean        2007-07-12  317  				"Could not assign TWI IRQ handler "
1b144df1d7d69d Marc St-Jean        2007-07-12  318  				"to irq %d (continuing with poll)\n",
1b144df1d7d69d Marc St-Jean        2007-07-12  319  				pmcmsptwi_data.irq);
1b144df1d7d69d Marc St-Jean        2007-07-12  320  			pmcmsptwi_data.irq = 0;
1b144df1d7d69d Marc St-Jean        2007-07-12  321  		}
1b144df1d7d69d Marc St-Jean        2007-07-12  322  	}
1b144df1d7d69d Marc St-Jean        2007-07-12  323  
1b144df1d7d69d Marc St-Jean        2007-07-12  324  	init_completion(&pmcmsptwi_data.wait);
1b144df1d7d69d Marc St-Jean        2007-07-12  325  	mutex_init(&pmcmsptwi_data.lock);
1b144df1d7d69d Marc St-Jean        2007-07-12  326  
1b144df1d7d69d Marc St-Jean        2007-07-12  327  	pmcmsptwi_set_clock_config(&pmcmsptwi_defclockcfg, &pmcmsptwi_data);
1b144df1d7d69d Marc St-Jean        2007-07-12  328  	pmcmsptwi_set_twi_config(&pmcmsptwi_defcfg, &pmcmsptwi_data);
1b144df1d7d69d Marc St-Jean        2007-07-12  329  
1b144df1d7d69d Marc St-Jean        2007-07-12  330  	printk(KERN_INFO DRV_NAME ": Registering MSP71xx I2C adapter\n");
1b144df1d7d69d Marc St-Jean        2007-07-12  331  
1b144df1d7d69d Marc St-Jean        2007-07-12  332  	pmcmsptwi_adapter.dev.parent = &pldev->dev;
1b144df1d7d69d Marc St-Jean        2007-07-12  333  	platform_set_drvdata(pldev, &pmcmsptwi_adapter);
1b144df1d7d69d Marc St-Jean        2007-07-12  334  	i2c_set_adapdata(&pmcmsptwi_adapter, &pmcmsptwi_data);
1b144df1d7d69d Marc St-Jean        2007-07-12  335  
1b144df1d7d69d Marc St-Jean        2007-07-12  336  	rc = i2c_add_adapter(&pmcmsptwi_adapter);
ea734404f3daf1 Wolfram Sang        2016-08-09  337  	if (rc)
1b144df1d7d69d Marc St-Jean        2007-07-12  338  		goto ret_unmap;
1b144df1d7d69d Marc St-Jean        2007-07-12  339  
1b144df1d7d69d Marc St-Jean        2007-07-12  340  	return 0;
1b144df1d7d69d Marc St-Jean        2007-07-12  341  
1b144df1d7d69d Marc St-Jean        2007-07-12  342  ret_unmap:
1b144df1d7d69d Marc St-Jean        2007-07-12  343  	if (pmcmsptwi_data.irq) {
1b144df1d7d69d Marc St-Jean        2007-07-12  344  		pmcmsptwi_writel(0,
1b144df1d7d69d Marc St-Jean        2007-07-12  345  			pmcmsptwi_data.iobase + MSP_TWI_INT_MSK_REG_OFFSET);
1b144df1d7d69d Marc St-Jean        2007-07-12  346  		free_irq(pmcmsptwi_data.irq, &pmcmsptwi_data);
1b144df1d7d69d Marc St-Jean        2007-07-12  347  	}
1b144df1d7d69d Marc St-Jean        2007-07-12  348  
1b144df1d7d69d Marc St-Jean        2007-07-12  349  	iounmap(pmcmsptwi_data.iobase);
1b144df1d7d69d Marc St-Jean        2007-07-12  350  
1b144df1d7d69d Marc St-Jean        2007-07-12  351  ret_unreserve:
c6ffddea36dd57 Linus Walleij       2009-06-14  352  	release_mem_region(res->start, resource_size(res));
1b144df1d7d69d Marc St-Jean        2007-07-12  353  
1b144df1d7d69d Marc St-Jean        2007-07-12  354  ret_err:
1b144df1d7d69d Marc St-Jean        2007-07-12 @355  	return rc;
1b144df1d7d69d Marc St-Jean        2007-07-12  356  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org 

_______________________________________________
kbuild mailing list -- kbuild@lists.01.org
To unsubscribe send an email to kbuild-leave@lists.01.org

