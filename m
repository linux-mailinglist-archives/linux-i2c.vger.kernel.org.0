Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65CF4321490
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Feb 2021 11:57:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230171AbhBVK46 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Feb 2021 05:56:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:33804 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230155AbhBVK4z (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Feb 2021 05:56:55 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 45FD164E04;
        Mon, 22 Feb 2021 10:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613991374;
        bh=uSVdmI9SQTwSZXaLlJZF+IlVbzuQCLdI9sABiZ1LT4M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hS4u2mjbYejeR+K2OGXcDXc7+9Tg8cQRwjWXVUTVlvpPKqv0vHQ9JhNYc2/ufIM2F
         ud8EJ3IHU1zS8bBAHR+dntl+X+XG+3JVLWDSuzxN3A8+FPeWwHk4Xe7Supun1DRC1P
         dzk8lkYNQ+HuMtTLm8v3kUJx8m7/fDoOMigi94mxIy6j6A2DY1QJL8k0hCkCrwU9wv
         5JZ0TiPcs99Jb+9C082qvRNd8wmX6+f7+Ex2OdJ80SvCGn6S639jMTpKrv/KMWUEkG
         1qKuK9mAI84zEQ7tzu2W7RSRd2i+LgEOqSh2E95K2WTEV9YXcGXQC6uB44KjM6juAh
         /hVXdmED1dWkQ==
Date:   Mon, 22 Feb 2021 11:56:08 +0100
From:   Robert Richter <rric@kernel.org>
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        bhelgaas@google.com, wsa@kernel.org, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] PCI: Introduce pcim_alloc_irq_vectors()
Message-ID: <YDONyMSHO9FDeY69@rric.localdomain>
References: <20210218150458.798347-1-zhengdejin5@gmail.com>
 <20210218150458.798347-2-zhengdejin5@gmail.com>
 <YC/NxfsQn2RKkrp8@rric.localdomain>
 <20210219164649.GA814637@nuc8i5>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210219164649.GA814637@nuc8i5>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 20.02.21 00:46:49, Dejin Zheng wrote:
> > On 18.02.21 23:04:55, Dejin Zheng wrote:

> > > +	if (!dr || !dr->enabled)
> here checks whether the pci device is enabled.

What is the purpose of this? The device "is_managed" or not.

-Robert
