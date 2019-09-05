Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49C26AA4B6
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2019 15:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730420AbfIENkW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Sep 2019 09:40:22 -0400
Received: from bastet.se.axis.com ([195.60.68.11]:37742 "EHLO
        bastet.se.axis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726048AbfIENkV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Sep 2019 09:40:21 -0400
Received: from localhost (localhost [127.0.0.1])
        by bastet.se.axis.com (Postfix) with ESMTP id 22BE7184C9;
        Thu,  5 Sep 2019 15:40:19 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
        by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id kwJ-AgwS63Bq; Thu,  5 Sep 2019 15:40:16 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
        by bastet.se.axis.com (Postfix) with ESMTPS id 79D83184F4;
        Thu,  5 Sep 2019 15:40:16 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 0A3521A066;
        Thu,  5 Sep 2019 15:40:16 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id F24581A061;
        Thu,  5 Sep 2019 15:40:15 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
        by boulder02.se.axis.com (Postfix) with ESMTP;
        Thu,  5 Sep 2019 15:40:15 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
        by thoth.se.axis.com (Postfix) with ESMTP id E5B3B2AF7;
        Thu,  5 Sep 2019 15:40:15 +0200 (CEST)
Received: from [10.88.24.4] (10.0.5.60) by XBOX02.axis.com (10.0.5.16) with
 Microsoft SMTP Server (TLS) id 15.0.1365.1; Thu, 5 Sep 2019 15:40:15 +0200
Subject: Re: [PATCH] i2c-eeprom_slave: Add support for more eeprom models
To:     Wolfram Sang <wsa@the-dreams.de>, Bjorn Ardo <bjornar@axis.com>
CC:     <linux-i2c@vger.kernel.org>
References: <1567497091-18270-1-git-send-email-bjorn.ardo@axis.com>
 <20190903174359.GB2171@ninjato>
 <ea04722c-81e5-1fb3-d5fc-0ee24e073025@axis.com> <20190904154814.GC1157@kunai>
 <f8629df5-c1b7-aa72-c403-9de393e87a93@axis.com> <20190905083851.GA1157@kunai>
From:   Bjorn Ardo <bjorn.ardo@axis.com>
Message-ID: <20fc32eb-e2ff-84d1-da3d-3ba6484653dc@axis.com>
Date:   Thu, 5 Sep 2019 15:40:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190905083851.GA1157@kunai>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX02.axis.com (10.0.5.16) To XBOX02.axis.com (10.0.5.16)
X-TM-AS-GCONF: 00
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 9/5/19 10:38 AM, Wolfram Sang wrote:
>>> /*
>>>    * FIXME: What to do if only 8 bits of a 16 bit address are sent?
>>>    * The <your vendor & eeprom type> sends only 0xff then. Needs verification
>>>    * with other EEPROMs, though. We currently use the 8 bit as a valid
>>>    * address.
>>>    */
>>>
>> The eeprom tested is from ST, model M24C64. Should this be added in the code
>> or in some doc folder?
> I think FIXMEs should be in the source itself.


Do you want this as a patch of its own, or as an update of the old patch?

>
>> I have another question. I'm considering adding a flag to set the virtual
>> eeprom in read-only mode on the i2c side (but writable from the sysfs side).
>> Should this be implemented as a separate i2c_device_id, or by trying to read
>> som configuration flag from devicetree?
> Hmm, not sure yet. There is the "read-only" DT binding which makes it
> easy but I see two drawbacks:
>
> 1) I am not a big fan of describing slave functionality in DT because to
> me this is more configuration than hardware description. I know mileages
> vary on this one.
>
> 2) This is a DT only solution. If we want to support read-only when
> instantiating from userspace, we'd need a seperate mechanism to
> configure that, like a sysfs-entry. This adds quite some code.
>
> I currently think a seperate id like "24c02ro" will keep things nicely
> simple. Obviously, this solution doesn't scale with number of features.
> Having a look at the original AT24 driver, I wouldn't expect other new
> features coming.
>
> Thoughts?
>

Well, the "24c02ro" version will solve our use-case and is by far the 
simplest to implement. But as you say it does not scale well with more 
features. I can however not see any practical use-cases where we would 
need anything else (like "write-only" for instance). I can make an 
implementation of that so you can see how it looks. And most likely, 
this could be combined with a DT/sysfs version to do the same without 
breaking anything in the future if that is required.


One more question, I'm thinking about trying to use the 
"request_firmware()" in the kernel in some way to be able to 
automatically populate the eeprom with content from some file (the 
equivalent of a "pre-flashed eeprom"). Do you have any thoughts about 
adding a feature like that?



/BA


