Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5561418EFDC
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Mar 2020 07:36:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727313AbgCWGgw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Mar 2020 02:36:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:47400 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726080AbgCWGgv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 23 Mar 2020 02:36:51 -0400
Received: from localhost (unknown [171.76.96.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5E48F206F8;
        Mon, 23 Mar 2020 06:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584945411;
        bh=wwssTt1olbo6fmG524AB0JzcyASMEeLlZtrMwgjHU/o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ou5r5FMS90/kz8q4urmSRJt/TC/05HgPW6jQhytkgR4ccNCTAEEB3e8z9tXFARFFF
         ZhCQprzFP1bBh+mTme5ql2CaiXYLAlJgruDvn9CAYalF8UqbNbycZF9VUrfgQ21XPR
         tqktDk2yQN96BuT8KBUpNtAYDDXAW7H87jSWixAA=
Date:   Mon, 23 Mar 2020 12:06:46 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dmaengine: tegra-apb: Don't save/restore IRQ
 flags in interrupt handler
Message-ID: <20200323063646.GH72691@vkoul-mobl>
References: <20200319212321.3297-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200319212321.3297-1-digetx@gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 20-03-20, 00:23, Dmitry Osipenko wrote:
> The interrupt is already disabled while interrupt handler is running, and
> thus, there is no need to save/restore the IRQ flags within the spinlock.

Applied both, thanks

-- 
~Vinod
