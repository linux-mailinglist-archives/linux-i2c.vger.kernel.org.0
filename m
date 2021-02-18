Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACC5E31E97A
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Feb 2021 13:09:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232224AbhBRMCG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Feb 2021 07:02:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:52238 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230239AbhBRJ4L (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 18 Feb 2021 04:56:11 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 672C164E5F;
        Thu, 18 Feb 2021 09:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613641509;
        bh=79ud9I3C1NXf24LTqgmPVqa9DlP867/mwk9GqbIsBWk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OHxCe9GbyDb2Xkc7uYS/NLXxG7VsJ7PUBkvez2yuO4q/tdddGR1riXO1FdBcJ92+y
         r4GCcyjuYNJCq+nomPFHkaZakFSMHogW2fCVnVGsOAPbHRrdOA15WpvBqdk32xpoJ1
         zhHQL5V89k+gLPNAK3ghz9Snu1KpIrYvQ+Nf0+vIrvkbkmQRNHDdjZGRXV4c4kgwv4
         6GVxc9I9vTS2nJCaCZjG46FbU+NrLuasAyiFyOjeQSvi4arOI28tdU0QgKueFp7c21
         /8gdwQtMI8WKIibpApVHQZyhu8qCz3O/9KD3YiA4ys9zzeoD2gqXKmA1hhlGtRLg8c
         9qsEQE04K6z2Q==
Date:   Thu, 18 Feb 2021 10:45:05 +0100
From:   Robert Richter <rric@kernel.org>
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     wsa+renesas@sang-engineering.com, jan.glauber@gmail.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: thunderx: Fix an issue about missing call to
 'pci_free_irq_vectors()'
Message-ID: <YC43IXSzFVD8GOrJ@rric.localdomain>
References: <20210214143734.591789-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210214143734.591789-1-zhengdejin5@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 14.02.21 22:37:34, Dejin Zheng wrote:
> Call to 'pci_free_irq_vectors()' are missing both in the error handling
> path of the probe function, and in the remove function. So add them.
> 
> Fixes: 4c21541d8da17fb ("i2c: thunderx: Replace pci_enable_msix()")
> Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
> ---
>  drivers/i2c/busses/i2c-thunderx-pcidrv.c | 9 ++++++---

FTR, I reviewed the error paths of thunder_i2c_probe_pci() (v5.11-rc1)
and all look sane to me.

-Robert
