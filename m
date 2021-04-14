Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AC7535EA9E
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Apr 2021 04:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232130AbhDNCHj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Apr 2021 22:07:39 -0400
Received: from mga02.intel.com ([134.134.136.20]:23323 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1347590AbhDNCHa (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Apr 2021 22:07:30 -0400
IronPort-SDR: j8puOYKgpTkCzHiWsm7QNGzrwm6CxanMIEnCkAF0ZaY3yZFluVf6/IitBynzr/YMD2yNDBwyo7
 7+BQfBl+9tOA==
X-IronPort-AV: E=McAfee;i="6200,9189,9953"; a="181669549"
X-IronPort-AV: E=Sophos;i="5.82,221,1613462400"; 
   d="scan'208";a="181669549"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2021 19:07:09 -0700
IronPort-SDR: +w9i91SN6CtVYLJO9ax4un4cg75+8DVQcmUMFkRuCDAFDcXhTl5aKJfs39VWOSRweZ+DgRi8c+
 xBtZY/FF6zGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,221,1613462400"; 
   d="scan'208";a="418105391"
Received: from unknown (HELO [10.239.154.55]) ([10.239.154.55])
  by fmsmga008.fm.intel.com with ESMTP; 13 Apr 2021 19:07:01 -0700
Subject: Re: [PATCH v10] i2c: virtio: add a virtio i2c frontend driver
To:     wsa@kernel.org, wsa@the-dreams.de, mst@redhat.com,
        linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Cc:     wsa@kernel.org, jasowang@redhat.com,
        wsa+renesas@sang-engineering.com,
        andriy.shevchenko@linux.intel.com, conghui.chen@intel.com,
        arnd@arndb.de, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com, Sergey.Semin@baikalelectronics.ru,
        rppt@kernel.org, loic.poulain@linaro.org, tali.perry1@gmail.com,
        u.kleine-koenig@pengutronix.de, bjorn.andersson@linaro.org,
        yu1.wang@intel.com, shuo.a.liu@intel.com, viresh.kumar@linaro.org,
        stefanha@redhat.com, mst@redhat.com
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <e93836c3-d444-0b8c-c9df-559de0d5f27e@intel.com>
Date:   Wed, 14 Apr 2021 10:07:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi maintainers,

What's the status of this patch ? Is i2c/for-next the right tree to 
merge it ?

Thanks,

Jie


On 2021/3/23 22:19, Jie Deng wrote:
> Add an I2C bus driver for virtio para-virtualization.
>
> The controller can be emulated by the backend driver in
> any device model software by following the virtio protocol.
>
> The device specification can be found on
> https://lists.oasis-open.org/archives/virtio-comment/202101/msg00008.html.
>
> By following the specification, people may implement different
> backend drivers to emulate different controllers according to
> their needs.
>
> Co-developed-by: Conghui Chen <conghui.chen@intel.com>
> Signed-off-by: Conghui Chen <conghui.chen@intel.com>
> Signed-off-by: Jie Deng <jie.deng@intel.com>
>
