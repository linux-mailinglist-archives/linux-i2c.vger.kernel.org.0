Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADD683C8052
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jul 2021 10:34:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238653AbhGNIg4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Jul 2021 04:36:56 -0400
Received: from mga06.intel.com ([134.134.136.31]:53376 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238666AbhGNIg4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 14 Jul 2021 04:36:56 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="271420774"
X-IronPort-AV: E=Sophos;i="5.84,238,1620716400"; 
   d="scan'208";a="271420774"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2021 01:33:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,238,1620716400"; 
   d="scan'208";a="571083606"
Received: from dengjie-mobl1.ccr.corp.intel.com (HELO [10.239.154.58]) ([10.239.154.58])
  by fmsmga001.fm.intel.com with ESMTP; 14 Jul 2021 01:33:54 -0700
Subject: Re: [PATCH v14] i2c: virtio: add a virtio i2c frontend driver
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, wsa@kernel.org,
        wsa+renesas@sang-engineering.com, arnd@arndb.de,
        jasowang@redhat.com, andriy.shevchenko@linux.intel.com,
        yu1.wang@intel.com, shuo.a.liu@intel.com, conghui.chen@intel.com,
        viresh.kumar@linaro.org, stefanha@redhat.com,
        gregkh@linuxfoundation.org
References: <984ebecaf697058eb73389ed14ead9dd6d38fb53.1625796246.git.jie.deng@intel.com>
 <20210713113607-mutt-send-email-mst@kernel.org>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <16bed918-f26a-cc20-0566-54c70d453179@intel.com>
Date:   Wed, 14 Jul 2021 16:33:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210713113607-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2021/7/13 23:38, Michael S. Tsirkin wrote:

>
> I think we should tweak this such that we add multiple buffers but
> only make them visible to host after all add commands were successful.
> With split this is possible by deffering avail idx update,
> with packed by deferring update of the avail bit in the descriptor.
> I'll write a patch to add an API like that to virtio, then we
> can switch to that.
>

That's great !  Looking forward to seeing that API.


