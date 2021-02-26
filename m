Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37614326757
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Feb 2021 20:20:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbhBZTUi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Feb 2021 14:20:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:43470 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229545AbhBZTUh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 26 Feb 2021 14:20:37 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D881164ED2;
        Fri, 26 Feb 2021 19:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614367197;
        bh=il9kfX1dgfbPUosjMAlkDkqi/PSY4/KlfwhENFmsHBQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HuYX/DErn3f1X23GT6zUAEXQ85/rIKobIALZjw5gHmM2VxO4DWUOFc3bKzc9mPYTY
         2L99i/S+wbP24xcM1uUjQQYlwRCRu8OSJ87waFg9SjW6lRJDTOoGze99m8QTb1prG9
         PRmiuEeNGFqGwy2sdTmYauTIEKUiOKz7dyIyAHwzJ5g1vvqNhY0qVSXJp1OIHLx5zM
         LLG8FJ0F5MGjkZ/JRoPaVK+3jgFLxFYaOG9v5mKp23mNVs3UjjIw6QN1yKPdHw3ReC
         vnAGAQpYCyhBbAsKEwB0omUd5kyC5U5tPtsh8WkEFsZWC5M8Vb3fTbaaKb/lDAb99Q
         t6p4wLqf4My8g==
Date:   Fri, 26 Feb 2021 20:19:51 +0100
From:   Robert Richter <rric@kernel.org>
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        bhelgaas@google.com, wsa@kernel.org, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/4] i2c: thunderx: Use pcim_alloc_irq_vectors() to
 allocate IRQ vectors
Message-ID: <YDlJ140UQy3hytOI@rric.localdomain>
References: <20210226155056.1068534-1-zhengdejin5@gmail.com>
 <20210226155056.1068534-5-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210226155056.1068534-5-zhengdejin5@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 26.02.21 23:50:56, Dejin Zheng wrote:
> The pcim_alloc_irq_vectors() function, an explicit device-managed version
> of pci_alloc_irq_vectors(). If pcim_enable_device() has been called
> before, then pci_alloc_irq_vectors() is actually a device-managed
> function. It is used here as a device-managed function, So replace it
> with pcim_alloc_irq_vectors().
> 
> Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>

Acked-by: Robert Richter <rric@kernel.org>
