Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 138E6E0A19
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Oct 2019 19:09:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731957AbfJVRJH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Oct 2019 13:09:07 -0400
Received: from mga03.intel.com ([134.134.136.65]:60073 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730727AbfJVRJH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 22 Oct 2019 13:09:07 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Oct 2019 10:09:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,217,1569308400"; 
   d="scan'208";a="200854750"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.143]) ([10.7.153.143])
  by orsmga003.jf.intel.com with ESMTP; 22 Oct 2019 10:09:06 -0700
Subject: Re: [PATCH i2c-next 1/2] dt-bindings: i2c: aspeed: add hardware
 timeout support
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Peter Rosin <peda@axentia.se>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Jeffery <andrew@aj.id.au>, Tao Ren <taoren@fb.com>,
        Cedric Le Goater <clg@kaod.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <20191021202414.17484-1-jae.hyun.yoo@linux.intel.com>
 <20191021202414.17484-2-jae.hyun.yoo@linux.intel.com>
 <0a629f7b-b829-c332-27d8-dc825205ff72@axentia.se>
 <7abf933b-cb18-10af-9c1b-163ec65ffae5@linux.intel.com>
 <20191022045655.GA975@kunai>
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <5cd54c07-4e97-9ed9-1427-d46a7133ee53@linux.intel.com>
Date:   Tue, 22 Oct 2019 10:09:06 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191022045655.GA975@kunai>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 10/21/2019 9:56 PM, Wolfram Sang wrote:
> 
>> Changes I submitted in this patch set is for a different purpose which
>> is very Aspeed H/W specific, and actually it's a more serious timeout
>> setting indeed. If this H/W is used in multi-master environment, it
>> could meet a H/W hang that freezes itself in slave mode and it can't
>> escape from the state. To resolve the specific case, this H/W provides
>> self-recovery feature which monitors abnormal state of SDA, SCL and its
>> H/W state machine using the timeout setting to determine the escape
>> condition.
> 
> Thanks for the summary. I just wonder on what the timeout value depends.
> Do we really need to put in DT or can we derive it e.g. from the
> compatible value in the driver?

It could be derived from the bus timeout value by computing 'divide by
x' roughly but it couldn't cover all use cases because this H/W timeout
value would depends on each environment. There are many factors that
can affect it such as bus speed, peer-master's bus driving
characteristic, average transaction period on the bus and so on thus
it may need fine adjustments through a DT setting, I think.

Thanks,

Jae
