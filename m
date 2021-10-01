Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A4E941F2B2
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Oct 2021 19:08:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231686AbhJARKE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 1 Oct 2021 13:10:04 -0400
Received: from mga14.intel.com ([192.55.52.115]:19289 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231478AbhJARKD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 1 Oct 2021 13:10:03 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10124"; a="225157583"
X-IronPort-AV: E=Sophos;i="5.85,339,1624345200"; 
   d="scan'208";a="225157583"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2021 10:06:49 -0700
X-IronPort-AV: E=Sophos;i="5.85,339,1624345200"; 
   d="scan'208";a="710036628"
Received: from yoojae-mobl.amr.corp.intel.com (HELO [10.134.77.171]) ([10.134.77.171])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2021 10:06:48 -0700
Subject: Re: [PATCH v4 0/4] i2c: aspeed: Add buffer and DMA modes support
To:     Zev Weiss <zweiss@equinix.com>
Cc:     Brendan Higgins <brendanhiggins@google.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Jeffery <andrew@aj.id.au>, Tao Ren <taoren@fb.com>,
        Cedric Le Goater <clg@kaod.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>
References: <20210224191720.7724-1-jae.hyun.yoo@linux.intel.com>
 <20210930024448.GU17315@packtop>
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <95dd9359-7dc0-00ce-2867-b35c3b4ebb2f@linux.intel.com>
Date:   Fri, 1 Oct 2021 10:06:47 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210930024448.GU17315@packtop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Zev,

On 9/29/2021 7:44 PM, Zev Weiss wrote:
> On Wed, Feb 24, 2021 at 11:17:16AM PST, Jae Hyun Yoo wrote:
>> This patch series adds buffer mode and DMA mode transfer support for the
>> Aspeed I2C driver. With this change, buffer mode and DMA mode can be
>> selectively used depend on platform configuration.
>>
> 
> Any updates on these patches?  They provide a welcome performance
> improvement for some stuff I've been doing -- for the v4 series:
> 
> Tested-by: Zev Weiss <zweiss@equinix.com>

Thanks for sharing your test result.

I'm bringing this patch set back to discussion.

Thanks,
Jae
