Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC3CA275940
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 15:59:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726516AbgIWN73 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Sep 2020 09:59:29 -0400
Received: from mga09.intel.com ([134.134.136.24]:22474 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726460AbgIWN73 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 23 Sep 2020 09:59:29 -0400
IronPort-SDR: HSDgW3bp6augOKhIPrnwomHK7A7XxZWUW8jUGxAtXSoOd3946P1/fOVbPpG6uqmzmbziAyPWg8
 FhSxkgvxJnzw==
X-IronPort-AV: E=McAfee;i="6000,8403,9752"; a="161826177"
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; 
   d="scan'208";a="161826177"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2020 06:59:28 -0700
IronPort-SDR: 8Oy5AgqLUvn41mrOnHSUoULieLzrAnjuAay2f7s2JTlXC+LLeuNY+bsqH3+VOnac40F8u7XiWx
 I1CPmyJ3ogDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; 
   d="scan'208";a="309916738"
Received: from mylly.fi.intel.com (HELO [10.237.72.56]) ([10.237.72.56])
  by orsmga006.jf.intel.com with ESMTP; 23 Sep 2020 06:59:25 -0700
Subject: Re: [PATCH v2 0/4] i2c-hid: Save power by reducing i2c xfers with
 block reads
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Sultan Alsawaf <sultan@kerneltoast.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Aaron Ma <aaron.ma@canonical.com>,
        Pavel Balan <admin@kryma.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        HungNien Chen <hn.chen@weidahitech.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        linux-input <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        You-Sheng Yang <vicamo.yang@canonical.com>,
        Wolfram Sang <wsa@kernel.org>
References: <20200917052256.5770-1-sultan@kerneltoast.com>
 <CAHp75Vea8=WchmWVOGndgarjehv+sYQh7CNUrQYqmG8hGJCzHA@mail.gmail.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <86cbe3f2-30c9-615e-6d29-c94c98d6be53@linux.intel.com>
Date:   Wed, 23 Sep 2020 16:59:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vea8=WchmWVOGndgarjehv+sYQh7CNUrQYqmG8hGJCzHA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 9/17/20 5:02 PM, Andy Shevchenko wrote:
> On Thu, Sep 17, 2020 at 8:26 AM Sultan Alsawaf <sultan@kerneltoast.com> wrote:
>>
>> From: Sultan Alsawaf <sultan@kerneltoast.com>
>>
>> This is a fixed resubmission of "[PATCH 0/2] i2c-hid: Save power by reducing i2c
>> xfers with block reads". That original patchset did not have enough fixes for
>> the designware i2c adapter's I2C_M_RECV_LEN feature, which is documented
>> extensively in the original email thread.
>>
>> Here is the original cover letter, which still applies:
>> "I noticed on my Dell Precision 15 5540 with an i9-9880H that simply putting my
>> finger on the touchpad would increase my system's power consumption by 4W, which
>> is quite considerable. Resting my finger on the touchpad would generate roughly
>> 4000 i2c irqs per second, or roughly 20 i2c irqs per touchpad irq.
>>
>> Upon closer inspection, I noticed that the i2c-hid driver would always transfer
>> the maximum report size over i2c (which is 60 bytes for my touchpad), but all of
>> my touchpad's normal touch events are only 32 bytes long according to the length
>> byte contained in the buffer sequence.
>>
>> Therefore, I was able to save about 2W of power by passing the I2C_M_RECV_LEN
>> flag in i2c-hid, which says to look for the payload length in the first byte of
>> the transfer buffer and adjust the i2c transaction accordingly. The only problem
>> though is that my i2c controller's driver allows bytes other than the first one
>> to be used to retrieve the payload length, which is incorrect according to the
>> SMBus spec, and would break my i2c-hid change since not *all* of the reports
>> from my touchpad are conforming SMBus block reads.
>>
>> This patchset fixes the I2C_M_RECV_LEN behavior in the designware i2c driver and
>> modifies i2c-hid to use I2C_M_RECV_LEN to save quite a bit of power. Even if the
>> peripheral controlled by i2c-hid doesn't support block reads, the i2c controller
>> drivers should cope with this and proceed with the i2c transfer using the
>> original requested length."
> 
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> for I²C DesignWare patches.
> 
Also for i2c-designware

Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
