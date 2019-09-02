Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACA4DA540A
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2019 12:32:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730147AbfIBKcS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Sep 2019 06:32:18 -0400
Received: from bastet.se.axis.com ([195.60.68.11]:43002 "EHLO
        bastet.se.axis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729806AbfIBKcS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 Sep 2019 06:32:18 -0400
Received: from localhost (localhost [127.0.0.1])
        by bastet.se.axis.com (Postfix) with ESMTP id 248CF180D2;
        Mon,  2 Sep 2019 12:32:16 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
        by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id CnErj5kIuPCE; Mon,  2 Sep 2019 12:32:10 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
        by bastet.se.axis.com (Postfix) with ESMTPS id 4B19018325;
        Mon,  2 Sep 2019 12:32:10 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id EF80B1A070;
        Mon,  2 Sep 2019 12:32:09 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id E27EB1A069;
        Mon,  2 Sep 2019 12:32:09 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
        by boulder02.se.axis.com (Postfix) with ESMTP;
        Mon,  2 Sep 2019 12:32:09 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
        by seth.se.axis.com (Postfix) with ESMTP id D66F8248E;
        Mon,  2 Sep 2019 12:32:09 +0200 (CEST)
Received: from [10.88.24.4] (10.0.5.60) by XBOX02.axis.com (10.0.5.16) with
 Microsoft SMTP Server (TLS) id 15.0.1365.1; Mon, 2 Sep 2019 12:32:09 +0200
Subject: Re: [PATCH] i2c-eeprom_slave: Add support for more eeprom models
To:     Wolfram Sang <wsa@the-dreams.de>, Bjorn Ardo <bjornar@axis.com>
CC:     <linux-i2c@vger.kernel.org>
References: <1565675708-15434-1-git-send-email-bjorn.ardo@axis.com>
 <20190831132256.GG1032@ninjato>
 <6b5554ce-1d43-5f03-d030-adc234ffc56d@axis.com> <20190902095649.GA1024@kunai>
 <20190902102251.GB1024@kunai>
From:   Bjorn Ardo <bjorn.ardo@axis.com>
Message-ID: <8b73f13a-3f64-77f5-5c28-318e126b3e7e@axis.com>
Date:   Mon, 2 Sep 2019 12:32:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190902102251.GB1024@kunai>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX04.axis.com (10.0.5.18) To XBOX02.axis.com (10.0.5.16)
X-TM-AS-GCONF: 00
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 9/2/19 12:22 PM, Wolfram Sang wrote:
>> various files has been tested and works fine. One new thing which could
>> happen now is that for a 16 bit address pointer, only 8 bit get sent
>> before a repeated start switches to reading data. This can be easily
>> simulated with the 'i2ctransfer' tool from i2c-utils.  TBH, I have no
>> idea how real EEPROMs react to this situation. Our driver currently uses
>> the pointer with only 8 bits fed and the upper 8 bits being 0. This
>> could be valid. Do you have a real EEPROM to check against?
> Thinking more about it, I wouldn't bet all EERPOMs out there handle this
> case the same way. So likely, our current handling might be good enough.
>

I have a real EEPROM that I can test against, and I can probably set up 
a quick test for that specific device only. But as you say, I have no 
idea if this is representative for all EEPROM or not.


I will try to get time to fix all your comments and send in a new patch 
later this week.


/BA


