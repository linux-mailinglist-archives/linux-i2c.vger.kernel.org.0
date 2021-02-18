Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAC8D31E978
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Feb 2021 13:09:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231372AbhBRMBT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Feb 2021 07:01:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:50066 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230352AbhBRJhS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 18 Feb 2021 04:37:18 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9E51D64D99;
        Thu, 18 Feb 2021 09:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613640994;
        bh=UnZtLNC2SE7t6sL20JzyCDF5LpgoYFQOPCU+CtVkXfo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IEfg2oarpQ9AVEjnfI0xSBr14d9NTYLzO1Mxatgys1i68NteBf8wcGZo09Ta6R9df
         KtDBFmU+VXVZxK2r1CIaxTL9P/3QjRL1oZixV/mTosBKEjpNtOZwtypWEozOagN636
         n2t89hSt/1kT7mZptqS3tHyx6zehYmQJ2zxrV1DQsEcJ0MXE8z9FXKZjpfCkdH2Ed5
         mr1BMgsFPJz+odExn1BwrgIM38+SF6LdWLl/xxylAww3+VMFhR3pzFujobDwc7CUbi
         CN9zywKrDmi5XkO9KNht8sHS2cc3t/0bDK1ig020zDFKTddPXWYACZNPQ6YRpKtuGy
         +hPj25L8zHNPQ==
Date:   Thu, 18 Feb 2021 10:36:28 +0100
From:   Robert Richter <rric@kernel.org>
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        bhelgaas@google.com, wsa@kernel.org, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org, kw@linux.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] Introduce pcim_alloc_irq_vectors()
Message-ID: <YC41HD422Mjh1IZK@rric.localdomain>
References: <20210216160249.749799-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210216160249.749799-1-zhengdejin5@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 17.02.21 00:02:45, Dejin Zheng wrote:
> Introduce pcim_alloc_irq_vectors(), a device-managed version of
> pci_alloc_irq_vectors(), In some i2c drivers, If pcim_enable_device()
> has been called before, then pci_alloc_irq_vectors() is actually a
> device-managed function. It is used as a device-managed function, So
> replace it with pcim_alloc_irq_vectors().
> 
> Changelog
> ---------
> v2 -> v3:
> 	- Add some commit comments for replace some codes in
> 	  pcim_release() by pci_free_irq_vectors().
> 	- Simplify the error handling path in i2c designware
> 	  driver.
> v1 -> v2:
> 	- Use pci_free_irq_vectors() to replace some code in
> 	  pcim_release().
> 	- Modify some commit messages.
> 
> Dejin Zheng (4):
>   PCI: Introduce pcim_alloc_irq_vectors()
>   Documentation: devres: Add pcim_alloc_irq_vectors()

This is already taken care of, see pcim_release():

        if (dev->msi_enabled)
                pci_disable_msi(dev);
        if (dev->msix_enabled)
                pci_disable_msix(dev);

Activated when used with pcim_enable_device().

This series is not required.

-Robert

>   i2c: designware: Use the correct name of device-managed function
>   i2c: thunderx: Use the correct name of device-managed function
> 
>  .../driver-api/driver-model/devres.rst        |  1 +
>  drivers/i2c/busses/i2c-designware-pcidrv.c    | 15 +++------
>  drivers/i2c/busses/i2c-thunderx-pcidrv.c      |  2 +-
>  drivers/pci/pci.c                             | 33 ++++++++++++++++---
>  include/linux/pci.h                           |  3 ++
>  5 files changed, 38 insertions(+), 16 deletions(-)
> 
> -- 
> 2.25.0
> 
