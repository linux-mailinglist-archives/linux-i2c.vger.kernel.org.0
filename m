Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22CBB31FB3A
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Feb 2021 15:49:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbhBSOtB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Feb 2021 09:49:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:35498 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229691AbhBSOsq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 19 Feb 2021 09:48:46 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 74C9B64DA8;
        Fri, 19 Feb 2021 14:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613746085;
        bh=Kzw8IGCLSSobTf8Sdkya+7Ssi9f530ZsrCQ+iE4rq0c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=We+JJYLypeo/RFwLeiuKqd8vSG7hGAp+M6rkI6LWRHl0KSzvNYSo4p3IdqZYf3SlN
         2ufM2BVTr+Sg5tTE4xIi5LMcEaUqURy1fVoEice2gMDC7lCDVPVZyECpO+d2c+Y0Z2
         zK1AAAxA38J77G1YmuJHuPd41WRP9gYocE516xa6tv6d45Km2wLlY+Sm2zbg/18+m2
         faC/eZpXPkHRPWw4BGj6CRCEvDM5o/VKf0Y2DBqkgB3CUHT/Mdv3qAWJK1MdXawNcV
         12UCske9OcXDG68ASyox6lZyPmCp/rCy77Sn5wxvBkoDg0TkNxoGNgzYOHxVTJ1OAu
         T9Dhlq4OUQFcg==
Date:   Fri, 19 Feb 2021 15:48:00 +0100
From:   Robert Richter <rric@kernel.org>
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        bhelgaas@google.com, wsa@kernel.org, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] PCI: Introduce pcim_alloc_irq_vectors()
Message-ID: <YC/PoOOgRVHa1HIH@rric.localdomain>
References: <20210218150458.798347-1-zhengdejin5@gmail.com>
 <20210218150458.798347-2-zhengdejin5@gmail.com>
 <YC/NxfsQn2RKkrp8@rric.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YC/NxfsQn2RKkrp8@rric.localdomain>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 19.02.21 15:40:11, Robert Richter wrote:
> static inline int pcim_alloc_irq_vectors(struct pci_dev *dev,
> 	unsigned int min_vecs, unsigned int max_vecs, unsigned int flags)
> {
> 	if (!pci_is_managed(dev, min_vecs, max_vecs, flags))

Obiously this is meant here:

	if (!pci_is_managed(dev))

> 		return -EINVAL;
> 
> 	return pci_alloc_irq_vectors(dev, min_vecs, max_vecs, flags);
> }
