Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E25939DEA9
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jun 2021 16:25:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230265AbhFGO0y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Jun 2021 10:26:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230198AbhFGO0x (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Jun 2021 10:26:53 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04018C061766;
        Mon,  7 Jun 2021 07:25:02 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id g4so489315pjk.0;
        Mon, 07 Jun 2021 07:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QmGFcYwtnti0Kimuy1kQWFpXTGjTW9qbFTJ4jXOu9+s=;
        b=IfTeDBJryqVzwRoDBX0VVWxA8JOq4sCjgI4C6Vj7vldDQ4aCBYS/CzHHEDsNEkuEGQ
         aZ+2bsSmnMupyuu0E/VUUU0Y6xbUTjqhcyXYpg42Z38YPao0ITfuQxQAo5V8uq75Ov1I
         ZV7QI486bKS+rgsxVull2JDoI9W3GVwnGQKOSVHaC8zCjkhL25Ka214hc9DfdYUgDM9P
         GDAzBFdQ/LoPwwz1cgRJSa41jeHW4euhFrz7VcuVKG0L/WBzKoNPSiai0WEqd7w8cq6x
         SpS/bCM47OMToa/kvGhuhJZjR+AYkt12/puLjzxbw5TTfhY7piYt2h91rP0rHo0aCPu7
         c/hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QmGFcYwtnti0Kimuy1kQWFpXTGjTW9qbFTJ4jXOu9+s=;
        b=pPZtm2/c8SjCqmU+Fq/0kcjDcOKzIBKwlPaRlVgqqx76MTHELQevkGUlIa9A0uZEOy
         TsgdYW77bP+Y7rgv9PXiJB0NvH/uhs1DYQEiVbq7XHr7YrZcZi8wSbtnZ5anQiqhVxO2
         aTA+Z5kDuvx2iYuhh74xgDE4TBWlnPom/TiaiQ7lC1uSeZunwWPCmtAYAnP5ARiQP6G2
         QNv1I5rpGolGqvmRRGbU/rpCn+OckJXk4Zc0RGOBaypih7GfLmHGzBEixsmxEXAmwmu/
         jWRm+fRjVfmRS5lbPQ8zlY/eoVQwf6yMhC8BVzYC4pWC0w3+lFfvNL9Y3wtVpBl9xLBv
         fEjA==
X-Gm-Message-State: AOAM5306FzjmpSXsbyOV+PEWXfVUoi6lKLt/+PNVMugf+aJQf8E0KiYQ
        ymxzEi5lFP/gQ3pzL5B0YTarBM36Vk2zChAl
X-Google-Smtp-Source: ABdhPJxxtXUst3+N2+MgBsKDhbCzPNDWFCnjtJfwF1riqHGtEn0wO4qLW26VUsHQzUCxrddDyHgReg==
X-Received: by 2002:a17:902:a586:b029:fe:459b:2ce0 with SMTP id az6-20020a170902a586b02900fe459b2ce0mr18267310plb.40.1623075901570;
        Mon, 07 Jun 2021 07:25:01 -0700 (PDT)
Received: from localhost (185.212.56.112.16clouds.com. [185.212.56.112])
        by smtp.gmail.com with ESMTPSA id b20sm8955032pgm.30.2021.06.07.07.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 07:25:00 -0700 (PDT)
Date:   Mon, 7 Jun 2021 22:24:58 +0800
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     kernel test robot <lkp@intel.com>
Cc:     helgaas@kernel.org, corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, bhelgaas@google.com, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org,
        kbuild-all@lists.01.org
Subject: Re: [PATCH v6 1/4] PCI: Introduce pcim_alloc_irq_vectors()
Message-ID: <20210607142458.GA821146@nuc8i5>
References: <20210606070511.778487-2-zhengdejin5@gmail.com>
 <202106070313.1cUfhXdg-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202106070313.1cUfhXdg-lkp@intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jun 07, 2021 at 03:31:04AM +0800, kernel test robot wrote:
> Hi Dejin,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on pci/next]
> [also build test ERROR on wsa/i2c/for-next lwn/docs-next linus/master v5.13-rc4 next-20210604]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Dejin-Zheng/Introduce-pcim_alloc_irq_vectors/20210606-150730
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git next
> config: sparc-randconfig-c004-20210606 (attached as .config)
> compiler: sparc64-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/7b311110dce8729956f7545d1f11b2bbd60f6193
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Dejin-Zheng/Introduce-pcim_alloc_irq_vectors/20210606-150730
>         git checkout 7b311110dce8729956f7545d1f11b2bbd60f6193
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=sparc 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from net/core/rtnetlink.c:37:
>    include/linux/pci.h: In function 'pcim_alloc_irq_vectors':
> >> include/linux/pci.h:1847:7: error: implicit declaration of function 'pci_is_managed' [-Werror=implicit-function-declaration]
>     1847 |  if (!pci_is_managed(dev))
>          |       ^~~~~~~~~~~~~~
>    cc1: some warnings being treated as errors
> --

Thanks very much for Kernel test robot, I got the root cause of this build error.
I will send a new patch version for fix it.

The sparc defconfig disable PCI, so it can not found the CONFIG_PCI in pci.h,
and the pci_is_managed() function only exists in the pci.h when enable PCI.
so it will report builld this error when disable PCI.

BR,
Dejin
>    In file included from arch/sparc/lib/iomap.c:5:
>    include/linux/pci.h: In function 'pcim_alloc_irq_vectors':
> >> include/linux/pci.h:1847:7: error: implicit declaration of function 'pci_is_managed' [-Werror=implicit-function-declaration]
>     1847 |  if (!pci_is_managed(dev))
>          |       ^~~~~~~~~~~~~~
>    cc1: all warnings being treated as errors
> --
>    In file included from drivers/gpu/drm/drm_file.c:38:
>    include/linux/pci.h: In function 'pcim_alloc_irq_vectors':
> >> include/linux/pci.h:1847:7: error: implicit declaration of function 'pci_is_managed' [-Werror=implicit-function-declaration]
>     1847 |  if (!pci_is_managed(dev))
>          |       ^~~~~~~~~~~~~~
>    drivers/gpu/drm/drm_file.c: At top level:
>    drivers/gpu/drm/drm_file.c:789:6: warning: no previous prototype for 'drm_send_event_helper' [-Wmissing-prototypes]
>      789 | void drm_send_event_helper(struct drm_device *dev,
>          |      ^~~~~~~~~~~~~~~~~~~~~
>    cc1: some warnings being treated as errors
> --
>    In file included from drivers/ide/ide-proc.c:25:
>    include/linux/pci.h: In function 'pcim_alloc_irq_vectors':
> >> include/linux/pci.h:1847:7: error: implicit declaration of function 'pci_is_managed' [-Werror=implicit-function-declaration]
>     1847 |  if (!pci_is_managed(dev))
>          |       ^~~~~~~~~~~~~~
>    At top level:
>    drivers/ide/ide-proc.c:457:37: warning: 'ide_media_proc_fops' defined but not used [-Wunused-const-variable=]
>      457 | static const struct file_operations ide_media_proc_fops = {
>          |                                     ^~~~~~~~~~~~~~~~~~~
>    cc1: some warnings being treated as errors
> --
>    In file included from include/linux/ide.h:18,
>                     from drivers/ide/ide-cd_ioctl.c:13:
>    include/linux/pci.h: In function 'pcim_alloc_irq_vectors':
> >> include/linux/pci.h:1847:7: error: implicit declaration of function 'pci_is_managed' [-Werror=implicit-function-declaration]
>     1847 |  if (!pci_is_managed(dev))
>          |       ^~~~~~~~~~~~~~
>    drivers/ide/ide-cd_ioctl.c: In function 'ide_cdrom_select_speed':
>    drivers/ide/ide-cd_ioctl.c:212:6: warning: variable 'stat' set but not used [-Wunused-but-set-variable]
>      212 |  int stat;
>          |      ^~~~
>    cc1: some warnings being treated as errors
> --
>    In file included from drivers/ata/ahci.h:22,
>                     from drivers/ata/ahci_platform.c:21:
>    include/linux/pci.h: In function 'pcim_alloc_irq_vectors':
> >> include/linux/pci.h:1847:7: error: implicit declaration of function 'pci_is_managed' [-Werror=implicit-function-declaration]
>     1847 |  if (!pci_is_managed(dev))
>          |       ^~~~~~~~~~~~~~
>    In file included from drivers/ata/ahci_platform.c:21:
>    drivers/ata/ahci_platform.c: At top level:
>    drivers/ata/ahci.h:388:16: warning: initialized field overwritten [-Woverride-init]
>      388 |  .can_queue  = AHCI_MAX_CMDS,   \
>          |                ^~~~~~~~~~~~~
>    drivers/ata/ahci_platform.c:40:2: note: in expansion of macro 'AHCI_SHT'
>       40 |  AHCI_SHT(DRV_NAME),
>          |  ^~~~~~~~
>    drivers/ata/ahci.h:388:16: note: (near initialization for 'ahci_platform_sht.can_queue')
>      388 |  .can_queue  = AHCI_MAX_CMDS,   \
>          |                ^~~~~~~~~~~~~
>    drivers/ata/ahci_platform.c:40:2: note: in expansion of macro 'AHCI_SHT'
>       40 |  AHCI_SHT(DRV_NAME),
>          |  ^~~~~~~~
>    drivers/ata/ahci.h:392:17: warning: initialized field overwritten [-Woverride-init]
>      392 |  .sdev_attrs  = ahci_sdev_attrs
>          |                 ^~~~~~~~~~~~~~~
>    drivers/ata/ahci_platform.c:40:2: note: in expansion of macro 'AHCI_SHT'
>       40 |  AHCI_SHT(DRV_NAME),
>          |  ^~~~~~~~
>    drivers/ata/ahci.h:392:17: note: (near initialization for 'ahci_platform_sht.sdev_attrs')
>      392 |  .sdev_attrs  = ahci_sdev_attrs
>          |                 ^~~~~~~~~~~~~~~
>    drivers/ata/ahci_platform.c:40:2: note: in expansion of macro 'AHCI_SHT'
>       40 |  AHCI_SHT(DRV_NAME),
>          |  ^~~~~~~~
>    cc1: some warnings being treated as errors
> --
>    In file included from drivers/usb/host/xhci.c:11:
>    include/linux/pci.h: In function 'pcim_alloc_irq_vectors':
> >> include/linux/pci.h:1847:7: error: implicit declaration of function 'pci_is_managed' [-Werror=implicit-function-declaration]
>     1847 |  if (!pci_is_managed(dev))
>          |       ^~~~~~~~~~~~~~
>    drivers/usb/host/xhci.c: In function 'xhci_unmap_temp_buf':
>    drivers/usb/host/xhci.c:1349:15: warning: variable 'len' set but not used [-Wunused-but-set-variable]
>     1349 |  unsigned int len;
>          |               ^~~
>    cc1: some warnings being treated as errors
> 
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for LOCKDEP
>    Depends on DEBUG_KERNEL && LOCK_DEBUGGING_SUPPORT && (FRAME_POINTER || MIPS || PPC || S390 || MICROBLAZE || ARM || ARC || X86)
>    Selected by
>    - PROVE_LOCKING && DEBUG_KERNEL && LOCK_DEBUGGING_SUPPORT
>    - DEBUG_LOCK_ALLOC && DEBUG_KERNEL && LOCK_DEBUGGING_SUPPORT
> 
> 
> vim +/pci_is_managed +1847 include/linux/pci.h
> 
>   1827	
>   1828	/**
>   1829	 * pcim_alloc_irq_vectors - a device-managed pci_alloc_irq_vectors()
>   1830	 * @dev:		PCI device to operate on
>   1831	 * @min_vecs:		minimum number of vectors required (must be >= 1)
>   1832	 * @max_vecs:		maximum (desired) number of vectors
>   1833	 * @flags:		flags or quirks for the allocation
>   1834	 *
>   1835	 * Return the number of vectors allocated, (which might be smaller than
>   1836	 * @max_vecs) if successful, or a negative error code on error. If less
>   1837	 * than @min_vecs interrupt vectors are available for @dev the function
>   1838	 * will fail with -ENOSPC.
>   1839	 *
>   1840	 * It depends on calling pcim_enable_device() to make IRQ resources
>   1841	 * manageable.
>   1842	 */
>   1843	static inline int
>   1844	pcim_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
>   1845				unsigned int max_vecs, unsigned int flags)
>   1846	{
> > 1847		if (!pci_is_managed(dev))
>   1848			return -EINVAL;
>   1849		return pci_alloc_irq_vectors(dev, min_vecs, max_vecs, flags);
>   1850	}
>   1851	
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org


