Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A025D3021
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Oct 2019 20:22:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbfJJSWh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Oct 2019 14:22:37 -0400
Received: from mga01.intel.com ([192.55.52.88]:6552 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726551AbfJJSWh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 10 Oct 2019 14:22:37 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Oct 2019 11:22:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,281,1566889200"; 
   d="scan'208";a="184507020"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.148]) ([10.7.153.148])
  by orsmga007.jf.intel.com with ESMTP; 10 Oct 2019 11:22:36 -0700
Subject: Re: [PATCH] i2c: aspeed: fix master pending state handling
To:     Joel Stanley <joel@jms.id.au>
Cc:     Brendan Higgins <brendanhiggins@google.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Jeffery <andrew@aj.id.au>, Tao Ren <taoren@fb.com>,
        Cedric Le Goater <clg@kaod.org>, linux-i2c@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <20191009212034.20325-1-jae.hyun.yoo@linux.intel.com>
 <CACPK8XfKCSNsQJa2J2jKZJ7LGZh3zXAOfBYnp5X0w=TH4JfSpQ@mail.gmail.com>
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <8586205c-1edc-dfc2-3309-11050afbbaf8@linux.intel.com>
Date:   Thu, 10 Oct 2019 11:22:36 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XfKCSNsQJa2J2jKZJ7LGZh3zXAOfBYnp5X0w=TH4JfSpQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> Acked-by: Joel Stanley <joel@jms.id.au>

Thanks!

> While reviewing I was concerned about the locking in
> aspeed_i2c_master_xfer. It's a bit hairy, and I am not convinced it is
> without bugs.

The locking was already in there in aspeed_i2c_master_xfer but it
unlocks the protection to make a waiting for a completion. This code
is after the waiting so I added the locking to protect
'bus->master_state' variable which can be accessed from driver context
and from interrupt context.

Thanks,

Jae

