Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79C6541A79
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2019 04:46:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405857AbfFLCqq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Jun 2019 22:46:46 -0400
Received: from mga14.intel.com ([192.55.52.115]:25730 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404957AbfFLCqq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 11 Jun 2019 22:46:46 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Jun 2019 19:46:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,363,1557212400"; 
   d="scan'208";a="184092883"
Received: from haiyuewa-mobl.ccr.corp.intel.com (HELO [10.67.64.82]) ([10.67.64.82])
  by fmsmga002.fm.intel.com with ESMTP; 11 Jun 2019 19:46:43 -0700
Subject: Re: [PATCHv7 1/3] dt-bindings: i2c: document bindings for
 i2c-slave-mqueue
To:     Rob Herring <robh@kernel.org>, Eduardo Valentin <eduval@amazon.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@intel.com, brendanhiggins@google.com,
        Mark Rutland <mark.rutland@arm.com>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190605164651.15991-1-eduval@amazon.com>
 <20190605164651.15991-2-eduval@amazon.com> <20190611231425.GA29500@bogus>
From:   "Wang, Haiyue" <haiyue.wang@linux.intel.com>
Message-ID: <b3e5ac5c-baf7-bc8a-701a-4af3b8983155@linux.intel.com>
Date:   Wed, 12 Jun 2019 10:46:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190611231425.GA29500@bogus>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


ÔÚ 2019-06-12 07:14, Rob Herring Ð´µÀ:
> On Wed, Jun 05, 2019 at 09:46:49AM -0700, Eduardo Valentin wrote:
>> Document the i2c-slave-mqueue binding by adding
>> descriptor, required properties, and example.
>>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: Wolfram Sang <wsa@the-dreams.de>
>> Cc: linux-i2c@vger.kernel.org
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Eduardo Valentin <eduval@amazon.com>
>> ---
>>
>> Changes from V6 to V7:
>> - none
>>
>>   .../bindings/i2c/i2c-slave-mqueue.txt         | 34 +++++++++++++++++++
>>   1 file changed, 34 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/i2c/i2c-slave-mqueue.txt
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/i2c-slave-mqueue.txt b/Documentation/devicetree/bindings/i2c/i2c-slave-mqueue.txt
>> new file mode 100644
>> index 000000000000..eb1881a4fc0e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/i2c/i2c-slave-mqueue.txt
>> @@ -0,0 +1,34 @@
>> +===============================================
>> +Device Tree for I2C slave message queue backend
>> +===============================================
>> +
>> +Some protocols over I2C/SMBus are designed for bi-directional transferring
>> +messages by using I2C Master Write protocol. This requires that both sides
>> +of the communication have slave addresses.
> So the address 0x10 in the example below is the address of the I2C
> controller?
>
>> +
>> +This I2C slave mqueue (message queue) is used to receive and queue
Hi Rob, This is mqueue comes from, not from specs directly.
>> +messages from the remote i2c intelligent device; and it will add the target
>> +slave address (with R/W# bit is always 0) into the message at the first byte.
>> +
>> +Links
>> +----
>> +`Intelligent Platform Management Bus
>> +Communications Protocol Specification
>> +<https://www.intel.com/content/dam/www/public/us/en/documents/product-briefs/ipmp-spec-v1.0.pdf>`_
>> +
>> +`Management Component Transport Protocol (MCTP)
>> +SMBus/I2C Transport Binding Specification
>> +<https://www.dmtf.org/sites/default/files/standards/documents/DSP0237_1.1.0.pdf>`_
>> +
>> +Required Properties:
>> +- compatible		: should be "i2c-slave-mqueue"
> There is no mention of mqueue (or queue) in these specs. Where does that
> come from? Perhaps something more closely matching the protocol would be
> better name.
>
>> +- reg			: slave address
>> +
>> +Example:
>> +
>> +i2c {
> Would there be other slaves?
>
> The common binding states 'multi-master' property should be present.
>
> I need a more complete example.
>
>> +	slave_mqueue: i2c-slave-mqueue {
>> +		compatible = "i2c-slave-mqueue";
>> +		reg = <0x10>;

Hi Eduardo,

Looks like the slave reg missed the key value bit:


https://elinux.org/images/f/f6/ELCE15-WolframSang-ShinyNewI2CSlaveFramework.pdf

Example: reg = <(I2C_OWN_SLAVE_ADDRESS | 0x42)>;


>> +	};
>> +};
>> -- 
>> 2.21.0
>>
